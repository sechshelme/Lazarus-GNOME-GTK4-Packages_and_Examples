{$IFDEF read_interface}


type
  PElm_Notify_Part = ^TElm_Notify_Part;
  TElm_Notify_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_NOTIFY_PART_CLASS: PEfl_Class;

function elm_notify_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 1-6-25 13:54:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_NOTIFY_PART_CLASS: PEfl_Class;
begin
  ELM_NOTIFY_PART_CLASS := elm_notify_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
