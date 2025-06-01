{$IFDEF read_interface}


type
  PEfl_Ui_Panes_Part = ^TEfl_Ui_Panes_Part;
  TEfl_Ui_Panes_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PANES_PART_CLASS: PEfl_Class;

function efl_ui_panes_part_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_panes_part_hint_min_allow_set(obj: PEo; allow: TEina_Bool); cdecl; external libelementary;
function efl_ui_panes_part_hint_min_allow_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_panes_part_split_ratio_min_set(obj: PEo; size: double); cdecl; external libelementary;
function efl_ui_panes_part_split_ratio_min_get(obj: PEo): double; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 17:14:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PANES_PART_CLASS: PEfl_Class;
begin
  EFL_UI_PANES_PART_CLASS := efl_ui_panes_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
