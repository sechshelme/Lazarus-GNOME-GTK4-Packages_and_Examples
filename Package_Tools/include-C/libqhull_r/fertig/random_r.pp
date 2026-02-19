
unit random_r;
interface

{
  Automatically converted by H2Pas 1.0.0 from random_r.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    random_r.h
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
PqhT  = ^qhT;
PrealT  = ^realT;
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

function qh_argv_to_command(argc:longint; argv:PPchar; command:Pchar; max_size:longint):longint;cdecl;external;
function qh_argv_to_command_size(argc:longint; argv:PPchar):longint;cdecl;external;
function qh_rand(qh:PqhT):longint;cdecl;external;
procedure qh_srand(qh:PqhT; seed:longint);cdecl;external;
function qh_randomfactor(qh:PqhT; scale:TrealT; offset:TrealT):TrealT;cdecl;external;
procedure qh_randommatrix(qh:PqhT; buffer:PrealT; dim:longint; row:PPrealT);cdecl;external;
(* Const before type ignored *)
function qh_strtol(s:Pchar; endp:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function qh_strtod(s:Pchar; endp:PPchar):Tdouble;cdecl;external;
{$endif}
{ qhDEFrandom  }

implementation


end.
