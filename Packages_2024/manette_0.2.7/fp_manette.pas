unit fp_manette;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
//  libmanette = 'manette-0.2';   // Es könnte  manette-1.x werden, in git ist es schon so !
  libmanette = 'manette-1.0';   // Es könnte  manette-1.x werden, in git ist es schon so !
  {$ENDIF}

  {$IFDEF Windows}
  libmanette = 'libmanette-0.2-0.dll'; // ????
  {$ENDIF}

  // ==== /usr/include/libmanette/manette-device.h

type
  TManetteDevice = record
  end;
  PManetteDevice = ^TManetteDevice;
  PPManetteDevice = ^PManetteDevice;

  TManetteDeviceClass = record
    parent_class: TGObjectClass;
  end;
  PManetteDeviceClass = ^TManetteDeviceClass;

function manette_device_get_type: TGType; cdecl; external libmanette;
function manette_device_has_input(self: PManetteDevice; _type: Tguint; code: Tguint): Tgboolean; cdecl; external libmanette;
function manette_device_get_name(self: PManetteDevice): Pgchar; cdecl; external libmanette;
function manette_device_has_user_mapping(self: PManetteDevice): Tgboolean; cdecl; external libmanette;
procedure manette_device_save_user_mapping(self: PManetteDevice; mapping_string: Pgchar); cdecl; external libmanette;
procedure manette_device_remove_user_mapping(self: PManetteDevice); cdecl; external libmanette;
function manette_device_has_rumble(self: PManetteDevice): Tgboolean; cdecl; external libmanette;
function manette_device_rumble(self: PManetteDevice; strong_magnitude: Tguint16; weak_magnitude: Tguint16; milliseconds: Tguint16): Tgboolean; cdecl; external libmanette;

function MANETTE_TYPE_DEVICE: TGType;
function MANETTE_DEVICE(obj: Pointer): PManetteDevice;
function MANETTE_IS_DEVICE(obj: Pointer): Tgboolean;


// ==== /usr/include/libmanette/manette-event.h

function MANETTE_TYPE_EVENT_TYPE: TGType;

type
  PManetteEvent = type Pointer;

type
  PManetteEventType = ^TManetteEventType;
  TManetteEventType = longint;

const
  MANETTE_EVENT_NOTHING = -1;
  MANETTE_EVENT_BUTTON_PRESS = 0;
  MANETTE_EVENT_BUTTON_RELEASE = 1;
  MANETTE_EVENT_ABSOLUTE = 2;
  MANETTE_EVENT_HAT = 3;
  MANETTE_LAST_EVENT = 4;

function manette_event_get_type: TGType; cdecl; external libmanette;
function manette_event_type_get_type: TGType; cdecl; external libmanette;
function manette_event_copy(self: PManetteEvent): PManetteEvent; cdecl; external libmanette;
procedure manette_event_free(self: PManetteEvent); cdecl; external libmanette;
function manette_event_get_event_type(self: PManetteEvent): TManetteEventType; cdecl; external libmanette;
function manette_event_get_time(self: PManetteEvent): Tguint32; cdecl; external libmanette;
function manette_event_get_device(self: PManetteEvent): PManetteDevice; cdecl; external libmanette;
function manette_event_get_hardware_type(self: PManetteEvent): Tguint16; cdecl; external libmanette;
function manette_event_get_hardware_code(self: PManetteEvent): Tguint16; cdecl; external libmanette;
function manette_event_get_hardware_value(self: PManetteEvent): Tguint16; cdecl; external libmanette;
function manette_event_get_hardware_index(self: PManetteEvent): Tguint16; cdecl; external libmanette;
function manette_event_get_button(self: PManetteEvent; button: Pguint16): Tgboolean; cdecl; external libmanette;
function manette_event_get_absolute(self: PManetteEvent; axis: Pguint16; value: Pgdouble): Tgboolean; cdecl; external libmanette;
function manette_event_get_hat(self: PManetteEvent; axis: Pguint16; value: Pgint8): Tgboolean; cdecl; external libmanette;

function MANETTE_TYPE_EVENT: TGType;


// ==== /usr/include/libmanette/manette-monitor-iter.h

type
  PManetteMonitorIter = type Pointer;

function manette_monitor_iter_get_type: TGType; cdecl; external libmanette;
function manette_monitor_iter_next(self: PManetteMonitorIter; device: PPManetteDevice): Tgboolean; cdecl; external libmanette;
procedure manette_monitor_iter_free(self: PManetteMonitorIter); cdecl; external libmanette;

function MANETTE_TYPE_MONITOR_ITER: TGType;


// ==== /usr/include/libmanette/manette-monitor.h

type
  TManetteMonitor = record
  end;
  PManetteMonitor = ^TManetteMonitor;

  TManetteMonitorClass = record
    parent_class: TGObjectClass;
  end;
  PManetteMonitorClass = ^TManetteMonitorClass;

function manette_monitor_get_type: TGType; cdecl; external libmanette;
function manette_monitor_new: PManetteMonitor; cdecl; external libmanette;
function manette_monitor_iterate(self: PManetteMonitor): PManetteMonitorIter; cdecl; external libmanette;

function MANETTE_TYPE_MONITOR: TGType;
function MANETTE_MONITOR(obj: Pointer): PManetteMonitor;
function MANETTE_IS_MONITOR(obj: Pointer): Tgboolean;


// ==== /usr/include/libmanette/manette-version.h

const
  LIBMANETTE_MAJOR_VERSION = 0;
  LIBMANETTE_MINOR_VERSION = 2;
  LIBMANETTE_MICRO_VERSION = 7;
  LIBMANETTE_VERSION_S = '0.2.7';

function LIBMANETTE_ENCODE_VERSION(major, minor, micro: longint): longint;
function LIBMANETTE_VERSION_HEX: longint;
function LIBMANETTE_CHECK_VERSION(major, minor, micro: longint): boolean; inline;

implementation

function MANETTE_TYPE_DEVICE: TGType;
begin
  Result := manette_device_get_type;
end;

function MANETTE_DEVICE(obj: Pointer): PManetteDevice;
begin
  Result := PManetteDevice(g_type_check_instance_cast(obj, MANETTE_TYPE_DEVICE));
end;

function MANETTE_IS_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, MANETTE_TYPE_DEVICE);
end;

// ====

function MANETTE_TYPE_EVENT: TGType;
begin
  MANETTE_TYPE_EVENT := manette_event_get_type;
end;

function MANETTE_TYPE_EVENT_TYPE: TGType;
begin
  MANETTE_TYPE_EVENT_TYPE := manette_event_type_get_type;
end;

// ====

function MANETTE_TYPE_MONITOR: TGType;
begin
  Result := manette_monitor_get_type;
end;

function MANETTE_MONITOR(obj: Pointer): PManetteMonitor;
begin
  Result := PManetteMonitor(g_type_check_instance_cast(obj, MANETTE_TYPE_MONITOR));
end;

function MANETTE_IS_MONITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, MANETTE_TYPE_MONITOR);
end;

// ====

function MANETTE_TYPE_MONITOR_ITER: TGType;
begin
  MANETTE_TYPE_MONITOR_ITER := manette_monitor_iter_get_type;
end;

// ====

function LIBMANETTE_ENCODE_VERSION(major, minor, micro: longint): longint;
begin
  LIBMANETTE_ENCODE_VERSION := ((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

function LIBMANETTE_VERSION_HEX: longint;
begin
  LIBMANETTE_VERSION_HEX := LIBMANETTE_ENCODE_VERSION(LIBMANETTE_MAJOR_VERSION, LIBMANETTE_MINOR_VERSION, LIBMANETTE_MICRO_VERSION);
end;

function LIBMANETTE_CHECK_VERSION(major, minor, micro: longint): boolean; inline;
begin
  Result :=
    (LIBMANETTE_MAJOR_VERSION > major) or
    ((LIBMANETTE_MAJOR_VERSION = major) and (LIBMANETTE_MINOR_VERSION > minor)) or
    ((LIBMANETTE_MAJOR_VERSION = major) and (LIBMANETTE_MINOR_VERSION = minor) and
    (LIBMANETTE_MICRO_VERSION >= micro));
end;

end.
