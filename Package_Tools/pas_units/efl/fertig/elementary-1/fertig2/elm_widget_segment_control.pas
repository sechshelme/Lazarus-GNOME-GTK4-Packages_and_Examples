unit elm_widget_segment_control;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Segment_Control_Item_Data = record
    base: PElm_Widget_Item_Data;
    icon: PEvas_Object;
    _label: pchar;
    seg_index: longint;
  end;
  PElm_Segment_Control_Item_Data = ^TElm_Segment_Control_Item_Data;

  TElm_Segment_Control_Data = record
    obj: PEvas_Object;
    items: PEina_List;
    selected_item: PElm_Segment_Control_Item_Data;
    item_width: longint;
  end;
  PElm_Segment_Control_Data = ^TElm_Segment_Control_Data;


  // === Konventiert am: 30-5-25 19:28:22 ===


implementation



end.
