{$IFDEF read_interface}


type
  PEldbus_Model_Object = ^TEldbus_Model_Object;
  TEldbus_Model_Object = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_OBJECT_CLASS: PEfl_Class;

function eldbus_model_object_class_get: PEfl_Class; cdecl; external libeldbus;
procedure eldbus_model_object_bus_set(obj: PEo; bus: pchar); cdecl; external libeldbus;
function eldbus_model_object_bus_get(obj: PEo): pchar; cdecl; external libeldbus;
procedure eldbus_model_object_path_set(obj: PEo; path: pchar); cdecl; external libeldbus;
function eldbus_model_object_path_get(obj: PEo): pchar; cdecl; external libeldbus;
{$endif}

// === Konventiert am: 10-6-25 19:48:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_OBJECT_CLASS: PEfl_Class;
begin
  ELDBUS_MODEL_OBJECT_CLASS := eldbus_model_object_class_get;
end;
{$endif}


{$ENDIF read_implementation}
