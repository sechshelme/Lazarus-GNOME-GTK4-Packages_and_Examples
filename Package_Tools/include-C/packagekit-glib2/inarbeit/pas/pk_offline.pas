unit pk_offline;

interface

uses
  fp_glib2, fp_packagekit;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2014 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU General Public License Version 2
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
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_OFFLINE_H}
{$define __PK_OFFLINE_H}
{$include <glib.h>}
{$include <gio/gio.h>}
{$include "pk-package-sack.h"}
{$include "pk-results.h"}

{ was #define dname def_expr }
function PK_OFFLINE_ERROR : longint; { return type might be wrong }

{*
 * PkOfflineAction:
 * @PK_OFFLINE_ACTION_UNKNOWN:		Unknown
 * @PK_OFFLINE_ACTION_REBOOT:		Reboot
 * @PK_OFFLINE_ACTION_POWER_OFF:	Power-off
 * @PK_OFFLINE_ACTION_UNSET:		No action set
 *
 * Actions that can be taken after an offline operation.
  }
{< private > }
type
  PPkOfflineAction = ^TPkOfflineAction;
  TPkOfflineAction =  Longint;
  Const
    PK_OFFLINE_ACTION_UNKNOWN = 0;
    PK_OFFLINE_ACTION_REBOOT = 1;
    PK_OFFLINE_ACTION_POWER_OFF = 2;
    PK_OFFLINE_ACTION_UNSET = 3;
    PK_OFFLINE_ACTION_LAST = 4;
;
{*
 * PkOfflineError:
 * @PK_OFFLINE_ERROR_FAILED:		No specific reason
 * @PK_OFFLINE_ERROR_INVALID_VALUE:	An invalid value was specified
 * @PK_OFFLINE_ERROR_NO_DATA:		No data was available
 *
 * Errors that can be thrown
  }
{< private > }
type
  PPkOfflineError = ^TPkOfflineError;
  TPkOfflineError =  Longint;
  Const
    PK_OFFLINE_ERROR_FAILED = 0;
    PK_OFFLINE_ERROR_INVALID_VALUE = 1;
    PK_OFFLINE_ERROR_NO_DATA = 2;
    PK_OFFLINE_ERROR_LAST = 3;
;
{*
 * PkOfflineFlags:
 * @PK_OFFLINE_FLAGS_NONE:		No specific flag
 * @PK_OFFLINE_FLAGS_INTERACTIVE:	Run the action in an interactive mode, allowing polkit authentication dialogs
 *
 * Flags to be used for the method invocations.
 *
 * Since: 1.2.5
  }
type
  PPkOfflineFlags = ^TPkOfflineFlags;
  TPkOfflineFlags =  Longint;
  Const
    PK_OFFLINE_FLAGS_NONE = 0;
    PK_OFFLINE_FLAGS_INTERACTIVE = 1 shl 0;
;

function pk_offline_error_quark:TGQuark;cdecl;external libpackagekit ;
function pk_offline_action_to_string(action:TPkOfflineAction):Pgchar;cdecl;external libpackagekit ;
function pk_offline_action_from_string(action:Pgchar):TPkOfflineAction;cdecl;external libpackagekit ;
function pk_offline_get_action(error:PPGError):TPkOfflineAction;cdecl;external libpackagekit ;
function pk_offline_get_prepared_ids(error:PPGError):^Pgchar;cdecl;external libpackagekit ;
function pk_offline_get_prepared_upgrade_name(error:PPGError):Pgchar;cdecl;external libpackagekit ;
function pk_offline_get_prepared_upgrade_version(error:PPGError):Pgchar;cdecl;external libpackagekit ;
function pk_offline_get_prepared_sack(error:PPGError):PPkPackageSack;cdecl;external libpackagekit ;
function pk_offline_get_prepared_monitor(cancellable:PGCancellable; error:PPGError):PGFileMonitor;cdecl;external libpackagekit ;
function pk_offline_get_prepared_upgrade_monitor(cancellable:PGCancellable; error:PPGError):PGFileMonitor;cdecl;external libpackagekit ;
function pk_offline_get_action_monitor(cancellable:PGCancellable; error:PPGError):PGFileMonitor;cdecl;external libpackagekit ;
function pk_offline_get_results(error:PPGError):PPkResults;cdecl;external libpackagekit ;
function pk_offline_get_results_mtime(error:PPGError):Tguint64;cdecl;external libpackagekit ;
function pk_offline_cancel(cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_offline_cancel_with_flags(flags:TPkOfflineFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_offline_clear_results(cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_offline_clear_results_with_flags(flags:TPkOfflineFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_offline_trigger(action:TPkOfflineAction; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_offline_trigger_with_flags(action:TPkOfflineAction; flags:TPkOfflineFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_offline_trigger_upgrade(action:TPkOfflineAction; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
function pk_offline_trigger_upgrade_with_flags(action:TPkOfflineAction; flags:TPkOfflineFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
{$endif}
{ __PK_OFFLINE_H  }

// === Konventiert am: 7-9-26 15:11:26 ===


implementation


{ was #define dname def_expr }
function PK_OFFLINE_ERROR : longint; { return type might be wrong }
  begin
    PK_OFFLINE_ERROR:=pk_offline_error_quark;
  end;


end.
