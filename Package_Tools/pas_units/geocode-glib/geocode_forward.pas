unit geocode_forward;

interface

uses
  fp_glib2, fp_geocode, geocode_bounding_box, geocode_backend;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function geocode_forward_get_type: TGType; cdecl; external geocode_glib;

type
  PGeocodeForwardPrivate = type Pointer;

  TGeocodeForward = record
    parent_instance: TGObject;
    priv: PGeocodeForwardPrivate;
  end;
  PGeocodeForward = ^TGeocodeForward;

  TGeocodeForwardClass = record
    parent_class: TGObjectClass;
  end;
  PGeocodeForwardClass = ^TGeocodeForwardClass;

function geocode_forward_new_for_string(str: pchar): PGeocodeForward; cdecl; external geocode_glib;
function geocode_forward_new_for_params(params: PGHashTable): PGeocodeForward; cdecl; external geocode_glib;
function geocode_forward_get_answer_count(forward: PGeocodeForward): Tguint; cdecl; external geocode_glib;
procedure geocode_forward_set_answer_count(forward: PGeocodeForward; count: Tguint); cdecl; external geocode_glib;
function geocode_forward_get_search_area(forward: PGeocodeForward): PGeocodeBoundingBox; cdecl; external geocode_glib;
procedure geocode_forward_set_search_area(forward: PGeocodeForward; box: PGeocodeBoundingBox); cdecl; external geocode_glib;
function geocode_forward_get_bounded(forward: PGeocodeForward): Tgboolean; cdecl; external geocode_glib;
procedure geocode_forward_set_bounded(forward: PGeocodeForward; bounded: Tgboolean); cdecl; external geocode_glib;
procedure geocode_forward_search_async(forward: PGeocodeForward; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external geocode_glib;
function geocode_forward_search_finish(forward: PGeocodeForward; res: PGAsyncResult; error: PPGError): PGList; cdecl; external geocode_glib;
function geocode_forward_search(forward: PGeocodeForward; error: PPGError): PGList; cdecl; external geocode_glib;
procedure geocode_forward_set_backend(forward: PGeocodeForward; backend: PGeocodeBackend); cdecl; external geocode_glib;

// === Konventiert am: 15-11-25 16:51:48 ===

function GEOCODE_TYPE_FORWARD: TGType;
function GEOCODE_FORWARD(obj: Pointer): PGeocodeForward;
function GEOCODE_FORWARD_CLASS(klass: Pointer): PGeocodeForwardClass;
function GEOCODE_IS_FORWARD(obj: Pointer): Tgboolean;
function GEOCODE_IS_FORWARD_CLASS(klass: Pointer): Tgboolean;
function GEOCODE_FORWARD_GET_CLASS(obj: Pointer): PGeocodeForwardClass;

implementation

function GEOCODE_TYPE_FORWARD: TGType;
begin
  GEOCODE_TYPE_FORWARD := geocode_forward_get_type;
end;

function GEOCODE_FORWARD(obj: Pointer): PGeocodeForward;
begin
  Result := PGeocodeForward(g_type_check_instance_cast(obj, GEOCODE_TYPE_FORWARD));
end;

function GEOCODE_FORWARD_CLASS(klass: Pointer): PGeocodeForwardClass;
begin
  Result := PGeocodeForwardClass(g_type_check_class_cast(klass, GEOCODE_TYPE_FORWARD));
end;

function GEOCODE_IS_FORWARD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_FORWARD);
end;

function GEOCODE_IS_FORWARD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEOCODE_TYPE_FORWARD);
end;

function GEOCODE_FORWARD_GET_CLASS(obj: Pointer): PGeocodeForwardClass;
begin
  Result := PGeocodeForwardClass(PGTypeInstance(obj)^.g_class);
end;



end.
