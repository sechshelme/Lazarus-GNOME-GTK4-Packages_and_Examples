{$IFDEF read_interface}


type
  PElm_Widget_Item_Container = ^TElm_Widget_Item_Container;
  TElm_Widget_Item_Container = TEo;

function ELM_WIDGET_ITEM_CONTAINER_INTERFACE: PEfl_Class;

function elm_widget_item_container_interface_get: PEfl_Class; cdecl; external libelementary;
function elm_widget_item_container_focused_item_get(obj: PEo): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:53:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ELM_WIDGET_ITEM_CONTAINER_INTERFACE: PEfl_Class;
begin
  ELM_WIDGET_ITEM_CONTAINER_INTERFACE := elm_widget_item_container_interface_get;
end;


{$ENDIF read_implementation}
