
unit efl_text_font_properties_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_text_font_properties_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_text_font_properties_eo.h
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
PEfl_Text_Font_Bitmap_Scalable  = ^Efl_Text_Font_Bitmap_Scalable;
PEfl_Text_Font_Properties  = ^Efl_Text_Font_Properties;
PEfl_Text_Font_Slant  = ^Efl_Text_Font_Slant;
PEfl_Text_Font_Weight  = ^Efl_Text_Font_Weight;
PEfl_Text_Font_Width  = ^Efl_Text_Font_Width;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TEXT_FONT_PROPERTIES_EO_H_}
{$define _EFL_TEXT_FONT_PROPERTIES_EO_H_}
{$ifndef _EFL_TEXT_FONT_PROPERTIES_EO_CLASS_TYPE}
{$define _EFL_TEXT_FONT_PROPERTIES_EO_CLASS_TYPE}
type
  PEfl_Text_Font_Properties = ^TEfl_Text_Font_Properties;
  TEfl_Text_Font_Properties = TEo;
{$endif}
{$ifndef _EFL_TEXT_FONT_PROPERTIES_EO_TYPES}
{$define _EFL_TEXT_FONT_PROPERTIES_EO_TYPES}
{* The weight of a particular font is the thickness of the character outlines
 * relative to their height. The given numerical values follow the TrueType
 * scale (from 100 to 900) and are approximate. It is up to each font to
 * provide all of them.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Weight
  }
{*< Normal font weight (400).
                                    *
                                    * @since 1.24  }
{*< Thin font weight (100).
                              *
                              * @since 1.24  }
{*< Ultralight font weight (200).
                                    *
                                    * @since 1.24  }
{*< Extralight font weight (200).
                                    *
                                    * @since 1.24  }
{*< Light font weight (300).
                               *
                               * @since 1.24  }
{*< Book font weight (350).
                              *
                              * @since 1.24  }
{*< Medium font weight (500).
                                *
                                * @since 1.24  }
{*< Semibold font weight (600).
                                  *
                                  * @since 1.24  }
{*< Bold font weight (700).
                              *
                              * @since 1.24  }
{*< Ultrabold font weight (800).
                                   *
                                   * @since 1.24  }
{*< Extrabold font weight (800).
                                   *
                                   * @since 1.24  }
{*< Black font weight (900).
                               *
                               * @since 1.24  }
{*< Extrablack font weight (950).
                                   *
                                   * @since 1.24  }
type
  PEfl_Text_Font_Weight = ^TEfl_Text_Font_Weight;
  TEfl_Text_Font_Weight =  Longint;
  Const
    EFL_TEXT_FONT_WEIGHT_NORMAL = 0;
    EFL_TEXT_FONT_WEIGHT_THIN = 1;
    EFL_TEXT_FONT_WEIGHT_ULTRALIGHT = 2;
    EFL_TEXT_FONT_WEIGHT_EXTRALIGHT = 3;
    EFL_TEXT_FONT_WEIGHT_LIGHT = 4;
    EFL_TEXT_FONT_WEIGHT_BOOK = 5;
    EFL_TEXT_FONT_WEIGHT_MEDIUM = 6;
    EFL_TEXT_FONT_WEIGHT_SEMIBOLD = 7;
    EFL_TEXT_FONT_WEIGHT_BOLD = 8;
    EFL_TEXT_FONT_WEIGHT_ULTRABOLD = 9;
    EFL_TEXT_FONT_WEIGHT_EXTRABOLD = 10;
    EFL_TEXT_FONT_WEIGHT_BLACK = 11;
    EFL_TEXT_FONT_WEIGHT_EXTRABLACK = 12;
;
{* Font width relative to its height. It is up to each font to provide all
 * these widths.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Width
  }
{*< Normal font width.
                                   *
                                   * @since 1.24  }
{*< Ultracondensed font width.
                                       *
                                       * @since 1.24  }
{*< Extracondensed font width.
                                       *
                                       * @since 1.24  }
{*< Condensed font width.
                                  *
                                  * @since 1.24  }
{*< Semicondensed font width.
                                      *
                                      * @since 1.24  }
{*< Semiexpanded font width.
                                     *
                                     * @since 1.24  }
{*< Expanded font width.
                                 *
                                 * @since 1.24  }
{*< Extraexpanded font width.
                                      *
                                      * @since 1.24  }
{*< Ultraexpanded font width.
                                     *
                                     * @since 1.24  }
type
  PEfl_Text_Font_Width = ^TEfl_Text_Font_Width;
  TEfl_Text_Font_Width =  Longint;
  Const
    EFL_TEXT_FONT_WIDTH_NORMAL = 0;
    EFL_TEXT_FONT_WIDTH_ULTRACONDENSED = 1;
    EFL_TEXT_FONT_WIDTH_EXTRACONDENSED = 2;
    EFL_TEXT_FONT_WIDTH_CONDENSED = 3;
    EFL_TEXT_FONT_WIDTH_SEMICONDENSED = 4;
    EFL_TEXT_FONT_WIDTH_SEMIEXPANDED = 5;
    EFL_TEXT_FONT_WIDTH_EXPANDED = 6;
    EFL_TEXT_FONT_WIDTH_EXTRAEXPANDED = 7;
    EFL_TEXT_FONT_WIDTH_ULTRAEXPANDED = 8;
;
{* Type of font slant.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Slant
  }
{*< Normal font slant: Sets the text to the
                                   * normal font (non-italicized).
                                   *
                                   * @since 1.24  }
{*< Oblique font slant: Sets the text to use a
                                * simulated version of an italic font, created
                                * by algorithmically slanting the normal
                                * version.
                                *
                                * @since 1.24  }
{*< Italic font slant: Sets the text to use the
                              * italic version of the font if available. If not
                              * available, it will simulate italics with
                              * oblique instead.
                              *
                              * @since 1.24  }
type
  PEfl_Text_Font_Slant = ^TEfl_Text_Font_Slant;
  TEfl_Text_Font_Slant =  Longint;
  Const
    EFL_TEXT_FONT_SLANT_NORMAL = 0;
    EFL_TEXT_FONT_SLANT_OBLIQUE = 1;
    EFL_TEXT_FONT_SLANT_ITALIC = 2;
;
{* When are bitmap fonts allowed to be scaled.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Bitmap_Scalable
  }
{*< Disable scaling for bitmap fonts.
                                           *
                                           * @since 1.24  }
{ 1 >> 0  }{*< Enable scaling for
                                                        * color bitmap fonts.
                                                        *
                                                        * @since 1.24  }
type
  PEfl_Text_Font_Bitmap_Scalable = ^TEfl_Text_Font_Bitmap_Scalable;
  TEfl_Text_Font_Bitmap_Scalable =  Longint;
  Const
    EFL_TEXT_FONT_BITMAP_SCALABLE_NONE = 0;
    EFL_TEXT_FONT_BITMAP_SCALABLE_COLOR = 1;
;
{$endif}
{* Properties related to font handling.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }

{ was #define dname def_expr }
function EFL_TEXT_FONT_PROPERTIES_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_text_font_properties_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The font family, filename for a given text object.
 *
 * This property controls the font name of a text object. The font string has
 * to follow fontconfig's convention for naming fonts, as it's the underlying
 * library used to query system fonts by EFL (see the <tt>fc-list</tt>
 * command's output, on your system, to get an idea). Alternatively, you can
 * use the full path to a font file.
 *
 * When reading it, the font name string is still owned by EFL and should not
 * be freed. See also @ref efl_text_font_source_get.
 *
 * @param[in] obj The object.
 * @param[in] font The font family name or filename.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
procedure efl_text_font_family_set(obj:PEo; font:Pchar);cdecl;external;
{*
 * @brief The font family, filename for a given text object.
 *
 * This property controls the font name of a text object. The font string has
 * to follow fontconfig's convention for naming fonts, as it's the underlying
 * library used to query system fonts by EFL (see the <tt>fc-list</tt>
 * command's output, on your system, to get an idea). Alternatively, you can
 * use the full path to a font file.
 *
 * When reading it, the font name string is still owned by EFL and should not
 * be freed. See also @ref efl_text_font_source_get.
 *
 * @param[in] obj The object.
 *
 * @return The font family name or filename.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_font_family_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief The font size to use, in points.
 *
 * If the specified @ref efl_text_font_family_get does not provide this
 * particular size, it will be scaled.
 *
 * @param[in] obj The object.
 * @param[in] size The font size, in points.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
procedure efl_text_font_size_set(obj:PEo; size:TEfl_Font_Size);cdecl;external;
{*
 * @brief The font size to use, in points.
 *
 * If the specified @ref efl_text_font_family_get does not provide this
 * particular size, it will be scaled.
 *
 * @param[in] obj The object.
 *
 * @return The font size, in points.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
function efl_text_font_size_get(obj:PEo):TEfl_Font_Size;cdecl;external;
{*
 * @brief The font (source) file to be used on a given text object.
 *
 * This function allows the font file to be explicitly set for a given text
 * object, overriding system lookup, which will first occur in the given file's
 * contents.
 *
 * See also @ref efl_text_font_family_get.
 *
 * @param[in] obj The object.
 * @param[in] font_source The font file's path.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
procedure efl_text_font_source_set(obj:PEo; font_source:Pchar);cdecl;external;
{*
 * @brief The font (source) file to be used on a given text object.
 *
 * This function allows the font file to be explicitly set for a given text
 * object, overriding system lookup, which will first occur in the given file's
 * contents.
 *
 * See also @ref efl_text_font_family_get.
 *
 * @param[in] obj The object.
 *
 * @return The font file's path.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_font_source_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Comma-separated list of font fallbacks.
 *
 * Will be used in case the primary font isn't available.
 *
 * @param[in] obj The object.
 * @param[in] font_fallbacks List of fallback font names.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
procedure efl_text_font_fallbacks_set(obj:PEo; font_fallbacks:Pchar);cdecl;external;
{*
 * @brief Comma-separated list of font fallbacks.
 *
 * Will be used in case the primary font isn't available.
 *
 * @param[in] obj The object.
 *
 * @return List of fallback font names.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_font_fallbacks_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Type of weight (e.g. bold or normal) of the displayed font
 *
 * Default is @ref EFL_TEXT_FONT_WEIGHT_NORMAL.
 *
 * @param[in] obj The object.
 * @param[in] font_weight Font weight.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
procedure efl_text_font_weight_set(obj:PEo; font_weight:TEfl_Text_Font_Weight);cdecl;external;
{*
 * @brief Type of weight (e.g. bold or normal) of the displayed font
 *
 * Default is @ref EFL_TEXT_FONT_WEIGHT_NORMAL.
 *
 * @param[in] obj The object.
 *
 * @return Font weight.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
function efl_text_font_weight_get(obj:PEo):TEfl_Text_Font_Weight;cdecl;external;
{*
 * @brief Type of slant (e.g. italic or normal) of the displayed font.
 *
 * Default is @ref EFL_TEXT_FONT_SLANT_NORMAL.
 *
 * @param[in] obj The object.
 * @param[in] style Font slant.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
procedure efl_text_font_slant_set(obj:PEo; style:TEfl_Text_Font_Slant);cdecl;external;
{*
 * @brief Type of slant (e.g. italic or normal) of the displayed font.
 *
 * Default is @ref EFL_TEXT_FONT_SLANT_NORMAL.
 *
 * @param[in] obj The object.
 *
 * @return Font slant.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
function efl_text_font_slant_get(obj:PEo):TEfl_Text_Font_Slant;cdecl;external;
{*
 * @brief Type of width (e.g. condensed, expanded or normal) of the displayed
 * font.
 *
 * Default is @ref EFL_TEXT_FONT_WIDTH_NORMAL.
 *
 * @param[in] obj The object.
 * @param[in] width Font width.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
procedure efl_text_font_width_set(obj:PEo; width:TEfl_Text_Font_Width);cdecl;external;
{*
 * @brief Type of width (e.g. condensed, expanded or normal) of the displayed
 * font.
 *
 * Default is @ref EFL_TEXT_FONT_WIDTH_NORMAL.
 *
 * @param[in] obj The object.
 *
 * @return Font width.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
function efl_text_font_width_get(obj:PEo):TEfl_Text_Font_Width;cdecl;external;
{*
 * @brief Specific language of the displayed font
 *
 * This is used to lookup fonts suitable to the specified language, as well as
 * helping the font shaper backend. The language @c lang can be either a code
 * e.g "en_US", "auto" to use the system locale, or "none".
 *
 * @param[in] obj The object.
 * @param[in] lang Language code.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
procedure efl_text_font_lang_set(obj:PEo; lang:Pchar);cdecl;external;
{*
 * @brief Specific language of the displayed font
 *
 * This is used to lookup fonts suitable to the specified language, as well as
 * helping the font shaper backend. The language @c lang can be either a code
 * e.g "en_US", "auto" to use the system locale, or "none".
 *
 * @param[in] obj The object.
 *
 * @return Language code.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_font_lang_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Bitmap fonts have fixed size glyphs for several available sizes.
 * Other sizes need to be algorithmically scaled, resulting in blurry glyphs.
 * This property controls whether scaling of non-provided sizes is allowed.
 *
 * Default is @ref EFL_TEXT_FONT_BITMAP_SCALABLE_NONE.
 *
 * @param[in] obj The object.
 * @param[in] scalable When should bitmap fonts be scaled.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
procedure efl_text_font_bitmap_scalable_set(obj:PEo; scalable:TEfl_Text_Font_Bitmap_Scalable);cdecl;external;
{*
 * @brief Bitmap fonts have fixed size glyphs for several available sizes.
 * Other sizes need to be algorithmically scaled, resulting in blurry glyphs.
 * This property controls whether scaling of non-provided sizes is allowed.
 *
 * Default is @ref EFL_TEXT_FONT_BITMAP_SCALABLE_NONE.
 *
 * @param[in] obj The object.
 *
 * @return When should bitmap fonts be scaled.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Font_Properties
  }
(* Const before type ignored *)
function efl_text_font_bitmap_scalable_get(obj:PEo):TEfl_Text_Font_Bitmap_Scalable;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_TEXT_FONT_PROPERTIES_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_TEXT_FONT_PROPERTIES_INTERFACE:=efl_text_font_properties_interface_get;
  end;


end.
