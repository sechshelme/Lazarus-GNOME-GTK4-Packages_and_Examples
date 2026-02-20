unit poly_r;

interface

uses
  fp_qhull_r, libqhull_r_, user_r;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  qhDEFpoly = 1;
  qh_ALGORITHMfault = 0;
  qh_DATAfault = 1;

const
  qh_DUPLICATEridge = PfacetT(1);
  qh_MERGEridge = PfacetT(2);

procedure qh_appendfacet(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_appendvertex(qh: PqhT; vertex: PvertexT); cdecl; external libqhull_r;
procedure qh_attachnewfacets(qh: PqhT); cdecl; external libqhull_r;
function qh_checkflipped(qh: PqhT; facet: PfacetT; dist: PrealT; allerror: TboolT): TboolT; cdecl; external libqhull_r;
procedure qh_delfacet(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_deletevisible(qh: PqhT); cdecl; external libqhull_r;
function qh_facetintersect(qh: PqhT; facetA: PfacetT; facetB: PfacetT; skipAp: Plongint; skipBp: Plongint;
  extra: longint): PsetT; cdecl; external libqhull_r;
function qh_gethash(qh: PqhT; hashsize: longint; set_: PsetT; size: longint; firstindex: longint;
  skipelem: pointer): longint; cdecl; external libqhull_r;
function qh_getreplacement(qh: PqhT; visible: PfacetT): PfacetT; cdecl; external libqhull_r;
function qh_makenewfacet(qh: PqhT; vertices: PsetT; toporient: TboolT; facet: PfacetT): PfacetT; cdecl; external libqhull_r;
procedure qh_makenewplanes(qh: PqhT); cdecl; external libqhull_r;
function qh_makenew_nonsimplicial(qh: PqhT; visible: PfacetT; apex: PvertexT; numnew: Plongint): PfacetT; cdecl; external libqhull_r;
function qh_makenew_simplicial(qh: PqhT; visible: PfacetT; apex: PvertexT; numnew: Plongint): PfacetT; cdecl; external libqhull_r;
procedure qh_matchneighbor(qh: PqhT; newfacet: PfacetT; newskip: longint; hashsize: longint; hashcount: Plongint); cdecl; external libqhull_r;
function qh_matchnewfacets(qh: PqhT): TcoordT; cdecl; external libqhull_r;
function qh_matchvertices(qh: PqhT; firstindex: longint; verticesA: PsetT; skipA: longint; verticesB: PsetT;
  skipB: Plongint; same: PboolT): TboolT; cdecl; external libqhull_r;
function qh_newfacet(qh: PqhT): PfacetT; cdecl; external libqhull_r;
function qh_newridge(qh: PqhT): PridgeT; cdecl; external libqhull_r;
function qh_pointid(qh: PqhT; point: PpointT): longint; cdecl; external libqhull_r;
procedure qh_removefacet(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_removevertex(qh: PqhT; vertex: PvertexT); cdecl; external libqhull_r;
procedure qh_update_vertexneighbors(qh: PqhT); cdecl; external libqhull_r;
procedure qh_update_vertexneighbors_cone(qh: PqhT); cdecl; external libqhull_r;

function qh_addfacetvertex(qh: PqhT; facet: PfacetT; newvertex: PvertexT): TboolT; cdecl; external libqhull_r;
procedure qh_addhash(newelem: pointer; hashtable: PsetT; hashsize: longint; hash: longint); cdecl; external libqhull_r;
procedure qh_check_bestdist(qh: PqhT); cdecl; external libqhull_r;
procedure qh_check_maxout(qh: PqhT); cdecl; external libqhull_r;
procedure qh_check_output(qh: PqhT); cdecl; external libqhull_r;
procedure qh_check_point(qh: PqhT; point: PpointT; facet: PfacetT; maxoutside: PrealT; maxdist: PrealT;
  errfacet1: PPfacetT; errfacet2: PPfacetT; errcount: Plongint); cdecl; external libqhull_r;
procedure qh_check_points(qh: PqhT); cdecl; external libqhull_r;
procedure qh_checkconvex(qh: PqhT; facetlist: PfacetT; fault: longint); cdecl; external libqhull_r;
procedure qh_checkfacet(qh: PqhT; facet: PfacetT; newmerge: TboolT; waserrorp: PboolT); cdecl; external libqhull_r;
procedure qh_checkflipped_all(qh: PqhT; facetlist: PfacetT); cdecl; external libqhull_r;
function qh_checklists(qh: PqhT; facetlist: PfacetT): TboolT; cdecl; external libqhull_r;
procedure qh_checkpolygon(qh: PqhT; facetlist: PfacetT); cdecl; external libqhull_r;
procedure qh_checkvertex(qh: PqhT; vertex: PvertexT; allchecks: TboolT; waserrorp: PboolT); cdecl; external libqhull_r;
procedure qh_clearcenters(qh: PqhT; _type: Tqh_CENTER); cdecl; external libqhull_r;
procedure qh_createsimplex(qh: PqhT; vertices: PsetT); cdecl; external libqhull_r;
procedure qh_delridge(qh: PqhT; ridge: PridgeT); cdecl; external libqhull_r;
procedure qh_delvertex(qh: PqhT; vertex: PvertexT); cdecl; external libqhull_r;
function qh_facet3vertex(qh: PqhT; facet: PfacetT): PsetT; cdecl; external libqhull_r;
function qh_findbestfacet(qh: PqhT; point: PpointT; bestoutside: TboolT; bestdist: PrealT; isoutside: PboolT): PfacetT; cdecl; external libqhull_r;
function qh_findbestlower(qh: PqhT; upperfacet: PfacetT; point: PpointT; bestdistp: PrealT; numpart: Plongint): PfacetT; cdecl; external libqhull_r;
function qh_findfacet_all(qh: PqhT; point: PpointT; noupper: TboolT; bestdist: PrealT; isoutside: PboolT;
  numpart: Plongint): PfacetT; cdecl; external libqhull_r;
function qh_findgood(qh: PqhT; facetlist: PfacetT; goodhorizon: longint): longint; cdecl; external libqhull_r;
procedure qh_findgood_all(qh: PqhT; facetlist: PfacetT); cdecl; external libqhull_r;
procedure qh_furthestnext(qh: PqhT); cdecl; external libqhull_r;
procedure qh_furthestout(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_infiniteloop(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_initbuild(qh: PqhT); cdecl; external libqhull_r;
procedure qh_initialhull(qh: PqhT; vertices: PsetT); cdecl; external libqhull_r;
function qh_initialvertices(qh: PqhT; dim: longint; maxpoints: PsetT; points: PpointT; numpoints: longint): PsetT; cdecl; external libqhull_r;
function qh_isvertex(point: PpointT; vertices: PsetT): PvertexT; cdecl; external libqhull_r;
function qh_makenewfacets(qh: PqhT; point: PpointT): PvertexT; cdecl; external libqhull_r;
function qh_matchdupridge(qh: PqhT; atfacet: PfacetT; atskip: longint; hashsize: longint; hashcount: Plongint): TcoordT; cdecl; external libqhull_r;
procedure qh_nearcoplanar(qh: PqhT); cdecl; external libqhull_r;
function qh_nearvertex(qh: PqhT; facet: PfacetT; point: PpointT; bestdistp: PrealT): PvertexT; cdecl; external libqhull_r;
function qh_newhashtable(qh: PqhT; newsize: longint): longint; cdecl; external libqhull_r;
function qh_newvertex(qh: PqhT; point: PpointT): PvertexT; cdecl; external libqhull_r;
function qh_nextfacet2d(facet: PfacetT; nextvertexp: PPvertexT): PfacetT; cdecl; external libqhull_r;
function qh_nextridge3d(atridge: PridgeT; facet: PfacetT; vertexp: PPvertexT): PridgeT; cdecl; external libqhull_r;
function qh_opposite_vertex(qh: PqhT; facetA: PfacetT; neighbor: PfacetT): PvertexT; cdecl; external libqhull_r;
procedure qh_outcoplanar(qh: PqhT); cdecl; external libqhull_r;
function qh_point(qh: PqhT; id: longint): PpointT; cdecl; external libqhull_r;
procedure qh_point_add(qh: PqhT; set_: PsetT; point: PpointT; elem: pointer); cdecl; external libqhull_r;
function qh_pointfacet(qh: PqhT): PsetT; cdecl; external libqhull_r;
function qh_pointvertex(qh: PqhT): PsetT; cdecl; external libqhull_r;
procedure qh_prependfacet(qh: PqhT; facet: PfacetT; facetlist: PPfacetT); cdecl; external libqhull_r;
procedure qh_printhashtable(qh: PqhT; fp: PFILE); cdecl; external libqhull_r;
procedure qh_printlists(qh: PqhT); cdecl; external libqhull_r;
procedure qh_replacefacetvertex(qh: PqhT; facet: PfacetT; oldvertex: PvertexT; newvertex: PvertexT); cdecl; external libqhull_r;
procedure qh_resetlists(qh: PqhT; stats: TboolT; resetVisible: TboolT); cdecl; external libqhull_r;
procedure qh_setvoronoi_all(qh: PqhT); cdecl; external libqhull_r;
procedure qh_triangulate(qh: PqhT); cdecl; external libqhull_r;
procedure qh_triangulate_facet(qh: PqhT; facetA: PfacetT; first_vertex: PPvertexT); cdecl; external libqhull_r;
procedure qh_triangulate_link(qh: PqhT; oldfacetA: PfacetT; facetA: PfacetT; oldfacetB: PfacetT; facetB: PfacetT); cdecl; external libqhull_r;
procedure qh_triangulate_mirror(qh: PqhT; facetA: PfacetT; facetB: PfacetT); cdecl; external libqhull_r;
procedure qh_triangulate_null(qh: PqhT; facetA: PfacetT); cdecl; external libqhull_r;
procedure qh_vertexintersect(qh: PqhT; vertexsetA: PPsetT; vertexsetB: PsetT); cdecl; external libqhull_r;
function qh_vertexintersect_new(qh: PqhT; vertexsetA: PsetT; vertexsetB: PsetT): PsetT; cdecl; external libqhull_r;
procedure qh_vertexneighbors(qh: PqhT); cdecl; external libqhull_r;
function qh_vertexsubset(vertexsetA: PsetT; vertexsetB: PsetT): TboolT; cdecl; external libqhull_r;

// === Konventiert am: 19-2-26 17:34:16 ===


implementation

end.
