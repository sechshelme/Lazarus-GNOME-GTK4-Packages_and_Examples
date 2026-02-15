
unit ivec2;
interface

{
  Automatically converted by H2Pas 1.0.0 from ivec2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ivec2.h
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
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
  }
{$ifndef cglmc_ivec2_h}
{$define cglmc_ivec2_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_ivec2(v:Plongint; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_copy(a:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_zero(v:Tivec2);cdecl;external;
procedure glmc_ivec2_one(v:Tivec2);cdecl;external;
procedure glmc_ivec2_add(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_adds(v:Tivec2; s:longint; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_sub(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_subs(v:Tivec2; s:longint; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_mul(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_scale(v:Tivec2; s:longint; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_addadd(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_addadds(a:Tivec2; s:longint; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_subadd(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_subadds(a:Tivec2; s:longint; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_muladd(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_muladds(a:Tivec2; s:longint; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_maxadd(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_minadd(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_subsub(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_subsubs(a:Tivec2; s:longint; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_addsub(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_addsubs(a:Tivec2; s:longint; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_mulsub(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_mulsubs(a:Tivec2; s:longint; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_maxsub(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_minsub(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
function glmc_ivec2_distance2(a:Tivec2; b:Tivec2):longint;cdecl;external;
function glmc_ivec2_distance(a:Tivec2; b:Tivec2):single;cdecl;external;
procedure glmc_ivec2_fill(v:Tivec2; val:longint);cdecl;external;
function glmc_ivec2_eq(v:Tivec2; val:longint):Tbool;cdecl;external;
function glmc_ivec2_eqv(a:Tivec2; b:Tivec2):Tbool;cdecl;external;
procedure glmc_ivec2_maxv(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_minv(a:Tivec2; b:Tivec2; dest:Tivec2);cdecl;external;
procedure glmc_ivec2_clamp(v:Tivec2; minVal:longint; maxVal:longint);cdecl;external;
procedure glmc_ivec2_abs(v:Tivec2; dest:Tivec2);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_ivec2_h  }

implementation


end.
