
unit efl_ui_focus_manager_calc_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_focus_manager_calc_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_focus_manager_calc_eo.h
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
PEfl_Ui_Focus_Manager_Calc  = ^Efl_Ui_Focus_Manager_Calc;
PEfl_Ui_Focus_Object  = ^Efl_Ui_Focus_Object;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FOCUS_MANAGER_CALC_EO_H_}
{$define _EFL_UI_FOCUS_MANAGER_CALC_EO_H_}
{$ifndef _EFL_UI_FOCUS_MANAGER_CALC_EO_CLASS_TYPE}
{$define _EFL_UI_FOCUS_MANAGER_CALC_EO_CLASS_TYPE}
type
  PEfl_Ui_Focus_Manager_Calc = ^TEfl_Ui_Focus_Manager_Calc;
  TEfl_Ui_Focus_Manager_Calc = TEo;
{$endif}
{$ifndef _EFL_UI_FOCUS_MANAGER_CALC_EO_TYPES}
{$define _EFL_UI_FOCUS_MANAGER_CALC_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Calculates the elements present in each @ref Efl_Ui_Focus_Direction.
 *
 * Each registered item will get a target item in each direction. You can get
 * the target items for the currently focused item by calling
 * @ref efl_ui_focus_manager_request_move.
 *
 * @ingroup Efl_Ui_Focus_Manager_Calc
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_CALC_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_focus_manager_calc_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Registers a new item in the graph.
 *
 * @c parent can not be @c null, it will be used as the parent in the logical
 * tree. @c redirect will be set as redirect property on that manager, once
 * @c child gets focused.
 *
 * @param[in] obj The object.
 * @param[in] child The object to register.
 * @param[in] parent The parent to use in the logical tree.
 * @param[in] redirect The redirect manager to set once this child is focused.
 * Can be @c NULL for no redirect.
 *
 * @return @c true if successful, @c false otherwise.
 *
 * @ingroup Efl_Ui_Focus_Manager_Calc
  }
function efl_ui_focus_manager_calc_register(obj:PEo; child:PEfl_Ui_Focus_Object; parent:PEfl_Ui_Focus_Object; redirect:PEfl_Ui_Focus_Manager):TEina_Bool;cdecl;external;
{*
 * @brief Registers a new logical item in the graph.
 *
 * The item can never get focus, it just helps to build the tree. Compare to
 * @ref efl_ui_focus_manager_calc_register.
 *
 * @param[in] obj The object.
 * @param[in] child The object to register.
 * @param[in] parent The parent to use in the logical tree.
 * @param[in] redirect The redirect manager to set once this child is focused.
 * Can be @c NULL for no redirect.
 *
 * @return @c true if successful, @c false otherwise.
 *
 * @ingroup Efl_Ui_Focus_Manager_Calc
  }
function efl_ui_focus_manager_calc_register_logical(obj:PEo; child:PEfl_Ui_Focus_Object; parent:PEfl_Ui_Focus_Object; redirect:PEfl_Ui_Focus_Manager):TEina_Bool;cdecl;external;
{*
 * @brief Sets a new redirect object for the given child.
 *
 * Once @c child is focused the redirect manager will be set in the redirect
 * property. Set redirect to @c NULL if nothing should happen.
 *
 * @param[in] obj The object.
 * @param[in] child The child to update.
 * @param[in] redirect Once @c child is focused this element will be set as
 * redirect.
 *
 * @return @c true if successful, @c false otherwise.
 *
 * @ingroup Efl_Ui_Focus_Manager_Calc
  }
function efl_ui_focus_manager_calc_update_redirect(obj:PEo; child:PEfl_Ui_Focus_Object; redirect:PEfl_Ui_Focus_Manager):TEina_Bool;cdecl;external;
{*
 * @brief Sets a new logical parent for the given child.
 *
 * @param[in] obj The object.
 * @param[in] child The child to update.
 * @param[in] parent The parent which now will be the logical parent of child.
 *
 * @return @c true if successful, @c false otherwise.
 *
 * @ingroup Efl_Ui_Focus_Manager_Calc
  }
function efl_ui_focus_manager_calc_update_parent(obj:PEo; child:PEfl_Ui_Focus_Object; parent:PEfl_Ui_Focus_Object):TEina_Bool;cdecl;external;
{*
 * @brief Unregister the given item from the focus graph.
 *
 * @param[in] obj The object.
 * @param[in] child The child to unregister.
 *
 * @ingroup Efl_Ui_Focus_Manager_Calc
  }
procedure efl_ui_focus_manager_calc_unregister(obj:PEo; child:PEfl_Ui_Focus_Object);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FOCUS_MANAGER_CALC_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_MANAGER_CALC_CLASS:=efl_ui_focus_manager_calc_class_get;
  end;


end.
