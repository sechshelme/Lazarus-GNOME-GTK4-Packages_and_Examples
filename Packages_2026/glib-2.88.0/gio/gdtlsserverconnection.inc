

  {$IFDEF read_struct}
type
  PGDtlsServerConnectionInterface = ^TGDtlsServerConnectionInterface;
  TGDtlsServerConnectionInterface = record
    g_iface: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_dtls_server_connection_get_type: TGType; cdecl; external libgio2;
function g_dtls_server_connection_new(base_socket: PGDatagramBased; certificate: PGTlsCertificate; error: PPGError): PGDatagramBased; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:17:21 ===

function G_TYPE_DTLS_SERVER_CONNECTION: TGType;
function G_DTLS_SERVER_CONNECTION(obj: Pointer): PGDtlsServerConnection;
function G_IS_DTLS_SERVER_CONNECTION(obj: Pointer): Tgboolean;
function G_DTLS_SERVER_CONNECTION_GET_INTERFACE(obj: Pointer): PGDtlsServerConnectionInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_DTLS_SERVER_CONNECTION: TGType;
begin
  G_TYPE_DTLS_SERVER_CONNECTION := g_dtls_server_connection_get_type;
end;

function G_DTLS_SERVER_CONNECTION(obj: Pointer): PGDtlsServerConnection;
begin
  Result := PGDtlsServerConnection(g_type_check_instance_cast(obj, G_TYPE_DTLS_SERVER_CONNECTION));
end;

function G_IS_DTLS_SERVER_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DTLS_SERVER_CONNECTION);
end;

function G_DTLS_SERVER_CONNECTION_GET_INTERFACE(obj: Pointer): PGDtlsServerConnectionInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DTLS_SERVER_CONNECTION);
end;



{$ENDIF read_implementation}
