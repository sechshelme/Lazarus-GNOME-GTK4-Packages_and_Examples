unit random;

interface

uses
  fp_qhull;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-geom.htm"
  >-------------------------------</a><a name="TOP">-</a>

  random.h
    header file for random and utility routines

   see qh-geom.htm and random.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull/random.h#2 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $
 }
{$ifndef qhDEFrandom}

const
  qhDEFrandom = 1;  
{$include "libqhull.h"}
{============= prototypes in alphabetical order =======  }

function qh_argv_to_command(argc:longint; argv:PPchar; command:Pchar; max_size:longint):longint;cdecl;external libqhull;
function qh_argv_to_command_size(argc:longint; argv:PPchar):longint;cdecl;external libqhull;
function qh_rand:longint;cdecl;external libqhull;
procedure qh_srand(seed:longint);cdecl;external libqhull;
function qh_randomfactor(scale:TrealT; offset:TrealT):TrealT;cdecl;external libqhull;
procedure qh_randommatrix(buffer:PrealT; dim:longint; row:PPrealT);cdecl;external libqhull;
function qh_strtol(s:Pchar; endp:PPchar):longint;cdecl;external libqhull;
function qh_strtod(s:Pchar; endp:PPchar):Tdouble;cdecl;external libqhull;
{$endif}
{ qhDEFrandom  }

// === Konventiert am: 18-2-26 16:48:04 ===


implementation



end.
