{$IFDEF read_interface}


const
  _WIN32_WINNT = $0602;

const
  FF_DXVA2_WORKAROUND_SCALING_LIST_ZIGZAG = 1;
  FF_DXVA2_WORKAROUND_INTEL_CLEARVIDEO = 2;

type
  PAVD3D11VAContext = type Pointer;

function av_d3d11va_alloc_context: PAVD3D11VAContext; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:10:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
