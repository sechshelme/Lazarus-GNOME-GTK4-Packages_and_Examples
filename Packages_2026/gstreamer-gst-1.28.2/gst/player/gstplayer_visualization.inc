{$IFDEF read_interface}


type
  PPGstPlayerVisualization = ^PGstPlayerVisualization;
  PGstPlayerVisualization = ^TGstPlayerVisualization;
  TGstPlayerVisualization = record
    name: Pgchar;
    description: Pgchar;
  end;

function gst_player_visualization_get_type: TGType; cdecl; external libgstplayer;
function gst_player_visualization_copy(vis: PGstPlayerVisualization): PGstPlayerVisualization; cdecl; external libgstplayer;
procedure gst_player_visualization_free(vis: PGstPlayerVisualization); cdecl; external libgstplayer;
function gst_player_visualizations_get: PPGstPlayerVisualization; cdecl; external libgstplayer;
procedure gst_player_visualizations_free(viss: PPGstPlayerVisualization); cdecl; external libgstplayer;

// === Konventiert am: 24-7-26 19:51:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
