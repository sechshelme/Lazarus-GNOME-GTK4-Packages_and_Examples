unit elm_segment_control_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Segment_Control = ^TElm_Segment_Control;
  TElm_Segment_Control = TEo;

function elm_segment_control_item_count_get(obj: PElm_Segment_Control): longint; cdecl; external libelementary;
function elm_segment_control_item_selected_get(obj: PElm_Segment_Control): PElm_Widget_Item; cdecl; external libelementary;
function elm_segment_control_item_label_get(obj: PElm_Segment_Control; idx: longint): pchar; cdecl; external libelementary;
function elm_segment_control_item_insert_at(obj: PElm_Segment_Control; icon: PEfl_Canvas_Object; _label: pchar; idx: longint): PElm_Widget_Item; cdecl; external libelementary;
function elm_segment_control_item_get(obj: PElm_Segment_Control; idx: longint): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_segment_control_item_del_at(obj: PElm_Segment_Control; idx: longint); cdecl; external libelementary;
function elm_segment_control_item_add(obj: PElm_Segment_Control; icon: PEfl_Canvas_Object; _label: pchar): PElm_Widget_Item; cdecl; external libelementary;
function elm_segment_control_item_icon_get(obj: PElm_Segment_Control; idx: longint): PEfl_Canvas_Object; cdecl; external libelementary;

// === Konventiert am: 28-5-25 19:26:16 ===


implementation



end.
