

  {$IFDEF read_enum}
type
  PGstRTSPAddressPoolResult = ^TGstRTSPAddressPoolResult;
  TGstRTSPAddressPoolResult = longint;
const
  GST_RTSP_ADDRESS_POOL_OK = 0;
  GST_RTSP_ADDRESS_POOL_EINVAL = -(1);
  GST_RTSP_ADDRESS_POOL_ERESERVED = -(2);
  GST_RTSP_ADDRESS_POOL_ERANGE = -(3);
  GST_RTSP_ADDRESS_POOL_ELAST = -(4);

type
  PGstRTSPAddressFlags = ^TGstRTSPAddressFlags;
  TGstRTSPAddressFlags = longint;
const
  GST_RTSP_ADDRESS_FLAG_NONE = 0;
  GST_RTSP_ADDRESS_FLAG_IPV4 = 1 shl 0;
  GST_RTSP_ADDRESS_FLAG_IPV6 = 1 shl 1;
  GST_RTSP_ADDRESS_FLAG_EVEN_PORT = 1 shl 2;
  GST_RTSP_ADDRESS_FLAG_MULTICAST = 1 shl 3;
  GST_RTSP_ADDRESS_FLAG_UNICAST = 1 shl 4;

const
  GST_RTSP_ADDRESS_POOL_ANY_IPV4 = '0.0.0.0';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstRTSPAddressPoolPrivate = type Pointer;

  PGstRTSPAddressPool = ^TGstRTSPAddressPool;
  TGstRTSPAddressPool = record
    parent: TGObject;
    priv: PGstRTSPAddressPoolPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPAddressPoolClass = ^TGstRTSPAddressPoolClass;
  TGstRTSPAddressPoolClass = record
    parent_class: TGObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PPGstRTSPAddress = ^PGstRTSPAddress;
  PGstRTSPAddress = ^TGstRTSPAddress;
  TGstRTSPAddress = record
    pool: PGstRTSPAddressPool;
    address: Pgchar;
    port: Tguint16;
    n_ports: Tgint;
    ttl: Tguint8;
    priv: Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_address_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_address_copy(addr: PGstRTSPAddress): PGstRTSPAddress; cdecl; external libgstrtsp;
procedure gst_rtsp_address_free(addr: PGstRTSPAddress); cdecl; external libgstrtsp;
function gst_rtsp_address_pool_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_address_pool_new: PGstRTSPAddressPool; cdecl; external libgstrtsp;
procedure gst_rtsp_address_pool_clear(pool: PGstRTSPAddressPool); cdecl; external libgstrtsp;
procedure gst_rtsp_address_pool_dump(pool: PGstRTSPAddressPool); cdecl; external libgstrtsp;
function gst_rtsp_address_pool_add_range(pool: PGstRTSPAddressPool; min_address: Pgchar; max_address: Pgchar; min_port: Tguint16; max_port: Tguint16;
  ttl: Tguint8): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_address_pool_acquire_address(pool: PGstRTSPAddressPool; flags: TGstRTSPAddressFlags; n_ports: Tgint): PGstRTSPAddress; cdecl; external libgstrtsp;
function gst_rtsp_address_pool_reserve_address(pool: PGstRTSPAddressPool; ip_address: Pgchar; port: Tguint; n_ports: Tguint; ttl: Tguint;
  address: PPGstRTSPAddress): TGstRTSPAddressPoolResult; cdecl; external libgstrtsp;
function gst_rtsp_address_pool_has_unicast_addresses(pool: PGstRTSPAddressPool): Tgboolean; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:45:54 ===

function GST_TYPE_RTSP_ADDRESS_POOL: TGType;
function GST_RTSP_ADDRESS_POOL(obj: Pointer): PGstRTSPAddressPool;
function GST_RTSP_ADDRESS_POOL_CLASS(klass: Pointer): PGstRTSPAddressPoolClass;
function GST_IS_RTSP_ADDRESS_POOL(obj: Pointer): Tgboolean;
function GST_IS_RTSP_ADDRESS_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_ADDRESS_POOL_GET_CLASS(obj: Pointer): PGstRTSPAddressPoolClass;
function GST_RTSP_ADDRESS_POOL_CAST(obj: Pointer): PGstRTSPAddressPool;
function GST_RTSP_ADDRESS_POOL_CLASS_CAST(klass: Pointer): PGstRTSPAddressPoolClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_ADDRESS_POOL: TGType;
begin
  Result := gst_rtsp_address_pool_get_type;
end;

function GST_RTSP_ADDRESS_POOL(obj: Pointer): PGstRTSPAddressPool;
begin
  Result := PGstRTSPAddressPool(g_type_check_instance_cast(obj, GST_TYPE_RTSP_ADDRESS_POOL));
end;

function GST_RTSP_ADDRESS_POOL_CLASS(klass: Pointer): PGstRTSPAddressPoolClass;
begin
  Result := PGstRTSPAddressPoolClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_ADDRESS_POOL));
end;

function GST_IS_RTSP_ADDRESS_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_ADDRESS_POOL);
end;

function GST_IS_RTSP_ADDRESS_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_ADDRESS_POOL);
end;

function GST_RTSP_ADDRESS_POOL_GET_CLASS(obj: Pointer): PGstRTSPAddressPoolClass;
begin
  Result := PGstRTSPAddressPoolClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_ADDRESS_POOL_CAST(obj: Pointer): PGstRTSPAddressPool;
begin
  Result := PGstRTSPAddressPool(obj);
end;

function GST_RTSP_ADDRESS_POOL_CLASS_CAST(klass: Pointer): PGstRTSPAddressPoolClass;
begin
  Result := PGstRTSPAddressPoolClass(klass);
end;

{$ENDIF read_implementation}
