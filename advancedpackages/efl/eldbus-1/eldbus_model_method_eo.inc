{$IFDEF read_interface}


type
  PEldbus_Model_Method = ^TEldbus_Model_Method;
  TEldbus_Model_Method = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_METHOD_CLASS: PEfl_Class;

function eldbus_model_method_class_get: PEfl_Class; cdecl; external libeldbus;
procedure eldbus_model_method_proxy_set(obj: PEo; proxy: PEldbus_Proxy); cdecl; external libeldbus;
procedure eldbus_model_method_set(obj: PEo; method: PEldbus_Introspection_Method); cdecl; external libeldbus;
procedure eldbus_model_method_call(obj: PEo); cdecl; external libeldbus;

var
  _ELDBUS_MODEL_METHOD_EVENT_SUCCESSFUL_CALL: TEfl_Event_Description; cvar;external libeldbus;

function ELDBUS_MODEL_METHOD_EVENT_SUCCESSFUL_CALL: PEfl_Event_Description;
{$endif}

// === Konventiert am: 10-6-25 19:48:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_METHOD_CLASS: PEfl_Class;
begin
  ELDBUS_MODEL_METHOD_CLASS := eldbus_model_method_class_get;
end;

function ELDBUS_MODEL_METHOD_EVENT_SUCCESSFUL_CALL: PEfl_Event_Description;
begin
  ELDBUS_MODEL_METHOD_EVENT_SUCCESSFUL_CALL := @(_ELDBUS_MODEL_METHOD_EVENT_SUCCESSFUL_CALL);
end;
{$endif}


{$ENDIF read_implementation}
