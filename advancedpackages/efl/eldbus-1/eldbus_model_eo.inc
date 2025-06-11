{$IFDEF read_interface}


type
  PEldbus_Model = ^TEldbus_Model;
  TEldbus_Model = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_CLASS: PEfl_Class;

function eldbus_model_class_get: PEfl_Class; cdecl; external libeldbus;
procedure eldbus_model_connect(obj: PEo; _type: TEldbus_Connection_Type; address: pchar; priv: TEina_Bool); cdecl; external libeldbus;
procedure eldbus_model_connection_set(obj: PEo; dbus: PEldbus_Connection); cdecl; external libeldbus;
function eldbus_model_connection_get(obj: PEo): PEldbus_Connection; cdecl; external libeldbus;
function eldbus_model_type_get(obj: PEo): TEldbus_Connection_Type; cdecl; external libeldbus;
function eldbus_model_address_get(obj: PEo): pchar; cdecl; external libeldbus;
function eldbus_model_private_get(obj: PEo): TEina_Bool; cdecl; external libeldbus;
{$endif}

// === Konventiert am: 10-6-25 19:48:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_CLASS: PEfl_Class;
begin
  ELDBUS_MODEL_CLASS := eldbus_model_class_get;
end;
{$endif}


{$ENDIF read_implementation}
