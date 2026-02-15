
unit ivec4;
interface

{
  Automatically converted by H2Pas 1.0.0 from ivec4.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ivec4.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
  }
{$ifndef cglmc_ivec4_h}
{$define cglmc_ivec4_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_ivec4(v3:Tivec3; last:longint; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_copy(a:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_zero(v:Tivec4);cdecl;external;
procedure glmc_ivec4_one(v:Tivec4);cdecl;external;
procedure glmc_ivec4_add(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_adds(v:Tivec4; s:longint; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_sub(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_subs(v:Tivec4; s:longint; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_mul(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_scale(v:Tivec4; s:longint; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_addadd(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_addadds(a:Tivec4; s:longint; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_subadd(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_subadds(a:Tivec4; s:longint; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_muladd(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_muladds(a:Tivec4; s:longint; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_maxadd(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_minadd(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_subsub(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_subsubs(a:Tivec4; s:longint; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_addsub(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_addsubs(a:Tivec4; s:longint; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_mulsub(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_mulsubs(a:Tivec4; s:longint; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_maxsub(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_minsub(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
function glmc_ivec4_distance2(a:Tivec4; b:Tivec4):longint;cdecl;external;
function glmc_ivec4_distance(a:Tivec4; b:Tivec4):single;cdecl;external;
procedure glmc_ivec4_maxv(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_minv(a:Tivec4; b:Tivec4; dest:Tivec4);cdecl;external;
procedure glmc_ivec4_clamp(v:Tivec4; minVal:longint; maxVal:longint);cdecl;external;
procedure glmc_ivec4_abs(v:Tivec4; dest:Tivec4);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_ivec4_h  }

implementation


end.
