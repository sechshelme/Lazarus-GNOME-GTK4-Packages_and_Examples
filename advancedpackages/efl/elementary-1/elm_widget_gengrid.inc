{$IFDEF read_interface}


type
  TElm_Gengrid_Data = record
  end;
  PElm_Gengrid_Data = ^TElm_Gengrid_Data;

type
  TElm_Gengrid_Pan_Data = record
    wobj: PEvas_Object;
    wsd: PElm_Gengrid_Data;
    resize_job: PEcore_Job;
  end;
  PElm_Gengrid_Pan_Data = ^TElm_Gengrid_Pan_Data;


  // === Konventiert am: 27-5-25 19:21:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
