{$IFDEF read_interface}


type
  PElm_Fileselector_Entry_Part = ^TElm_Fileselector_Entry_Part;
  TElm_Fileselector_Entry_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_FILESELECTOR_ENTRY_PART_CLASS: PEfl_Class;

function elm_fileselector_entry_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 17:01:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_FILESELECTOR_ENTRY_PART_CLASS: PEfl_Class;
begin
  ELM_FILESELECTOR_ENTRY_PART_CLASS := elm_fileselector_entry_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
