
  {$IFDEF read_struct}
type
  PGSocketAddressEnumerator = ^TGSocketAddressEnumerator;
  TGSocketAddressEnumerator = record
    parent_instance: TGObject;
  end;

  PGSocketAddressEnumeratorClass = ^TGSocketAddressEnumeratorClass;
  TGSocketAddressEnumeratorClass = record
    parent_class: TGObjectClass;
    next: function(enumerator: PGSocketAddressEnumerator; cancellable: PGCancellable; error: PPGError): PGSocketAddress; cdecl;
    next_async: procedure(enumerator: PGSocketAddressEnumerator; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    next_finish: function(enumerator: PGSocketAddressEnumerator; result: PGAsyncResult; error: PPGError): PGSocketAddress; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_socket_address_enumerator_get_type: TGType; cdecl; external libgio2;
function g_socket_address_enumerator_next(enumerator: PGSocketAddressEnumerator; cancellable: PGCancellable; error: PPGError): PGSocketAddress; cdecl; external libgio2;
procedure g_socket_address_enumerator_next_async(enumerator: PGSocketAddressEnumerator; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_socket_address_enumerator_next_finish(enumerator: PGSocketAddressEnumerator; result: PGAsyncResult; error: PPGError): PGSocketAddress; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:55:43 ===

function G_TYPE_SOCKET_ADDRESS_ENUMERATOR: TGType;
function G_SOCKET_ADDRESS_ENUMERATOR(obj: Pointer): PGSocketAddressEnumerator;
function G_SOCKET_ADDRESS_ENUMERATOR_CLASS(klass: Pointer): PGSocketAddressEnumeratorClass;
function G_IS_SOCKET_ADDRESS_ENUMERATOR(obj: Pointer): Tgboolean;
function G_IS_SOCKET_ADDRESS_ENUMERATOR_CLASS(klass: Pointer): Tgboolean;
function G_SOCKET_ADDRESS_ENUMERATOR_GET_CLASS(obj: Pointer): PGSocketAddressEnumeratorClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_SOCKET_ADDRESS_ENUMERATOR: TGType;
begin
  G_TYPE_SOCKET_ADDRESS_ENUMERATOR := g_socket_address_enumerator_get_type;
end;

function G_SOCKET_ADDRESS_ENUMERATOR(obj: Pointer): PGSocketAddressEnumerator;
begin
  Result := PGSocketAddressEnumerator(g_type_check_instance_cast(obj, G_TYPE_SOCKET_ADDRESS_ENUMERATOR));
end;

function G_SOCKET_ADDRESS_ENUMERATOR_CLASS(klass: Pointer): PGSocketAddressEnumeratorClass;
begin
  Result := PGSocketAddressEnumeratorClass(g_type_check_class_cast(klass, G_TYPE_SOCKET_ADDRESS_ENUMERATOR));
end;

function G_IS_SOCKET_ADDRESS_ENUMERATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SOCKET_ADDRESS_ENUMERATOR);
end;

function G_IS_SOCKET_ADDRESS_ENUMERATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SOCKET_ADDRESS_ENUMERATOR);
end;

function G_SOCKET_ADDRESS_ENUMERATOR_GET_CLASS(obj: Pointer): PGSocketAddressEnumeratorClass;
begin
  Result := PGSocketAddressEnumeratorClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
