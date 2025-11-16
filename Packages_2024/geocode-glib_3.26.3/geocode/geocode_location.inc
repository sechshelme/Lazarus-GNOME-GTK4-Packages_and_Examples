{$IFDEF read_interface}


function geocode_location_get_type: TGType; cdecl; external libgeocode_glib;

type
  PGeocodeLocationPrivate = type Pointer;

  TGeocodeLocation = record
    parent_instance: TGObject;
    priv: PGeocodeLocationPrivate;
  end;
  PGeocodeLocation = ^TGeocodeLocation;

  TGeocodeLocationClass = record
    parent_class: TGObjectClass;
  end;
  PGeocodeLocationClass = ^TGeocodeLocationClass;

type
  PGeocodeLocationURIScheme = ^TGeocodeLocationURIScheme;
  TGeocodeLocationURIScheme = longint;

const
  GEOCODE_LOCATION_URI_SCHEME_GEO = 0;

type
  PGeocodeLocationCRS = ^TGeocodeLocationCRS;
  TGeocodeLocationCRS = longint;

const
  GEOCODE_LOCATION_CRS_WGS84 = 0;

const
  GEOCODE_LOCATION_ALTITUDE_UNKNOWN = -(G_MAXDOUBLE);
  GEOCODE_LOCATION_ACCURACY_UNKNOWN = -(1);
  GEOCODE_LOCATION_ACCURACY_STREET = 1000;
  GEOCODE_LOCATION_ACCURACY_CITY = 15000;
  GEOCODE_LOCATION_ACCURACY_REGION = 50000;
  GEOCODE_LOCATION_ACCURACY_COUNTRY = 300000;
  GEOCODE_LOCATION_ACCURACY_CONTINENT = 3000000;

function geocode_location_new(latitude: Tgdouble; longitude: Tgdouble; accuracy: Tgdouble): PGeocodeLocation; cdecl; external libgeocode_glib;
function geocode_location_new_with_description(latitude: Tgdouble; longitude: Tgdouble; accuracy: Tgdouble; description: pchar): PGeocodeLocation; cdecl; external libgeocode_glib;
function geocode_location_equal(a: PGeocodeLocation; b: PGeocodeLocation): Tgboolean; cdecl; external libgeocode_glib;
function geocode_location_set_from_uri(loc: PGeocodeLocation; uri: pchar; error: PPGError): Tgboolean; cdecl; external libgeocode_glib;
function geocode_location_to_uri(loc: PGeocodeLocation; scheme: TGeocodeLocationURIScheme): pchar; cdecl; external libgeocode_glib;
function geocode_location_get_distance_from(loca: PGeocodeLocation; locb: PGeocodeLocation): double; cdecl; external libgeocode_glib;
procedure geocode_location_set_description(loc: PGeocodeLocation; description: pchar); cdecl; external libgeocode_glib;
function geocode_location_get_description(loc: PGeocodeLocation): pchar; cdecl; external libgeocode_glib;
function geocode_location_get_latitude(loc: PGeocodeLocation): Tgdouble; cdecl; external libgeocode_glib;
function geocode_location_get_longitude(loc: PGeocodeLocation): Tgdouble; cdecl; external libgeocode_glib;
function geocode_location_get_altitude(loc: PGeocodeLocation): Tgdouble; cdecl; external libgeocode_glib;
function geocode_location_get_crs(loc: PGeocodeLocation): TGeocodeLocationCRS; cdecl; external libgeocode_glib;
function geocode_location_get_accuracy(loc: PGeocodeLocation): Tgdouble; cdecl; external libgeocode_glib;
function geocode_location_get_timestamp(loc: PGeocodeLocation): Tguint64; cdecl; external libgeocode_glib;

// === Konventiert am: 15-11-25 16:52:29 ===

function GEOCODE_TYPE_LOCATION: TGType;
function GEOCODE_LOCATION(obj: Pointer): PGeocodeLocation;
function GEOCODE_LOCATION_CLASS(klass: Pointer): PGeocodeLocationClass;
function GEOCODE_IS_LOCATION(obj: Pointer): Tgboolean;
function GEOCODE_IS_LOCATION_CLASS(klass: Pointer): Tgboolean;
function GEOCODE_LOCATION_GET_CLASS(obj: Pointer): PGeocodeLocationClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GEOCODE_TYPE_LOCATION: TGType;
begin
  GEOCODE_TYPE_LOCATION := geocode_location_get_type;
end;

function GEOCODE_LOCATION(obj: Pointer): PGeocodeLocation;
begin
  Result := PGeocodeLocation(g_type_check_instance_cast(obj, GEOCODE_TYPE_LOCATION));
end;

function GEOCODE_LOCATION_CLASS(klass: Pointer): PGeocodeLocationClass;
begin
  Result := PGeocodeLocationClass(g_type_check_class_cast(klass, GEOCODE_TYPE_LOCATION));
end;

function GEOCODE_IS_LOCATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_LOCATION);
end;

function GEOCODE_IS_LOCATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEOCODE_TYPE_LOCATION);
end;

function GEOCODE_LOCATION_GET_CLASS(obj: Pointer): PGeocodeLocationClass;
begin
  Result := PGeocodeLocationClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
