unit qhull_ra;

interface

uses
  fp_qhull_r;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-qhull_r.htm"
  >-------------------------------</a><a name="TOP">-</a>

   qhull_ra.h
   all header files for compiling qhull with reentrant code
   included before C++ headers for user_r.h:QHULL_CRTDBG

   see qh-qhull.htm

   see libqhull_r.h for user-level definitions

   see user_r.h for user-definable constants

   defines internal functions for libqhull_r.c global_r.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull_r/qhull_ra.h#2 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $

   Notes:  grep for ((" and (" to catch fprintf("lkasdjf");
           full parens around (x?y:z)
           use '#include "libqhull_r/qhull_ra.h"' to avoid name clashes
 }
{$ifndef qhDEFqhulla}

const
  qhDEFqhulla = 1;  
{$include "libqhull_r.h"  /* Includes user_r.h and data types */}
{$include "stat_r.h"}
{$include "random_r.h"}
{$include "mem_r.h"}
{$include "qset_r.h"}
{$include "geom_r.h"}
{$include "merge_r.h"}
{$include "poly_r.h"}
{$include "io_r.h"}
{$include <setjmp.h>}
{$include <string.h>}
{$include <math.h>}
{$include <float.h>    /* some compilers will not need float.h */}
{$include <limits.h>}
{$include <time.h>}
{$include <ctype.h>}
{$include <stdio.h>}
{$include <stdlib.h>}
{** uncomment here and qset_r.c
     if string.h does not define memcpy()
#include <memory.h>
 }
{$if qh_CLOCKtype == 2  /* defined in user_r.h from libqhull_r.h */}
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
{**** -libqhull_r.c prototypes (alphabetical after qhull) ******************* }

procedure qh_qhull(qh:PqhT);cdecl;external libqhull_r;
function qh_addpoint(qh:PqhT; furthest:PpointT; facet:PfacetT; checkdist:TboolT):TboolT;cdecl;external libqhull_r;
procedure qh_build_withrestart(qh:PqhT);cdecl;external libqhull_r;
function qh_buildcone(qh:PqhT; furthest:PpointT; facet:PfacetT; goodhorizon:longint; retryfacet:PPfacetT):PvertexT;cdecl;external libqhull_r;
function qh_buildcone_mergepinched(qh:PqhT; apex:PvertexT; facet:PfacetT; retryfacet:PPfacetT):TboolT;cdecl;external libqhull_r;
function qh_buildcone_onlygood(qh:PqhT; apex:PvertexT; goodhorizon:longint):TboolT;cdecl;external libqhull_r;
procedure qh_buildhull(qh:PqhT);cdecl;external libqhull_r;
procedure qh_buildtracing(qh:PqhT; furthest:PpointT; facet:PfacetT);cdecl;external libqhull_r;
procedure qh_errexit2(qh:PqhT; exitcode:longint; facet:PfacetT; otherfacet:PfacetT);cdecl;external libqhull_r;
procedure qh_findhorizon(qh:PqhT; point:PpointT; facet:PfacetT; goodvisible:Plongint; goodhorizon:Plongint);cdecl;external libqhull_r;
function qh_nextfurthest(qh:PqhT; visible:PPfacetT):PpointT;cdecl;external libqhull_r;
procedure qh_partitionall(qh:PqhT; vertices:PsetT; points:PpointT; npoints:longint);cdecl;external libqhull_r;
procedure qh_partitioncoplanar(qh:PqhT; point:PpointT; facet:PfacetT; dist:PrealT; allnew:TboolT);cdecl;external libqhull_r;
procedure qh_partitionpoint(qh:PqhT; point:PpointT; facet:PfacetT);cdecl;external libqhull_r;
procedure qh_partitionvisible(qh:PqhT; allpoints:TboolT; numpoints:Plongint);cdecl;external libqhull_r;
procedure qh_joggle_restart(qh:PqhT; reason:Pchar);cdecl;external libqhull_r;
procedure qh_printsummary(qh:PqhT; fp:PFILE);cdecl;external libqhull_r;
{**** -global_r.c internal prototypes (alphabetical) ********************** }
procedure qh_appendprint(qh:PqhT; format:Tqh_PRINT);cdecl;external libqhull_r;
procedure qh_freebuild(qh:PqhT; allmem:TboolT);cdecl;external libqhull_r;
procedure qh_freebuffers(qh:PqhT);cdecl;external libqhull_r;
procedure qh_initbuffers(qh:PqhT; points:PcoordT; numpoints:longint; dim:longint; ismalloc:TboolT);cdecl;external libqhull_r;
{**** -stat_r.c internal prototypes (alphabetical) ********************** }
procedure qh_allstatA(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatB(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatC(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatD(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatE(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatE2(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatF(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatG(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatH(qh:PqhT);cdecl;external libqhull_r;
procedure qh_freebuffers(qh:PqhT);cdecl;external libqhull_r;
procedure qh_initbuffers(qh:PqhT; points:PcoordT; numpoints:longint; dim:longint; ismalloc:TboolT);cdecl;external libqhull_r;
{$endif}
{ qhDEFqhulla  }

// === Konventiert am: 19-2-26 17:34:14 ===


implementation



end.
