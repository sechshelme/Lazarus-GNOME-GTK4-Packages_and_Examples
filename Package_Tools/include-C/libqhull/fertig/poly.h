/*<html><pre>  -<a                             href="qh-poly.htm"
  >-------------------------------</a><a name="TOP">-</a>

   poly.h
   header file for poly.c and poly2.c

   see qh-poly.htm, libqhull.h and poly.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull/poly.h#5 $$Change: 2963 $
   $DateTime: 2020/06/03 19:31:01 $$Author: bbarber $
*/

#ifndef qhDEFpoly
#define qhDEFpoly 1

#include "libqhull.h"

/*===============   constants ========================== */

/*-<a                             href="qh-geom.htm#TOC"
  >--------------------------------</a><a name="ALGORITHMfault">-</a>

  qh_ALGORITHMfault
    use as argument to checkconvex() to report errors during buildhull
*/
#define qh_ALGORITHMfault 0

/*-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="DATAfault">-</a>

  qh_DATAfault
    use as argument to checkconvex() to report errors during initialhull
*/
#define qh_DATAfault 1

/*-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="DUPLICATEridge">-</a>

  qh_DUPLICATEridge
    special value for facet->neighbor to indicate a duplicate ridge

  notes:
    set by qh_matchneighbor for qh_matchdupridge
*/
#define qh_DUPLICATEridge (facetT *)1L

/*-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="MERGEridge">-</a>

  qh_MERGEridge       flag in facet
    special value for facet->neighbor to indicate a duplicate ridge that needs merging

  notes:
    set by qh_matchnewfacets..qh_matchdupridge from qh_DUPLICATEridge
    used by qh_mark_dupridges to set facet->mergeridge, facet->mergeridge2 from facet->dupridge
*/
#define qh_MERGEridge (facetT *)2L


/*============ -structures- ====================*/

/*=========== -macros- =========================*/

/*-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="FORALLfacet_">-</a>

  FORALLfacet_( facetlist ) { ... }
    assign 'facet' to each facet in facetlist

  notes:
    uses 'facetT *facet;'
    assumes last facet is a sentinel

  see:
    FORALLfacets
*/


/*=============== prototypes poly.c in alphabetical order ================*/

void    qh_appendfacet(facetT *facet);
void    qh_appendvertex(vertexT *vertex);
void    qh_attachnewfacets(void /* qh.visible_list, qh.newfacet_list */);
boolT   qh_checkflipped(facetT *facet, realT *dist, boolT allerror);
void    qh_delfacet(facetT *facet);
void    qh_deletevisible(void /* qh.visible_list, qh.horizon_list */);
setT   *qh_facetintersect(facetT *facetA, facetT *facetB, int *skipAp,int *skipBp, int extra);
int     qh_gethash(int hashsize, setT *set, int size, int firstindex, void *skipelem);
facetT *qh_getreplacement(facetT *visible);
facetT *qh_makenewfacet(setT *vertices, boolT toporient, facetT *facet);
void    qh_makenewplanes(void /* qh.newfacet_list */);
facetT *qh_makenew_nonsimplicial(facetT *visible, vertexT *apex, int *numnew);
facetT *qh_makenew_simplicial(facetT *visible, vertexT *apex, int *numnew);
void    qh_matchneighbor(facetT *newfacet, int newskip, int hashsize,
                          int *hashcount);
coordT  qh_matchnewfacets(void);
boolT   qh_matchvertices(int firstindex, setT *verticesA, int skipA,
                          setT *verticesB, int *skipB, boolT *same);
facetT *qh_newfacet(void);
ridgeT *qh_newridge(void);
int     qh_pointid(pointT *point);
void    qh_removefacet(facetT *facet);
void    qh_removevertex(vertexT *vertex);
void    qh_update_vertexneighbors(void);
void    qh_update_vertexneighbors_cone(void);


/*========== -prototypes poly2.c in alphabetical order ===========*/

boolT   qh_addfacetvertex(facetT *facet, vertexT *newvertex);
void    qh_addhash(void *newelem, setT *hashtable, int hashsize, int hash);
void    qh_check_bestdist(void);
void    qh_check_maxout(void);
void    qh_check_output(void);
void    qh_check_point(pointT *point, facetT *facet, realT *maxoutside, realT *maxdist, facetT **errfacet1, facetT **errfacet2, int *errcount);
void    qh_check_points(void);
void    qh_checkconvex(facetT *facetlist, int fault);
void    qh_checkfacet(facetT *facet, boolT newmerge, boolT *waserrorp);
void    qh_checkflipped_all(facetT *facetlist);
boolT   qh_checklists(facetT *facetlist);
void    qh_checkpolygon(facetT *facetlist);
void    qh_checkvertex(vertexT *vertex, boolT allchecks, boolT *waserrorp);
void    qh_clearcenters(qh_CENTER type);
void    qh_createsimplex(setT *vertices);
void    qh_delridge(ridgeT *ridge);
void    qh_delvertex(vertexT *vertex);
setT   *qh_facet3vertex(facetT *facet);
facetT *qh_findbestfacet(pointT *point, boolT bestoutside,
           realT *bestdist, boolT *isoutside);
facetT *qh_findbestlower(facetT *upperfacet, pointT *point, realT *bestdistp, int *numpart);
facetT *qh_findfacet_all(pointT *point, boolT noupper, realT *bestdist, boolT *isoutside,
                          int *numpart);
int     qh_findgood(facetT *facetlist, int goodhorizon);
void    qh_findgood_all(facetT *facetlist);
void    qh_furthestnext(void /* qh.facet_list */);
void    qh_furthestout(facetT *facet);
void    qh_infiniteloop(facetT *facet);
void    qh_initbuild(void);
void    qh_initialhull(setT *vertices);
setT   *qh_initialvertices(int dim, setT *maxpoints, pointT *points, int numpoints);
vertexT *qh_isvertex(pointT *point, setT *vertices);
vertexT *qh_makenewfacets(pointT *point /* qh.horizon_list, visible_list */);
coordT  qh_matchdupridge(facetT *atfacet, int atskip, int hashsize, int *hashcount);
void    qh_nearcoplanar(void /* qh.facet_list */);
vertexT *qh_nearvertex(facetT *facet, pointT *point, realT *bestdistp);
int     qh_newhashtable(int newsize);
vertexT *qh_newvertex(pointT *point);
facetT *qh_nextfacet2d(facetT *facet, vertexT **nextvertexp);
ridgeT *qh_nextridge3d(ridgeT *atridge, facetT *facet, vertexT **vertexp);
vertexT *qh_opposite_vertex(facetT *facetA,  facetT *neighbor);
void    qh_outcoplanar(void /* qh.facet_list */);
pointT *qh_point(int id);
void    qh_point_add(setT *set, pointT *point, void *elem);
setT   *qh_pointfacet(void /* qh.facet_list */);
setT   *qh_pointvertex(void /* qh.facet_list */);
void    qh_prependfacet(facetT *facet, facetT **facetlist);
void    qh_printhashtable(FILE *fp);
void    qh_printlists(void);
void    qh_replacefacetvertex(facetT *facet, vertexT *oldvertex, vertexT *newvertex);
void    qh_resetlists(boolT stats, boolT resetVisible /* qh.newvertex_list qh.newfacet_list qh.visible_list */);
void    qh_setvoronoi_all(void);
void    qh_triangulate(void /* qh.facet_list */);
void    qh_triangulate_facet(facetT *facetA, vertexT **first_vertex);
void    qh_triangulate_link(facetT *oldfacetA, facetT *facetA, facetT *oldfacetB, facetT *facetB);
void    qh_triangulate_mirror(facetT *facetA, facetT *facetB);
void    qh_triangulate_null(facetT *facetA);
void    qh_vertexintersect(setT **vertexsetA,setT *vertexsetB);
setT   *qh_vertexintersect_new(setT *vertexsetA,setT *vertexsetB);
void    qh_vertexneighbors(void /* qh.facet_list */);
boolT   qh_vertexsubset(setT *vertexsetA, setT *vertexsetB);

#endif /* qhDEFpoly */
