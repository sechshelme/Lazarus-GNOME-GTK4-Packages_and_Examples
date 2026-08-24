{$IFDEF read_interface}

type
  TH5C_cache_incr_mode = longint;
const
  H5C_incr__off = 0;
  H5C_incr__threshold = 1;

type
  TH5C_cache_flash_incr_mode = longint;
const
  H5C_flash_incr__off = 0;
  H5C_flash_incr__add_space = 1;

type
  TH5C_cache_decr_mode = longint;
const
  H5C_decr__off = 0;
  H5C_decr__threshold = 1;
  H5C_decr__age_out = 2;
  H5C_decr__age_out_with_threshold = 3;


  // === Konventiert am: 20-8-26 19:37:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
