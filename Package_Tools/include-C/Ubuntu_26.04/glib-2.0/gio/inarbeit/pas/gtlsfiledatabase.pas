unit gtlsfiledatabase;

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGTlsFileDatabaseInterface = ^TGTlsFileDatabaseInterface;
  TGTlsFileDatabaseInterface = record
    g_iface: TGTypeInterface;
    padding: array[0..7] of Tgpointer;
  end;

function g_tls_file_database_get_type: TGType; cdecl; external libgio2;
function g_tls_file_database_new(anchors: Pgchar; error: PPGError): PGTlsDatabase; cdecl; external libgio2;

// === Konventiert am: 26-6-26 20:03:58 ===

function G_TYPE_TLS_FILE_DATABASE: TGType;
function G_TLS_FILE_DATABASE(obj: Pointer): PGTlsFileDatabase;
function G_IS_TLS_FILE_DATABASE(obj: Pointer): Tgboolean;
function G_TLS_FILE_DATABASE_GET_INTERFACE(obj: Pointer): PGTlsFileDatabaseInterface;

implementation

function G_TYPE_TLS_FILE_DATABASE: TGType;
begin
  G_TYPE_TLS_FILE_DATABASE := g_tls_file_database_get_type;
end;

function G_TLS_FILE_DATABASE(obj: Pointer): PGTlsFileDatabase;
begin
  Result := PGTlsFileDatabase(g_type_check_instance_cast(obj, G_TYPE_TLS_FILE_DATABASE));
end;

function G_IS_TLS_FILE_DATABASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_FILE_DATABASE);
end;

function G_TLS_FILE_DATABASE_GET_INTERFACE(obj: Pointer): PGTlsFileDatabaseInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_TLS_FILE_DATABASE);
end;



end.
