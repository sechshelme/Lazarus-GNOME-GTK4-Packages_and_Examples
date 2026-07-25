{$IFDEF read_interface}


procedure gst_buffer_straw_start_pipeline(bin: PGstElement; pad: PGstPad); cdecl; external libgstcheck;
function gst_buffer_straw_get_buffer(bin: PGstElement; pad: PGstPad): PGstBuffer; cdecl; external libgstcheck;
procedure gst_buffer_straw_stop_pipeline(bin: PGstElement; pad: PGstPad); cdecl; external libgstcheck;

// === Konventiert am: 25-7-26 19:25:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
