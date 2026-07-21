

{$IFDEF read_function}
function gst_rtsp_params_set(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPResult; cdecl; external libgstrtspserver;
function gst_rtsp_params_get(client: PGstRTSPClient; ctx: PGstRTSPContext): TGstRTSPResult; cdecl; external libgstrtspserver;
{$ENDIF read_function}

// === Konventiert am: 20-7-26 13:44:38 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
