
unit efl_ui_focus_manager_sub_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_focus_manager_sub_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_focus_manager_sub_eo.h
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
PEfl_Ui_Focus_Manager_Sub  = ^Efl_Ui_Focus_Manager_Sub;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FOCUS_MANAGER_SUB_EO_H_}
{$define _EFL_UI_FOCUS_MANAGER_SUB_EO_H_}
{$ifndef _EFL_UI_FOCUS_MANAGER_SUB_EO_CLASS_TYPE}
{$define _EFL_UI_FOCUS_MANAGER_SUB_EO_CLASS_TYPE}
type
  PEfl_Ui_Focus_Manager_Sub = ^TEfl_Ui_Focus_Manager_Sub;
  TEfl_Ui_Focus_Manager_Sub = TEo;
{$endif}
{$ifndef _EFL_UI_FOCUS_MANAGER_SUB_EO_TYPES}
{$define _EFL_UI_FOCUS_MANAGER_SUB_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A class that automatically registers its border elements in the
 * parent manager.
 *
 * This sub manager will register its border elements on the parent manager.
 * The parent manager is found with the @ref Efl_Ui_Focus_Object interface of
 * the @ref efl_parent_get.
 *
 * Each sub manager also has to be a focus object, the object itself will be
 * registered into the parent manager. It will be used as logical parent while
 * registering the border elements.
 *
 * You can filter the border elements by overriding the property
 * @ref efl_ui_focus_manager_border_elements_get.
 *
 * @ingroup Efl_Ui_Focus_Manager_Sub
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_SUB_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_focus_manager_sub_mixin_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_SUB_MIXIN : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_MANAGER_SUB_MIXIN:=efl_ui_focus_manager_sub_mixin_get;
  end;


end.
