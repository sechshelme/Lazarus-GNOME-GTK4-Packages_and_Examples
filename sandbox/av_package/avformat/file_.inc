{$IFDEF read_interface}



function av_file_map(filename: pchar; bufptr: PPuint8_t; size: Psize_t; log_offset: longint; log_ctx: pointer): longint; cdecl; external libavutil;
procedure av_file_unmap(bufptr: Puint8_t; size: Tsize_t); cdecl; external libavutil;
function av_tempfile(prefix: pchar; filename: PPchar; log_offset: longint; log_ctx: pointer): longint; cdecl; external libavutil; deprecated;

// === Konventiert am: 14-12-25 17:15:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
