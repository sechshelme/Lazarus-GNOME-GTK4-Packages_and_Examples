unit gstdebugutils;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstbin;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
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
  {$IFDEF read_struct}

{$ENDIF read_function}
function gst_debug_bin_to_dot_data(bin: PGstBin; details: TGstDebugGraphDetails): Pgchar; cdecl; external libgstreamer;
procedure gst_debug_bin_to_dot_file(bin: PGstBin; details: TGstDebugGraphDetails; file_name: Pgchar); cdecl; external libgstreamer;
procedure gst_debug_bin_to_dot_file_with_ts(bin: PGstBin; details: TGstDebugGraphDetails; file_name: Pgchar); cdecl; external libgstreamer;
{$ENDIF read_function}

// === Konventiert am: 11-7-26 11:00:32 ===


implementation



end.
