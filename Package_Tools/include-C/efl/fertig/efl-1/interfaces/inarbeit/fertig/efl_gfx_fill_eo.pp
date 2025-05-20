
unit efl_gfx_fill_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_fill_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_fill_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Fill  = ^Efl_Gfx_Fill;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_FILL_EO_H_}
{$define _EFL_GFX_FILL_EO_H_}
{$ifndef _EFL_GFX_FILL_EO_CLASS_TYPE}
{$define _EFL_GFX_FILL_EO_CLASS_TYPE}
type
  PEfl_Gfx_Fill = ^TEfl_Gfx_Fill;
  TEfl_Gfx_Fill = TEo;
{$endif}
{$ifndef _EFL_GFX_FILL_EO_TYPES}
{$define _EFL_GFX_FILL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl graphics fill interface
 *
 * @ingroup Efl_Gfx_Fill
  }

{ was #define dname def_expr }
function EFL_GFX_FILL_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_fill_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Binds the object's @ref efl_gfx_fill_get property to its actual
 * geometry.
 *
 * If @c true, then every time the object is resized, it will automatically
 * trigger a call to @ref efl_gfx_fill_set with the new size (and 0, 0 as
 * source image's origin), so the image will cover the whole object's area.
 *
 * This property takes precedence over @ref efl_gfx_fill_get. If set to
 * @c false, then @ref efl_gfx_fill_get should be set.
 *
 * This flag is @c true by default (used to be @c false with the old APIs, and
 * was known as "filled").
 *
 * @param[in] obj The object.
 * @param[in] filled @c true to make the fill property follow object size or
 * @c false otherwise.
 *
 * @ingroup Efl_Gfx_Fill
  }
procedure efl_gfx_fill_auto_set(obj:PEo; filled:TEina_Bool);cdecl;external;
{*
 * @brief Binds the object's @ref efl_gfx_fill_get property to its actual
 * geometry.
 *
 * If @c true, then every time the object is resized, it will automatically
 * trigger a call to @ref efl_gfx_fill_set with the new size (and 0, 0 as
 * source image's origin), so the image will cover the whole object's area.
 *
 * This property takes precedence over @ref efl_gfx_fill_get. If set to
 * @c false, then @ref efl_gfx_fill_get should be set.
 *
 * This flag is @c true by default (used to be @c false with the old APIs, and
 * was known as "filled").
 *
 * @param[in] obj The object.
 *
 * @return @c true to make the fill property follow object size or @c false
 * otherwise.
 *
 * @ingroup Efl_Gfx_Fill
  }
(* Const before type ignored *)
function efl_gfx_fill_auto_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Specifies how to tile an image to fill its rectangle geometry.
 *
 * Note that if @c w or @c h are smaller than the dimensions of the object, the
 * displayed image will be tiled around the object's area. To have only one
 * copy of the bound image drawn, @c x and @c y must be 0 and @c w and @c h
 * need to be the exact width and height of the image object itself,
 * respectively.
 *
 * Setting this property will reset the @ref efl_gfx_fill_auto_get to @c false.
 *
 * @param[in] obj The object.
 * @param[in] fill The top-left corner to start drawing from as well as the
 * size at which the bound image will be displayed.
 *
 * @ingroup Efl_Gfx_Fill
  }
procedure efl_gfx_fill_set(obj:PEo; fill:TEina_Rect);cdecl;external;
{*
 * @brief Specifies how to tile an image to fill its rectangle geometry.
 *
 * Note that if @c w or @c h are smaller than the dimensions of the object, the
 * displayed image will be tiled around the object's area. To have only one
 * copy of the bound image drawn, @c x and @c y must be 0 and @c w and @c h
 * need to be the exact width and height of the image object itself,
 * respectively.
 *
 * Setting this property will reset the @ref efl_gfx_fill_auto_get to @c false.
 *
 * @param[in] obj The object.
 *
 * @return The top-left corner to start drawing from as well as the size at
 * which the bound image will be displayed.
 *
 * @ingroup Efl_Gfx_Fill
  }
(* Const before type ignored *)
function efl_gfx_fill_get(obj:PEo):TEina_Rect;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_FILL_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_FILL_INTERFACE:=efl_gfx_fill_interface_get;
  end;


end.
