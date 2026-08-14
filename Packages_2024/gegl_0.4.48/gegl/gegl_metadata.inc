

  {$IFDEF read_enum}
type
  PGeglResolutionUnit = ^TGeglResolutionUnit;
  TGeglResolutionUnit = longint;
const
  GEGL_RESOLUTION_UNIT_NONE = 0;
  GEGL_RESOLUTION_UNIT_DPI = 1;
  GEGL_RESOLUTION_UNIT_DPM = 2;

type
  PGeglMapFlags = ^TGeglMapFlags;
  TGeglMapFlags = longint;
const
  GEGL_MAP_EXCLUDE_UNMAPPED = 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGeglMetadataMap = ^TGeglMetadataMap;
  TGeglMetadataMap = record
    local_name: Pgchar;
    name: Pgchar;
    transform: TGValueTransform;
  end;

  PGeglMetadataIter = ^TGeglMetadataIter;
  TGeglMetadataIter = record
    stamp: Tguint;
    user_data: Tgpointer;
    user_data2: Tgpointer;
    user_data3: Tgpointer;
  end;

  PGeglMetadata = type Pointer;

  PGeglMetadataInterface = ^TGeglMetadataInterface;
  TGeglMetadataInterface = record
    base_iface: TGTypeInterface;
    register_map: procedure(metadata: PGeglMetadata; file_module: Pgchar; flags: Tguint; map: PGeglMetadataMap; n_map: Tgsize); cdecl;
    set_resolution: function(metadata: PGeglMetadata; unit_: TGeglResolutionUnit; x: Tgfloat; y: Tgfloat): Tgboolean; cdecl;
    get_resolution: function(metadata: PGeglMetadata; unit_: PGeglResolutionUnit; x: Pgfloat; y: Pgfloat): Tgboolean; cdecl;
    iter_lookup: function(metadata: PGeglMetadata; iter: PGeglMetadataIter; key: Pgchar): Tgboolean; cdecl;
    iter_init: procedure(metadata: PGeglMetadata; iter: PGeglMetadataIter); cdecl;
    iter_next: function(metadata: PGeglMetadata; iter: PGeglMetadataIter): Pgchar; cdecl;
    iter_set_value: function(metadata: PGeglMetadata; iter: PGeglMetadataIter; value: PGValue): Tgboolean; cdecl;
    iter_get_value: function(metadata: PGeglMetadata; iter: PGeglMetadataIter; value: PGValue): Tgboolean; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_metadata_get_type: TGType; cdecl; external libgegl;
procedure gegl_metadata_register_map(metadata: PGeglMetadata; file_module: Pgchar; flags: Tguint; map: PGeglMetadataMap; n_map: Tgsize); cdecl; external libgegl;
procedure gegl_metadata_unregister_map(metadata: PGeglMetadata); cdecl; external libgegl;
function gegl_metadata_set_resolution(metadata: PGeglMetadata; unit_: TGeglResolutionUnit; x: Tgfloat; y: Tgfloat): Tgboolean; cdecl; external libgegl;
function gegl_metadata_get_resolution(metadata: PGeglMetadata; unit_: PGeglResolutionUnit; x: Pgfloat; y: Pgfloat): Tgboolean; cdecl; external libgegl;
function gegl_metadata_iter_lookup(metadata: PGeglMetadata; iter: PGeglMetadataIter; key: Pgchar): Tgboolean; cdecl; external libgegl;
procedure gegl_metadata_iter_init(metadata: PGeglMetadata; iter: PGeglMetadataIter); cdecl; external libgegl;
function gegl_metadata_iter_next(metadata: PGeglMetadata; iter: PGeglMetadataIter): Pgchar; cdecl; external libgegl;
function gegl_metadata_iter_set_value(metadata: PGeglMetadata; iter: PGeglMetadataIter; value: PGValue): Tgboolean; cdecl; external libgegl;
function gegl_metadata_iter_get_value(metadata: PGeglMetadata; iter: PGeglMetadataIter; value: PGValue): Tgboolean; cdecl; external libgegl;

// === Konventiert am: 12-8-26 15:09:04 ===

function GEGL_TYPE_METADATA: TGType;
function GEGL_METADATA(obj: Pointer): PGeglMetadata;
function GEGL_IS_METADATA(obj: Pointer): Tgboolean;
function GEGL_METADATA_GET_IFACE(obj: Pointer): PGeglMetadataInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GEGL_TYPE_METADATA: TGType;
begin
  Result := gegl_metadata_get_type;
end;

function GEGL_METADATA(obj: Pointer): PGeglMetadata;
begin
  Result := PGeglMetadata(g_type_check_instance_cast(obj, GEGL_TYPE_METADATA));
end;

function GEGL_IS_METADATA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_METADATA);
end;

function GEGL_METADATA_GET_IFACE(obj: Pointer): PGeglMetadataInterface;
begin
  Result := g_type_interface_peek(obj, GEGL_TYPE_METADATA);
end;

{$ENDIF read_implementation}
