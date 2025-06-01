{$IFDEF read_interface}


type
  PElm_Combobox_Data = ^TElm_Combobox_Data;
  TElm_Combobox_Data = record
  end;

function ELM_COMBOBOX_CLASS: PEfl_Class;

function elm_combobox_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:41:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ELM_COMBOBOX_CLASS: PEfl_Class;
begin
  ELM_COMBOBOX_CLASS := elm_combobox_class_get;
end;


{$ENDIF read_implementation}
