unit efl_ui_image_zoomable_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Image_Zoomable_Grid_Item = ^TEfl_Ui_Image_Zoomable_Grid_Item;
  TEfl_Ui_Image_Zoomable_Grid_Item = record
  end;

type
  PEfl_Ui_Image_Zoomable_Grid = ^TEfl_Ui_Image_Zoomable_Grid;
  TEfl_Ui_Image_Zoomable_Grid = record
  end;

type
  PEfl_Ui_Image_Zoomable_Data = ^TEfl_Ui_Image_Zoomable_Data;
  TEfl_Ui_Image_Zoomable_Data = record
  end;

type
  PEfl_Ui_Image_Zoomable_Pan_Data = ^TEfl_Ui_Image_Zoomable_Pan_Data;

  TEfl_Ui_Image_Zoomable_Pan_Data = record
    wobj: PEo;
    wsd: PEfl_Ui_Image_Zoomable_Data;
  end;


  // === Konventiert am: 28-5-25 19:48:31 ===


implementation


end.
