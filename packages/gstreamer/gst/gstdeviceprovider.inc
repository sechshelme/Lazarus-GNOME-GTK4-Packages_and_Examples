/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstDeviceProviderPrivate = record
  end;
  PGstDeviceProviderPrivate = ^TGstDeviceProviderPrivate;

  TGstDeviceProvider = record
    parent: TGstObject;
    devices: PGList;
    priv: PGstDeviceProviderPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDeviceProvider = ^TGstDeviceProvider;

  TGstDeviceProviderClass = record
    parent_class: TGstObjectClass;
    factory: PGstDeviceProviderFactory;
    probe: function(provider: PGstDeviceProvider): PGList; cdecl;
    start: function(provider: PGstDeviceProvider): Tgboolean; cdecl;
    stop: procedure(provider: PGstDeviceProvider); cdecl;
    metadata: Tgpointer;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDeviceProviderClass = ^TGstDeviceProviderClass;

function gst_device_provider_get_type: TGType; cdecl; external libgstreamer;
function gst_device_provider_get_devices(provider: PGstDeviceProvider): PGList; cdecl; external libgstreamer;
function gst_device_provider_start(provider: PGstDeviceProvider): Tgboolean; cdecl; external libgstreamer;
procedure gst_device_provider_stop(provider: PGstDeviceProvider); cdecl; external libgstreamer;
function gst_device_provider_can_monitor(provider: PGstDeviceProvider): Tgboolean; cdecl; external libgstreamer;
function gst_device_provider_get_bus(provider: PGstDeviceProvider): PGstBus; cdecl; external libgstreamer;
procedure gst_device_provider_device_add(provider: PGstDeviceProvider; device: PGstDevice); cdecl; external libgstreamer;
procedure gst_device_provider_device_remove(provider: PGstDeviceProvider; device: PGstDevice); cdecl; external libgstreamer;
function gst_device_provider_get_hidden_providers(provider: PGstDeviceProvider): PPgchar; cdecl; external libgstreamer;
procedure gst_device_provider_hide_provider(provider: PGstDeviceProvider; Name: Pgchar); cdecl; external libgstreamer;
procedure gst_device_provider_unhide_provider(provider: PGstDeviceProvider; Name: Pgchar); cdecl; external libgstreamer;
function gst_device_provider_get_metadata(provider: PGstDeviceProvider; key: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_device_provider_is_started(provider: PGstDeviceProvider): Tgboolean; cdecl; external libgstreamer;
procedure gst_device_provider_class_set_metadata(klass: PGstDeviceProviderClass; longname: Pgchar; classification: Pgchar; description: Pgchar; author: Pgchar); cdecl; external libgstreamer;
procedure gst_device_provider_class_set_static_metadata(klass: PGstDeviceProviderClass; longname: Pgchar; classification: Pgchar; description: Pgchar; author: Pgchar); cdecl; external libgstreamer;
procedure gst_device_provider_class_add_metadata(klass: PGstDeviceProviderClass; key: Pgchar; Value: Pgchar); cdecl; external libgstreamer;
procedure gst_device_provider_class_add_static_metadata(klass: PGstDeviceProviderClass; key: Pgchar; Value: Pgchar); cdecl; external libgstreamer;
function gst_device_provider_class_get_metadata(klass: PGstDeviceProviderClass; key: Pgchar): Pgchar; cdecl; external libgstreamer;
procedure gst_device_provider_device_changed(provider: PGstDeviceProvider; device: PGstDevice; changed_device: PGstDevice); cdecl; external libgstreamer;
function gst_device_provider_get_factory(provider: PGstDeviceProvider): PGstDeviceProviderFactory; cdecl; external libgstreamer;

function GST_DEVICE_PROVIDER_CAST(obj: Pointer): PGstDeviceProvider;

// === Konventiert am: 16-9-24 17:32:03 ===

function GST_TYPE_DEVICE_PROVIDER: TGType;
function GST_DEVICE_PROVIDER(obj: Pointer): PGstDeviceProvider;
function GST_DEVICE_PROVIDER_CLASS(klass: Pointer): PGstDeviceProviderClass;
function GST_IS_DEVICE_PROVIDER(obj: Pointer): Tgboolean;
function GST_IS_DEVICE_PROVIDER_CLASS(klass: Pointer): Tgboolean;
function GST_DEVICE_PROVIDER_GET_CLASS(obj: Pointer): PGstDeviceProviderClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_DEVICE_PROVIDER: TGType;
begin
  GST_TYPE_DEVICE_PROVIDER := gst_device_provider_get_type;
end;

function GST_DEVICE_PROVIDER(obj: Pointer): PGstDeviceProvider;
begin
  Result := PGstDeviceProvider(g_type_check_instance_cast(obj, GST_TYPE_DEVICE_PROVIDER));
end;

function GST_DEVICE_PROVIDER_CLASS(klass: Pointer): PGstDeviceProviderClass;
begin
  Result := PGstDeviceProviderClass(g_type_check_class_cast(klass, GST_TYPE_DEVICE_PROVIDER));
end;

function GST_IS_DEVICE_PROVIDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DEVICE_PROVIDER);
end;

function GST_IS_DEVICE_PROVIDER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_DEVICE_PROVIDER);
end;

function GST_DEVICE_PROVIDER_GET_CLASS(obj: Pointer): PGstDeviceProviderClass;
begin
  Result := PGstDeviceProviderClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_DEVICE_PROVIDER_CAST(obj: Pointer): PGstDeviceProvider;
begin
  GST_DEVICE_PROVIDER_CAST := PGstDeviceProvider(obj);
end;


{$ENDIF read_implementation}
