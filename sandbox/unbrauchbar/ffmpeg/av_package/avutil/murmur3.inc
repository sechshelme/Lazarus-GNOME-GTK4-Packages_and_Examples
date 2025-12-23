{$IFDEF read_interface}



function av_murmur3_alloc: PAVMurMur3; cdecl; external libavutil;
procedure av_murmur3_init_seeded(c: PAVMurMur3; seed: Tuint64_t); cdecl; external libavutil;
procedure av_murmur3_init(c: PAVMurMur3); cdecl; external libavutil;
procedure av_murmur3_update(c: PAVMurMur3; src: Puint8_t; len: Tsize_t); cdecl; external libavutil;
procedure av_murmur3_final(c: PAVMurMur3; dst: Puint8_t); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:31:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
