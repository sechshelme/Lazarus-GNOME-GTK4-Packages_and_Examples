{$IFDEF read_interface}


type
  PEldbus_Model_Proxy = ^TEldbus_Model_Proxy;
  TEldbus_Model_Proxy = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_PROXY_CLASS: PEfl_Class;

function eldbus_model_proxy_class_get: PEfl_Class; cdecl; external libeldbus;
procedure eldbus_model_proxy_object_set(obj: PEo; obj2: PEldbus_Object); cdecl; external libeldbus;
procedure eldbus_model_proxy_interface_set(obj: PEo; iface: PEldbus_Introspection_Interface); cdecl; external libeldbus;
function eldbus_model_proxy_name_get(obj: PEo): pchar; cdecl; external libeldbus;
{$endif}

// === Konventiert am: 10-6-25 19:48:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_PROXY_CLASS: PEfl_Class;
begin
  ELDBUS_MODEL_PROXY_CLASS := eldbus_model_proxy_class_get;
end;
{$endif}


{$ENDIF read_implementation}
