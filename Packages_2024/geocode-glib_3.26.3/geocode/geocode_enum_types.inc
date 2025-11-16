{$IFDEF read_interface}



function geocode_error_get_type: TGType; cdecl; external libgeocode_glib;
function GEOCODE_TYPE_ERROR: TGType;

function geocode_location_uri_scheme_get_type: TGType; cdecl; external libgeocode_glib;
function GEOCODE_TYPE_LOCATION_URI_SCHEME: TGType;

function geocode_location_crs_get_type: TGType; cdecl; external libgeocode_glib;
function GEOCODE_TYPE_LOCATION_CRS: TGType;

function geocode_place_type_get_type: TGType; cdecl; external libgeocode_glib;
function GEOCODE_TYPE_PLACE_TYPE: TGType;

function geocode_place_osm_type_get_type: TGType; cdecl; external libgeocode_glib;
function GEOCODE_TYPE_PLACE_OSM_TYPE: TGType;


// === Konventiert am: 15-11-25 16:51:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GEOCODE_TYPE_ERROR: TGType;
begin
  GEOCODE_TYPE_ERROR := geocode_error_get_type;
end;

function GEOCODE_TYPE_LOCATION_URI_SCHEME: TGType;
begin
  GEOCODE_TYPE_LOCATION_URI_SCHEME := geocode_location_uri_scheme_get_type;
end;

function GEOCODE_TYPE_LOCATION_CRS: TGType;
begin
  GEOCODE_TYPE_LOCATION_CRS := geocode_location_crs_get_type;
end;

function GEOCODE_TYPE_PLACE_TYPE: TGType;
begin
  GEOCODE_TYPE_PLACE_TYPE := geocode_place_type_get_type;
end;

function GEOCODE_TYPE_PLACE_OSM_TYPE: TGType;
begin
  GEOCODE_TYPE_PLACE_OSM_TYPE := geocode_place_osm_type_get_type;
end;


{$ENDIF read_implementation}
