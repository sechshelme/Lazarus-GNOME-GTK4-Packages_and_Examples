unit geocode_nominatim;

interface

uses
  fp_glib2, fp_geocode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGeocodeNominatim = record
    parent_instance: TGObject;
  end;
  PGeocodeNominatim = ^TGeocodeNominatim;

  TGeocodeNominatimClass = record
    parent_class: TGObjectClass;
    query: function(self: PGeocodeNominatim; uri: Pgchar; cancellable: PGCancellable; error: PPGError): Pgchar; cdecl;
    query_async: procedure(self: PGeocodeNominatim; uri: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    query_finish: function(self: PGeocodeNominatim; res: PGAsyncResult; error: PPGError): Pgchar; cdecl;
  end;
  PGeocodeNominatimClass = ^TGeocodeNominatimClass;

function geocode_nominatim_get_type: TGType; cdecl; external geocode_glib;
function geocode_nominatim_new(base_url: Pgchar; maintainer_email_address: Pgchar): PGeocodeNominatim; cdecl; external geocode_glib;
function geocode_nominatim_get_gnome: PGeocodeNominatim; cdecl; external geocode_glib;

// === Konventiert am: 15-11-25 16:52:45 ===

function GEOCODE_TYPE_NOMINATIM: TGType;
function GEOCODE_NOMINATIM(obj: Pointer): PGeocodeNominatim;
function GEOCODE_IS_NOMINATIM(obj: Pointer): Tgboolean;
function GEOCODE_NOMINATIM_CLASS(klass: Pointer): PGeocodeNominatimClass;
function GEOCODE_IS_NOMINATIM_CLASS(klass: Pointer): Tgboolean;
function GEOCODE_NOMINATIM_GET_CLASS(obj: Pointer): PGeocodeNominatimClass;

implementation

function GEOCODE_TYPE_NOMINATIM: TGType;
begin
  Result := geocode_nominatim_get_type;
end;

function GEOCODE_NOMINATIM(obj: Pointer): PGeocodeNominatim;
begin
  Result := PGeocodeNominatim(g_type_check_instance_cast(obj, GEOCODE_TYPE_NOMINATIM));
end;

function GEOCODE_IS_NOMINATIM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_NOMINATIM);
end;

function GEOCODE_NOMINATIM_CLASS(klass: Pointer): PGeocodeNominatimClass;
begin
  Result := PGeocodeNominatimClass(g_type_check_class_cast(klass, GEOCODE_TYPE_NOMINATIM));
end;

function GEOCODE_IS_NOMINATIM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEOCODE_TYPE_NOMINATIM);
end;

function GEOCODE_NOMINATIM_GET_CLASS(obj: Pointer): PGeocodeNominatimClass;
begin
  Result := PGeocodeNominatimClass(PGTypeInstance(obj)^.g_class);
end;


end.
