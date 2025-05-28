
unit efl_ui_position_manager_data_access_v1_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_position_manager_data_access_v1_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    efl_ui_position_manager_data_access_v1_eo.h
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
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Ui_Item  = ^Efl_Ui_Item;
PEfl_Ui_Position_Manager_Data_Access_V1  = ^Efl_Ui_Position_Manager_Data_Access_V1;
PEfl_Ui_Position_Manager_Object_Batch_Entity  = ^Efl_Ui_Position_Manager_Object_Batch_Entity;
PEfl_Ui_Position_Manager_Object_Batch_Result  = ^Efl_Ui_Position_Manager_Object_Batch_Result;
PEfl_Ui_Position_Manager_Request_Range  = ^Efl_Ui_Position_Manager_Request_Range;
PEfl_Ui_Position_Manager_Size_Batch_Entity  = ^Efl_Ui_Position_Manager_Size_Batch_Entity;
PEfl_Ui_Position_Manager_Size_Batch_Result  = ^Efl_Ui_Position_Manager_Size_Batch_Result;
PEfl_Ui_Position_Manager_Size_Call_Config  = ^Efl_Ui_Position_Manager_Size_Call_Config;
PEfl_Ui_Win  = ^Efl_Ui_Win;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_EO_H_}
{$define _EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_EO_H_}
{$ifndef _EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_EO_CLASS_TYPE}
{$define _EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_EO_CLASS_TYPE}
type
  PEfl_Ui_Position_Manager_Data_Access_V1 = ^TEfl_Ui_Position_Manager_Data_Access_V1;
  TEfl_Ui_Position_Manager_Data_Access_V1 = TEo;
{$endif}
{$ifndef _EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_EO_TYPES}
{$define _EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Representing the range of a request.
 *
 * @ingroup Efl_Ui_Position_Manager_Request_Range
  }
{*< The first item that must be filled into the passed
                          * slice.  }
{*< The last item that must be filled into the passed
                        * slice.  }
type
  PEfl_Ui_Position_Manager_Request_Range = ^TEfl_Ui_Position_Manager_Request_Range;
  TEfl_Ui_Position_Manager_Request_Range = record
      start_id : dword;
      end_id : dword;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Struct that is getting filled by the object function callback.
 *
 * @ingroup Efl_Ui_Position_Manager_Object_Batch_Entity
  }
{*< The canvas object.  }
{*< The depth change in this returned entity.
                                * Every Element has a depth, if the parent is
                                * @c null the depth is 0. Every step deeper
                                * into the hierarchy is exactly one depth
                                * deeper. If this depth has been different to
                                * the previous item, then this element can be
                                * seen as the group leader. The following
                                * elements with the same depth are in the same
                                * group.  }
{*< @c true if this is the leader of a group  }
type
  PEfl_Ui_Position_Manager_Object_Batch_Entity = ^TEfl_Ui_Position_Manager_Object_Batch_Entity;
  TEfl_Ui_Position_Manager_Object_Batch_Entity = record
      entity : PEfl_Gfx_Entity;
      element_depth : byte;
      depth_leader : TEina_Bool;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Struct that is getting filled by the size function callback.
 *
 * @ingroup Efl_Ui_Position_Manager_Size_Batch_Entity
  }
{*< The size of the element.  }
{*< The depth change in this returned entity.
                                * Every Element has a depth, if the parent is
                                * @c null the depth is 0. Every step deeper
                                * into the hierarchy is exactly one depth
                                * deeper. If this depth has been different to
                                * the previous item, then this element can be
                                * seen as the group leader. The following
                                * elements with the same depth are in the same
                                * group.  }
{*< @c true if this is the leader of a group  }
type
  PEfl_Ui_Position_Manager_Size_Batch_Entity = ^TEfl_Ui_Position_Manager_Size_Batch_Entity;
  TEfl_Ui_Position_Manager_Size_Batch_Entity = record
      size : TEina_Size2D;
      element_depth : byte;
      depth_leader : TEina_Bool;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Struct returned by the size access callback.
 *
 * @ingroup Efl_Ui_Position_Manager_Size_Batch_Result
  }
{*< The group size of the group where the first item
                            * is part of.  }
{*< The depth of the parent  }
{*< The number of items that are filled into the
                              * slice.  }
type
  PEfl_Ui_Position_Manager_Size_Batch_Result = ^TEfl_Ui_Position_Manager_Size_Batch_Result;
  TEfl_Ui_Position_Manager_Size_Batch_Result = record
      parent_size : TEina_Size2D;
      parent_depth : byte;
      filled_items : dword;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Struct that is returned by the function callbacks.
 *
 * @ingroup Efl_Ui_Position_Manager_Size_Call_Config
  }
{*< The range of items to fill
                                                * into @.memory. The length of
                                                * memory must be bigger or
                                                * equal to the requested items
                                                 }
{*< Indicate if this request is made for caching or
                            * displaying. If it's for caching, the
                            * data-provider will fill in approximations,
                            * instead of doing heavy lifting from some
                            * back-end. If this is not a caching call, the
                            * exact size should be requested and delivered at
                            * some later point.  }
type
  PEfl_Ui_Position_Manager_Size_Call_Config = ^TEfl_Ui_Position_Manager_Size_Call_Config;
  TEfl_Ui_Position_Manager_Size_Call_Config = record
      range : TEfl_Ui_Position_Manager_Request_Range;
      cache_request : TEina_Bool;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Struct returned by the object access callback
 *
 * @ingroup Efl_Ui_Position_Manager_Object_Batch_Result
  }
{*< The group where the first item is part of  }
{*< The depth of the parent  }
{*< The number of items that are filled into the
                              * slice  }
type
  PEfl_Ui_Position_Manager_Object_Batch_Result = ^TEfl_Ui_Position_Manager_Object_Batch_Result;
  TEfl_Ui_Position_Manager_Object_Batch_Result = record
      group : PEfl_Ui_Item;
      parent_depth : byte;
      filled_items : dword;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Function callback for getting a batch of items.
 *
 * @ingroup Efl_Ui_Position_Manager_Object_Batch_Callback
  }
type

  TEfl_Ui_Position_Manager_Object_Batch_Callback = function (data:pointer; range:TEfl_Ui_Position_Manager_Request_Range; memory:TEina_Rw_Slice):TEfl_Ui_Position_Manager_Object_Batch_Result;cdecl;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Function callback for getting sizes of a batch of items.
 *
 * @ingroup Efl_Ui_Position_Manager_Size_Batch_Callback
  }
type

  TEfl_Ui_Position_Manager_Size_Batch_Callback = function (data:pointer; conf:TEfl_Ui_Position_Manager_Size_Call_Config; memory:TEina_Rw_Slice):TEfl_Ui_Position_Manager_Size_Batch_Result;cdecl;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Interface for abstracting the data access of the position managers.
 *
 * The idea here is that a data-provider calls
 * @ref efl_ui_position_manager_data_access_v1_data_access_set on the position
 * manager object and passes the functions that are defined here. Later, the
 * position manager can call these function callbacks to get sizes or objects.
 * A data-provider should always fill all requested items. If an item is not
 * available @c null should be inserted. If a size is not available, an
 * as-close-as-possible approximation should be inserted. The Size callback is
 * equipped with a parameter to specify caching requests. This flag can be used
 * to differentiate between two use cases: When the size is being requested to
 * build up a cache over all items, and when the size is being requested to
 * apply it to the object. Since the data-provider might need to do expensive
 * operations to find the exact size, the as-close-as-possible approximation is
 * usually enough when building caches. If real object placement is happening,
 * then real sizes must be requested. If a size changes after it was returned
 * due to batching, this change still should be announced with the
 * @ref efl_ui_position_manager_entity_item_size_changed function.
 *
 * The depth of the items is used to express a hierarchical structure on the
 * items themselves. Any given depth might or might not have a @c depth_leader.
 * A group is ended when there is either a lower depth, or another
 * @c depth_leader.
 *
 * @ingroup Efl_Ui_Position_Manager_Data_Access_V1
  }

{ was #define dname def_expr }
function EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_position_manager_data_access_v1_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief This gives access to items to be managed. The manager reads this
 * information and modifies the retrieved items' positions and sizes.
 *
 * @c obj_access gives access to the graphical entities to manage. Some of them
 * might be @c NULL, meaning they are not yet ready to be displayed. Their size
 * in the @c size_access array will be correct, though, so other entities can
 * still be positioned correctly. Typically, only entities inside the viewport
 * will be retrieved.
 *
 * @c size_access gives access to the 2D sizes for the items to manage. All
 * sizes will always be valid, and might change over time (indicated through
 * the @ref efl_ui_position_manager_entity_item_size_changed method). The whole
 * range might need to be traversed in order to calculate the position of all
 * items in some arrangements.
 *
 * You can access a batch of objects or sizes by calling the here passed
 * function callbacks. Further details can be found at the function
 * definitions.
 *
 * @param[in] obj The object.
 * @param[in] canvas Will use this object to freeze/thaw canvas events.
 * @param[in] obj_access Function callback for canvas objects, even if the
 * start_id is valid, the returned objects may be @c NULL.
 * @param[in] size_access Function callback for the size, returned values are
 * always valid, but might be changed later on.
 * @param[in] size valid size for start_id, 0 <= i < size
 *
 * @ingroup Efl_Ui_Position_Manager_Data_Access_V1
  }
procedure efl_ui_position_manager_data_access_v1_data_access_set(obj:PEo; canvas:PEfl_Ui_Win; obj_access_data:pointer; obj_access:TEfl_Ui_Position_Manager_Object_Batch_Callback; obj_access_free_cb:TEina_Free_Cb; 
            size_access_data:pointer; size_access:TEfl_Ui_Position_Manager_Size_Batch_Callback; size_access_free_cb:TEina_Free_Cb; size:longint);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_INTERFACE:=efl_ui_position_manager_data_access_v1_interface_get;
  end;


end.
