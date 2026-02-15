
unit affine;
interface

{
  Automatically converted by H2Pas 1.0.0 from affine.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    affine.h
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
{$ifndef cglmc_affine_h}
{$define cglmc_affine_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_translate_make(m:Tmat4; v:Tvec3);cdecl;external;
procedure glmc_translate_to(m:Tmat4; v:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_translate(m:Tmat4; v:Tvec3);cdecl;external;
procedure glmc_translate_x(m:Tmat4; to:single);cdecl;external;
procedure glmc_translate_y(m:Tmat4; to:single);cdecl;external;
procedure glmc_translate_z(m:Tmat4; to:single);cdecl;external;
procedure glmc_scale_make(m:Tmat4; v:Tvec3);cdecl;external;
procedure glmc_scale_to(m:Tmat4; v:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_scale(m:Tmat4; v:Tvec3);cdecl;external;
procedure glmc_scale_uni(m:Tmat4; s:single);cdecl;external;
procedure glmc_rotate_x(m:Tmat4; rad:single; dest:Tmat4);cdecl;external;
procedure glmc_rotate_y(m:Tmat4; rad:single; dest:Tmat4);cdecl;external;
procedure glmc_rotate_z(m:Tmat4; rad:single; dest:Tmat4);cdecl;external;
procedure glmc_rotate_make(m:Tmat4; angle:single; axis:Tvec3);cdecl;external;
procedure glmc_rotate(m:Tmat4; angle:single; axis:Tvec3);cdecl;external;
procedure glmc_rotate_at(m:Tmat4; pivot:Tvec3; angle:single; axis:Tvec3);cdecl;external;
procedure glmc_rotate_atm(m:Tmat4; pivot:Tvec3; angle:single; axis:Tvec3);cdecl;external;
procedure glmc_spin(m:Tmat4; angle:single; axis:Tvec3);cdecl;external;
procedure glmc_decompose_scalev(m:Tmat4; s:Tvec3);cdecl;external;
function glmc_uniscaled(m:Tmat4):Tbool;cdecl;external;
procedure glmc_decompose_rs(m:Tmat4; r:Tmat4; s:Tvec3);cdecl;external;
procedure glmc_decompose(m:Tmat4; t:Tvec4; r:Tmat4; s:Tvec3);cdecl;external;
{ affine-post  }
procedure glmc_translated(m:Tmat4; v:Tvec3);cdecl;external;
procedure glmc_translated_to(m:Tmat4; v:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_translated_x(m:Tmat4; x:single);cdecl;external;
procedure glmc_translated_y(m:Tmat4; y:single);cdecl;external;
procedure glmc_translated_z(m:Tmat4; z:single);cdecl;external;
procedure glmc_rotated_x(m:Tmat4; angle:single; dest:Tmat4);cdecl;external;
procedure glmc_rotated_y(m:Tmat4; angle:single; dest:Tmat4);cdecl;external;
procedure glmc_rotated_z(m:Tmat4; angle:single; dest:Tmat4);cdecl;external;
procedure glmc_rotated(m:Tmat4; angle:single; axis:Tvec3);cdecl;external;
procedure glmc_rotated_at(m:Tmat4; pivot:Tvec3; angle:single; axis:Tvec3);cdecl;external;
procedure glmc_spinned(m:Tmat4; angle:single; axis:Tvec3);cdecl;external;
{ affine-mat  }
procedure glmc_mul(m1:Tmat4; m2:Tmat4; dest:Tmat4);cdecl;external;
procedure glmc_mul_rot(m1:Tmat4; m2:Tmat4; dest:Tmat4);cdecl;external;
procedure glmc_inv_tr(mat:Tmat4);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_affine_h  }

implementation


end.
