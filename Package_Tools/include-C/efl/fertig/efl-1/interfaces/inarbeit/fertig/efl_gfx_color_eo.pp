
unit efl_gfx_color_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_color_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_color_eo.h
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
Pchar  = ^char;
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Color  = ^Efl_Gfx_Color;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_COLOR_EO_H_}
{$define _EFL_GFX_COLOR_EO_H_}
{$ifndef _EFL_GFX_COLOR_EO_CLASS_TYPE}
{$define _EFL_GFX_COLOR_EO_CLASS_TYPE}
type
  PEfl_Gfx_Color = ^TEfl_Gfx_Color;
  TEfl_Gfx_Color = TEo;
{$endif}
{$ifndef _EFL_GFX_COLOR_EO_TYPES}
{$define _EFL_GFX_COLOR_EO_TYPES}
{$endif}
{* Efl Gfx Color mixin class
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Color
  }

{ was #define dname def_expr }
function EFL_GFX_COLOR_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_color_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief The general/main color of the given Evas object.
 *
 * Represents the main color's RGB component (and alpha channel) values, which
 * range from 0 to 255. For the alpha channel, which defines the object's
 * transparency level, 0 means totally transparent, while 255 means opaque.
 * These color values are premultiplied by the alpha value.
 *
 * Usually you'll use this attribute for text and rectangle objects, where the
 * main color is the only color. If set for objects which themselves have
 * colors, like the images one, those colors get modulated by this one.
 *
 * All newly created Evas rectangles get the default color values of 255 255
 * 255 255 (opaque white).
 *
 * When reading this property, use @c NULL pointers on the components you're
 * not interested in and they'll be ignored by the function.
 *
 * @param[in] obj The object.
 * @param[in] r
 * @param[in] g
 * @param[in] b
 * @param[in] a
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Color
  }
procedure efl_gfx_color_set(obj:PEo; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief The general/main color of the given Evas object.
 *
 * Represents the main color's RGB component (and alpha channel) values, which
 * range from 0 to 255. For the alpha channel, which defines the object's
 * transparency level, 0 means totally transparent, while 255 means opaque.
 * These color values are premultiplied by the alpha value.
 *
 * Usually you'll use this attribute for text and rectangle objects, where the
 * main color is the only color. If set for objects which themselves have
 * colors, like the images one, those colors get modulated by this one.
 *
 * All newly created Evas rectangles get the default color values of 255 255
 * 255 255 (opaque white).
 *
 * When reading this property, use @c NULL pointers on the components you're
 * not interested in and they'll be ignored by the function.
 *
 * @param[in] obj The object.
 * @param[out] r
 * @param[out] g
 * @param[out] b
 * @param[out] a
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Color
  }
(* Const before type ignored *)
procedure efl_gfx_color_get(obj:PEo; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Hexadecimal color code of given Evas object (#RRGGBBAA).
 *
 * @param[in] obj The object.
 * @param[in] colorcode the hex color code.
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Color
  }
(* Const before type ignored *)
procedure efl_gfx_color_code_set(obj:PEo; colorcode:Pchar);cdecl;external;
{*
 * @brief Hexadecimal color code of given Evas object (#RRGGBBAA).
 *
 * @param[in] obj The object.
 *
 * @return the hex color code.
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Color
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gfx_color_code_get(obj:PEo):Pchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_COLOR_MIXIN : longint; { return type might be wrong }
  begin
    EFL_GFX_COLOR_MIXIN:=efl_gfx_color_mixin_get;
  end;


end.
