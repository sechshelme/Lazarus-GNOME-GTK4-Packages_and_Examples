
unit efl_ui_collection_view_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_collection_view_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_collection_view_eo.h
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
PEfl_Ui_Collection_View  = ^Efl_Ui_Collection_View;
PEfl_Ui_Factory  = ^Efl_Ui_Factory;
PEfl_Ui_Position_Manager_Entity  = ^Efl_Ui_Position_Manager_Entity;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_COLLECTION_VIEW_EO_H_}
{$define _EFL_UI_COLLECTION_VIEW_EO_H_}
{$ifndef _EFL_UI_COLLECTION_VIEW_EO_CLASS_TYPE}
{$define _EFL_UI_COLLECTION_VIEW_EO_CLASS_TYPE}
type
  PEfl_Ui_Collection_View = ^TEfl_Ui_Collection_View;
  TEfl_Ui_Collection_View = TEo;
{$endif}
{$ifndef _EFL_UI_COLLECTION_VIEW_EO_TYPES}
{$define _EFL_UI_COLLECTION_VIEW_EO_TYPES}
{$endif}
{*
 * @brief This widget displays a list of items in an arrangement controlled by
 * an external @ref efl_ui_collection_view_position_manager_get object. By
 * using different @ref efl_ui_collection_view_position_manager_get objects
 * this widget can show unidimensional lists or two-dimensional grids of items,
 * for example.
 *
 * This class is intended to act as a base for widgets like List_View or
 * @ref Efl_Ui_Grid_View, which hide this complexity from the user.
 *
 * Items are generated by the @ref Efl_Ui_Factory defined with .factory.set to
 * match the content of the @ref Efl_Model defined with
 * @ref efl_ui_view_model_set. They are dynamically created/destroyed to only
 * have the one that are necessary to display all the one that are to far out
 * of the viewport will not be created to lighten the usage for very large
 * list.
 *
 * The direction of the arrangement can be controlled through
 * @ref efl_ui_layout_orientation_get.
 *
 * If all items do not fit in the current widget size scrolling facilities are
 * provided.
 *
 * Items inside this widget can be selected according to the
 * @ref efl_ui_multi_selectable_select_mode_get policy, and the selection can
 * be retrieved with @ref efl_ui_multi_selectable_selected_ndx_iterator_new.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection_View
  }

{ was #define dname def_expr }
function EFL_UI_COLLECTION_VIEW_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_collection_view_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Define the factory used to create all the items.
 *
 * @param[in] obj The object.
 * @param[in] factory The factory.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection_View
  }
procedure efl_ui_collection_view_factory_set(obj:PEo; factory:PEfl_Ui_Factory);cdecl;external;
{*
 * @brief Define the factory used to create all the items.
 *
 * @param[in] obj The object.
 *
 * @return The factory.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection_View
  }
(* Const before type ignored *)
function efl_ui_collection_view_factory_get(obj:PEo):PEfl_Ui_Factory;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Position manager object that handles placement of items.
 *
 * @param[in] obj The object.
 * @param[in] position_manager The objects ownership is passed to the item
 * container.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection_View
  }
procedure efl_ui_collection_view_position_manager_set(obj:PEo; position_manager:PEfl_Ui_Position_Manager_Entity);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Position manager object that handles placement of items.
 *
 * @param[in] obj The object.
 *
 * @return A borrowed reference to the manager.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection_View
  }
(* Const before type ignored *)

function efl_ui_collection_view_position_manager_get(obj:PEo):PEfl_Ui_Position_Manager_Entity;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
(* Const before type ignored *)
  var
    _EFL_UI_COLLECTION_VIEW_EVENT_ITEM_REALIZED : TEfl_Event_Description;cvar;external;
{* Event triggered when an @ref Efl_Ui_Item has been provided by the
 * @ref Efl_Ui_Factory and is about to be used.
 * @return Efl_Ui_Item *
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection_View
  }
(* Const before type ignored *)
    _EFL_UI_COLLECTION_VIEW_EVENT_ITEM_UNREALIZED : TEfl_Event_Description;cvar;external;
{* Event triggered when the @ref Efl_Ui_Collection_View is about to give an
 * @ref Efl_Ui_Item back to the @ref Efl_Ui_Factory.
 * @return Efl_Ui_Item *
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Collection_View
  }

{ was #define dname def_expr }
function EFL_UI_COLLECTION_VIEW_EVENT_ITEM_REALIZED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_COLLECTION_VIEW_EVENT_ITEM_UNREALIZED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_COLLECTION_VIEW_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_COLLECTION_VIEW_CLASS:=efl_ui_collection_view_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_COLLECTION_VIEW_EVENT_ITEM_REALIZED : longint; { return type might be wrong }
  begin
    EFL_UI_COLLECTION_VIEW_EVENT_ITEM_REALIZED:=@(_EFL_UI_COLLECTION_VIEW_EVENT_ITEM_REALIZED);
  end;

{ was #define dname def_expr }
function EFL_UI_COLLECTION_VIEW_EVENT_ITEM_UNREALIZED : longint; { return type might be wrong }
  begin
    EFL_UI_COLLECTION_VIEW_EVENT_ITEM_UNREALIZED:=@(_EFL_UI_COLLECTION_VIEW_EVENT_ITEM_UNREALIZED);
  end;


end.
