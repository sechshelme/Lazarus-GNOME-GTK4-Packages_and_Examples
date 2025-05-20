
unit efl_gfx_gradient_radial_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_gradient_radial_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_gradient_radial_eo.h
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
Pdouble  = ^double;
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Gradient_Radial  = ^Efl_Gfx_Gradient_Radial;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_GRADIENT_RADIAL_EO_H_}
{$define _EFL_GFX_GRADIENT_RADIAL_EO_H_}
{$ifndef _EFL_GFX_GRADIENT_RADIAL_EO_CLASS_TYPE}
{$define _EFL_GFX_GRADIENT_RADIAL_EO_CLASS_TYPE}
type
  PEfl_Gfx_Gradient_Radial = ^TEfl_Gfx_Gradient_Radial;
  TEfl_Gfx_Gradient_Radial = TEo;
{$endif}
{$ifndef _EFL_GFX_GRADIENT_RADIAL_EO_TYPES}
{$define _EFL_GFX_GRADIENT_RADIAL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl graphics gradient radial interface
 *
 * @ingroup Efl_Gfx_Gradient_Radial
  }

{ was #define dname def_expr }
function EFL_GFX_GRADIENT_RADIAL_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_gradient_radial_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The center of this radial gradient.
 *
 * @param[in] obj The object.
 * @param[in] x X co-ordinate of center point
 * @param[in] y Y co-ordinate of center point
 *
 * @ingroup Efl_Gfx_Gradient_Radial
  }
procedure efl_gfx_gradient_radial_center_set(obj:PEo; x:Tdouble; y:Tdouble);cdecl;external;
{*
 * @brief The center of this radial gradient.
 *
 * @param[in] obj The object.
 * @param[out] x X co-ordinate of center point
 * @param[out] y Y co-ordinate of center point
 *
 * @ingroup Efl_Gfx_Gradient_Radial
  }
(* Const before type ignored *)
procedure efl_gfx_gradient_radial_center_get(obj:PEo; x:Pdouble; y:Pdouble);cdecl;external;
{*
 * @brief The radius of this radial gradient.
 *
 * @param[in] obj The object.
 * @param[in] r Center radius
 *
 * @ingroup Efl_Gfx_Gradient_Radial
  }
procedure efl_gfx_gradient_radial_radius_set(obj:PEo; r:Tdouble);cdecl;external;
{*
 * @brief The radius of this radial gradient.
 *
 * @param[in] obj The object.
 *
 * @return Center radius
 *
 * @ingroup Efl_Gfx_Gradient_Radial
  }
(* Const before type ignored *)
function efl_gfx_gradient_radial_radius_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief The focal point of this radial gradient.
 *
 * @param[in] obj The object.
 * @param[in] x X co-ordinate of focal point
 * @param[in] y Y co-ordinate of focal point
 *
 * @ingroup Efl_Gfx_Gradient_Radial
  }
procedure efl_gfx_gradient_radial_focal_set(obj:PEo; x:Tdouble; y:Tdouble);cdecl;external;
{*
 * @brief The focal point of this radial gradient.
 *
 * @param[in] obj The object.
 * @param[out] x X co-ordinate of focal point
 * @param[out] y Y co-ordinate of focal point
 *
 * @ingroup Efl_Gfx_Gradient_Radial
  }
(* Const before type ignored *)
procedure efl_gfx_gradient_radial_focal_get(obj:PEo; x:Pdouble; y:Pdouble);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_GRADIENT_RADIAL_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_GRADIENT_RADIAL_INTERFACE:=efl_gfx_gradient_radial_interface_get;
  end;


end.
