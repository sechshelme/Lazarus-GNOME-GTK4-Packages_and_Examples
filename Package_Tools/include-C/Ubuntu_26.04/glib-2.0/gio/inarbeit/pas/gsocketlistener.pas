unit gsocketlistener;

interface

uses
  fp_glib2, gioenums, giotypes, gsocket, gsocketaddress, gsocketconnection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGSocketListenerPrivate = type Pointer;

  PGSocketListener = ^TGSocketListener;
  TGSocketListener = record
    parent_instance: TGObject;
    priv: PGSocketListenerPrivate;
  end;

  PGSocketListenerClass = ^TGSocketListenerClass;
  TGSocketListenerClass = record
    parent_class: TGObjectClass;
    changed: procedure(listener: PGSocketListener); cdecl;
    event: procedure(listener: PGSocketListener; event: TGSocketListenerEvent; socket: PGSocket); cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
    _g_reserved6: procedure; cdecl;
  end;

function g_socket_listener_get_type: TGType; cdecl; external libgio2;
function g_socket_listener_new: PGSocketListener; cdecl; external libgio2;
procedure g_socket_listener_set_backlog(listener: PGSocketListener; listen_backlog: longint); cdecl; external libgio2;
function g_socket_listener_add_socket(listener: PGSocketListener; socket: PGSocket; source_object: PGObject; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_listener_add_address(listener: PGSocketListener; address: PGSocketAddress; _type: TGSocketType; protocol: TGSocketProtocol; source_object: PGObject;
  effective_address: PPGSocketAddress; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_listener_add_inet_port(listener: PGSocketListener; port: Tguint16; source_object: PGObject; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_socket_listener_add_any_inet_port(listener: PGSocketListener; source_object: PGObject; error: PPGError): Tguint16; cdecl; external libgio2;
function g_socket_listener_accept_socket(listener: PGSocketListener; source_object: PPGObject; cancellable: PGCancellable; error: PPGError): PGSocket; cdecl; external libgio2;
procedure g_socket_listener_accept_socket_async(listener: PGSocketListener; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_socket_listener_accept_socket_finish(listener: PGSocketListener; result: PGAsyncResult; source_object: PPGObject; error: PPGError): PGSocket; cdecl; external libgio2;
function g_socket_listener_accept(listener: PGSocketListener; source_object: PPGObject; cancellable: PGCancellable; error: PPGError): PGSocketConnection; cdecl; external libgio2;
procedure g_socket_listener_accept_async(listener: PGSocketListener; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_socket_listener_accept_finish(listener: PGSocketListener; result: PGAsyncResult; source_object: PPGObject; error: PPGError): PGSocketConnection; cdecl; external libgio2;
procedure g_socket_listener_close(listener: PGSocketListener); cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:55:17 ===

function G_TYPE_SOCKET_LISTENER: TGType;
function G_SOCKET_LISTENER(obj: Pointer): PGSocketListener;
function G_SOCKET_LISTENER_CLASS(klass: Pointer): PGSocketListenerClass;
function G_IS_SOCKET_LISTENER(obj: Pointer): Tgboolean;
function G_IS_SOCKET_LISTENER_CLASS(klass: Pointer): Tgboolean;
function G_SOCKET_LISTENER_GET_CLASS(obj: Pointer): PGSocketListenerClass;

implementation

function G_TYPE_SOCKET_LISTENER: TGType;
begin
  G_TYPE_SOCKET_LISTENER := g_socket_listener_get_type;
end;

function G_SOCKET_LISTENER(obj: Pointer): PGSocketListener;
begin
  Result := PGSocketListener(g_type_check_instance_cast(obj, G_TYPE_SOCKET_LISTENER));
end;

function G_SOCKET_LISTENER_CLASS(klass: Pointer): PGSocketListenerClass;
begin
  Result := PGSocketListenerClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_LISTENER));
end;

function G_IS_SOCKET_LISTENER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SOCKET_LISTENER);
end;

function G_IS_SOCKET_LISTENER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SOCKET_LISTENER);
end;

function G_SOCKET_LISTENER_GET_CLASS(obj: Pointer): PGSocketListenerClass;
begin
  Result := PGSocketListenerClass(PGTypeInstance(obj)^.g_class);
end;



end.
