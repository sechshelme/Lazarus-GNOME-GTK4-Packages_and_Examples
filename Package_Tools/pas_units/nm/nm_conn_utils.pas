unit nm_conn_utils;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function nm_conn_wireguard_import(filename: pchar; error: PPGError): PNMConnection; cdecl; external libnm;
{$ENDIF read_function}

// === Konventiert am: 19-4-26 19:32:37 ===


implementation



end.
