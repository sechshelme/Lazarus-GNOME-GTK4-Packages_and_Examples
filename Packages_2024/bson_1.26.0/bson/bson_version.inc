{$IFDEF read_interface}


const
  BSON_MAJOR_VERSION = 1;
  BSON_MINOR_VERSION = 26;
  BSON_MICRO_VERSION = 0;
  BSON_VERSION_S = '1.26.0';
  BSON_VERSION_HEX = ((BSON_MAJOR_VERSION shl 24) or (BSON_MINOR_VERSION shl 16)) or (BSON_MICRO_VERSION shl 8);

  // === Konventiert am: 17-5-26 16:53:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
