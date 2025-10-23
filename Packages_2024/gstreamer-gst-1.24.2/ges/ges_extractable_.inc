{$IFDEF read_interface}

type
  PGESExtractableCheckId = ^TGESExtractableCheckId;
  TGESExtractableCheckId = function(_type: TGType; id: Pgchar; error: PPGError): Pgchar; cdecl;

  PGESExtractableInterface = ^TGESExtractableInterface;
  TGESExtractableInterface = record
    parent: TGTypeInterface;
    asset_type: TGType;
    check_id: TGESExtractableCheckId;
    can_update_asset: Tgboolean;
    set_asset: procedure(self: PGESExtractable; asset: PGESAsset); cdecl;
    set_asset_full: function(self: PGESExtractable; asset: PGESAsset): Tgboolean; cdecl;
    get_parameters_from_id: function(id: Pgchar; n_params: Pguint): PGParameter; cdecl;
    get_id: function(self: PGESExtractable): Pgchar; cdecl;
    get_real_extractable_type: function(wanted_type: TGType; id: Pgchar): TGType; cdecl;
    register_metas: function(self: PGESExtractableInterface; klass: PGObjectClass; asset: PGESAsset): Tgboolean; cdecl;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;

function ges_extractable_get_type: TGType; cdecl; external libges;
function ges_extractable_get_asset(self: PGESExtractable): PGESAsset; cdecl; external libges;
function ges_extractable_set_asset(self: PGESExtractable; asset: PGESAsset): Tgboolean; cdecl; external libges;
function ges_extractable_get_id(self: PGESExtractable): Pgchar; cdecl; external libges;

function GES_EXTRACTABLE_GET_INTERFACE(obj: Pointer): Pointer;

// === Konventiert am: 12-12-24 17:21:59 ===

function GES_TYPE_EXTRACTABLE: TGType;
function GES_EXTRACTABLE(obj: Pointer): PGESExtractable;
function GES_IS_EXTRACTABLE(obj: Pointer): Tgboolean;
function GES_EXTRACTABLE_GET_IFACE(obj: Pointer): PGESExtractableInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_EXTRACTABLE: TGType;
begin
  Result := ges_extractable_get_type;
end;

function GES_EXTRACTABLE(obj: Pointer): PGESExtractable;
begin
  Result := PGESExtractable(g_type_check_instance_cast(obj, GES_TYPE_EXTRACTABLE));
end;

function GES_IS_EXTRACTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_EXTRACTABLE);
end;

function GES_EXTRACTABLE_GET_IFACE(obj: Pointer): PGESExtractableInterface;
begin
  Result := g_type_interface_peek(obj, GES_TYPE_EXTRACTABLE);
end;

// ====

function GES_EXTRACTABLE_GET_INTERFACE(obj: Pointer): Pointer;
begin
  GES_EXTRACTABLE_GET_INTERFACE := G_TYPE_INSTANCE_GET_INTERFACE(obj, GES_TYPE_EXTRACTABLE);
end;


{$ENDIF read_implementation}
