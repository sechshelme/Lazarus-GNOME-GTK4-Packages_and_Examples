unit pk_control;

interface

uses
  fp_glib2, fp_packagekit;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_CONTROL_H}
{$define __PK_CONTROL_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include <packagekit-glib2/pk-enum.h>}

{ was #define dname def_expr }
function PK_CONTROL_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function PK_CONTROL_TYPE_ERROR : longint; { return type might be wrong }

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkControl, g_object_unref) }
{$endif}
{*
 * PkControlError:
 * @PK_CONTROL_ERROR_FAILED: the transaction failed for an unknown reason
 * @PK_CONTROL_ERROR_CANNOT_START_DAEMON: the PackageKit daemon failed to start
 *
 * Errors that can be thrown
  }
type
  PPkControlError = ^TPkControlError;
  TPkControlError =  Longint;
  Const
    PK_CONTROL_ERROR_FAILED = 0;
    PK_CONTROL_ERROR_CANNOT_START_DAEMON = 1;
;
type
  PPkControl = ^TPkControl;
  TPkControl = record
      parent : TGObject;
      priv : PPkControlPrivate;
    end;

{ signals  }
{ padding for future expansion  }
  PPkControlClass = ^TPkControlClass;
  TPkControlClass = record
      parent_class : TGObjectClass;
      transaction_list_changed : procedure (control:PPkControl; transaction_ids:PPgchar);cdecl;
      updates_changed : procedure (control:PPkControl);cdecl;
      repo_list_changed : procedure (control:PPkControl);cdecl;
      network_state_changed : procedure (control:PPkControl);cdecl;
      restart_schedule : procedure (control:PPkControl);cdecl;
      locked : procedure (control:PPkControl; is_locked:Tgboolean);cdecl;
      connection_changed : procedure (control:PPkControl; connected:Tgboolean);cdecl;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_control_error_quark:TGQuark;cdecl;external libpackagekit ;
function pk_control_get_type:TGType;cdecl;external libpackagekit ;
function pk_control_new:PPkControl;cdecl;external libpackagekit ;
procedure pk_control_get_tid_async(control:PPkControl; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
function pk_control_get_tid_finish(control:PPkControl; res:PGAsyncResult; error:PPGError):Pgchar;cdecl;external libpackagekit ;
procedure pk_control_suggest_daemon_quit_async(control:PPkControl; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
function pk_control_suggest_daemon_quit_finish(control:PPkControl; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
procedure pk_control_get_daemon_state_async(control:PPkControl; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
function pk_control_get_daemon_state_finish(control:PPkControl; res:PGAsyncResult; error:PPGError):Pgchar;cdecl;external libpackagekit ;
procedure pk_control_set_proxy_async(control:PPkControl; proxy_http:Pgchar; proxy_ftp:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_control_set_proxy2_async(control:PPkControl; proxy_http:Pgchar; proxy_https:Pgchar; proxy_ftp:Pgchar; proxy_socks:Pgchar; 
            no_proxy:Pgchar; pac:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
function pk_control_set_proxy_finish(control:PPkControl; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
procedure pk_control_get_time_since_action_async(control:PPkControl; role:TPkRoleEnum; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
function pk_control_get_time_since_action_finish(control:PPkControl; res:PGAsyncResult; error:PPGError):Tguint;cdecl;external libpackagekit ;
procedure pk_control_get_transaction_list_async(control:PPkControl; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
function pk_control_get_transaction_list_finish(control:PPkControl; res:PGAsyncResult; error:PPGError):^Pgchar;cdecl;external libpackagekit ;
procedure pk_control_can_authorize_async(control:PPkControl; action_id:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
function pk_control_can_authorize_finish(control:PPkControl; res:PGAsyncResult; error:PPGError):TPkAuthorizeEnum;cdecl;external libpackagekit ;
procedure pk_control_get_properties_async(control:PPkControl; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
function pk_control_get_properties_finish(control:PPkControl; res:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libpackagekit ;
{$endif}
{ __PK_CONTROL_H  }

// === Konventiert am: 7-9-26 15:03:46 ===

function PK_TYPE_CONTROL : TGType;
function PK_CONTROL(obj : Pointer) : PPkControl;
function PK_CONTROL_CLASS(klass : Pointer) : PPkControlClass;
function PK_IS_CONTROL(obj : Pointer) : Tgboolean;
function PK_IS_CONTROL_CLASS(klass : Pointer) : Tgboolean;
function PK_CONTROL_GET_CLASS(obj : Pointer) : PPkControlClass;

implementation

function PK_TYPE_CONTROL : TGType;
  begin
    PK_TYPE_CONTROL:=pk_control_get_type;
  end;

function PK_CONTROL(obj : Pointer) : PPkControl;
begin
  Result := PPkControl(g_type_check_instance_cast(obj, PK_TYPE_CONTROL));
end;

function PK_CONTROL_CLASS(klass : Pointer) : PPkControlClass;
begin
  Result := PPkControlClass(g_type_check_class_cast(klass, PK_TYPE_CONTROL));
end;

function PK_IS_CONTROL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_CONTROL);
end;

function PK_IS_CONTROL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_CONTROL);
end;

function PK_CONTROL_GET_CLASS(obj : Pointer) : PPkControlClass;
begin
  Result := PPkControlClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function PK_CONTROL_ERROR : longint; { return type might be wrong }
  begin
    PK_CONTROL_ERROR:=pk_control_error_quark;
  end;

{ was #define dname def_expr }
function PK_CONTROL_TYPE_ERROR : longint; { return type might be wrong }
  begin
    PK_CONTROL_TYPE_ERROR:=pk_control_error_get_type;
  end;


end.
