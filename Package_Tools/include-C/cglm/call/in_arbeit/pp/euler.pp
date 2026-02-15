
unit euler;
interface

{
  Automatically converted by H2Pas 1.0.0 from euler.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    euler.h
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
{$ifndef cglmc_euler_h}
{$define cglmc_euler_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_euler_angles(m:Tmat4; dest:Tvec3);cdecl;external;
procedure glmc_euler(angles:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_euler_xyz(angles:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_euler_zyx(angles:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_euler_zxy(angles:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_euler_xzy(angles:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_euler_yzx(angles:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_euler_yxz(angles:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_euler_by_order(angles:Tvec3; axis:Tglm_euler_seq; dest:Tmat4);cdecl;external;
procedure glmc_euler_xyz_quat(angles:Tvec3; dest:Tversor);cdecl;external;
procedure glmc_euler_xzy_quat(angles:Tvec3; dest:Tversor);cdecl;external;
procedure glmc_euler_yxz_quat(angles:Tvec3; dest:Tversor);cdecl;external;
procedure glmc_euler_yzx_quat(angles:Tvec3; dest:Tversor);cdecl;external;
procedure glmc_euler_zxy_quat(angles:Tvec3; dest:Tversor);cdecl;external;
procedure glmc_euler_zyx_quat(angles:Tvec3; dest:Tversor);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_euler_h  }

implementation


end.
