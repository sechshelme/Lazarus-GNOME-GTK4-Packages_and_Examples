{$IFDEF read_interface}


type
  PEfl_Model_Provider = ^TEfl_Model_Provider;
  TEfl_Model_Provider = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_MODEL_PROVIDER_CLASS: PEfl_Class;

function efl_model_provider_class_get: PEfl_Class; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 14:59:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_MODEL_PROVIDER_CLASS: PEfl_Class;
begin
  EFL_MODEL_PROVIDER_CLASS := efl_model_provider_class_get;
end;
{$endif}


{$ENDIF read_implementation}
