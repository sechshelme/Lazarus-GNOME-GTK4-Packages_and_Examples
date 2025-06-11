{$IFDEF read_interface}


type
  PEldbus_Model_Signal = ^TEldbus_Model_Signal;
  TEldbus_Model_Signal = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_SIGNAL_CLASS: PEfl_Class;

function eldbus_model_signal_class_get: PEfl_Class; cdecl; external libeldbus;
procedure eldbus_model_signal_constructor(obj: PEo; proxy: PEldbus_Proxy; signal: PEldbus_Introspection_Signal); cdecl; external libeldbus;
{$endif}

// === Konventiert am: 10-6-25 19:48:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ELDBUS_MODEL_SIGNAL_CLASS: PEfl_Class;
begin
  ELDBUS_MODEL_SIGNAL_CLASS := eldbus_model_signal_class_get;
end;


{$ENDIF read_implementation}
