unit elm_widget_list;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ELM_LIST_SWIPE_MOVES = 12;

type
  PElm_List_Data = ^TElm_List_Data;
  TElm_List_Data = record
  end;

type
  PElm_List_Item_Data = ^TElm_List_Item_Data;
  TElm_List_Item_Data = record
  end;


  // === Konventiert am: 28-5-25 19:25:25 ===


implementation


end.
