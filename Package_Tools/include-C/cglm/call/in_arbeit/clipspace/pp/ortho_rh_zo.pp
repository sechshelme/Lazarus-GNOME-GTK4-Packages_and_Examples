
unit ortho_rh_zo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ortho_rh_zo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ortho_rh_zo.h
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
{$ifndef cglmc_ortho_rh_zo_h}
{$define cglmc_ortho_rh_zo_h}
{ C++ extern C conditionnal removed }
{$include "../../cglm.h"}

procedure glmc_ortho_rh_zo(left:single; right:single; bottom:single; top:single; nearZ:single; 
            farZ:single; dest:Tmat4);cdecl;external;
procedure glmc_ortho_aabb_rh_zo(box:array[0..1] of Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_ortho_aabb_p_rh_zo(box:array[0..1] of Tvec3; padding:single; dest:Tmat4);cdecl;external;
procedure glmc_ortho_aabb_pz_rh_zo(box:array[0..1] of Tvec3; padding:single; dest:Tmat4);cdecl;external;
procedure glmc_ortho_default_rh_zo(aspect:single; dest:Tmat4);cdecl;external;
procedure glmc_ortho_default_s_rh_zo(aspect:single; size:single; dest:Tmat4);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_ortho_rh_zo_h  }

implementation


end.
