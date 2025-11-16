{$IFDEF read_interface}


type
  TGeocodeMockBackend = record
  end;
  PGeocodeMockBackend = ^TGeocodeMockBackend;

  TGeocodeMockBackendClass = record
    parent_class: TGObjectClass;
  end;
  PGeocodeMockBackendClass = ^TGeocodeMockBackendClass;

function geocode_mock_backend_get_type: TGType; cdecl; external libgeocode_glib;
function geocode_mock_backend_new: PGeocodeMockBackend; cdecl; external libgeocode_glib;
procedure geocode_mock_backend_add_forward_result(self: PGeocodeMockBackend; params: PGHashTable; results: PGList; error: PGError); cdecl; external libgeocode_glib;
procedure geocode_mock_backend_add_reverse_result(self: PGeocodeMockBackend; params: PGHashTable; results: PGList; error: PGError); cdecl; external libgeocode_glib;
procedure geocode_mock_backend_clear(self: PGeocodeMockBackend); cdecl; external libgeocode_glib;

type
  TGeocodeMockBackendQuery = record
    params: PGHashTable;
    is_forward: Tgboolean;
    results: PGList;
    error: PGError;
  end;
  PGeocodeMockBackendQuery = ^TGeocodeMockBackendQuery;

function geocode_mock_backend_get_query_log(self: PGeocodeMockBackend): PGPtrArray; cdecl; external libgeocode_glib;

// === Konventiert am: 15-11-25 16:52:39 ===

function GEOCODE_TYPE_MOCK_BACKEND: TGType;
function GEOCODE_MOCK_BACKEND(obj: Pointer): PGeocodeMockBackend;
function GEOCODE_IS_MOCK_BACKEND(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GEOCODE_TYPE_MOCK_BACKEND: TGType;
begin
  Result := geocode_mock_backend_get_type;
end;

function GEOCODE_MOCK_BACKEND(obj: Pointer): PGeocodeMockBackend;
begin
  Result := PGeocodeMockBackend(g_type_check_instance_cast(obj, GEOCODE_TYPE_MOCK_BACKEND));
end;

function GEOCODE_IS_MOCK_BACKEND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_MOCK_BACKEND);
end;


{$ENDIF read_implementation}
