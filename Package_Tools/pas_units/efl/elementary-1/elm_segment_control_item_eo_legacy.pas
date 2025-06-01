unit elm_segment_control_item_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Segment_Control_Item = ^TElm_Segment_Control_Item;
  TElm_Segment_Control_Item = TEo;

function elm_segment_control_item_index_get(obj: PElm_Segment_Control_Item): longint; cdecl; external libelementary;
function elm_segment_control_item_object_get(obj: PElm_Segment_Control_Item): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_segment_control_item_selected_set(obj: PElm_Segment_Control_Item; selected: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:10:11 ===


implementation



end.
