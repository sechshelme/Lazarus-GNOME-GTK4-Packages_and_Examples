{$IFDEF read_interface}


type
  TElm_Photocam_Progress = record
    now: double;
    total: double;
  end;
  PElm_Photocam_Progress = ^TElm_Photocam_Progress;

  TElm_Photocam_Error = record
    status: longint;
    open_error: TEina_Bool;
  end;
  PElm_Photocam_Error = ^TElm_Photocam_Error;


  // === Konventiert am: 30-5-25 17:16:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
