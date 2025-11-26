{$IFDEF read_interface}



function xb_silo_export(self: PXbSilo; flags: TXbNodeExportFlags; error: PPGError): Pgchar; cdecl; external libxmlb;
function xb_silo_export_file(self: PXbSilo; file_: PGFile; flags: TXbNodeExportFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
