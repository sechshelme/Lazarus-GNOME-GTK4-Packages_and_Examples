unit libqhull;

interface

uses
  fp_qhull;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-qhull.htm"
  >-------------------------------</a><a name="TOP">-</a>

   libqhull.h
   user-level header file for using qhull.a library

   see qh-qhull.htm, qhull_a.h

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull/libqhull.h#11 $$Change: 2958 $
   $DateTime: 2020/05/26 16:17:49 $$Author: bbarber $

   NOTE: access to qh_qh is via the 'qh' macro.  This allows
   qh_qh to be either a pointer or a structure.  An example
   of using qh is "qh.DROPdim" which accesses the DROPdim
   field of qh_qh.  Similarly, access to qh_qhstat is via
   the 'qhstat' macro.

   includes function prototypes for libqhull.c, geom.c, global.c, io.c, user.c

   use mem.h for mem.c
   use qset.h for qset.c

   see unix.c for an example of using libqhull.h

   recompile qhull if you change this file
 }
{$ifndef qhDEFlibqhull}

const
  qhDEFlibqhull = 1;  
{=========================== -included files ============== }
{ user.h first for QHULL_CRTDBG  }
{$include "user.h"      /* user definable constants (e.g., realT). */}
{$include "mem.h"   /* Needed for qhT in libqhull_r.h.  Here for compatibility */}
{$include "qset.h"   /* Needed for QHULL_LIB_CHECK */}
{ include stat.h after defining boolT.  Needed for qhT in libqhull_r.h.  Here for compatibility  }
{$include <setjmp.h>}
{$include <float.h>}
{$include <limits.h>}
{$include <time.h>}
{$include <stdio.h>}
{$if defined(__MWERKS__) && defined(__POWERPC__)}
{$include  <SIOUX.h>}
{$include  <Files.h>}
{$include        <Desk.h>}
{$endif}
{$ifndef __STDC__}
{$ifndef __cplusplus}
{$if     !defined(_MSC_VER)}
{$error  Neither __STDC__ nor __cplusplus is defined.  Please use strict ANSI C or C++ to compile}
{$error  Qhull.  You may need to turn off compiler extensions in your project configuration.  If}
{$error  your compiler is a standard C compiler, you can delete this warning from libqhull.h}
{$endif}
{$endif}
{$endif}
{============ constants and basic types ==================== }
  var
    qh_version : Pchar;cvar;external libqhull;
{ defined in global.c  }
    qh_version2 : Pchar;cvar;external libqhull;
{ defined in global.c  }
{-<a                             href="qh-geom.htm#TOC"
  >--------------------------------</a><a name="coordT">-</a>

  coordT
    coordinates and coefficients are stored as realT (i.e., double)

  notes:
    Qhull works well if realT is 'float'.  If so joggle (QJ) is not effective.

    Could use 'float' for data and 'double' for calculations (realT vs. coordT)
      This requires many type casts, and adjusted error bounds.
      Also C compilers may do expressions in double anyway.
 }

const
  coordT = realT;  
{-<a                             href="qh-geom.htm#TOC"
  >--------------------------------</a><a name="pointT">-</a>

  pointT
    a point is an array of coordinates, usually qh.hull_dim
    qh_pointid returns
      qh_IDnone if point==0 or qh is undefined
      qh_IDinterior for qh.interior_point
      qh_IDunknown if point is neither in qh.first_point... nor qh.other_points

  notes:
    qh.STOPcone and qh.STOPpoint assume that qh_IDunknown==-1 (other negative numbers indicate points)
    qh_IDunknown is also returned by getid_() for unknown facet, ridge, or vertex
 }
  pointT = coordT;  
type
  Pqh_pointT = ^Tqh_pointT;
  Tqh_pointT =  Longint;
  Const
    qh_IDnone = -(3);
    qh_IDinterior = -(2);
    qh_IDunknown = -(1);
;
{-<a                             href="qh-qhull.htm#TOC"
  >--------------------------------</a><a name="flagT">-</a>

  flagT
    Boolean flag as a bit
 }
  flagT = dword;  
{-<a                             href="qh-qhull.htm#TOC"
  >--------------------------------</a><a name="boolT">-</a>

  boolT
    boolean value, either True or False

  notes:
    needed for portability
    Use qh_False/qh_True as synonyms
 }
  boolT = dword;  
{$ifdef False}
{$undef False}
{$endif}
{$ifdef True}
{$undef True}
{$endif}

const
  False = 0;  
  True = 1;  
  qh_False = 0;  
  qh_True = 1;  
{$include "stat.h"  /* needs boolT */}
{-<a                             href="qh-qhull.htm#TOC"
  >--------------------------------</a><a name="CENTERtype">-</a>

  qh_CENTER
    to distinguish facet->center
 }
{ If not MERGING and not VORONOI  }
{ Set by qh_clearcenters on qh_prepare_output, or if not MERGING and VORONOI  }
{ If MERGING (assumed during merging)  }
type
  Pqh_CENTER = ^Tqh_CENTER;
  Tqh_CENTER =  Longint;
  Const
    qh_ASnone = 0;
    qh_ASvoronoi = 1;
    qh_AScentrum = 2;
;
{-<a                             href="qh-qhull.htm#TOC"
  >--------------------------------</a><a name="qh_PRINT">-</a>

  qh_PRINT
    output formats for printing (qh.PRINTout).
    'Fa' 'FV' 'Fc' 'FC'


   notes:
   some of these names are similar to qhT names.  The similar names are only
   used in switch statements in qh_printbegin() etc.
 }
{ 'Fa' 'FV' 'Fc' 'FC'  }
{ 'f' 'FF' 'G' 'FI' 'Fi' 'Fn'  }
{ 'n' 'Fo' 'i' 'm' 'Fm' 'FM', 'o'  }
{ 'FO' 'Fp' 'FP' 'p' 'FQ' 'FS'  }
{ 'Fs' 'Ft' 'Fv' 'FN' 'Fx'  }
type
  Pqh_PRINT = ^Tqh_PRINT;
  Tqh_PRINT =  Longint;
  Const
    qh_PRINTnone = 0;
    qh_PRINTarea = 1;
    qh_PRINTaverage = 2;
    qh_PRINTcoplanars = 3;
    qh_PRINTcentrums = 4;
    qh_PRINTfacets = 5;
    qh_PRINTfacets_xridge = 6;
    qh_PRINTgeom = 7;
    qh_PRINTids = 8;
    qh_PRINTinner = 9;
    qh_PRINTneighbors = 10;
    qh_PRINTnormals = 11;
    qh_PRINTouter = 12;
    qh_PRINTmaple = 13;
    qh_PRINTincidences = 14;
    qh_PRINTmathematica = 15;
    qh_PRINTmerges = 16;
    qh_PRINToff = 17;
    qh_PRINToptions = 18;
    qh_PRINTpointintersect = 19;
    qh_PRINTpointnearest = 20;
    qh_PRINTpoints = 21;
    qh_PRINTqhull = 22;
    qh_PRINTsize = 23;
    qh_PRINTsummary = 24;
    qh_PRINTtriangles = 25;
    qh_PRINTvertices = 26;
    qh_PRINTvneighbors = 27;
    qh_PRINTextremes = 28;
    qh_PRINTEND = 29;
;
{-<a                             href="qh-qhull.htm#TOC"
  >--------------------------------</a><a name="qh_ALL">-</a>

  qh_ALL
    argument flag for selecting everything
 }
  qh_ALL = _True;  
{ argument for qh_findbest  }
  qh_NOupper = _True;  
{ argument for qh_findbesthorizon  }
  qh_IScheckmax = _True;  
{ argument for qh_findbest  }
  qh_ISnewfacets = _True;  
{ argument for qh_resetlists  }
  qh_RESETvisible = _True;  
{-<a                             href="qh-qhull.htm#TOC"
  >--------------------------------</a><a name="qh_ERR">-</a>

  qh_ERR...
    Qhull exit status codes, for indicating errors
    See: MSG_ERROR (6000) and MSG_WARNING (7000) [user.h]
 }
{ no error occurred during qhull  }
  qh_ERRnone = 0;  
{ input inconsistency  }
  qh_ERRinput = 1;  
{ singular input data, calls qh_printhelp_singular  }
  qh_ERRsingular = 2;  
{ precision error, calls qh_printhelp_degenerate  }
  qh_ERRprec = 3;  
{ insufficient memory, matches mem.h  }
  qh_ERRmem = 4;  
{ internal error detected, matches mem.h, calls qh_printhelp_internal  }
  qh_ERRqhull = 5;  
{ other error detected  }
  qh_ERRother = 6;  
{ topology error, maybe due to nearly adjacent vertices, calls qh_printhelp_topology  }
  qh_ERRtopology = 7;  
{ wide facet error, maybe due to nearly adjacent vertices, calls qh_printhelp_wide  }
  qh_ERRwide = 8;  
{ qh_errexit from debugging code  }
  qh_ERRdebug = 9;  
{-<a                             href="qh-qhull.htm#TOC"
>--------------------------------</a><a name="qh_FILEstderr">-</a>

qh_FILEstderr
Fake stderr to distinguish error output from normal output
For C++ interface.  Must redefine qh_fprintf_qhull
 }

{ was #define dname def_expr }
function qh_FILEstderr : PFILE;  

{ ============ -structures- ====================
   each of the following structures is defined by a typedef
   all realT and coordT fields occur at the beginning of a structure
        (otherwise space may be wasted due to alignment)
   define all flags together and pack into 32-bit number

   DEFsetT is likewise defined in mem.h and qset.h
 }
type
{$ifndef DEFsetT}

const
  DEFsetT = 1;  
type
{ defined in qset.h  }
{$endif}
{-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="facetT">-</a>

  facetT
    defines a facet

  notes:
   qhull() generates the hull as a list of facets.

  topological information:
    f.previous,next     doubly-linked list of facets, next is always defined
    f.vertices          set of vertices
    f.ridges            set of ridges
    f.neighbors         set of neighbors
    f.toporient         True if facet has top-orientation (else bottom)

  geometric information:
    f.offset,normal     hyperplane equation
    f.maxoutside        offset to outer plane -- all points inside
    f.center            centrum for testing convexity or Voronoi center for output
    f.simplicial        True if facet is simplicial
    f.flipped           True if facet does not include qh.interior_point

  for constructing hull:
    f.visible           True if facet on list of visible facets (will be deleted)
    f.newfacet          True if facet on list of newly created facets
    f.coplanarset       set of points coplanar with this facet
                        (includes near-inside points for later testing)
    f.outsideset        set of points outside of this facet
    f.furthestdist      distance to furthest point of outside set
    f.visitid           marks visited facets during a loop
    f.replace           replacement facet for to-be-deleted, visible facets
    f.samecycle,newcycle cycle of facets for merging into horizon facet

  see below for other flags and fields
 }
{$if !qh_COMPUTEfurthest}
{ distance to furthest point of outsideset  }
{$endif}
{$if qh_MAXoutside}
{ max computed distance of point to facet
                        Before QHULLfinished this is an approximation
                        since maxdist not always set for qh_mergefacet
                        Actual outer plane is +DISTround and
                        computed outer plane is +2*DISTround.
                        Initial maxoutside is qh.DISTround, otherwise distance tests need to account for DISTround  }
{$endif}
{ exact offset of hyperplane from origin  }
{ normal of hyperplane, hull_dim coefficients  }
{   if f.tricoplanar, shared with a neighbor  }
{ in order of testing  }
{ area of facet, only in io.c if  f.isarea  }
{ replacement facet for qh.NEWfacets with f.visible
                             NULL if qh_mergedegen_redundant, interior, or !NEWfacets  }
{ cycle of facets from the same visible/horizon intersection,
                             if ->newfacet  }
{  in horizon facet, current samecycle of new facets  }
{ visible facet for ->tricoplanar facets during qh_triangulate()  }
{ owner facet for ->tricoplanar, !isarea facets w/ ->keepcentrum  }
{ set according to qh.CENTERtype  }
{   qh_ASnone:    no center (not MERGING)  }
{   qh_AScentrum: centrum for testing convexity (qh_getcentrum)  }
{                 assumed qh_AScentrum while merging  }
{   qh_ASvoronoi: Voronoi center (qh_facetcenter)  }
{ after constructing the hull, it may be changed (qh_clearcenter)  }
{ if tricoplanar and !keepcentrum, shared with a neighbor  }
{ previous facet in the facet_list or NULL, for C++ interface  }
{ next facet in the facet_list or facet_tail  }
{ vertices for this facet, inverse sorted by ID
                           if simplicial, 1st vertex was apex/furthest
                           qh_reduce_vertices removes extraneous vertices via qh_remove_extravertices
                           if f.visible, vertices may be on qh.del_vertices  }
{ explicit ridges for nonsimplicial facets or nonsimplicial neighbors.
                           For simplicial facets, neighbors define the ridges
                           qh_makeridges() converts simplicial facets by creating ridges prior to merging
                           If qh.NEWtentative, new facets have horizon ridge, but not vice versa
                           if f.visible && qh.NEWfacets, ridges is empty  }
{ neighbors of the facet.  Neighbors may be f.visible
                           If simplicial, the kth neighbor is opposite the kth vertex and the
                           first neighbor is the horizon facet for the first vertex.
                           dupridges marked by qh_DUPLICATEridge (0x01) and qh_MERGEridge (0x02)
                           if f.visible && qh.NEWfacets, neighbors is empty  }
{ set of points outside this facet
                           if non-empty, last point is furthest
                           if NARROWhull, includes coplanars (less than qh.MINoutside) for partitioning }
{ set of points coplanar with this facet
                           >= qh.min_vertex and <= facet->max_outside
                           a point is assigned to the furthest facet
                           if non-empty, last point is furthest away  }
{ visit_id, for visiting all neighbors,
                           all uses are independent  }
{ unique identifier from qh.facet_id, 1..qh.facet_id, 0 is sentinel, printed as 'f%d'  }
{ number of merges  }
{ 23 flags (at most 23 due to nummerge), printed by "flags:" in io.c  }
{ True if TRIangulate and simplicial and coplanar with a neighbor  }
{   all tricoplanars share the same apex  }
{   all tricoplanars share the same ->center, ->normal, ->offset, ->maxoutside  }
{     ->keepcentrum is true for the owner.  It has the ->coplanareset  }
{   if ->degenerate, does not span facet (one logical ridge)  }
{   during qh_triangulate, f.trivisible points to original facet  }
{ True if facet on qh.newfacet_list (new/qh.first_newfacet or merged)  }
{ True if visible facet (will be deleted)  }
{ True if created with top orientation
                           after merging, use ridge orientation  }
{ True if simplicial facet, ->ridges may be implicit  }
{ used to perform operations only once, like visitid  }
{ used to perform operations only once, like visitid  }
{ True if facet is flipped  }
{ True if facet is upper envelope of Delaunay triangulation  }
{ True if last point of outsideset is not furthest  }
{-------- flags primarily for output --------- }
{ True if a facet marked good for output  }
{ True if facet->f.area is defined  }
{-------- flags for merging ------------------ }
{ True if facet has one or more dupridge in a new facet (qh_matchneighbor),
                             a dupridge has a subridge shared by more than one new facet  }
{ True if facet or neighbor has a qh_MERGEridge (qh_mark_dupridges)
                            ->normal defined for mergeridge and mergeridge2  }
{ True if neighbor has a qh_MERGEridge (qh_mark_dupridges)  }
{ True if horizon facet is coplanar at last use  }
{ True if will merge into horizon (its first neighbor w/ f.coplanarhorizon).  }
{ True if mergecycle_all already done  }
{ True if facet convexity has been tested (false after merge  }
{ True if keep old centrum after a merge, or marks owner for ->tricoplanar
                             Set by qh_updatetested if more than qh_MAXnewcentrum extra vertices
                             Set by qh_mergefacet if |maxdist| > qh.WIDEfacet  }
{ True if facet is newly merged for reducevertices  }
{ True if facet is degenerate (degen_mergeset or ->tricoplanar)  }
{ True if facet is redundant (degen_mergeset)
                         Maybe merge degenerate and redundant to gain another flag  }
type
  PfacetT = ^TfacetT;
  TfacetT = record
      furthestdist : TcoordT;
      maxoutside : TcoordT;
      offset : TcoordT;
      normal : PcoordT;
      f : record
          case longint of
            0 : ( area : TrealT );
            1 : ( replace : PfacetT );
            2 : ( samecycle : PfacetT );
            3 : ( newcycle : PfacetT );
            4 : ( trivisible : PfacetT );
            5 : ( triowner : PfacetT );
          end;
      center : PcoordT;
      previous : PfacetT;
      next : PfacetT;
      vertices : PsetT;
      ridges : PsetT;
      neighbors : PsetT;
      outsideset : PsetT;
      coplanarset : PsetT;
      visitid : dword;
      id : dword;
      flag0 : longint;
    end;


const
  bm_TfacetT_nummerge = $1FF;
  bp_TfacetT_nummerge = 0;
  bm_TfacetT_tricoplanar = $200;
  bp_TfacetT_tricoplanar = 9;
  bm_TfacetT_newfacet = $400;
  bp_TfacetT_newfacet = 10;
  bm_TfacetT_visible = $800;
  bp_TfacetT_visible = 11;
  bm_TfacetT_toporient = $1000;
  bp_TfacetT_toporient = 12;
  bm_TfacetT_simplicial = $2000;
  bp_TfacetT_simplicial = 13;
  bm_TfacetT_seen = $4000;
  bp_TfacetT_seen = 14;
  bm_TfacetT_seen2 = $8000;
  bp_TfacetT_seen2 = 15;
  bm_TfacetT_flipped = $10000;
  bp_TfacetT_flipped = 16;
  bm_TfacetT_upperdelaunay = $20000;
  bp_TfacetT_upperdelaunay = 17;
  bm_TfacetT_notfurthest = $40000;
  bp_TfacetT_notfurthest = 18;
  bm_TfacetT_good = $80000;
  bp_TfacetT_good = 19;
  bm_TfacetT_isarea = $100000;
  bp_TfacetT_isarea = 20;
  bm_TfacetT_dupridge = $200000;
  bp_TfacetT_dupridge = 21;
  bm_TfacetT_mergeridge = $400000;
  bp_TfacetT_mergeridge = 22;
  bm_TfacetT_mergeridge2 = $800000;
  bp_TfacetT_mergeridge2 = 23;
  bm_TfacetT_coplanarhorizon = $1000000;
  bp_TfacetT_coplanarhorizon = 24;
  bm_TfacetT_mergehorizon = $2000000;
  bp_TfacetT_mergehorizon = 25;
  bm_TfacetT_cycledone = $4000000;
  bp_TfacetT_cycledone = 26;
  bm_TfacetT_tested = $8000000;
  bp_TfacetT_tested = 27;
  bm_TfacetT_keepcentrum = $10000000;
  bp_TfacetT_keepcentrum = 28;
  bm_TfacetT_newmerge = $20000000;
  bp_TfacetT_newmerge = 29;
  bm_TfacetT_degenerate = $40000000;
  bp_TfacetT_degenerate = 30;
  bm_TfacetT_redundant = $80000000;
  bp_TfacetT_redundant = 31;

function nummerge(var a : TfacetT) : dword;
procedure set_nummerge(var a : TfacetT; __nummerge : dword);
function tricoplanar(var a : TfacetT) : TflagT;
procedure set_tricoplanar(var a : TfacetT; __tricoplanar : TflagT);
function newfacet(var a : TfacetT) : TflagT;
procedure set_newfacet(var a : TfacetT; __newfacet : TflagT);
function visible(var a : TfacetT) : TflagT;
procedure set_visible(var a : TfacetT; __visible : TflagT);
function toporient(var a : TfacetT) : TflagT;
procedure set_toporient(var a : TfacetT; __toporient : TflagT);
function simplicial(var a : TfacetT) : TflagT;
procedure set_simplicial(var a : TfacetT; __simplicial : TflagT);
function seen(var a : TfacetT) : TflagT;
procedure set_seen(var a : TfacetT; __seen : TflagT);
function seen2(var a : TfacetT) : TflagT;
procedure set_seen2(var a : TfacetT; __seen2 : TflagT);
function flipped(var a : TfacetT) : TflagT;
procedure set_flipped(var a : TfacetT; __flipped : TflagT);
function upperdelaunay(var a : TfacetT) : TflagT;
procedure set_upperdelaunay(var a : TfacetT; __upperdelaunay : TflagT);
function notfurthest(var a : TfacetT) : TflagT;
procedure set_notfurthest(var a : TfacetT; __notfurthest : TflagT);
function good(var a : TfacetT) : TflagT;
procedure set_good(var a : TfacetT; __good : TflagT);
function isarea(var a : TfacetT) : TflagT;
procedure set_isarea(var a : TfacetT; __isarea : TflagT);
function dupridge(var a : TfacetT) : TflagT;
procedure set_dupridge(var a : TfacetT; __dupridge : TflagT);
function mergeridge(var a : TfacetT) : TflagT;
procedure set_mergeridge(var a : TfacetT; __mergeridge : TflagT);
function mergeridge2(var a : TfacetT) : TflagT;
procedure set_mergeridge2(var a : TfacetT; __mergeridge2 : TflagT);
function coplanarhorizon(var a : TfacetT) : TflagT;
procedure set_coplanarhorizon(var a : TfacetT; __coplanarhorizon : TflagT);
function mergehorizon(var a : TfacetT) : TflagT;
procedure set_mergehorizon(var a : TfacetT; __mergehorizon : TflagT);
function cycledone(var a : TfacetT) : TflagT;
procedure set_cycledone(var a : TfacetT; __cycledone : TflagT);
function tested(var a : TfacetT) : TflagT;
procedure set_tested(var a : TfacetT; __tested : TflagT);
function keepcentrum(var a : TfacetT) : TflagT;
procedure set_keepcentrum(var a : TfacetT; __keepcentrum : TflagT);
function newmerge(var a : TfacetT) : TflagT;
procedure set_newmerge(var a : TfacetT; __newmerge : TflagT);
function degenerate(var a : TfacetT) : TflagT;
procedure set_degenerate(var a : TfacetT; __degenerate : TflagT);
function redundant(var a : TfacetT) : TflagT;
procedure set_redundant(var a : TfacetT; __redundant : TflagT);
{-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="ridgeT">-</a>

  ridgeT
    defines a ridge

  notes:
  a ridge is hull_dim-1 simplex between two neighboring facets.  If the
  facets are non-simplicial, there may be more than one ridge between
  two facets.  E.G. a 4-d hypercube has two triangles between each pair
  of neighboring facets.

  topological information:
    vertices            a set of vertices
    top,bottom          neighboring facets with orientation

  geometric information:
    tested              True if ridge is clearly convex
    nonconvex           True if ridge is non-convex
 }
{ vertices belonging to this ridge, inverse sorted by ID
                           NULL if a degen ridge (matchsame)  }
{ top facet for this ridge  }
{ bottom facet for this ridge
                        ridge oriented by odd/even vertex order and top/bottom  }
{ unique identifier.  Same size as vertex_id, printed as 'r%d'  }
{ used to perform operations only once  }
{ True when ridge is tested for convexity by centrum or opposite vertices  }
{ True if getmergeset detected a non-convex neighbor
                           only one ridge between neighbors may have nonconvex  }
{ True if pending qh_appendvertexmerge due to
                             qh_maybe_duplicateridge or qh_maybe_duplicateridges
                             disables check for duplicate vertices in qh_checkfacet  }
{ True if qh_drop_mergevertex of MRGvertices, printed but not used  }
{ True if top was simplicial (original vertices)  }
{ True if bottom was simplicial (original vertices)
                             use qh_test_centrum_merge if top and bot, need to retest since centrum may change  }
type
  PridgeT = ^TridgeT;
  TridgeT = record
      vertices : PsetT;
      top : PfacetT;
      bottom : PfacetT;
      id : dword;
      flag0 : word;
    end;


const
  bm_TridgeT_seen = $1;
  bp_TridgeT_seen = 0;
  bm_TridgeT_tested = $2;
  bp_TridgeT_tested = 1;
  bm_TridgeT_nonconvex = $4;
  bp_TridgeT_nonconvex = 2;
  bm_TridgeT_mergevertex = $8;
  bp_TridgeT_mergevertex = 3;
  bm_TridgeT_mergevertex2 = $10;
  bp_TridgeT_mergevertex2 = 4;
  bm_TridgeT_simplicialtop = $20;
  bp_TridgeT_simplicialtop = 5;
  bm_TridgeT_simplicialbot = $40;
  bp_TridgeT_simplicialbot = 6;

function seen(var a : TridgeT) : TflagT;
procedure set_seen(var a : TridgeT; __seen : TflagT);
function tested(var a : TridgeT) : TflagT;
procedure set_tested(var a : TridgeT; __tested : TflagT);
function nonconvex(var a : TridgeT) : TflagT;
procedure set_nonconvex(var a : TridgeT; __nonconvex : TflagT);
function mergevertex(var a : TridgeT) : TflagT;
procedure set_mergevertex(var a : TridgeT; __mergevertex : TflagT);
function mergevertex2(var a : TridgeT) : TflagT;
procedure set_mergevertex2(var a : TridgeT; __mergevertex2 : TflagT);
function simplicialtop(var a : TridgeT) : TflagT;
procedure set_simplicialtop(var a : TridgeT; __simplicialtop : TflagT);
function simplicialbot(var a : TridgeT) : TflagT;
procedure set_simplicialbot(var a : TridgeT; __simplicialbot : TflagT);
{ 2^9-1  }

const
  qh_MAXnummerge = 511;  
{-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="vertexT">-</a>

  vertexT
     defines a vertex

  topological information:
    next,previous       doubly-linked list of all vertices
    neighbors           set of adjacent facets (only if qh.VERTEXneighbors)

  geometric information:
    point               array of DIM3 coordinates
 }
{ next vertex in vertex_list or vertex_tail  }
{ previous vertex in vertex_list or NULL, for C++ interface  }
{ hull_dim coordinates (coordT)  }
{ neighboring facets of vertex, qh_vertexneighbors()
                           initialized in io.c or after first merge
                           qh_update_vertices for qh_addpoint or qh_triangulate
                           updated by merges
                           qh_order_vertexneighbors by 2-d (orientation) 3-d (adjacency), n-d (f.visitid,id)  }
{ unique identifier, 1..qh.vertex_id,  0 for sentinel, printed as 'r%d'  }
{ for use with qh.vertex_visit, size must match  }
{ used to perform operations only once  }
{ another seen flag  }
{ vertex will be deleted via qh.del_vertices  }
{ vertex belonged to a deleted ridge, cleared by qh_reducevertices  }
{ true if vertex is in a new facet
                           vertex is on qh.newvertex_list and it has a facet on qh.newfacet_list
                           or vertex is on qh.newvertex_list due to qh_newvertices while merging
                           cleared by qh_resetlists  }
{ true if deleted vertex has been partitioned  }
type
  PvertexT = ^TvertexT;
  TvertexT = record
      next : PvertexT;
      previous : PvertexT;
      point : PpointT;
      neighbors : PsetT;
      id : dword;
      visitid : dword;
      flag0 : word;
    end;


const
  bm_TvertexT_seen = $1;
  bp_TvertexT_seen = 0;
  bm_TvertexT_seen2 = $2;
  bp_TvertexT_seen2 = 1;
  bm_TvertexT_deleted = $4;
  bp_TvertexT_deleted = 2;
  bm_TvertexT_delridge = $8;
  bp_TvertexT_delridge = 3;
  bm_TvertexT_newfacet = $10;
  bp_TvertexT_newfacet = 4;
  bm_TvertexT_partitioned = $20;
  bp_TvertexT_partitioned = 5;

function seen(var a : TvertexT) : TflagT;
procedure set_seen(var a : TvertexT; __seen : TflagT);
function seen2(var a : TvertexT) : TflagT;
procedure set_seen2(var a : TvertexT; __seen2 : TflagT);
function deleted(var a : TvertexT) : TflagT;
procedure set_deleted(var a : TvertexT; __deleted : TflagT);
function delridge(var a : TvertexT) : TflagT;
procedure set_delridge(var a : TvertexT; __delridge : TflagT);
function newfacet(var a : TvertexT) : TflagT;
procedure set_newfacet(var a : TvertexT; __newfacet : TflagT);
function partitioned(var a : TvertexT) : TflagT;
procedure set_partitioned(var a : TvertexT; __partitioned : TflagT);
{======= -global variables -qh ============================ }
{-<a                             href="qh-globa.htm#TOC"
  >--------------------------------</a><a name="qh">-</a>

  qhT
   All global variables for qhull are in qhT, qhmemT, and qhstatT

  notes:
   qhmem is defined in mem.h, qhstat is defined in stat.h, qhrbox is defined in rboxpoints.h
   Access to qh_qh is via the "qh" macro.  See qh_QHpointer in user.h

   All global variables for qhull are in qh, qhmem, and qhstat
   qh must be unique for each instance of qhull
   qhstat may be shared between qhull instances.
   qhmem may be shared across multiple instances of Qhull.
   Rbox uses global variables rbox_inuse and rbox, but does not persist data across calls.

   Qhull is not multi-threaded.  Global state could be stored in thread-local storage.

   QHULL_LIB_CHECK checks that a program and the corresponding
   qhull library were built with the same type of header files.

   QHULL_LIB_TYPE is QHULL_NON_REENTRANT, QHULL_QH_POINTER, or QHULL_REENTRANT
 }

const
  QHULL_NON_REENTRANT = 0;  
  QHULL_QH_POINTER = 1;  
  QHULL_REENTRANT = 2;  
{-<a                             href="qh-globa.htm#TOC"
  >--------------------------------</a><a name="qh-const">-</a>

  qh constants
    configuration flags and constants for Qhull

  notes:
    The user configures Qhull by defining flags.  They are
    copied into qh by qh_setflags().  qh-quick.htm#options defines the flags.
 }
{ true 'Qs' if search all points for initial simplex  }
{ true 'Qa' allow input with fewer or more points than coordinates  }
{ true 'Qw' if allow option warnings  }
{ true 'Q12' if allow wide facets and wide dupridges, c.f. qh_WIDEmaxoutside  }
{ true 'Q1' if sort potential merges by type/angle instead of type/distance   }
{ true 'Wn' if MINoutside set  }
{   Minimum distance for an outside point ('Wn' or 2*qh.MINvisible)  }
{ true 'Ta' if annotate output with message codes  }
{ true 'Qz' if point num_points-1 is "at-infinity"
                             for improving precision in Delaunay triangulations  }
{ true 'Q4' if avoid old->new merges  }
{ true 'Qf' if partition points into best outsideset  }
{ true 'Pc' if input uses CDD format (1.0/offset first)  }
{ true 'PC' if print normals in CDD format (offset first)  }
{ true 'Q15' if qh_maybe_duplicateridges after each qh_mergefacet  }
{ true 'Tc' if checking frequently  }
{   'A-n'   cos_max when pre merging  }
{   'An'    cos_max when post merging  }
{ true 'd' or 'v' if computing DELAUNAY triangulation  }
{ true 'Gh' if print hyperplane intersections  }
{ drops dim 'GDn' for 4-d -> 3-d output  }
{ true 'Tf' if flush after qh_fprintf for segfaults  }
{ true 'Po' if forcing output despite degeneracies  }
{ 'QGn' or 'QG-n' (n+1, n-1), good facet if visible from point n (or not)  }
{   the actual point  }
{ true 'Pd/PD' if qh.lower_threshold/upper_threshold defined
                             set if qh.UPPERdelaunay (qh_initbuild)
                             false if qh.SPLITthreshold  }
{ 'QVn' or 'QV-n' (n+1, n-1), good facet if vertex for point n (or not)  }
{   the actual point  }
{ true 'Hn,n,n' if halfspace intersection  }
{ Set by Qhull.cpp on initialization  }
{ 'Tn' trace execution, 0=none, 1=least, 4=most, -1=events  }
{ 'PAn' number of largest facets to keep  }
{ true 'Qc' if keeping nearest facet for coplanar points  }
{ true 'Qi' if keeping nearest facet for inside points
                              set automatically if 'd Qc'  }
{ 'PMn' number of facets to keep with most merges  }
{ 'PFn' minimum facet area to keep  }
{ 'Un' max distance below a facet to be coplanar }
{ 'QWn' max ratio for wide facet, otherwise error unless Q12-allow-wide  }
{ true 'Qx' if exact merges (concave, degen, dupridge, flipped)
                             tested by qh_checkzero and qh_test_*_merge  }
{ true if merging independent sets of coplanar facets. 'Q2' disables  }
{ true if exact-, pre- or post-merging, with angle and centrum tests  }
{   'C-n' centrum_radius when pre merging.  Default is round-off  }
{   'Cn' centrum_radius when post merging.  Default is round-off  }
{ true 'Q14' if merging pinched vertices due to dupridge  }
{ true if merging redundant vertices, 'Q3' disables or qh.hull_dim > qh_DIMmergeVertex  }
{ 'Vn' min. distance for a facet to be visible  }
{ true 'Q10' if no special processing for narrow distributions  }
{ true 'Q8' if ignore near-inside points when partitioning, qh_check_points may fail  }
{ true 'Q0' if no defaults for C-0 or Qx  }
{ true 'Qg' if process points with good visible or horizon facets  }
{ true 'Qm' if only process points that increase max_outside  }
{ true 'Q9' if process furthest of furthest points }
{ true if merging after buildhull ('Cn' or 'An')  }
{ true if merging during buildhull ('C-n' or 'A-n')  }
{ NOTE: some of these names are similar to qh_PRINT names  }
{ true 'Gc' if printing centrums  }
{ true 'Gp' if printing coplanar points  }
{ print dimension for Geomview output  }
{ true 'Ga' if printing all points as dots  }
{ true 'Pg' if printing good facets
                             PGood set if 'd', 'PAn', 'PFn', 'PMn', 'QGn', 'QG-n', 'QVn', or 'QV-n'  }
{ true 'Gi' if printing inner planes  }
{ true 'PG' if printing neighbors of good facets  }
{ true 'Gn' if printing no planes  }
{ true 'FO' if printing options to stderr  }
{ true 'Go' if printing outer planes  }
{ false 'Pp' if not reporting precision problems  }
{ list of output formats to print  }
{ true 'Gr' if print ridges  }
{ true 'Gv' if print vertices as spheres  }
{ true 'Ts' if printing statistics to stderr  }
{ true 's' if printing summary to stderr  }
{ true 'Gt' if print transparent outer ridges  }
{ true if DELAUNAY, no readpoints() and
                             need projectinput() for Delaunay in qh_init_B  }
{ number of projected dimensions 'bn:0Bn:0'  }
{ true 'Rn' if randomly change distplane and setfacetplane  }
{    maximum random perturbation  }
{    qh_randomfactor is randr * RANDOMa + RANDOMb  }
{ true 'Qr' if select a random outside point  }
{ 'TFn' buildtracing reports every n facets  }
{ tracemerging reports every REPORTfreq/2 facets  }
{ 'TRn' rerun qhull n times (qh.build_cnt)  }
{ 'QRn' n<-1 random seed, n==-1 time is seed, n==0 random rotation by time, n>0 rotate input  }
{ true 'Qbk' if scaling input  }
{ true 'Qbb' if scale last coord to max prev coord  }
{ true 'En' if qh.DISTround is predefined  }
{ true 'Q5' if skip qh_check_maxout, qh_check_points may fail  }
{ true 'Q6' if skip convexity testing during pre-merge  }
{ true 'Pd/PD' if upper_/lower_threshold defines a region
                               else qh.GOODthresholds
                               set if qh.DELAUNAY (qh_initbuild)
                               used only for printing (!for qh.ONLYgood)  }
{ 'TAn' 1+n for stop after adding n vertices  }
{ 'TCn' 1+n for stopping after cone for point n  }
{       also used by qh_build_withresart for err exit }
{ 'TVn' 'TV-n' 1+n for stopping after/before(-)
                                        adding point n  }
{ 'QTn' num of test points after qh.num_points.  Test points always coplanar.  }
{  true 'Qv' if test vertex neighbors at end  }
{ 'Tn' conditional IStracing level  }
{  qh.TRACElevel applies to last qh.RERUN  }
{ 'TPn' start tracing when point n is a vertex, use qh_IDunknown (-1) after qh_buildhull and qh_postmerge  }
{ 'TWn' start tracing when merge distance too big  }
{ 'TMn' start tracing before this merge  }
{ true 'Qt' if triangulate non-simplicial facets  }
{ true 'Q11' if triangulate duplicates ->normal and ->center (sets Qt)  }
{ true 'Qu' if computing furthest-site Delaunay  }
{ true 'Tz' if using stdout instead of stderr  }
{ true 'Tv' if verify output at end of qhull  }
{ true 'Q7' if depth-first processing in buildhull  }
{ true 'v' if computing Voronoi diagram, also sets qh.DELAUNAY  }
{--------input constants --------- }
{ 1/(hull_dim-1)! for converting det's to area  }
{ true if calling qh_check_maxout (!qh.SKIPcheckmax && qh.MERGING)  }
{ feasible point 'Hn,n,n' for halfspace intersection  }
{    as coordinates, both malloc'd  }
{ true 'Fa', 'FA', 'FS', 'PAn', 'PFn' if compute facet area/Voronoi volume in io.c  }
{ true if near-inside points in coplanarset  }
{ dimension of hull, set by initbuffers  }
{ dimension of input, set by initbuffers  }
{ number of input points  }
{ array of input points, see POINTSmalloc  }
{   true if qh.first_point/num_points allocated  }
{ copy of original qh.first_point for input points for qh_joggleinput  }
{ true if qh.input_points malloc'd  }
{ command line that invoked this program  }
{    size of qhull_command at qh_clear_outputflags  }
{ command line that produced the input points  }
{ descriptive list of options  }
{    length of last line  }
{    size of qhull_options at qh_build_withrestart  }
{    size of qhull_options at qh_clear_outputflags  }
{ non-zero, random identifier for this instance of qhull  }
{ true if maintaining vertex neighbors  }
{ true if 'C-0' or 'C-0 Qx' and not post-merging or 'A-n'.  Sets ZEROall_ok  }
{ don't print if facet->normal[k]>=upper_threshold[k]
                             must set either GOODthreshold or SPLITthreshold
                             if qh.DELAUNAY, default is 0.0 for upper envelope (qh_initbuild)  }
{ don't print if facet->normal[k] <=lower_threshold[k]  }
{ scale point[k] to new upper bound  }
{ scale point[k] to new lower bound
                             project if both upper_ and lower_bound == 0  }
{-<a                             href="qh-globa.htm#TOC"
  >--------------------------------</a><a name="qh-prec">-</a>

  qh precision constants
    precision constants for Qhull

  notes:
    qh_detroundoff [geom2.c] computes the maximum roundoff error for distance
    and other computations.  It also sets default values for the
    qh constants above.
 }
{ max round off error for angles  }
{ max centrum radius for convexity ('Cn' + 2*qh.DISTround)  }
{ max cosine for convexity (roundoff added)  }
{ max round off error for distances, qh.SETroundoff ('En') overrides qh_distround  }
{ max absolute coordinate  }
{ max last coordinate for qh_scalelast  }
{ max target for qh.max_outside/f.maxoutside, base for qh_RATIO...
                             recomputed at qh_addpoint, unrelated to qh_MAXoutside  }
{ max sum of coordinates  }
{ max rectilinear width of point coordinates  }
{ min. abs. value for 1/x  }
{    use divzero if denominator < MINdenom  }
{ min. abs. val for 1/x that allows normalization  }
{    use divzero if denominator < MINdenom_2  }
{ min. last coordinate for qh_scalelast  }
{ hull_dim array for near zero in gausselim  }
{ keep points for qh_check_maxout if close to facet  }
{ max distance for merging simplicial facets  }
{ application's epsilon for coplanar points
                             qh_check_bestdist() qh_check_points() reports error if point outside  }
{ size of wide facet for skipping ridge in
                             area computation and locking centrum  }
{ set in qh_initialhull if angle < qh_MAXnarrow  }
{-<a                             href="qh-globa.htm#TOC"
  >--------------------------------</a><a name="qh-codetern">-</a>

  qh internal constants
    internal constants for Qhull
 }
{ "qhull" for checking ownership while debugging  }
{ exit label for qh_errexit, defined by setjmp() and NOerrexit  }
{ extra bytes in case jmp_buf is defined wrong by compiler  }
{ restart label for qh_errexit, defined by setjmp() and ALLOWrestart  }
{ extra bytes in case jmp_buf is defined wrong by compiler }
{ pointer to input file, init by qh_initqhull_start2  }
{ pointer to output file  }
{ pointer to error file  }
{ center point of the initial simplex }
{ size in bytes for facet normals and point coords  }
{ size in bytes for Voronoi centers  }
{ size for small, temporary sets (in quick mem)  }
{-<a                             href="qh-globa.htm#TOC"
  >--------------------------------</a><a name="qh-lists">-</a>

  qh facet and vertex lists
    defines lists of facets, new facets, visible facets, vertices, and
    new vertices.  Includes counts, next ids, and trace ids.
  see:
    qh_resetlists()
 }
{ first facet  }
{ end of facet_list (dummy facet with id 0 and next==NULL)  }
{ next facet for buildhull()
                             previous facets do not have outside sets
                             NARROWhull: previous facets may have coplanar outside sets for qh_outcoplanar  }
{ list of new facets to end of facet_list
                             qh_postmerge sets newfacet_list to facet_list  }
{ list of visible facets preceding newfacet_list,
                             end of visible list if !facet->visible, same as newfacet_list
                             qh_findhorizon sets visible_list at end of facet_list
                             qh_willdelete prepends to visible_list
                             qh_triangulate appends mirror facets to visible_list at end of facet_list
                             qh_postmerge sets visible_list to facet_list
                             qh_deletevisible deletes the visible facets  }
{ current number of visible facets  }
{ set at init, then can print whenever  }
{   set in newfacet/mergefacet, undone in delfacet and qh_errexit  }
{ set at init, then can print whenever  }
{   set in newridge, undone in delridge, errexit, errexit2, makenew_nonsimplicial, mergecycle_ridges  }
{ set at buildtracing, can print whenever  }
{   set in newvertex, undone in delvertex and qh_errexit  }
{ list of all vertices, to vertex_tail  }
{      end of vertex_list (dummy vertex with ID 0, next NULL)  }
{ list of vertices in newfacet_list, to vertex_tail
                             all vertices have 'newfacet' set  }
{ number of facets in facet_list
                             includes visible faces (num_visible)  }
{ number of vertices in facet_list  }
{ number of points in outsidesets (for tracing and RANDOMoutside)
                               includes coplanar outsideset points for NARROWhull/qh_outcoplanar()  }
{ number of good facets (after qh_findgood_all or qh_markkeep)  }
{ ID of next, new facet from newfacet()  }
{ ID of next, new ridge from newridge()  }
{ ID of next, new vertex from newvertex()  }
{ ID of first_newfacet for qh_buildcone, or 0 if none  }
{-<a                             href="qh-globa.htm#TOC"
  >--------------------------------</a><a name="qh-var">-</a>

  qh global variables
    defines minimum and maximum distances, next visit ids, several flags,
    and other global variables.
    initialize in qh_initbuild or qh_maxmin if used in qh_buildhull
 }
{ ignore time to set up input and randomize  }
{   use 'unsigned long' to avoid wrap-around errors  }
{ true if qh_joggle_restart can use qh.restartexit  }
{ number of calls to qh_initbuild  }
{ current type of facet->center, qh_CENTER  }
{ pointid of furthest point, for tracing  }
{ last errcode from qh_fprintf, reset in qh_build_withrestart  }
{ closest facet to GOODthreshold in qh_findgood  }
{ last apex declared a coplanar point by qh_getpinchedmerges, prevents infinite loop  }
{ true if totarea, totvol was defined by qh_getarea  }
{ true if triangulation created by qh_triangulate  }
{ true during qh_merge_pinchedvertices, disables duplicate ridge vertices in qh_checkfacet  }
{ set 'QJn' if randomly joggle input. 'QJ'/'QJ0.0' sets default (qh_detjoggle)  }
{ set qh_check_maxout(), cleared by qh_addpoint()  }
{ maximum distance from a point to a facet,
                               before roundoff, not simplicial vertices
                               actual outer plane is +DISTround and
                               computed outer plane is +2*DISTround  }
{ maximum distance (>0) from vertex to a facet,
                               before roundoff, due to a merge  }
{ minimum distance (<0) from vertex to a facet,
                               before roundoff, due to a merge
                               if qh.JOGGLEmax, qh_makenewplanes sets it
                               recomputed if qh.DOcheckmax, default -qh.DISTround  }
{ true while visible facets invalid due to new or merge
                              from qh_makecone/qh_attachnewfacets to qh_resetlists  }
{ true while new facets are tentative due to !qh.IGNOREpinched or qh.ONLYgood
                              from qh_makecone to qh_attachnewfacets  }
{ true if partitioning calls qh_findbestnew  }
{ true if new facets are at least 90 degrees  }
{ true if qh.errexit is not available, cleared after setjmp.  See qh.ERREXITcalled  }
{ radius for printing centrums  }
{ radius for printing vertex spheres and points  }
{ true when post merging  }
{ temporary variable for qh_printbegin, etc.  }
{ number of facets printed  }
{ previous facetid to prevent recursive qh_partitioncoplanar+qh_partitionpoint  }
{ number of retries of qh_addpoint due to merging pinched vertices  }
{ True after qhull() is finished  }
{ 'FA': total facet area computed by qh_getarea, hasAreaVolume  }
{ 'FA': total volume computed by qh_getarea, hasAreaVolume  }
{ unique ID for searching neighborhoods,  }
{ unique ID for searching vertices, reset with qh_buildtracing  }
{ True if qh_partitioncoplanar (qh_check_maxout)  }
{ True if qh_checkzero always succeeds  }
{-<a                             href="qh-globa.htm#TOC"
  >--------------------------------</a><a name="qh-set">-</a>

  qh global sets
    defines sets for merging, initial simplex, hashing, extra input points,
    and deleted vertices
 }
{ temporary set of merges to be done  }
{ temporary set of degenerate and redundant merges  }
{ temporary set of vertex merges  }
{ hash table for matching ridges in qh_matchfacets
                             size is setsize()  }
{ additional points  }
{ vertices to partition and delete with visible
                             facets.  v.deleted is set for checkfacet  }
{-<a                             href="qh-globa.htm#TOC"
  >--------------------------------</a><a name="qh-buf">-</a>

  qh global buffers
    defines buffers for maxtrix operations, input, and error messages
 }
{ (dim+1)Xdim matrix for geom.c  }
{ array of gm_matrix rows  }
{ malloc'd input line of maxline+1 chars  }
{ malloc'd input array for halfspace (qh.normal_size+coordT)  }
{ malloc'd input array for points  }
{-<a                             href="qh-globa.htm#TOC"
  >--------------------------------</a><a name="qh-static">-</a>

  qh static variables
    defines static variables for individual functions

  notes:
    do not use 'static' within a function.  Multiple instances of qhull
    may exist.

    do not assume zero initialization, 'QPn' may cause a restart
 }
{ true during qh_errexit (prevents duplicate calls).  see qh.NOerrexit  }
{ for qh_printcentrum  }
{ save RANDOMdist flag during io, tracing, or statistics  }
{ set of coplanar facets for searching qh_findbesthorizon()  }
{ qh_scalelast parameters for qh_setdelaunay  }
{ for qh_buildtracing  }
{   last qh.num_facets  }
{   last zzval_(Ztotmerge)  }{   last zzval_(Zsetplane)  }{   last zzval_(Zdistplane)  }{  last qh.facet_id  }
{ for qh_tracemerging  }
{ for saving qh_qhstat in save_qhull() and UsingLibQhull.  Free with qh_free()  }
{ for saving qhmem.tempstack in save_qhull  }
{ number of ridges for 4OFF output (qh_printbegin,etc)  }
type
  PqhT = ^TqhT;
  TqhT = record
      ALLpoints : TboolT;
      ALLOWshort : TboolT;
      ALLOWwarning : TboolT;
      ALLOWwide : TboolT;
      ANGLEmerge : TboolT;
      APPROXhull : TboolT;
      MINoutside : TrealT;
      ANNOTATEoutput : TboolT;
      ATinfinity : TboolT;
      AVOIDold : TboolT;
      BESToutside : TboolT;
      CDDinput : TboolT;
      CDDoutput : TboolT;
      CHECKduplicates : TboolT;
      CHECKfrequently : TboolT;
      premerge_cos : TrealT;
      postmerge_cos : TrealT;
      DELAUNAY : TboolT;
      DOintersections : TboolT;
      DROPdim : longint;
      FLUSHprint : TboolT;
      FORCEoutput : TboolT;
      GOODpoint : longint;
      GOODpointp : PpointT;
      GOODthreshold : TboolT;
      GOODvertex : longint;
      GOODvertexp : PpointT;
      HALFspace : TboolT;
      ISqhullQh : TboolT;
      IStracing : longint;
      KEEParea : longint;
      KEEPcoplanar : TboolT;
      KEEPinside : TboolT;
      KEEPmerge : longint;
      KEEPminArea : TrealT;
      MAXcoplanar : TrealT;
      MAXwide : longint;
      MERGEexact : TboolT;
      MERGEindependent : TboolT;
      MERGING : TboolT;
      premerge_centrum : TrealT;
      postmerge_centrum : TrealT;
      MERGEpinched : TboolT;
      MERGEvertices : TboolT;
      MINvisible : TrealT;
      NOnarrow : TboolT;
      NOnearinside : TboolT;
      NOpremerge : TboolT;
      ONLYgood : TboolT;
      ONLYmax : TboolT;
      PICKfurthest : TboolT;
      POSTmerge : TboolT;
      PREmerge : TboolT;
      PRINTcentrums : TboolT;
      PRINTcoplanar : TboolT;
      PRINTdim : longint;
      PRINTdots : TboolT;
      PRINTgood : TboolT;
      PRINTinner : TboolT;
      PRINTneighbors : TboolT;
      PRINTnoplanes : TboolT;
      PRINToptions1st : TboolT;
      PRINTouter : TboolT;
      PRINTprecision : TboolT;
      PRINTout : array[0..(qh_PRINTEND)-1] of Tqh_PRINT;
      PRINTridges : TboolT;
      PRINTspheres : TboolT;
      PRINTstatistics : TboolT;
      PRINTsummary : TboolT;
      PRINTtransparent : TboolT;
      PROJECTdelaunay : TboolT;
      PROJECTinput : longint;
      RANDOMdist : TboolT;
      RANDOMfactor : TrealT;
      RANDOMa : TrealT;
      RANDOMb : TrealT;
      RANDOMoutside : TboolT;
      REPORTfreq : longint;
      REPORTfreq2 : longint;
      RERUN : longint;
      ROTATErandom : longint;
      SCALEinput : TboolT;
      SCALElast : TboolT;
      SETroundoff : TboolT;
      SKIPcheckmax : TboolT;
      SKIPconvex : TboolT;
      SPLITthresholds : TboolT;
      STOPadd : longint;
      STOPcone : longint;
      STOPpoint : longint;
      TESTpoints : longint;
      TESTvneighbors : TboolT;
      TRACElevel : longint;
      TRACElastrun : longint;
      TRACEpoint : longint;
      TRACEdist : TrealT;
      TRACEmerge : longint;
      TRIangulate : TboolT;
      TRInormals : TboolT;
      UPPERdelaunay : TboolT;
      USEstdout : TboolT;
      VERIFYoutput : TboolT;
      VIRTUALmemory : TboolT;
      VORONOI : TboolT;
      AREAfactor : TrealT;
      DOcheckmax : TboolT;
      feasible_string : Pchar;
      feasible_point : PcoordT;
      GETarea : TboolT;
      KEEPnearinside : TboolT;
      hull_dim : longint;
      input_dim : longint;
      num_points : longint;
      first_point : PpointT;
      POINTSmalloc : TboolT;
      input_points : PpointT;
      input_malloc : TboolT;
      qhull_command : array[0..255] of char;
      qhull_commandsiz2 : longint;
      rbox_command : array[0..255] of char;
      qhull_options : array[0..511] of char;
      qhull_optionlen : longint;
      qhull_optionsiz : longint;
      qhull_optionsiz2 : longint;
      run_id : longint;
      VERTEXneighbors : TboolT;
      ZEROcentrum : TboolT;
      upper_threshold : PrealT;
      lower_threshold : PrealT;
      upper_bound : PrealT;
      lower_bound : PrealT;
      ANGLEround : TrealT;
      centrum_radius : TrealT;
      cos_max : TrealT;
      DISTround : TrealT;
      MAXabs_coord : TrealT;
      MAXlastcoord : TrealT;
      MAXoutside : TrealT;
      MAXsumcoord : TrealT;
      MAXwidth : TrealT;
      MINdenom_1 : TrealT;
      MINdenom : TrealT;
      MINdenom_1_2 : TrealT;
      MINdenom_2 : TrealT;
      MINlastcoord : TrealT;
      NEARzero : PrealT;
      NEARinside : TrealT;
      ONEmerge : TrealT;
      outside_err : TrealT;
      WIDEfacet : TrealT;
      NARROWhull : TboolT;
      qhull : array[0..(sizeof('qhull'))-1] of char;
      errexit : Tjmp_buf;
      jmpXtra : array[0..39] of char;
      restartexit : Tjmp_buf;
      jmpXtra2 : array[0..39] of char;
      fin : PFILE;
      fout : PFILE;
      ferr : PFILE;
      interior_point : PpointT;
      normal_size : longint;
      center_size : longint;
      TEMPsize : longint;
      facet_list : PfacetT;
      facet_tail : PfacetT;
      facet_next : PfacetT;
      newfacet_list : PfacetT;
      visible_list : PfacetT;
      num_visible : longint;
      tracefacet_id : dword;
      tracefacet : PfacetT;
      traceridge_id : dword;
      traceridge : PridgeT;
      tracevertex_id : dword;
      tracevertex : PvertexT;
      vertex_list : PvertexT;
      vertex_tail : PvertexT;
      newvertex_list : PvertexT;
      num_facets : longint;
      num_vertices : longint;
      num_outside : longint;
      num_good : longint;
      facet_id : dword;
      ridge_id : dword;
      vertex_id : dword;
      first_newfacet : dword;
      hulltime : dword;
      ALLOWrestart : TboolT;
      build_cnt : longint;
      CENTERtype : Tqh_CENTER;
      furthest_id : longint;
      last_errcode : longint;
      GOODclosest : PfacetT;
      coplanar_apex : PpointT;
      hasAreaVolume : TboolT;
      hasTriangulation : TboolT;
      isRenameVertex : TboolT;
      JOGGLEmax : TrealT;
      maxoutdone : TboolT;
      max_outside : TrealT;
      max_vertex : TrealT;
      min_vertex : TrealT;
      NEWfacets : TboolT;
      NEWtentative : TboolT;
      findbestnew : TboolT;
      findbest_notsharp : TboolT;
      NOerrexit : TboolT;
      PRINTcradius : TrealT;
      PRINTradius : TrealT;
      POSTmerging : TboolT;
      printoutvar : longint;
      printoutnum : longint;
      repart_facetid : dword;
      retry_addpoint : longint;
      QHULLfinished : TboolT;
      totarea : TrealT;
      totvol : TrealT;
      visit_id : dword;
      vertex_visit : dword;
      WAScoplanar : TboolT;
      ZEROall_ok : TboolT;
      facet_mergeset : PsetT;
      degen_mergeset : PsetT;
      vertex_mergeset : PsetT;
      hash_table : PsetT;
      other_points : PsetT;
      del_vertices : PsetT;
      gm_matrix : PcoordT;
      gm_row : ^PcoordT;
      line : Pchar;
      maxline : longint;
      half_space : PcoordT;
      temp_malloc : PcoordT;
      ERREXITcalled : TboolT;
      firstcentrum : TboolT;
      old_randomdist : TboolT;
      coplanarfacetset : PsetT;
      last_low : TrealT;
      last_high : TrealT;
      last_newhigh : TrealT;
      lastcpu : TrealT;
      lastfacets : longint;
      lastmerges : longint;
      lastplanes : longint;
      lastdist : longint;
      lastreport : dword;
      mergereport : longint;
      old_qhstat : PqhstatT;
      old_tempstack : PsetT;
      ridgeoutnum : longint;
    end;

{=========== -macros- ========================= }
{-<a                             href="qh-poly.htm#TOC"
  >--------------------------------</a><a name="otherfacet_">-</a>

  otherfacet_(ridge, facet)
    return neighboring facet for a ridge in facet
 }
{******** -libqhull.c prototypes (duplicated from qhull_a.h) ********************* }

procedure qh_qhull;cdecl;external libqhull;
function qh_addpoint(furthest:PpointT; facet:PfacetT; checkdist:TboolT):TboolT;cdecl;external libqhull;
procedure qh_errexit2(exitcode:longint; facet:PfacetT; otherfacet:PfacetT);cdecl;external libqhull;
procedure qh_printsummary(fp:PFILE);cdecl;external libqhull;
{******** -user.c prototypes (alphabetical) ********************* }
procedure qh_errexit(exitcode:longint; facet:PfacetT; ridge:PridgeT);cdecl;external libqhull;
procedure qh_errprint(_string:Pchar; atfacet:PfacetT; otherfacet:PfacetT; atridge:PridgeT; atvertex:PvertexT);cdecl;external libqhull;
function qh_new_qhull(dim:longint; numpoints:longint; points:PcoordT; ismalloc:TboolT; qhull_cmd:Pchar; 
           outfile:PFILE; errfile:PFILE):longint;cdecl;external libqhull;
procedure qh_printfacetlist(facetlist:PfacetT; facets:PsetT; printall:TboolT);cdecl;external libqhull;
procedure qh_printhelp_degenerate(fp:PFILE);cdecl;external libqhull;
procedure qh_printhelp_internal(fp:PFILE);cdecl;external libqhull;
procedure qh_printhelp_narrowhull(fp:PFILE; minangle:TrealT);cdecl;external libqhull;
procedure qh_printhelp_singular(fp:PFILE);cdecl;external libqhull;
procedure qh_printhelp_topology(fp:PFILE);cdecl;external libqhull;
procedure qh_printhelp_wide(fp:PFILE);cdecl;external libqhull;
procedure qh_user_memsizes;cdecl;external libqhull;
{******** -usermem.c prototypes (alphabetical) ********************* }
procedure qh_exit(exitcode:longint);cdecl;external libqhull;
procedure qh_fprintf_stderr(msgcode:longint; fmt:Pchar; args:array of const);cdecl;external libqhull;
procedure qh_fprintf_stderr(msgcode:longint; fmt:Pchar);cdecl;external libqhull;
procedure qh_free(mem:pointer);cdecl;external libqhull;
function qh_malloc(size:Tsize_t):pointer;cdecl;external libqhull;
{******** -userprintf.c and userprintf_rbox.c prototypes ********************* }
procedure qh_fprintf(fp:PFILE; msgcode:longint; fmt:Pchar; args:array of const);cdecl;external libqhull;
procedure qh_fprintf(fp:PFILE; msgcode:longint; fmt:Pchar);cdecl;external libqhull;
procedure qh_fprintf_rbox(fp:PFILE; msgcode:longint; fmt:Pchar; args:array of const);cdecl;external libqhull;
procedure qh_fprintf_rbox(fp:PFILE; msgcode:longint; fmt:Pchar);cdecl;external libqhull;
{**** -geom.c/geom2.c/random.c prototypes (duplicated from geom.h, random.h) *************** }
function qh_findbest(point:PpointT; startfacet:PfacetT; bestoutside:TboolT; newfacets:TboolT; noupper:TboolT; 
           dist:PrealT; isoutside:PboolT; numpart:Plongint):PfacetT;cdecl;external libqhull;
function qh_findbestnew(point:PpointT; startfacet:PfacetT; dist:PrealT; bestoutside:TboolT; isoutside:PboolT; 
           numpart:Plongint):PfacetT;cdecl;external libqhull;
function qh_gram_schmidt(dim:longint; rows:PPrealT):TboolT;cdecl;external libqhull;
procedure qh_outerinner(facet:PfacetT; outerplane:PrealT; innerplane:PrealT);cdecl;external libqhull;
procedure qh_printsummary(fp:PFILE);cdecl;external libqhull;
procedure qh_projectinput;cdecl;external libqhull;
procedure qh_randommatrix(buffer:PrealT; dim:longint; row:PPrealT);cdecl;external libqhull;
procedure qh_rotateinput(rows:PPrealT);cdecl;external libqhull;
procedure qh_scaleinput;cdecl;external libqhull;
procedure qh_setdelaunay(dim:longint; count:longint; points:PpointT);cdecl;external libqhull;
function qh_sethalfspace_all(dim:longint; count:longint; halfspaces:PcoordT; feasible:PpointT):PcoordT;cdecl;external libqhull;
{**** -global.c prototypes (alphabetical) ********************** }
function qh_clock:dword;cdecl;external libqhull;
procedure qh_checkflags(command:Pchar; hiddenflags:Pchar);cdecl;external libqhull;
procedure qh_clear_outputflags;cdecl;external libqhull;
procedure qh_freebuffers;cdecl;external libqhull;
procedure qh_freeqhull(allmem:TboolT);cdecl;external libqhull;
procedure qh_freeqhull2(allmem:TboolT);cdecl;external libqhull;
procedure qh_init_A(infile:PFILE; outfile:PFILE; errfile:PFILE; argc:longint; argv:PPchar);cdecl;external libqhull;
procedure qh_init_B(points:PcoordT; numpoints:longint; dim:longint; ismalloc:TboolT);cdecl;external libqhull;
procedure qh_init_qhull_command(argc:longint; argv:PPchar);cdecl;external libqhull;
procedure qh_initbuffers(points:PcoordT; numpoints:longint; dim:longint; ismalloc:TboolT);cdecl;external libqhull;
procedure qh_initflags(command:Pchar);cdecl;external libqhull;
procedure qh_initqhull_buffers;cdecl;external libqhull;
procedure qh_initqhull_globals(points:PcoordT; numpoints:longint; dim:longint; ismalloc:TboolT);cdecl;external libqhull;
procedure qh_initqhull_mem;cdecl;external libqhull;
procedure qh_initqhull_outputflags;cdecl;external libqhull;
procedure qh_initqhull_start(infile:PFILE; outfile:PFILE; errfile:PFILE);cdecl;external libqhull;
procedure qh_initqhull_start2(infile:PFILE; outfile:PFILE; errfile:PFILE);cdecl;external libqhull;
procedure qh_initthresholds(command:Pchar);cdecl;external libqhull;
procedure qh_lib_check(qhullLibraryType:longint; qhTsize:longint; vertexTsize:longint; ridgeTsize:longint; facetTsize:longint; 
            setTsize:longint; qhmemTsize:longint);cdecl;external libqhull;
procedure qh_option(option:Pchar; i:Plongint; r:PrealT);cdecl;external libqhull;
{$if qh_QHpointer}

procedure qh_restore_qhull(oldqh:PPqhT);cdecl;external libqhull;
function qh_save_qhull:PqhT;cdecl;external libqhull;
{$endif}
{**** -io.c prototypes (duplicated from io.h) ********************** }

procedure qh_dfacet(id:dword);cdecl;external libqhull;
procedure qh_dvertex(id:dword);cdecl;external libqhull;
procedure qh_printneighborhood(fp:PFILE; format:Tqh_PRINT; facetA:PfacetT; facetB:PfacetT; printall:TboolT);cdecl;external libqhull;
procedure qh_produce_output;cdecl;external libqhull;
function qh_readpoints(numpoints:Plongint; dimension:Plongint; ismalloc:PboolT):PcoordT;cdecl;external libqhull;
{******** -mem.c prototypes (duplicated from mem.h) ********************* }
procedure qh_meminit(ferr:PFILE);cdecl;external libqhull;
procedure qh_memfreeshort(curlong:Plongint; totlong:Plongint);cdecl;external libqhull;
{******** -poly.c/poly2.c prototypes (duplicated from poly.h) ********************* }
procedure qh_check_output;cdecl;external libqhull;
procedure qh_check_points;cdecl;external libqhull;
function qh_facetvertices(facetlist:PfacetT; facets:PsetT; allfacets:TboolT):PsetT;cdecl;external libqhull;
function qh_findbestfacet(point:PpointT; bestoutside:TboolT; bestdist:PrealT; isoutside:PboolT):PfacetT;cdecl;external libqhull;
function qh_nearvertex(facet:PfacetT; point:PpointT; bestdistp:PrealT):PvertexT;cdecl;external libqhull;
function qh_point(id:longint):PpointT;cdecl;external libqhull;
{ qh.facet_list  }function qh_pointfacet:PsetT;cdecl;external libqhull;
function qh_pointid(point:PpointT):longint;cdecl;external libqhull;
{ qh.facet_list  }function qh_pointvertex:PsetT;cdecl;external libqhull;
procedure qh_setvoronoi_all;cdecl;external libqhull;
{ qh.facet_list  }procedure qh_triangulate;cdecl;external libqhull;
{******** -rboxlib.c prototypes ********************* }
function qh_rboxpoints(fout:PFILE; ferr:PFILE; rbox_command:Pchar):longint;cdecl;external libqhull;
procedure qh_errexit_rbox(exitcode:longint);cdecl;external libqhull;
{******** -stat.c prototypes (duplicated from stat.h) ********************* }
procedure qh_collectstatistics;cdecl;external libqhull;
procedure qh_printallstatistics(fp:PFILE; _string:Pchar);cdecl;external libqhull;
{$endif}
{ qhDEFlibqhull  }

// === Konventiert am: 18-2-26 16:48:40 ===


implementation


{ was #define dname def_expr }
function qh_FILEstderr : PFILE;
  begin
    qh_FILEstderr:=PFILE(1);
  end;

function nummerge(var a : TfacetT) : dword;
begin
  nummerge:=(a.flag0 and bm_TfacetT_nummerge) shr bp_TfacetT_nummerge;
end;

procedure set_nummerge(var a : TfacetT; __nummerge : dword);
begin
  a.flag0:=a.flag0 or ((__nummerge shl bp_TfacetT_nummerge) and bm_TfacetT_nummerge);
end;

function tricoplanar(var a : TfacetT) : TflagT;
begin
  tricoplanar:=(a.flag0 and bm_TfacetT_tricoplanar) shr bp_TfacetT_tricoplanar;
end;

procedure set_tricoplanar(var a : TfacetT; __tricoplanar : TflagT);
begin
  a.flag0:=a.flag0 or ((__tricoplanar shl bp_TfacetT_tricoplanar) and bm_TfacetT_tricoplanar);
end;

function newfacet(var a : TfacetT) : TflagT;
begin
  newfacet:=(a.flag0 and bm_TfacetT_newfacet) shr bp_TfacetT_newfacet;
end;

procedure set_newfacet(var a : TfacetT; __newfacet : TflagT);
begin
  a.flag0:=a.flag0 or ((__newfacet shl bp_TfacetT_newfacet) and bm_TfacetT_newfacet);
end;

function visible(var a : TfacetT) : TflagT;
begin
  visible:=(a.flag0 and bm_TfacetT_visible) shr bp_TfacetT_visible;
end;

procedure set_visible(var a : TfacetT; __visible : TflagT);
begin
  a.flag0:=a.flag0 or ((__visible shl bp_TfacetT_visible) and bm_TfacetT_visible);
end;

function toporient(var a : TfacetT) : TflagT;
begin
  toporient:=(a.flag0 and bm_TfacetT_toporient) shr bp_TfacetT_toporient;
end;

procedure set_toporient(var a : TfacetT; __toporient : TflagT);
begin
  a.flag0:=a.flag0 or ((__toporient shl bp_TfacetT_toporient) and bm_TfacetT_toporient);
end;

function simplicial(var a : TfacetT) : TflagT;
begin
  simplicial:=(a.flag0 and bm_TfacetT_simplicial) shr bp_TfacetT_simplicial;
end;

procedure set_simplicial(var a : TfacetT; __simplicial : TflagT);
begin
  a.flag0:=a.flag0 or ((__simplicial shl bp_TfacetT_simplicial) and bm_TfacetT_simplicial);
end;

function seen(var a : TfacetT) : TflagT;
begin
  seen:=(a.flag0 and bm_TfacetT_seen) shr bp_TfacetT_seen;
end;

procedure set_seen(var a : TfacetT; __seen : TflagT);
begin
  a.flag0:=a.flag0 or ((__seen shl bp_TfacetT_seen) and bm_TfacetT_seen);
end;

function seen2(var a : TfacetT) : TflagT;
begin
  seen2:=(a.flag0 and bm_TfacetT_seen2) shr bp_TfacetT_seen2;
end;

procedure set_seen2(var a : TfacetT; __seen2 : TflagT);
begin
  a.flag0:=a.flag0 or ((__seen2 shl bp_TfacetT_seen2) and bm_TfacetT_seen2);
end;

function flipped(var a : TfacetT) : TflagT;
begin
  flipped:=(a.flag0 and bm_TfacetT_flipped) shr bp_TfacetT_flipped;
end;

procedure set_flipped(var a : TfacetT; __flipped : TflagT);
begin
  a.flag0:=a.flag0 or ((__flipped shl bp_TfacetT_flipped) and bm_TfacetT_flipped);
end;

function upperdelaunay(var a : TfacetT) : TflagT;
begin
  upperdelaunay:=(a.flag0 and bm_TfacetT_upperdelaunay) shr bp_TfacetT_upperdelaunay;
end;

procedure set_upperdelaunay(var a : TfacetT; __upperdelaunay : TflagT);
begin
  a.flag0:=a.flag0 or ((__upperdelaunay shl bp_TfacetT_upperdelaunay) and bm_TfacetT_upperdelaunay);
end;

function notfurthest(var a : TfacetT) : TflagT;
begin
  notfurthest:=(a.flag0 and bm_TfacetT_notfurthest) shr bp_TfacetT_notfurthest;
end;

procedure set_notfurthest(var a : TfacetT; __notfurthest : TflagT);
begin
  a.flag0:=a.flag0 or ((__notfurthest shl bp_TfacetT_notfurthest) and bm_TfacetT_notfurthest);
end;

function good(var a : TfacetT) : TflagT;
begin
  good:=(a.flag0 and bm_TfacetT_good) shr bp_TfacetT_good;
end;

procedure set_good(var a : TfacetT; __good : TflagT);
begin
  a.flag0:=a.flag0 or ((__good shl bp_TfacetT_good) and bm_TfacetT_good);
end;

function isarea(var a : TfacetT) : TflagT;
begin
  isarea:=(a.flag0 and bm_TfacetT_isarea) shr bp_TfacetT_isarea;
end;

procedure set_isarea(var a : TfacetT; __isarea : TflagT);
begin
  a.flag0:=a.flag0 or ((__isarea shl bp_TfacetT_isarea) and bm_TfacetT_isarea);
end;

function dupridge(var a : TfacetT) : TflagT;
begin
  dupridge:=(a.flag0 and bm_TfacetT_dupridge) shr bp_TfacetT_dupridge;
end;

procedure set_dupridge(var a : TfacetT; __dupridge : TflagT);
begin
  a.flag0:=a.flag0 or ((__dupridge shl bp_TfacetT_dupridge) and bm_TfacetT_dupridge);
end;

function mergeridge(var a : TfacetT) : TflagT;
begin
  mergeridge:=(a.flag0 and bm_TfacetT_mergeridge) shr bp_TfacetT_mergeridge;
end;

procedure set_mergeridge(var a : TfacetT; __mergeridge : TflagT);
begin
  a.flag0:=a.flag0 or ((__mergeridge shl bp_TfacetT_mergeridge) and bm_TfacetT_mergeridge);
end;

function mergeridge2(var a : TfacetT) : TflagT;
begin
  mergeridge2:=(a.flag0 and bm_TfacetT_mergeridge2) shr bp_TfacetT_mergeridge2;
end;

procedure set_mergeridge2(var a : TfacetT; __mergeridge2 : TflagT);
begin
  a.flag0:=a.flag0 or ((__mergeridge2 shl bp_TfacetT_mergeridge2) and bm_TfacetT_mergeridge2);
end;

function coplanarhorizon(var a : TfacetT) : TflagT;
begin
  coplanarhorizon:=(a.flag0 and bm_TfacetT_coplanarhorizon) shr bp_TfacetT_coplanarhorizon;
end;

procedure set_coplanarhorizon(var a : TfacetT; __coplanarhorizon : TflagT);
begin
  a.flag0:=a.flag0 or ((__coplanarhorizon shl bp_TfacetT_coplanarhorizon) and bm_TfacetT_coplanarhorizon);
end;

function mergehorizon(var a : TfacetT) : TflagT;
begin
  mergehorizon:=(a.flag0 and bm_TfacetT_mergehorizon) shr bp_TfacetT_mergehorizon;
end;

procedure set_mergehorizon(var a : TfacetT; __mergehorizon : TflagT);
begin
  a.flag0:=a.flag0 or ((__mergehorizon shl bp_TfacetT_mergehorizon) and bm_TfacetT_mergehorizon);
end;

function cycledone(var a : TfacetT) : TflagT;
begin
  cycledone:=(a.flag0 and bm_TfacetT_cycledone) shr bp_TfacetT_cycledone;
end;

procedure set_cycledone(var a : TfacetT; __cycledone : TflagT);
begin
  a.flag0:=a.flag0 or ((__cycledone shl bp_TfacetT_cycledone) and bm_TfacetT_cycledone);
end;

function tested(var a : TfacetT) : TflagT;
begin
  tested:=(a.flag0 and bm_TfacetT_tested) shr bp_TfacetT_tested;
end;

procedure set_tested(var a : TfacetT; __tested : TflagT);
begin
  a.flag0:=a.flag0 or ((__tested shl bp_TfacetT_tested) and bm_TfacetT_tested);
end;

function keepcentrum(var a : TfacetT) : TflagT;
begin
  keepcentrum:=(a.flag0 and bm_TfacetT_keepcentrum) shr bp_TfacetT_keepcentrum;
end;

procedure set_keepcentrum(var a : TfacetT; __keepcentrum : TflagT);
begin
  a.flag0:=a.flag0 or ((__keepcentrum shl bp_TfacetT_keepcentrum) and bm_TfacetT_keepcentrum);
end;

function newmerge(var a : TfacetT) : TflagT;
begin
  newmerge:=(a.flag0 and bm_TfacetT_newmerge) shr bp_TfacetT_newmerge;
end;

procedure set_newmerge(var a : TfacetT; __newmerge : TflagT);
begin
  a.flag0:=a.flag0 or ((__newmerge shl bp_TfacetT_newmerge) and bm_TfacetT_newmerge);
end;

function degenerate(var a : TfacetT) : TflagT;
begin
  degenerate:=(a.flag0 and bm_TfacetT_degenerate) shr bp_TfacetT_degenerate;
end;

procedure set_degenerate(var a : TfacetT; __degenerate : TflagT);
begin
  a.flag0:=a.flag0 or ((__degenerate shl bp_TfacetT_degenerate) and bm_TfacetT_degenerate);
end;

function redundant(var a : TfacetT) : TflagT;
begin
  redundant:=(a.flag0 and bm_TfacetT_redundant) shr bp_TfacetT_redundant;
end;

procedure set_redundant(var a : TfacetT; __redundant : TflagT);
begin
  a.flag0:=a.flag0 or ((__redundant shl bp_TfacetT_redundant) and bm_TfacetT_redundant);
end;

function seen(var a : TridgeT) : TflagT;
begin
  seen:=(a.flag0 and bm_TridgeT_seen) shr bp_TridgeT_seen;
end;

procedure set_seen(var a : TridgeT; __seen : TflagT);
begin
  a.flag0:=a.flag0 or ((__seen shl bp_TridgeT_seen) and bm_TridgeT_seen);
end;

function tested(var a : TridgeT) : TflagT;
begin
  tested:=(a.flag0 and bm_TridgeT_tested) shr bp_TridgeT_tested;
end;

procedure set_tested(var a : TridgeT; __tested : TflagT);
begin
  a.flag0:=a.flag0 or ((__tested shl bp_TridgeT_tested) and bm_TridgeT_tested);
end;

function nonconvex(var a : TridgeT) : TflagT;
begin
  nonconvex:=(a.flag0 and bm_TridgeT_nonconvex) shr bp_TridgeT_nonconvex;
end;

procedure set_nonconvex(var a : TridgeT; __nonconvex : TflagT);
begin
  a.flag0:=a.flag0 or ((__nonconvex shl bp_TridgeT_nonconvex) and bm_TridgeT_nonconvex);
end;

function mergevertex(var a : TridgeT) : TflagT;
begin
  mergevertex:=(a.flag0 and bm_TridgeT_mergevertex) shr bp_TridgeT_mergevertex;
end;

procedure set_mergevertex(var a : TridgeT; __mergevertex : TflagT);
begin
  a.flag0:=a.flag0 or ((__mergevertex shl bp_TridgeT_mergevertex) and bm_TridgeT_mergevertex);
end;

function mergevertex2(var a : TridgeT) : TflagT;
begin
  mergevertex2:=(a.flag0 and bm_TridgeT_mergevertex2) shr bp_TridgeT_mergevertex2;
end;

procedure set_mergevertex2(var a : TridgeT; __mergevertex2 : TflagT);
begin
  a.flag0:=a.flag0 or ((__mergevertex2 shl bp_TridgeT_mergevertex2) and bm_TridgeT_mergevertex2);
end;

function simplicialtop(var a : TridgeT) : TflagT;
begin
  simplicialtop:=(a.flag0 and bm_TridgeT_simplicialtop) shr bp_TridgeT_simplicialtop;
end;

procedure set_simplicialtop(var a : TridgeT; __simplicialtop : TflagT);
begin
  a.flag0:=a.flag0 or ((__simplicialtop shl bp_TridgeT_simplicialtop) and bm_TridgeT_simplicialtop);
end;

function simplicialbot(var a : TridgeT) : TflagT;
begin
  simplicialbot:=(a.flag0 and bm_TridgeT_simplicialbot) shr bp_TridgeT_simplicialbot;
end;

procedure set_simplicialbot(var a : TridgeT; __simplicialbot : TflagT);
begin
  a.flag0:=a.flag0 or ((__simplicialbot shl bp_TridgeT_simplicialbot) and bm_TridgeT_simplicialbot);
end;

function seen(var a : TvertexT) : TflagT;
begin
  seen:=(a.flag0 and bm_TvertexT_seen) shr bp_TvertexT_seen;
end;

procedure set_seen(var a : TvertexT; __seen : TflagT);
begin
  a.flag0:=a.flag0 or ((__seen shl bp_TvertexT_seen) and bm_TvertexT_seen);
end;

function seen2(var a : TvertexT) : TflagT;
begin
  seen2:=(a.flag0 and bm_TvertexT_seen2) shr bp_TvertexT_seen2;
end;

procedure set_seen2(var a : TvertexT; __seen2 : TflagT);
begin
  a.flag0:=a.flag0 or ((__seen2 shl bp_TvertexT_seen2) and bm_TvertexT_seen2);
end;

function deleted(var a : TvertexT) : TflagT;
begin
  deleted:=(a.flag0 and bm_TvertexT_deleted) shr bp_TvertexT_deleted;
end;

procedure set_deleted(var a : TvertexT; __deleted : TflagT);
begin
  a.flag0:=a.flag0 or ((__deleted shl bp_TvertexT_deleted) and bm_TvertexT_deleted);
end;

function delridge(var a : TvertexT) : TflagT;
begin
  delridge:=(a.flag0 and bm_TvertexT_delridge) shr bp_TvertexT_delridge;
end;

procedure set_delridge(var a : TvertexT; __delridge : TflagT);
begin
  a.flag0:=a.flag0 or ((__delridge shl bp_TvertexT_delridge) and bm_TvertexT_delridge);
end;

function newfacet(var a : TvertexT) : TflagT;
begin
  newfacet:=(a.flag0 and bm_TvertexT_newfacet) shr bp_TvertexT_newfacet;
end;

procedure set_newfacet(var a : TvertexT; __newfacet : TflagT);
begin
  a.flag0:=a.flag0 or ((__newfacet shl bp_TvertexT_newfacet) and bm_TvertexT_newfacet);
end;

function partitioned(var a : TvertexT) : TflagT;
begin
  partitioned:=(a.flag0 and bm_TvertexT_partitioned) shr bp_TvertexT_partitioned;
end;

procedure set_partitioned(var a : TvertexT; __partitioned : TflagT);
begin
  a.flag0:=a.flag0 or ((__partitioned shl bp_TvertexT_partitioned) and bm_TvertexT_partitioned);
end;


end.
