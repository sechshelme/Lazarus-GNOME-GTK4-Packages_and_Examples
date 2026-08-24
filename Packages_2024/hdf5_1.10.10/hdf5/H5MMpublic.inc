{$IFDEF read_interface}


type
  TH5MM_allocate_t = function(size: Tsize_t; alloc_info: pointer): pointer; cdecl;
  PH5MM_allocate_t = ^TH5MM_allocate_t;
  TH5MM_free_t = procedure(mem: pointer; free_info: pointer); cdecl;
  PH5MM_free_t = ^TH5MM_free_t;

  // === Konventiert am: 21-8-26 14:23:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
