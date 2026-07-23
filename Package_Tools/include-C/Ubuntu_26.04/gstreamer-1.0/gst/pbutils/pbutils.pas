unit pbutils;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure gst_pb_utils_init; cdecl; external libgstpbutils;

// === Konventiert am: 23-7-26 19:45:24 ===


implementation



end.
