
unit random;
interface

{
  Automatically converted by H2Pas 1.0.0 from random.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    random.h
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
PrealT  = ^realT;
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

function qh_argv_to_command(argc:longint; argv:PPchar; command:Pchar; max_size:longint):longint;cdecl;external;
function qh_argv_to_command_size(argc:longint; argv:PPchar):longint;cdecl;external;
function qh_rand:longint;cdecl;external;
procedure qh_srand(seed:longint);cdecl;external;
function qh_randomfactor(scale:TrealT; offset:TrealT):TrealT;cdecl;external;
procedure qh_randommatrix(buffer:PrealT; dim:longint; row:PPrealT);cdecl;external;
(* Const before type ignored *)
function qh_strtol(s:Pchar; endp:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function qh_strtod(s:Pchar; endp:PPchar):Tdouble;cdecl;external;
{$endif}
{ qhDEFrandom  }

implementation


end.
