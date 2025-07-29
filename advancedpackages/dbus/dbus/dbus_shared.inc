{$IFDEF read_interface}


type
  PDBusBusType = ^TDBusBusType;
  TDBusBusType = longint;

const
  DBUS_BUS_SESSION = 0;
  DBUS_BUS_SYSTEM = 1;
  DBUS_BUS_STARTER = 2;

type
  PDBusHandlerResult = ^TDBusHandlerResult;
  TDBusHandlerResult = longint;

const
  DBUS_HANDLER_RESULT_HANDLED = 0;
  DBUS_HANDLER_RESULT_NOT_YET_HANDLED = 1;
  DBUS_HANDLER_RESULT_NEED_MEMORY = 2;

const
  DBUS_SERVICE_DBUS = 'org.freedesktop.DBus';
  DBUS_PATH_DBUS = '/org/freedesktop/DBus';
  DBUS_PATH_LOCAL = '/org/freedesktop/DBus/Local';
  DBUS_INTERFACE_DBUS = 'org.freedesktop.DBus';
  DBUS_INTERFACE_MONITORING = 'org.freedesktop.DBus.Monitoring';
  DBUS_INTERFACE_VERBOSE = 'org.freedesktop.DBus.Verbose';
  DBUS_INTERFACE_INTROSPECTABLE = 'org.freedesktop.DBus.Introspectable';
  DBUS_INTERFACE_PROPERTIES = 'org.freedesktop.DBus.Properties';
  DBUS_INTERFACE_PEER = 'org.freedesktop.DBus.Peer';
  DBUS_INTERFACE_LOCAL = 'org.freedesktop.DBus.Local';
  DBUS_NAME_FLAG_ALLOW_REPLACEMENT = $1;
  DBUS_NAME_FLAG_REPLACE_EXISTING = $2;
  DBUS_NAME_FLAG_DO_NOT_QUEUE = $4;
  DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER = 1;
  DBUS_REQUEST_NAME_REPLY_IN_QUEUE = 2;
  DBUS_REQUEST_NAME_REPLY_EXISTS = 3;
  DBUS_REQUEST_NAME_REPLY_ALREADY_OWNER = 4;
  DBUS_RELEASE_NAME_REPLY_RELEASED = 1;
  DBUS_RELEASE_NAME_REPLY_NON_EXISTENT = 2;
  DBUS_RELEASE_NAME_REPLY_NOT_OWNER = 3;
  DBUS_START_REPLY_SUCCESS = 1;
  DBUS_START_REPLY_ALREADY_RUNNING = 2;

  // === Konventiert am: 29-7-25 15:07:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
