unit nm_keyfile;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{$ifndef __NM_KEYFILE_H__}
{$define __NM_KEYFILE_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-core-types.h"}
{*
 * NMKeyfileHandlerFlags:
 * @NM_KEYFILE_HANDLER_FLAGS_NONE: no flags set.
 *
 * Flags for customizing nm_keyfile_read() and nm_keyfile_write().
 *
 * Currently no flags are implemented.
 *
 * Since: 1.30
  }
{< flags > }type
  PNMKeyfileHandlerFlags = ^TNMKeyfileHandlerFlags;
  TNMKeyfileHandlerFlags =  Longint;
  Const
    NM_KEYFILE_HANDLER_FLAGS_NONE = 0;
;
{*
 * NMKeyfileHandlerType:
 * @NM_KEYFILE_HANDLER_TYPE_WARN: a warning.
 * @NM_KEYFILE_HANDLER_TYPE_WRITE_CERT: for handling certificates while writing
 *   a connection to keyfile.
 *
 * The type of the callback for %NMKeyfileReadHandler and %NMKeyfileWriteHandler.
 * Depending on the type, you can interpret %NMKeyfileHandlerData.
 *
 * Since: 1.30
  }
type
  PNMKeyfileHandlerType = ^TNMKeyfileHandlerType;
  TNMKeyfileHandlerType =  Longint;
  Const
    NM_KEYFILE_HANDLER_TYPE_WARN = 1;
    NM_KEYFILE_HANDLER_TYPE_WRITE_CERT = 2;
;
{*
 * NMKeyfileHandlerData:
 *
 * Opaque type with parameters for the callback. The actual content
 * depends on the %NMKeyfileHandlerType.
 *
 * Since: 1.30
  }
type
{*
 * NMKeyfileReadHandler:
 * @keyfile: the #GKeyFile that is currently read
 * @connection: the #NMConnection that is being constructed.
 * @handler_type: the %NMKeyfileHandlerType that indicates which type
 *   the request is.
 * @handler_data: the #NMKeyfileHandlerData. What you can do with it
 *   depends on the @handler_type.
 * @user_data: the user-data argument to nm_keyfile_read().
 *
 * Hook to nm_keyfile_read().
 *
 * The callee may abort the reading by setting an error via nm_keyfile_handler_data_fail_with_error().
 *
 * Returns: the callee should return TRUE, if the event was handled and/or recognized.
 *   Otherwise, a default action will be performed that depends on the @type.
 *   For %NM_KEYFILE_HANDLER_TYPE_WARN type, the default action is doing nothing.
 *
 * Since: 1.30
  }

  TNMKeyfileReadHandler = function (keyfile:PGKeyFile; connection:PNMConnection; handler_type:TNMKeyfileHandlerType; handler_data:PNMKeyfileHandlerData; user_data:pointer):Tgboolean;cdecl;

function nm_keyfile_read(keyfile:PGKeyFile; base_dir:Pchar; handler_flags:TNMKeyfileHandlerFlags; handler:TNMKeyfileReadHandler; user_data:pointer; 
           error:PPGError):PNMConnection;cdecl;external libnm;
{*
 * NMKeyfileWriteHandler:
 * @connection: the #NMConnection that is currently written.
 * @keyfile: the #GKeyFile that is currently constructed.
 * @handler_type: the %NMKeyfileHandlerType that indicates which type
 *   the request is.
 * @handler_data: the #NMKeyfileHandlerData. What you can do with it
 *   depends on the @handler_type.
 * @user_data: the user-data argument to nm_keyfile_read().
 *
 * This is a hook to tweak the serialization.
 *
 * Handler for certain properties or events that are not entirely contained
 * within the keyfile or that might be serialized differently. The @type and
 * @handler_data arguments tell which kind of argument we have at hand.
 *
 * Currently only the type %NM_KEYFILE_HANDLER_TYPE_WRITE_CERT is supported.
 *
 * The callee may call nm_keyfile_handler_data_fail_with_error() to abort
 * the writing with error.
 *
 * Returns: the callee should return %TRUE if the event was handled. If the
 *   event was unhandled, a default action will be performed that depends on
 *   the @handler_type.
 *
 * Since: 1.30
  }
type

  TNMKeyfileWriteHandler = function (connection:PNMConnection; keyfile:PGKeyFile; handler_type:TNMKeyfileHandlerType; handler_data:PNMKeyfileHandlerData; user_data:pointer):Tgboolean;cdecl;

function nm_keyfile_write(connection:PNMConnection; handler_flags:TNMKeyfileHandlerFlags; handler:TNMKeyfileWriteHandler; user_data:pointer; error:PPGError):PGKeyFile;cdecl;external libnm;
{*************************************************************************** }
procedure nm_keyfile_handler_data_fail_with_error(handler_data:PNMKeyfileHandlerData; src:PGError);cdecl;external libnm;
procedure nm_keyfile_handler_data_get_context(handler_data:PNMKeyfileHandlerData; out_kf_group_name:PPchar; out_kf_key_name:PPchar; out_cur_setting:PPNMSetting; out_cur_property_name:PPchar);cdecl;external libnm;
{*
 * NMKeyfileWarnSeverity:
 * @NM_KEYFILE_WARN_SEVERITY_DEBUG: debug message
 * @NM_KEYFILE_WARN_SEVERITY_INFO: info message
 * @NM_KEYFILE_WARN_SEVERITY_INFO_MISSING_FILE: info message about a missing file
 * @NM_KEYFILE_WARN_SEVERITY_WARN: a warning message
 *
 * The severity level of %NM_KEYFILE_HANDLER_TYPE_WARN events.
 *
 * Since: 1.30
  }
type
  PNMKeyfileWarnSeverity = ^TNMKeyfileWarnSeverity;
  TNMKeyfileWarnSeverity =  Longint;
  Const
    NM_KEYFILE_WARN_SEVERITY_DEBUG = 1000;
    NM_KEYFILE_WARN_SEVERITY_INFO = 2000;
    NM_KEYFILE_WARN_SEVERITY_INFO_MISSING_FILE = 2901;
    NM_KEYFILE_WARN_SEVERITY_WARN = 3000;
;

procedure nm_keyfile_handler_data_warn_get(handler_data:PNMKeyfileHandlerData; out_message:PPchar; out_severity:PNMKeyfileWarnSeverity);cdecl;external libnm;
{$endif}
{ __NM_KEYFILE_H__  }

// === Konventiert am: 19-4-26 19:28:44 ===


implementation



end.
