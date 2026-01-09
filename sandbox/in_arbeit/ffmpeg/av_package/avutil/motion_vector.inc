{$IFDEF read_interface}


type
  TAVMotionVector = record
    source: Tint32_t;
    w: Tuint8_t;
    h: Tuint8_t;
    src_x: Tint16_t;
    src_y: Tint16_t;
    dst_x: Tint16_t;
    dst_y: Tint16_t;
    flags: Tuint64_t;
    motion_x: Tint32_t;
    motion_y: Tint32_t;
    motion_scale: Tuint16_t;
  end;
  PAVMotionVector = ^TAVMotionVector;

  // === Konventiert am: 14-12-25 17:31:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
