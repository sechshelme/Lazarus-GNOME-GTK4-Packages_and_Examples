{$IFDEF read_interface}


function geocode_reverse_get_type: TGType; cdecl; external libgeocode_glib;

type
  PGeocodeReversePrivate = type Pointer;

  TGeocodeReverse = record
    parent_instance: TGObject;
    priv: PGeocodeReversePrivate;
  end;
  PGeocodeReverse = ^TGeocodeReverse;

  TGeocodeReverseClass = record
    parent_class: TGObjectClass;
  end;
  PGeocodeReverseClass = ^TGeocodeReverseClass;

function geocode_reverse_new_for_location(location: PGeocodeLocation): PGeocodeReverse; cdecl; external libgeocode_glib;
procedure geocode_reverse_set_backend(obj: PGeocodeReverse; backend: PGeocodeBackend); cdecl; external libgeocode_glib;
procedure geocode_reverse_resolve_async(obj: PGeocodeReverse; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgeocode_glib;
function geocode_reverse_resolve_finish(obj: PGeocodeReverse; res: PGAsyncResult; error: PPGError): PGeocodePlace; cdecl; external libgeocode_glib;
function geocode_reverse_resolve(obj: PGeocodeReverse; error: PPGError): PGeocodePlace; cdecl; external libgeocode_glib;

// === Konventiert am: 15-11-25 16:53:08 ===

function GEOCODE_TYPE_REVERSE: TGType;
function GEOCODE_REVERSE(obj: Pointer): PGeocodeReverse;
function GEOCODE_REVERSE_CLASS(klass: Pointer): PGeocodeReverseClass;
function GEOCODE_IS_REVERSE(obj: Pointer): Tgboolean;
function GEOCODE_IS_REVERSE_CLASS(klass: Pointer): Tgboolean;
function GEOCODE_REVERSE_GET_CLASS(obj: Pointer): PGeocodeReverseClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GEOCODE_TYPE_REVERSE: TGType;
begin
  GEOCODE_TYPE_REVERSE := geocode_reverse_get_type;
end;

function GEOCODE_REVERSE(obj: Pointer): PGeocodeReverse;
begin
  Result := PGeocodeReverse(g_type_check_instance_cast(obj, GEOCODE_TYPE_REVERSE));
end;

function GEOCODE_REVERSE_CLASS(klass: Pointer): PGeocodeReverseClass;
begin
  Result := PGeocodeReverseClass(g_type_check_class_cast(klass, GEOCODE_TYPE_REVERSE));
end;

function GEOCODE_IS_REVERSE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_REVERSE);
end;

function GEOCODE_IS_REVERSE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEOCODE_TYPE_REVERSE);
end;

function GEOCODE_REVERSE_GET_CLASS(obj: Pointer): PGeocodeReverseClass;
begin
  Result := PGeocodeReverseClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
