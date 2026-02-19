
unit io_r;
interface

{
  Automatically converted by H2Pas 1.0.0 from io_r.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    io_r.h
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
Pqh_RIDGE  = ^qh_RIDGE;
PqhT  = ^qhT;
PrealT  = ^realT;
PridgeT  = ^ridgeT;
PsetT  = ^setT;
PvertexT  = ^vertexT;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-io_r.htm"
  >-------------------------------</a><a name="TOP">-</a>

   io_r.h
   declarations of Input/Output functions

   see README, libqhull_r.h and io_r.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull_r/io_r.h#3 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $
 }
{$ifndef qhDEFio}

const
  qhDEFio = 1;  
{$include "libqhull_r.h"}
{============ constants and flags ================== }
{-<a                             href="qh-io_r.htm#TOC"
  >--------------------------------</a><a name="qh_MAXfirst">-</a>

  qh_MAXfirst
    maximum length of first two lines of stdin
 }

const
  qh_MAXfirst = 200;  
{-<a                             href="qh-io_r.htm#TOC"
  >--------------------------------</a><a name="qh_MINradius">-</a>

  qh_MINradius
    min radius for Gp and Gv, fraction of maxcoord
 }
  qh_MINradius = 0.02;  
{-<a                             href="qh-io_r.htm#TOC"
  >--------------------------------</a><a name="qh_GEOMepsilon">-</a>

  qh_GEOMepsilon
    adjust outer planes for 'lines closer' and geomview roundoff.
    This prevents bleed through.
 }
  qh_GEOMepsilon = 2e-3;  
{-<a                             href="qh-io_r.htm#TOC"
  >--------------------------------</a><a name="qh_WHITESPACE">-</a>

  qh_WHITESPACE
    possible values of white space
 }
  qh_WHITESPACE = ' \n\t\v\r\f';  
{-<a                             href="qh-io_r.htm#TOC"
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
{-<a                             href="qh-io_r.htm#TOC"
  >--------------------------------</a><a name="printvridgeT">-</a>

  printvridgeT
    prints results of qh_printvdiagram

  see:
    <a href="io_r.c#printvridge">qh_printvridge</a> for an example
 }
type

  TprintvridgeT = procedure (qh:PqhT; fp:PFILE; vertex:PvertexT; vertexA:PvertexT; centers:PsetT; 
                unbounded:TboolT);cdecl;
{============== -prototypes in alphabetical order ========= }
{ C++ extern C conditionnal removed }

procedure qh_dfacet(qh:PqhT; id:dword);cdecl;external;
procedure qh_dvertex(qh:PqhT; id:dword);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function qh_compare_facetarea(p1:pointer; p2:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function qh_compare_facetvisit(p1:pointer; p2:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function qh_compare_nummerge(p1:pointer; p2:pointer):longint;cdecl;external;
(* Const before type ignored *)
procedure qh_copyfilename(qh:PqhT; filename:Pchar; size:longint; source:Pchar; length:longint);cdecl;external;
procedure qh_countfacets(qh:PqhT; facetlist:PfacetT; facets:PsetT; printall:TboolT; numfacetsp:Plongint; 
            numsimplicialp:Plongint; totneighborsp:Plongint; numridgesp:Plongint; numcoplanarsp:Plongint; numnumtricoplanarsp:Plongint);cdecl;external;
function qh_detvnorm(qh:PqhT; vertex:PvertexT; vertexA:PvertexT; centers:PsetT; offsetp:PrealT):PpointT;cdecl;external;
function qh_detvridge(qh:PqhT; vertex:PvertexT):PsetT;cdecl;external;
function qh_detvridge3(qh:PqhT; atvertex:PvertexT; vertex:PvertexT):PsetT;cdecl;external;
function qh_eachvoronoi(qh:PqhT; fp:PFILE; printvridge:TprintvridgeT; atvertex:PvertexT; visitall:TboolT; 
           innerouter:Tqh_RIDGE; inorder:TboolT):longint;cdecl;external;
function qh_eachvoronoi_all(qh:PqhT; fp:PFILE; printvridge:TprintvridgeT; isUpper:TboolT; innerouter:Tqh_RIDGE; 
           inorder:TboolT):longint;cdecl;external;
procedure qh_facet2point(qh:PqhT; facet:PfacetT; point0:PPpointT; point1:PPpointT; mindist:PrealT);cdecl;external;
function qh_facetvertices(qh:PqhT; facetlist:PfacetT; facets:PsetT; allfacets:TboolT):PsetT;cdecl;external;
procedure qh_geomplanes(qh:PqhT; facet:PfacetT; outerplane:PrealT; innerplane:PrealT);cdecl;external;
procedure qh_markkeep(qh:PqhT; facetlist:PfacetT);cdecl;external;
function qh_markvoronoi(qh:PqhT; facetlist:PfacetT; facets:PsetT; printall:TboolT; isLowerp:PboolT; 
           numcentersp:Plongint):PsetT;cdecl;external;
procedure qh_order_vertexneighbors(qh:PqhT; vertex:PvertexT);cdecl;external;
procedure qh_prepare_output(qh:PqhT);cdecl;external;
procedure qh_printafacet(qh:PqhT; fp:PFILE; format:Tqh_PRINT; facet:PfacetT; printall:TboolT);cdecl;external;
procedure qh_printbegin(qh:PqhT; fp:PFILE; format:Tqh_PRINT; facetlist:PfacetT; facets:PsetT; 
            printall:TboolT);cdecl;external;
(* Const before type ignored *)
procedure qh_printcenter(qh:PqhT; fp:PFILE; format:Tqh_PRINT; _string:Pchar; facet:PfacetT);cdecl;external;
procedure qh_printcentrum(qh:PqhT; fp:PFILE; facet:PfacetT; radius:TrealT);cdecl;external;
procedure qh_printend(qh:PqhT; fp:PFILE; format:Tqh_PRINT; facetlist:PfacetT; facets:PsetT; 
            printall:TboolT);cdecl;external;
procedure qh_printend4geom(qh:PqhT; fp:PFILE; facet:PfacetT; num:Plongint; printall:TboolT);cdecl;external;
procedure qh_printextremes(qh:PqhT; fp:PFILE; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external;
procedure qh_printextremes_2d(qh:PqhT; fp:PFILE; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external;
procedure qh_printextremes_d(qh:PqhT; fp:PFILE; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external;
procedure qh_printfacet(qh:PqhT; fp:PFILE; facet:PfacetT);cdecl;external;
procedure qh_printfacet2math(qh:PqhT; fp:PFILE; facet:PfacetT; format:Tqh_PRINT; notfirst:longint);cdecl;external;
procedure qh_printfacet2geom(qh:PqhT; fp:PFILE; facet:PfacetT; color:array[0..2] of TrealT);cdecl;external;
procedure qh_printfacet2geom_points(qh:PqhT; fp:PFILE; point1:PpointT; point2:PpointT; facet:PfacetT; 
            offset:TrealT; color:array[0..2] of TrealT);cdecl;external;
procedure qh_printfacet3math(qh:PqhT; fp:PFILE; facet:PfacetT; format:Tqh_PRINT; notfirst:longint);cdecl;external;
procedure qh_printfacet3geom_nonsimplicial(qh:PqhT; fp:PFILE; facet:PfacetT; color:array[0..2] of TrealT);cdecl;external;
procedure qh_printfacet3geom_points(qh:PqhT; fp:PFILE; points:PsetT; facet:PfacetT; offset:TrealT; 
            color:array[0..2] of TrealT);cdecl;external;
procedure qh_printfacet3geom_simplicial(qh:PqhT; fp:PFILE; facet:PfacetT; color:array[0..2] of TrealT);cdecl;external;
procedure qh_printfacet3vertex(qh:PqhT; fp:PFILE; facet:PfacetT; format:Tqh_PRINT);cdecl;external;
procedure qh_printfacet4geom_nonsimplicial(qh:PqhT; fp:PFILE; facet:PfacetT; color:array[0..2] of TrealT);cdecl;external;
procedure qh_printfacet4geom_simplicial(qh:PqhT; fp:PFILE; facet:PfacetT; color:array[0..2] of TrealT);cdecl;external;
procedure qh_printfacetNvertex_nonsimplicial(qh:PqhT; fp:PFILE; facet:PfacetT; id:longint; format:Tqh_PRINT);cdecl;external;
procedure qh_printfacetNvertex_simplicial(qh:PqhT; fp:PFILE; facet:PfacetT; format:Tqh_PRINT);cdecl;external;
procedure qh_printfacetheader(qh:PqhT; fp:PFILE; facet:PfacetT);cdecl;external;
procedure qh_printfacetridges(qh:PqhT; fp:PFILE; facet:PfacetT);cdecl;external;
procedure qh_printfacets(qh:PqhT; fp:PFILE; format:Tqh_PRINT; facetlist:PfacetT; facets:PsetT; 
            printall:TboolT);cdecl;external;
procedure qh_printhyperplaneintersection(qh:PqhT; fp:PFILE; facet1:PfacetT; facet2:PfacetT; vertices:PsetT; 
            color:array[0..2] of TrealT);cdecl;external;
procedure qh_printline3geom(qh:PqhT; fp:PFILE; pointA:PpointT; pointB:PpointT; color:array[0..2] of TrealT);cdecl;external;
procedure qh_printneighborhood(qh:PqhT; fp:PFILE; format:Tqh_PRINT; facetA:PfacetT; facetB:PfacetT; 
            printall:TboolT);cdecl;external;
(* Const before type ignored *)
procedure qh_printpoint(qh:PqhT; fp:PFILE; _string:Pchar; point:PpointT);cdecl;external;
(* Const before type ignored *)
procedure qh_printpointid(qh:PqhT; fp:PFILE; _string:Pchar; dim:longint; point:PpointT; 
            id:longint);cdecl;external;
procedure qh_printpoint3(qh:PqhT; fp:PFILE; point:PpointT);cdecl;external;
procedure qh_printpoints_out(qh:PqhT; fp:PFILE; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external;
procedure qh_printpointvect(qh:PqhT; fp:PFILE; point:PpointT; normal:PcoordT; center:PpointT; 
            radius:TrealT; color:array[0..2] of TrealT);cdecl;external;
procedure qh_printpointvect2(qh:PqhT; fp:PFILE; point:PpointT; normal:PcoordT; center:PpointT; 
            radius:TrealT);cdecl;external;
procedure qh_printridge(qh:PqhT; fp:PFILE; ridge:PridgeT);cdecl;external;
procedure qh_printspheres(qh:PqhT; fp:PFILE; vertices:PsetT; radius:TrealT);cdecl;external;
procedure qh_printvdiagram(qh:PqhT; fp:PFILE; format:Tqh_PRINT; facetlist:PfacetT; facets:PsetT; 
            printall:TboolT);cdecl;external;
function qh_printvdiagram2(qh:PqhT; fp:PFILE; printvridge:TprintvridgeT; vertices:PsetT; innerouter:Tqh_RIDGE; 
           inorder:TboolT):longint;cdecl;external;
procedure qh_printvertex(qh:PqhT; fp:PFILE; vertex:PvertexT);cdecl;external;
(* Const before type ignored *)
procedure qh_printvertexlist(qh:PqhT; fp:PFILE; _string:Pchar; facetlist:PfacetT; facets:PsetT; 
            printall:TboolT);cdecl;external;
(* Const before type ignored *)
procedure qh_printvertices(qh:PqhT; fp:PFILE; _string:Pchar; vertices:PsetT);cdecl;external;
procedure qh_printvneighbors(qh:PqhT; fp:PFILE; facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external;
procedure qh_printvoronoi(qh:PqhT; fp:PFILE; format:Tqh_PRINT; facetlist:PfacetT; facets:PsetT; 
            printall:TboolT);cdecl;external;
procedure qh_printvnorm(qh:PqhT; fp:PFILE; vertex:PvertexT; vertexA:PvertexT; centers:PsetT; 
            unbounded:TboolT);cdecl;external;
procedure qh_printvridge(qh:PqhT; fp:PFILE; vertex:PvertexT; vertexA:PvertexT; centers:PsetT; 
            unbounded:TboolT);cdecl;external;
procedure qh_produce_output(qh:PqhT);cdecl;external;
procedure qh_produce_output2(qh:PqhT);cdecl;external;
procedure qh_projectdim3(qh:PqhT; source:PpointT; destination:PpointT);cdecl;external;
(* Const before type ignored *)
function qh_readfeasible(qh:PqhT; dim:longint; curline:Pchar):longint;cdecl;external;
function qh_readpoints(qh:PqhT; numpoints:Plongint; dimension:Plongint; ismalloc:PboolT):PcoordT;cdecl;external;
procedure qh_setfeasible(qh:PqhT; dim:longint);cdecl;external;
function qh_skipfacet(qh:PqhT; facet:PfacetT):TboolT;cdecl;external;
function qh_skipfilename(qh:PqhT; filename:Pchar):Pchar;cdecl;external;
{$endif}
{ qhDEFio  }

implementation


end.
