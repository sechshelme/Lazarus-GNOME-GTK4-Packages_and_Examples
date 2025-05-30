{$IFDEF read_interface}


type
  PEfl_Ui_Position_Manager_Data_Access_V1 = ^TEfl_Ui_Position_Manager_Data_Access_V1;
  TEfl_Ui_Position_Manager_Data_Access_V1 = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Position_Manager_Request_Range = record
    start_id: dword;
    end_id: dword;
  end;
  PEfl_Ui_Position_Manager_Request_Range = ^TEfl_Ui_Position_Manager_Request_Range;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Position_Manager_Object_Batch_Entity = record
    entity: PEfl_Gfx_Entity;
    element_depth: byte;
    depth_leader: TEina_Bool;
  end;
  PEfl_Ui_Position_Manager_Object_Batch_Entity = ^TEfl_Ui_Position_Manager_Object_Batch_Entity;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Position_Manager_Size_Batch_Entity = record
    size: TEina_Size2D;
    element_depth: byte;
    depth_leader: TEina_Bool;
  end;
  PEfl_Ui_Position_Manager_Size_Batch_Entity = ^TEfl_Ui_Position_Manager_Size_Batch_Entity;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Position_Manager_Size_Batch_Result = record
    parent_size: TEina_Size2D;
    parent_depth: byte;
    filled_items: dword;
  end;
  PEfl_Ui_Position_Manager_Size_Batch_Result = ^TEfl_Ui_Position_Manager_Size_Batch_Result;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Position_Manager_Size_Call_Config = record
    range: TEfl_Ui_Position_Manager_Request_Range;
    cache_request: TEina_Bool;
  end;
  PEfl_Ui_Position_Manager_Size_Call_Config = ^TEfl_Ui_Position_Manager_Size_Call_Config;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Position_Manager_Object_Batch_Result = record
    group: PEfl_Ui_Item;
    parent_depth: byte;
    filled_items: dword;
  end;
  PEfl_Ui_Position_Manager_Object_Batch_Result = ^TEfl_Ui_Position_Manager_Object_Batch_Result;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Position_Manager_Object_Batch_Callback = function(data: pointer; range: TEfl_Ui_Position_Manager_Request_Range; memory: TEina_Rw_Slice): TEfl_Ui_Position_Manager_Object_Batch_Result; cdecl;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Position_Manager_Size_Batch_Callback = function(data: pointer; conf: TEfl_Ui_Position_Manager_Size_Call_Config; memory: TEina_Rw_Slice): TEfl_Ui_Position_Manager_Size_Batch_Result; cdecl;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_INTERFACE: PEfl_Class;

function efl_ui_position_manager_data_access_v1_interface_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_position_manager_data_access_v1_data_access_set(obj: PEo; canvas: PEfl_Ui_Win; obj_access_data: pointer; obj_access: TEfl_Ui_Position_Manager_Object_Batch_Callback; obj_access_free_cb: TEina_Free_Cb;
  size_access_data: pointer; size_access: TEfl_Ui_Position_Manager_Size_Batch_Callback; size_access_free_cb: TEina_Free_Cb; size: longint); cdecl; external libelementary;
{$endif}

// === Konventiert am: 28-5-25 15:56:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_INTERFACE: PEfl_Class;
begin
  EFL_UI_POSITION_MANAGER_DATA_ACCESS_V1_INTERFACE := efl_ui_position_manager_data_access_v1_interface_get;
end;
{$endif}


{$ENDIF read_implementation}
