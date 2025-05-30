unit efl_ui_widget_image;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Image_Preload_Status = ^TEfl_Ui_Image_Preload_Status;
  TEfl_Ui_Image_Preload_Status = longint;

const
  EFL_UI_IMAGE_PRELOAD_ENABLED = 0;
  EFL_UI_IMAGE_PRELOADING = 1;
  EFL_UI_IMAGE_PRELOADED = 2;
  EFL_UI_IMAGE_PRELOAD_DISABLED = 3;

type
  PEfl_Ui_Image_Data = ^TEfl_Ui_Image_Data;
  TEfl_Ui_Image_Data = record
  end;


  // === Konventiert am: 30-5-25 13:11:40 ===


implementation


end.
