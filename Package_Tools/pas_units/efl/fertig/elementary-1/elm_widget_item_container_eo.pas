unit elm_widget_item_container_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Widget_Item_Container = ^TElm_Widget_Item_Container;
  TElm_Widget_Item_Container = TEo;

function ELM_WIDGET_ITEM_CONTAINER_INTERFACE: PEfl_Class;

function elm_widget_item_container_interface_get: PEfl_Class; cdecl; external libelementary;
function elm_widget_item_container_focused_item_get(obj: PEo): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:53:40 ===


implementation


function ELM_WIDGET_ITEM_CONTAINER_INTERFACE: PEfl_Class;
begin
  ELM_WIDGET_ITEM_CONTAINER_INTERFACE := elm_widget_item_container_interface_get;
end;


end.
