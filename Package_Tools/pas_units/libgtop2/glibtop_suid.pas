unit glibtop_suid;

interface

uses
  fp_glib2, fp_libgtop2, glibtop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure glibtop_init_p(server: Pglibtop; features: dword; flags: dword); cdecl; external libgtop2;
procedure glibtop_open_p(server: Pglibtop; program_name: pchar; features: dword; flags: dword); cdecl; external libgtop2;

// === Konventiert am: 23-10-25 19:36:01 ===


implementation



end.
