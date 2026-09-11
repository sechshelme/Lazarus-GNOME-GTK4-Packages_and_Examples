unit apr_support;

interface

uses
  fp_apr, apr_network_io, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function apr_wait_for_io_or_timeout(f: Papr_file_t; s: Papr_socket_t; for_read: longint): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:58:48 ===


implementation



end.
