unit ges_screenshot;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function ges_play_sink_convert_frame(playsink: PGstElement; caps: PGstCaps): PGstSample; cdecl; external libges; deprecated;
{$ENDIF read_function}

// === Konventiert am: 28-7-26 13:05:45 ===


implementation



end.
