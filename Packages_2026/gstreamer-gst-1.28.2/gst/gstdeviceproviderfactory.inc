

  {$IFDEF read_struct}
type
  PGstDeviceProviderFactory = type Pointer;
  PGstDeviceProviderFactoryClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_device_provider_factory_get_type: TGType; cdecl; external libgstreamer;
function gst_device_provider_factory_find(name: Pgchar): PGstDeviceProviderFactory; cdecl; external libgstreamer;
function gst_device_provider_factory_get_device_provider_type(factory: PGstDeviceProviderFactory): TGType; cdecl; external libgstreamer;
function gst_device_provider_factory_get_metadata(factory: PGstDeviceProviderFactory; key: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_device_provider_factory_get_metadata_keys(factory: PGstDeviceProviderFactory): PPgchar; cdecl; external libgstreamer;
function gst_device_provider_factory_get(factory: PGstDeviceProviderFactory): PGstDeviceProvider; cdecl; external libgstreamer;
function gst_device_provider_factory_get_by_name(factoryname: Pgchar): PGstDeviceProvider; cdecl; external libgstreamer;
function gst_device_provider_register(plugin: PGstPlugin; name: Pgchar; rank: Tguint; _type: TGType): Tgboolean; cdecl; external libgstreamer;
function gst_device_provider_factory_has_classesv(factory: PGstDeviceProviderFactory; classes: PPgchar): Tgboolean; cdecl; external libgstreamer;
function gst_device_provider_factory_has_classes(factory: PGstDeviceProviderFactory; classes: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_device_provider_factory_list_get_device_providers(minrank: TGstRank): PGList; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 11:00:02 ===

function GST_DEVICE_PROVIDER_FACTORY_CAST(obj: Pointer): PGstDeviceProviderFactory;
function GST_TYPE_DEVICE_PROVIDER_FACTORY: TGType;
function GST_DEVICE_PROVIDER_FACTORY(obj: Pointer): PGstDeviceProviderFactory;
function GST_DEVICE_PROVIDER_FACTORY_CLASS(klass: Pointer): PGstDeviceProviderFactoryClass;
function GST_IS_DEVICE_PROVIDER_FACTORY(obj: Pointer): Tgboolean;
function GST_IS_DEVICE_PROVIDER_FACTORY_CLASS(klass: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_DEVICE_PROVIDER_FACTORY_CAST(obj: Pointer): PGstDeviceProviderFactory;
begin
  GST_DEVICE_PROVIDER_FACTORY_CAST := PGstDeviceProviderFactory(obj);
end;

function GST_TYPE_DEVICE_PROVIDER_FACTORY: TGType;
begin
  GST_TYPE_DEVICE_PROVIDER_FACTORY := gst_device_provider_factory_get_type;
end;

function GST_DEVICE_PROVIDER_FACTORY(obj: Pointer): PGstDeviceProviderFactory;
begin
  Result := PGstDeviceProviderFactory(g_type_check_instance_cast(obj, GST_TYPE_DEVICE_PROVIDER_FACTORY));
end;

function GST_DEVICE_PROVIDER_FACTORY_CLASS(klass: Pointer): PGstDeviceProviderFactoryClass;
begin
  Result := PGstDeviceProviderFactoryClass(g_type_check_class_cast(klass, GST_TYPE_DEVICE_PROVIDER_FACTORY));
end;

function GST_IS_DEVICE_PROVIDER_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DEVICE_PROVIDER_FACTORY);
end;

function GST_IS_DEVICE_PROVIDER_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_DEVICE_PROVIDER_FACTORY);
end;

{$ENDIF read_implementation}
