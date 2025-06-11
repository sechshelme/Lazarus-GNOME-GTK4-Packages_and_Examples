{$IFDEF read_interface}


type
  PEldbus_Model_Connection = ^TEldbus_Model_Connection;
  TEldbus_Model_Connection = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_CONNECTION_CLASS: PEfl_Class;

function eldbus_model_connection_class_get: PEfl_Class; cdecl; external libeldbus;
{$endif}

// === Konventiert am: 10-6-25 19:48:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_CONNECTION_CLASS: PEfl_Class;
begin
  ELDBUS_MODEL_CONNECTION_CLASS := eldbus_model_connection_class_get;
end;
{$endif}


{$ENDIF read_implementation}
