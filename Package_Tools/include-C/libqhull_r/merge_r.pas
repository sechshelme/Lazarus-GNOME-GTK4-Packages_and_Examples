unit merge_r;

interface

uses
  fp_qhull_r, libqhull_r_, user_r;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  qhDEFmerge = 1;
  qh_ANGLEnone = 2.0;

type
  PmergeType = ^TmergeType;
  TmergeType = longint;

const
  MRGnone = 0;
  MRGcoplanar = 1;
  MRGanglecoplanar = 2;
  MRGconcave = 3;
  MRGconcavecoplanar = 4;
  MRGtwisted = 5;
  MRGflip = 6;
  MRGdupridge = 7;
  MRGsubridge = 8;
  MRGvertices = 9;
  MRGdegen = 10;
  MRGredundant = 11;
  MRGmirror = 12;
  MRGcoplanarhorizon = 13;
  ENDmrg = 14;

const
  qh_MERGEapex = True;

type
  TmergeT = record
    angle: TrealT;
    distance: TrealT;
    facet1: PfacetT;
    facet2: PfacetT;
    vertex1: PvertexT;
    vertex2: PvertexT;
    ridge1: PridgeT;
    ridge2: PridgeT;
    mergetype: TmergeType;
  end;
  PmergeT = ^TmergeT;

procedure qh_premerge(qh: PqhT; apexpointid: longint; maxcentrum: TrealT; maxangle: TrealT); cdecl; external libqhull_r;
procedure qh_postmerge(qh: PqhT; reason: pchar; maxcentrum: TrealT; maxangle: TrealT; vneighbors: TboolT); cdecl; external libqhull_r;
procedure qh_all_merges(qh: PqhT; othermerge: TboolT; vneighbors: TboolT); cdecl; external libqhull_r;
procedure qh_all_vertexmerges(qh: PqhT; apexpointid: longint; facet: PfacetT; retryfacet: PPfacetT); cdecl; external libqhull_r;
procedure qh_appendmergeset(qh: PqhT; facet: PfacetT; neighbor: PfacetT; mergetype: TmergeType; dist: TcoordT;
  angle: TrealT); cdecl; external libqhull_r;
procedure qh_appendvertexmerge(qh: PqhT; vertex: PvertexT; destination: PvertexT; mergetype: TmergeType; distance: TrealT;
  ridge1: PridgeT; ridge2: PridgeT); cdecl; external libqhull_r;
function qh_basevertices(qh: PqhT; samecycle: PfacetT): PsetT; cdecl; external libqhull_r;
procedure qh_check_dupridge(qh: PqhT; facet1: PfacetT; dist1: TrealT; facet2: PfacetT; dist2: TrealT); cdecl; external libqhull_r;
procedure qh_checkconnect(qh: PqhT); cdecl; external libqhull_r;
procedure qh_checkdelfacet(qh: PqhT; facet: PfacetT; mergeset: PsetT); cdecl; external libqhull_r;
procedure qh_checkdelridge(qh: PqhT); cdecl; external libqhull_r;
function qh_checkzero(qh: PqhT; testall: TboolT): TboolT; cdecl; external libqhull_r;
function qh_compare_anglemerge(p1: pointer; p2: pointer): longint; cdecl; external libqhull_r;
function qh_compare_facetmerge(p1: pointer; p2: pointer): longint; cdecl; external libqhull_r;
function qh_comparevisit(p1: pointer; p2: pointer): longint; cdecl; external libqhull_r;
procedure qh_copynonconvex(qh: PqhT; atridge: PridgeT); cdecl; external libqhull_r;
procedure qh_degen_redundant_facet(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_drop_mergevertex(qh: PqhT; merge: PmergeT); cdecl; external libqhull_r;
procedure qh_delridge_merge(qh: PqhT; ridge: PridgeT); cdecl; external libqhull_r;
function qh_find_newvertex(qh: PqhT; oldvertex: PvertexT; vertices: PsetT; ridges: PsetT): PvertexT; cdecl; external libqhull_r;
function qh_findbest_pinchedvertex(qh: PqhT; merge: PmergeT; apex: PvertexT; pinchedp: PPvertexT; distp: PrealT): PvertexT; cdecl; external libqhull_r;
function qh_findbest_ridgevertex(qh: PqhT; ridge: PridgeT; pinchedp: PPvertexT; distp: PcoordT): PvertexT; cdecl; external libqhull_r;
procedure qh_findbest_test(qh: PqhT; testcentrum: TboolT; facet: PfacetT; neighbor: PfacetT; bestfacet: PPfacetT;
  distp: PrealT; mindistp: PrealT; maxdistp: PrealT); cdecl; external libqhull_r;
function qh_findbestneighbor(qh: PqhT; facet: PfacetT; distp: PrealT; mindistp: PrealT; maxdistp: PrealT): PfacetT; cdecl; external libqhull_r;
procedure qh_flippedmerges(qh: PqhT; facetlist: PfacetT; wasmerge: PboolT); cdecl; external libqhull_r;
procedure qh_forcedmerges(qh: PqhT; wasmerge: PboolT); cdecl; external libqhull_r;
procedure qh_freemergesets(qh: PqhT); cdecl; external libqhull_r;
procedure qh_getmergeset(qh: PqhT; facetlist: PfacetT); cdecl; external libqhull_r;
procedure qh_getmergeset_initial(qh: PqhT; facetlist: PfacetT); cdecl; external libqhull_r;
function qh_getpinchedmerges(qh: PqhT; apex: PvertexT; maxdupdist: TcoordT; iscoplanar: PboolT): TboolT; cdecl; external libqhull_r;
function qh_hasmerge(mergeset: PsetT; _type: TmergeType; facetA: PfacetT; facetB: PfacetT): TboolT; cdecl; external libqhull_r;
procedure qh_hashridge(qh: PqhT; hashtable: PsetT; hashsize: longint; ridge: PridgeT; oldvertex: PvertexT); cdecl; external libqhull_r;
function qh_hashridge_find(qh: PqhT; hashtable: PsetT; hashsize: longint; ridge: PridgeT; vertex: PvertexT;
  oldvertex: PvertexT; hashslot: Plongint): PridgeT; cdecl; external libqhull_r;
procedure qh_initmergesets(qh: PqhT); cdecl; external libqhull_r;
procedure qh_makeridges(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_mark_dupridges(qh: PqhT; facetlist: PfacetT; allmerges: TboolT); cdecl; external libqhull_r;
procedure qh_maybe_duplicateridge(qh: PqhT; ridge: PridgeT); cdecl; external libqhull_r;
procedure qh_maybe_duplicateridges(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
procedure qh_maydropneighbor(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
function qh_merge_degenredundant(qh: PqhT): longint; cdecl; external libqhull_r;
procedure qh_merge_nonconvex(qh: PqhT; facet1: PfacetT; facet2: PfacetT; mergetype: TmergeType); cdecl; external libqhull_r;
procedure qh_merge_pinchedvertices(qh: PqhT; apexpointid: longint); cdecl; external libqhull_r;
procedure qh_merge_twisted(qh: PqhT; facet1: PfacetT; facet2: PfacetT); cdecl; external libqhull_r;
procedure qh_mergecycle(qh: PqhT; samecycle: PfacetT; newfacet: PfacetT); cdecl; external libqhull_r;
procedure qh_mergecycle_all(qh: PqhT; facetlist: PfacetT; wasmerge: PboolT); cdecl; external libqhull_r;
procedure qh_mergecycle_facets(qh: PqhT; samecycle: PfacetT; newfacet: PfacetT); cdecl; external libqhull_r;
procedure qh_mergecycle_neighbors(qh: PqhT; samecycle: PfacetT; newfacet: PfacetT); cdecl; external libqhull_r;
procedure qh_mergecycle_ridges(qh: PqhT; samecycle: PfacetT; newfacet: PfacetT); cdecl; external libqhull_r;
procedure qh_mergecycle_vneighbors(qh: PqhT; samecycle: PfacetT; newfacet: PfacetT); cdecl; external libqhull_r;
procedure qh_mergefacet(qh: PqhT; facet1: PfacetT; facet2: PfacetT; mergetype: TmergeType; mindist: PrealT;
  maxdist: PrealT; mergeapex: TboolT); cdecl; external libqhull_r;
procedure qh_mergefacet2d(qh: PqhT; facet1: PfacetT; facet2: PfacetT); cdecl; external libqhull_r;
procedure qh_mergeneighbors(qh: PqhT; facet1: PfacetT; facet2: PfacetT); cdecl; external libqhull_r;
procedure qh_mergeridges(qh: PqhT; facet1: PfacetT; facet2: PfacetT); cdecl; external libqhull_r;
procedure qh_mergesimplex(qh: PqhT; facet1: PfacetT; facet2: PfacetT; mergeapex: TboolT); cdecl; external libqhull_r;
procedure qh_mergevertex_del(qh: PqhT; vertex: PvertexT; facet1: PfacetT; facet2: PfacetT); cdecl; external libqhull_r;
procedure qh_mergevertex_neighbors(qh: PqhT; facet1: PfacetT; facet2: PfacetT); cdecl; external libqhull_r;
procedure qh_mergevertices(qh: PqhT; vertices1: PsetT; vertices: PPsetT); cdecl; external libqhull_r;
function qh_neighbor_intersections(qh: PqhT; vertex: PvertexT): PsetT; cdecl; external libqhull_r;
function qh_neighbor_vertices(qh: PqhT; vertex: PvertexT; subridge: PsetT): PsetT; cdecl; external libqhull_r;
procedure qh_neighbor_vertices_facet(qh: PqhT; vertexA: PvertexT; facet: PfacetT; vertices: PPsetT); cdecl; external libqhull_r;
procedure qh_newvertices(qh: PqhT; vertices: PsetT); cdecl; external libqhull_r;
function qh_next_vertexmerge(qh: PqhT): PmergeT; cdecl; external libqhull_r;
function qh_opposite_horizonfacet(qh: PqhT; merge: PmergeT; vertex: PPvertexT): PfacetT; cdecl; external libqhull_r;
function qh_reducevertices(qh: PqhT): TboolT; cdecl; external libqhull_r;
function qh_redundant_vertex(qh: PqhT; vertex: PvertexT): PvertexT; cdecl; external libqhull_r;
function qh_remove_extravertices(qh: PqhT; facet: PfacetT): TboolT; cdecl; external libqhull_r;
procedure qh_remove_mergetype(qh: PqhT; mergeset: PsetT; _type: TmergeType); cdecl; external libqhull_r;
procedure qh_rename_adjacentvertex(qh: PqhT; oldvertex: PvertexT; newvertex: PvertexT; dist: TrealT); cdecl; external libqhull_r;
function qh_rename_sharedvertex(qh: PqhT; vertex: PvertexT; facet: PfacetT): PvertexT; cdecl; external libqhull_r;
function qh_renameridgevertex(qh: PqhT; ridge: PridgeT; oldvertex: PvertexT; newvertex: PvertexT): TboolT; cdecl; external libqhull_r;
procedure qh_renamevertex(qh: PqhT; oldvertex: PvertexT; newvertex: PvertexT; ridges: PsetT; oldfacet: PfacetT;
  neighborA: PfacetT); cdecl; external libqhull_r;
function qh_test_appendmerge(qh: PqhT; facet: PfacetT; neighbor: PfacetT; simplicial: TboolT): TboolT; cdecl; external libqhull_r;
procedure qh_test_degen_neighbors(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
function qh_test_centrum_merge(qh: PqhT; facet: PfacetT; neighbor: PfacetT; angle: TrealT; okangle: TboolT): TboolT; cdecl; external libqhull_r;
function qh_test_nonsimplicial_merge(qh: PqhT; facet: PfacetT; neighbor: PfacetT; angle: TrealT; okangle: TboolT): TboolT; cdecl; external libqhull_r;
procedure qh_test_redundant_neighbors(qh: PqhT; facet: PfacetT); cdecl; external libqhull_r;
function qh_test_vneighbors(qh: PqhT): TboolT; cdecl; external libqhull_r;
procedure qh_tracemerge(qh: PqhT; facet1: PfacetT; facet2: PfacetT; mergetype: TmergeType); cdecl; external libqhull_r;
procedure qh_tracemerging(qh: PqhT); cdecl; external libqhull_r;
procedure qh_undo_newfacets(qh: PqhT); cdecl; external libqhull_r;
procedure qh_updatetested(qh: PqhT; facet1: PfacetT; facet2: PfacetT); cdecl; external libqhull_r;
function qh_vertexridges(qh: PqhT; vertex: PvertexT; allneighbors: TboolT): PsetT; cdecl; external libqhull_r;
procedure qh_vertexridges_facet(qh: PqhT; vertex: PvertexT; facet: PfacetT; ridges: PPsetT); cdecl; external libqhull_r;
procedure qh_willdelete(qh: PqhT; facet: PfacetT; replace: PfacetT); cdecl; external libqhull_r;

// === Konventiert am: 19-2-26 17:34:19 ===


implementation


end.
