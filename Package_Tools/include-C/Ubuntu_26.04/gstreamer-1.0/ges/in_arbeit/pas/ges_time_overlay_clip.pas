unit ges_time_overlay_clip;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function ges_source_clip_new_time_overlay: PGESSourceClip; cdecl; external libges;
{$ENDIF read_function}

// === Konventiert am: 28-7-26 13:13:29 ===


implementation



end.
