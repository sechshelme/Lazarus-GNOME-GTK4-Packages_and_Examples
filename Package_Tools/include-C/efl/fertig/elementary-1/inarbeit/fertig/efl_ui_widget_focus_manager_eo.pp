
unit efl_ui_widget_focus_manager_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_widget_focus_manager_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_widget_focus_manager_eo.h
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
PEfl_Ui_Focus_Manager  = ^Efl_Ui_Focus_Manager;
PEfl_Ui_Focus_Object  = ^Efl_Ui_Focus_Object;
PEfl_Ui_Widget_Focus_Manager  = ^Efl_Ui_Widget_Focus_Manager;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_WIDGET_FOCUS_MANAGER_EO_H_}
{$define _EFL_UI_WIDGET_FOCUS_MANAGER_EO_H_}
{$ifndef _EFL_UI_WIDGET_FOCUS_MANAGER_EO_CLASS_TYPE}
{$define _EFL_UI_WIDGET_FOCUS_MANAGER_EO_CLASS_TYPE}
type
  PEfl_Ui_Widget_Focus_Manager = ^TEfl_Ui_Widget_Focus_Manager;
  TEfl_Ui_Widget_Focus_Manager = TEo;
{$endif}
{$ifndef _EFL_UI_WIDGET_FOCUS_MANAGER_EO_TYPES}
{$define _EFL_UI_WIDGET_FOCUS_MANAGER_EO_TYPES}
{$endif}
{* Helper mixin for widgets which also can act as focus managers.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Widget_Focus_Manager
  }

{ was #define dname def_expr }
function EFL_UI_WIDGET_FOCUS_MANAGER_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_widget_focus_manager_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_UI_WIDGET_FOCUS_MANAGER_PROTECTED}
{*
 * @brief If the widget needs a focus manager, this function will be called.
 *
 * It can be used and overridden to inject your own manager or set custom
 * options on the focus manager.
 *
 * @param[in] obj The object.
 * @param[in] root The logical root object for focus.
 *
 * @return The focus manager.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Widget_Focus_Manager
  }
function efl_ui_widget_focus_manager_create(obj:PEo; root:PEfl_Ui_Focus_Object):PEfl_Ui_Focus_Manager;cdecl;external;
{$endif}
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_WIDGET_FOCUS_MANAGER_MIXIN : longint; { return type might be wrong }
  begin
    EFL_UI_WIDGET_FOCUS_MANAGER_MIXIN:=efl_ui_widget_focus_manager_mixin_get;
  end;


end.
