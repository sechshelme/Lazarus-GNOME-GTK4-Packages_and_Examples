unit elm_widget_diskselector;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Diskselector_Data = ^TElm_Diskselector_Data;
  TElm_Diskselector_Data = record
  end;

type
  TElm_Diskselector_Item_Data = record
    base: PElm_Widget_Item_Data;
    node: PEina_List;
    icon: PEvas_Object;
    _label: pchar;
    func: TEvas_Smart_Cb;
  end;
  PElm_Diskselector_Item_Data = ^TElm_Diskselector_Item_Data;


  // === Konventiert am: 30-5-25 13:11:49 ===


implementation


end.
