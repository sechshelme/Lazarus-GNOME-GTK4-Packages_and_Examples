unit nm_conn_utils;

interface

uses
  fp_glib2, fp_nm, nm_core_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function nm_conn_wireguard_import(filename: pchar; error: PPGError): PNMConnection; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:06:37 ===


implementation



end.
