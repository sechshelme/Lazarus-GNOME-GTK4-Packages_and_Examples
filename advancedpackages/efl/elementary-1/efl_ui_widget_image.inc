{$IFDEF read_interface}


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


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
