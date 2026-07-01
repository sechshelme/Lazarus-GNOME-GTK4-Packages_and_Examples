

  {$IFDEF read_struct}
type
  PGTlsClientConnectionInterface = ^TGTlsClientConnectionInterface;
  TGTlsClientConnectionInterface = record
    g_iface: TGTypeInterface;
    copy_session_state: procedure(conn: PGTlsClientConnection; source: PGTlsClientConnection); cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_tls_client_connection_get_type: TGType; cdecl; external libgio2;
function g_tls_client_connection_new(base_io_stream: PGIOStream; server_identity: PGSocketConnectable; error: PPGError): PGIOStream; cdecl; external libgio2;
function g_tls_client_connection_get_validation_flags(conn: PGTlsClientConnection): TGTlsCertificateFlags; cdecl; external libgio2; deprecated;
procedure g_tls_client_connection_set_validation_flags(conn: PGTlsClientConnection; flags: TGTlsCertificateFlags); cdecl; external libgio2; deprecated;
function g_tls_client_connection_get_server_identity(conn: PGTlsClientConnection): PGSocketConnectable; cdecl; external libgio2;
procedure g_tls_client_connection_set_server_identity(conn: PGTlsClientConnection; identity: PGSocketConnectable); cdecl; external libgio2;
function g_tls_client_connection_get_use_ssl3(conn: PGTlsClientConnection): Tgboolean; cdecl; external libgio2; deprecated;
procedure g_tls_client_connection_set_use_ssl3(conn: PGTlsClientConnection; use_ssl3: Tgboolean); cdecl; external libgio2; deprecated;
function g_tls_client_connection_get_accepted_cas(conn: PGTlsClientConnection): PGList; cdecl; external libgio2;
procedure g_tls_client_connection_copy_session_state(conn: PGTlsClientConnection; source: PGTlsClientConnection); cdecl; external libgio2;

// === Konventiert am: 26-6-26 20:04:23 ===

function G_TYPE_TLS_CLIENT_CONNECTION: TGType;
function G_TLS_CLIENT_CONNECTION(obj: Pointer): PGTlsClientConnection;
function G_IS_TLS_CLIENT_CONNECTION(obj: Pointer): Tgboolean;
function G_TLS_CLIENT_CONNECTION_GET_INTERFACE(obj: Pointer): PGTlsClientConnectionInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_TLS_CLIENT_CONNECTION: TGType;
begin
  G_TYPE_TLS_CLIENT_CONNECTION := g_tls_client_connection_get_type;
end;

function G_TLS_CLIENT_CONNECTION(obj: Pointer): PGTlsClientConnection;
begin
  Result := PGTlsClientConnection(g_type_check_instance_cast(obj, G_TYPE_TLS_CLIENT_CONNECTION));
end;

function G_IS_TLS_CLIENT_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TLS_CLIENT_CONNECTION);
end;

function G_TLS_CLIENT_CONNECTION_GET_INTERFACE(obj: Pointer): PGTlsClientConnectionInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_TLS_CLIENT_CONNECTION);
end;



{$ENDIF read_implementation}
