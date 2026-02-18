
unit geom;
interface

{
  Automatically converted by H2Pas 1.0.0 from geom.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    geom.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PboolT  = ^boolT;
Pchar  = ^char;
PcoordT  = ^coordT;
PfacetT  = ^facetT;
PFILE  = ^FILE;
Plongint  = ^longint;
PpointT  = ^pointT;
PrealT  = ^realT;
PsetT  = ^setT;
PvertexT  = ^vertexT;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{-<a                             href="qh-geom.htm#TOC"
  >--------------------------------</a><a name="dX">-</a>

  dX( p1, p2 )
  dY( p1, p2 )
  dZ( p1, p2 )

    given two indices into rows[],

    compute the difference between X, Y, or Z coordinates
 }
{ xxxxxxxxxxxxxxxx }
{#define dX( p1,p2 )  ( *( rows[p1] ) - *( rows[p2] )) }
{#define dY( p1,p2 )  ( *( rows[p1]+1 ) - *( rows[p2]+1 )) }
{#define dZ( p1,p2 )  ( *( rows[p1]+2 ) - *( rows[p2]+2 )) }
{#define dW( p1,p2 )  ( *( rows[p1]+3 ) - *( rows[p2]+3 )) }
{============= prototypes in alphabetical order, infrequent at end =======  }

procedure qh_backnormal(rows:PPrealT; numrow:longint; numcol:longint; sign:TboolT; normal:PcoordT; 
            nearzero:PboolT);cdecl;external;
procedure qh_distplane(point:PpointT; facet:PfacetT; dist:PrealT);cdecl;external;
function qh_findbest(point:PpointT; startfacet:PfacetT; bestoutside:TboolT; isnewfacets:TboolT; noupper:TboolT; 
           dist:PrealT; isoutside:PboolT; numpart:Plongint):PfacetT;cdecl;external;
function qh_findbesthorizon(ischeckmax:TboolT; point:PpointT; startfacet:PfacetT; noupper:TboolT; bestdist:PrealT; 
           numpart:Plongint):PfacetT;cdecl;external;
function qh_findbestnew(point:PpointT; startfacet:PfacetT; dist:PrealT; bestoutside:TboolT; isoutside:PboolT; 
           numpart:Plongint):PfacetT;cdecl;external;
procedure qh_gausselim(rows:PPrealT; numrow:longint; numcol:longint; sign:PboolT; nearzero:PboolT);cdecl;external;
function qh_getangle(vect1:PpointT; vect2:PpointT):TrealT;cdecl;external;
function qh_getcenter(vertices:PsetT):PpointT;cdecl;external;
function qh_getcentrum(facet:PfacetT):PpointT;cdecl;external;
function qh_getdistance(facet:PfacetT; neighbor:PfacetT; mindist:PcoordT; maxdist:PcoordT):TcoordT;cdecl;external;
procedure qh_normalize(normal:PcoordT; dim:longint; toporient:TboolT);cdecl;external;
procedure qh_normalize2(normal:PcoordT; dim:longint; toporient:TboolT; minnorm:PrealT; ismin:PboolT);cdecl;external;
function qh_projectpoint(point:PpointT; facet:PfacetT; dist:TrealT):PpointT;cdecl;external;
procedure qh_setfacetplane(newfacets:PfacetT);cdecl;external;
procedure qh_sethyperplane_det(dim:longint; rows:PPcoordT; point0:PcoordT; toporient:TboolT; normal:PcoordT; 
            offset:PrealT; nearzero:PboolT);cdecl;external;
procedure qh_sethyperplane_gauss(dim:longint; rows:PPcoordT; point0:PpointT; toporient:TboolT; normal:PcoordT; 
            offset:PcoordT; nearzero:PboolT);cdecl;external;
function qh_sharpnewfacets:TboolT;cdecl;external;
{========= infrequently used code in geom2.c ============= }
function qh_copypoints(points:PcoordT; numpoints:longint; dimension:longint):PcoordT;cdecl;external;
procedure qh_crossproduct(dim:longint; vecA:array[0..2] of TrealT; vecB:array[0..2] of TrealT; vecC:array[0..2] of TrealT);cdecl;external;
function qh_determinant(rows:PPrealT; dim:longint; nearzero:PboolT):TrealT;cdecl;external;
function qh_detjoggle(points:PpointT; numpoints:longint; dimension:longint):TrealT;cdecl;external;
procedure qh_detmaxoutside;cdecl;external;
procedure qh_detroundoff;cdecl;external;
function qh_detsimplex(apex:PpointT; points:PsetT; dim:longint; nearzero:PboolT):TrealT;cdecl;external;
function qh_distnorm(dim:longint; point:PpointT; normal:PpointT; offsetp:PrealT):TrealT;cdecl;external;
function qh_distround(dimension:longint; maxabs:TrealT; maxsumabs:TrealT):TrealT;cdecl;external;
function qh_divzero(numer:TrealT; denom:TrealT; mindenom1:TrealT; zerodiv:PboolT):TrealT;cdecl;external;
function qh_facetarea(facet:PfacetT):TrealT;cdecl;external;
function qh_facetarea_simplex(dim:longint; apex:PcoordT; vertices:PsetT; notvertex:PvertexT; toporient:TboolT; 
           normal:PcoordT; offset:PrealT):TrealT;cdecl;external;
function qh_facetcenter(vertices:PsetT):PpointT;cdecl;external;
function qh_findgooddist(point:PpointT; facetA:PfacetT; distp:PrealT; facetlist:PPfacetT):PfacetT;cdecl;external;
{ qh.newvertex_list  }function qh_furthestnewvertex(unvisited:dword; facet:PfacetT; maxdistp:PrealT):PvertexT;cdecl;external;
function qh_furthestvertex(facetA:PfacetT; facetB:PfacetT; maxdistp:PrealT; mindistp:PrealT):PvertexT;cdecl;external;
procedure qh_getarea(facetlist:PfacetT);cdecl;external;
function qh_gram_schmidt(dim:longint; rows:PPrealT):TboolT;cdecl;external;
function qh_inthresholds(normal:PcoordT; angle:PrealT):TboolT;cdecl;external;
procedure qh_joggleinput;cdecl;external;
function qh_maxabsval(normal:PrealT; dim:longint):PrealT;cdecl;external;
function qh_maxmin(points:PpointT; numpoints:longint; dimension:longint):PsetT;cdecl;external;
function qh_maxouter:TrealT;cdecl;external;
procedure qh_maxsimplex(dim:longint; maxpoints:PsetT; points:PpointT; numpoints:longint; simplex:PPsetT);cdecl;external;
function qh_minabsval(normal:PrealT; dim:longint):TrealT;cdecl;external;
function qh_mindiff(vecA:PrealT; vecB:PrealT; dim:longint):longint;cdecl;external;
function qh_orientoutside(facet:PfacetT):TboolT;cdecl;external;
procedure qh_outerinner(facet:PfacetT; outerplane:PrealT; innerplane:PrealT);cdecl;external;
function qh_pointdist(point1:PpointT; point2:PpointT; dim:longint):TcoordT;cdecl;external;
(* Const before type ignored *)
procedure qh_printmatrix(fp:PFILE; _string:Pchar; rows:PPrealT; numrow:longint; numcol:longint);cdecl;external;
(* Const before type ignored *)
procedure qh_printpoints(fp:PFILE; _string:Pchar; points:PsetT);cdecl;external;
procedure qh_projectinput;cdecl;external;
procedure qh_projectpoints(project:Pchar; n:longint; points:PrealT; numpoints:longint; dim:longint; 
            newpoints:PrealT; newdim:longint);cdecl;external;
procedure qh_rotateinput(rows:PPrealT);cdecl;external;
procedure qh_rotatepoints(points:PrealT; numpoints:longint; dim:longint; rows:PPrealT);cdecl;external;
procedure qh_scaleinput;cdecl;external;
procedure qh_scalelast(points:PcoordT; numpoints:longint; dim:longint; low:TcoordT; high:TcoordT; 
            newhigh:TcoordT);cdecl;external;
procedure qh_scalepoints(points:PpointT; numpoints:longint; dim:longint; newlows:PrealT; newhighs:PrealT);cdecl;external;
function qh_sethalfspace(dim:longint; coords:PcoordT; nextp:PPcoordT; normal:PcoordT; offset:PcoordT; 
           feasible:PcoordT):TboolT;cdecl;external;
function qh_sethalfspace_all(dim:longint; count:longint; halfspaces:PcoordT; feasible:PpointT):PcoordT;cdecl;external;
function qh_vertex_bestdist(vertices:PsetT):TcoordT;cdecl;external;
function qh_vertex_bestdist2(vertices:PsetT; vertexp:PPvertexT; vertexp2:PPvertexT):TcoordT;cdecl;external;
function qh_voronoi_center(dim:longint; points:PsetT):PpointT;cdecl;external;
{$endif}
{ qhDEFgeom  }

implementation


end.
