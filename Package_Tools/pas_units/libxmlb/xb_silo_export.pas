unit xb_silo_export;

interface

uses
  fp_glib2, fp_xmlb, xb_silo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function xb_silo_export(self: PXbSilo; flags: TXbNodeExportFlags; error: PPGError): Pgchar; cdecl; external libxmlb;
function xb_silo_export_file(self: PXbSilo; file_: PGFile; flags: TXbNodeExportFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:43 ===


implementation



end.
