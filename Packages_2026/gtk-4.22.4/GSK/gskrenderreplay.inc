{$IFDEF read_interface}


type
  TGskRenderReplayNodeFilter = function(replay: PGskRenderReplay; node: PGskRenderNode; user_data: Tgpointer): PGskRenderNode; cdecl;
  TGskRenderReplayTextureFilter = function(replay: PGskRenderReplay; texture: PGdkTexture; user_data: Tgpointer): PGdkTexture; cdecl;
  TGskRenderReplayFontFilter = function(replay: PGskRenderReplay; font: PPangoFont; user_data: Tgpointer): PPangoFont; cdecl;

function gsk_render_replay_get_type: TGType; cdecl; external libgtk4;
function gsk_render_replay_new: PGskRenderReplay; cdecl; external libgtk4;
procedure gsk_render_replay_free(self: PGskRenderReplay); cdecl; external libgtk4;
procedure gsk_render_replay_set_node_filter(self: PGskRenderReplay; filter: TGskRenderReplayNodeFilter; user_data: Tgpointer; user_destroy: TGDestroyNotify); cdecl; external libgtk4;
function gsk_render_replay_filter_node(self: PGskRenderReplay; node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_render_replay_default(self: PGskRenderReplay; node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
procedure gsk_render_replay_set_texture_filter(self: PGskRenderReplay; filter: TGskRenderReplayTextureFilter; user_data: Tgpointer; user_destroy: TGDestroyNotify); cdecl; external libgtk4;
function gsk_render_replay_filter_texture(self: PGskRenderReplay; texture: PGdkTexture): PGdkTexture; cdecl; external libgtk4;
procedure gsk_render_replay_set_font_filter(self: PGskRenderReplay; filter: TGskRenderReplayFontFilter; user_data: Tgpointer; user_destroy: TGDestroyNotify); cdecl; external libgtk4;
function gsk_render_replay_filter_font(self: PGskRenderReplay; font: PPangoFont): PPangoFont; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:36:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
