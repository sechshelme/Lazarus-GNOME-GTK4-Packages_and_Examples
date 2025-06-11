{$IFDEF read_interface}


type
  PEldbus_Model_Arguments = ^TEldbus_Model_Arguments;
  TEldbus_Model_Arguments = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_ARGUMENTS_CLASS: PEfl_Class;

function eldbus_model_arguments_class_get: PEfl_Class; cdecl; external libeldbus;
procedure eldbus_model_arguments_custom_constructor(obj: PEo; proxy: PEldbus_Proxy; name: pchar; arguments: PEina_List); cdecl; external libeldbus;
function eldbus_model_arguments_arg_name_get(obj: PEo): pchar; cdecl; external libeldbus;
{$endif}

// === Konventiert am: 10-6-25 19:48:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELDBUS_MODEL_ARGUMENTS_CLASS: PEfl_Class;
begin
  ELDBUS_MODEL_ARGUMENTS_CLASS := eldbus_model_arguments_class_get;
end;
{$endif}


{$ENDIF read_implementation}
