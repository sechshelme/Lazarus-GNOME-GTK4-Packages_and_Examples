unit merge;

interface

uses
  fp_qhull;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-merge.htm"
  >-------------------------------</a><a name="TOP">-</a>

   merge.h
   header file for merge.c

   see qh-merge.htm and merge.c

   Copyright (c) 1993-2020 C.B. Barber.
   $Id: //main/2019/qhull/src/libqhull/merge.h#3 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $
 }
{$ifndef qhDEFmerge}

const
  qhDEFmerge = 1;  
{$include "libqhull.h"}
{============ -constants- ============== }
{-<a                             href="qh-merge.htm#TOC"
  >--------------------------------</a><a name="qh_ANGLEnone">-</a>

  qh_ANGLEnone
    indicates missing angle for mergeT->angle
 }

const
  qh_ANGLEnone = 2.0;  
{-<a                             href="qh-merge.htm#TOC"
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
{-<a                             href="qh-merge.htm#TOC"
  >--------------------------------</a><a name="qh_MERGEapex">-</a>

  qh_MERGEapex
    flag for qh_mergefacet() to indicate an apex merge
 }
  qh_MERGEapex = _True;  
{============ -structures- ==================== }
{-<a                             href="qh-merge.htm#TOC"
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


procedure qh_premerge(apexpointid:longint; maxcentrum:TrealT; maxangle:TrealT);cdecl;external libqhull;
procedure qh_postmerge(reason:Pchar; maxcentrum:TrealT; maxangle:TrealT; vneighbors:TboolT);cdecl;external libqhull;
procedure qh_all_merges(othermerge:TboolT; vneighbors:TboolT);cdecl;external libqhull;
procedure qh_all_vertexmerges(apexpointid:longint; facet:PfacetT; retryfacet:PPfacetT);cdecl;external libqhull;
procedure qh_appendmergeset(facet:PfacetT; neighbor:PfacetT; mergetype:TmergeType; dist:TcoordT; angle:TrealT);cdecl;external libqhull;
procedure qh_appendvertexmerge(vertex:PvertexT; destination:PvertexT; mergetype:TmergeType; distance:TrealT; ridge1:PridgeT; 
            ridge2:PridgeT);cdecl;external libqhull;
function qh_basevertices(samecycle:PfacetT):PsetT;cdecl;external libqhull;
procedure qh_check_dupridge(facet1:PfacetT; dist1:TrealT; facet2:PfacetT; dist2:TrealT);cdecl;external libqhull;
{ qh.new_facets  }procedure qh_checkconnect;cdecl;external libqhull;
procedure qh_checkdelfacet(facet:PfacetT; mergeset:PsetT);cdecl;external libqhull;
{ qh.visible_facets, vertex_mergeset  }procedure qh_checkdelridge;cdecl;external libqhull;
function qh_checkzero(testall:TboolT):TboolT;cdecl;external libqhull;
function qh_compare_anglemerge(p1:pointer; p2:pointer):longint;cdecl;external libqhull;
function qh_compare_facetmerge(p1:pointer; p2:pointer):longint;cdecl;external libqhull;
function qh_comparevisit(p1:pointer; p2:pointer):longint;cdecl;external libqhull;
procedure qh_copynonconvex(atridge:PridgeT);cdecl;external libqhull;
procedure qh_degen_redundant_facet(facet:PfacetT);cdecl;external libqhull;
procedure qh_drop_mergevertex(merge:PmergeT);cdecl;external libqhull;
procedure qh_delridge_merge(ridge:PridgeT);cdecl;external libqhull;
function qh_find_newvertex(oldvertex:PvertexT; vertices:PsetT; ridges:PsetT):PvertexT;cdecl;external libqhull;
{ qh.newfacet_list  }function qh_findbest_pinchedvertex(merge:PmergeT; apex:PvertexT; pinchedp:PPvertexT; distp:PrealT):PvertexT;cdecl;external libqhull;
function qh_findbest_ridgevertex(ridge:PridgeT; pinchedp:PPvertexT; distp:PcoordT):PvertexT;cdecl;external libqhull;
procedure qh_findbest_test(testcentrum:TboolT; facet:PfacetT; neighbor:PfacetT; bestfacet:PPfacetT; distp:PrealT; 
            mindistp:PrealT; maxdistp:PrealT);cdecl;external libqhull;
function qh_findbestneighbor(facet:PfacetT; distp:PrealT; mindistp:PrealT; maxdistp:PrealT):PfacetT;cdecl;external libqhull;
procedure qh_flippedmerges(facetlist:PfacetT; wasmerge:PboolT);cdecl;external libqhull;
procedure qh_forcedmerges(wasmerge:PboolT);cdecl;external libqhull;
procedure qh_freemergesets;cdecl;external libqhull;
procedure qh_getmergeset(facetlist:PfacetT);cdecl;external libqhull;
procedure qh_getmergeset_initial(facetlist:PfacetT);cdecl;external libqhull;
{ qh.newfacet_list, vertex_mergeset  }function qh_getpinchedmerges(apex:PvertexT; maxdupdist:TcoordT; iscoplanar:PboolT):TboolT;cdecl;external libqhull;
function qh_hasmerge(mergeset:PsetT; _type:TmergeType; facetA:PfacetT; facetB:PfacetT):TboolT;cdecl;external libqhull;
procedure qh_hashridge(hashtable:PsetT; hashsize:longint; ridge:PridgeT; oldvertex:PvertexT);cdecl;external libqhull;
function qh_hashridge_find(hashtable:PsetT; hashsize:longint; ridge:PridgeT; vertex:PvertexT; oldvertex:PvertexT; 
           hashslot:Plongint):PridgeT;cdecl;external libqhull;
procedure qh_initmergesets;cdecl;external libqhull;
procedure qh_makeridges(facet:PfacetT);cdecl;external libqhull;
procedure qh_mark_dupridges(facetlist:PfacetT; allmerges:TboolT);cdecl;external libqhull;
procedure qh_maybe_duplicateridge(ridge:PridgeT);cdecl;external libqhull;
procedure qh_maybe_duplicateridges(facet:PfacetT);cdecl;external libqhull;
procedure qh_maydropneighbor(facet:PfacetT);cdecl;external libqhull;
function qh_merge_degenredundant:longint;cdecl;external libqhull;
procedure qh_merge_nonconvex(facet1:PfacetT; facet2:PfacetT; mergetype:TmergeType);cdecl;external libqhull;
{ qh.newfacet_list  }procedure qh_merge_pinchedvertices(apexpointid:longint);cdecl;external libqhull;
procedure qh_merge_twisted(facet1:PfacetT; facet2:PfacetT);cdecl;external libqhull;
procedure qh_mergecycle(samecycle:PfacetT; newfacet:PfacetT);cdecl;external libqhull;
procedure qh_mergecycle_all(facetlist:PfacetT; wasmerge:PboolT);cdecl;external libqhull;
procedure qh_mergecycle_facets(samecycle:PfacetT; newfacet:PfacetT);cdecl;external libqhull;
procedure qh_mergecycle_neighbors(samecycle:PfacetT; newfacet:PfacetT);cdecl;external libqhull;
procedure qh_mergecycle_ridges(samecycle:PfacetT; newfacet:PfacetT);cdecl;external libqhull;
procedure qh_mergecycle_vneighbors(samecycle:PfacetT; newfacet:PfacetT);cdecl;external libqhull;
procedure qh_mergefacet(facet1:PfacetT; facet2:PfacetT; mergetype:TmergeType; mindist:PrealT; maxdist:PrealT; 
            mergeapex:TboolT);cdecl;external libqhull;
procedure qh_mergefacet2d(facet1:PfacetT; facet2:PfacetT);cdecl;external libqhull;
procedure qh_mergeneighbors(facet1:PfacetT; facet2:PfacetT);cdecl;external libqhull;
procedure qh_mergeridges(facet1:PfacetT; facet2:PfacetT);cdecl;external libqhull;
procedure qh_mergesimplex(facet1:PfacetT; facet2:PfacetT; mergeapex:TboolT);cdecl;external libqhull;
procedure qh_mergevertex_del(vertex:PvertexT; facet1:PfacetT; facet2:PfacetT);cdecl;external libqhull;
procedure qh_mergevertex_neighbors(facet1:PfacetT; facet2:PfacetT);cdecl;external libqhull;
procedure qh_mergevertices(vertices1:PsetT; vertices:PPsetT);cdecl;external libqhull;
function qh_neighbor_intersections(vertex:PvertexT):PsetT;cdecl;external libqhull;
function qh_neighbor_vertices(vertex:PvertexT; subridge:PsetT):PsetT;cdecl;external libqhull;
procedure qh_neighbor_vertices_facet(vertexA:PvertexT; facet:PfacetT; vertices:PPsetT);cdecl;external libqhull;
procedure qh_newvertices(vertices:PsetT);cdecl;external libqhull;
function qh_next_vertexmerge:PmergeT;cdecl;external libqhull;
function qh_opposite_horizonfacet(merge:PmergeT; vertex:PPvertexT):PfacetT;cdecl;external libqhull;
function qh_reducevertices:TboolT;cdecl;external libqhull;
function qh_redundant_vertex(vertex:PvertexT):PvertexT;cdecl;external libqhull;
function qh_remove_extravertices(facet:PfacetT):TboolT;cdecl;external libqhull;
procedure qh_remove_mergetype(mergeset:PsetT; _type:TmergeType);cdecl;external libqhull;
procedure qh_rename_adjacentvertex(oldvertex:PvertexT; newvertex:PvertexT; dist:TrealT);cdecl;external libqhull;
function qh_rename_sharedvertex(vertex:PvertexT; facet:PfacetT):PvertexT;cdecl;external libqhull;
function qh_renameridgevertex(ridge:PridgeT; oldvertex:PvertexT; newvertex:PvertexT):TboolT;cdecl;external libqhull;
procedure qh_renamevertex(oldvertex:PvertexT; newvertex:PvertexT; ridges:PsetT; oldfacet:PfacetT; neighborA:PfacetT);cdecl;external libqhull;
function qh_test_appendmerge(facet:PfacetT; neighbor:PfacetT; simplicial:TboolT):TboolT;cdecl;external libqhull;
procedure qh_test_degen_neighbors(facet:PfacetT);cdecl;external libqhull;
function qh_test_centrum_merge(facet:PfacetT; neighbor:PfacetT; angle:TrealT; okangle:TboolT):TboolT;cdecl;external libqhull;
function qh_test_nonsimplicial_merge(facet:PfacetT; neighbor:PfacetT; angle:TrealT; okangle:TboolT):TboolT;cdecl;external libqhull;
procedure qh_test_redundant_neighbors(facet:PfacetT);cdecl;external libqhull;
{ qh.newfacet_list  }function qh_test_vneighbors:TboolT;cdecl;external libqhull;
procedure qh_tracemerge(facet1:PfacetT; facet2:PfacetT; mergetype:TmergeType);cdecl;external libqhull;
procedure qh_tracemerging;cdecl;external libqhull;
procedure qh_undo_newfacets;cdecl;external libqhull;
procedure qh_updatetested(facet1:PfacetT; facet2:PfacetT);cdecl;external libqhull;
function qh_vertexridges(vertex:PvertexT; allneighbors:TboolT):PsetT;cdecl;external libqhull;
procedure qh_vertexridges_facet(vertex:PvertexT; facet:PfacetT; ridges:PPsetT);cdecl;external libqhull;
procedure qh_willdelete(facet:PfacetT; replace:PfacetT);cdecl;external libqhull;
{$endif}
{ qhDEFmerge  }

// === Konventiert am: 18-2-26 16:48:15 ===


implementation



end.
