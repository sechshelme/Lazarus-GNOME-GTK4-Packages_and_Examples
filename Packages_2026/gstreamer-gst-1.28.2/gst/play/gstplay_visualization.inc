{$IFDEF read_interface}


type
  PPGstPlayVisualization = ^PGstPlayVisualization;
  PGstPlayVisualization = ^TGstPlayVisualization;
  TGstPlayVisualization = record
    name: Pgchar;
    description: Pgchar;
  end;

function gst_play_visualization_get_type: TGType; cdecl; external libgstplay;
function gst_play_visualization_copy(vis: PGstPlayVisualization): PGstPlayVisualization; cdecl; external libgstplay;
procedure gst_play_visualization_free(vis: PGstPlayVisualization); cdecl; external libgstplay;
function gst_play_visualizations_get: PPGstPlayVisualization; cdecl; external libgstplay;
procedure gst_play_visualizations_free(viss: PPGstPlayVisualization); cdecl; external libgstplay;

// === Konventiert am: 26-7-26 13:33:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
