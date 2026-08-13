unit gegl_metadatastore;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl, gegl_metadata;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGeglMetadataStore = ^TGeglMetadataStore;
  TGeglMetadataStore = record
    parent_instance: TGObject;
  end;

  PGeglMetadataStoreClass = ^TGeglMetadataStoreClass;
  TGeglMetadataStoreClass = record
    parent_class: TGObjectClass;
    _declare: procedure(self: PGeglMetadataStore; pspec: PGParamSpec; shadow: Tgboolean); cdecl;
    pspec: function(self: PGeglMetadataStore; name: Pgchar): PGParamSpec; cdecl;
    set_value: procedure(self: PGeglMetadataStore; name: Pgchar; value: PGValue); cdecl;
    _get_value: function(self: PGeglMetadataStore; name: Pgchar): PGValue; cdecl;
    has_value: function(self: PGeglMetadataStore; name: Pgchar): Tgboolean; cdecl;
    register_hook: procedure(self: PGeglMetadataStore; file_module_name: Pgchar; flags: Tguint); cdecl;
    parse_value: function(self: PGeglMetadataStore; pspec: PGParamSpec; transform: TGValueTransform; value: PGValue): Tgboolean; cdecl;
    generate_value: function(self: PGeglMetadataStore; pspec: PGParamSpec; transform: TGValueTransform; value: PGValue): Tgboolean; cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_metadata_store_get_type: TGType; cdecl; external libgegl;
procedure gegl_metadata_store_set_resolution_unit(self: PGeglMetadataStore; unit_: TGeglResolutionUnit); cdecl; external libgegl;
function gegl_metadata_store_get_resolution_unit(self: PGeglMetadataStore): TGeglResolutionUnit; cdecl; external libgegl;
procedure gegl_metadata_store_set_resolution_x(self: PGeglMetadataStore; resolution_x: Tgdouble); cdecl; external libgegl;
function gegl_metadata_store_get_resolution_x(self: PGeglMetadataStore): Tgdouble; cdecl; external libgegl;
procedure gegl_metadata_store_set_resolution_y(self: PGeglMetadataStore; resolution_y: Tgdouble); cdecl; external libgegl;
function gegl_metadata_store_get_resolution_y(self: PGeglMetadataStore): Tgdouble; cdecl; external libgegl;
function gegl_metadata_store_get_file_module_name(self: PGeglMetadataStore): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_set_title(self: PGeglMetadataStore; title: Pgchar); cdecl; external libgegl;
function gegl_metadata_store_get_title(self: PGeglMetadataStore): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_set_artist(self: PGeglMetadataStore; artist: Pgchar); cdecl; external libgegl;
function gegl_metadata_store_get_artist(self: PGeglMetadataStore): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_set_description(self: PGeglMetadataStore; description: Pgchar); cdecl; external libgegl;
function gegl_metadata_store_get_description(self: PGeglMetadataStore): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_set_copyright(self: PGeglMetadataStore; copyright: Pgchar); cdecl; external libgegl;
function gegl_metadata_store_get_copyright(self: PGeglMetadataStore): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_set_disclaimer(self: PGeglMetadataStore; disclaimer: Pgchar); cdecl; external libgegl;
function gegl_metadata_store_get_disclaimer(self: PGeglMetadataStore): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_set_warning(self: PGeglMetadataStore; warning: Pgchar); cdecl; external libgegl;
function gegl_metadata_store_get_warning(self: PGeglMetadataStore): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_set_comment(self: PGeglMetadataStore; comment: Pgchar); cdecl; external libgegl;
function gegl_metadata_store_get_comment(self: PGeglMetadataStore): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_set_software(self: PGeglMetadataStore; software: Pgchar); cdecl; external libgegl;
function gegl_metadata_store_get_software(self: PGeglMetadataStore): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_set_source(self: PGeglMetadataStore; source: Pgchar); cdecl; external libgegl;
function gegl_metadata_store_get_source(self: PGeglMetadataStore): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_set_timestamp(self: PGeglMetadataStore; timestamp: PGDateTime); cdecl; external libgegl;
function gegl_metadata_store_get_timestamp(self: PGeglMetadataStore): PGDateTime; cdecl; external libgegl;
procedure gegl_metadata_store_declare(self: PGeglMetadataStore; pspec: PGParamSpec); cdecl; external libgegl;
function gegl_metadata_store_has_value(self: PGeglMetadataStore; name: Pgchar): Tgboolean; cdecl; external libgegl;
function gegl_metadata_store_typeof_value(self: PGeglMetadataStore; name: Pgchar): TGType; cdecl; external libgegl;
procedure gegl_metadata_store_set_value(self: PGeglMetadataStore; name: Pgchar; value: PGValue); cdecl; external libgegl;
procedure gegl_metadata_store_get_value(self: PGeglMetadataStore; name: Pgchar; value: PGValue); cdecl; external libgegl;
procedure gegl_metadata_store_set_string(self: PGeglMetadataStore; name: Pgchar; _string: Pgchar); cdecl; external libgegl;
function gegl_metadata_store_get_string(self: PGeglMetadataStore; name: Pgchar): Pgchar; cdecl; external libgegl;
procedure gegl_metadata_store_register(self: PGeglMetadataStore; local_name: Pgchar; name: Pgchar; transform: TGValueTransform); cdecl; external libgegl;
procedure gegl_metadata_store_notify(self: PGeglMetadataStore; pspec: PGParamSpec; shadow: Tgboolean); cdecl; external libgegl;

function gegl_resolution_unit_get_type: TGType; cdecl; external libgegl;

// === Konventiert am: 12-8-26 15:08:52 ===

function GEGL_TYPE_METADATA_STORE: TGType;
function GEGL_METADATA_STORE(obj: Pointer): PGeglMetadataStore;
function GEGL_IS_METADATA_STORE(obj: Pointer): Tgboolean;
function GEGL_METADATA_STORE_CLASS(klass: Pointer): PGeglMetadataStoreClass;
function GEGL_IS_METADATA_STORE_CLASS(klass: Pointer): Tgboolean;
function GEGL_METADATA_STORE_GET_CLASS(obj: Pointer): PGeglMetadataStoreClass;

function GEGL_TYPE_RESOLUTION_UNIT: TGType;
{$ENDIF read_function}


implementation

function GEGL_TYPE_METADATA_STORE: TGType;
begin
  Result := gegl_metadata_store_get_type;
end;

function GEGL_METADATA_STORE(obj: Pointer): PGeglMetadataStore;
begin
  Result := PGeglMetadataStore(g_type_check_instance_cast(obj, GEGL_TYPE_METADATA_STORE));
end;

function GEGL_IS_METADATA_STORE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_METADATA_STORE);
end;

function GEGL_METADATA_STORE_CLASS(klass: Pointer): PGeglMetadataStoreClass;
begin
  Result := PGeglMetadataStoreClass(g_type_check_class_cast(klass, GEGL_TYPE_METADATA_STORE));
end;

function GEGL_IS_METADATA_STORE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEGL_TYPE_METADATA_STORE);
end;

function GEGL_METADATA_STORE_GET_CLASS(obj: Pointer): PGeglMetadataStoreClass;
begin
  Result := PGeglMetadataStoreClass(PGTypeInstance(obj)^.g_class);
end;


function GEGL_TYPE_RESOLUTION_UNIT: TGType;
begin
  GEGL_TYPE_RESOLUTION_UNIT := gegl_resolution_unit_get_type;
end;

end.
