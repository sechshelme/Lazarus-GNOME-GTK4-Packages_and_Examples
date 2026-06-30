unit gtcpwrapperconnection;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes, gtcpconnection, giostream, gsocketconnection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGTcpWrapperConnectionPrivate = type Pointer;

  PGTcpWrapperConnection = ^TGTcpWrapperConnection;
  TGTcpWrapperConnection = record
    parent_instance: TGTcpConnection;
    priv: PGTcpWrapperConnectionPrivate;
  end;

  PGTcpWrapperConnectionClass = ^TGTcpWrapperConnectionClass;
  TGTcpWrapperConnectionClass = record
    parent_class: TGTcpConnectionClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_tcp_wrapper_connection_get_type: TGType; cdecl; external libgio2;
function g_tcp_wrapper_connection_new(base_io_stream: PGIOStream; socket: PGSocket): PGSocketConnection; cdecl; external libgio2;
function g_tcp_wrapper_connection_get_base_io_stream(conn: PGTcpWrapperConnection): PGIOStream; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:59:38 ===

function G_TYPE_TCP_WRAPPER_CONNECTION: TGType;
function G_TCP_WRAPPER_CONNECTION(obj: Pointer): PGTcpWrapperConnection;
function G_TCP_WRAPPER_CONNECTION_CLASS(klass: Pointer): PGTcpWrapperConnectionClass;
function G_IS_TCP_WRAPPER_CONNECTION(obj: Pointer): Tgboolean;
function G_IS_TCP_WRAPPER_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function G_TCP_WRAPPER_CONNECTION_GET_CLASS(obj: Pointer): PGTcpWrapperConnectionClass;
{$ENDIF read_function}

implementation

function G_TYPE_TCP_WRAPPER_CONNECTION: TGType;
begin
  G_TYPE_TCP_WRAPPER_CONNECTION := g_tcp_wrapper_connection_get_type;
end;

function G_TCP_WRAPPER_CONNECTION(obj: Pointer): PGTcpWrapperConnection;
begin
  Result := PGTcpWrapperConnection(g_type_check_instance_cast(obj, G_TYPE_TCP_WRAPPER_CONNECTION));
end;

function G_TCP_WRAPPER_CONNECTION_CLASS(klass: Pointer): PGTcpWrapperConnectionClass;
begin
  Result := PGTcpWrapperConnectionClass(g_type_check_class_cast(klass, G_TYPE_TCP_WRAPPER_CONNECTION));
end;

function G_IS_TCP_WRAPPER_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_TCP_WRAPPER_CONNECTION);
end;

function G_IS_TCP_WRAPPER_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_TCP_WRAPPER_CONNECTION);
end;

function G_TCP_WRAPPER_CONNECTION_GET_CLASS(obj: Pointer): PGTcpWrapperConnectionClass;
begin
  Result := PGTcpWrapperConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
