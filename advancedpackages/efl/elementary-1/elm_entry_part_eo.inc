{$IFDEF read_interface}


type
  PElm_Entry_Part = ^TElm_Entry_Part;
  TElm_Entry_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_ENTRY_PART_CLASS: PEfl_Class;

function elm_entry_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 1-6-25 12:57:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_ENTRY_PART_CLASS: PEfl_Class;
begin
  ELM_ENTRY_PART_CLASS := elm_entry_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
