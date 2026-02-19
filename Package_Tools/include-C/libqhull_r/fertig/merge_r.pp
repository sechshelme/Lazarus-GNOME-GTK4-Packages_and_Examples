
unit merge_r;
interface

{
  Automatically converted by H2Pas 1.0.0 from merge_r.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    merge_r.h
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
Plongint  = ^longint;
PmergeT  = ^mergeT;
PmergeType  = ^mergeType;
PqhT  = ^qhT;
PrealT  = ^realT;
PridgeT  = ^ridgeT;
PsetT  = ^setT;
PvertexT  = ^vertexT;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-merge_r.htm"
  >-------------------------------</a><a name="TOP">-</a>

   merge_r.h
   header file for merge_r.c

   see qh-merge_r.htm and merge_r.c

   Copyright (c) 1993-2020 C.B. Barber.
   $Id: //main/2019/qhull/src/libqhull_r/merge_r.h#2 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $
 }
{$ifndef qhDEFmerge}

const
  qhDEFmerge = 1;  
{$include "libqhull_r.h"}
{============ -constants- ============== }
{-<a                             href="qh-merge_r.htm#TOC"
  >--------------------------------</a><a name="qh_ANGLEnone">-</a>

  qh_ANGLEnone
    indicates missing angle for mergeT->angle
 }

const
  qh_ANGLEnone = 2.0;  
{-<a                             href="qh-merge_r.htm#TOC"
  >--------------------------------</a><a name="MRG">-</a>

  MRG... (mergeType)
    indicates the type of a merge (mergeT->type)
    MRGcoplanar...MRGtwisted set by qh_test_centrum_merge, qh_test_nonsimplicial_merge
 }
{ must match mergetypes[]  }
{ MRGcoplanar..MRGtwisted go into qh.facet_mergeset for qh_all_merges 
                     qh_compare_facetmerge selects lower mergetypes for merging first  }
{ (1) centrum coplanar if centrum ('Cn') or vertex not clearly above or below neighbor  }
{ (2) angle coplanar if angle ('An') is coplanar  }
{ (3) concave ridge  }
{ (4) concave and coplanar ridge, one side concave, other side coplanar  }
{ (5) twisted ridge, both concave and convex, facet1 is wider  }
{ MRGflip go into qh.facet_mergeset for qh_flipped_merges  }
{ (6) flipped facet if qh.interior_point is above facet, w/ facet1 == facet2  }
{ MRGdupridge go into qh.facet_mergeset for qh_forcedmerges  }
{ (7) dupridge if more than two neighbors.  Set by qh_mark_dupridges for qh_MERGEridge  }
{ MRGsubridge and MRGvertices go into vertex_mergeset  }
{ (8) merge pinched vertex to remove the subridge of a MRGdupridge  }
{ (9) merge pinched vertex to remove a facet's ridges with the same vertices  }
{ MRGdegen, MRGredundant, and MRGmirror go into qh.degen_mergeset  }
{ (10) degenerate facet (!enough neighbors) facet1 == facet2  }
{ (11) redundant facet (vertex subset)  }
{ merge_degenredundant assumes degen < redundant  }
{ (12) mirror facets: same vertices due to null facets in qh_triangulate 
                           f.redundant for both facets }
{ MRGcoplanarhorizon for qh_mergecycle_all only  }
{ (13) new facet coplanar with the horizon (qh_mergecycle_all)  }
type
  PmergeType = ^TmergeType;
  TmergeType =  Longint;
  Const
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
;
{-<a                             href="qh-merge_r.htm#TOC"
  >--------------------------------</a><a name="qh_MERGEapex">-</a>

  qh_MERGEapex
    flag for qh_mergefacet() to indicate an apex merge
 }
  qh_MERGEapex = _True;  
{============ -structures- ==================== }
{-<a                             href="qh-merge_r.htm#TOC"
  >--------------------------------</a><a name="mergeT">-</a>

  mergeT
    structure used to merge facets
 }
type
{ initialize in qh_appendmergeset  }
{ cosine of angle between normals of facet1 and facet2, 
                           null value and right angle is 0.0, coplanar is 1.0, narrow is -1.0  }
{ absolute value of distance between vertices, centrum and facet, or vertex and facet  }
{ will merge facet1 into facet2  }
{ will merge vertext1 into vertex2 for MRGsubridge or MRGvertices  }
{ the duplicate ridges resolved by MRGvertices  }
{ merge is deleted if either ridge is deleted (qh_delridge)  }
  PmergeT = ^TmergeT;
  TmergeT = record
      angle : TrealT;
      distance : TrealT;
      facet1 : PfacetT;
      facet2 : PfacetT;
      vertex1 : PvertexT;
      vertex2 : PvertexT;
      ridge1 : PridgeT;
      ridge2 : PridgeT;
      mergetype : TmergeType;
    end;

{=========== -macros- ========================= }
{-<a                             href="qh-merge_r.htm#TOC"
  >--------------------------------</a><a name="FOREACHmerge_">-</a>

  FOREACHmerge_( merges ) ...
    assign 'merge' to each merge in merges

  notes:
    uses 'mergeT *merge, **mergep;'
    if qh_mergefacet(),
      restart or use qh_setdellast() since qh.facet_mergeset may change
    see <a href="qset_r.h#FOREACHsetelement_">FOREACHsetelement_</a>
 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function FOREACHmerge_(merges : longint) : longint;

{-<a                             href="qh-poly_r.htm#TOC"
  >--------------------------------</a><a name="FOREACHmergeA_">-</a>

  FOREACHmergeA_( vertices )  ... 
    assign 'mergeA' to each merge in merges

  notes:
    uses 'mergeT *mergeA, *mergeAp;'
    see <a href="qset_r.h#FOREACHsetelement_">FOREACHsetelement_</a>
 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FOREACHmergeA_(merges : longint) : longint;

{-<a                             href="qh-poly_r.htm#TOC"
  >--------------------------------</a><a name="FOREACHmerge_i_">-</a>

  FOREACHmerge_i_(qh, vertices )  ... 
    assign 'merge' and 'merge_i' for each merge in mergeset

  declare:
    mergeT *merge;
    int     merge_n, merge_i;

  see:
    <a href="qset_r.h#FOREACHsetelement_i_">FOREACHsetelement_i_</a>
 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FOREACHmerge_i_(qh,mergeset : longint) : longint;

{============ prototypes in alphabetical order after pre/postmerge ======= }
{ C++ extern C conditionnal removed }
procedure qh_premerge(qh:PqhT; apexpointid:longint; maxcentrum:TrealT; maxangle:TrealT);cdecl;external;
(* Const before type ignored *)
procedure qh_postmerge(qh:PqhT; reason:Pchar; maxcentrum:TrealT; maxangle:TrealT; vneighbors:TboolT);cdecl;external;
procedure qh_all_merges(qh:PqhT; othermerge:TboolT; vneighbors:TboolT);cdecl;external;
procedure qh_all_vertexmerges(qh:PqhT; apexpointid:longint; facet:PfacetT; retryfacet:PPfacetT);cdecl;external;
procedure qh_appendmergeset(qh:PqhT; facet:PfacetT; neighbor:PfacetT; mergetype:TmergeType; dist:TcoordT; 
            angle:TrealT);cdecl;external;
procedure qh_appendvertexmerge(qh:PqhT; vertex:PvertexT; destination:PvertexT; mergetype:TmergeType; distance:TrealT; 
            ridge1:PridgeT; ridge2:PridgeT);cdecl;external;
function qh_basevertices(qh:PqhT; samecycle:PfacetT):PsetT;cdecl;external;
procedure qh_check_dupridge(qh:PqhT; facet1:PfacetT; dist1:TrealT; facet2:PfacetT; dist2:TrealT);cdecl;external;
{ qh.new_facets  }procedure qh_checkconnect(qh:PqhT);cdecl;external;
procedure qh_checkdelfacet(qh:PqhT; facet:PfacetT; mergeset:PsetT);cdecl;external;
{ qh.visible_facets, vertex_mergeset  }procedure qh_checkdelridge(qh:PqhT);cdecl;external;
function qh_checkzero(qh:PqhT; testall:TboolT):TboolT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function qh_compare_anglemerge(p1:pointer; p2:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function qh_compare_facetmerge(p1:pointer; p2:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function qh_comparevisit(p1:pointer; p2:pointer):longint;cdecl;external;
procedure qh_copynonconvex(qh:PqhT; atridge:PridgeT);cdecl;external;
procedure qh_degen_redundant_facet(qh:PqhT; facet:PfacetT);cdecl;external;
procedure qh_drop_mergevertex(qh:PqhT; merge:PmergeT);cdecl;external;
procedure qh_delridge_merge(qh:PqhT; ridge:PridgeT);cdecl;external;
function qh_find_newvertex(qh:PqhT; oldvertex:PvertexT; vertices:PsetT; ridges:PsetT):PvertexT;cdecl;external;
{ qh.newfacet_list  }function qh_findbest_pinchedvertex(qh:PqhT; merge:PmergeT; apex:PvertexT; pinchedp:PPvertexT; distp:PrealT):PvertexT;cdecl;external;
function qh_findbest_ridgevertex(qh:PqhT; ridge:PridgeT; pinchedp:PPvertexT; distp:PcoordT):PvertexT;cdecl;external;
procedure qh_findbest_test(qh:PqhT; testcentrum:TboolT; facet:PfacetT; neighbor:PfacetT; bestfacet:PPfacetT; 
            distp:PrealT; mindistp:PrealT; maxdistp:PrealT);cdecl;external;
function qh_findbestneighbor(qh:PqhT; facet:PfacetT; distp:PrealT; mindistp:PrealT; maxdistp:PrealT):PfacetT;cdecl;external;
procedure qh_flippedmerges(qh:PqhT; facetlist:PfacetT; wasmerge:PboolT);cdecl;external;
procedure qh_forcedmerges(qh:PqhT; wasmerge:PboolT);cdecl;external;
procedure qh_freemergesets(qh:PqhT);cdecl;external;
procedure qh_getmergeset(qh:PqhT; facetlist:PfacetT);cdecl;external;
procedure qh_getmergeset_initial(qh:PqhT; facetlist:PfacetT);cdecl;external;
{ qh.newfacet_list, vertex_mergeset  }function qh_getpinchedmerges(qh:PqhT; apex:PvertexT; maxdupdist:TcoordT; iscoplanar:PboolT):TboolT;cdecl;external;
function qh_hasmerge(mergeset:PsetT; _type:TmergeType; facetA:PfacetT; facetB:PfacetT):TboolT;cdecl;external;
procedure qh_hashridge(qh:PqhT; hashtable:PsetT; hashsize:longint; ridge:PridgeT; oldvertex:PvertexT);cdecl;external;
function qh_hashridge_find(qh:PqhT; hashtable:PsetT; hashsize:longint; ridge:PridgeT; vertex:PvertexT; 
           oldvertex:PvertexT; hashslot:Plongint):PridgeT;cdecl;external;
procedure qh_initmergesets(qh:PqhT);cdecl;external;
procedure qh_makeridges(qh:PqhT; facet:PfacetT);cdecl;external;
procedure qh_mark_dupridges(qh:PqhT; facetlist:PfacetT; allmerges:TboolT);cdecl;external;
procedure qh_maybe_duplicateridge(qh:PqhT; ridge:PridgeT);cdecl;external;
procedure qh_maybe_duplicateridges(qh:PqhT; facet:PfacetT);cdecl;external;
procedure qh_maydropneighbor(qh:PqhT; facet:PfacetT);cdecl;external;
function qh_merge_degenredundant(qh:PqhT):longint;cdecl;external;
procedure qh_merge_nonconvex(qh:PqhT; facet1:PfacetT; facet2:PfacetT; mergetype:TmergeType);cdecl;external;
{ qh.newfacet_list  }procedure qh_merge_pinchedvertices(qh:PqhT; apexpointid:longint);cdecl;external;
procedure qh_merge_twisted(qh:PqhT; facet1:PfacetT; facet2:PfacetT);cdecl;external;
procedure qh_mergecycle(qh:PqhT; samecycle:PfacetT; newfacet:PfacetT);cdecl;external;
procedure qh_mergecycle_all(qh:PqhT; facetlist:PfacetT; wasmerge:PboolT);cdecl;external;
procedure qh_mergecycle_facets(qh:PqhT; samecycle:PfacetT; newfacet:PfacetT);cdecl;external;
procedure qh_mergecycle_neighbors(qh:PqhT; samecycle:PfacetT; newfacet:PfacetT);cdecl;external;
procedure qh_mergecycle_ridges(qh:PqhT; samecycle:PfacetT; newfacet:PfacetT);cdecl;external;
procedure qh_mergecycle_vneighbors(qh:PqhT; samecycle:PfacetT; newfacet:PfacetT);cdecl;external;
procedure qh_mergefacet(qh:PqhT; facet1:PfacetT; facet2:PfacetT; mergetype:TmergeType; mindist:PrealT; 
            maxdist:PrealT; mergeapex:TboolT);cdecl;external;
procedure qh_mergefacet2d(qh:PqhT; facet1:PfacetT; facet2:PfacetT);cdecl;external;
procedure qh_mergeneighbors(qh:PqhT; facet1:PfacetT; facet2:PfacetT);cdecl;external;
procedure qh_mergeridges(qh:PqhT; facet1:PfacetT; facet2:PfacetT);cdecl;external;
procedure qh_mergesimplex(qh:PqhT; facet1:PfacetT; facet2:PfacetT; mergeapex:TboolT);cdecl;external;
procedure qh_mergevertex_del(qh:PqhT; vertex:PvertexT; facet1:PfacetT; facet2:PfacetT);cdecl;external;
procedure qh_mergevertex_neighbors(qh:PqhT; facet1:PfacetT; facet2:PfacetT);cdecl;external;
procedure qh_mergevertices(qh:PqhT; vertices1:PsetT; vertices:PPsetT);cdecl;external;
function qh_neighbor_intersections(qh:PqhT; vertex:PvertexT):PsetT;cdecl;external;
function qh_neighbor_vertices(qh:PqhT; vertex:PvertexT; subridge:PsetT):PsetT;cdecl;external;
procedure qh_neighbor_vertices_facet(qh:PqhT; vertexA:PvertexT; facet:PfacetT; vertices:PPsetT);cdecl;external;
procedure qh_newvertices(qh:PqhT; vertices:PsetT);cdecl;external;
function qh_next_vertexmerge(qh:PqhT):PmergeT;cdecl;external;
function qh_opposite_horizonfacet(qh:PqhT; merge:PmergeT; vertex:PPvertexT):PfacetT;cdecl;external;
function qh_reducevertices(qh:PqhT):TboolT;cdecl;external;
function qh_redundant_vertex(qh:PqhT; vertex:PvertexT):PvertexT;cdecl;external;
function qh_remove_extravertices(qh:PqhT; facet:PfacetT):TboolT;cdecl;external;
procedure qh_remove_mergetype(qh:PqhT; mergeset:PsetT; _type:TmergeType);cdecl;external;
procedure qh_rename_adjacentvertex(qh:PqhT; oldvertex:PvertexT; newvertex:PvertexT; dist:TrealT);cdecl;external;
function qh_rename_sharedvertex(qh:PqhT; vertex:PvertexT; facet:PfacetT):PvertexT;cdecl;external;
function qh_renameridgevertex(qh:PqhT; ridge:PridgeT; oldvertex:PvertexT; newvertex:PvertexT):TboolT;cdecl;external;
procedure qh_renamevertex(qh:PqhT; oldvertex:PvertexT; newvertex:PvertexT; ridges:PsetT; oldfacet:PfacetT; 
            neighborA:PfacetT);cdecl;external;
function qh_test_appendmerge(qh:PqhT; facet:PfacetT; neighbor:PfacetT; simplicial:TboolT):TboolT;cdecl;external;
procedure qh_test_degen_neighbors(qh:PqhT; facet:PfacetT);cdecl;external;
function qh_test_centrum_merge(qh:PqhT; facet:PfacetT; neighbor:PfacetT; angle:TrealT; okangle:TboolT):TboolT;cdecl;external;
function qh_test_nonsimplicial_merge(qh:PqhT; facet:PfacetT; neighbor:PfacetT; angle:TrealT; okangle:TboolT):TboolT;cdecl;external;
procedure qh_test_redundant_neighbors(qh:PqhT; facet:PfacetT);cdecl;external;
{ qh.newfacet_list  }function qh_test_vneighbors(qh:PqhT):TboolT;cdecl;external;
procedure qh_tracemerge(qh:PqhT; facet1:PfacetT; facet2:PfacetT; mergetype:TmergeType);cdecl;external;
procedure qh_tracemerging(qh:PqhT);cdecl;external;
procedure qh_undo_newfacets(qh:PqhT);cdecl;external;
procedure qh_updatetested(qh:PqhT; facet1:PfacetT; facet2:PfacetT);cdecl;external;
function qh_vertexridges(qh:PqhT; vertex:PvertexT; allneighbors:TboolT):PsetT;cdecl;external;
procedure qh_vertexridges_facet(qh:PqhT; vertex:PvertexT; facet:PfacetT; ridges:PPsetT);cdecl;external;
procedure qh_willdelete(qh:PqhT; facet:PfacetT; replace:PfacetT);cdecl;external;
{$endif}
{ qhDEFmerge  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FOREACHmerge_(merges : longint) : longint;
begin
  FOREACHmerge_:=FOREACHsetelement_(mergeT,merges,merge);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FOREACHmergeA_(merges : longint) : longint;
begin
  FOREACHmergeA_:=FOREACHsetelement_(mergeT,merges,mergeA);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FOREACHmerge_i_(qh,mergeset : longint) : longint;
begin
  FOREACHmerge_i_:=FOREACHsetelement_i_(qh,mergeT,mergeset,merge);
end;


end.
