// Site links in the page header. plasTeX's page layouts and the dependency graph template
// have no slot for them, so they are added here; the pages work without this script.
(function () {
  var header = document.querySelector("body > header");
  if (!header) return;

  // The landing page's header carries only the contents toggle: give it the title too.
  if (!header.querySelector("#doc_title")) {
    var title = document.querySelector(".titlepage h1");
    var h1 = document.createElement("h1");
    var home = document.createElement("a");
    h1.id = "doc_title";
    home.href = "index.html";
    home.textContent = title ? title.textContent.trim() : document.title;
    h1.appendChild(home);
    header.appendChild(h1);
  }

  var links = [
    ["dep_graph_document.html", "Dependency graph", "Graph"],
    ["blueprint.pdf", "PDF", "PDF"],
    ["https://github.com/carlok/diaz-modulus-lean", "GitHub", "GitHub"]
  ];
  var nav = document.createElement("nav");
  nav.className = "site-links";
  nav.setAttribute("aria-label", "Site");
  links.forEach(function (link) {
    var a = document.createElement("a");
    var full = document.createElement("span");
    var short = document.createElement("span");
    a.href = link[0];
    full.className = "long";
    full.textContent = link[1];
    short.className = "short";
    short.textContent = link[2];
    a.appendChild(full);
    a.appendChild(short);
    nav.appendChild(a);
  });
  header.appendChild(nav);
})();
