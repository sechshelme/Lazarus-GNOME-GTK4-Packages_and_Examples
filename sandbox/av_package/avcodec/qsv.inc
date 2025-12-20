{$IFDEF read_interface}


type
  PAVQSVContext = type Pointer;

function av_qsv_alloc_context: PAVQSVContext; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
