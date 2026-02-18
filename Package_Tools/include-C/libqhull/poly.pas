unit poly;

interface

uses
  fp_qhull;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-poly.htm"
  >-------------------------------</a><a name="TOP">-</a>

   poly.h
   header file for poly.c and poly2.c

   see qh-poly.htm, libqhull.h and poly.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull/poly.h#5 $$Change: 2963 $
   $DateTime: 2020/06/03 19:31:01 $$Author: bbarber $
 }
{$ifndef qhDEFpoly}

const
  qhDEFpoly = 1;  
{$include "libqhull.h"}
{===============   constants ==========================  }
{-<a                             href="qh-geom.htm#TOC"
  >--------------------------------</a><a name="ALGORITHMfault">-</a>

  qh_ALGORITHMfault
    use as argument to checkconvex() to report errors during buildhull
 }

const
  qh_ALGORITHMfault = 0;  
{-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="DATAfault">-</a>

  qh_DATAfault
    use as argument to checkconvex() to report errors during initialhull
 }
  qh_DATAfault = 1;  
{-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="DUPLICATEridge">-</a>

  qh_DUPLICATEridge
    special value for facet->neighbor to indicate a duplicate ridge

  notes:
    set by qh_matchneighbor for qh_matchdupridge
 }

{ was #define dname def_expr }
function qh_DUPLICATEridge : PfacetT;  

{-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="MERGEridge">-</a>

  qh_MERGEridge       flag in facet
    special value for facet->neighbor to indicate a duplicate ridge that needs merging

  notes:
    set by qh_matchnewfacets..qh_matchdupridge from qh_DUPLICATEridge
    used by qh_mark_dupridges to set facet->mergeridge, facet->mergeridge2 from facet->dupridge
 }
{ was #define dname def_expr }
function qh_MERGEridge : PfacetT;  

{============ -structures- ==================== }
{=========== -macros- ========================= }
{-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="FORALLfacet_">-</a>

  FORALLfacet_( facetlist )  ... 
    assign 'facet' to each facet in facetlist

  notes:
    uses 'facetT *facet;'
    assumes last facet is a sentinel

  see:
    FORALLfacets
 }
{=============== prototypes poly.c in alphabetical order ================ }
procedure qh_appendfacet(facet:PfacetT);cdecl;external libqhull;
procedure qh_appendvertex(vertex:PvertexT);cdecl;external libqhull;
{ qh.visible_list, qh.newfacet_list  }procedure qh_attachnewfacets;cdecl;external libqhull;
function qh_checkflipped(facet:PfacetT; dist:PrealT; allerror:TboolT):TboolT;cdecl;external libqhull;
procedure qh_delfacet(facet:PfacetT);cdecl;external libqhull;
{ qh.visible_list, qh.horizon_list  }procedure qh_deletevisible;cdecl;external libqhull;
function qh_facetintersect(facetA:PfacetT; facetB:PfacetT; skipAp:Plongint; skipBp:Plongint; extra:longint):PsetT;cdecl;external libqhull;
function qh_gethash(hashsize:longint; set:PsetT; size:longint; firstindex:longint; skipelem:pointer):longint;cdecl;external libqhull;
function qh_getreplacement(visible:PfacetT):PfacetT;cdecl;external libqhull;
function qh_makenewfacet(vertices:PsetT; toporient:TboolT; facet:PfacetT):PfacetT;cdecl;external libqhull;
{ qh.newfacet_list  }procedure qh_makenewplanes;cdecl;external libqhull;
function qh_makenew_nonsimplicial(visible:PfacetT; apex:PvertexT; numnew:Plongint):PfacetT;cdecl;external libqhull;
function qh_makenew_simplicial(visible:PfacetT; apex:PvertexT; numnew:Plongint):PfacetT;cdecl;external libqhull;
procedure qh_matchneighbor(newfacet:PfacetT; newskip:longint; hashsize:longint; hashcount:Plongint);cdecl;external libqhull;
function qh_matchnewfacets:TcoordT;cdecl;external libqhull;
function qh_matchvertices(firstindex:longint; verticesA:PsetT; skipA:longint; verticesB:PsetT; skipB:Plongint; 
           same:PboolT):TboolT;cdecl;external libqhull;
function qh_newfacet:PfacetT;cdecl;external libqhull;
function qh_newridge:PridgeT;cdecl;external libqhull;
function qh_pointid(point:PpointT):longint;cdecl;external libqhull;
procedure qh_removefacet(facet:PfacetT);cdecl;external libqhull;
procedure qh_removevertex(vertex:PvertexT);cdecl;external libqhull;
procedure qh_update_vertexneighbors;cdecl;external libqhull;
procedure qh_update_vertexneighbors_cone;cdecl;external libqhull;
{========== -prototypes poly2.c in alphabetical order =========== }
function qh_addfacetvertex(facet:PfacetT; newvertex:PvertexT):TboolT;cdecl;external libqhull;
procedure qh_addhash(newelem:pointer; hashtable:PsetT; hashsize:longint; hash:longint);cdecl;external libqhull;
procedure qh_check_bestdist;cdecl;external libqhull;
procedure qh_check_maxout;cdecl;external libqhull;
procedure qh_check_output;cdecl;external libqhull;
procedure qh_check_point(point:PpointT; facet:PfacetT; maxoutside:PrealT; maxdist:PrealT; errfacet1:PPfacetT; 
            errfacet2:PPfacetT; errcount:Plongint);cdecl;external libqhull;
procedure qh_check_points;cdecl;external libqhull;
procedure qh_checkconvex(facetlist:PfacetT; fault:longint);cdecl;external libqhull;
procedure qh_checkfacet(facet:PfacetT; newmerge:TboolT; waserrorp:PboolT);cdecl;external libqhull;
procedure qh_checkflipped_all(facetlist:PfacetT);cdecl;external libqhull;
function qh_checklists(facetlist:PfacetT):TboolT;cdecl;external libqhull;
procedure qh_checkpolygon(facetlist:PfacetT);cdecl;external libqhull;
procedure qh_checkvertex(vertex:PvertexT; allchecks:TboolT; waserrorp:PboolT);cdecl;external libqhull;
procedure qh_clearcenters(_type:Tqh_CENTER);cdecl;external libqhull;
procedure qh_createsimplex(vertices:PsetT);cdecl;external libqhull;
procedure qh_delridge(ridge:PridgeT);cdecl;external libqhull;
procedure qh_delvertex(vertex:PvertexT);cdecl;external libqhull;
function qh_facet3vertex(facet:PfacetT):PsetT;cdecl;external libqhull;
function qh_findbestfacet(point:PpointT; bestoutside:TboolT; bestdist:PrealT; isoutside:PboolT):PfacetT;cdecl;external libqhull;
function qh_findbestlower(upperfacet:PfacetT; point:PpointT; bestdistp:PrealT; numpart:Plongint):PfacetT;cdecl;external libqhull;
function qh_findfacet_all(point:PpointT; noupper:TboolT; bestdist:PrealT; isoutside:PboolT; numpart:Plongint):PfacetT;cdecl;external libqhull;
function qh_findgood(facetlist:PfacetT; goodhorizon:longint):longint;cdecl;external libqhull;
procedure qh_findgood_all(facetlist:PfacetT);cdecl;external libqhull;
{ qh.facet_list  }procedure qh_furthestnext;cdecl;external libqhull;
procedure qh_furthestout(facet:PfacetT);cdecl;external libqhull;
procedure qh_infiniteloop(facet:PfacetT);cdecl;external libqhull;
procedure qh_initbuild;cdecl;external libqhull;
procedure qh_initialhull(vertices:PsetT);cdecl;external libqhull;
function qh_initialvertices(dim:longint; maxpoints:PsetT; points:PpointT; numpoints:longint):PsetT;cdecl;external libqhull;
function qh_isvertex(point:PpointT; vertices:PsetT):PvertexT;cdecl;external libqhull;
{ qh.horizon_list, visible_list  }function qh_makenewfacets(point:PpointT):PvertexT;cdecl;external libqhull;
function qh_matchdupridge(atfacet:PfacetT; atskip:longint; hashsize:longint; hashcount:Plongint):TcoordT;cdecl;external libqhull;
{ qh.facet_list  }procedure qh_nearcoplanar;cdecl;external libqhull;
function qh_nearvertex(facet:PfacetT; point:PpointT; bestdistp:PrealT):PvertexT;cdecl;external libqhull;
function qh_newhashtable(newsize:longint):longint;cdecl;external libqhull;
function qh_newvertex(point:PpointT):PvertexT;cdecl;external libqhull;
function qh_nextfacet2d(facet:PfacetT; nextvertexp:PPvertexT):PfacetT;cdecl;external libqhull;
function qh_nextridge3d(atridge:PridgeT; facet:PfacetT; vertexp:PPvertexT):PridgeT;cdecl;external libqhull;
function qh_opposite_vertex(facetA:PfacetT; neighbor:PfacetT):PvertexT;cdecl;external libqhull;
{ qh.facet_list  }procedure qh_outcoplanar;cdecl;external libqhull;
function qh_point(id:longint):PpointT;cdecl;external libqhull;
procedure qh_point_add(set:PsetT; point:PpointT; elem:pointer);cdecl;external libqhull;
{ qh.facet_list  }function qh_pointfacet:PsetT;cdecl;external libqhull;
{ qh.facet_list  }function qh_pointvertex:PsetT;cdecl;external libqhull;
procedure qh_prependfacet(facet:PfacetT; facetlist:PPfacetT);cdecl;external libqhull;
procedure qh_printhashtable(fp:PFILE);cdecl;external libqhull;
procedure qh_printlists;cdecl;external libqhull;
procedure qh_replacefacetvertex(facet:PfacetT; oldvertex:PvertexT; newvertex:PvertexT);cdecl;external libqhull;
{ qh.newvertex_list qh.newfacet_list qh.visible_list  }procedure qh_resetlists(stats:TboolT; resetVisible:TboolT);cdecl;external libqhull;
procedure qh_setvoronoi_all;cdecl;external libqhull;
{ qh.facet_list  }procedure qh_triangulate;cdecl;external libqhull;
procedure qh_triangulate_facet(facetA:PfacetT; first_vertex:PPvertexT);cdecl;external libqhull;
procedure qh_triangulate_link(oldfacetA:PfacetT; facetA:PfacetT; oldfacetB:PfacetT; facetB:PfacetT);cdecl;external libqhull;
procedure qh_triangulate_mirror(facetA:PfacetT; facetB:PfacetT);cdecl;external libqhull;
procedure qh_triangulate_null(facetA:PfacetT);cdecl;external libqhull;
procedure qh_vertexintersect(vertexsetA:PPsetT; vertexsetB:PsetT);cdecl;external libqhull;
function qh_vertexintersect_new(vertexsetA:PsetT; vertexsetB:PsetT):PsetT;cdecl;external libqhull;
{ qh.facet_list  }procedure qh_vertexneighbors;cdecl;external libqhull;
function qh_vertexsubset(vertexsetA:PsetT; vertexsetB:PsetT):TboolT;cdecl;external libqhull;
{$endif}
{ qhDEFpoly  }

// === Konventiert am: 18-2-26 16:48:13 ===


implementation


{ was #define dname def_expr }
function qh_DUPLICATEridge : PfacetT;
  begin
    qh_DUPLICATEridge:=PfacetT(1);
  end;

{ was #define dname def_expr }
function qh_MERGEridge : PfacetT;
  begin
    qh_MERGEridge:=PfacetT(2);
  end;


end.
