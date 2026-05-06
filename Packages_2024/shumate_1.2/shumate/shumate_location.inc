{$IFDEF read_interface}


const
  SHUMATE_MIN_LATITUDE = -(85.0511287798);
  SHUMATE_MAX_LATITUDE = 85.0511287798;
  SHUMATE_MIN_LONGITUDE = -(180.0);
  SHUMATE_MAX_LONGITUDE = 180.0;

type
  TShumateLocation = record
  end;
  PShumateLocation = ^TShumateLocation;

  TShumateLocationInterface = record
    g_iface: TGTypeInterface;
    get_latitude: function(location: PShumateLocation): double; cdecl;
    get_longitude: function(location: PShumateLocation): double; cdecl;
    set_location: procedure(location: PShumateLocation; latitude: double; longitude: double); cdecl;
  end;
  PShumateLocationInterface = ^TShumateLocationInterface;

function shumate_location_get_type: TGType; cdecl; external libshumate;
procedure shumate_location_set_location(location: PShumateLocation; latitude: double; longitude: double); cdecl; external libshumate;
function shumate_location_get_latitude(location: PShumateLocation): double; cdecl; external libshumate;
function shumate_location_get_longitude(location: PShumateLocation): double; cdecl; external libshumate;
function shumate_location_distance(this: PShumateLocation; other: PShumateLocation): double; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:49:28 ===

function SHUMATE_TYPE_LOCATION: TGType;
function SHUMATE_LOCATION(obj: Pointer): PShumateLocation;
function SHUMATE_IS_LOCATION(obj: Pointer): Tgboolean;
function SHUMATE_LOCATION_GET_IFACE(obj: Pointer): PShumateLocationInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_LOCATION: TGType;
begin
  Result := shumate_location_get_type;
end;

function SHUMATE_LOCATION(obj: Pointer): PShumateLocation;
begin
  Result := PShumateLocation(g_type_check_instance_cast(obj, SHUMATE_TYPE_LOCATION));
end;

function SHUMATE_IS_LOCATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_LOCATION);
end;

function SHUMATE_LOCATION_GET_IFACE(obj: Pointer): PShumateLocationInterface;
begin
  Result := g_type_interface_peek(obj, SHUMATE_TYPE_LOCATION);
end;


{$ENDIF read_implementation}
