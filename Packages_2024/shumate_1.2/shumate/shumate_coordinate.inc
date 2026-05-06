{$IFDEF read_interface}


type
  TShumateCoordinate = record
    parent_instance: TGInitiallyUnowned;
  end;
  PShumateCoordinate = ^TShumateCoordinate;

  TShumateCoordinateClass = record
    parent_class: TGInitiallyUnownedClass;
    padding: array[0..15] of Tgpointer;
  end;
  PShumateCoordinateClass = ^TShumateCoordinateClass;

function shumate_coordinate_get_type: TGType; cdecl; external libshumate;
function shumate_coordinate_new: PShumateCoordinate; cdecl; external libshumate;
function shumate_coordinate_new_full(latitude: double; longitude: double): PShumateCoordinate; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:50:06 ===

function SHUMATE_TYPE_COORDINATE: TGType;
function SHUMATE_COORDINATE(obj: Pointer): PShumateCoordinate;
function SHUMATE_IS_COORDINATE(obj: Pointer): Tgboolean;
function SHUMATE_COORDINATE_CLASS(klass: Pointer): PShumateCoordinateClass;
function SHUMATE_IS_COORDINATE_CLASS(klass: Pointer): Tgboolean;
function SHUMATE_COORDINATE_GET_CLASS(obj: Pointer): PShumateCoordinateClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_COORDINATE: TGType;
begin
  Result := shumate_coordinate_get_type;
end;

function SHUMATE_COORDINATE(obj: Pointer): PShumateCoordinate;
begin
  Result := PShumateCoordinate(g_type_check_instance_cast(obj, SHUMATE_TYPE_COORDINATE));
end;

function SHUMATE_IS_COORDINATE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_COORDINATE);
end;

function SHUMATE_COORDINATE_CLASS(klass: Pointer): PShumateCoordinateClass;
begin
  Result := PShumateCoordinateClass(g_type_check_class_cast(klass, SHUMATE_TYPE_COORDINATE));
end;

function SHUMATE_IS_COORDINATE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SHUMATE_TYPE_COORDINATE);
end;

function SHUMATE_COORDINATE_GET_CLASS(obj: Pointer): PShumateCoordinateClass;
begin
  Result := PShumateCoordinateClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
