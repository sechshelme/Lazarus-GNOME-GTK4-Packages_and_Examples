
unit efl_ui_theme_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_theme_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_theme_eo.h
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
PEfl_Ui_Theme  = ^Efl_Ui_Theme;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_THEME_EO_H_}
{$define _EFL_UI_THEME_EO_H_}
{$ifndef _EFL_UI_THEME_EO_CLASS_TYPE}
{$define _EFL_UI_THEME_EO_CLASS_TYPE}
type
  PEfl_Ui_Theme = ^TEfl_Ui_Theme;
  TEfl_Ui_Theme = TEo;
{$endif}
{$ifndef _EFL_UI_THEME_EO_TYPES}
{$define _EFL_UI_THEME_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl Ui Theme class
 *
 * @ingroup Efl_Ui_Theme
  }

{ was #define dname def_expr }
function EFL_UI_THEME_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_theme_class_get:PEfl_Class;cdecl;external;
{*
 * @brief This is the default theme.
 *
 * All widgets use the default theme implicitly unless a specific theme is set.
 *
 * @return The default theme handle
 *
 * @ingroup Efl_Ui_Theme
  }
function efl_ui_theme_default_get:PEfl_Ui_Theme;cdecl;external;
{*
 * @brief Appends a theme extension to the list of extensions. This is intended
 * when an application needs more styles of widgets or new widget themes that
 * the default does not provide (or may not provide). The application has
 * "extended" usage by coming up with new custom style names for widgets for
 * specific uses, but as these are not "standard", they are not guaranteed to
 * be provided by a default theme. This means the application is required to
 * provide these extra elements itself in specific Edje files. This call adds
 * one of those Edje files to the theme search path to be searched after the
 * default theme. The use of this call is encouraged when default styles do not
 * meet the needs of the application. Use this call instead of
 * @ref efl_ui_theme_overlay_add for almost all cases.
 *
 * @param[in] obj The object.
 * @param[in] item The Edje file path to be used
 *
 * @ingroup Efl_Ui_Theme
  }
(* Const before type ignored *)
procedure efl_ui_theme_extension_add(obj:PEo; item:Pchar);cdecl;external;
{*
 * @brief Deletes a theme extension from the list of extensions.
 *
 * @param[in] obj The object.
 * @param[in] item The Edje file path not to be used
 *
 * @ingroup Efl_Ui_Theme
  }
(* Const before type ignored *)
procedure efl_ui_theme_extension_del(obj:PEo; item:Pchar);cdecl;external;
{*
 * @brief Prepends a theme overlay to the list of overlays. Use this if your
 * application needs to provide some custom overlay theme (An Edje file that
 * replaces some default styles of widgets) where adding new styles, or
 * changing system theme configuration is not possible. Do NOT use this instead
 * of a proper system theme configuration. Use proper configuration files,
 * profiles, environment variables etc. to set a theme so that the theme can be
 * altered by simple configuration by a user. Using this call to achieve that
 * effect is abusing the API and will create lots of trouble.
 *
 * @param[in] obj The object.
 * @param[in] item The Edje file path to be used
 *
 * @ingroup Efl_Ui_Theme
  }
(* Const before type ignored *)
procedure efl_ui_theme_overlay_add(obj:PEo; item:Pchar);cdecl;external;
{*
 * @brief Delete a theme overlay from the list of overlays.
 *
 * @param[in] obj The object.
 * @param[in] item The Edje file path not to be used
 *
 * @ingroup Efl_Ui_Theme
  }
(* Const before type ignored *)
procedure efl_ui_theme_overlay_del(obj:PEo; item:Pchar);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_THEME_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_THEME_CLASS:=efl_ui_theme_class_get;
  end;


end.
