
unit efl_ui_focus_manager_root_focus_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_focus_manager_root_focus_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_focus_manager_root_focus_eo.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Focus_Manager_Root_Focus  = ^Efl_Ui_Focus_Manager_Root_Focus;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_EO_H_}
{$define _EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_EO_H_}
{$ifndef _EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_EO_CLASS_TYPE}
{$define _EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_EO_CLASS_TYPE}
type
  PEfl_Ui_Focus_Manager_Root_Focus = ^TEfl_Ui_Focus_Manager_Root_Focus;
  TEfl_Ui_Focus_Manager_Root_Focus = TEo;
{$endif}
{$ifndef _EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_EO_TYPES}
{$define _EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* This class ensures that the root is at least focusable, if nothing else is
 * focusable.
 *
 * @ingroup Efl_Ui_Focus_Manager_Root_Focus
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_focus_manager_root_focus_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The default replacement object to use when there is no focusable
 * object inside the manager. You can change this object by setting this value
 * to something else. @c null means that the same value as
 * @ref efl_ui_focus_manager_root_get will be used.
 *
 * @param[in] obj The object.
 * @param[in] canvas_object Canvas object.
 *
 * @ingroup Efl_Ui_Focus_Manager_Root_Focus
  }
procedure efl_ui_focus_manager_root_focus_canvas_object_set(obj:PEo; canvas_object:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief The default replacement object to use when there is no focusable
 * object inside the manager. You can change this object by setting this value
 * to something else. @c null means that the same value as
 * @ref efl_ui_focus_manager_root_get will be used.
 *
 * @param[in] obj The object.
 *
 * @return Canvas object.
 *
 * @ingroup Efl_Ui_Focus_Manager_Root_Focus
  }
(* Const before type ignored *)
function efl_ui_focus_manager_root_focus_canvas_object_get(obj:PEo):PEfl_Canvas_Object;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_MANAGER_ROOT_FOCUS_CLASS:=efl_ui_focus_manager_root_focus_class_get;
  end;


end.
