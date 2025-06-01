{$IFDEF read_interface}


type
  PElm_Box_Data = ^TElm_Box_Data;
  TElm_Box_Data = record
  end;

type
  TTransition_Animation_Data = record
    obj: PEvas_Object;
    start: record
      x: TEvas_Coord;
      y: TEvas_Coord;
      w: TEvas_Coord;
      h: TEvas_Coord;
      end;
    end_: record
      x: TEvas_Coord;
      y: TEvas_Coord;
      w: TEvas_Coord;
      h: TEvas_Coord;
      end;
  end;
  PTransition_Animation_Data = ^TTransition_Animation_Data;


  // === Konventiert am: 1-6-25 15:41:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
