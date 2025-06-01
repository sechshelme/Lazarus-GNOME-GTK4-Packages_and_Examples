
unit elm_font;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_font.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_font.h
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
PEina_Hash  = ^Eina_Hash;
PEina_List  = ^Eina_List;
PElm_Font_Properties  = ^Elm_Font_Properties;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Elm_Fonts Elementary Fonts
 * @ingroup Elementary
 *
 * These are functions dealing with font rendering, selection and the
 * like for Elementary applications. One might fetch which system
 * fonts are there to use and set custom fonts for individual classes
 * of UI items containing text (text classes).
 *
 * @
  }
(* Const before type ignored *)
type
  PElm_Font_Properties = ^TElm_Font_Properties;
  TElm_Font_Properties = record
      name : Pchar;
      styles : PEina_List;
    end;
{*
 * Translate a font (family) name string in fontconfig's font names
 * syntax into an @c Elm_Font_Properties struct.
 *
 * @param font The font name and styles string
 * @return the font properties struct
 *
 * @ingroup Elm_Fonts
 *
 * @note The reverse translation can be achieved with
 * elm_font_fontconfig_name_get(), for one style only (single font
 * instance, not family).
  }
(* Const before type ignored *)

function elm_font_properties_get(font:Pchar):PElm_Font_Properties;cdecl;external;
{*
 * Free font properties return by elm_font_properties_get().
 *
 * @param efp the font properties struct
 *
 * @ingroup Elm_Fonts
  }
procedure elm_font_properties_free(efp:PElm_Font_Properties);cdecl;external;
{*
 * Translate a font name, bound to a style, into fontconfig's font names
 * syntax.
 *
 * @param name The font (family) name
 * @param style The given style (may be @c NULL)
 *
 * @return the font name and style string
 *
 * @ingroup Elm_Fonts
 *
 * @note The reverse translation can be achieved with
 * elm_font_properties_get(), for one style only (single font
 * instance, not family).
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_font_fontconfig_name_get(name:Pchar; style:Pchar):Pchar;cdecl;external;
{*
 * Free the font string return by elm_font_fontconfig_name_get().
 *
 * @param name the font properties struct
 *
 * @ingroup Elm_Fonts
  }
procedure elm_font_fontconfig_name_free(name:Pchar);cdecl;external;
{*
 * Create a font hash table of available system fonts.
 *
 * One must call it with @p list being the return value of
 * evas_font_available_list(). The hash will be indexed by font
 * (family) names, being its values @c Elm_Font_Properties blobs.
 *
 * @param list The list of available system fonts, as returned by
 * evas_font_available_list().
 * @return the font hash.
 *
 * @ingroup Elm_Fonts
 *
 * @note The user is supposed to get it populated at least with 3
 * default font families (Sans, Serif, Monospace), which should be
 * present on most systems.
  }
function elm_font_available_hash_add(list:PEina_List):PEina_Hash;cdecl;external;
{*
 * Free the hash returned by elm_font_available_hash_add().
 *
 * @param hash the hash to be freed.
 *
 * @ingroup Elm_Fonts
  }
procedure elm_font_available_hash_del(hash:PEina_Hash);cdecl;external;
{*
 * @
  }

implementation


end.
