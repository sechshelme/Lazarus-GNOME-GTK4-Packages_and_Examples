unit gdtlsclientconnection;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGDtlsClientConnectionInterface = ^TGDtlsClientConnectionInterface;
  TGDtlsClientConnectionInterface = record
    g_iface: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_dtls_client_connection_get_type: TGType; cdecl; external libgio2;
function g_dtls_client_connection_new(base_socket: PGDatagramBased; server_identity: PGSocketConnectable; error: PPGError): PGDatagramBased; cdecl; external libgio2;
function g_dtls_client_connection_get_validation_flags(conn: PGDtlsClientConnection): TGTlsCertificateFlags; cdecl; external libgio2;
procedure g_dtls_client_connection_set_validation_flags(conn: PGDtlsClientConnection; flags: TGTlsCertificateFlags); cdecl; external libgio2;
function g_dtls_client_connection_get_server_identity(conn: PGDtlsClientConnection): PGSocketConnectable; cdecl; external libgio2;
procedure g_dtls_client_connection_set_server_identity(conn: PGDtlsClientConnection; identity: PGSocketConnectable); cdecl; external libgio2;
function g_dtls_client_connection_get_accepted_cas(conn: PGDtlsClientConnection): PGList; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:17:34 ===

function G_TYPE_DTLS_CLIENT_CONNECTION: TGType;
function G_DTLS_CLIENT_CONNECTION(obj: Pointer): PGDtlsClientConnection;
function G_IS_DTLS_CLIENT_CONNECTION(obj: Pointer): Tgboolean;
function G_DTLS_CLIENT_CONNECTION_GET_INTERFACE(obj: Pointer): PGDtlsClientConnectionInterface;
{$ENDIF read_function}

implementation

function G_TYPE_DTLS_CLIENT_CONNECTION: TGType;
begin
  G_TYPE_DTLS_CLIENT_CONNECTION := g_dtls_client_connection_get_type;
end;

function G_DTLS_CLIENT_CONNECTION(obj: Pointer): PGDtlsClientConnection;
begin
  Result := PGDtlsClientConnection(g_type_check_instance_cast(obj, G_TYPE_DTLS_CLIENT_CONNECTION));
end;

function G_IS_DTLS_CLIENT_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DTLS_CLIENT_CONNECTION);
end;

function G_DTLS_CLIENT_CONNECTION_GET_INTERFACE(obj: Pointer): PGDtlsClientConnectionInterface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DTLS_CLIENT_CONNECTION);
end;



end.
