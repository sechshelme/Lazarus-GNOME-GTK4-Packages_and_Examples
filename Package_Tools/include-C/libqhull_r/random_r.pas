unit random_r;

interface

uses
  fp_qhull_r;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-geom_r.htm"
  >-------------------------------</a><a name="TOP">-</a>

  random_r.h
    header file for random and utility routines

   see qh-geom_r.htm and random_r.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull_r/random_r.h#3 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $
 }
{$ifndef qhDEFrandom}

const
  qhDEFrandom = 1;  
{$include "libqhull_r.h"}
{============= prototypes in alphabetical order =======  }
{ C++ extern C conditionnal removed }

function qh_argv_to_command(argc:longint; argv:PPchar; command:Pchar; max_size:longint):longint;cdecl;external libqhull_r;
function qh_argv_to_command_size(argc:longint; argv:PPchar):longint;cdecl;external libqhull_r;
function qh_rand(qh:PqhT):longint;cdecl;external libqhull_r;
procedure qh_srand(qh:PqhT; seed:longint);cdecl;external libqhull_r;
function qh_randomfactor(qh:PqhT; scale:TrealT; offset:TrealT):TrealT;cdecl;external libqhull_r;
procedure qh_randommatrix(qh:PqhT; buffer:PrealT; dim:longint; row:PPrealT);cdecl;external libqhull_r;
function qh_strtol(s:Pchar; endp:PPchar):longint;cdecl;external libqhull_r;
function qh_strtod(s:Pchar; endp:PPchar):Tdouble;cdecl;external libqhull_r;
{$endif}
{ qhDEFrandom  }

// === Konventiert am: 19-2-26 17:34:09 ===


implementation



end.
