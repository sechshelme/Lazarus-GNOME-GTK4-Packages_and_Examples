
unit dbus_protocol;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_protocol.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_protocol.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-protocol.h  D-Bus protocol constants
 *
 * Copyright (C) 2002, 2003  CodeFactory AB
 * Copyright (C) 2004, 2005 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
{$ifndef DBUS_PROTOCOL_H}
{$define DBUS_PROTOCOL_H}
{ Don't include anything in here from anywhere else. It's
 * intended for use by any random library.
  }
{ Normally docs are in .c files, but there isn't a .c file for this.  }
{*
 * @defgroup DBusProtocol Protocol constants
 * @ingroup  DBus
 *
 * @brief Defines constants which are part of the D-Bus protocol
 *
 * This header is intended for use by any library, not only libdbus.
 *
 * @
  }
{ Message byte order  }
{*< Code marking LSB-first byte order in the wire protocol.  }

const
  DBUS_LITTLE_ENDIAN = 'l';  
{*< Code marking MSB-first byte order in the wire protocol.  }
  DBUS_BIG_ENDIAN = 'B';  
{* Protocol version.  }
  DBUS_MAJOR_PROTOCOL_VERSION = 1;  
{* Type code that is never equal to a legitimate type code  }

{ was #define dname def_expr }
function DBUS_TYPE_INVALID : longint;  

{* #DBUS_TYPE_INVALID as a string literal instead of a int literal  }
const
  DBUS_TYPE_INVALID_AS_STRING = '\0';  
{ Primitive types  }
{* Type code marking an 8-bit unsigned integer  }

{ was #define dname def_expr }
function DBUS_TYPE_BYTE : longint;  

{* #DBUS_TYPE_BYTE as a string literal instead of a int literal  }
const
  DBUS_TYPE_BYTE_AS_STRING = 'y';  
{* Type code marking a boolean  }

{ was #define dname def_expr }
function DBUS_TYPE_BOOLEAN : longint;  

{* #DBUS_TYPE_BOOLEAN as a string literal instead of a int literal  }
const
  DBUS_TYPE_BOOLEAN_AS_STRING = 'b';  
{* Type code marking a 16-bit signed integer  }

{ was #define dname def_expr }
function DBUS_TYPE_INT16 : longint;  

{* #DBUS_TYPE_INT16 as a string literal instead of a int literal  }
const
  DBUS_TYPE_INT16_AS_STRING = 'n';  
{* Type code marking a 16-bit unsigned integer  }

{ was #define dname def_expr }
function DBUS_TYPE_UINT16 : longint;  

{* #DBUS_TYPE_UINT16 as a string literal instead of a int literal  }
const
  DBUS_TYPE_UINT16_AS_STRING = 'q';  
{* Type code marking a 32-bit signed integer  }

{ was #define dname def_expr }
function DBUS_TYPE_INT32 : longint;  

{* #DBUS_TYPE_INT32 as a string literal instead of a int literal  }
const
  DBUS_TYPE_INT32_AS_STRING = 'i';  
{* Type code marking a 32-bit unsigned integer  }

{ was #define dname def_expr }
function DBUS_TYPE_UINT32 : longint;  

{* #DBUS_TYPE_UINT32 as a string literal instead of a int literal  }
const
  DBUS_TYPE_UINT32_AS_STRING = 'u';  
{* Type code marking a 64-bit signed integer  }

{ was #define dname def_expr }
function DBUS_TYPE_INT64 : longint;  

{* #DBUS_TYPE_INT64 as a string literal instead of a int literal  }
const
  DBUS_TYPE_INT64_AS_STRING = 'x';  
{* Type code marking a 64-bit unsigned integer  }

{ was #define dname def_expr }
function DBUS_TYPE_UINT64 : longint;  

{* #DBUS_TYPE_UINT64 as a string literal instead of a int literal  }
const
  DBUS_TYPE_UINT64_AS_STRING = 't';  
{* Type code marking an 8-byte double in IEEE 754 format  }

{ was #define dname def_expr }
function DBUS_TYPE_DOUBLE : longint;  

{* #DBUS_TYPE_DOUBLE as a string literal instead of a int literal  }
const
  DBUS_TYPE_DOUBLE_AS_STRING = 'd';  
{* Type code marking a UTF-8 encoded, nul-terminated Unicode string  }

{ was #define dname def_expr }
function DBUS_TYPE_STRING : longint;  

{* #DBUS_TYPE_STRING as a string literal instead of a int literal  }
const
  DBUS_TYPE_STRING_AS_STRING = 's';  
{* Type code marking a D-Bus object path  }

{ was #define dname def_expr }
function DBUS_TYPE_OBJECT_PATH : longint;  

{* #DBUS_TYPE_OBJECT_PATH as a string literal instead of a int literal  }
const
  DBUS_TYPE_OBJECT_PATH_AS_STRING = 'o';  
{* Type code marking a D-Bus type signature  }

{ was #define dname def_expr }
function DBUS_TYPE_SIGNATURE : longint;  

{* #DBUS_TYPE_SIGNATURE as a string literal instead of a int literal  }
const
  DBUS_TYPE_SIGNATURE_AS_STRING = 'g';  
{* Type code marking a unix file descriptor  }

{ was #define dname def_expr }
function DBUS_TYPE_UNIX_FD : longint;  

{* #DBUS_TYPE_UNIX_FD as a string literal instead of a int literal  }
const
  DBUS_TYPE_UNIX_FD_AS_STRING = 'h';  
{ Compound types  }
{* Type code marking a D-Bus array type  }

{ was #define dname def_expr }
function DBUS_TYPE_ARRAY : longint;  

{* #DBUS_TYPE_ARRAY as a string literal instead of a int literal  }
const
  DBUS_TYPE_ARRAY_AS_STRING = 'a';  
{* Type code marking a D-Bus variant type  }

{ was #define dname def_expr }
function DBUS_TYPE_VARIANT : longint;  

{* #DBUS_TYPE_VARIANT as a string literal instead of a int literal  }
const
  DBUS_TYPE_VARIANT_AS_STRING = 'v';  
{* STRUCT and DICT_ENTRY are sort of special since their codes can't
 * appear in a type string, instead
 * DBUS_STRUCT_BEGIN_CHAR/DBUS_DICT_ENTRY_BEGIN_CHAR have to appear
  }
{* Type code used to represent a struct; however, this type code does not appear
 * in type signatures, instead #DBUS_STRUCT_BEGIN_CHAR and #DBUS_STRUCT_END_CHAR will
 * appear in a signature.
  }

{ was #define dname def_expr }
function DBUS_TYPE_STRUCT : longint;  

{* #DBUS_TYPE_STRUCT as a string literal instead of a int literal  }
const
  DBUS_TYPE_STRUCT_AS_STRING = 'r';  
{* Type code used to represent a dict entry; however, this type code does not appear
 * in type signatures, instead #DBUS_DICT_ENTRY_BEGIN_CHAR and #DBUS_DICT_ENTRY_END_CHAR will
 * appear in a signature.
  }

{ was #define dname def_expr }
function DBUS_TYPE_DICT_ENTRY : longint;  

{* #DBUS_TYPE_DICT_ENTRY as a string literal instead of a int literal  }
const
  DBUS_TYPE_DICT_ENTRY_AS_STRING = 'e';  
{* Does not include #DBUS_TYPE_INVALID, #DBUS_STRUCT_BEGIN_CHAR, #DBUS_STRUCT_END_CHAR,
 * #DBUS_DICT_ENTRY_BEGIN_CHAR, or #DBUS_DICT_ENTRY_END_CHAR - i.e. it is the number of
 * valid types, not the number of distinct characters that may appear in a type signature.
  }
  DBUS_NUMBER_OF_TYPES = 16;  
{ characters other than typecodes that appear in type signatures  }
{* Code marking the start of a struct type in a type signature  }

{ was #define dname def_expr }
function DBUS_STRUCT_BEGIN_CHAR : longint;  

{* #DBUS_STRUCT_BEGIN_CHAR as a string literal instead of a int literal  }
const
  DBUS_STRUCT_BEGIN_CHAR_AS_STRING = '(';  
{* Code marking the end of a struct type in a type signature  }

{ was #define dname def_expr }
function DBUS_STRUCT_END_CHAR : longint;  

{* #DBUS_STRUCT_END_CHAR a string literal instead of a int literal  }
const
  DBUS_STRUCT_END_CHAR_AS_STRING = ')';  
{* Code marking the start of a dict entry type in a type signature  }

{ was #define dname def_expr }
function DBUS_DICT_ENTRY_BEGIN_CHAR : longint;  

{* #DBUS_DICT_ENTRY_BEGIN_CHAR as a string literal instead of a int literal  }
const
  DBUS_DICT_ENTRY_BEGIN_CHAR_AS_STRING = '{';  
{* Code marking the end of a dict entry type in a type signature  }

{ was #define dname def_expr }
function DBUS_DICT_ENTRY_END_CHAR : longint;  

{* #DBUS_DICT_ENTRY_END_CHAR as a string literal instead of a int literal  }
const
  DBUS_DICT_ENTRY_END_CHAR_AS_STRING = '}';  
{* Max length in bytes of a bus name, interface, or member (not object
 * path, paths are unlimited). This is limited because lots of stuff
 * is O(n) in this number, plus it would be obnoxious to type in a
 * paragraph-long method name so most likely something like that would
 * be an exploit.
  }
  DBUS_MAXIMUM_NAME_LENGTH = 255;  
{* This one is 255 so it fits in a byte  }
  DBUS_MAXIMUM_SIGNATURE_LENGTH = 255;  
{* Max length of a match rule string; to keep people from hosing the
 * daemon with some huge rule
  }
  DBUS_MAXIMUM_MATCH_RULE_LENGTH = 1024;  
{* Max arg number you can match on in a match rule, e.g.
 * arg0='hello' is OK, arg3489720987='hello' is not
  }
  DBUS_MAXIMUM_MATCH_RULE_ARG_NUMBER = 63;  
{* Max length of a marshaled array in bytes (64M, 2^26) We use signed
 * int for lengths so must be INT_MAX or less.  We need something a
 * bit smaller than INT_MAX because the array is inside a message with
 * header info, etc.  so an INT_MAX array wouldn't allow the message
 * overhead.  The 64M number is an attempt at a larger number than
 * we'd reasonably ever use, but small enough that your bus would chew
 * through it fairly quickly without locking up forever. If you have
 * data that's likely to be larger than this, you should probably be
 * sending it in multiple incremental messages anyhow.
  }
  DBUS_MAXIMUM_ARRAY_LENGTH = 67108864;  
{* Number of bits you need in an unsigned to store the max array size  }
  DBUS_MAXIMUM_ARRAY_LENGTH_BITS = 26;  
{* The maximum total message size including header and body; similar
 * rationale to max array size.
  }
{ xxxxxxxxxxxxxxxxxxxxxx   #define DBUS_MAXIMUM_MESSAGE_LENGTH (DBUS_MAXIMUM_ARRAY_LENGTH * 2) }
{* Number of bits you need in an unsigned to store the max message size  }
  DBUS_MAXIMUM_MESSAGE_LENGTH_BITS = 27;  
{* The maximum total number of unix fds in a message. Similar
 * rationale as DBUS_MAXIMUM_MESSAGE_LENGTH. However we divide by four
 * given that one fd is an int and hence at least 32 bits.
  }
  DBUS_MAXIMUM_MESSAGE_UNIX_FDS = DBUS_MAXIMUM_MESSAGE_LENGTH/4;  
{* Number of bits you need in an unsigned to store the max message unix fds  }
  DBUS_MAXIMUM_MESSAGE_UNIX_FDS_BITS = DBUS_MAXIMUM_MESSAGE_LENGTH_BITS-2;  
{* Depth of recursion in the type tree. This is automatically limited
 * to DBUS_MAXIMUM_SIGNATURE_LENGTH since you could only have an array
 * of array of array of ... that fit in the max signature.  But that's
 * probably a bit too large.
  }
  DBUS_MAXIMUM_TYPE_RECURSION_DEPTH = 32;  
{ Types of message  }
{* This value is never a valid message type, see dbus_message_get_type()  }
  DBUS_MESSAGE_TYPE_INVALID = 0;  
{* Message type of a method call message, see dbus_message_get_type()  }
  DBUS_MESSAGE_TYPE_METHOD_CALL = 1;  
{* Message type of a method return message, see dbus_message_get_type()  }
  DBUS_MESSAGE_TYPE_METHOD_RETURN = 2;  
{* Message type of an error reply message, see dbus_message_get_type()  }
  DBUS_MESSAGE_TYPE_ERROR = 3;  
{* Message type of a signal message, see dbus_message_get_type()  }
  DBUS_MESSAGE_TYPE_SIGNAL = 4;  
  DBUS_NUM_MESSAGE_TYPES = 5;  
{ Header flags  }
{* If set, this flag means that the sender of a message does not care about getting
 * a reply, so the recipient need not send one. See dbus_message_set_no_reply().
  }
  DBUS_HEADER_FLAG_NO_REPLY_EXPECTED = $1;  
{*
 * If set, this flag means that even if the message bus knows how to start an owner for
 * the destination bus name (see dbus_message_set_destination()), it should not
 * do so. If this flag is not set, the bus may launch a program to process the
 * message.
  }
  DBUS_HEADER_FLAG_NO_AUTO_START = $2;  
{*
 * If set on a method call, this flag means that the caller is prepared to
 * wait for interactive authorization.
  }
  DBUS_HEADER_FLAG_ALLOW_INTERACTIVE_AUTHORIZATION = $4;  
{ Header fields  }
{* Not equal to any valid header field code  }
  DBUS_HEADER_FIELD_INVALID = 0;  
{* Header field code for the path - the path is the object emitting a signal or the object receiving a method call.
 * See dbus_message_set_path().
  }
  DBUS_HEADER_FIELD_PATH = 1;  
{* Header field code for the interface containing a member (method or signal).
 * See dbus_message_set_interface().
  }
  DBUS_HEADER_FIELD_INTERFACE = 2;  
{* Header field code for a member (method or signal). See dbus_message_set_member().  }
  DBUS_HEADER_FIELD_MEMBER = 3;  
{* Header field code for an error name (found in #DBUS_MESSAGE_TYPE_ERROR messages).
 * See dbus_message_set_error_name().
  }
  DBUS_HEADER_FIELD_ERROR_NAME = 4;  
{* Header field code for a reply serial, used to match a #DBUS_MESSAGE_TYPE_METHOD_RETURN message with the
 * message that it's a reply to. See dbus_message_set_reply_serial().
  }
  DBUS_HEADER_FIELD_REPLY_SERIAL = 5;  
{*
 * Header field code for the destination bus name of a message. See dbus_message_set_destination().
  }
  DBUS_HEADER_FIELD_DESTINATION = 6;  
{*
 * Header field code for the sender of a message; usually initialized by the message bus.
 * See dbus_message_set_sender().
  }
  DBUS_HEADER_FIELD_SENDER = 7;  
{*
 * Header field code for the type signature of a message.
  }
  DBUS_HEADER_FIELD_SIGNATURE = 8;  
{*
 * Header field code for the number of unix file descriptors associated
 * with this message.
  }
  DBUS_HEADER_FIELD_UNIX_FDS = 9;  
{*
 * Header field code for the container instance that sent this message.
  }
  DBUS_HEADER_FIELD_CONTAINER_INSTANCE = 10;  
{*
 * Value of the highest-numbered header field code, can be used to determine
 * the size of an array indexed by header field code. Remember though
 * that unknown codes must be ignored, so check for that before
 * indexing the array.
  }
  DBUS_HEADER_FIELD_LAST = DBUS_HEADER_FIELD_CONTAINER_INSTANCE;  
{* Header format is defined as a signature:
 *   byte                            byte order
 *   byte                            message type ID
 *   byte                            flags
 *   byte                            protocol version
 *   uint32                          body length
 *   uint32                          serial
 *   array of struct (byte,variant)  (field name, value)
 *
 * The length of the header can be computed as the
 * fixed size of the initial data, plus the length of
 * the array at the end, plus padding to an 8-boundary.
  }
{
#define DBUS_HEADER_SIGNATURE                   \
     DBUS_TYPE_BYTE_AS_STRING                   \
     DBUS_TYPE_BYTE_AS_STRING                   \
     DBUS_TYPE_BYTE_AS_STRING                   \
     DBUS_TYPE_BYTE_AS_STRING                   \
     DBUS_TYPE_UINT32_AS_STRING                 \
     DBUS_TYPE_UINT32_AS_STRING                 \
     DBUS_TYPE_ARRAY_AS_STRING                  \
     DBUS_STRUCT_BEGIN_CHAR_AS_STRING           \
     DBUS_TYPE_BYTE_AS_STRING                   \
     DBUS_TYPE_VARIANT_AS_STRING                \
     DBUS_STRUCT_END_CHAR_AS_STRING
 }
{*
 * The smallest header size that can occur.  (It won't be valid due to
 * missing required header fields.) This is 4 bytes, two uint32, an
 * array length. This isn't any kind of resource limit, just the
 * necessary/logical outcome of the header signature.
  }
  DBUS_MINIMUM_HEADER_SIZE = 16;  
{ Errors  }
{ WARNING these get autoconverted to an enum in dbus-glib.h. Thus,
 * if you change the order it breaks the ABI. Keep them in order.
 * Also, don't change the formatting since that will break the sed
 * script.
  }
{* A generic error; "something went wrong" - see the error message for more.  }
  DBUS_ERROR_FAILED = 'org.freedesktop.DBus.Error.Failed';  
{* There was not enough memory to complete an operation.  }
  DBUS_ERROR_NO_MEMORY = 'org.freedesktop.DBus.Error.NoMemory';  
{* The bus doesn't know how to launch a service to supply the bus name you wanted.  }
  DBUS_ERROR_SERVICE_UNKNOWN = 'org.freedesktop.DBus.Error.ServiceUnknown';  
{* The bus name you referenced doesn't exist (i.e. no application owns it).  }
  DBUS_ERROR_NAME_HAS_NO_OWNER = 'org.freedesktop.DBus.Error.NameHasNoOwner';  
{* No reply to a message expecting one, usually means a timeout occurred.  }
  DBUS_ERROR_NO_REPLY = 'org.freedesktop.DBus.Error.NoReply';  
{* Something went wrong reading or writing to a socket, for example.  }
  DBUS_ERROR_IO_ERROR = 'org.freedesktop.DBus.Error.IOError';  
{* A D-Bus bus address was malformed.  }
  DBUS_ERROR_BAD_ADDRESS = 'org.freedesktop.DBus.Error.BadAddress';  
{* Requested operation isn't supported (like ENOSYS on UNIX).  }
  DBUS_ERROR_NOT_SUPPORTED = 'org.freedesktop.DBus.Error.NotSupported';  
{* Some limited resource is exhausted.  }
  DBUS_ERROR_LIMITS_EXCEEDED = 'org.freedesktop.DBus.Error.LimitsExceeded';  
{* Security restrictions don't allow doing what you're trying to do.  }
  DBUS_ERROR_ACCESS_DENIED = 'org.freedesktop.DBus.Error.AccessDenied';  
{* Authentication didn't work.  }
  DBUS_ERROR_AUTH_FAILED = 'org.freedesktop.DBus.Error.AuthFailed';  
{* Unable to connect to server (probably caused by ECONNREFUSED on a socket).  }
  DBUS_ERROR_NO_SERVER = 'org.freedesktop.DBus.Error.NoServer';  
{* Certain timeout errors, possibly ETIMEDOUT on a socket.
 * Note that #DBUS_ERROR_NO_REPLY is used for message reply timeouts.
 * @warning this is confusingly-named given that #DBUS_ERROR_TIMED_OUT also exists. We can't fix
 * it for compatibility reasons so just be careful.
  }
  DBUS_ERROR_TIMEOUT = 'org.freedesktop.DBus.Error.Timeout';  
{* No network access (probably ENETUNREACH on a socket).  }
  DBUS_ERROR_NO_NETWORK = 'org.freedesktop.DBus.Error.NoNetwork';  
{* Can't bind a socket since its address is in use (i.e. EADDRINUSE).  }
  DBUS_ERROR_ADDRESS_IN_USE = 'org.freedesktop.DBus.Error.AddressInUse';  
{* The connection is disconnected and you're trying to use it.  }
  DBUS_ERROR_DISCONNECTED = 'org.freedesktop.DBus.Error.Disconnected';  
{* Invalid arguments passed to a method call.  }
  DBUS_ERROR_INVALID_ARGS = 'org.freedesktop.DBus.Error.InvalidArgs';  
{* Missing file.  }
  DBUS_ERROR_FILE_NOT_FOUND = 'org.freedesktop.DBus.Error.FileNotFound';  
{* Existing file and the operation you're using does not silently overwrite.  }
  DBUS_ERROR_FILE_EXISTS = 'org.freedesktop.DBus.Error.FileExists';  
{* Method name you invoked isn't known by the object you invoked it on.  }
  DBUS_ERROR_UNKNOWN_METHOD = 'org.freedesktop.DBus.Error.UnknownMethod';  
{* Object you invoked a method on isn't known.  }
  DBUS_ERROR_UNKNOWN_OBJECT = 'org.freedesktop.DBus.Error.UnknownObject';  
{* Interface you invoked a method on isn't known by the object.  }
  DBUS_ERROR_UNKNOWN_INTERFACE = 'org.freedesktop.DBus.Error.UnknownInterface';  
{* Property you tried to access isn't known by the object.  }
  DBUS_ERROR_UNKNOWN_PROPERTY = 'org.freedesktop.DBus.Error.UnknownProperty';  
{* Property you tried to set is read-only.  }
  DBUS_ERROR_PROPERTY_READ_ONLY = 'org.freedesktop.DBus.Error.PropertyReadOnly';  
{* Certain timeout errors, e.g. while starting a service.
 * @warning this is confusingly-named given that #DBUS_ERROR_TIMEOUT also exists. We can't fix
 * it for compatibility reasons so just be careful.
  }
  DBUS_ERROR_TIMED_OUT = 'org.freedesktop.DBus.Error.TimedOut';  
{* Tried to remove or modify a match rule that didn't exist.  }
  DBUS_ERROR_MATCH_RULE_NOT_FOUND = 'org.freedesktop.DBus.Error.MatchRuleNotFound';  
{* The match rule isn't syntactically valid.  }
  DBUS_ERROR_MATCH_RULE_INVALID = 'org.freedesktop.DBus.Error.MatchRuleInvalid';  
{* While starting a new process, the exec() call failed.  }
  DBUS_ERROR_SPAWN_EXEC_FAILED = 'org.freedesktop.DBus.Error.Spawn.ExecFailed';  
{* While starting a new process, the fork() call failed.  }
  DBUS_ERROR_SPAWN_FORK_FAILED = 'org.freedesktop.DBus.Error.Spawn.ForkFailed';  
{* While starting a new process, the child exited with a status code.  }
  DBUS_ERROR_SPAWN_CHILD_EXITED = 'org.freedesktop.DBus.Error.Spawn.ChildExited';  
{* While starting a new process, the child exited on a signal.  }
  DBUS_ERROR_SPAWN_CHILD_SIGNALED = 'org.freedesktop.DBus.Error.Spawn.ChildSignaled';  
{* While starting a new process, something went wrong.  }
  DBUS_ERROR_SPAWN_FAILED = 'org.freedesktop.DBus.Error.Spawn.Failed';  
{* We failed to setup the environment correctly.  }
  DBUS_ERROR_SPAWN_SETUP_FAILED = 'org.freedesktop.DBus.Error.Spawn.FailedToSetup';  
{* We failed to setup the config parser correctly.  }
  DBUS_ERROR_SPAWN_CONFIG_INVALID = 'org.freedesktop.DBus.Error.Spawn.ConfigInvalid';  
{* Bus name was not valid.  }
  DBUS_ERROR_SPAWN_SERVICE_INVALID = 'org.freedesktop.DBus.Error.Spawn.ServiceNotValid';  
{* Service file not found in system-services directory.  }
  DBUS_ERROR_SPAWN_SERVICE_NOT_FOUND = 'org.freedesktop.DBus.Error.Spawn.ServiceNotFound';  
{* Permissions are incorrect on the setuid helper.  }
  DBUS_ERROR_SPAWN_PERMISSIONS_INVALID = 'org.freedesktop.DBus.Error.Spawn.PermissionsInvalid';  
{* Service file invalid (Name, User or Exec missing).  }
  DBUS_ERROR_SPAWN_FILE_INVALID = 'org.freedesktop.DBus.Error.Spawn.FileInvalid';  
{* There was not enough memory to complete the operation.  }
  DBUS_ERROR_SPAWN_NO_MEMORY = 'org.freedesktop.DBus.Error.Spawn.NoMemory';  
{* Tried to get a UNIX process ID and it wasn't available.  }
  DBUS_ERROR_UNIX_PROCESS_ID_UNKNOWN = 'org.freedesktop.DBus.Error.UnixProcessIdUnknown';  
{* A type signature is not valid.  }
  DBUS_ERROR_INVALID_SIGNATURE = 'org.freedesktop.DBus.Error.InvalidSignature';  
{* A file contains invalid syntax or is otherwise broken.  }
  DBUS_ERROR_INVALID_FILE_CONTENT = 'org.freedesktop.DBus.Error.InvalidFileContent';  
{* Asked for SELinux security context and it wasn't available.  }
  DBUS_ERROR_SELINUX_SECURITY_CONTEXT_UNKNOWN = 'org.freedesktop.DBus.Error.SELinuxSecurityContextUnknown';  
{* Asked for AppArmor security context and it wasn't available.  }
  DBUS_ERROR_APPARMOR_SECURITY_CONTEXT_UNKNOWN = 'org.freedesktop.DBus.Error.AppArmorSecurityContextUnknown';  
{* Asked for ADT audit data and it wasn't available.  }
  DBUS_ERROR_ADT_AUDIT_DATA_UNKNOWN = 'org.freedesktop.DBus.Error.AdtAuditDataUnknown';  
{* There's already an object with the requested object path.  }
  DBUS_ERROR_OBJECT_PATH_IN_USE = 'org.freedesktop.DBus.Error.ObjectPathInUse';  
{* The message meta data does not match the payload. e.g. expected
    number of file descriptors were not sent over the socket this message was received on.  }
  DBUS_ERROR_INCONSISTENT_MESSAGE = 'org.freedesktop.DBus.Error.InconsistentMessage';  
{* The message is not allowed without performing interactive authorization,
 * but could have succeeded if an interactive authorization step was
 * allowed.  }
  DBUS_ERROR_INTERACTIVE_AUTHORIZATION_REQUIRED = 'org.freedesktop.DBus.Error.InteractiveAuthorizationRequired';  
{* The connection is not from a container, or the specified container instance
 * does not exist.  }
  DBUS_ERROR_NOT_CONTAINER = 'org.freedesktop.DBus.Error.NotContainer';  
{ XML introspection format  }
{* XML namespace of the introspection format version 1.0  }
  DBUS_INTROSPECT_1_0_XML_NAMESPACE = 'http://www.freedesktop.org/standards/dbus';  
{* XML public identifier of the introspection format version 1.0  }
  DBUS_INTROSPECT_1_0_XML_PUBLIC_IDENTIFIER = '-//freedesktop//DTD D-BUS Object Introspection 1.0//EN';  
{* XML system identifier of the introspection format version 1.0  }
  DBUS_INTROSPECT_1_0_XML_SYSTEM_IDENTIFIER = 'http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd';  
{* XML document type declaration of the introspection format version 1.0  }
{ xxxxxxxxxxxxxxxxxxxxxxx #define DBUS_INTROSPECT_1_0_XML_DOCTYPE_DECL_NODE "<!DOCTYPE node PUBLIC \"" DBUS_INTROSPECT_1_0_XML_PUBLIC_IDENTIFIER "\"\n\"" DBUS_INTROSPECT_1_0_XML_SYSTEM_IDENTIFIER "\">\n" }
{* @  }
{$endif}
{ DBUS_PROTOCOL_H  }

implementation

{ was #define dname def_expr }
function DBUS_TYPE_INVALID : longint;
  begin
    DBUS_TYPE_INVALID:=longint('\0');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_BYTE : longint;
  begin
    DBUS_TYPE_BYTE:=longint('y');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_BOOLEAN : longint;
  begin
    DBUS_TYPE_BOOLEAN:=longint('b');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_INT16 : longint;
  begin
    DBUS_TYPE_INT16:=longint('n');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_UINT16 : longint;
  begin
    DBUS_TYPE_UINT16:=longint('q');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_INT32 : longint;
  begin
    DBUS_TYPE_INT32:=longint('i');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_UINT32 : longint;
  begin
    DBUS_TYPE_UINT32:=longint('u');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_INT64 : longint;
  begin
    DBUS_TYPE_INT64:=longint('x');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_UINT64 : longint;
  begin
    DBUS_TYPE_UINT64:=longint('t');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_DOUBLE : longint;
  begin
    DBUS_TYPE_DOUBLE:=longint('d');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_STRING : longint;
  begin
    DBUS_TYPE_STRING:=longint('s');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_OBJECT_PATH : longint;
  begin
    DBUS_TYPE_OBJECT_PATH:=longint('o');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_SIGNATURE : longint;
  begin
    DBUS_TYPE_SIGNATURE:=longint('g');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_UNIX_FD : longint;
  begin
    DBUS_TYPE_UNIX_FD:=longint('h');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_ARRAY : longint;
  begin
    DBUS_TYPE_ARRAY:=longint('a');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_VARIANT : longint;
  begin
    DBUS_TYPE_VARIANT:=longint('v');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_STRUCT : longint;
  begin
    DBUS_TYPE_STRUCT:=longint('r');
  end;

{ was #define dname def_expr }
function DBUS_TYPE_DICT_ENTRY : longint;
  begin
    DBUS_TYPE_DICT_ENTRY:=longint('e');
  end;

{ was #define dname def_expr }
function DBUS_STRUCT_BEGIN_CHAR : longint;
  begin
    DBUS_STRUCT_BEGIN_CHAR:=longint('(');
  end;

{ was #define dname def_expr }
function DBUS_STRUCT_END_CHAR : longint;
  begin
    DBUS_STRUCT_END_CHAR:=longint(')');
  end;

{ was #define dname def_expr }
function DBUS_DICT_ENTRY_BEGIN_CHAR : longint;
  begin
    DBUS_DICT_ENTRY_BEGIN_CHAR:=longint('{');
  end;

{ was #define dname def_expr }
function DBUS_DICT_ENTRY_END_CHAR : longint;
  begin
    DBUS_DICT_ENTRY_END_CHAR:=longint('}');
  end;


end.
