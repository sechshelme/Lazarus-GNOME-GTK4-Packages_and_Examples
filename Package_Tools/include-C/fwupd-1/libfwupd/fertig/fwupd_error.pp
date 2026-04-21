
unit fwupd_error;
interface

{
  Automatically converted by H2Pas 1.0.0 from fwupd_error.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fwupd_error.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PFwupdError  = ^FwupdError;
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2015-2016 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include <glib.h>}

{ was #define dname def_expr }
function FWUPD_ERROR : longint; { return type might be wrong }

{*
 * FwupdError:
 * @FWUPD_ERROR_INTERNAL:			Internal error
 * @FWUPD_ERROR_VERSION_NEWER:			Installed newer firmware version
 * @FWUPD_ERROR_VERSION_SAME:			Installed same firmware version
 * @FWUPD_ERROR_ALREADY_PENDING:		Already set to be installed offline
 * @FWUPD_ERROR_AUTH_FAILED:			Failed to get authentication
 * @FWUPD_ERROR_READ:				Failed to read from device
 * @FWUPD_ERROR_WRITE:				Failed to write to the device
 * @FWUPD_ERROR_INVALID_FILE:			Invalid file format
 * @FWUPD_ERROR_NOT_FOUND:			No matching device exists
 * @FWUPD_ERROR_NOTHING_TO_DO:			Nothing to do
 * @FWUPD_ERROR_NOT_SUPPORTED:			Action was not possible
 * @FWUPD_ERROR_SIGNATURE_INVALID:		Signature was invalid
 * @FWUPD_ERROR_AC_POWER_REQUIRED:		AC power was required
 * @FWUPD_ERROR_PERMISSION_DENIED:		Permission was denied
 * @FWUPD_ERROR_BROKEN_SYSTEM:			User has configured their system in a broken way
 * @FWUPD_ERROR_BATTERY_LEVEL_TOO_LOW:		The system battery level is too low
 * @FWUPD_ERROR_NEEDS_USER_ACTION:		User needs to do an action to complete the update
 * @FWUPD_ERROR_AUTH_EXPIRED:			Failed to get auth as credentials have expired
 * @FWUPD_ERROR_INVALID_DATA:			Invalid data
 *
 * The error code.
 * }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.2  }
{ Since: 0.8.0  }
{ Since: 0.9.8  }
{ Since: 1.2.8  }
{ Since: 1.2.10  }
{ Since: 1.3.3  }
{ Since: 1.7.5  }
{ Since: 1.9.27  }
{< private > }
type
  PFwupdError = ^TFwupdError;
  TFwupdError =  Longint;
  Const
    FWUPD_ERROR_INTERNAL = 0;
    FWUPD_ERROR_VERSION_NEWER = 1;
    FWUPD_ERROR_VERSION_SAME = 2;
    FWUPD_ERROR_ALREADY_PENDING = 3;
    FWUPD_ERROR_AUTH_FAILED = 4;
    FWUPD_ERROR_READ = 5;
    FWUPD_ERROR_WRITE = 6;
    FWUPD_ERROR_INVALID_FILE = 7;
    FWUPD_ERROR_NOT_FOUND = 8;
    FWUPD_ERROR_NOTHING_TO_DO = 9;
    FWUPD_ERROR_NOT_SUPPORTED = 10;
    FWUPD_ERROR_SIGNATURE_INVALID = 11;
    FWUPD_ERROR_AC_POWER_REQUIRED = 12;
    FWUPD_ERROR_PERMISSION_DENIED = 13;
    FWUPD_ERROR_BROKEN_SYSTEM = 14;
    FWUPD_ERROR_BATTERY_LEVEL_TOO_LOW = 15;
    FWUPD_ERROR_NEEDS_USER_ACTION = 16;
    FWUPD_ERROR_AUTH_EXPIRED = 17;
    FWUPD_ERROR_INVALID_DATA = 18;
    FWUPD_ERROR_LAST = 19;
;

function fwupd_error_quark:TGQuark;cdecl;external;
(* Const before type ignored *)
function fwupd_error_to_string(error:TFwupdError):Pgchar;cdecl;external;
(* Const before type ignored *)
function fwupd_error_from_string(error:Pgchar):TFwupdError;cdecl;external;

implementation

{ was #define dname def_expr }
function FWUPD_ERROR : longint; { return type might be wrong }
  begin
    FWUPD_ERROR:=fwupd_error_quark;
  end;


end.
