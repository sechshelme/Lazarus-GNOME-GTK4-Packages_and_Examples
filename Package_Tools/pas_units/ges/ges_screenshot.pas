unit ges_screenshot;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function ges_play_sink_convert_frame(playsink: PGstElement; caps: PGstCaps): PGstSample; cdecl; external libges;

// === Konventiert am: 13-12-24 17:01:46 ===


implementation



end.
