{$IFDEF read_interface}


function ibus_attr_type_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_ATTR_TYPE: TGType;

function ibus_attr_underline_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_ATTR_UNDERLINE: TGType;

function ibus_bus_global_binding_type_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_BUS_GLOBAL_BINDING_TYPE: TGType;

function ibus_object_flags_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_OBJECT_FLAGS: TGType;

function ibus_prop_type_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_PROP_TYPE: TGType;

function ibus_prop_state_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_PROP_STATE: TGType;

function ibus_modifier_type_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_MODIFIER_TYPE: TGType;

function ibus_capabilite_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_CAPABILITE: TGType;

function ibus_preedit_focus_mode_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_PREEDIT_FOCUS_MODE: TGType;

function ibus_orientation_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_ORIENTATION: TGType;

function ibus_bus_name_flag_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_BUS_NAME_FLAG: TGType;

function ibus_bus_request_name_reply_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_BUS_REQUEST_NAME_REPLY: TGType;

function ibus_bus_start_service_by_name_reply_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_BUS_START_SERVICE_BY_NAME_REPLY: TGType;

function ibus_error_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_ERROR: TGType;

function ibus_input_purpose_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_INPUT_PURPOSE: TGType;

function ibus_input_hints_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_INPUT_HINTS: TGType;

function ibus_xevent_type_get_type: TGType; cdecl; external libibus;
function IBUS_TYPE_XEVENT_TYPE: TGType;


// === Konventiert am: 26-7-25 15:35:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function IBUS_TYPE_ATTR_TYPE: TGType;
begin
  IBUS_TYPE_ATTR_TYPE := ibus_attr_type_get_type;
end;

function IBUS_TYPE_ATTR_UNDERLINE: TGType;
begin
  IBUS_TYPE_ATTR_UNDERLINE := ibus_attr_underline_get_type;
end;

function IBUS_TYPE_BUS_GLOBAL_BINDING_TYPE: TGType;
begin
  IBUS_TYPE_BUS_GLOBAL_BINDING_TYPE := ibus_bus_global_binding_type_get_type;
end;

function IBUS_TYPE_OBJECT_FLAGS: TGType;
begin
  IBUS_TYPE_OBJECT_FLAGS := ibus_object_flags_get_type;
end;

function IBUS_TYPE_PROP_TYPE: TGType;
begin
  IBUS_TYPE_PROP_TYPE := ibus_prop_type_get_type;
end;

function IBUS_TYPE_PROP_STATE: TGType;
begin
  IBUS_TYPE_PROP_STATE := ibus_prop_state_get_type;
end;

function IBUS_TYPE_MODIFIER_TYPE: TGType;
begin
  IBUS_TYPE_MODIFIER_TYPE := ibus_modifier_type_get_type;
end;

function IBUS_TYPE_CAPABILITE: TGType;
begin
  IBUS_TYPE_CAPABILITE := ibus_capabilite_get_type;
end;

function IBUS_TYPE_PREEDIT_FOCUS_MODE: TGType;
begin
  IBUS_TYPE_PREEDIT_FOCUS_MODE := ibus_preedit_focus_mode_get_type;
end;

function IBUS_TYPE_ORIENTATION: TGType;
begin
  IBUS_TYPE_ORIENTATION := ibus_orientation_get_type;
end;

function IBUS_TYPE_BUS_NAME_FLAG: TGType;
begin
  IBUS_TYPE_BUS_NAME_FLAG := ibus_bus_name_flag_get_type;
end;

function IBUS_TYPE_BUS_REQUEST_NAME_REPLY: TGType;
begin
  IBUS_TYPE_BUS_REQUEST_NAME_REPLY := ibus_bus_request_name_reply_get_type;
end;

function IBUS_TYPE_BUS_START_SERVICE_BY_NAME_REPLY: TGType;
begin
  IBUS_TYPE_BUS_START_SERVICE_BY_NAME_REPLY := ibus_bus_start_service_by_name_reply_get_type;
end;

function IBUS_TYPE_ERROR: TGType;
begin
  IBUS_TYPE_ERROR := ibus_error_get_type;
end;

function IBUS_TYPE_INPUT_PURPOSE: TGType;
begin
  IBUS_TYPE_INPUT_PURPOSE := ibus_input_purpose_get_type;
end;

function IBUS_TYPE_INPUT_HINTS: TGType;
begin
  IBUS_TYPE_INPUT_HINTS := ibus_input_hints_get_type;
end;

function IBUS_TYPE_XEVENT_TYPE: TGType;
begin
  IBUS_TYPE_XEVENT_TYPE := ibus_xevent_type_get_type;
end;


{$ENDIF read_implementation}
