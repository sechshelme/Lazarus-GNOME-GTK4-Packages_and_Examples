{$IFDEF read_interface}


type
  PEfl_Ui_Layout_Part_Content = ^TEfl_Ui_Layout_Part_Content;
  TEfl_Ui_Layout_Part_Content = TEo;

function EFL_UI_LAYOUT_PART_CONTENT_CLASS: PEfl_Class;

function efl_ui_layout_part_content_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:36:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_LAYOUT_PART_CONTENT_CLASS: PEfl_Class;
begin
  EFL_UI_LAYOUT_PART_CONTENT_CLASS := efl_ui_layout_part_content_class_get;
end;


{$ENDIF read_implementation}
