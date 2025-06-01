{$IFDEF read_interface}


type
  PEfl_Ui_Widget_Part_Bg = ^TEfl_Ui_Widget_Part_Bg;
  TEfl_Ui_Widget_Part_Bg = TEo;

function EFL_UI_WIDGET_PART_BG_CLASS: PEfl_Class;

function efl_ui_widget_part_bg_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:32:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_WIDGET_PART_BG_CLASS: PEfl_Class;
begin
  EFL_UI_WIDGET_PART_BG_CLASS := efl_ui_widget_part_bg_class_get;
end;


{$ENDIF read_implementation}
