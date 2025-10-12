
{$IFDEF read_interface}


procedure gtk_render_check(context: PGtkStyleContext; cr: Pcairo_t; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_render_option(context: PGtkStyleContext; cr: Pcairo_t; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_render_arrow(context: PGtkStyleContext; cr: Pcairo_t; angle: double; x: double; y: double;
  size: double); cdecl; external libgtk4;
procedure gtk_render_background(context: PGtkStyleContext; cr: Pcairo_t; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_render_frame(context: PGtkStyleContext; cr: Pcairo_t; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_render_expander(context: PGtkStyleContext; cr: Pcairo_t; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_render_focus(context: PGtkStyleContext; cr: Pcairo_t; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_render_layout(context: PGtkStyleContext; cr: Pcairo_t; x: double; y: double; layout: PPangoLayout); cdecl; external libgtk4;
procedure gtk_render_line(context: PGtkStyleContext; cr: Pcairo_t; x0: double; y0: double; x1: double;
  y1: double); cdecl; external libgtk4;
procedure gtk_render_handle(context: PGtkStyleContext; cr: Pcairo_t; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_render_activity(context: PGtkStyleContext; cr: Pcairo_t; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_render_icon(context: PGtkStyleContext; cr: Pcairo_t; texture: PGdkTexture; x: double; y: double); cdecl; external libgtk4;
procedure gtk_snapshot_render_background(snapshot: PGtkSnapshot; context: PGtkStyleContext; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_snapshot_render_frame(snapshot: PGtkSnapshot; context: PGtkStyleContext; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_snapshot_render_focus(snapshot: PGtkSnapshot; context: PGtkStyleContext; x: double; y: double; Width: double;
  Height: double); cdecl; external libgtk4;
procedure gtk_snapshot_render_layout(snapshot: PGtkSnapshot; context: PGtkStyleContext; x: double; y: double; layout: PPangoLayout); cdecl; external libgtk4;
procedure gtk_snapshot_render_insertion_cursor(snapshot: PGtkSnapshot; context: PGtkStyleContext; x: double; y: double; layout: PPangoLayout;
  index: longint; direction: TPangoDirection); cdecl; external libgtk4;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
