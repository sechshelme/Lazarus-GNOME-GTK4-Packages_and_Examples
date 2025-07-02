unit libssh_version;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  LIBSSH_VERSION_MAJOR = 0;
  LIBSSH_VERSION_MINOR = 10;
  LIBSSH_VERSION_MICRO = 6;

  // === Konventiert am: 2-7-25 17:32:26 ===


implementation


end.
