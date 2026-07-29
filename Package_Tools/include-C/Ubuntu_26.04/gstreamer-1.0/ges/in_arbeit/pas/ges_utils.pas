unit ges_utils;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function ges_timeline_new_audio_video: PGESTimeline; cdecl; external libges;
function ges_pspec_equal(key_spec_1: Tgconstpointer; key_spec_2: Tgconstpointer): Tgboolean; cdecl; external libges;
function ges_pspec_hash(key_spec: Tgconstpointer): Tguint; cdecl; external libges;
{$ENDIF read_function}

// === Konventiert am: 28-7-26 13:21:25 ===


implementation



end.
