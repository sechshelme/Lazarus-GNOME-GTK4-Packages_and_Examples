

{$IFDEF read_function}
function gst_video_event_new_still_frame(in_still: Tgboolean): PGstEvent; cdecl; external libgstvideo;
function gst_video_event_parse_still_frame(event: PGstEvent; in_still: Pgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_video_event_new_downstream_force_key_unit(timestamp: TGstClockTime; stream_time: TGstClockTime; running_time: TGstClockTime; all_headers: Tgboolean; count: Tguint): PGstEvent; cdecl; external libgstvideo;
function gst_video_event_parse_downstream_force_key_unit(event: PGstEvent; timestamp: PGstClockTime; stream_time: PGstClockTime; running_time: PGstClockTime; all_headers: Pgboolean;
  count: Pguint): Tgboolean; cdecl; external libgstvideo;
function gst_video_event_new_upstream_force_key_unit(running_time: TGstClockTime; all_headers: Tgboolean; count: Tguint): PGstEvent; cdecl; external libgstvideo;
function gst_video_event_parse_upstream_force_key_unit(event: PGstEvent; running_time: PGstClockTime; all_headers: Pgboolean; count: Pguint): Tgboolean; cdecl; external libgstvideo;
function gst_video_event_is_force_key_unit(event: PGstEvent): Tgboolean; cdecl; external libgstvideo;
{$ENDIF read_function}

// === Konventiert am: 15-7-26 13:36:02 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
