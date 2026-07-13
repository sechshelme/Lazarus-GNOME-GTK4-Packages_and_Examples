

  {$IFDEF read_struct}
type
  PGstDevicePrivate = type Pointer;

  PPGstDevice = ^PGstDevice;
  PGstDevice = ^TGstDevice;
  TGstDevice = record
    parent: TGstObject;
    priv: PGstDevicePrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstDeviceClass = ^TGstDeviceClass;
  TGstDeviceClass = record
    parent_class: TGstObjectClass;
    create_element: function(device: PGstDevice; name: Pgchar): Pointer {PGstElement}; cdecl;
    reconfigure_element: function(device: PGstDevice; element: Pointer {PGstElement}): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_device_get_type: TGType; cdecl; external libgstreamer;
function gst_device_create_element(device: PGstDevice; name: Pgchar): PGstElement; cdecl; external libgstreamer;
function gst_device_get_caps(device: PGstDevice): PGstCaps; cdecl; external libgstreamer;
function gst_device_get_display_name(device: PGstDevice): Pgchar; cdecl; external libgstreamer;
function gst_device_get_device_class(device: PGstDevice): Pgchar; cdecl; external libgstreamer;
function gst_device_get_properties(device: PGstDevice): PGstStructure; cdecl; external libgstreamer;
function gst_device_reconfigure_element(device: PGstDevice; element: PGstElement): Tgboolean; cdecl; external libgstreamer;
function gst_device_has_classesv(device: PGstDevice; classes: PPgchar): Tgboolean; cdecl; external libgstreamer;
function gst_device_has_classes(device: PGstDevice; classes: Pgchar): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 11:00:24 ===

function GST_TYPE_DEVICE: TGType;
function GST_DEVICE(obj: Pointer): PGstDevice;
function GST_DEVICE_CLASS(klass: Pointer): PGstDeviceClass;
function GST_IS_DEVICE(obj: Pointer): Tgboolean;
function GST_IS_DEVICE_CLASS(klass: Pointer): Tgboolean;
function GST_DEVICE_GET_CLASS(obj: Pointer): PGstDeviceClass;
{$ENDIF read_function}



{$IFDEF read_implementation}


function GST_TYPE_DEVICE: TGType;
begin
  GST_TYPE_DEVICE := gst_device_get_type;
end;

function GST_DEVICE(obj: Pointer): PGstDevice;
begin
  Result := PGstDevice(g_type_check_instance_cast(obj, GST_TYPE_DEVICE));
end;

function GST_DEVICE_CLASS(klass: Pointer): PGstDeviceClass;
begin
  Result := PGstDeviceClass(g_type_check_class_cast(klass, GST_TYPE_DEVICE));
end;

function GST_IS_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DEVICE);
end;

function GST_IS_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_DEVICE);
end;

function GST_DEVICE_GET_CLASS(obj: Pointer): PGstDeviceClass;
begin
  Result := PGstDeviceClass(PGTypeInstance(obj)^.g_class);
end;

function GST_DEVICE_CAST(obj: Pointer): PGstDevice;
begin
  GST_DEVICE_CAST := PGstDevice(obj);
end;

{$ENDIF read_implementation}
