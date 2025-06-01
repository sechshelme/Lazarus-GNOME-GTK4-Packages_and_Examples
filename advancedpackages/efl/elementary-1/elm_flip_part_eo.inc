{$IFDEF read_interface}


type
  PElm_Flip_Part = ^TElm_Flip_Part;
  TElm_Flip_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_FLIP_PART_CLASS: PEfl_Class;

function elm_flip_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 1-6-25 12:57:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_FLIP_PART_CLASS: PEfl_Class;
begin
  // Nicht in *.so Aufindbar.
//  ELM_FLIP_PART_CLASS := elm_flip_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
