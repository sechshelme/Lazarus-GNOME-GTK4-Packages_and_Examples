
unit gioscheduler;
interface

{
  Automatically converted by H2Pas 1.0.0 from gioscheduler.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gioscheduler.h
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
PGCancellable  = ^GCancellable;
PGIOSchedulerJob  = ^GIOSchedulerJob;
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
{$ifndef __G_IO_SCHEDULER_H__}
{$define __G_IO_SCHEDULER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{xxxxxGLIB_DEPRECATED_IN_2_36_FOR ("GThreadPool or g_task_run_in_thread") }

procedure g_io_scheduler_push_job(job_func:TGIOSchedulerJobFunc; user_data:Tgpointer; notify:TGDestroyNotify; io_priority:Tgint; cancellable:PGCancellable);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_36 }
procedure g_io_scheduler_cancel_all_jobs;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_36_FOR (g_main_context_invoke) }
function g_io_scheduler_job_send_to_mainloop(job:PGIOSchedulerJob; func:TGSourceFunc; user_data:Tgpointer; notify:TGDestroyNotify):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_36_FOR (g_main_context_invoke) }
procedure g_io_scheduler_job_send_to_mainloop_async(job:PGIOSchedulerJob; func:TGSourceFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
{$endif}
{ __G_IO_SCHEDULER_H__  }

implementation


end.
