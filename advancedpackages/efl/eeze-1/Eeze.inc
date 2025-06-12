{$IFDEF read_interface}


type
  PEeze_Udev_Event = ^TEeze_Udev_Event;
  TEeze_Udev_Event = longint;

const
  EEZE_UDEV_EVENT_NONE = $f0;
  EEZE_UDEV_EVENT_ADD = 1 shl 1;
  EEZE_UDEV_EVENT_REMOVE = 1 shl 2;
  EEZE_UDEV_EVENT_CHANGE = 1 shl 3;
  EEZE_UDEV_EVENT_ONLINE = 1 shl 4;
  EEZE_UDEV_EVENT_OFFLINE = 1 shl 5;

type
  PEeze_Udev_Type = ^TEeze_Udev_Type;
  TEeze_Udev_Type = longint;

const
  EEZE_UDEV_TYPE_NONE = 0;
  EEZE_UDEV_TYPE_KEYBOARD = 1;
  EEZE_UDEV_TYPE_MOUSE = 2;
  EEZE_UDEV_TYPE_TOUCHPAD = 3;
  EEZE_UDEV_TYPE_DRIVE_MOUNTABLE = 4;
  EEZE_UDEV_TYPE_DRIVE_INTERNAL = 5;
  EEZE_UDEV_TYPE_DRIVE_REMOVABLE = 6;
  EEZE_UDEV_TYPE_DRIVE_CDROM = 7;
  EEZE_UDEV_TYPE_POWER_AC = 8;
  EEZE_UDEV_TYPE_POWER_BAT = 9;
  EEZE_UDEV_TYPE_IS_IT_HOT_OR_IS_IT_COLD_SENSOR = 10;
  EEZE_UDEV_TYPE_NET = 11;
  EEZE_UDEV_TYPE_V4L = 12;
  EEZE_UDEV_TYPE_BLUETOOTH = 13;
  EEZE_UDEV_TYPE_JOYSTICK = 14;
  EEZE_UDEV_TYPE_DRM = 15;
  EEZE_UDEV_TYPE_BACKLIGHT = 16;
  EEZE_UDEV_TYPE_LEDS = 17;
  EEZE_UDEV_TYPE_GRAPHICS = 18;
  EEZE_UDEV_TYPE_GPIO = 19;

type
  PEeze_Udev_Watch = ^TEeze_Udev_Watch;
  TEeze_Udev_Watch = record
  end;

const
  EEZE_VERSION_MAJOR = EFL_VERSION_MAJOR;
  EEZE_VERSION_MINOR = EFL_VERSION_MINOR;

type
  TEeze_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEeze_Version = ^TEeze_Version;

var
  eeze_version: PEeze_Version; cvar;external libeeze;

type
  TEeze_Udev_Watch_Cb = procedure(para1: pchar; para2: TEeze_Udev_Event; para3: pointer; para4: PEeze_Udev_Watch); cdecl;

function eeze_init: longint; cdecl; external libeeze;
function eeze_shutdown: longint; cdecl; external libeeze;
function eeze_udev_get: pointer; cdecl; external libeeze;
function eeze_udev_find_similar_from_syspath(syspath: pchar): PEina_List; cdecl; external libeeze;
function eeze_udev_find_unlisted_similar(list: PEina_List): PEina_List; cdecl; external libeeze;
function eeze_udev_find_by_sysattr(sysattr: pchar; value: pchar): PEina_List; cdecl; external libeeze;
function eeze_udev_find_by_type(_type: TEeze_Udev_Type; name: pchar): PEina_List; cdecl; external libeeze;
function eeze_udev_find_by_filter(subsystem: pchar; _type: pchar; name: pchar): PEina_List; cdecl; external libeeze;
function eeze_udev_find_by_subsystem_sysname(subsystem: pchar; sysname: pchar): PEina_List; cdecl; external libeeze;
function eeze_udev_devpath_get_syspath(devpath: pchar): pchar; cdecl; external libeeze;
function eeze_udev_syspath_get_parent(syspath: pchar): pchar; cdecl; external libeeze;
function eeze_udev_syspath_get_parent_filtered(syspath: pchar; subsystem: pchar; devtype: pchar): PEina_Stringshare; cdecl; external libeeze;
function eeze_udev_syspath_get_parents(syspath: pchar): PEina_List; cdecl; external libeeze;
function eeze_udev_syspath_get_devpath(syspath: pchar): pchar; cdecl; external libeeze;
function eeze_udev_syspath_get_devname(syspath: pchar): pchar; cdecl; external libeeze;
function eeze_udev_syspath_get_subsystem(syspath: pchar): pchar; cdecl; external libeeze;
function eeze_udev_syspath_check_property(syspath: pchar; _property: pchar; value: pchar): TEina_Bool; cdecl; external libeeze;
function eeze_udev_syspath_get_property(syspath: pchar; _property: pchar): pchar; cdecl; external libeeze;
function eeze_udev_syspath_get_sysattr(syspath: pchar; sysattr: pchar): pchar; cdecl; external libeeze;
function eeze_udev_syspath_check_sysattr(syspath: pchar; sysattr: pchar; value: pchar): TEina_Bool; cdecl; external libeeze;
function eeze_udev_syspath_set_sysattr(syspath: pchar; sysattr: pchar; value: double): TEina_Bool; cdecl; external libeeze;
function eeze_udev_syspath_get_sysattr_list(syspath: pchar): PEina_List; cdecl; external libeeze;
function eeze_udev_syspath_is_mouse(syspath: pchar): TEina_Bool; cdecl; external libeeze;
function eeze_udev_syspath_is_kbd(syspath: pchar): TEina_Bool; cdecl; external libeeze;
function eeze_udev_syspath_is_touchpad(syspath: pchar): TEina_Bool; cdecl; external libeeze;
function eeze_udev_syspath_is_joystick(syspath: pchar): TEina_Bool; cdecl; external libeeze;
function eeze_udev_syspath_get_sysnum(syspath: pchar): longint; cdecl; external libeeze;
function eeze_udev_walk_check_sysattr(syspath: pchar; sysattr: pchar; value: pchar): TEina_Bool; cdecl; external libeeze;
function eeze_udev_walk_get_sysattr(syspath: pchar; sysattr: pchar): pchar; cdecl; external libeeze;
function eeze_udev_watch_add(_type: TEeze_Udev_Type; event: longint; cb: TEeze_Udev_Watch_Cb; user_data: pointer): PEeze_Udev_Watch; cdecl; external libeeze;
function eeze_udev_watch_del(watch: PEeze_Udev_Watch): pointer; cdecl; external libeeze;

// === Konventiert am: 12-6-25 17:32:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
