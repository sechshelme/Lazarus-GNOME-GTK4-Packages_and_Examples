unit unistd_ext;

interface

uses
  unistd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gettid: Tpid_t; cdecl; external libc;

const
  CLOSE_RANGE_UNSHARE = 1 shl 1;
  CLOSE_RANGE_CLOEXEC = 1 shl 2;

  // === Konventiert am: 1-7-25 17:33:53 ===


implementation



end.
