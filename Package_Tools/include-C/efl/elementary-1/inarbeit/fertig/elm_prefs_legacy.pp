
unit elm_prefs_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_prefs_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_prefs_legacy.h
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
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @ingroup Elm_Prefs
 *
 * @
  }
{*
 * Add a page widget to an elm_prefs object.
  }

function elm_prefs_page_widget_common_add(prefs:PEvas_Object; obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 *
 * Set file and page to populate a given prefs widget's interface.
 *
 * @return @c EINA_TRUE, on success, @c EINA_FALSE otherwise
 *
 * Elm prefs widgets start blank, with no child widgets. It's meant to
 * have its viewport populated with child elements coming from a
 * declaration file. That file (usually with @b .epb extension), is a
 * binary format (Eet) one, coming from a human-readable textual
 * declaration. This textual form (usually with @b .epc extension) is
 * translated to the binary form by means of the @b prefs_cc compiler.
 *
 * With this function, one thus populates a prefs widget with UI
 * elements.
 *
 * If @a file is @c NULL, "elm_app_data_dir_get()/preferences.epb"
 * will be used, by default. If @a file is a @b relative path, the
 * prefix "elm_app_data_dir_get()/" will be implicitly used with it.
 * If @a page is @c NULL, it is considered "main", as default.
 *
 * @warning If your binary is not properly installed and
 * elm_app_data_dir_get() can't be figured out, a fallback value of
 * "." will be tryed, instead.
 *
 * @see elm_prefs_file_get()
 *
 * @since 1.8
 *
 * @param[in] file The @b .epb (binary) file to get contents from
 * @param[in] page The page, inside @a file, where to get item contents from
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_file_set(obj:PEo; file:Pchar; page:Pchar):TEina_Bool;cdecl;external;
{*
 *
 * Get file and page bound to a given prefs widget.
 *
 * @return @c EINA_TRUE, on success, @c EINA_FALSE otherwise
 *
 * @note Use @c NULL pointers on the components you're not
 * interested in: they'll be ignored by the function.
 *
 * @see elm_prefs_file_set() for more information
 *
 * @since 1.8
 *
 * @param[out] file The @b .epb (binary) file to get contents from
 * @param[out] page The page, inside @a file, where to get item contents from
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_prefs_file_get(obj:PEo; file:PPchar; page:PPchar):TEina_Bool;cdecl;external;
{$include "elm_prefs_eo.legacy.h"}
{*
 * @
  }

implementation


end.
