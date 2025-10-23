
{$IFDEF read_interface}

type
  PGstDebugGraphDetails = ^TGstDebugGraphDetails;
  TGstDebugGraphDetails = longint;

const
  GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE = 1 shl 0;
  GST_DEBUG_GRAPH_SHOW_CAPS_DETAILS = 1 shl 1;
  GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS = 1 shl 2;
  GST_DEBUG_GRAPH_SHOW_STATES = 1 shl 3;
  GST_DEBUG_GRAPH_SHOW_FULL_PARAMS = 1 shl 4;
  GST_DEBUG_GRAPH_SHOW_ALL = (1 shl 4) - 1;
  GST_DEBUG_GRAPH_SHOW_VERBOSE = Tgint($ffffffff);

function gst_debug_bin_to_dot_data(bin: PGstBin; details: TGstDebugGraphDetails): Pgchar; cdecl; external libgstreamer;
procedure gst_debug_bin_to_dot_file(bin: PGstBin; details: TGstDebugGraphDetails; file_name: Pgchar); cdecl; external libgstreamer;
procedure gst_debug_bin_to_dot_file_with_ts(bin: PGstBin; details: TGstDebugGraphDetails; file_name: Pgchar); cdecl; external libgstreamer;

// === Konventiert am: 16-9-24 19:34:10 ===

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
