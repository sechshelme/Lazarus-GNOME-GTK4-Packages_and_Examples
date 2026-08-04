unit spelling_init;

interface

uses
  fp_glib2, fp_spelling;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure spelling_init; cdecl; external libspelling;

// === Konventiert am: 4-8-26 17:16:29 ===


implementation



end.
