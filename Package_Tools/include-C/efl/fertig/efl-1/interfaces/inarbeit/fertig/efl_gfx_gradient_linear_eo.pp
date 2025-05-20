
unit efl_gfx_gradient_linear_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_gradient_linear_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_gradient_linear_eo.h
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
PEfl_Gfx_Gradient_Linear  = ^Efl_Gfx_Gradient_Linear;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_GRADIENT_LINEAR_EO_H_}
{$define _EFL_GFX_GRADIENT_LINEAR_EO_H_}
{$ifndef _EFL_GFX_GRADIENT_LINEAR_EO_CLASS_TYPE}
{$define _EFL_GFX_GRADIENT_LINEAR_EO_CLASS_TYPE}
type
  PEfl_Gfx_Gradient_Linear = ^TEfl_Gfx_Gradient_Linear;
  TEfl_Gfx_Gradient_Linear = TEo;
{$endif}
{$ifndef _EFL_GFX_GRADIENT_LINEAR_EO_TYPES}
{$define _EFL_GFX_GRADIENT_LINEAR_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl graphics gradient linear interface
 *
 * @ingroup Efl_Gfx_Gradient_Linear
  }

{ was #define dname def_expr }
function EFL_GFX_GRADIENT_LINEAR_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_gradient_linear_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The start point of this linear gradient.
 *
 * @param[in] obj The object.
 * @param[in] x X co-ordinate of start point
 * @param[in] y Y co-ordinate of start point
 *
 * @ingroup Efl_Gfx_Gradient_Linear
  }
procedure efl_gfx_gradient_linear_start_set(obj:PEo; x:Tdouble; y:Tdouble);cdecl;external;
{*
 * @brief The start point of this linear gradient.
 *
 * @param[in] obj The object.
 * @param[out] x X co-ordinate of start point
 * @param[out] y Y co-ordinate of start point
 *
 * @ingroup Efl_Gfx_Gradient_Linear
  }
(* Const before type ignored *)
procedure efl_gfx_gradient_linear_start_get(obj:PEo; x:Pdouble; y:Pdouble);cdecl;external;
{*
 * @brief The end point of this linear gradient.
 *
 * @param[in] obj The object.
 * @param[in] x X co-ordinate of end point
 * @param[in] y Y co-ordinate of end point
 *
 * @ingroup Efl_Gfx_Gradient_Linear
  }
procedure efl_gfx_gradient_linear_end_set(obj:PEo; x:Tdouble; y:Tdouble);cdecl;external;
{*
 * @brief The end point of this linear gradient.
 *
 * @param[in] obj The object.
 * @param[out] x X co-ordinate of end point
 * @param[out] y Y co-ordinate of end point
 *
 * @ingroup Efl_Gfx_Gradient_Linear
  }
(* Const before type ignored *)
procedure efl_gfx_gradient_linear_end_get(obj:PEo; x:Pdouble; y:Pdouble);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_GRADIENT_LINEAR_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_GRADIENT_LINEAR_INTERFACE:=efl_gfx_gradient_linear_interface_get;
  end;


end.
