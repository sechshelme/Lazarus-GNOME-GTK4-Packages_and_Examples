unit ges_utils;

interface

uses
  fp_glib2, ges_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function ges_timeline_new_audio_video: PGESTimeline; cdecl; external libges;
function ges_pspec_equal(key_spec_1: Tgconstpointer; key_spec_2: Tgconstpointer): Tgboolean; cdecl; external libges;
function ges_pspec_hash(key_spec: Tgconstpointer): Tguint; cdecl; external libges;

// === Konventiert am: 12-12-24 15:18:20 ===


implementation



end.
