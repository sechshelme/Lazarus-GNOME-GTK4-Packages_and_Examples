unit gnativesocketaddress;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, gsocketaddress;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGNativeSocketAddressPrivate = type Pointer;

  PGNativeSocketAddress = ^TGNativeSocketAddress;
  TGNativeSocketAddress = record
    parent_instance: TGSocketAddress;
    priv: PGNativeSocketAddressPrivate;
  end;

  PGNativeSocketAddressClass = ^TGNativeSocketAddressClass;
  TGNativeSocketAddressClass = record
    parent_class: TGSocketAddressClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_native_socket_address_get_type: TGType; cdecl; external libgio2;
function g_native_socket_address_new(native: Tgpointer; len: Tgsize): PGSocketAddress; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:44:27 ===

function G_TYPE_NATIVE_SOCKET_ADDRESS: TGType;
function G_NATIVE_SOCKET_ADDRESS(obj: Pointer): PGNativeSocketAddress;
function G_NATIVE_SOCKET_ADDRESS_CLASS(klass: Pointer): PGNativeSocketAddressClass;
function G_IS_NATIVE_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
function G_IS_NATIVE_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
function G_NATIVE_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGNativeSocketAddressClass;
{$ENDIF read_function}

implementation

function G_TYPE_NATIVE_SOCKET_ADDRESS: TGType;
begin
  G_TYPE_NATIVE_SOCKET_ADDRESS := g_native_socket_address_get_type;
end;

function G_NATIVE_SOCKET_ADDRESS(obj: Pointer): PGNativeSocketAddress;
begin
  Result := PGNativeSocketAddress(g_type_check_instance_cast(obj, G_TYPE_NATIVE_SOCKET_ADDRESS));
end;

function G_NATIVE_SOCKET_ADDRESS_CLASS(klass: Pointer): PGNativeSocketAddressClass;
begin
  Result := PGNativeSocketAddressClass(g_type_check_class_cast(klass, G_TYPE_NATIVE_SOCKET_ADDRESS));
end;

function G_IS_NATIVE_SOCKET_ADDRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_NATIVE_SOCKET_ADDRESS);
end;

function G_IS_NATIVE_SOCKET_ADDRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_NATIVE_SOCKET_ADDRESS);
end;

function G_NATIVE_SOCKET_ADDRESS_GET_CLASS(obj: Pointer): PGNativeSocketAddressClass;
begin
  Result := PGNativeSocketAddressClass(PGTypeInstance(obj)^.g_class);
end;



end.
