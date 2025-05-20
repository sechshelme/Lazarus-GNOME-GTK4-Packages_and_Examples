
unit efl_gfx_blur_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_blur_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_blur_eo.h
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
PEfl_Gfx_Blur  = ^Efl_Gfx_Blur;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_BLUR_EO_H_}
{$define _EFL_GFX_BLUR_EO_H_}
{$ifndef _EFL_GFX_BLUR_EO_CLASS_TYPE}
{$define _EFL_GFX_BLUR_EO_CLASS_TYPE}
type
  PEfl_Gfx_Blur = ^TEfl_Gfx_Blur;
  TEfl_Gfx_Blur = TEo;
{$endif}
{$ifndef _EFL_GFX_BLUR_EO_TYPES}
{$define _EFL_GFX_BLUR_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A simple API to apply blur effects.
 *
 * Those API's might use @ref Efl_Gfx_Filter internally. It might be necessary
 * to also specify the color of the blur with @ref efl_gfx_color_get.
 *
 * @ingroup Efl_Gfx_Blur
  }

{ was #define dname def_expr }
function EFL_GFX_BLUR_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_blur_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The blur radius in pixels.
 *
 * @param[in] obj The object.
 * @param[in] rx The horizontal blur radius.
 * @param[in] ry The vertical blur radius.
 *
 * @ingroup Efl_Gfx_Blur
  }
procedure efl_gfx_blur_radius_set(obj:PEo; rx:Tdouble; ry:Tdouble);cdecl;external;
{*
 * @brief The blur radius in pixels.
 *
 * @param[in] obj The object.
 * @param[out] rx The horizontal blur radius.
 * @param[out] ry The vertical blur radius.
 *
 * @ingroup Efl_Gfx_Blur
  }
(* Const before type ignored *)
procedure efl_gfx_blur_radius_get(obj:PEo; rx:Pdouble; ry:Pdouble);cdecl;external;
{*
 * @brief An offset relative to the original pixels.
 *
 * This property allows for drop shadow effects.
 *
 * @param[in] obj The object.
 * @param[in] ox Horizontal offset in pixels.
 * @param[in] oy Vertical offset in pixels.
 *
 * @ingroup Efl_Gfx_Blur
  }
procedure efl_gfx_blur_offset_set(obj:PEo; ox:Tdouble; oy:Tdouble);cdecl;external;
{*
 * @brief An offset relative to the original pixels.
 *
 * This property allows for drop shadow effects.
 *
 * @param[in] obj The object.
 * @param[out] ox Horizontal offset in pixels.
 * @param[out] oy Vertical offset in pixels.
 *
 * @ingroup Efl_Gfx_Blur
  }
(* Const before type ignored *)
procedure efl_gfx_blur_offset_get(obj:PEo; ox:Pdouble; oy:Pdouble);cdecl;external;
{*
 * @brief How much the original image should be "grown" before blurring.
 *
 * Growing is a combination of blur & color levels adjustment. If the value of
 * grow is positive, the pixels will appear more "fat" or "bold" than the
 * original. If the value is negative, a shrink effect happens instead.
 *
 * This is can be used efficiently to create glow effects.
 *
 * @param[in] obj The object.
 * @param[in] radius How much to grow the original pixel data.
 *
 * @ingroup Efl_Gfx_Blur
  }
procedure efl_gfx_blur_grow_set(obj:PEo; radius:Tdouble);cdecl;external;
{*
 * @brief How much the original image should be "grown" before blurring.
 *
 * Growing is a combination of blur & color levels adjustment. If the value of
 * grow is positive, the pixels will appear more "fat" or "bold" than the
 * original. If the value is negative, a shrink effect happens instead.
 *
 * This is can be used efficiently to create glow effects.
 *
 * @param[in] obj The object.
 *
 * @return How much to grow the original pixel data.
 *
 * @ingroup Efl_Gfx_Blur
  }
(* Const before type ignored *)
function efl_gfx_blur_grow_get(obj:PEo):Tdouble;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_BLUR_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_BLUR_INTERFACE:=efl_gfx_blur_interface_get;
  end;


end.
