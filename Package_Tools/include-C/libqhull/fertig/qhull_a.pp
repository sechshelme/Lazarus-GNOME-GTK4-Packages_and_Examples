
unit qhull_a;
interface

{
  Automatically converted by H2Pas 1.0.0 from qhull_a.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    qhull_a.h
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
Pchar  = ^char;
PcoordT  = ^coordT;
PfacetT  = ^facetT;
PFILE  = ^FILE;
Plongint  = ^longint;
PpointT  = ^pointT;
PrealT  = ^realT;
PsetT  = ^setT;
PvertexT  = ^vertexT;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-qhull.htm"
  >-------------------------------</a><a name="TOP">-</a>

   qhull_a.h
   all header files for compiling qhull with non-reentrant code

   see qh-qhull.htm

   see libqhull.h for user-level definitions

   see user.h for user-definable constants

   defines internal functions for libqhull.c global.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull/qhull_a.h#2 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $

   Notes:  grep for ((" and (" to catch fprintf("lkasdjf");
           full parens around (x?y:z)
           use '#include "libqhull/qhull_a.h"' to avoid name clashes
 }
{$ifndef qhDEFqhulla}

const
  qhDEFqhulla = 1;  
{$include "libqhull.h"  /* Includes user.h and data types */}
{$include "stat.h"}
{$include "random.h"}
{$include "mem.h"}
{$include "qset.h"}
{$include "geom.h"}
{$include "merge.h"}
{$include "poly.h"}
{$include "io.h"}
{$include <setjmp.h>}
{$include <string.h>}
{$include <math.h>}
{$include <float.h>    /* some compilers will not need float.h */}
{$include <limits.h>}
{$include <time.h>}
{$include <ctype.h>}
{$include <stdio.h>}
{$include <stdlib.h>}
{** uncomment here and qset.c
     if string.h does not define memcpy()
#include <memory.h>
 }
{$if qh_CLOCKtype == 2  /* defined in user.h from libqhull.h */}
{$include <sys/types.h>}
{$include <sys/times.h>}
{$include <unistd.h>}
{$endif}
{$ifdef _MSC_VER  /* Microsoft Visual C++ -- warning level 4 */}
(** unsupported pragma#pragma warning( disable : 4100)  /* unreferenced formal parameter */*)
(** unsupported pragma#pragma warning( disable : 4127)  /* conditional expression is constant */*)
(** unsupported pragma#pragma warning( disable : 4706)  /* assignment within conditional function */*)
(** unsupported pragma#pragma warning( disable : 4996)  /* function was declared deprecated(strcpy, localtime, etc.) */*)
{$endif}
{ ======= -macros- ===========  }
{-<a                             href="qh-qhull.htm#TOC"
  >--------------------------------</a><a name="traceN">-</a>

  traceN((qh ferr, 0Nnnn, "format\n", vars));
    calls qh_fprintf if qh.IStracing >= N

    Add debugging traps to the end of qh_fprintf

  notes:
    removing tracing reduces code size but doesn't change execution speed
 }
{-<a                             href="qh-qhull.htm#TOC"
  >--------------------------------</a><a name="QHULL_UNUSED">-</a>

  Define an unused variable to avoid compiler warnings

  Derived from Qt's corelib/global/qglobal.h

 }
{**** -libqhull.c prototypes (alphabetical after qhull) ******************* }

procedure qh_qhull;cdecl;external;
function qh_addpoint(furthest:PpointT; facet:PfacetT; checkdist:TboolT):TboolT;cdecl;external;
procedure qh_build_withrestart;cdecl;external;
function qh_buildcone(furthest:PpointT; facet:PfacetT; goodhorizon:longint; retryfacet:PPfacetT):PvertexT;cdecl;external;
function qh_buildcone_mergepinched(apex:PvertexT; facet:PfacetT; retryfacet:PPfacetT):TboolT;cdecl;external;
function qh_buildcone_onlygood(apex:PvertexT; goodhorizon:longint):TboolT;cdecl;external;
procedure qh_buildhull;cdecl;external;
procedure qh_buildtracing(furthest:PpointT; facet:PfacetT);cdecl;external;
procedure qh_errexit2(exitcode:longint; facet:PfacetT; otherfacet:PfacetT);cdecl;external;
procedure qh_findhorizon(point:PpointT; facet:PfacetT; goodvisible:Plongint; goodhorizon:Plongint);cdecl;external;
function qh_nextfurthest(visible:PPfacetT):PpointT;cdecl;external;
procedure qh_partitionall(vertices:PsetT; points:PpointT; npoints:longint);cdecl;external;
procedure qh_partitioncoplanar(point:PpointT; facet:PfacetT; dist:PrealT; allnew:TboolT);cdecl;external;
procedure qh_partitionpoint(point:PpointT; facet:PfacetT);cdecl;external;
procedure qh_partitionvisible(allpoints:TboolT; numpoints:Plongint);cdecl;external;
(* Const before type ignored *)
procedure qh_joggle_restart(reason:Pchar);cdecl;external;
procedure qh_printsummary(fp:PFILE);cdecl;external;
{**** -global.c internal prototypes (alphabetical) ********************** }
procedure qh_appendprint(format:Tqh_PRINT);cdecl;external;
procedure qh_freebuild(allmem:TboolT);cdecl;external;
procedure qh_freebuffers;cdecl;external;
procedure qh_initbuffers(points:PcoordT; numpoints:longint; dim:longint; ismalloc:TboolT);cdecl;external;
{**** -stat.c internal prototypes (alphabetical) ********************** }
procedure qh_allstatA;cdecl;external;
procedure qh_allstatB;cdecl;external;
procedure qh_allstatC;cdecl;external;
procedure qh_allstatD;cdecl;external;
procedure qh_allstatE;cdecl;external;
procedure qh_allstatE2;cdecl;external;
procedure qh_allstatF;cdecl;external;
procedure qh_allstatG;cdecl;external;
procedure qh_allstatH;cdecl;external;
procedure qh_freebuffers;cdecl;external;
procedure qh_initbuffers(points:PcoordT; numpoints:longint; dim:longint; ismalloc:TboolT);cdecl;external;
{$endif}
{ qhDEFqhulla  }

implementation


end.
