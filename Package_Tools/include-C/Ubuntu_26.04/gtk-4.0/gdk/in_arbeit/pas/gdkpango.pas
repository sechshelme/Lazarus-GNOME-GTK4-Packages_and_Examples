unit gdkpango;

interface

uses
  fp_glib2, fp_cairo, fp_pango, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gdk_pango_layout_line_get_clip_region(line: PPangoLayoutLine; x_origin: longint; y_origin: longint; index_ranges: Plongint; n_ranges: longint): Pcairo_region_t; cdecl; external libgtk4;
function gdk_pango_layout_get_clip_region(layout: PPangoLayout; x_origin: longint; y_origin: longint; index_ranges: Plongint; n_ranges: longint): Pcairo_region_t; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:23:34 ===


implementation



end.
