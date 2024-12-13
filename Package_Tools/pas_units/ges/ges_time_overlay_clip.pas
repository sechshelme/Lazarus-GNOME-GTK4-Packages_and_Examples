unit ges_time_overlay_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_source_clip;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function ges_source_clip_new_time_overlay: PGESSourceClip; cdecl; external libges;

// === Konventiert am: 13-12-24 17:01:53 ===


implementation



end.
