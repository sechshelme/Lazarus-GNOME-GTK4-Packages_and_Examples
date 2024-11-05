/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_video_event_new_still_frame(in_still: Tgboolean): PGstEvent; cdecl; external libgstvideo;
function gst_video_event_parse_still_frame(event: PGstEvent; in_still: Pgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_video_event_new_downstream_force_key_unit(timestamp: TGstClockTime; stream_time: TGstClockTime; running_time: TGstClockTime; all_headers: Tgboolean; Count: Tguint): PGstEvent; cdecl; external libgstvideo;
function gst_video_event_parse_downstream_force_key_unit(event: PGstEvent; timestamp: PGstClockTime; stream_time: PGstClockTime; running_time: PGstClockTime; all_headers: Pgboolean;
  Count: Pguint): Tgboolean; cdecl; external libgstvideo;
function gst_video_event_new_upstream_force_key_unit(running_time: TGstClockTime; all_headers: Tgboolean; Count: Tguint): PGstEvent; cdecl; external libgstvideo;
function gst_video_event_parse_upstream_force_key_unit(event: PGstEvent; running_time: PGstClockTime; all_headers: Pgboolean; Count: Pguint): Tgboolean; cdecl; external libgstvideo;
function gst_video_event_is_force_key_unit(event: PGstEvent): Tgboolean; cdecl; external libgstvideo;

// === Konventiert am: 1-10-24 15:03:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
