
unit efl_ui_i18n_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_i18n_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_i18n_eo.h
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
PEfl_Ui_I18n  = ^Efl_Ui_I18n;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_I18N_EO_H_}
{$define _EFL_UI_I18N_EO_H_}
{$ifndef _EFL_UI_I18N_EO_CLASS_TYPE}
{$define _EFL_UI_I18N_EO_CLASS_TYPE}
type
  PEfl_Ui_I18n = ^TEfl_Ui_I18n;
  TEfl_Ui_I18n = TEo;
{$endif}
{$ifndef _EFL_UI_I18N_EO_TYPES}
{$define _EFL_UI_I18N_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* A common Internationalization interface for UI objects.
 *
 * @ingroup Efl_Ui_I18n
  }

{ was #define dname def_expr }
function EFL_UI_I18N_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_i18n_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Whether this object should be mirrored.
 *
 * If mirrored, an object is in RTL (right to left) mode instead of LTR (left
 * to right).
 *
 * @param[in] obj The object.
 * @param[in] rtl @c true for RTL, @c false for LTR (default).
 *
 * @ingroup Efl_Ui_I18n
  }
procedure efl_ui_mirrored_set(obj:PEo; rtl:TEina_Bool);cdecl;external;
{*
 * @brief Whether this object should be mirrored.
 *
 * If mirrored, an object is in RTL (right to left) mode instead of LTR (left
 * to right).
 *
 * @param[in] obj The object.
 *
 * @return @c true for RTL, @c false for LTR (default).
 *
 * @ingroup Efl_Ui_I18n
  }
(* Const before type ignored *)
function efl_ui_mirrored_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Whether the property @ref efl_ui_mirrored_get should be set
 * automatically.
 *
 * If enabled, the system or application configuration will be used to set the
 * value of @ref efl_ui_mirrored_get.
 *
 * This property may be implemented by high-level widgets (in Efl.Ui) but not
 * by low-level widgets (in @ref Efl_Canvas_Scene) as the configuration should
 * affect only high-level widgets.
 *
 * @param[in] obj The object.
 * @param[in] automatic Whether the widget uses automatic mirroring
 *
 * @ingroup Efl_Ui_I18n
  }
procedure efl_ui_mirrored_automatic_set(obj:PEo; automatic:TEina_Bool);cdecl;external;
{*
 * @brief Whether the property @ref efl_ui_mirrored_get should be set
 * automatically.
 *
 * If enabled, the system or application configuration will be used to set the
 * value of @ref efl_ui_mirrored_get.
 *
 * This property may be implemented by high-level widgets (in Efl.Ui) but not
 * by low-level widgets (in @ref Efl_Canvas_Scene) as the configuration should
 * affect only high-level widgets.
 *
 * @param[in] obj The object.
 *
 * @return Whether the widget uses automatic mirroring
 *
 * @ingroup Efl_Ui_I18n
  }
(* Const before type ignored *)
function efl_ui_mirrored_automatic_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The (human) language for this object.
 *
 * @param[in] obj The object.
 * @param[in] language The current language.
 *
 * @ingroup Efl_Ui_I18n
  }
(* Const before type ignored *)
procedure efl_ui_language_set(obj:PEo; language:Pchar);cdecl;external;
{*
 * @brief The (human) language for this object.
 *
 * @param[in] obj The object.
 *
 * @return The current language.
 *
 * @ingroup Efl_Ui_I18n
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_language_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_I18N_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_I18N_INTERFACE:=efl_ui_i18n_interface_get;
  end;


end.
