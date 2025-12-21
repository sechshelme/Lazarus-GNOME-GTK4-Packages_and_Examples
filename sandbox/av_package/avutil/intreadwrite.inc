{$IFDEF read_interface}


type
  Tav_alias64 = record
    case longint of
      0: (u64: Tuint64_t);
      1: (u32: array[0..1] of Tuint32_t);
      2: (u16: array[0..3] of Tuint16_t);
      3: (u8: array[0..7] of Tuint8_t);
      4: (f64: double);
      5: (f32: array[0..1] of single);
  end;
  Pav_alias64 = ^Tav_alias64;

  Tav_alias32 = record
    case longint of
      0: (u32: Tuint32_t);
      1: (u16: array[0..1] of Tuint16_t);
      2: (u8: array[0..3] of Tuint8_t);
      3: (f32: single);
  end;
  Pav_alias32 = ^Tav_alias32;

  Tav_alias16 = record
    case longint of
      0: (u16: Tuint16_t);
      1: (u8: array[0..1] of Tuint8_t);
  end;
  Pav_alias16 = ^Tav_alias16;

type
  Tunaligned_64 = record
    case longint of
      0: (l: Tuint64_t);
  end;
  Punaligned_64 = ^Tunaligned_64;

  Tunaligned_32 = record
    case longint of
      0: (l: Tuint32_t);
  end;
  Punaligned_32 = ^Tunaligned_32;

  Tunaligned_16 = record
    case longint of
      0: (l: Tuint16_t);
  end;
  Punaligned_16 = ^Tunaligned_16;


  // === Konventiert am: 14-12-25 17:31:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
