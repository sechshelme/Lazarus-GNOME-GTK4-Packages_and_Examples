
unit persp_rh_zo;
interface

{
  Automatically converted by H2Pas 1.0.0 from persp_rh_zo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    persp_rh_zo.h
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
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
  }
{$ifndef cglmc_persp_rh_zo_h}
{$define cglmc_persp_rh_zo_h}
{ C++ extern C conditionnal removed }
{$include "../../cglm.h"}

procedure glmc_frustum_rh_zo(left:single; right:single; bottom:single; top:single; nearZ:single; 
            farZ:single; dest:Tmat4);cdecl;external;
procedure glmc_perspective_rh_zo(fovy:single; aspect:single; nearVal:single; farVal:single; dest:Tmat4);cdecl;external;
procedure glmc_persp_move_far_rh_zo(proj:Tmat4; deltaFar:single);cdecl;external;
procedure glmc_persp_decomp_rh_zo(proj:Tmat4; nearZ:Psingle; farZ:Psingle; top:Psingle; bottom:Psingle; 
            left:Psingle; right:Psingle);cdecl;external;
procedure glmc_persp_decompv_rh_zo(proj:Tmat4; dest:array[0..5] of single);cdecl;external;
procedure glmc_persp_decomp_x_rh_zo(proj:Tmat4; left:Psingle; right:Psingle);cdecl;external;
procedure glmc_persp_decomp_y_rh_zo(proj:Tmat4; top:Psingle; bottom:Psingle);cdecl;external;
procedure glmc_persp_decomp_z_rh_zo(proj:Tmat4; nearZ:Psingle; farZ:Psingle);cdecl;external;
procedure glmc_persp_decomp_far_rh_zo(proj:Tmat4; farZ:Psingle);cdecl;external;
procedure glmc_persp_decomp_near_rh_zo(proj:Tmat4; nearZ:Psingle);cdecl;external;
procedure glmc_persp_sizes_rh_zo(proj:Tmat4; fovy:single; dest:Tvec4);cdecl;external;
function glmc_persp_fovy_rh_zo(proj:Tmat4):single;cdecl;external;
function glmc_persp_aspect_rh_zo(proj:Tmat4):single;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_persp_rh_zo_h  }

implementation


end.
