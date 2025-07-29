{$IFDEF read_interface}


type
  Pdbus_unichar_t = ^Tdbus_unichar_t;
  Tdbus_unichar_t = Tdbus_uint32_t;

  Pdbus_bool_t = ^Tdbus_bool_t;
  Tdbus_bool_t = Boolean32;

  TDBus8ByteStruct = record
    first32: Tdbus_uint32_t;
    second32: Tdbus_uint32_t;
  end;
  PDBus8ByteStruct = ^TDBus8ByteStruct;

  TDBusBasicValue = record
    case longint of
      0: (bytes: array[0..7] of byte);
      1: (i16: Tdbus_int16_t);
      2: (u16: Tdbus_uint16_t);
      3: (i32: Tdbus_int32_t);
      4: (u32: Tdbus_uint32_t);
      5: (bool_val: Tdbus_bool_t);
      6: (i64: Tdbus_int64_t);
      7: (u64: Tdbus_uint64_t);
      8: (eight: TDBus8ByteStruct);
      9: (dbl: double);
      10: (byt: byte);
      11: (str: pchar);
      12: (fd: longint);
  end;
  PDBusBasicValue = ^TDBusBasicValue;

  // === Konventiert am: 29-7-25 15:07:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
