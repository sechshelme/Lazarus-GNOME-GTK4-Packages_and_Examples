unit gunixconnection;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, gsocketconnection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGUnixConnectionPrivate = type Pointer;

  PGUnixConnection = ^TGUnixConnection;
  TGUnixConnection = record
    parent_instance: TGSocketConnection;
    priv: PGUnixConnectionPrivate;
  end;

  PGUnixConnectionClass = ^TGUnixConnectionClass;
  TGUnixConnectionClass = record
    parent_class: TGSocketConnectionClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_unix_connection_get_type: TGType; cdecl; external libgio2;
function g_unix_connection_send_fd(connection: PGUnixConnection; fd: Tgint; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_unix_connection_receive_fd(connection: PGUnixConnection; cancellable: PGCancellable; error: PPGError): Tgint; cdecl; external libgio2;
function g_unix_connection_send_credentials(connection: PGUnixConnection; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_unix_connection_send_credentials_async(connection: PGUnixConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_unix_connection_send_credentials_finish(connection: PGUnixConnection; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_unix_connection_receive_credentials(connection: PGUnixConnection; cancellable: PGCancellable; error: PPGError): PGCredentials; cdecl; external libgio2;
procedure g_unix_connection_receive_credentials_async(connection: PGUnixConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_unix_connection_receive_credentials_finish(connection: PGUnixConnection; result: PGAsyncResult; error: PPGError): PGCredentials; cdecl; external libgio2;

// === Konventiert am: 26-6-26 20:03:30 ===

function G_TYPE_UNIX_CONNECTION: TGType;
function G_UNIX_CONNECTION(obj: Pointer): PGUnixConnection;
function G_UNIX_CONNECTION_CLASS(klass: Pointer): PGUnixConnectionClass;
function G_IS_UNIX_CONNECTION(obj: Pointer): Tgboolean;
function G_IS_UNIX_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function G_UNIX_CONNECTION_GET_CLASS(obj: Pointer): PGUnixConnectionClass;
{$ENDIF read_function}

implementation

function G_TYPE_UNIX_CONNECTION: TGType;
begin
  G_TYPE_UNIX_CONNECTION := g_unix_connection_get_type;
end;

function G_UNIX_CONNECTION(obj: Pointer): PGUnixConnection;
begin
  Result := PGUnixConnection(g_type_check_instance_cast(obj, G_TYPE_UNIX_CONNECTION));
end;

function G_UNIX_CONNECTION_CLASS(klass: Pointer): PGUnixConnectionClass;
begin
  Result := PGUnixConnectionClass(g_type_check_class_cast(klass, G_TYPE_UNIX_CONNECTION));
end;

function G_IS_UNIX_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_UNIX_CONNECTION);
end;

function G_IS_UNIX_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_UNIX_CONNECTION);
end;

function G_UNIX_CONNECTION_GET_CLASS(obj: Pointer): PGUnixConnectionClass;
begin
  Result := PGUnixConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
