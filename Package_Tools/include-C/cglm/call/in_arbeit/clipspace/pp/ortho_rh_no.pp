
unit ortho_rh_no;
interface

{
  Automatically converted by H2Pas 1.0.0 from ortho_rh_no.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ortho_rh_no.h
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
{$ifndef cglmc_ortho_rh_no_h}
{$define cglmc_ortho_rh_no_h}
{ C++ extern C conditionnal removed }
{$include "../../cglm.h"}

procedure glmc_ortho_rh_no(left:single; right:single; bottom:single; top:single; nearZ:single; 
            farZ:single; dest:Tmat4);cdecl;external;
procedure glmc_ortho_aabb_rh_no(box:array[0..1] of Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_ortho_aabb_p_rh_no(box:array[0..1] of Tvec3; padding:single; dest:Tmat4);cdecl;external;
procedure glmc_ortho_aabb_pz_rh_no(box:array[0..1] of Tvec3; padding:single; dest:Tmat4);cdecl;external;
procedure glmc_ortho_default_rh_no(aspect:single; dest:Tmat4);cdecl;external;
procedure glmc_ortho_default_s_rh_no(aspect:single; size:single; dest:Tmat4);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_ortho_rh_no_h  }

implementation


end.
