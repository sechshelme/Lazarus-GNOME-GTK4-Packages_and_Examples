unit gtksourceinit;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure gtk_source_init; cdecl; external libgtksourceview5;
procedure gtk_source_finalize; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:37:35 ===


implementation



end.
