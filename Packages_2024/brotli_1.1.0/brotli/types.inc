{$IFDEF read_interface}


type
  TBROTLI_BOOL = Boolean32;

const
  BROTLI_TRUE = 1;
  BROTLI_FALSE = 0;

type
  Tbrotli_alloc_func = function(opaque: pointer; size: Tsize_t): pointer; cdecl;
  Tbrotli_free_func = procedure(opaque: pointer; address: pointer); cdecl;

  // === Konventiert am: 4-2-26 19:48:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
