{$IFDEF read_interface}


type
  PEfl_Object_Override = ^TEfl_Object_Override;
  TEfl_Object_Override = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_OBJECT_OVERRIDE_CLASS: PEfl_Class;

function efl_object_override_class_get: PEfl_Class; cdecl; external libeo;
{$endif}

// === Konventiert am: 18-5-25 13:19:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_OBJECT_OVERRIDE_CLASS: PEfl_Class;
begin
  EFL_OBJECT_OVERRIDE_CLASS := efl_object_override_class_get;
end;
{$endif}


{$ENDIF read_implementation}
