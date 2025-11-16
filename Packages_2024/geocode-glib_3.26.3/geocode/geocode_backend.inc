{$IFDEF read_interface}


type
  TGeocodeBackend = record
  end;
  PGeocodeBackend = ^TGeocodeBackend;

  TGeocodeBackendInterface = record
    g_iface: TGTypeInterface;
    forward_search: function(backend: PGeocodeBackend; params: PGHashTable; cancellable: PGCancellable; error: PPGError): PGList; cdecl;
    forward_search_async: procedure(backend: PGeocodeBackend; params: PGHashTable; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    forward_search_finish: function(backend: PGeocodeBackend; result: PGAsyncResult; error: PPGError): PGList; cdecl;
    reverse_resolve: function(backend: PGeocodeBackend; params: PGHashTable; cancellable: PGCancellable; error: PPGError): PGList; cdecl;
    reverse_resolve_async: procedure(backend: PGeocodeBackend; params: PGHashTable; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    reverse_resolve_finish: function(backend: PGeocodeBackend; result: PGAsyncResult; error: PPGError): PGList; cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PGeocodeBackendInterface = ^TGeocodeBackendInterface;

function geocode_backend_get_type: TGType; cdecl; external libgeocode_glib;
procedure geocode_backend_forward_search_async(backend: PGeocodeBackend; params: PGHashTable; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgeocode_glib;
function geocode_backend_forward_search_finish(backend: PGeocodeBackend; result: PGAsyncResult; error: PPGError): PGList; cdecl; external libgeocode_glib;
function geocode_backend_forward_search(backend: PGeocodeBackend; params: PGHashTable; cancellable: PGCancellable; error: PPGError): PGList; cdecl; external libgeocode_glib;
procedure geocode_backend_reverse_resolve_async(backend: PGeocodeBackend; params: PGHashTable; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgeocode_glib;
function geocode_backend_reverse_resolve_finish(backend: PGeocodeBackend; result: PGAsyncResult; error: PPGError): PGList; cdecl; external libgeocode_glib;
function geocode_backend_reverse_resolve(backend: PGeocodeBackend; params: PGHashTable; cancellable: PGCancellable; error: PPGError): PGList; cdecl; external libgeocode_glib;

// === Konventiert am: 15-11-25 16:50:42 ===

function GEOCODE_TYPE_BACKEND: TGType;
function GEOCODE_BACKEND(obj: Pointer): PGeocodeBackend;
function GEOCODE_IS_BACKEND(obj: Pointer): Tgboolean;
function GEOCODE_BACKEND_GET_IFACE(obj: Pointer): PGeocodeBackendInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GEOCODE_TYPE_BACKEND: TGType;
begin
  Result := geocode_backend_get_type;
end;

function GEOCODE_BACKEND(obj: Pointer): PGeocodeBackend;
begin
  Result := PGeocodeBackend(g_type_check_instance_cast(obj, GEOCODE_TYPE_BACKEND));
end;

function GEOCODE_IS_BACKEND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_BACKEND);
end;

function GEOCODE_BACKEND_GET_IFACE(obj: Pointer): PGeocodeBackendInterface;
begin
  Result := g_type_interface_peek(obj, GEOCODE_TYPE_BACKEND);
end;


{$ENDIF read_implementation}
