
unit efl_gfx_shape_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_shape_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_shape_eo.h
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
PEfl_Gfx_Dash  = ^Efl_Gfx_Dash;
PEfl_Gfx_Shape  = ^Efl_Gfx_Shape;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_SHAPE_EO_H_}
{$define _EFL_GFX_SHAPE_EO_H_}
{$ifndef _EFL_GFX_SHAPE_EO_CLASS_TYPE}
{$define _EFL_GFX_SHAPE_EO_CLASS_TYPE}
type
  PEfl_Gfx_Shape = ^TEfl_Gfx_Shape;
  TEfl_Gfx_Shape = TEo;
{$endif}
{$ifndef _EFL_GFX_SHAPE_EO_TYPES}
{$define _EFL_GFX_SHAPE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* EFL graphics shape object interface
 *
 * @ingroup Efl_Gfx_Shape
  }

{ was #define dname def_expr }
function EFL_GFX_SHAPE_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_shape_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief The stroke scale to be used for stroking the path. Will be used along
 * with stroke width property.
 *
 * @param[in] obj The object.
 * @param[in] s Stroke scale value
 *
 * @ingroup Efl_Gfx_Shape
  }
procedure efl_gfx_shape_stroke_scale_set(obj:PEo; s:Tdouble);cdecl;external;
{*
 * @brief The stroke scale to be used for stroking the path. Will be used along
 * with stroke width property.
 *
 * @param[in] obj The object.
 *
 * @return Stroke scale value
 *
 * @ingroup Efl_Gfx_Shape
  }
(* Const before type ignored *)
function efl_gfx_shape_stroke_scale_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief The color to be used for stroking the path.
 *
 * @param[in] obj The object.
 * @param[in] r The red component of the given color.
 * @param[in] g The green component of the given color.
 * @param[in] b The blue component of the given color.
 * @param[in] a The alpha component of the given color.
 *
 * @ingroup Efl_Gfx_Shape
  }
procedure efl_gfx_shape_stroke_color_set(obj:PEo; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief The color to be used for stroking the path.
 *
 * @param[in] obj The object.
 * @param[out] r The red component of the given color.
 * @param[out] g The green component of the given color.
 * @param[out] b The blue component of the given color.
 * @param[out] a The alpha component of the given color.
 *
 * @ingroup Efl_Gfx_Shape
  }
(* Const before type ignored *)
procedure efl_gfx_shape_stroke_color_get(obj:PEo; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief The stroke width to be used for stroking the path.
 *
 * @param[in] obj The object.
 * @param[in] w Stroke width to be used
 *
 * @ingroup Efl_Gfx_Shape
  }
procedure efl_gfx_shape_stroke_width_set(obj:PEo; w:Tdouble);cdecl;external;
{*
 * @brief The stroke width to be used for stroking the path.
 *
 * @param[in] obj The object.
 *
 * @return Stroke width to be used
 *
 * @ingroup Efl_Gfx_Shape
  }
(* Const before type ignored *)
function efl_gfx_shape_stroke_width_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Not implemented
 *
 * @param[in] obj The object.
 * @param[in] centered Centered stroke location
 *
 * @ingroup Efl_Gfx_Shape
  }
procedure efl_gfx_shape_stroke_location_set(obj:PEo; centered:Tdouble);cdecl;external;
{*
 * @brief Not implemented
 *
 * @param[in] obj The object.
 *
 * @return Centered stroke location
 *
 * @ingroup Efl_Gfx_Shape
  }
(* Const before type ignored *)
function efl_gfx_shape_stroke_location_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Set stroke dash pattern. A dash pattern is specified by dashes, an
 * array of @ref Efl_Gfx_Dash. @ref Efl_Gfx_Dash values(length, gap) must be
 * positive.
 *
 * See also @ref Efl_Gfx_Dash
 *
 * @param[in] obj The object.
 * @param[in] dash Stroke dash
 * @param[in] length Stroke dash length
 *
 * @ingroup Efl_Gfx_Shape
  }
(* Const before type ignored *)
procedure efl_gfx_shape_stroke_dash_set(obj:PEo; dash:PEfl_Gfx_Dash; length:dword);cdecl;external;
{*
 * @brief Set stroke dash pattern. A dash pattern is specified by dashes, an
 * array of @ref Efl_Gfx_Dash. @ref Efl_Gfx_Dash values(length, gap) must be
 * positive.
 *
 * See also @ref Efl_Gfx_Dash
 *
 * @param[in] obj The object.
 * @param[out] dash Stroke dash
 * @param[out] length Stroke dash length
 *
 * @ingroup Efl_Gfx_Shape
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_gfx_shape_stroke_dash_get(obj:PEo; dash:PPEfl_Gfx_Dash; length:Pdword);cdecl;external;
{*
 * @brief The cap style to be used for stroking the path. The cap will be used
 * for capping the end point of a open subpath.
 *
 * See also @ref Efl_Gfx_Cap.
 *
 * @param[in] obj The object.
 * @param[in] c Cap style to use, default is @ref EFL_GFX_CAP_BUTT
 *
 * @ingroup Efl_Gfx_Shape
  }
procedure efl_gfx_shape_stroke_cap_set(obj:PEo; c:TEfl_Gfx_Cap);cdecl;external;
{*
 * @brief The cap style to be used for stroking the path. The cap will be used
 * for capping the end point of a open subpath.
 *
 * See also @ref Efl_Gfx_Cap.
 *
 * @param[in] obj The object.
 *
 * @return Cap style to use, default is @ref EFL_GFX_CAP_BUTT
 *
 * @ingroup Efl_Gfx_Shape
  }
(* Const before type ignored *)
function efl_gfx_shape_stroke_cap_get(obj:PEo):TEfl_Gfx_Cap;cdecl;external;
{*
 * @brief The join style to be used for stroking the path. The join style will
 * be used for joining the two line segment while stroking the path.
 *
 * See also @ref Efl_Gfx_Join.
 *
 * @param[in] obj The object.
 * @param[in] j Join style to use, default is @ref EFL_GFX_JOIN_MITER
 *
 * @ingroup Efl_Gfx_Shape
  }
procedure efl_gfx_shape_stroke_join_set(obj:PEo; j:TEfl_Gfx_Join);cdecl;external;
{*
 * @brief The join style to be used for stroking the path. The join style will
 * be used for joining the two line segment while stroking the path.
 *
 * See also @ref Efl_Gfx_Join.
 *
 * @param[in] obj The object.
 *
 * @return Join style to use, default is @ref EFL_GFX_JOIN_MITER
 *
 * @ingroup Efl_Gfx_Shape
  }
(* Const before type ignored *)
function efl_gfx_shape_stroke_join_get(obj:PEo):TEfl_Gfx_Join;cdecl;external;
{*
 * @brief The stroke_miterlimit is a presentation defining a limit on the ratio
 * of the miter length to the stroke-width used to draw a miter join.
 *
 * @param[in] obj The object.
 * @param[in] miterlimit Limit value on the ratio of the miter.
 *
 * @ingroup Efl_Gfx_Shape
  }
procedure efl_gfx_shape_stroke_miterlimit_set(obj:PEo; miterlimit:Tdouble);cdecl;external;
{*
 * @brief The stroke_miterlimit is a presentation defining a limit on the ratio
 * of the miter length to the stroke-width used to draw a miter join.
 *
 * @param[in] obj The object.
 *
 * @return Limit value on the ratio of the miter.
 *
 * @ingroup Efl_Gfx_Shape
  }
(* Const before type ignored *)
function efl_gfx_shape_stroke_miterlimit_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief The fill rule of the given shape object.
 * @ref EFL_GFX_FILL_RULE_WINDING or @ref EFL_GFX_FILL_RULE_ODD_EVEN.
 *
 * @param[in] obj The object.
 * @param[in] fill_rule The current fill rule of the shape object. One of
 * @ref EFL_GFX_FILL_RULE_WINDING or @ref EFL_GFX_FILL_RULE_ODD_EVEN
 *
 * @ingroup Efl_Gfx_Shape
  }
procedure efl_gfx_shape_fill_rule_set(obj:PEo; fill_rule:TEfl_Gfx_Fill_Rule);cdecl;external;
{*
 * @brief The fill rule of the given shape object.
 * @ref EFL_GFX_FILL_RULE_WINDING or @ref EFL_GFX_FILL_RULE_ODD_EVEN.
 *
 * @param[in] obj The object.
 *
 * @return The current fill rule of the shape object. One of
 * @ref EFL_GFX_FILL_RULE_WINDING or @ref EFL_GFX_FILL_RULE_ODD_EVEN
 *
 * @ingroup Efl_Gfx_Shape
  }
(* Const before type ignored *)
function efl_gfx_shape_fill_rule_get(obj:PEo):TEfl_Gfx_Fill_Rule;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_SHAPE_MIXIN : longint; { return type might be wrong }
  begin
    EFL_GFX_SHAPE_MIXIN:=efl_gfx_shape_mixin_get;
  end;


end.
