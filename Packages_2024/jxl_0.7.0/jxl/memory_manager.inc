{$IFDEF read_interface}


type
  Tjpegxl_alloc_func = function(opaque: pointer; size: Tsize_t): pointer; cdecl;
  Tjpegxl_free_func = procedure(opaque: pointer; address: pointer); cdecl;

  PJxlMemoryManagerStruct = ^TJxlMemoryManagerStruct;
  TJxlMemoryManagerStruct = record
    opaque: pointer;
    alloc: Tjpegxl_alloc_func;
    free: Tjpegxl_free_func;
  end;
  TJxlMemoryManager = TJxlMemoryManagerStruct;
  PJxlMemoryManager = ^TJxlMemoryManager;

  // === Konventiert am: 14-8-26 19:28:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
