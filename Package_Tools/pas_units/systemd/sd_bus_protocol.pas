unit sd_bus_protocol;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{$ifndef foosdbusprotocolhfoo}
{$define foosdbusprotocolhfoo}
{**
  systemd is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation; either version 2.1 of the License, or
  (at your option) any later version.

  systemd is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License
  along with systemd; If not, see <https://www.gnu.org/licenses/>.
** }
{$include "_sd-common.h"}
{ Types of message  }
type
  Txxxxxx =  Longint;
  Const
    _SD_BUS_MESSAGE_TYPE_INVALID = 0;
    SD_BUS_MESSAGE_METHOD_CALL = 1;
    SD_BUS_MESSAGE_METHOD_RETURN = 2;
    SD_BUS_MESSAGE_METHOD_ERROR = 3;
    SD_BUS_MESSAGE_SIGNAL = 4;
    _SD_BUS_MESSAGE_TYPE_MAX = 5;

{ Primitive types  }
{ not actually used in signatures  }
{ not actually used in signatures  }
type
  Txxxxxx =  Longint;
  Const
    _SD_BUS_TYPE_INVALID = 0;
    SD_BUS_TYPE_BYTE = 'y';
    SD_BUS_TYPE_BOOLEAN = 'b';
    SD_BUS_TYPE_INT16 = 'n';
    SD_BUS_TYPE_UINT16 = 'q';
    SD_BUS_TYPE_INT32 = 'i';
    SD_BUS_TYPE_UINT32 = 'u';
    SD_BUS_TYPE_INT64 = 'x';
    SD_BUS_TYPE_UINT64 = 't';
    SD_BUS_TYPE_DOUBLE = 'd';
    SD_BUS_TYPE_STRING = 's';
    SD_BUS_TYPE_OBJECT_PATH = 'o';
    SD_BUS_TYPE_SIGNATURE = 'g';
    SD_BUS_TYPE_UNIX_FD = 'h';
    SD_BUS_TYPE_ARRAY = 'a';
    SD_BUS_TYPE_VARIANT = 'v';
    SD_BUS_TYPE_STRUCT = 'r';
    SD_BUS_TYPE_STRUCT_BEGIN = '(';
    SD_BUS_TYPE_STRUCT_END = ')';
    SD_BUS_TYPE_DICT_ENTRY = 'e';
    SD_BUS_TYPE_DICT_ENTRY_BEGIN = '{';
    SD_BUS_TYPE_DICT_ENTRY_END = '}';

{ Well-known errors. Note that this is only a sanitized subset of the
 * errors that the reference implementation generates.  }
  SD_BUS_ERROR_FAILED = 'org.freedesktop.DBus.Error.Failed';  
  SD_BUS_ERROR_NO_MEMORY = 'org.freedesktop.DBus.Error.NoMemory';  
  SD_BUS_ERROR_SERVICE_UNKNOWN = 'org.freedesktop.DBus.Error.ServiceUnknown';  
  SD_BUS_ERROR_NAME_HAS_NO_OWNER = 'org.freedesktop.DBus.Error.NameHasNoOwner';  
  SD_BUS_ERROR_NO_REPLY = 'org.freedesktop.DBus.Error.NoReply';  
  SD_BUS_ERROR_IO_ERROR = 'org.freedesktop.DBus.Error.IOError';  
  SD_BUS_ERROR_BAD_ADDRESS = 'org.freedesktop.DBus.Error.BadAddress';  
  SD_BUS_ERROR_NOT_SUPPORTED = 'org.freedesktop.DBus.Error.NotSupported';  
  SD_BUS_ERROR_LIMITS_EXCEEDED = 'org.freedesktop.DBus.Error.LimitsExceeded';  
  SD_BUS_ERROR_ACCESS_DENIED = 'org.freedesktop.DBus.Error.AccessDenied';  
  SD_BUS_ERROR_AUTH_FAILED = 'org.freedesktop.DBus.Error.AuthFailed';  
  SD_BUS_ERROR_NO_SERVER = 'org.freedesktop.DBus.Error.NoServer';  
  SD_BUS_ERROR_TIMEOUT = 'org.freedesktop.DBus.Error.Timeout';  
  SD_BUS_ERROR_NO_NETWORK = 'org.freedesktop.DBus.Error.NoNetwork';  
  SD_BUS_ERROR_ADDRESS_IN_USE = 'org.freedesktop.DBus.Error.AddressInUse';  
  SD_BUS_ERROR_DISCONNECTED = 'org.freedesktop.DBus.Error.Disconnected';  
  SD_BUS_ERROR_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs';  
  SD_BUS_ERROR_FILE_NOT_FOUND = 'org.freedesktop.DBus.Error.FileNotFound';  
  SD_BUS_ERROR_FILE_EXISTS = 'org.freedesktop.DBus.Error.FileExists';  
  SD_BUS_ERROR_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod';  
  SD_BUS_ERROR_UNKNOWN_OBJECT = 'org.freedesktop.DBus.Error.UnknownObject';  
  SD_BUS_ERROR_UNKNOWN_INTERFACE = 'org.freedesktop.DBus.Error.UnknownInterface';  
  SD_BUS_ERROR_UNKNOWN_PROPERTY = 'org.freedesktop.DBus.Error.UnknownProperty';  
  SD_BUS_ERROR_PROPERTY_READ_ONLY = 'org.freedesktop.DBus.Error.PropertyReadOnly';  
  SD_BUS_ERROR_UNIX_PROCESS_ID_UNKNOWN = 'org.freedesktop.DBus.Error.UnixProcessIdUnknown';  
  SD_BUS_ERROR_INVALID_SIGNATURE = 'org.freedesktop.DBus.Error.InvalidSignature';  
  SD_BUS_ERROR_INCONSISTENT_MESSAGE = 'org.freedesktop.DBus.Error.InconsistentMessage';  
  SD_BUS_ERROR_TIMED_OUT = 'org.freedesktop.DBus.Error.TimedOut';  
  SD_BUS_ERROR_MATCH_RULE_NOT_FOUND = 'org.freedesktop.DBus.Error.MatchRuleNotFound';  
  SD_BUS_ERROR_MATCH_RULE_INVALID = 'org.freedesktop.DBus.Error.MatchRuleInvalid';  
  SD_BUS_ERROR_INTERACTIVE_AUTHORIZATION_REQUIRED = 'org.freedesktop.DBus.Error.InteractiveAuthorizationRequired';  
  SD_BUS_ERROR_INVALID_FILE_CONTENT = 'org.freedesktop.DBus.Error.InvalidFileContent';  
  SD_BUS_ERROR_SELINUX_SECURITY_CONTEXT_UNKNOWN = 'org.freedesktop.DBus.Error.SELinuxSecurityContextUnknown';  
  SD_BUS_ERROR_OBJECT_PATH_IN_USE = 'org.freedesktop.DBus.Error.ObjectPathInUse';  
{ https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-marshaling-signature  }
  SD_BUS_MAXIMUM_SIGNATURE_LENGTH = 255;  
{ https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names  }
  SD_BUS_MAXIMUM_NAME_LENGTH = 255;  
{$endif}

// === Konventiert am: 16-7-25 19:03:41 ===


implementation



end.
