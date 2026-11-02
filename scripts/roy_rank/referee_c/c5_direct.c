// Referee C: direct search for rank-3 failures over V(c,c').
// Normal form: any rank-3 matrix has 3 rows that are a K(T)-basis; in that basis those rows are e1,e2,e3,
// columns are y in V^3, and every other row is xi in K(T)^3 with xi.y in V.
// For xi = (r1,r2,r3), r_i in R = {0} u {c0 * T^k * f : |k|<=8, f in F}:
//   n(xi) = dim{ y in V^3 : xi.y in V } = 15 - rank(xi) of the map V^3 -> K/V (coefficients mod p, series truncated).
// d=4 needs one xi with n>=13; d=5 two xi with joint n>=8; d=6 three xi with joint n>=7.
// usage: c5_direct alpha3 beta3 cp [ngrid=3] [seconds=300] [gstop]   (v3 = alpha3 T^4 + beta3 T^3, v4 = T^-4 + cp T^-3)
// ngrid: number of coefficients tried for the 2nd and 3rd entries of the second xi, from the list 1, -1, 2, a or 3, b or 5.
// gstop: stop after this many first xi (added for reproducing incomplete runs; the time limit made those runs machine-dependent).
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
typedef uint64_t u64;
#define P 2147483647ULL
#define LO (-20)
#define HI 44
#define W (HI-LO+1)
static u64 pw(u64 a,u64 e){u64 r=1;a%=P;while(e){if(e&1)r=r*a%P;a=a*a%P;e>>=1;}return r;}
static u64 inv(u64 a){return pw(a,P-2);}
static u64 md(long long a){long long r=a%(long long)P;if(r<0)r+=P;return r;}
#define MAXR 400
typedef struct {int k; int f; u64 ser[W]; u64 B[5][W]; u64 U[5][5];} R;
static R rs[MAXR]; static int nr=0;
static u64 vb[5][W];
static int nz_cols[W]; static int ncols=0;
static int drop3, drop4;
static void proj(u64*x,u64*u){ // reduce mod V, in place; u gets V-coordinates in the basis 1,T,1/T,v3,v4
  u[0]=x[0-LO];u[1]=x[1-LO];u[2]=x[-1-LO];u[3]=0;u[4]=0;
  x[0-LO]=0;x[1-LO]=0;x[-1-LO]=0;
  // v3: pivot at highest exponent
  int e=drop3; u64 piv=vb[3][e-LO]; if(x[e-LO]){u64 f=x[e-LO]*inv(piv)%P; u[3]=f; for(int i=0;i<W;i++)x[i]=(x[i]+P-f*vb[3][i]%P)%P;}
  e=-4; piv=vb[4][e-LO]; if(x[e-LO]){u64 f=x[e-LO]*inv(piv)%P; u[4]=f; for(int i=0;i<W;i++)x[i]=(x[i]+P-f*vb[4][i]%P)%P;}
}
static void mulser(const u64*a,const u64*b,u64*o){memset(o,0,sizeof(u64)*W);
 for(int i=0;i<W;i++)if(a[i])for(int j=0;j<W;j++)if(b[j]){int e=(i+LO)+(j+LO);if(e<LO||e>HI)continue;o[e-LO]=(o[e-LO]+a[i]*b[j])%P;}}
static int rankm(u64 (*m)[W],int rows,int limit){ // destroys m; early exit when rank>limit
  int rk=0;
  for(int c=0;c<W&&rk<rows;c++){int piv=-1;for(int i=rk;i<rows;i++)if(m[i][c]){piv=i;break;}
    if(piv<0)continue; if(piv!=rk){u64 t[W];memcpy(t,m[piv],sizeof t);memcpy(m[piv],m[rk],sizeof t);memcpy(m[rk],t,sizeof t);}
    u64 iv=inv(m[rk][c]);
    for(int i=rk+1;i<rows;i++)if(m[i][c]){u64 f=m[i][c]*iv%P;for(int j=c;j<W;j++)if(m[rk][j])m[i][j]=(m[i][j]+P-f*m[rk][j]%P)%P;}
    rk++; if(rk>limit)return rk;}
  return rk;}
static u64 M[45][W];
static void addr(int row,int r,u64 coef){for(int e=0;e<5;e++)for(int j=0;j<W;j++)M[row+e][j]=rs[r].B[e][j]*coef%P;}
typedef struct{int a,b,c;}T3;
int main(int argc,char**argv){
  long long al=atoll(argv[1]),be=atoll(argv[2]),cp=atoll(argv[3]); int ngrid=argc>4?atoi(argv[4]):3; int tlimit=argc>5?atoi(argv[5]):300; int gstop=argc>6?atoi(argv[6]):0; long t0=time(NULL); int done=0; int d4=0;
  u64 A3=md(al),B3=md(be),C4=md(cp);
  memset(vb,0,sizeof vb);
  vb[0][0-LO]=1;vb[1][1-LO]=1;vb[2][-1-LO]=1;
  vb[3][4-LO]=A3;vb[3][3-LO]=B3;vb[4][-4-LO]=1;vb[4][-3-LO]=C4;
  drop3=A3?4:3;
  // factors: 1, (1+aT), 1/(1+aT), (1+bT), 1/(1+bT) where a = alpha3/beta3 (if beta3!=0), b = cp
  u64 aa=B3?A3*inv(B3)%P:0, bb=C4;
  u64 facs[5][W];memset(facs,0,sizeof facs);
  facs[0][0-LO]=1;
  facs[1][0-LO]=1;facs[1][1-LO]=aa;
  {u64 t=1;for(int e=0;e<=HI;e++){facs[2][e-LO]=t;t=t*(P-aa)%P;}}
  facs[3][0-LO]=1;facs[3][1-LO]=bb;
  {u64 t=1;for(int e=0;e<=HI;e++){facs[4][e-LO]=t;t=t*(P-bb)%P;}}
  // r = 0 is index 0
  memset(&rs[0],0,sizeof(R));rs[0].k=0;rs[0].f=-1;nr=1;
  int nf=(aa||bb)?5:1;
  for(int f=0;f<nf;f++){
    if(f>0&&f<=2&&!aa)continue; if(f>=3&&!bb)continue;
    for(int k=-8;k<=8;k++){
      R*r=&rs[nr++];r->k=k;r->f=f;memset(r->ser,0,sizeof r->ser);
      for(int e=LO;e<=HI;e++){int s=e-k; if(s>=LO&&s<=HI)r->ser[e-LO]=facs[f][s-LO];}
      for(int e=0;e<5;e++){mulser(r->ser,vb[e],r->B[e]);
        proj(r->B[e],r->U[e]);}
    }
  }
  fprintf(stderr,"|R|=%d a=%llu b=%llu\n",nr,(unsigned long long)aa,(unsigned long long)bb);

  // stage 1: single xi, unordered triples, support >= 2 (support-1 rows are K-parallel to a basis row:
  // by (P)-type bound at most 2 columns see both rows, so the ratio on that pair is <=1 and the row cannot occur)
  int cap=4000000; T3*good=malloc(sizeof(T3)*cap); int ng=0; long hist[16];memset(hist,0,sizeof hist);
  for(int i=0;i<nr;i++)for(int j=i;j<nr;j++)for(int k=j;k<nr;k++){
    int id[3]={i,j,k};int isconst=1,sup=0;
    for(int q=0;q<3;q++){int x=id[q]; if(x==0)continue; sup++; if(!(rs[x].k==0&&rs[x].f==0))isconst=0;}
    if(isconst)continue;
    memset(M,0,sizeof(u64)*15*W);
    addr(0,i,1);addr(5,j,1);addr(10,k,1);
    int rk=rankm(M,15,7);
    if(rk<=2){d4++; if(d4<=20)printf("d4cand rank %d: (%d,%d)(%d,%d)(%d,%d)\n",rk,rs[i].k,rs[i].f,rs[j].k,rs[j].f,rs[k].k,rs[k].f);}
    if(rk<=7&&sup>=2){hist[rk]++; if(ng<cap){good[ng].a=i;good[ng].b=j;good[ng].c=k;ng++;}}
  }
  printf("single xi, support>=2, n>=8, unordered: %d; by rank:",ng);
  for(int i=0;i<=7;i++)printf(" r%d:%ld",i,hist[i]); printf("\nd=4 pattern (rank<=2, any support, nonconstant): %d\n",d4);fflush(stdout);
  // random Z for blow-up
  static u64 Z[5][8][5]; srand(12345);
  for(int e=0;e<5;e++)for(int r=0;r<8;r++)for(int c=0;c<5;c++)Z[e][r][c]=(((u64)rand()<<16)^rand())%P;
  u64 grid[5]={1,P-1,2,aa?aa:3,bb?bb:5}; int ngr=ngrid;
  long tested=0,found=0,semist=0;
  int perms[6][3]={{0,1,2},{0,2,1},{1,0,2},{1,2,0},{2,0,1},{2,1,0}};
  for(int g=0;g<ng;g++){
    int A[3]={good[g].a,good[g].b,good[g].c};
    // kernel of xi on V^3
    static u64 K[15][15+W]; 
    for(int e=0;e<15;e++){memset(K[e],0,sizeof K[e]);int r=A[e/5];memcpy(K[e],rs[r].B[e%5],sizeof(u64)*W);K[e][W+e]=1;}
    int rk=0;
    for(int c=0;c<W&&rk<15;c++){int piv=-1;for(int i=rk;i<15;i++)if(K[i][c]){piv=i;break;}
      if(piv<0)continue; if(piv!=rk){u64 t[15+W];memcpy(t,K[piv],sizeof t);memcpy(K[piv],K[rk],sizeof t);memcpy(K[rk],t,sizeof t);}
      u64 iv=inv(K[rk][c]);
      for(int i=rk+1;i<15;i++)if(K[i][c]){u64 f=K[i][c]*iv%P;for(int j=c;j<15+W;j++)if(K[rk][j])K[i][j]=(K[i][j]+P-f*K[rk][j]%P)%P;}
      rk++;}
    int dk=15-rk; // kernel vectors are K[rk..14][W..W+14]
    // precompute P[cp][r][dk rows][W] lazily: store for all r
    static u64 *Pre=NULL; if(!Pre)Pre=malloc(sizeof(u64)*3*MAXR*15*W);
    #define PRE(cp,r,i,j) Pre[(((cp)*MAXR+(r))*15+(i))*W+(j)]
    for(int cp=0;cp<3;cp++)for(int r=0;r<nr;r++)for(int i=0;i<dk;i++){u64*yy=&K[rk+i][W+cp*5];
      for(int j=0;j<W;j++){u64 acc=0;for(int e=0;e<5;e++)if(yy[e]&&rs[r].B[e][j])acc=(acc+yy[e]*rs[r].B[e][j])%P;PRE(cp,r,i,j)=acc;}}
    for(int h=0;h<ng;h++){
      int Bx[3]={good[h].a,good[h].b,good[h].c};
      for(int pm=0;pm<6;pm++){
        int bp[3]={Bx[perms[pm][0]],Bx[perms[pm][1]],Bx[perms[pm][2]]};
        int dup=0;for(int q=0;q<pm;q++){if(Bx[perms[q][0]]==bp[0]&&Bx[perms[q][1]]==bp[1]&&Bx[perms[q][2]]==bp[2])dup=1;} if(dup)continue;
        for(int g2=0;g2<ngr;g2++)for(int g3=0;g3<ngr;g3++){
          // coefficient 1 on first nonzero comp
          if(bp[1]==0&&g2>0)continue; if(bp[2]==0&&g3>0)continue;
          static u64 J[15][W];
          for(int i=0;i<dk;i++)for(int j=0;j<W;j++){J[i][j]=(PRE(0,bp[0],i,j)+grid[g2]*PRE(1,bp[1],i,j)%P+grid[g3]*PRE(2,bp[2],i,j)%P)%P;}
          int lim=dk-8; tested++;
          int r2=0;
          for(int c=0;c<W&&r2<dk;c++){int piv=-1;for(int i=r2;i<dk;i++)if(J[i][c]){piv=i;break;}
            if(piv<0)continue; if(piv!=r2){u64 t[W];memcpy(t,J[piv],sizeof t);memcpy(J[piv],J[r2],sizeof t);memcpy(J[r2],t,sizeof t);}
            u64 iv=inv(J[r2][c]);
            for(int i=r2+1;i<dk;i++)if(J[i][c]){u64 f=J[i][c]*iv%P;for(int j=c;j<W;j++)if(J[r2][j])J[i][j]=(J[i][j]+P-f*J[r2][j]%P)%P;}
            r2++; if(r2>lim)break;}
          if(r2>lim)continue;
          found++;
          // joint kernel: solve J y=0 on dk-space; recompute with identity tracking
          static u64 JJ[15][W+15];
          for(int i=0;i<dk;i++){memset(JJ[i],0,sizeof JJ[i]);for(int j=0;j<W;j++)JJ[i][j]=(PRE(0,bp[0],i,j)+grid[g2]*PRE(1,bp[1],i,j)%P+grid[g3]*PRE(2,bp[2],i,j)%P)%P;JJ[i][W+i]=1;}
          int r3=0;
          for(int c=0;c<W&&r3<dk;c++){int piv=-1;for(int i=r3;i<dk;i++)if(JJ[i][c]){piv=i;break;}
            if(piv<0)continue; if(piv!=r3){u64 t[W+15];memcpy(t,JJ[piv],sizeof t);memcpy(JJ[piv],JJ[r3],sizeof t);memcpy(JJ[r3],t,sizeof t);}
            u64 iv=inv(JJ[r3][c]);
            for(int i=r3+1;i<dk;i++)if(JJ[i][c]){u64 f=JJ[i][c]*iv%P;for(int j=c;j<W+15;j++)if(JJ[r3][j])JJ[i][j]=(JJ[i][j]+P-f*JJ[r3][j]%P)%P;}
            r3++;}
          int dj=dk-r3; // joint kernel dimension >=8
          // 8 columns: first 8, or random combos if dj>8
          u64 Y[8][15];
          for(int c=0;c<8;c++){memset(Y[c],0,sizeof Y[c]);
            for(int t=0;t<dj;t++){u64 cf=(dj==8)?(t==c):(((u64)rand()<<16)^rand())%P; if(!cf)continue;
              u64*co=&JJ[r3+t][W];
              for(int i=0;i<dk;i++)if(co[i])for(int q=0;q<15;q++)if(K[rk+i][W+q])Y[c][q]=(Y[c][q]+cf*co[i]%P*K[rk+i][W+q])%P;}}
          // M_e[row][col]
          u64 Me[5][5][8];memset(Me,0,sizeof Me);
          for(int c=0;c<8;c++){
            for(int cp=0;cp<3;cp++)for(int e=0;e<5;e++)Me[e][cp][c]=Y[c][cp*5+e];
            for(int cp=0;cp<3;cp++)for(int e=0;e<5;e++){u64 yy=Y[c][cp*5+e]; if(!yy)continue;
              for(int v=0;v<5;v++){Me[v][3][c]=(Me[v][3][c]+yy*rs[A[cp]].U[e][v])%P;
                u64 cf=cp==0?1:(cp==1?grid[g2]:grid[g3]);
                Me[v][4][c]=(Me[v][4][c]+yy*cf%P*rs[bp[cp]].U[e][v])%P;}}}
          static u64 BL[40][40];memset(BL,0,sizeof BL);
          for(int e=0;e<5;e++)for(int i=0;i<5;i++)for(int j=0;j<8;j++){u64 v=Me[e][i][j];if(!v)continue;
            for(int r=0;r<8;r++)for(int s=0;s<5;s++){BL[i*8+r][j*5+s]=(BL[i*8+r][j*5+s]+v*Z[e][r][s])%P;}}
          int full=1;
          for(int c=0;c<40;c++){int piv=-1;for(int i=c;i<40;i++)if(BL[i][c]){piv=i;break;}
            if(piv<0){full=0;break;}
            if(piv!=c){u64 t[40];memcpy(t,BL[piv],sizeof t);memcpy(BL[piv],BL[c],sizeof t);memcpy(BL[c],t,sizeof t);}
            u64 iv=inv(BL[c][c]);
            for(int i=c+1;i<40;i++)if(BL[i][c]){u64 f=BL[i][c]*iv%P;for(int j=c;j<40;j++)if(BL[c][j])BL[i][j]=(BL[i][j]+P-f*BL[c][j]%P)%P;}}
          if(full){semist++;
            if(semist<=12)printf("SEMISTABLE 5x8 rank<=3: xi=(%d,%d)(%d,%d)(%d,%d) xi'=(%d,%d)(%d,%d)(%d,%d) coef %llu %llu kerdim %d\n",rs[A[0]].k,rs[A[0]].f,rs[A[1]].k,rs[A[1]].f,rs[A[2]].k,rs[A[2]].f,rs[bp[0]].k,rs[bp[0]].f,rs[bp[1]].k,rs[bp[1]].f,rs[bp[2]].k,rs[bp[2]].f,(unsigned long long)grid[g2],(unsigned long long)grid[g3],dj);
            fflush(stdout);}
        }
      }
    }
    if(g%50==0){fprintf(stderr,"g=%d/%d tested=%ld joint_n>=8=%ld semistable=%ld\n",g,ng,tested,found,semist);}
    done=g+1;
    if(gstop&&done>=gstop){printf("GSTOP at g=%d/%d\n",g,ng);break;}
    if(time(NULL)-t0>tlimit){printf("TIME LIMIT at g=%d/%d\n",g,ng);break;}
  }
  printf("first xi processed %d/%d; pairs tested %ld, joint n>=8: %ld, semistable by blow-up k=1: %ld\n",done,ng,tested,found,semist);
  return 0;
}
