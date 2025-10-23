{$IFDEF read_interface}


const
  DBUS_TYPE_INVALID = longint(#0);
  DBUS_TYPE_BYTE = longint('y');
  DBUS_TYPE_BOOLEAN = longint('b');
  DBUS_TYPE_INT16 = longint('n');
  DBUS_TYPE_UINT16 = longint('q');
  DBUS_TYPE_INT32 = longint('i');
  DBUS_TYPE_UINT32 = longint('u');
  DBUS_TYPE_INT64 = longint('x');
  DBUS_TYPE_UINT64 = longint('t');
  DBUS_TYPE_DOUBLE = longint('d');
  DBUS_TYPE_STRING = longint('s');
  DBUS_TYPE_OBJECT_PATH = longint('o');
  DBUS_TYPE_SIGNATURE = longint('g');
  DBUS_TYPE_UNIX_FD = longint('h');
  DBUS_TYPE_ARRAY = longint('a');
  DBUS_TYPE_VARIANT = longint('v');
  DBUS_TYPE_STRUCT = longint('r');
  DBUS_TYPE_DICT_ENTRY = longint('e');
  DBUS_STRUCT_BEGIN_CHAR = longint('(');
  DBUS_STRUCT_END_CHAR = longint(')');
  DBUS_DICT_ENTRY_BEGIN_CHAR = longint('{');
  DBUS_DICT_ENTRY_END_CHAR = longint('}');

const
  DBUS_LITTLE_ENDIAN = 'l';
  DBUS_BIG_ENDIAN = 'B';
  DBUS_MAJOR_PROTOCOL_VERSION = 1;

const
  DBUS_TYPE_INVALID_AS_STRING = '\0';
  DBUS_TYPE_BYTE_AS_STRING = 'y';
  DBUS_TYPE_BOOLEAN_AS_STRING = 'b';
  DBUS_TYPE_INT16_AS_STRING = 'n';
  DBUS_TYPE_UINT16_AS_STRING = 'q';
  DBUS_TYPE_INT32_AS_STRING = 'i';
  DBUS_TYPE_UINT32_AS_STRING = 'u';
  DBUS_TYPE_INT64_AS_STRING = 'x';
  DBUS_TYPE_UINT64_AS_STRING = 't';
  DBUS_TYPE_DOUBLE_AS_STRING = 'd';
  DBUS_TYPE_STRING_AS_STRING = 's';
  DBUS_TYPE_OBJECT_PATH_AS_STRING = 'o';
  DBUS_TYPE_SIGNATURE_AS_STRING = 'g';
  DBUS_TYPE_UNIX_FD_AS_STRING = 'h';
  DBUS_TYPE_ARRAY_AS_STRING = 'a';
  DBUS_TYPE_VARIANT_AS_STRING = 'v';
  DBUS_TYPE_STRUCT_AS_STRING = 'r';
  DBUS_TYPE_DICT_ENTRY_AS_STRING = 'e';
  DBUS_NUMBER_OF_TYPES = 16;
  DBUS_STRUCT_BEGIN_CHAR_AS_STRING = '(';
  DBUS_STRUCT_END_CHAR_AS_STRING = ')';
  DBUS_DICT_ENTRY_BEGIN_CHAR_AS_STRING = '{';

const
  DBUS_DICT_ENTRY_END_CHAR_AS_STRING = '}';
  DBUS_MAXIMUM_NAME_LENGTH = 255;
  DBUS_MAXIMUM_SIGNATURE_LENGTH = 255;
  DBUS_MAXIMUM_MATCH_RULE_LENGTH = 1024;
  DBUS_MAXIMUM_MATCH_RULE_ARG_NUMBER = 63;
  DBUS_MAXIMUM_ARRAY_LENGTH = 67108864;
  DBUS_MAXIMUM_ARRAY_LENGTH_BITS = 26;
  DBUS_MAXIMUM_MESSAGE_LENGTH = DBUS_MAXIMUM_ARRAY_LENGTH * 2;
  DBUS_MAXIMUM_MESSAGE_LENGTH_BITS = 27;
  DBUS_MAXIMUM_MESSAGE_UNIX_FDS = DBUS_MAXIMUM_MESSAGE_LENGTH / 4;
  DBUS_MAXIMUM_MESSAGE_UNIX_FDS_BITS = DBUS_MAXIMUM_MESSAGE_LENGTH_BITS - 2;
  DBUS_MAXIMUM_TYPE_RECURSION_DEPTH = 32;
  DBUS_MESSAGE_TYPE_INVALID = 0;
  DBUS_MESSAGE_TYPE_METHOD_CALL = 1;
  DBUS_MESSAGE_TYPE_METHOD_RETURN = 2;
  DBUS_MESSAGE_TYPE_ERROR = 3;
  DBUS_MESSAGE_TYPE_SIGNAL = 4;
  DBUS_NUM_MESSAGE_TYPES = 5;
  DBUS_HEADER_FLAG_NO_REPLY_EXPECTED = $1;
  DBUS_HEADER_FLAG_NO_AUTO_START = $2;
  DBUS_HEADER_FLAG_ALLOW_INTERACTIVE_AUTHORIZATION = $4;
  DBUS_HEADER_FIELD_INVALID = 0;
  DBUS_HEADER_FIELD_PATH = 1;
  DBUS_HEADER_FIELD_INTERFACE = 2;
  DBUS_HEADER_FIELD_MEMBER = 3;
  DBUS_HEADER_FIELD_ERROR_NAME = 4;
  DBUS_HEADER_FIELD_REPLY_SERIAL = 5;
  DBUS_HEADER_FIELD_DESTINATION = 6;
  DBUS_HEADER_FIELD_SENDER = 7;
  DBUS_HEADER_FIELD_SIGNATURE = 8;
  DBUS_HEADER_FIELD_UNIX_FDS = 9;
  DBUS_HEADER_FIELD_CONTAINER_INSTANCE = 10;
  DBUS_HEADER_FIELD_LAST = DBUS_HEADER_FIELD_CONTAINER_INSTANCE;

  DBUS_HEADER_SIGNATURE =
    DBUS_TYPE_BYTE_AS_STRING +
    DBUS_TYPE_BYTE_AS_STRING +
    DBUS_TYPE_BYTE_AS_STRING +
    DBUS_TYPE_BYTE_AS_STRING +
    DBUS_TYPE_UINT32_AS_STRING +
    DBUS_TYPE_UINT32_AS_STRING +
    DBUS_TYPE_ARRAY_AS_STRING +
    DBUS_STRUCT_BEGIN_CHAR_AS_STRING +
    DBUS_TYPE_BYTE_AS_STRING +
    DBUS_TYPE_VARIANT_AS_STRING +
    DBUS_STRUCT_END_CHAR_AS_STRING;

  DBUS_MINIMUM_HEADER_SIZE = 16;
  DBUS_ERROR_FAILED = 'org.freedesktop.DBus.Error.Failed';
  DBUS_ERROR_NO_MEMORY = 'org.freedesktop.DBus.Error.NoMemory';
  DBUS_ERROR_SERVICE_UNKNOWN = 'org.freedesktop.DBus.Error.ServiceUnknown';
  DBUS_ERROR_NAME_HAS_NO_OWNER = 'org.freedesktop.DBus.Error.NameHasNoOwner';
  DBUS_ERROR_NO_REPLY = 'org.freedesktop.DBus.Error.NoReply';
  DBUS_ERROR_IO_ERROR = 'org.freedesktop.DBus.Error.IOError';
  DBUS_ERROR_BAD_ADDRESS = 'org.freedesktop.DBus.Error.BadAddress';
  DBUS_ERROR_NOT_SUPPORTED = 'org.freedesktop.DBus.Error.NotSupported';
  DBUS_ERROR_LIMITS_EXCEEDED = 'org.freedesktop.DBus.Error.LimitsExceeded';
  DBUS_ERROR_ACCESS_DENIED = 'org.freedesktop.DBus.Error.AccessDenied';
  DBUS_ERROR_AUTH_FAILED = 'org.freedesktop.DBus.Error.AuthFailed';
  DBUS_ERROR_NO_SERVER = 'org.freedesktop.DBus.Error.NoServer';
  DBUS_ERROR_TIMEOUT = 'org.freedesktop.DBus.Error.Timeout';
  DBUS_ERROR_NO_NETWORK = 'org.freedesktop.DBus.Error.NoNetwork';
  DBUS_ERROR_ADDRESS_IN_USE = 'org.freedesktop.DBus.Error.AddressInUse';
  DBUS_ERROR_DISCONNECTED = 'org.freedesktop.DBus.Error.Disconnected';
  DBUS_ERROR_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs';
  DBUS_ERROR_FILE_NOT_FOUND = 'org.freedesktop.DBus.Error.FileNotFound';
  DBUS_ERROR_FILE_EXISTS = 'org.freedesktop.DBus.Error.FileExists';
  DBUS_ERROR_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod';
  DBUS_ERROR_UNKNOWN_OBJECT = 'org.freedesktop.DBus.Error.UnknownObject';
  DBUS_ERROR_UNKNOWN_INTERFACE = 'org.freedesktop.DBus.Error.UnknownInterface';
  DBUS_ERROR_UNKNOWN_PROPERTY = 'org.freedesktop.DBus.Error.UnknownProperty';
  DBUS_ERROR_PROPERTY_READ_ONLY = 'org.freedesktop.DBus.Error.PropertyReadOnly';
  DBUS_ERROR_TIMED_OUT = 'org.freedesktop.DBus.Error.TimedOut';
  DBUS_ERROR_MATCH_RULE_NOT_FOUND = 'org.freedesktop.DBus.Error.MatchRuleNotFound';
  DBUS_ERROR_MATCH_RULE_INVALID = 'org.freedesktop.DBus.Error.MatchRuleInvalid';
  DBUS_ERROR_SPAWN_EXEC_FAILED = 'org.freedesktop.DBus.Error.Spawn.ExecFailed';
  DBUS_ERROR_SPAWN_FORK_FAILED = 'org.freedesktop.DBus.Error.Spawn.ForkFailed';
  DBUS_ERROR_SPAWN_CHILD_EXITED = 'org.freedesktop.DBus.Error.Spawn.ChildExited';
  DBUS_ERROR_SPAWN_CHILD_SIGNALED = 'org.freedesktop.DBus.Error.Spawn.ChildSignaled';
  DBUS_ERROR_SPAWN_FAILED = 'org.freedesktop.DBus.Error.Spawn.Failed';
  DBUS_ERROR_SPAWN_SETUP_FAILED = 'org.freedesktop.DBus.Error.Spawn.FailedToSetup';
  DBUS_ERROR_SPAWN_CONFIG_INVALID = 'org.freedesktop.DBus.Error.Spawn.ConfigInvalid';
  DBUS_ERROR_SPAWN_SERVICE_INVALID = 'org.freedesktop.DBus.Error.Spawn.ServiceNotValid';
  DBUS_ERROR_SPAWN_SERVICE_NOT_FOUND = 'org.freedesktop.DBus.Error.Spawn.ServiceNotFound';
  DBUS_ERROR_SPAWN_PERMISSIONS_INVALID = 'org.freedesktop.DBus.Error.Spawn.PermissionsInvalid';
  DBUS_ERROR_SPAWN_FILE_INVALID = 'org.freedesktop.DBus.Error.Spawn.FileInvalid';
  DBUS_ERROR_SPAWN_NO_MEMORY = 'org.freedesktop.DBus.Error.Spawn.NoMemory';
  DBUS_ERROR_UNIX_PROCESS_ID_UNKNOWN = 'org.freedesktop.DBus.Error.UnixProcessIdUnknown';
  DBUS_ERROR_INVALID_SIGNATURE = 'org.freedesktop.DBus.Error.InvalidSignature';
  DBUS_ERROR_INVALID_FILE_CONTENT = 'org.freedesktop.DBus.Error.InvalidFileContent';
  DBUS_ERROR_SELINUX_SECURITY_CONTEXT_UNKNOWN = 'org.freedesktop.DBus.Error.SELinuxSecurityContextUnknown';
  DBUS_ERROR_APPARMOR_SECURITY_CONTEXT_UNKNOWN = 'org.freedesktop.DBus.Error.AppArmorSecurityContextUnknown';
  DBUS_ERROR_ADT_AUDIT_DATA_UNKNOWN = 'org.freedesktop.DBus.Error.AdtAuditDataUnknown';
  DBUS_ERROR_OBJECT_PATH_IN_USE = 'org.freedesktop.DBus.Error.ObjectPathInUse';
  DBUS_ERROR_INCONSISTENT_MESSAGE = 'org.freedesktop.DBus.Error.InconsistentMessage';
  DBUS_ERROR_INTERACTIVE_AUTHORIZATION_REQUIRED = 'org.freedesktop.DBus.Error.InteractiveAuthorizationRequired';
  DBUS_ERROR_NOT_CONTAINER = 'org.freedesktop.DBus.Error.NotContainer';
  DBUS_INTROSPECT_1_0_XML_NAMESPACE = 'http://www.freedesktop.org/standards/dbus';
  DBUS_INTROSPECT_1_0_XML_PUBLIC_IDENTIFIER = '-//freedesktop//DTD D-BUS Object Introspection 1.0//EN';
  DBUS_INTROSPECT_1_0_XML_SYSTEM_IDENTIFIER = 'http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd';

  DBUS_INTROSPECT_1_0_XML_DOCTYPE_DECL_NODE = '<!DOCTYPE node PUBLIC "' +
    DBUS_INTROSPECT_1_0_XML_PUBLIC_IDENTIFIER + '"' + #10 + '"' +
    DBUS_INTROSPECT_1_0_XML_SYSTEM_IDENTIFIER + '">' + #10;

  // === Konventiert am: 29-7-25 15:07:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
