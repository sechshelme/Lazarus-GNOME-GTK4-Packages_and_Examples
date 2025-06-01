
unit efl_ui_l10n_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_l10n_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_l10n_eo.h
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
PEfl_Ui_L10n  = ^Efl_Ui_L10n;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_L10N_EO_H_}
{$define _EFL_UI_L10N_EO_H_}
{$ifndef _EFL_UI_L10N_EO_CLASS_TYPE}
{$define _EFL_UI_L10N_EO_CLASS_TYPE}
type
  PEfl_Ui_L10n = ^TEfl_Ui_L10n;
  TEfl_Ui_L10n = TEo;
{$endif}
{$ifndef _EFL_UI_L10N_EO_TYPES}
{$define _EFL_UI_L10N_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Interface for all translatable text APIs.
 *
 * This is intended for translation of human readable on-screen text strings
 * but may also be used in text-to-speech situations.
 *
 * @ingroup Efl_Ui_L10n
  }

{ was #define dname def_expr }
function EFL_UI_L10N_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_l10n_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief A unique string to be translated.
 *
 * Often this will be a human-readable string (e.g. in English) but it can also
 * be a unique string identifier that must then be translated to the current
 * locale with @c dgettext() or any similar mechanism.
 *
 * Setting this property will enable translation for this object or part.
 *
 * Sets the new untranslated string and domain for this object.
 *
 * @param[in] obj The object.
 * @param[in] label A unique (untranslated) string.
 * @param[in] domain A translation domain. If @c null this uses the default
 * domain (eg. set by @c textdomain()).
 *
 * @ingroup Efl_Ui_L10n
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_ui_l10n_text_set(obj:PEo; _label:Pchar; domain:Pchar);cdecl;external;
{*
 * @brief A unique string to be translated.
 *
 * Often this will be a human-readable string (e.g. in English) but it can also
 * be a unique string identifier that must then be translated to the current
 * locale with @c dgettext() or any similar mechanism.
 *
 * Setting this property will enable translation for this object or part.
 *
 * @param[in] obj The object.
 * @param[out] domain A translation domain. If @c null this means the default
 * domain is used.
 *
 * @return This returns the untranslated value of @c label. The translated
 * string can usually be retrieved with @ref efl_text_get.
 *
 * @ingroup Efl_Ui_L10n
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_l10n_text_get(obj:PEo; domain:PPchar):Pchar;cdecl;external;
{$ifdef EFL_UI_L10N_PROTECTED}
{*
 * @brief Requests this object to update its text strings for the current
 * locale.
 *
 * Currently strings are translated with @c dgettext, so support for this
 * function may depend on the platform. It is up to the application to provide
 * its own translation data.
 *
 * This function is a hook meant to be implemented by any object that supports
 * translation. This can be called whenever a new object is created or when the
 * current locale changes, for instance. This should only trigger further calls
 * to @ref efl_ui_l10n_translation_update to children objects.
 * @param[in] obj The object.
 *
 * @ingroup Efl_Ui_L10n
  }
procedure efl_ui_l10n_translation_update(obj:PEo);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_L10N_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_L10N_INTERFACE:=efl_ui_l10n_interface_get;
  end;


end.
