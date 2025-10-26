unit global;

interface

uses
  fp_glib2, fp_libgtop2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function strerror(errno: longint): pchar; cdecl; external libc;

// === Konventiert am: 26-10-25 12:05:26 ===


implementation



end.
