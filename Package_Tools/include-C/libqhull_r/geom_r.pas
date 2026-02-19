unit geom_r;

interface

uses
  fp_qhull_r;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-geom_r.htm"
  >-------------------------------</a><a name="TOP">-</a>

  geom_r.h
    header file for geometric routines

   see qh-geom_r.htm and geom_r.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull_r/geom_r.h#2 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $
 }
{$ifndef qhDEFgeom}

const
  qhDEFgeom = 1;  
{$include "libqhull_r.h"}

procedure qh_backnormal(qh:PqhT; rows:PPrealT; numrow:longint; numcol:longint; sign:TboolT; 
            normal:PcoordT; nearzero:PboolT);cdecl;external libqhull_r;
procedure qh_distplane(qh:PqhT; point:PpointT; facet:PfacetT; dist:PrealT);cdecl;external libqhull_r;
function qh_findbest(qh:PqhT; point:PpointT; startfacet:PfacetT; bestoutside:TboolT; isnewfacets:TboolT; 
           noupper:TboolT; dist:PrealT; isoutside:PboolT; numpart:Plongint):PfacetT;cdecl;external libqhull_r;
function qh_findbesthorizon(qh:PqhT; ischeckmax:TboolT; point:PpointT; startfacet:PfacetT; noupper:TboolT; 
           bestdist:PrealT; numpart:Plongint):PfacetT;cdecl;external libqhull_r;
function qh_findbestnew(qh:PqhT; point:PpointT; startfacet:PfacetT; dist:PrealT; bestoutside:TboolT; 
           isoutside:PboolT; numpart:Plongint):PfacetT;cdecl;external libqhull_r;
procedure qh_gausselim(qh:PqhT; rows:PPrealT; numrow:longint; numcol:longint; sign:PboolT; 
            nearzero:PboolT);cdecl;external libqhull_r;
function qh_getangle(qh:PqhT; vect1:PpointT; vect2:PpointT):TrealT;cdecl;external libqhull_r;
function qh_getcenter(qh:PqhT; vertices:PsetT):PpointT;cdecl;external libqhull_r;
function qh_getcentrum(qh:PqhT; facet:PfacetT):PpointT;cdecl;external libqhull_r;
function qh_getdistance(qh:PqhT; facet:PfacetT; neighbor:PfacetT; mindist:PcoordT; maxdist:PcoordT):TcoordT;cdecl;external libqhull_r;
procedure qh_normalize(qh:PqhT; normal:PcoordT; dim:longint; toporient:TboolT);cdecl;external libqhull_r;
procedure qh_normalize2(qh:PqhT; normal:PcoordT; dim:longint; toporient:TboolT; minnorm:PrealT; 
            ismin:PboolT);cdecl;external libqhull_r;
function qh_projectpoint(qh:PqhT; point:PpointT; facet:PfacetT; dist:TrealT):PpointT;cdecl;external libqhull_r;
procedure qh_setfacetplane(qh:PqhT; newfacets:PfacetT);cdecl;external libqhull_r;
procedure qh_sethyperplane_det(qh:PqhT; dim:longint; rows:PPcoordT; point0:PcoordT; toporient:TboolT; 
            normal:PcoordT; offset:PrealT; nearzero:PboolT);cdecl;external libqhull_r;
procedure qh_sethyperplane_gauss(qh:PqhT; dim:longint; rows:PPcoordT; point0:PpointT; toporient:TboolT; 
            normal:PcoordT; offset:PcoordT; nearzero:PboolT);cdecl;external libqhull_r;
function qh_sharpnewfacets(qh:PqhT):TboolT;cdecl;external libqhull_r;
{========= infrequently used code in geom2_r.c ============= }
function qh_copypoints(qh:PqhT; points:PcoordT; numpoints:longint; dimension:longint):PcoordT;cdecl;external libqhull_r;
procedure qh_crossproduct(dim:longint; vecA:array[0..2] of TrealT; vecB:array[0..2] of TrealT; vecC:array[0..2] of TrealT);cdecl;external libqhull_r;
function qh_determinant(qh:PqhT; rows:PPrealT; dim:longint; nearzero:PboolT):TrealT;cdecl;external libqhull_r;
function qh_detjoggle(qh:PqhT; points:PpointT; numpoints:longint; dimension:longint):TrealT;cdecl;external libqhull_r;
procedure qh_detmaxoutside(qh:PqhT);cdecl;external libqhull_r;
procedure qh_detroundoff(qh:PqhT);cdecl;external libqhull_r;
function qh_detsimplex(qh:PqhT; apex:PpointT; points:PsetT; dim:longint; nearzero:PboolT):TrealT;cdecl;external libqhull_r;
function qh_distnorm(dim:longint; point:PpointT; normal:PpointT; offsetp:PrealT):TrealT;cdecl;external libqhull_r;
function qh_distround(qh:PqhT; dimension:longint; maxabs:TrealT; maxsumabs:TrealT):TrealT;cdecl;external libqhull_r;
function qh_divzero(numer:TrealT; denom:TrealT; mindenom1:TrealT; zerodiv:PboolT):TrealT;cdecl;external libqhull_r;
function qh_facetarea(qh:PqhT; facet:PfacetT):TrealT;cdecl;external libqhull_r;
function qh_facetarea_simplex(qh:PqhT; dim:longint; apex:PcoordT; vertices:PsetT; notvertex:PvertexT; 
           toporient:TboolT; normal:PcoordT; offset:PrealT):TrealT;cdecl;external libqhull_r;
function qh_facetcenter(qh:PqhT; vertices:PsetT):PpointT;cdecl;external libqhull_r;
function qh_findgooddist(qh:PqhT; point:PpointT; facetA:PfacetT; distp:PrealT; facetlist:PPfacetT):PfacetT;cdecl;external libqhull_r;
{ qh.newvertex_list  }function qh_furthestnewvertex(qh:PqhT; unvisited:dword; facet:PfacetT; maxdistp:PrealT):PvertexT;cdecl;external libqhull_r;
function qh_furthestvertex(qh:PqhT; facetA:PfacetT; facetB:PfacetT; maxdistp:PrealT; mindistp:PrealT):PvertexT;cdecl;external libqhull_r;
procedure qh_getarea(qh:PqhT; facetlist:PfacetT);cdecl;external libqhull_r;
function qh_gram_schmidt(qh:PqhT; dim:longint; rows:PPrealT):TboolT;cdecl;external libqhull_r;
function qh_inthresholds(qh:PqhT; normal:PcoordT; angle:PrealT):TboolT;cdecl;external libqhull_r;
procedure qh_joggleinput(qh:PqhT);cdecl;external libqhull_r;
function qh_maxabsval(normal:PrealT; dim:longint):PrealT;cdecl;external libqhull_r;
function qh_maxmin(qh:PqhT; points:PpointT; numpoints:longint; dimension:longint):PsetT;cdecl;external libqhull_r;
function qh_maxouter(qh:PqhT):TrealT;cdecl;external libqhull_r;
procedure qh_maxsimplex(qh:PqhT; dim:longint; maxpoints:PsetT; points:PpointT; numpoints:longint; 
            simplex:PPsetT);cdecl;external libqhull_r;
function qh_minabsval(normal:PrealT; dim:longint):TrealT;cdecl;external libqhull_r;
function qh_mindiff(vecA:PrealT; vecB:PrealT; dim:longint):longint;cdecl;external libqhull_r;
function qh_orientoutside(qh:PqhT; facet:PfacetT):TboolT;cdecl;external libqhull_r;
procedure qh_outerinner(qh:PqhT; facet:PfacetT; outerplane:PrealT; innerplane:PrealT);cdecl;external libqhull_r;
function qh_pointdist(point1:PpointT; point2:PpointT; dim:longint):TcoordT;cdecl;external libqhull_r;
procedure qh_printmatrix(qh:PqhT; fp:PFILE; _string:Pchar; rows:PPrealT; numrow:longint; 
            numcol:longint);cdecl;external libqhull_r;
procedure qh_printpoints(qh:PqhT; fp:PFILE; _string:Pchar; points:PsetT);cdecl;external libqhull_r;
procedure qh_projectinput(qh:PqhT);cdecl;external libqhull_r;
procedure qh_projectpoints(qh:PqhT; project:Pchar; n:longint; points:PrealT; numpoints:longint; 
            dim:longint; newpoints:PrealT; newdim:longint);cdecl;external libqhull_r;
procedure qh_rotateinput(qh:PqhT; rows:PPrealT);cdecl;external libqhull_r;
procedure qh_rotatepoints(qh:PqhT; points:PrealT; numpoints:longint; dim:longint; rows:PPrealT);cdecl;external libqhull_r;
procedure qh_scaleinput(qh:PqhT);cdecl;external libqhull_r;
procedure qh_scalelast(qh:PqhT; points:PcoordT; numpoints:longint; dim:longint; low:TcoordT; 
            high:TcoordT; newhigh:TcoordT);cdecl;external libqhull_r;
procedure qh_scalepoints(qh:PqhT; points:PpointT; numpoints:longint; dim:longint; newlows:PrealT; 
            newhighs:PrealT);cdecl;external libqhull_r;
function qh_sethalfspace(qh:PqhT; dim:longint; coords:PcoordT; nextp:PPcoordT; normal:PcoordT; 
           offset:PcoordT; feasible:PcoordT):TboolT;cdecl;external libqhull_r;
function qh_sethalfspace_all(qh:PqhT; dim:longint; count:longint; halfspaces:PcoordT; feasible:PpointT):PcoordT;cdecl;external libqhull_r;
function qh_vertex_bestdist(qh:PqhT; vertices:PsetT):TcoordT;cdecl;external libqhull_r;
function qh_vertex_bestdist2(qh:PqhT; vertices:PsetT; vertexp:PPvertexT; vertexp2:PPvertexT):TcoordT;cdecl;external libqhull_r;
function qh_voronoi_center(qh:PqhT; dim:longint; points:PsetT):PpointT;cdecl;external libqhull_r;

// === Konventiert am: 19-2-26 17:34:30 ===


implementation



end.
