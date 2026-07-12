unit gstdevicemonitor;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstobject;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstDeviceMonitorPrivate = type Pointer;

  PGstDeviceMonitor = ^TGstDeviceMonitor;
  TGstDeviceMonitor = record
    parent: TGstObject;
    priv: PGstDeviceMonitorPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstDeviceMonitorClass = ^TGstDeviceMonitorClass;
  TGstDeviceMonitorClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_device_monitor_get_type: TGType; cdecl; external libgstreamer;
function gst_device_monitor_new: PGstDeviceMonitor; cdecl; external libgstreamer;
function gst_device_monitor_get_bus(monitor: PGstDeviceMonitor): PGstBus; cdecl; external libgstreamer;
function gst_device_monitor_get_devices(monitor: PGstDeviceMonitor): PGList; cdecl; external libgstreamer;
function gst_device_monitor_start(monitor: PGstDeviceMonitor): Tgboolean; cdecl; external libgstreamer;
procedure gst_device_monitor_stop(monitor: PGstDeviceMonitor); cdecl; external libgstreamer;
function gst_device_monitor_add_filter(monitor: PGstDeviceMonitor; classes: Pgchar; caps: PGstCaps): Tguint; cdecl; external libgstreamer;
function gst_device_monitor_remove_filter(monitor: PGstDeviceMonitor; filter_id: Tguint): Tgboolean; cdecl; external libgstreamer;
function gst_device_monitor_get_providers(monitor: PGstDeviceMonitor): PPgchar; cdecl; external libgstreamer;
procedure gst_device_monitor_set_show_all_devices(monitor: PGstDeviceMonitor; show_all: Tgboolean); cdecl; external libgstreamer;
function gst_device_monitor_get_show_all_devices(monitor: PGstDeviceMonitor): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 11:00:19 ===

function GST_DEVICE_MONITOR_CAST(obj: Pointer): PGstDeviceMonitor;
function GST_TYPE_DEVICE_MONITOR: TGType;
function GST_DEVICE_MONITOR(obj: Pointer): PGstDeviceMonitor;
function GST_DEVICE_MONITOR_CLASS(klass: Pointer): PGstDeviceMonitorClass;
function GST_IS_DEVICE_MONITOR(obj: Pointer): Tgboolean;
function GST_IS_DEVICE_MONITOR_CLASS(klass: Pointer): Tgboolean;
function GST_DEVICE_MONITOR_GET_CLASS(obj: Pointer): PGstDeviceMonitorClass;
{$ENDIF read_function}

implementation

function GST_TYPE_DEVICE_MONITOR: TGType;
begin
  GST_TYPE_DEVICE_MONITOR := gst_device_monitor_get_type;
end;

function GST_DEVICE_MONITOR(obj: Pointer): PGstDeviceMonitor;
begin
  Result := PGstDeviceMonitor(g_type_check_instance_cast(obj, GST_TYPE_DEVICE_MONITOR));
end;

function GST_DEVICE_MONITOR_CLASS(klass: Pointer): PGstDeviceMonitorClass;
begin
  Result := PGstDeviceMonitorClass(g_type_check_class_cast(klass, GST_TYPE_DEVICE_MONITOR));
end;

function GST_IS_DEVICE_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DEVICE_MONITOR);
end;

function GST_IS_DEVICE_MONITOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_DEVICE_MONITOR);
end;

function GST_DEVICE_MONITOR_GET_CLASS(obj: Pointer): PGstDeviceMonitorClass;
begin
  Result := PGstDeviceMonitorClass(PGTypeInstance(obj)^.g_class);
end;


function GST_DEVICE_MONITOR_CAST(obj: Pointer): PGstDeviceMonitor;
begin
  GST_DEVICE_MONITOR_CAST := PGstDeviceMonitor(obj);
end;

end.
