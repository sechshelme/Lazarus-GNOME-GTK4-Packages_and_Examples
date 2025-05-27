
unit efl_ui_focus_manager_window_root_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_focus_manager_window_root_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_focus_manager_window_root_eo.h
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
PEfl_Ui_Focus_Manager_Window_Root  = ^Efl_Ui_Focus_Manager_Window_Root;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_EO_H_}
{$define _EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_EO_H_}
{$ifndef _EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_EO_CLASS_TYPE}
{$define _EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_EO_CLASS_TYPE}
type
  PEfl_Ui_Focus_Manager_Window_Root = ^TEfl_Ui_Focus_Manager_Window_Root;
  TEfl_Ui_Focus_Manager_Window_Root = TEo;
{$endif}
{$ifndef _EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_EO_TYPES}
{$define _EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_EO_TYPES}
{$endif}
{*
 * @brief An interface to indicate the end of a focus chain.
 *
 * Focus managers are ensuring that if they give focus to something, that is
 * registered in the upper focus manager. The uppermost focus manager does not
 * need to do that, and can implement this interface to indicate so.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Focus_Manager_Window_Root
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_focus_manager_window_root_interface_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_INTERFACE:=efl_ui_focus_manager_window_root_interface_get;
  end;


end.
