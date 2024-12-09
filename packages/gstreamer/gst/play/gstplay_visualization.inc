
{$IFDEF read_interface}

type
  TGstPlayVisualization = record
    Name: Pgchar;
    description: Pgchar;
  end;
  PGstPlayVisualization = ^TGstPlayVisualization;
  PPGstPlayVisualization = ^PGstPlayVisualization;


function gst_play_visualization_get_type: TGType; cdecl; external libgstplay;
function gst_play_visualization_copy(vis: PGstPlayVisualization): PGstPlayVisualization; cdecl; external libgstplay;
procedure gst_play_visualization_free(vis: PGstPlayVisualization); cdecl; external libgstplay;
function gst_play_visualizations_get: PPGstPlayVisualization; cdecl; external libgstplay;
procedure gst_play_visualizations_free(viss: PPGstPlayVisualization); cdecl; external libgstplay;

// === Konventiert am: 11-10-24 19:17:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
