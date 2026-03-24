{$IFDEF read_interface}


procedure slog_func(tag: pchar; log_level: Tuint32_t; log_item: Tuint32_t; message: pchar; line_nr: Tuint32_t; filename: pchar; user_data: pointer); cdecl; external libsokol;

// === Konventiert am: 22-3-26 16:22:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
