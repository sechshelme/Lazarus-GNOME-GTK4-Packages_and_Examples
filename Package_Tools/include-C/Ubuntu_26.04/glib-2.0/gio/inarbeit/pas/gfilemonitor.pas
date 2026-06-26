unit gfilemonitor;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_FILE_MONITOR_H__}
{$define __G_FILE_MONITOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{< private > }
  PGFileMonitor = ^TGFileMonitor;
  TGFileMonitor = record
      parent_instance : TGObject;
      priv : PGFileMonitorPrivate;
    end;

{ Signals  }
{ Virtual Table  }
{< private > }
{ Padding for future expansion  }
  PGFileMonitorClass = ^TGFileMonitorClass;
  TGFileMonitorClass = record
      parent_class : TGObjectClass;
      changed : procedure (monitor:PGFileMonitor; file:PGFile; other_file:PGFile; event_type:TGFileMonitorEvent);cdecl;
      cancel : function (monitor:PGFileMonitor):Tgboolean;cdecl;
      _g_reserved1 : procedure ;cdecl;
      _g_reserved2 : procedure ;cdecl;
      _g_reserved3 : procedure ;cdecl;
      _g_reserved4 : procedure ;cdecl;
      _g_reserved5 : procedure ;cdecl;
    end;


function g_file_monitor_get_type:TGType;cdecl;external libgio2;
function g_file_monitor_cancel(monitor:PGFileMonitor):Tgboolean;cdecl;external libgio2;
function g_file_monitor_is_cancelled(monitor:PGFileMonitor):Tgboolean;cdecl;external libgio2;
procedure g_file_monitor_set_rate_limit(monitor:PGFileMonitor; limit_msecs:Tgint);cdecl;external libgio2;
{ For implementations  }
procedure g_file_monitor_emit_event(monitor:PGFileMonitor; child:PGFile; other_file:PGFile; event_type:TGFileMonitorEvent);cdecl;external libgio2;
{$endif}
{ __G_FILE_MONITOR_H__  }

// === Konventiert am: 26-6-26 19:21:33 ===

function G_TYPE_FILE_MONITOR : TGType;
function G_FILE_MONITOR(obj : Pointer) : PGFileMonitor;
function G_FILE_MONITOR_CLASS(klass : Pointer) : PGFileMonitorClass;
function G_IS_FILE_MONITOR(obj : Pointer) : Tgboolean;
function G_IS_FILE_MONITOR_CLASS(klass : Pointer) : Tgboolean;
function G_FILE_MONITOR_GET_CLASS(obj : Pointer) : PGFileMonitorClass;

implementation

function G_TYPE_FILE_MONITOR : TGType;
  begin
    G_TYPE_FILE_MONITOR:=g_file_monitor_get_type;
  end;

function G_FILE_MONITOR(obj : Pointer) : PGFileMonitor;
begin
  Result := PGFileMonitor(g_type_check_instance_cast(obj, G_TYPE_FILE_MONITOR));
end;

function G_FILE_MONITOR_CLASS(klass : Pointer) : PGFileMonitorClass;
begin
  Result := PGFileMonitorClass(g_type_check_class_cast(klass, G_TYPE_FILE_MONITOR));
end;

function G_IS_FILE_MONITOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_FILE_MONITOR);
end;

function G_IS_FILE_MONITOR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_FILE_MONITOR);
end;

function G_FILE_MONITOR_GET_CLASS(obj : Pointer) : PGFileMonitorClass;
begin
  Result := PGFileMonitorClass(PGTypeInstance(obj)^.g_class);
end;



end.
