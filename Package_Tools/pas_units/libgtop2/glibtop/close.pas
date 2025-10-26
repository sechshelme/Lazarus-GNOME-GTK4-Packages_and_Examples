unit close;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure glibtop_close; cdecl; external libgtop2;
procedure glibtop_close_r(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_close_s(server: Pglibtop); cdecl; external libgtop2;
procedure glibtop_close_p(server: Pglibtop); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:05:43 ===


implementation



end.
