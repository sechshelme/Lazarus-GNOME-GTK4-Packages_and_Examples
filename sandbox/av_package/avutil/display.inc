{$IFDEF read_interface}


function av_display_rotation_get(matrix: Pint32_t): double; cdecl; external libavutil;
procedure av_display_rotation_set(matrix: Pint32_t; angle: double); cdecl; external libavutil;
procedure av_display_matrix_flip(matrix: Pint32_t; hflip: longint; vflip: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
