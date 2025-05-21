{$IFDEF read_interface}


type
  PEfl_Generic_Model = ^TEfl_Generic_Model;
  TEfl_Generic_Model = TEo;

function EFL_GENERIC_MODEL_CLASS: PEfl_Class;

function efl_generic_model_class_get: PEfl_Class; cdecl; external libecore;

// === Konventiert am: 21-5-25 17:19:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_GENERIC_MODEL_CLASS: PEfl_Class;
begin
  EFL_GENERIC_MODEL_CLASS := efl_generic_model_class_get;
end;


{$ENDIF read_implementation}
