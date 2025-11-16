{$IFDEF read_interface}


function geocode_place_get_type: TGType; cdecl; external libgeocode_glib;

type
  PGeocodePlacePrivate = type Pointer;

  TGeocodePlace = record
    parent_instance: TGObject;
    priv: PGeocodePlacePrivate;
  end;
  PGeocodePlace = ^TGeocodePlace;

  TGeocodePlaceClass = record
    parent_class: TGObjectClass;
  end;
  PGeocodePlaceClass = ^TGeocodePlaceClass;

type
  PGeocodePlaceType = ^TGeocodePlaceType;
  TGeocodePlaceType = longint;

const
  GEOCODE_PLACE_TYPE_UNKNOWN = 0;
  GEOCODE_PLACE_TYPE_BUILDING = 1;
  GEOCODE_PLACE_TYPE_STREET = 2;
  GEOCODE_PLACE_TYPE_TOWN = 3;
  GEOCODE_PLACE_TYPE_STATE = 4;
  GEOCODE_PLACE_TYPE_COUNTY = 5;
  GEOCODE_PLACE_TYPE_LOCAL_ADMINISTRATIVE_AREA = 6;
  GEOCODE_PLACE_TYPE_POSTAL_CODE = 7;
  GEOCODE_PLACE_TYPE_COUNTRY = 8;
  GEOCODE_PLACE_TYPE_ISLAND = 9;
  GEOCODE_PLACE_TYPE_AIRPORT = 10;
  GEOCODE_PLACE_TYPE_RAILWAY_STATION = 11;
  GEOCODE_PLACE_TYPE_BUS_STOP = 12;
  GEOCODE_PLACE_TYPE_MOTORWAY = 13;
  GEOCODE_PLACE_TYPE_DRAINAGE = 14;
  GEOCODE_PLACE_TYPE_LAND_FEATURE = 15;
  GEOCODE_PLACE_TYPE_MISCELLANEOUS = 16;
  GEOCODE_PLACE_TYPE_SUPERNAME = 17;
  GEOCODE_PLACE_TYPE_POINT_OF_INTEREST = 18;
  GEOCODE_PLACE_TYPE_SUBURB = 19;
  GEOCODE_PLACE_TYPE_COLLOQUIAL = 20;
  GEOCODE_PLACE_TYPE_ZONE = 21;
  GEOCODE_PLACE_TYPE_HISTORICAL_STATE = 22;
  GEOCODE_PLACE_TYPE_HISTORICAL_COUNTY = 23;
  GEOCODE_PLACE_TYPE_CONTINENT = 24;
  GEOCODE_PLACE_TYPE_TIME_ZONE = 25;
  GEOCODE_PLACE_TYPE_ESTATE = 26;
  GEOCODE_PLACE_TYPE_HISTORICAL_TOWN = 27;
  GEOCODE_PLACE_TYPE_OCEAN = 28;
  GEOCODE_PLACE_TYPE_SEA = 29;
  GEOCODE_PLACE_TYPE_SCHOOL = 30;
  GEOCODE_PLACE_TYPE_PLACE_OF_WORSHIP = 31;
  GEOCODE_PLACE_TYPE_RESTAURANT = 32;
  GEOCODE_PLACE_TYPE_BAR = 33;
  GEOCODE_PLACE_TYPE_LIGHT_RAIL_STATION = 34;

type
  PGeocodePlaceOsmType = ^TGeocodePlaceOsmType;
  TGeocodePlaceOsmType = longint;

const
  GEOCODE_PLACE_OSM_TYPE_UNKNOWN = 0;
  GEOCODE_PLACE_OSM_TYPE_NODE = 1;
  GEOCODE_PLACE_OSM_TYPE_RELATION = 2;
  GEOCODE_PLACE_OSM_TYPE_WAY = 3;

function geocode_place_new(name: pchar; place_type: TGeocodePlaceType): PGeocodePlace; cdecl; external libgeocode_glib;
function geocode_place_new_with_location(name: pchar; place_type: TGeocodePlaceType; location: PGeocodeLocation): PGeocodePlace; cdecl; external libgeocode_glib;
function geocode_place_equal(a: PGeocodePlace; b: PGeocodePlace): Tgboolean; cdecl; external libgeocode_glib;
procedure geocode_place_set_name(place: PGeocodePlace; name: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_name(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
function geocode_place_get_place_type(place: PGeocodePlace): TGeocodePlaceType; cdecl; external libgeocode_glib;
function geocode_place_get_bounding_box(place: PGeocodePlace): PGeocodeBoundingBox; cdecl; external libgeocode_glib;
procedure geocode_place_set_bounding_box(place: PGeocodePlace; bbox: PGeocodeBoundingBox); cdecl; external libgeocode_glib;
procedure geocode_place_set_location(place: PGeocodePlace; location: PGeocodeLocation); cdecl; external libgeocode_glib;
function geocode_place_get_location(place: PGeocodePlace): PGeocodeLocation; cdecl; external libgeocode_glib;
procedure geocode_place_set_street_address(place: PGeocodePlace; street_address: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_street_address(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_street(place: PGeocodePlace; street: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_street(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_building(place: PGeocodePlace; building: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_building(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_postal_code(place: PGeocodePlace; postal_code: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_postal_code(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_area(place: PGeocodePlace; area: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_area(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_town(place: PGeocodePlace; town: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_town(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_county(place: PGeocodePlace; county: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_county(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_state(place: PGeocodePlace; state: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_state(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_administrative_area(place: PGeocodePlace; admin_area: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_administrative_area(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_country_code(place: PGeocodePlace; country_code: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_country_code(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_country(place: PGeocodePlace; country: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_country(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
procedure geocode_place_set_continent(place: PGeocodePlace; continent: pchar); cdecl; external libgeocode_glib;
function geocode_place_get_continent(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
function geocode_place_get_icon(place: PGeocodePlace): PGIcon; cdecl; external libgeocode_glib;
function geocode_place_get_osm_id(place: PGeocodePlace): pchar; cdecl; external libgeocode_glib;
function geocode_place_get_osm_type(place: PGeocodePlace): TGeocodePlaceOsmType; cdecl; external libgeocode_glib;

// === Konventiert am: 15-11-25 16:53:01 ===

function GEOCODE_TYPE_PLACE: TGType;
function GEOCODE_PLACE(obj: Pointer): PGeocodePlace;
function GEOCODE_PLACE_CLASS(klass: Pointer): PGeocodePlaceClass;
function GEOCODE_IS_PLACE(obj: Pointer): Tgboolean;
function GEOCODE_IS_PLACE_CLASS(klass: Pointer): Tgboolean;
function GEOCODE_PLACE_GET_CLASS(obj: Pointer): PGeocodePlaceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GEOCODE_TYPE_PLACE: TGType;
begin
  GEOCODE_TYPE_PLACE := geocode_place_get_type;
end;

function GEOCODE_PLACE(obj: Pointer): PGeocodePlace;
begin
  Result := PGeocodePlace(g_type_check_instance_cast(obj, GEOCODE_TYPE_PLACE));
end;

function GEOCODE_PLACE_CLASS(klass: Pointer): PGeocodePlaceClass;
begin
  Result := PGeocodePlaceClass(g_type_check_class_cast(klass, GEOCODE_TYPE_PLACE));
end;

function GEOCODE_IS_PLACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_PLACE);
end;

function GEOCODE_IS_PLACE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEOCODE_TYPE_PLACE);
end;

function GEOCODE_PLACE_GET_CLASS(obj: Pointer): PGeocodePlaceClass;
begin
  Result := PGeocodePlaceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
