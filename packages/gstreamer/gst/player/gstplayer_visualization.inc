
{$IFDEF read_interface}

type
  TGstPlayerVisualization = record
    Name: Pgchar;
    description: Pgchar;
  end;
  PGstPlayerVisualization = ^TGstPlayerVisualization;
  PPGstPlayerVisualization = ^PGstPlayerVisualization;

function gst_player_visualization_get_type: TGType; cdecl; external libgstplayer;
function gst_player_visualization_copy(vis: PGstPlayerVisualization): PGstPlayerVisualization; cdecl; external libgstplayer;
procedure gst_player_visualization_free(vis: PGstPlayerVisualization); cdecl; external libgstplayer;
function gst_player_visualizations_get: PPGstPlayerVisualization; cdecl; external libgstplayer;
procedure gst_player_visualizations_free(viss: PPGstPlayerVisualization); cdecl; external libgstplayer;

// === Konventiert am: 8-10-24 18:51:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
