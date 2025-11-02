{$IFDEF read_interface}

  { WEBKIT_DECLARE_FINAL_TYPE (WebKitGeolocationManager, webkit_geolocation_manager, WEBKIT, GEOLOCATION_MANAGER, GObject) }

type
  TWebKitGeolocationManager = record
  end;
  PWebKitGeolocationManager = ^TWebKitGeolocationManager;

  TWebKitGeolocationManagerClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitGeolocationManagerClass = ^TWebKitGeolocationManagerClass;

  TWebKitGeolocationPosition = record
  end;
  PWebKitGeolocationPosition = ^TWebKitGeolocationPosition;

function webkit_geolocation_manager_get_type: TGType; cdecl; external libwebkit;
procedure webkit_geolocation_manager_update_position(manager: PWebKitGeolocationManager; position: PWebKitGeolocationPosition); cdecl; external libwebkit;
procedure webkit_geolocation_manager_failed(manager: PWebKitGeolocationManager; error_message: pchar); cdecl; external libwebkit;
function webkit_geolocation_manager_get_enable_high_accuracy(manager: PWebKitGeolocationManager): Tgboolean; cdecl; external libwebkit;
function webkit_geolocation_position_get_type: TGType; cdecl; external libwebkit;
function webkit_geolocation_position_new(latitude: double; longitude: double; accuracy: double): PWebKitGeolocationPosition; cdecl; external libwebkit;
function webkit_geolocation_position_copy(position: PWebKitGeolocationPosition): PWebKitGeolocationPosition; cdecl; external libwebkit;
procedure webkit_geolocation_position_free(position: PWebKitGeolocationPosition); cdecl; external libwebkit;
procedure webkit_geolocation_position_set_timestamp(position: PWebKitGeolocationPosition; timestamp: Tguint64); cdecl; external libwebkit;
procedure webkit_geolocation_position_set_altitude(position: PWebKitGeolocationPosition; altitude: double); cdecl; external libwebkit;
procedure webkit_geolocation_position_set_altitude_accuracy(position: PWebKitGeolocationPosition; altitude_accuracy: double); cdecl; external libwebkit;
procedure webkit_geolocation_position_set_heading(position: PWebKitGeolocationPosition; heading: double); cdecl; external libwebkit;
procedure webkit_geolocation_position_set_speed(position: PWebKitGeolocationPosition; speed: double); cdecl; external libwebkit;

function WEBKIT_TYPE_GEOLOCATION_POSITION: TGType;

// === Konventiert am: 3-1-25 19:34:01 ===

function WEBKIT_TYPE_GEOLOCATION_MANAGER: TGType;
function WEBKIT_GEOLOCATION_MANAGER(obj: Pointer): PWebKitGeolocationManager;
function WEBKIT_IS_GEOLOCATION_MANAGER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_GEOLOCATION_MANAGER: TGType;
begin
  Result := webkit_geolocation_manager_get_type;
end;

function WEBKIT_GEOLOCATION_MANAGER(obj: Pointer): PWebKitGeolocationManager;
begin
  Result := PWebKitGeolocationManager(g_type_check_instance_cast(obj, WEBKIT_TYPE_GEOLOCATION_MANAGER));
end;

function WEBKIT_IS_GEOLOCATION_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_GEOLOCATION_MANAGER);
end;

// ====

function WEBKIT_TYPE_GEOLOCATION_POSITION: TGType;
begin
  WEBKIT_TYPE_GEOLOCATION_POSITION := webkit_geolocation_position_get_type;
end;


{$ENDIF read_implementation}
