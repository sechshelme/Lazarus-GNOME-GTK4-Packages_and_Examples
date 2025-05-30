unit elm_widget_slideshow;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Slideshow_Item_Data = record
    base: PElm_Widget_Item_Data;
    l: PEina_List;
    l_built: PEina_List;
    itc: PElm_Slideshow_Item_Class;
  end;
  PElm_Slideshow_Item_Data = ^TElm_Slideshow_Item_Data;

  PElm_Slideshow_Data = ^TElm_Slideshow_Data;
  TElm_Slideshow_Data = record
  end;


  // === Konventiert am: 30-5-25 17:55:08 ===


implementation


end.
