
unit klu_cholmod;
interface

{
  Automatically converted by H2Pas 1.0.0 from klu_cholmod.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    klu_cholmod.h
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
Pint32_t  = ^int32_t;
Pint64_t  = ^int64_t;
Pklu_common  = ^klu_common;
Pklu_l_common  = ^klu_l_common;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{------------------------------------------------------------------------------ }
{ SuiteSparse/KLU/User/klu_cholmod.h: include file for klu_cholmod library }
{------------------------------------------------------------------------------ }
{ KLU, Copyright (c) 2004-2022, University of Florida.  All Rights Reserved. }
{ Authors: Timothy A. Davis and Ekanathan Palamadai. }
{ SPDX-License-Identifier: LGPL-2.1+ }
{------------------------------------------------------------------------------ }
{$include "klu.h"}

function klu_cholmod(n:Tint32_t; Ap:Pint32_t; Ai:Pint32_t; Perm:Pint32_t; para5:Pklu_common):Tint32_t;cdecl;external;
function klu_l_cholmod(n:Tint64_t; Ap:Pint64_t; Ai:Pint64_t; Perm:Pint64_t; para5:Pklu_l_common):Tint64_t;cdecl;external;

implementation


end.
