

  {$IFDEF read_struct}
type
  PGeglMetadataHash = type Pointer;

  TGeglMetadataHashClass = record
    parent_class: TGeglMetadataStoreClass;
  end;
  PGeglMetadataHashClass = ^TGeglMetadataHashClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_metadata_hash_get_type: TGType; cdecl; external libgegl;
function gegl_metadata_hash_new: PGeglMetadataStore; cdecl; external libgegl;

// === Konventiert am: 12-8-26 15:08:57 ===

function GEGL_TYPE_METADATA_HASH: TGType;
function GEGL_METADATA_HASH(obj: Pointer): PGeglMetadataHash;
function GEGL_IS_METADATA_HASH(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GEGL_TYPE_METADATA_HASH: TGType;
begin
  Result := gegl_metadata_hash_get_type;
end;

function GEGL_METADATA_HASH(obj: Pointer): PGeglMetadataHash;
begin
  Result := PGeglMetadataHash(g_type_check_instance_cast(obj, GEGL_TYPE_METADATA_HASH));
end;

function GEGL_IS_METADATA_HASH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_METADATA_HASH);
end;

{$ENDIF read_implementation}
