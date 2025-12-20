{$IFDEF read_interface}


type
  TAVDCT = record
    av_class: PAVClass;
    idct: procedure(block: Pint16_t); cdecl;
    idct_permutation: array[0..63] of Tuint8_t;
    fdct: procedure(block: Pint16_t); cdecl;
    dct_algo: longint;
    idct_algo: longint;
    get_pixels: procedure(block: Pint16_t; pixels: Puint8_t; line_size: Tptrdiff_t); cdecl;
    bits_per_sample: longint;
    get_pixels_unaligned: procedure(block: Pint16_t; pixels: Puint8_t; line_size: Tptrdiff_t); cdecl;
  end;
  PAVDCT = ^TAVDCT;

function avcodec_dct_alloc: PAVDCT; cdecl; external libavcodec;
function avcodec_dct_init(para1: PAVDCT): longint; cdecl; external libavcodec;
function avcodec_dct_get_class: PAVClass; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:09:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
