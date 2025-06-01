{$IFDEF read_interface}


type
  PEfl_Ui_Widget_Factory = ^TEfl_Ui_Widget_Factory;
  TEfl_Ui_Widget_Factory = TEo;

function EFL_UI_WIDGET_FACTORY_CLASS: PEfl_Class;

function efl_ui_widget_factory_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_widget_factory_item_class_set(obj: PEo; klass: PEfl_Class); cdecl; external libelementary;
function efl_ui_widget_factory_item_class_get(obj: PEo): PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:32:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_WIDGET_FACTORY_CLASS: PEfl_Class;
begin
  EFL_UI_WIDGET_FACTORY_CLASS := efl_ui_widget_factory_class_get;
end;


{$ENDIF read_implementation}
