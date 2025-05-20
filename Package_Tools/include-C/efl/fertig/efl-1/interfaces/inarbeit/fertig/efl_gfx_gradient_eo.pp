
unit efl_gfx_gradient_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_gradient_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_gradient_eo.h
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
Pdword  = ^dword;
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Gradient  = ^Efl_Gfx_Gradient;
PEfl_Gfx_Gradient_Stop  = ^Efl_Gfx_Gradient_Stop;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_GRADIENT_EO_H_}
{$define _EFL_GFX_GRADIENT_EO_H_}
{$ifndef _EFL_GFX_GRADIENT_EO_CLASS_TYPE}
{$define _EFL_GFX_GRADIENT_EO_CLASS_TYPE}
type
  PEfl_Gfx_Gradient = ^TEfl_Gfx_Gradient;
  TEfl_Gfx_Gradient = TEo;
{$endif}
{$ifndef _EFL_GFX_GRADIENT_EO_TYPES}
{$define _EFL_GFX_GRADIENT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl graphics gradient interface
 *
 * @ingroup Efl_Gfx_Gradient
  }

{ was #define dname def_expr }
function EFL_GFX_GRADIENT_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_gradient_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The list of color stops for the gradient
 *
 * @param[in] obj The object.
 * @param[in] colors Color stops list
 * @param[in] length Length of the list
 *
 * @ingroup Efl_Gfx_Gradient
  }
(* Const before type ignored *)
procedure efl_gfx_gradient_stop_set(obj:PEo; colors:PEfl_Gfx_Gradient_Stop; length:dword);cdecl;external;
{*
 * @brief The list of color stops for the gradient
 *
 * @param[in] obj The object.
 * @param[out] colors Color stops list
 * @param[out] length Length of the list
 *
 * @ingroup Efl_Gfx_Gradient
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_gfx_gradient_stop_get(obj:PEo; colors:PPEfl_Gfx_Gradient_Stop; length:Pdword);cdecl;external;
{*
 * @brief The spread method that should be used for this gradient. The default
 * is @ref EFL_GFX_GRADIENT_SPREAD_PAD.
 *
 * @param[in] obj The object.
 * @param[in] s Spread type to be used.
 *
 * @ingroup Efl_Gfx_Gradient
  }
procedure efl_gfx_gradient_spread_set(obj:PEo; s:TEfl_Gfx_Gradient_Spread);cdecl;external;
{*
 * @brief The spread method that should be used for this gradient. The default
 * is @ref EFL_GFX_GRADIENT_SPREAD_PAD.
 *
 * @param[in] obj The object.
 *
 * @return Spread type to be used.
 *
 * @ingroup Efl_Gfx_Gradient
  }
(* Const before type ignored *)
function efl_gfx_gradient_spread_get(obj:PEo):TEfl_Gfx_Gradient_Spread;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_GRADIENT_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_GRADIENT_INTERFACE:=efl_gfx_gradient_interface_get;
  end;


end.
