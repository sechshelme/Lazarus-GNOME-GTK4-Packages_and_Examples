
unit evas_text_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from evas_text_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    evas_text_eo_legacy.h
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
PEvas_Text  = ^Evas_Text;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_TEXT_EO_LEGACY_H_}
{$define _EVAS_TEXT_EO_LEGACY_H_}
{$ifndef _EVAS_TEXT_EO_CLASS_TYPE}
{$define _EVAS_TEXT_EO_CLASS_TYPE}
type
  PEvas_Text = ^TEvas_Text;
  TEvas_Text = TEo;
{$endif}
{$ifndef _EVAS_TEXT_EO_TYPES}
{$define _EVAS_TEXT_EO_TYPES}
{$endif}
{*
 * @brief Controls the shadow color for the given text object.
 *
 * Shadow effects are fading colors decorating the text underneath it.  They
 * will be shown if the object is set to one of the following styles:
 *
 * - @c EVAS_TEXT_STYLE_TYPE_SHADOW - @c EVAS_TEXT_STYLE_TYPE_OUTLINE_SHADOW -
 * @c EVAS_TEXT_STYLE_TYPE_FAR_SHADOW -
 * @c EVAS_TEXT_STYLE_TYPE_OUTLINE_SOFT_SHADOW -
 * @c EVAS_TEXT_STYLE_TYPE_SOFT_SHADOW -
 * @c EVAS_TEXT_STYLE_TYPE_FAR_SOFT_SHADOW
 *
 * One can also change the direction where the shadow grows to, with
 * @ref evas_object_text_style_get
 *
 * See @ref evas_object_text_shadow_color_get
 *
 * @param[in] obj The object.
 * @param[in] r The red component of the given color.
 * @param[in] g The green component of the given color.
 * @param[in] b The blue component of the given color.
 * @param[in] a The alpha component of the given color.
 *
 * @ingroup Evas_Object_Text_Group
  }

procedure evas_object_text_shadow_color_set(obj:PEvas_Text; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief Controls the shadow color for the given text object.
 *
 * Shadow effects are fading colors decorating the text underneath it.  They
 * will be shown if the object is set to one of the following styles:
 *
 * - @c EVAS_TEXT_STYLE_TYPE_SHADOW - @c EVAS_TEXT_STYLE_TYPE_OUTLINE_SHADOW -
 * @c EVAS_TEXT_STYLE_TYPE_FAR_SHADOW -
 * @c EVAS_TEXT_STYLE_TYPE_OUTLINE_SOFT_SHADOW -
 * @c EVAS_TEXT_STYLE_TYPE_SOFT_SHADOW -
 * @c EVAS_TEXT_STYLE_TYPE_FAR_SOFT_SHADOW
 *
 * One can also change the direction where the shadow grows to, with
 * @ref evas_object_text_style_get
 *
 * See @ref evas_object_text_shadow_color_get
 *
 * @note Use @c NULL pointers on the color components you're not interested in:
 * they'll be ignored by the function.
 *
 * @param[in] obj The object.
 * @param[out] r The red component of the given color.
 * @param[out] g The green component of the given color.
 * @param[out] b The blue component of the given color.
 * @param[out] a The alpha component of the given color.
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
procedure evas_object_text_shadow_color_get(obj:PEvas_Text; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Controls the ellipsis that should be used for the text object.
 *
 * This is a value between 0.0 and 1.0 indicating the position of the text to
 * be shown. 0.0 means the start will be shown and the end trimmed, 1.0 means
 * the beginning will be trimmed and the end will be shown, and any value in
 * between will cause ellipsis to be added in both end of the text and the
 * requested part to be shown. -1.0 means ellipsis is turned off.
 *
 * @param[in] obj The object.
 * @param[in] ellipsis The ellipsis. Allowed values: -1.0 or 0.0-1.0
 *
 * @since 1.8
 *
 * @ingroup Evas_Object_Text_Group
  }
procedure evas_object_text_ellipsis_set(obj:PEvas_Text; ellipsis:Tdouble);cdecl;external;
{*
 * @brief Controls the ellipsis that should be used for the text object.
 *
 * This is a value between 0.0 and 1.0 indicating the position of the text to
 * be shown. 0.0 means the start will be shown and the end trimmed, 1.0 means
 * the beginning will be trimmed and the end will be shown, and any value in
 * between will cause ellipsis to be added in both end of the text and the
 * requested part to be shown. -1.0 means ellipsis is turned off.
 *
 * @param[in] obj The object.
 *
 * @return The ellipsis. Allowed values: -1.0 or 0.0-1.0
 *
 * @since 1.8
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_ellipsis_get(obj:PEvas_Text):Tdouble;cdecl;external;
{*
 * @brief Sets the BiDi delimiters used in the textblock.
 *
 * BiDi delimiters are use for in-paragraph separation of bidi segments. This
 * is useful for example in recipients fields of e-mail clients where bidi
 * oddities can occur when mixing RTL and LTR.
 *
 * @param[in] obj The object.
 * @param[in] delim A null terminated string of delimiters, e.g ",|".
 *
 * @since 1.1
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
procedure evas_object_text_bidi_delimiters_set(obj:PEvas_Text; delim:Pchar);cdecl;external;
{*
 * @brief Sets the BiDi delimiters used in the textblock.
 *
 * BiDi delimiters are use for in-paragraph separation of bidi segments. This
 * is useful for example in recipients fields of e-mail clients where bidi
 * oddities can occur when mixing RTL and LTR.
 *
 * @param[in] obj The object.
 *
 * @return A null terminated string of delimiters, e.g ",|".
 *
 * @since 1.1
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evas_object_text_bidi_delimiters_get(obj:PEvas_Text):Pchar;cdecl;external;
{*
 * @brief Controls the outline color for the given text object.
 *
 * Outline effects (colored lines around text glyphs) will be shown if the
 * object is set to one of the following styles: -
 * @c EVAS_TEXT_STYLE_TYPE_OUTLINE - @c EVAS_TEXT_STYLE_TYPE_SOFT_OUTLINE -
 * @c EVAS_TEXT_STYLE_TYPE_OUTLINE_SHADOW -
 * @c EVAS_TEXT_STYLE_TYPE_OUTLINE_SOFT_SHADOW
 *
 * @param[in] obj The object.
 * @param[in] r The red component of the given color.
 * @param[in] g The green component of the given color.
 * @param[in] b The blue component of the given color.
 * @param[in] a The alpha component of the given color.
 *
 * @ingroup Evas_Object_Text_Group
  }
procedure evas_object_text_outline_color_set(obj:PEvas_Text; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief Controls the outline color for the given text object.
 *
 * Outline effects (colored lines around text glyphs) will be shown if the
 * object is set to one of the following styles: -
 * @c EVAS_TEXT_STYLE_TYPE_OUTLINE - @c EVAS_TEXT_STYLE_TYPE_SOFT_OUTLINE -
 * @c EVAS_TEXT_STYLE_TYPE_OUTLINE_SHADOW -
 * @c EVAS_TEXT_STYLE_TYPE_OUTLINE_SOFT_SHADOW
 *
 * @param[in] obj The object.
 * @param[out] r The red component of the given color.
 * @param[out] g The green component of the given color.
 * @param[out] b The blue component of the given color.
 * @param[out] a The alpha component of the given color.
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
procedure evas_object_text_outline_color_get(obj:PEvas_Text; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Sets the 'glow 2' color for the given text object.
 *
 * 'Glow 2' effects are glowing colors decorating the text's (immediate)
 * surroundings.  They will be shown if the object is set to the
 * @c EVAS_TEXT_STYLE_TYPE_GLOW style. See also
 * @ref evas_object_text_glow_color_get.
 *
 * @param[in] obj The object.
 * @param[in] r The red component of the given color.
 * @param[in] g The green component of the given color.
 * @param[in] b The blue component of the given color.
 * @param[in] a The alpha component of the given color.
 *
 * @ingroup Evas_Object_Text_Group
  }
procedure evas_object_text_glow2_color_set(obj:PEvas_Text; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief Sets the 'glow 2' color for the given text object.
 *
 * 'Glow 2' effects are glowing colors decorating the text's (immediate)
 * surroundings.  They will be shown if the object is set to the
 * @c EVAS_TEXT_STYLE_TYPE_GLOW style. See also
 * @ref evas_object_text_glow_color_get.
 *
 * @param[in] obj The object.
 * @param[out] r The red component of the given color.
 * @param[out] g The green component of the given color.
 * @param[out] b The blue component of the given color.
 * @param[out] a The alpha component of the given color.
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
procedure evas_object_text_glow2_color_get(obj:PEvas_Text; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Controls the style to apply on the given text object.
 *
 * Text object styles are one of the values in @ref Evas_Text_Style_Type Some
 * of those values are combinations of more than one style, and some account
 * for the direction of the rendering of shadow effects.
 *
 * @note One may use the helper macros #EVAS_TEXT_STYLE_BASIC_SET and
 * #EVAS_TEXT_STYLE_SHADOW_DIRECTION_SET to assemble a style value.
 *
 * @param[in] obj The object.
 * @param[in] style Style type
 *
 * @ingroup Evas_Object_Text_Group
  }
procedure evas_object_text_style_set(obj:PEvas_Text; style:TEvas_Text_Style_Type);cdecl;external;
{*
 * @brief Controls the style to apply on the given text object.
 *
 * Text object styles are one of the values in @ref Evas_Text_Style_Type Some
 * of those values are combinations of more than one style, and some account
 * for the direction of the rendering of shadow effects.
 *
 * @note One may use the helper macros #EVAS_TEXT_STYLE_BASIC_SET and
 * #EVAS_TEXT_STYLE_SHADOW_DIRECTION_SET to assemble a style value.
 *
 * @param[in] obj The object.
 *
 * @return Style type
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_style_get(obj:PEvas_Text):TEvas_Text_Style_Type;cdecl;external;
{*
 * @brief Sets the glow color for the given text object.
 *
 * Glow effects are glowing colors decorating the text's surroundings.  They
 * will be shown if the object is set to the @c EVAS_TEXT_STYLE_TYPE_GLOW
 * style.
 *
 * @note Glow effects are placed from a short distance of the text itself, but
 * not touching it. For glowing effects right on the borders of the glyphs, see
 * 'glow 2' effects.
 *
 * @param[in] obj The object.
 * @param[in] r The red component of the given color.
 * @param[in] g The green component of the given color.
 * @param[in] b The blue component of the given color.
 * @param[in] a The alpha component of the given color.
 *
 * @ingroup Evas_Object_Text_Group
  }
procedure evas_object_text_glow_color_set(obj:PEvas_Text; r:longint; g:longint; b:longint; a:longint);cdecl;external;
{*
 * @brief Sets the glow color for the given text object.
 *
 * Glow effects are glowing colors decorating the text's surroundings.  They
 * will be shown if the object is set to the @c EVAS_TEXT_STYLE_TYPE_GLOW
 * style.
 *
 * @note Glow effects are placed from a short distance of the text itself, but
 * not touching it. For glowing effects right on the borders of the glyphs, see
 * 'glow 2' effects.
 *
 * @param[in] obj The object.
 * @param[out] r The red component of the given color.
 * @param[out] g The green component of the given color.
 * @param[out] b The blue component of the given color.
 * @param[out] a The alpha component of the given color.
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
procedure evas_object_text_glow_color_get(obj:PEvas_Text; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external;
{*
 * @brief Maximal descent property
 *
 * @param[in] obj The object.
 *
 * @return Evas coordinate
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_max_descent_get(obj:PEvas_Text):longint;cdecl;external;
{*
 * @brief Gets the text style pad of a text object.
 *
 * @param[in] obj The object.
 * @param[out] l The left pad (or @c NULL).
 * @param[out] r The right pad (or @c NULL).
 * @param[out] t The top pad (or @c NULL).
 * @param[out] b The bottom pad (or @c NULL).
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
procedure evas_object_text_style_pad_get(obj:PEvas_Text; l:Plongint; r:Plongint; t:Plongint; b:Plongint);cdecl;external;
{*
 * @brief Retrieves the direction of the text currently being displayed in the
 * text object.
 *
 * @param[in] obj The object.
 *
 * @return Bidirectional type
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_direction_get(obj:PEvas_Text):TEfl_Text_Bidirectional_Type;cdecl;external;
{*
 * @brief Ascent property
 *
 * @param[in] obj The object.
 *
 * @return Evas coordinate
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_ascent_get(obj:PEvas_Text):longint;cdecl;external;
{*
 * @brief Horizontal advance property
 *
 * @param[in] obj The object.
 *
 * @return Evas coordinate
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_horiz_advance_get(obj:PEvas_Text):longint;cdecl;external;
{*
 * @brief Inset property
 *
 * @param[in] obj The object.
 *
 * @return Evas coordinate
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_inset_get(obj:PEvas_Text):longint;cdecl;external;
{*
 * @brief Maximal ascent property
 *
 * @param[in] obj The object.
 *
 * @return Evas coordinate
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_max_ascent_get(obj:PEvas_Text):longint;cdecl;external;
{*
 * @brief Vertical advance property
 *
 * @param[in] obj The object.
 *
 * @return Evas coordinate
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_vert_advance_get(obj:PEvas_Text):longint;cdecl;external;
{*
 * @brief descent property
 *
 * @param[in] obj The object.
 *
 * @return Evas coordinate
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_descent_get(obj:PEvas_Text):longint;cdecl;external;
{*
 * @brief Returns the logical position of the last char in the text up to the
 * pos given.
 *
 * This is NOT the position of the last char because of the possibility of RTL
 * in the text.
 *
 * @param[in] obj The object.
 * @param[in] x X coordinate
 * @param[in] y Y coordinate
 *
 * @return Logical position of the last char
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_last_up_to_pos(obj:PEvas_Text; x:longint; y:longint):longint;cdecl;external;
{*
 * @brief Get character coordinates
 *
 * @param[in] obj The object.
 * @param[in] x X coordinate
 * @param[in] y Y coordinate
 * @param[out] cx X coordinate
 * @param[out] cy Y coordinate
 * @param[out] cw Width
 * @param[out] ch Height
 *
 * @return Logical position of char
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_char_coords_get(obj:PEvas_Text; x:longint; y:longint; cx:Plongint; cy:Plongint; 
           cw:Plongint; ch:Plongint):longint;cdecl;external;
{*
 * @brief Retrieve position and dimension information of a character within a
 * text @ref Efl_Canvas_Object
 *
 * This function is used to obtain the X, Y, width and height of the character
 * located at @c pos within the @ref Efl_Canvas_Object @c obj. @c obj must be a
 * text object Any of the @c Evas_Coord parameters ($cx, @c cy, @c cw, @c ch)
 * may be @c NULL in which case no value will be assigned to that parameter.
 *
 * @param[in] obj The object.
 * @param[in] pos The character position to request co-ordinates for.
 * @param[out] cx A pointer to an int to store the X value in (can be NULL).
 * @param[out] cy A pointer to an int to store the Y value in (can be NULL).
 * @param[out] cw A pointer to an int to store the Width value in (can be
 * NULL).
 * @param[out] ch A pointer to an int to store the Height value in (can be
 * NULL).
 *
 * @return @c false on success, @c true otherwise
 *
 * @ingroup Evas_Object_Text_Group
  }
(* Const before type ignored *)
function evas_object_text_char_pos_get(obj:PEvas_Text; pos:longint; cx:Plongint; cy:Plongint; cw:Plongint; 
           ch:Plongint):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
