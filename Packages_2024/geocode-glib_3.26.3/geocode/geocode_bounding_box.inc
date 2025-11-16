{$IFDEF read_interface}


function geocode_bounding_box_get_type: TGType; cdecl; external libgeocode_glib;

type
  PGeocodeBoundingBoxPrivate = type Pointer;

  TGeocodeBoundingBox = record
    parent_instance: TGObject;
    priv: PGeocodeBoundingBoxPrivate;
  end;
  PGeocodeBoundingBox = ^TGeocodeBoundingBox;

  TGeocodeBoundingBoxClass = record
    parent_class: TGObjectClass;
  end;
  PGeocodeBoundingBoxClass = ^TGeocodeBoundingBoxClass;

function geocode_bounding_box_new(top: Tgdouble; bottom: Tgdouble; left: Tgdouble; right: Tgdouble): PGeocodeBoundingBox; cdecl; external libgeocode_glib;
function geocode_bounding_box_equal(a: PGeocodeBoundingBox; b: PGeocodeBoundingBox): Tgboolean; cdecl; external libgeocode_glib;
function geocode_bounding_box_get_top(bbox: PGeocodeBoundingBox): Tgdouble; cdecl; external libgeocode_glib;
function geocode_bounding_box_get_bottom(bbox: PGeocodeBoundingBox): Tgdouble; cdecl; external libgeocode_glib;
function geocode_bounding_box_get_left(bbox: PGeocodeBoundingBox): Tgdouble; cdecl; external libgeocode_glib;
function geocode_bounding_box_get_right(bbox: PGeocodeBoundingBox): Tgdouble; cdecl; external libgeocode_glib;

// === Konventiert am: 15-11-25 16:54:44 ===

function GEOCODE_TYPE_BOUNDING_BOX: TGType;
function GEOCODE_BOUNDING_BOX(obj: Pointer): PGeocodeBoundingBox;
function GEOCODE_BOUNDING_BOX_CLASS(klass: Pointer): PGeocodeBoundingBoxClass;
function GEOCODE_IS_BOUNDING_BOX(obj: Pointer): Tgboolean;
function GEOCODE_IS_BOUNDING_BOX_CLASS(klass: Pointer): Tgboolean;
function GEOCODE_BOUNDING_BOX_GET_CLASS(obj: Pointer): PGeocodeBoundingBoxClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GEOCODE_TYPE_BOUNDING_BOX: TGType;
begin
  GEOCODE_TYPE_BOUNDING_BOX := geocode_bounding_box_get_type;
end;

function GEOCODE_BOUNDING_BOX(obj: Pointer): PGeocodeBoundingBox;
begin
  Result := PGeocodeBoundingBox(g_type_check_instance_cast(obj, GEOCODE_TYPE_BOUNDING_BOX));
end;

function GEOCODE_BOUNDING_BOX_CLASS(klass: Pointer): PGeocodeBoundingBoxClass;
begin
  Result := PGeocodeBoundingBoxClass(g_type_check_class_cast(klass, GEOCODE_TYPE_BOUNDING_BOX));
end;

function GEOCODE_IS_BOUNDING_BOX(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_BOUNDING_BOX);
end;

function GEOCODE_IS_BOUNDING_BOX_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEOCODE_TYPE_BOUNDING_BOX);
end;

function GEOCODE_BOUNDING_BOX_GET_CLASS(obj: Pointer): PGeocodeBoundingBoxClass;
begin
  Result := PGeocodeBoundingBoxClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
