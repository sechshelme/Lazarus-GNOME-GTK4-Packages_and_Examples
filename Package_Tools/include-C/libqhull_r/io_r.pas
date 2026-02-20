unit io_r;

interface

uses
  fp_qhull_r, libqhull_r_, user_r;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  qhDEFio = 1;
  qh_MAXfirst = 200;
  qh_MINradius = 0.02;
  qh_GEOMepsilon = 2e-3;
  qh_WHITESPACE = ' \n\t\v\r\f';

type
  Pqh_RIDGE = ^Tqh_RIDGE;
  Tqh_RIDGE = longint;

const
  qh_RIDGEall = 0;
  qh_RIDGEinner = 1;
  qh_RIDGEouter = 2;

type
  TprintvridgeT = procedure(qh: PqhT; fp: PFILE; vertex: PvertexT; vertexA: PvertexT; centers: PsetT;
    unbounded: TboolT); cdecl;

procedure qh_dfacet(qh: PqhT; id: dword); cdecl; external libqhull_r;
procedure qh_dvertex(qh: PqhT; id: dword); cdecl; external libqhull_r;
function qh_compare_facetarea(p1: pointer; p2: pointer): longint; cdecl; external libqhull_r;
function qh_compare_facetvisit(p1: pointer; p2: pointer): longint; cdecl; external libqhull_r;
function qh_compare_nummerge(p1: pointer; p2: pointer): longint; cdecl; external libqhull_r;
procedure qh_copyfilename(qh: PqhT; filename: pchar; size: longint; source: pchar; length: longint); cdecl; external libqhull_r;
procedure qh_countfacets(qh: PqhT; facetlist: PfacetT; facets: PsetT; printall: TboolT; numfacetsp: Plongint;
  numsimplicialp: Plongint; totneighborsp: Plongint; numridgesp: Plongint; numcoplanarsp: Plongint; numnumtricoplanarsp: Plongint); cdecl; external libqhull_r;
function qh_detvnorm(qh: PqhT; vertex: PvertexT; vertexA: PvertexT; centers: PsetT; offsetp: PrealT): PpointT; cdecl; external libqhull_r;
function qh_detvridge(qh: PqhT; vertex: PvertexT): PsetT; cdecl; external libqhull_r;
function qh_detvridge3(qh: PqhT; atvertex: PvertexT; vertex: PvertexT): PsetT; cdecl; external libqhull_r;
function qh_eachvoronoi(qh: PqhT; fp: PFILE; printvridge: TprintvridgeT; atvertex: PvertexT; visitall: TboolT;
  innerouter: Tqh_RIDGE; inorder: TboolT): longint; cdecl; external libqhull_r;
function qh_eachvoronoi_all(qh: PqhT; fp: PFILE; printvridge: TprintvridgeT; isUpper: TboolT; innerouter: Tqh_RIDGE;
  inorder: TboolT): longint; cdecl; external libqhull_r;
procedure qh_facet2point(qh: PqhT; facet: PfacetT; point0: PPpointT; point1: PPpointT; mindist: PrealT); cdecl; external libqhull_r;
function qh_facetvertices(qh: PqhT; facetlist: PfacetT; facets: PsetT; allfacets: TboolT): PsetT; cdecl; external libqhull_r;
procedure qh_geomplanes(qh: PqhT; facet: PfacetT; outerplane: PrealT; innerplane: PrealT); cdecl; external libqhull_r;
procedure qh_markkeep(qh: PqhT; facetlist: PfacetT); cdecl; external libqhull_r;
function qh_markvoronoi(qh: PqhT; facetlist: PfacetT; facets: PsetT; printall: TboolT; isLowerp: PboolT;
  numcentersp: Plongint): PsetT; cdecl; external libqhull_r;
procedure qh_order_vertexneighbors(qh: PqhT; vertex: PvertexT); cdecl; external libqhull_r;
procedure qh_prepare_output(qh: PqhT); cdecl; external libqhull_r;
procedure qh_printafacet(qh: PqhT; fp: PFILE; format: Tqh_PRINT; facet: PfacetT; printall: TboolT); cdecl; external libqhull_r;
procedure qh_printbegin(qh: PqhT; fp: PFILE; format: Tqh_PRINT; facetlist: PfacetT; facets: PsetT;
  printall: TboolT); cdecl; external libqhull_r;
procedure qh_printcenter(qh: PqhT; fp: PFILE; format: Tqh_PRINT; _string: pchar; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_printcentrum(qh: PqhT; fp: PFILE; facet: PfacetT; radius: TrealT); cdecl; external libqhull_r;
procedure qh_printend(qh: PqhT; fp: PFILE; format: Tqh_PRINT; facetlist: PfacetT; facets: PsetT;
  printall: TboolT); cdecl; external libqhull_r;
procedure qh_printend4geom(qh: PqhT; fp: PFILE; facet: PfacetT; num: Plongint; printall: TboolT); cdecl; external libqhull_r;
procedure qh_printextremes(qh: PqhT; fp: PFILE; facetlist: PfacetT; facets: PsetT; printall: TboolT); cdecl; external libqhull_r;
procedure qh_printextremes_2d(qh: PqhT; fp: PFILE; facetlist: PfacetT; facets: PsetT; printall: TboolT); cdecl; external libqhull_r;
procedure qh_printextremes_d(qh: PqhT; fp: PFILE; facetlist: PfacetT; facets: PsetT; printall: TboolT); cdecl; external libqhull_r;
procedure qh_printfacet(qh: PqhT; fp: PFILE; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_printfacet2math(qh: PqhT; fp: PFILE; facet: PfacetT; format: Tqh_PRINT; notfirst: longint); cdecl; external libqhull_r;
procedure qh_printfacet2geom(qh: PqhT; fp: PFILE; facet: PfacetT; color: PrealT); cdecl; external libqhull_r;
procedure qh_printfacet2geom_points(qh: PqhT; fp: PFILE; point1: PpointT; point2: PpointT; facet: PfacetT;
  offset: TrealT; color: PrealT); cdecl; external libqhull_r;
procedure qh_printfacet3math(qh: PqhT; fp: PFILE; facet: PfacetT; format: Tqh_PRINT; notfirst: longint); cdecl; external libqhull_r;
procedure qh_printfacet3geom_nonsimplicial(qh: PqhT; fp: PFILE; facet: PfacetT; color: PrealT); cdecl; external libqhull_r;
procedure qh_printfacet3geom_points(qh: PqhT; fp: PFILE; points: PsetT; facet: PfacetT; offset: TrealT;
  color: PrealT); cdecl; external libqhull_r;
procedure qh_printfacet3geom_simplicial(qh: PqhT; fp: PFILE; facet: PfacetT; color: PrealT); cdecl; external libqhull_r;
procedure qh_printfacet3vertex(qh: PqhT; fp: PFILE; facet: PfacetT; format: Tqh_PRINT); cdecl; external libqhull_r;
procedure qh_printfacet4geom_nonsimplicial(qh: PqhT; fp: PFILE; facet: PfacetT; color: PrealT); cdecl; external libqhull_r;
procedure qh_printfacet4geom_simplicial(qh: PqhT; fp: PFILE; facet: PfacetT; color: PrealT); cdecl; external libqhull_r;
procedure qh_printfacetNvertex_nonsimplicial(qh: PqhT; fp: PFILE; facet: PfacetT; id: longint; format: Tqh_PRINT); cdecl; external libqhull_r;
procedure qh_printfacetNvertex_simplicial(qh: PqhT; fp: PFILE; facet: PfacetT; format: Tqh_PRINT); cdecl; external libqhull_r;
procedure qh_printfacetheader(qh: PqhT; fp: PFILE; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_printfacetridges(qh: PqhT; fp: PFILE; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_printfacets(qh: PqhT; fp: PFILE; format: Tqh_PRINT; facetlist: PfacetT; facets: PsetT;
  printall: TboolT); cdecl; external libqhull_r;
procedure qh_printhyperplaneintersection(qh: PqhT; fp: PFILE; facet1: PfacetT; facet2: PfacetT; vertices: PsetT;
  color: PrealT); cdecl; external libqhull_r;
procedure qh_printline3geom(qh: PqhT; fp: PFILE; pointA: PpointT; pointB: PpointT; color: PrealT); cdecl; external libqhull_r;
procedure qh_printneighborhood(qh: PqhT; fp: PFILE; format: Tqh_PRINT; facetA: PfacetT; facetB: PfacetT;
  printall: TboolT); cdecl; external libqhull_r;
procedure qh_printpoint(qh: PqhT; fp: PFILE; _string: pchar; point: PpointT); cdecl; external libqhull_r;
procedure qh_printpointid(qh: PqhT; fp: PFILE; _string: pchar; dim: longint; point: PpointT;
  id: longint); cdecl; external libqhull_r;
procedure qh_printpoint3(qh: PqhT; fp: PFILE; point: PpointT); cdecl; external libqhull_r;
procedure qh_printpoints_out(qh: PqhT; fp: PFILE; facetlist: PfacetT; facets: PsetT; printall: TboolT); cdecl; external libqhull_r;
procedure qh_printpointvect(qh: PqhT; fp: PFILE; point: PpointT; normal: PcoordT; center: PpointT;
  radius: TrealT; color: PrealT); cdecl; external libqhull_r;
procedure qh_printpointvect2(qh: PqhT; fp: PFILE; point: PpointT; normal: PcoordT; center: PpointT;
  radius: TrealT); cdecl; external libqhull_r;
procedure qh_printridge(qh: PqhT; fp: PFILE; ridge: PridgeT); cdecl; external libqhull_r;
procedure qh_printspheres(qh: PqhT; fp: PFILE; vertices: PsetT; radius: TrealT); cdecl; external libqhull_r;
procedure qh_printvdiagram(qh: PqhT; fp: PFILE; format: Tqh_PRINT; facetlist: PfacetT; facets: PsetT;
  printall: TboolT); cdecl; external libqhull_r;
function qh_printvdiagram2(qh: PqhT; fp: PFILE; printvridge: TprintvridgeT; vertices: PsetT; innerouter: Tqh_RIDGE;
  inorder: TboolT): longint; cdecl; external libqhull_r;
procedure qh_printvertex(qh: PqhT; fp: PFILE; vertex: PvertexT); cdecl; external libqhull_r;
procedure qh_printvertexlist(qh: PqhT; fp: PFILE; _string: pchar; facetlist: PfacetT; facets: PsetT;
  printall: TboolT); cdecl; external libqhull_r;
procedure qh_printvertices(qh: PqhT; fp: PFILE; _string: pchar; vertices: PsetT); cdecl; external libqhull_r;
procedure qh_printvneighbors(qh: PqhT; fp: PFILE; facetlist: PfacetT; facets: PsetT; printall: TboolT); cdecl; external libqhull_r;
procedure qh_printvoronoi(qh: PqhT; fp: PFILE; format: Tqh_PRINT; facetlist: PfacetT; facets: PsetT;
  printall: TboolT); cdecl; external libqhull_r;
procedure qh_printvnorm(qh: PqhT; fp: PFILE; vertex: PvertexT; vertexA: PvertexT; centers: PsetT;
  unbounded: TboolT); cdecl; external libqhull_r;
procedure qh_printvridge(qh: PqhT; fp: PFILE; vertex: PvertexT; vertexA: PvertexT; centers: PsetT;
  unbounded: TboolT); cdecl; external libqhull_r;
procedure qh_produce_output(qh: PqhT); cdecl; external libqhull_r;
procedure qh_produce_output2(qh: PqhT); cdecl; external libqhull_r;
procedure qh_projectdim3(qh: PqhT; source: PpointT; destination: PpointT); cdecl; external libqhull_r;
function qh_readfeasible(qh: PqhT; dim: longint; curline: pchar): longint; cdecl; external libqhull_r;
function qh_readpoints(qh: PqhT; numpoints: Plongint; dimension: Plongint; ismalloc: PboolT): PcoordT; cdecl; external libqhull_r;
procedure qh_setfeasible(qh: PqhT; dim: longint); cdecl; external libqhull_r;
function qh_skipfacet(qh: PqhT; facet: PfacetT): TboolT; cdecl; external libqhull_r;
function qh_skipfilename(qh: PqhT; filename: pchar): pchar; cdecl; external libqhull_r;

// === Konventiert am: 19-2-26 17:34:27 ===


implementation



end.
