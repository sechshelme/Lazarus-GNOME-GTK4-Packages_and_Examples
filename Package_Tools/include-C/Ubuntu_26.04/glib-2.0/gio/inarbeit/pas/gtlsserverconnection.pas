unit gtlsserverconnection;

interface

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

uses
  fp_glib2, giotypes, giostream, gtlscertificate;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGTlsServerConnectionInterface = ^TGTlsServerConnectionInterface;
  TGTlsServerConnectionInterface = record
    g_iface: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_tls_server_connection_get_type: TGType; cdecl; external libgio2;
function g_tls_server_connection_new(base_io_stream: PGIOStream; certificate: PGTlsCertificate; error: PPGError): PGIOStream; cdecl; external libgio2;

// === Konventiert am: 26-6-26 20:03:38 ===

function G_TYPE_TLS_SERVER_CONNECTION: TGType;
function G_TLS_SERVER_CONNECTION(obj: Pointer): PGTlsServerConnection;
function G_IS_TLS_SERVER_CONNECTION(obj: Pointer): Tgboolean;
function G_TLS_SERVER_CONNECTION_GET_INTERFACE(obj: Pointer): PGTlsServerConnectionInterface;
{$ENDIF read_implementation}

implementation

function G_TYPE_TLS_SERVER_CONNECTION: TGType;
begin
  G_TYPE_TLS_SERVER_CONNECTION := g_tls_server_connection_get_type;
end;

function G_TLS_SERVER_CONNECTION(obj: Pointer): PGTlsServerConnection;
begin
  Result := PGTlsServerConnection(g_type_check_instance_cast(obj, G_TYPE_TLS_SERVER_CONNECTION));
end;

function G_IS_TLS_SERVER_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_SERVER_CONNECTION);
end;

function G_TLS_SERVER_CONNECTION_GET_INTERFACE(obj: Pointer): PGTlsServerConnectionInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_TLS_SERVER_CONNECTION);
end;



end.
