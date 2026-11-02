#!/usr/bin/env python3
"""One instance: encode, run a solver with a timeout, decode, log a JSONL record, realise and verify SAT models."""
import json, os, random, subprocess, sys, tempfile, time
from encode import Enc
HERE = os.path.dirname(os.path.abspath(__file__))
SPACES = {"S1": [-1, 0, 1], "S2": [-2, -1, 0, 1, 2], "S4": [-4, -1, 0, 1, 4], "S0": [-1, 0, 1],
          "S4p2": [-4, -2, -1, 0, 1, 2, 4], "S4p3": [-4, -3, -1, 0, 1, 3, 4], "S2x3": [-6, -3, 0, 3, 6]}

def run_solver(solver, path, tlim, proof=None, seed=None):
    if solver == "kissat":
        cmd = ["kissat", "-q", "--time=%d" % tlim, path]
        if proof: cmd = ["kissat", "-q", "--time=%d" % tlim, path, proof]
        if seed is not None: cmd.insert(1, "--seed=%d" % seed)
    else:
        cmd = ["cadical", "-q", "-t", str(tlim), path]
        if proof: cmd = ["cadical", "-q", "-t", str(tlim), path, proof]
    t0 = time.time()
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=tlim + 30)
    except subprocess.TimeoutExpired:
        return "timeout", time.time() - t0, None
    dt = time.time() - t0
    if p.returncode == 20: return "UNSAT", dt, None
    if p.returncode == 10:
        assign = {}
        for line in p.stdout.splitlines():
            if line.startswith("v"):
                for tok in line[1:].split():
                    v = int(tok)
                    if v: assign[abs(v)] = v > 0
        return "SAT", dt, assign
    return "timeout", dt, None

def job(args):
    spec = dict(args)
    tag = spec.pop("tag", "")
    log = spec.pop("log")
    solver = spec.pop("solver", "kissat")
    tlim = spec.pop("timeout", 300)
    space = spec.pop("space")
    verify_models = spec.pop("verify", True)
    proof = spec.pop("proof", None)
    extra = spec.pop("extra_clauses", None)
    seed = spec.pop("seed", None)
    t0 = time.time()
    e = Enc(SPACES[space], spec.pop("n"), spec.pop("d"), **spec)
    if extra:
        for c in extra(e): e.c.add(*c)
    enc_t = time.time() - t0
    fd, path = tempfile.mkstemp(suffix=".cnf", dir=args.get("tmpdir"))
    os.close(fd)
    e.c.write(path)
    res, dt, assign = run_solver(solver, path, tlim, proof, seed)
    os.unlink(path)
    rec = {"tag": tag, "space": space, "rank": e.n, "layout": e.layout, "window": e.w, "d": e.d, "Nr": e.Nr, "Nc": e.Nc,
           "families": sorted(e.families) if e.families else None, "xmode": e.xmode, "Sx": sorted(e.Sx), "dcap": e.dcap, "lcap": e.lcap, "solver": solver, "timeout": tlim, "result": res,
           "seconds": round(dt, 2), "encode_seconds": round(enc_t, 2),
           "vars": e.c.nv, "clauses": len(e.c.cl), "Ws": e.Wcount}
    if res == "SAT" and verify_models:
        model = e.decode(assign)
        rec["model"] = summarize(model)
        rec["verified"] = verify_model(model, tag, e)
    with open(log, "a") as f:
        f.write(json.dumps(rec) + "\n")
    return rec

def summarize(model):
    return {"rows": [(r["w"], r["mass"], r["gdim"], r.get("edim", 0)) for r in model["rows"] if r["gdim"]],
            "cols": [(q["w"], q["mass"], q["fdim"], q.get("hdim", model["n"])) for q in model["cols"] if q["fdim"] < model["n"]]}

def verify_model(model, tag, e, tries=60):
    from realise import to_matrix
    from verify_exact import verify
    rnd = random.Random(99)
    last = None
    for t in range(tries):
        m = to_matrix(model, rnd)
        if m is None:
            continue
        try:
            v = verify(m)
        except Exception as ex:
            last = {"error": str(ex)[:200]}
            continue
        last = v
        if v.get("genuine_failure"):
            fn = os.path.join(os.getcwd(), "models", f"{tag or 'model'}_{e.n}_{e.d}_{e.w}_{abs(hash(json.dumps(summarize(model)))) % 10**6}.json")
            os.makedirs(os.path.dirname(fn), exist_ok=True)
            json.dump({"matrix": m, "abstract": model}, open(fn, "w"))
            return {"genuine": True, "rank": v["rank"], "v1": v.get("v1"), "v2": v.get("v2_certificate"), "file": os.path.basename(fn), "dl": [m["d"], m["l"]]}
    return {"genuine": False, "last": {k: v2 for k, v2 in (last or {}).items() if k != "v1_witness"}, "reason": "no realisation passed"}
