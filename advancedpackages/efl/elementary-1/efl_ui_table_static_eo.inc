{$IFDEF read_interface}


type
  PEfl_Ui_Table_Static = ^TEfl_Ui_Table_Static;
  TEfl_Ui_Table_Static = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TABLE_STATIC_CLASS: PEfl_Class;

function efl_ui_table_static_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 17:38:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TABLE_STATIC_CLASS: PEfl_Class;
begin
  EFL_UI_TABLE_STATIC_CLASS := efl_ui_table_static_class_get;
end;
{$endif}


{$ENDIF read_implementation}
