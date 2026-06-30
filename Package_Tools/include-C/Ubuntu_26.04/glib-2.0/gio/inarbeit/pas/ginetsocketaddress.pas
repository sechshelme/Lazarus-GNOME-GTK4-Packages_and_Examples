unit ginetsocketaddress;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, gsocketaddress, ginetaddress;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGInetSocketAddressPrivate = type Pointer;

  PGInetSocketAddress = ^TGInetSocketAddress;
  TGInetSocketAddress = record
    parent_instance: TGSocketAddress;
    priv: PGInetSocketAddressPrivate;
  end;

  PGInetSocketAddressClass = ^TGInetSocketAddressClass;
  TGInetSocketAddressClass = record
    parent_class: TGSocketAddressClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_inet_socket_address_get_type: TGType; cdecl; external libgio2;
function g_inet_socket_address_new(address: PGInetAddress; port: Tguint16): PGSocketAddress; cdecl; external libgio2;
function g_inet_socket_address_new_from_string(address: pchar; port: Tguint): PGSocketAddress; cdecl; external libgio2;
function g_inet_socket_address_get_address(address: PGInetSocketAddress): PGInetAddress; cdecl; external libgio2;
function g_inet_socket_address_get_port(address: PGInetSocketAddress): Tguint16; cdecl; external libgio2;
function g_inet_socket_address_get_flowinfo(address: PGInetSocketAddress): Tguint32; cdecl; external libgio2;
function g_inet_socket_address_get_scope_id(address: PGInetSocketAddress): Tguint32; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:26:02 ===

function G_TYPE_INET_SOCKET_ADDRESS: TGType;
function G_INET_SOCKET_ADDRESS(obj: Pointer): PGInetSocketAddress;
function G_INET_SOCKET_ADDRESS_CLASS(klass: Pointer): PGInetSocketAddressClass;
function G_IS_INET_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
function G_IS_INET_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function G_INET_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGInetSocketAddressClass;
{$ENDIF read_function}

implementation

function G_TYPE_INET_SOCKET_ADDRESS: TGType;
begin
  G_TYPE_INET_SOCKET_ADDRESS := g_inet_socket_address_get_type;
end;

function G_INET_SOCKET_ADDRESS(obj: Pointer): PGInetSocketAddress;
begin
  Result := PGInetSocketAddress(g_type_check_instance_cast(obj, G_TYPE_INET_SOCKET_ADDRESS));
end;

function G_INET_SOCKET_ADDRESS_CLASS(klass: Pointer): PGInetSocketAddressClass;
begin
  Result := PGInetSocketAddressClass(g_type_check_class_cast(klass, G_TYPE_INET_SOCKET_ADDRESS));
end;

function G_IS_INET_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_INET_SOCKET_ADDRESS);
end;

function G_IS_INET_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_INET_SOCKET_ADDRESS);
end;

function G_INET_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGInetSocketAddressClass;
begin
  Result := PGInetSocketAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
