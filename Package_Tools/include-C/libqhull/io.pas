unit io;

interface

uses
  fp_qhull;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-io.htm"
  >-------------------------------</a><a name="TOP">-</a>

   io.h
   declarations of Input/Output functions

   see README, libqhull.h and io.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull/io.h#3 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $
 }
{$ifndef qhDEFio}

const
  qhDEFio = 1;  
{$include "libqhull.h"}
{============ constants and flags ================== }
{-<a                             href="qh-io.htm#TOC"
  >--------------------------------</a><a name="qh_MAXfirst">-</a>

  qh_MAXfirst
    maximum length of first two lines of stdin
 }

const
  qh_MAXfirst = 200;  
{-<a                             href="qh-io.htm#TOC"
  >--------------------------------</a><a name="qh_MINradius">-</a>

  qh_MINradius
    min radius for Gp and Gv, fraction of maxcoord
 }
  qh_MINradius = 0.02;  
{-<a                             href="qh-io.htm#TOC"
  >--------------------------------</a><a name="qh_GEOMepsilon">-</a>

  qh_GEOMepsilon
    adjust outer planes for 'lines closer' and geomview roundoff.
    This prevents bleed through.
 }
  qh_GEOMepsilon = 2e-3;  
{-<a                             href="qh-io.htm#TOC"
  >--------------------------------</a><a name="qh_WHITESPACE">-</a>

  qh_WHITESPACE
    possible values of white space
 }
  qh_WHITESPACE = ' \n\t\v\r\f';  
{-<a                             href="qh-io.htm#TOC"
  >--------------------------------</a><a name="RIDGE">-</a>

  qh_RIDGE
    to select which ridges to print in qh_eachvoronoi
 }
type
  Pqh_RIDGE = ^Tqh_RIDGE;
  Tqh_RIDGE =  Longint;
  Const
    qh_RIDGEall = 0;
    qh_RIDGEinner = 1;
    qh_RIDGEouter = 2;
;
{-<a                             href="qh-io.htm#TOC"
  >--------------------------------</a><a name="printvridgeT">-</a>

  printvridgeT
    prints results of qh_printvdiagram

  see:
    <a href="io.c#printvridge">qh_printvridge</a> for an example
 }
type

  TprintvridgeT = procedure (fp:PFILE; vertex:PvertexT; vertexA:PvertexT; centers:PsetT; unbounded:TboolT);cdecl;
{============== -prototypes in alphabetical order ========= }

procedure qh_dfacet(id:dword);cdecl;external libqhull;
procedure qh_dvertex(id:dword);cdecl;external libqhull;
function qh_compare_facetarea(p1:pointer; p2:pointer):longint;cdecl;external libqhull;
function qh_compare_facetvisit(p1:pointer; p2:pointer):longint;cdecl;external libqhull;
function qh_compare_nummerge(p1:pointer; p2:pointer):longint;cdecl;external libqhull;
procedure qh_copyfilename(filename:Pchar; size:longint; source:Pchar; length:longint);cdecl;external libqhull;
procedure qh_countfacets(facetlist:PfacetT; facets:PsetT; printall:TboolT; numfacetsp:Plongint; numsimplicialp:Plongint; 
            totneighborsp:Plongint; numridgesp:Plongint; numcoplanarsp:Plongint; numnumtricoplanarsp:Plongint);cdecl;external libqhull;
function qh_detvnorm(vertex:PvertexT; vertexA:PvertexT; centers:PsetT; offsetp:PrealT):PpointT;cdecl;external libqhull;
function qh_detvridge(vertex:PvertexT):PsetT;cdecl;external libqhull;
function qh_detvridge3(atvertex:PvertexT; vertex:PvertexT):PsetT;cdecl;external libqhull;
function qh_eachvoronoi(fp:PFILE; printvridge:TprintvridgeT; atvertex:PvertexT; visitall:TboolT; innerouter:Tqh_RIDGE; 
           inorder:TboolT):longint;cdecl;external libqhull;
function qh_eachvoronoi_all(fp:PFILE; printvridge:TprintvridgeT; isUpper:TboolT; innerouter:Tqh_RIDGE; inorder:TboolT):longint;cdecl;external libqhull;
procedure qh_facet2point(facet:PfacetT; point0:PPpointT; point1:PPpointT; mindist:PrealT);cdecl;external libqhull;
function qh_facetvertices(facetlist:PfacetT; facets:PsetT; allfacets:TboolT):PsetT;cdecl;external libqhull;
procedure qh_geomplanes(facet:PfacetT; outerplane:PrealT; innerplane:PrealT);cdecl;external libqhull;
procedure qh_markkeep(facetlist:PfacetT);cdecl;external libqhull;
function qh_markvoronoi(facetlist:PfacetT; facets:PsetT; printall:TboolT; isLowerp:PboolT; numcentersp:Plongint):PsetT;cdecl;external libqhull;
procedure qh_order_vertexneighbors(vertex:PvertexT);cdecl;external libqhull;
procedure qh_prepare_output;cdecl;external libqhull;
procedure qh_printafacet(fp:PFILE; format:Tqh_PRINT; facet:PfacetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printbegin(fp:PFILE; format:Tqh_PRINT; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printcenter(fp:PFILE; format:Tqh_PRINT; _string:Pchar; facet:PfacetT);cdecl;external libqhull;
procedure qh_printcentrum(fp:PFILE; facet:PfacetT; radius:TrealT);cdecl;external libqhull;
procedure qh_printend(fp:PFILE; format:Tqh_PRINT; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printend4geom(fp:PFILE; facet:PfacetT; num:Plongint; printall:TboolT);cdecl;external libqhull;
procedure qh_printextremes(fp:PFILE; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printextremes_2d(fp:PFILE; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printextremes_d(fp:PFILE; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printfacet(fp:PFILE; facet:PfacetT);cdecl;external libqhull;
procedure qh_printfacet2math(fp:PFILE; facet:PfacetT; format:Tqh_PRINT; notfirst:longint);cdecl;external libqhull;
procedure qh_printfacet2geom(fp:PFILE; facet:PfacetT; color:array[0..2] of TrealT);cdecl;external libqhull;
procedure qh_printfacet2geom_points(fp:PFILE; point1:PpointT; point2:PpointT; facet:PfacetT; offset:TrealT; 
            color:array[0..2] of TrealT);cdecl;external libqhull;
procedure qh_printfacet3math(fp:PFILE; facet:PfacetT; format:Tqh_PRINT; notfirst:longint);cdecl;external libqhull;
procedure qh_printfacet3geom_nonsimplicial(fp:PFILE; facet:PfacetT; color:array[0..2] of TrealT);cdecl;external libqhull;
procedure qh_printfacet3geom_points(fp:PFILE; points:PsetT; facet:PfacetT; offset:TrealT; color:array[0..2] of TrealT);cdecl;external libqhull;
procedure qh_printfacet3geom_simplicial(fp:PFILE; facet:PfacetT; color:array[0..2] of TrealT);cdecl;external libqhull;
procedure qh_printfacet3vertex(fp:PFILE; facet:PfacetT; format:Tqh_PRINT);cdecl;external libqhull;
procedure qh_printfacet4geom_nonsimplicial(fp:PFILE; facet:PfacetT; color:array[0..2] of TrealT);cdecl;external libqhull;
procedure qh_printfacet4geom_simplicial(fp:PFILE; facet:PfacetT; color:array[0..2] of TrealT);cdecl;external libqhull;
procedure qh_printfacetNvertex_nonsimplicial(fp:PFILE; facet:PfacetT; id:longint; format:Tqh_PRINT);cdecl;external libqhull;
procedure qh_printfacetNvertex_simplicial(fp:PFILE; facet:PfacetT; format:Tqh_PRINT);cdecl;external libqhull;
procedure qh_printfacetheader(fp:PFILE; facet:PfacetT);cdecl;external libqhull;
procedure qh_printfacetridges(fp:PFILE; facet:PfacetT);cdecl;external libqhull;
procedure qh_printfacets(fp:PFILE; format:Tqh_PRINT; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printhyperplaneintersection(fp:PFILE; facet1:PfacetT; facet2:PfacetT; vertices:PsetT; color:array[0..2] of TrealT);cdecl;external libqhull;
procedure qh_printline3geom(fp:PFILE; pointA:PpointT; pointB:PpointT; color:array[0..2] of TrealT);cdecl;external libqhull;
procedure qh_printneighborhood(fp:PFILE; format:Tqh_PRINT; facetA:PfacetT; facetB:PfacetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printpoint(fp:PFILE; _string:Pchar; point:PpointT);cdecl;external libqhull;
procedure qh_printpointid(fp:PFILE; _string:Pchar; dim:longint; point:PpointT; id:longint);cdecl;external libqhull;
procedure qh_printpoint3(fp:PFILE; point:PpointT);cdecl;external libqhull;
procedure qh_printpoints_out(fp:PFILE; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printpointvect(fp:PFILE; point:PpointT; normal:PcoordT; center:PpointT; radius:TrealT; 
            color:array[0..2] of TrealT);cdecl;external libqhull;
procedure qh_printpointvect2(fp:PFILE; point:PpointT; normal:PcoordT; center:PpointT; radius:TrealT);cdecl;external libqhull;
procedure qh_printridge(fp:PFILE; ridge:PridgeT);cdecl;external libqhull;
procedure qh_printspheres(fp:PFILE; vertices:PsetT; radius:TrealT);cdecl;external libqhull;
procedure qh_printvdiagram(fp:PFILE; format:Tqh_PRINT; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
function qh_printvdiagram2(fp:PFILE; printvridge:TprintvridgeT; vertices:PsetT; innerouter:Tqh_RIDGE; inorder:TboolT):longint;cdecl;external libqhull;
procedure qh_printvertex(fp:PFILE; vertex:PvertexT);cdecl;external libqhull;
procedure qh_printvertexlist(fp:PFILE; _string:Pchar; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printvertices(fp:PFILE; _string:Pchar; vertices:PsetT);cdecl;external libqhull;
procedure qh_printvneighbors(fp:PFILE; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printvoronoi(fp:PFILE; format:Tqh_PRINT; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printvnorm(fp:PFILE; vertex:PvertexT; vertexA:PvertexT; centers:PsetT; unbounded:TboolT);cdecl;external libqhull;
procedure qh_printvridge(fp:PFILE; vertex:PvertexT; vertexA:PvertexT; centers:PsetT; unbounded:TboolT);cdecl;external libqhull;
procedure qh_produce_output;cdecl;external libqhull;
procedure qh_produce_output2;cdecl;external libqhull;
procedure qh_projectdim3(source:PpointT; destination:PpointT);cdecl;external libqhull;
function qh_readfeasible(dim:longint; curline:Pchar):longint;cdecl;external libqhull;
function qh_readpoints(numpoints:Plongint; dimension:Plongint; ismalloc:PboolT):PcoordT;cdecl;external libqhull;
procedure qh_setfeasible(dim:longint);cdecl;external libqhull;
function qh_skipfacet(facet:PfacetT):TboolT;cdecl;external libqhull;
function qh_skipfilename(filename:Pchar):Pchar;cdecl;external libqhull;
{$endif}
{ qhDEFio  }

// === Konventiert am: 18-2-26 16:48:21 ===


implementation



end.
