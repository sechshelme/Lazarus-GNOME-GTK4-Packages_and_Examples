{$IFDEF read_interface}


const
  GST_HIP_DEVICE_CONTEXT_TYPE = 'gst.hip.device';

type
  PGstHipDevicePrivate = type Pointer;

  PPGstHipDevice = ^PGstHipDevice;
  PGstHipDevice = ^TGstHipDevice;
  TGstHipDevice = record
    obj: TGstObject;
    priv: PGstHipDevicePrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstHipDeviceClass = ^TGstHipDeviceClass;
  TGstHipDeviceClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


function gst_hip_device_get_type: TGType; cdecl; external libgsthip;
function gst_hip_device_new(vendor: TGstHipVendor; device_id: Tguint): PGstHipDevice; cdecl; external libgsthip;
function gst_hip_device_set_current(device: PGstHipDevice): Tgboolean; cdecl; external libgsthip;
function gst_hip_device_get_attribute(device: PGstHipDevice; attr: ThipDeviceAttribute_t; value: Pgint): ThipError_t; cdecl; external libgsthip;
function gst_hip_device_is_equal(device1: PGstHipDevice; device2: PGstHipDevice): Tgboolean; cdecl; external libgsthip;
function gst_hip_device_get_vendor(device: PGstHipDevice): TGstHipVendor; cdecl; external libgsthip;
function gst_hip_device_get_device_id(device: PGstHipDevice): Tguint; cdecl; external libgsthip;
function gst_hip_device_get_stream(device: PGstHipDevice): PGstHipStream; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:16:56 ===

function GST_TYPE_HIP_DEVICE: TGType;
function GST_HIP_DEVICE(obj: Pointer): PGstHipDevice;
function GST_HIP_DEVICE_CLASS(klass: Pointer): PGstHipDeviceClass;
function GST_HIP_DEVICE_GET_CLASS(obj: Pointer): PGstHipDeviceClass;
function GST_IS_HIP_DEVICE(obj: Pointer): Tgboolean;
function GST_IS_HIP_DEVICE_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_HIP_DEVICE: TGType;
begin
  Result := gst_hip_device_get_type;
end;

function GST_HIP_DEVICE(obj: Pointer): PGstHipDevice;
begin
  Result := PGstHipDevice(g_type_check_instance_cast(obj, GST_TYPE_HIP_DEVICE));
end;

function GST_HIP_DEVICE_CLASS(klass: Pointer): PGstHipDeviceClass;
begin
  Result := PGstHipDeviceClass(g_type_check_class_cast(klass, GST_TYPE_HIP_DEVICE));
end;

function GST_HIP_DEVICE_GET_CLASS(obj: Pointer): PGstHipDeviceClass;
begin
  Result := PGstHipDeviceClass(PGTypeInstance(obj)^.g_class);
end;

function GST_IS_HIP_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_HIP_DEVICE);
end;

function GST_IS_HIP_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_HIP_DEVICE);
end;

{$ENDIF read_implementation}
