
{$IFDEF read_interface}

type
  TGstNetTimeProviderPrivate = record
  end;
  PGstNetTimeProviderPrivate = ^TGstNetTimeProviderPrivate;

  TGstNetTimeProvider = record
    parent: TGstObject;
    priv: PGstNetTimeProviderPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstNetTimeProvider = ^TGstNetTimeProvider;

  TGstNetTimeProviderClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstNetTimeProviderClass = ^TGstNetTimeProviderClass;


function gst_net_time_provider_get_type: TGType; cdecl; external libgstnet;
function gst_net_time_provider_new(clock: PGstClock; address: Pgchar; port: Tgint): PGstNetTimeProvider; cdecl; external libgstnet;

// === Konventiert am: 11-10-24 14:28:33 ===

function GST_TYPE_NET_TIME_PROVIDER: TGType;
function GST_NET_TIME_PROVIDER(obj: Pointer): PGstNetTimeProvider;
function GST_NET_TIME_PROVIDER_CLASS(klass: Pointer): PGstNetTimeProviderClass;
function GST_IS_NET_TIME_PROVIDER(obj: Pointer): Tgboolean;
function GST_IS_NET_TIME_PROVIDER_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_NET_TIME_PROVIDER: TGType;
begin
  GST_TYPE_NET_TIME_PROVIDER := gst_net_time_provider_get_type;
end;

function GST_NET_TIME_PROVIDER(obj: Pointer): PGstNetTimeProvider;
begin
  Result := PGstNetTimeProvider(g_type_check_instance_cast(obj, GST_TYPE_NET_TIME_PROVIDER));
end;

function GST_NET_TIME_PROVIDER_CLASS(klass: Pointer): PGstNetTimeProviderClass;
begin
  Result := PGstNetTimeProviderClass(g_type_check_class_cast(klass, GST_TYPE_NET_TIME_PROVIDER));
end;

function GST_IS_NET_TIME_PROVIDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_NET_TIME_PROVIDER);
end;

function GST_IS_NET_TIME_PROVIDER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_NET_TIME_PROVIDER);
end;



{$ENDIF read_implementation}
