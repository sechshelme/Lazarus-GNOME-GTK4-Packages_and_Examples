
unit efl_ui_position_manager_list_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_position_manager_list_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_position_manager_list_eo.h
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
PEfl_Ui_Position_Manager_List  = ^Efl_Ui_Position_Manager_List;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_POSITION_MANAGER_LIST_EO_H_}
{$define _EFL_UI_POSITION_MANAGER_LIST_EO_H_}
{$ifndef _EFL_UI_POSITION_MANAGER_LIST_EO_CLASS_TYPE}
{$define _EFL_UI_POSITION_MANAGER_LIST_EO_CLASS_TYPE}
type
  PEfl_Ui_Position_Manager_List = ^TEfl_Ui_Position_Manager_List;
  TEfl_Ui_Position_Manager_List = TEo;
{$endif}
{$ifndef _EFL_UI_POSITION_MANAGER_LIST_EO_TYPES}
{$define _EFL_UI_POSITION_MANAGER_LIST_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Implementation of @ref Efl_Ui_Position_Manager_Entity for a list
 *
 * Every item in the list will get at least his min size applied, changes to
 * the min size are listened to and change the layout of all items. This
 * supports the vertical and horizontal orientation.
 *
 * @ingroup Efl_Ui_Position_Manager_List
  }

{ was #define dname def_expr }
function EFL_UI_POSITION_MANAGER_LIST_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_position_manager_list_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_POSITION_MANAGER_LIST_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_POSITION_MANAGER_LIST_CLASS:=efl_ui_position_manager_list_class_get;
  end;


end.
