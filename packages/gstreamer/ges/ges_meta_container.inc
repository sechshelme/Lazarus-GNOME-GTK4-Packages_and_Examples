{$IFDEF read_interface}

  {G_DECLARE_INTERFACE (GESMetaContainer, ges_meta_container, GES, META_CONTAINER, GObject); }
const
  GES_META_FORMATTER_NAME = 'name';
  GES_META_DESCRIPTION = 'description';
  GES_META_FORMATTER_MIMETYPE = 'mimetype';
  GES_META_FORMATTER_EXTENSION = 'extension';
  GES_META_FORMATTER_VERSION = 'version';
  GES_META_FORMATTER_RANK = 'rank';
  GES_META_VOLUME = 'volume';
  GES_META_VOLUME_DEFAULT = 1.0;
  GES_META_FORMAT_VERSION = 'format-version';
  GES_META_MARKER_COLOR = 'marker-color';

type
  TGESMetaContainerInterface = record
    parent_iface: TGTypeInterface;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESMetaContainerInterface = ^TGESMetaContainerInterface;

  TGESMetaContainer = record
  end;
  PGESMetaContainer = ^TGESMetaContainer;

function ges_meta_container_get_type: TGType; cdecl; external libges;
function ges_meta_container_set_boolean(container: PGESMetaContainer; meta_item: Pgchar; Value: Tgboolean): Tgboolean; cdecl; external libges;
function ges_meta_container_set_int(container: PGESMetaContainer; meta_item: Pgchar; Value: Tgint): Tgboolean; cdecl; external libges;
function ges_meta_container_set_uint(container: PGESMetaContainer; meta_item: Pgchar; Value: Tguint): Tgboolean; cdecl; external libges;
function ges_meta_container_set_int64(container: PGESMetaContainer; meta_item: Pgchar; Value: Tgint64): Tgboolean; cdecl; external libges;
function ges_meta_container_set_uint64(container: PGESMetaContainer; meta_item: Pgchar; Value: Tguint64): Tgboolean; cdecl; external libges;
function ges_meta_container_set_float(container: PGESMetaContainer; meta_item: Pgchar; Value: Tgfloat): Tgboolean; cdecl; external libges;
function ges_meta_container_set_double(container: PGESMetaContainer; meta_item: Pgchar; Value: Tgdouble): Tgboolean; cdecl; external libges;
function ges_meta_container_set_date(container: PGESMetaContainer; meta_item: Pgchar; Value: PGDate): Tgboolean; cdecl; external libges;
function ges_meta_container_set_date_time(container: PGESMetaContainer; meta_item: Pgchar; Value: PGstDateTime): Tgboolean; cdecl; external libges;
function ges_meta_container_set_string(container: PGESMetaContainer; meta_item: Pgchar; Value: Pgchar): Tgboolean; cdecl; external libges;
function ges_meta_container_set_meta(container: PGESMetaContainer; meta_item: Pgchar; Value: PGValue): Tgboolean; cdecl; external libges;
function ges_meta_container_set_marker_list(container: PGESMetaContainer; meta_item: Pgchar; list: PGESMarkerList): Tgboolean; cdecl; external libges;
function ges_meta_container_register_static_meta(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; _type: TGType): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta_boolean(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: Tgboolean): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta_int(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: Tgint): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta_uint(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: Tguint): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta_int64(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: Tgint64): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta_uint64(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: Tguint64): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta_float(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: Tgfloat): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta_double(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: Tgdouble): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta_date(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: PGDate): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta_date_time(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: PGstDateTime): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta_string(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: Pgchar): Tgboolean; cdecl; external libges;
function ges_meta_container_register_meta(container: PGESMetaContainer; flags: TGESMetaFlag; meta_item: Pgchar; Value: PGValue): Tgboolean; cdecl; external libges;
function ges_meta_container_check_meta_registered(container: PGESMetaContainer; meta_item: Pgchar; flags: PGESMetaFlag; _type: PGType): Tgboolean; cdecl; external libges;
function ges_meta_container_get_boolean(container: PGESMetaContainer; meta_item: Pgchar; dest: Pgboolean): Tgboolean; cdecl; external libges;
function ges_meta_container_get_int(container: PGESMetaContainer; meta_item: Pgchar; dest: Pgint): Tgboolean; cdecl; external libges;
function ges_meta_container_get_uint(container: PGESMetaContainer; meta_item: Pgchar; dest: Pguint): Tgboolean; cdecl; external libges;
function ges_meta_container_get_int64(container: PGESMetaContainer; meta_item: Pgchar; dest: Pgint64): Tgboolean; cdecl; external libges;
function ges_meta_container_get_uint64(container: PGESMetaContainer; meta_item: Pgchar; dest: Pguint64): Tgboolean; cdecl; external libges;
function ges_meta_container_get_float(container: PGESMetaContainer; meta_item: Pgchar; dest: Pgfloat): Tgboolean; cdecl; external libges;
function ges_meta_container_get_double(container: PGESMetaContainer; meta_item: Pgchar; dest: Pgdouble): Tgboolean; cdecl; external libges;
function ges_meta_container_get_date(container: PGESMetaContainer; meta_item: Pgchar; dest: PPGDate): Tgboolean; cdecl; external libges;
function ges_meta_container_get_date_time(container: PGESMetaContainer; meta_item: Pgchar; dest: PPGstDateTime): Tgboolean; cdecl; external libges;
function ges_meta_container_get_string(container: PGESMetaContainer; meta_item: Pgchar): Pgchar; cdecl; external libges;
function ges_meta_container_get_marker_list(container: PGESMetaContainer; key: Pgchar): PGESMarkerList; cdecl; external libges;
function ges_meta_container_get_meta(container: PGESMetaContainer; key: Pgchar): PGValue; cdecl; external libges;

type
  TGESMetaForeachFunc = procedure(container: PGESMetaContainer; key: Pgchar; Value: PGValue; user_data: Tgpointer); cdecl;

procedure ges_meta_container_foreach(container: PGESMetaContainer; func: TGESMetaForeachFunc; user_data: Tgpointer); cdecl; external libges;
function ges_meta_container_metas_to_string(container: PGESMetaContainer): Pgchar; cdecl; external libges;
function ges_meta_container_add_metas_from_string(container: PGESMetaContainer; str: Pgchar): Tgboolean; cdecl; external libges;

//function GES_META_CONTAINER_GET_INTERFACE : Tinst;
function GES_META_CONTAINER_GET_INTERFACE(inst: Pointer): Pointer;

// === Konventiert am: 13-12-24 13:45:26 ===

function GES_TYPE_META_CONTAINER: TGType;
function GES_META_CONTAINER(obj: Pointer): PGESMetaContainer;
function GES_IS_META_CONTAINER(obj: Pointer): Tgboolean;
function GES_META_CONTAINER_GET_IFACE(obj: Pointer): PGESMetaContainerInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_META_CONTAINER: TGType;
begin
  Result := ges_meta_container_get_type;
end;

function GES_META_CONTAINER(obj: Pointer): PGESMetaContainer;
begin
  Result := PGESMetaContainer(g_type_check_instance_cast(obj, GES_TYPE_META_CONTAINER));
end;

function GES_IS_META_CONTAINER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_META_CONTAINER);
end;

function GES_META_CONTAINER_GET_IFACE(obj: Pointer): PGESMetaContainerInterface;
begin
  Result := g_type_interface_peek(obj, GES_TYPE_META_CONTAINER);
end;

// ====

function GES_META_CONTAINER_GET_INTERFACE(inst: Pointer): Pointer;
begin
  GES_META_CONTAINER_GET_INTERFACE := G_TYPE_INSTANCE_GET_INTERFACE(inst, GES_TYPE_META_CONTAINER);
end;

//function GES_META_CONTAINER_GET_INTERFACE : Tinst;
//7/  begin
//    GES_META_CONTAINER_GET_INTERFACE:=Tinst(G_TYPE_INSTANCE_GET_INTERFACE(inst,GES_TYPE_META_CONTAINER,GESMetaContainerInterface));
//end;


{$ENDIF read_implementation}
