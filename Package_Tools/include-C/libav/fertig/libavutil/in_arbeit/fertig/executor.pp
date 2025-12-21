
unit executor;
interface

{
  Automatically converted by H2Pas 1.0.0 from executor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    executor.h
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
PAVExecutor  = ^AVExecutor;
PAVTask  = ^AVTask;
PAVTaskCallbacks  = ^AVTaskCallbacks;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023 Nuo Mi
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef AVUTIL_EXECUTOR_H}
{$define AVUTIL_EXECUTOR_H}
type
  PAVTask = ^TAVTask;
  TAVTask = record
      next : PAVTask;
    end;

{ return 1 if a's priority > b's priority }
(* Const before type ignored *)
(* Const before type ignored *)
{ task is ready for run }
(* Const before type ignored *)
{ run the task }

  PAVTaskCallbacks = ^TAVTaskCallbacks;
  TAVTaskCallbacks = record
      user_data : pointer;
      local_context_size : longint;
      priority_higher : function (a:PAVTask; b:PAVTask):longint;cdecl;
      ready : function (t:PAVTask; user_data:pointer):longint;cdecl;
      run : function (t:PAVTask; local_context:pointer; user_data:pointer):longint;cdecl;
    end;
{*
 * Alloc executor
 * @param callbacks callback structure for executor
 * @param thread_count worker thread number
 * @return return the executor
  }
(* Const before type ignored *)

function av_executor_alloc(callbacks:PAVTaskCallbacks; thread_count:longint):PAVExecutor;cdecl;external;
{*
 * Free executor
 * @param e  pointer to executor
  }
procedure av_executor_free(e:PPAVExecutor);cdecl;external;
{*
 * Add task to executor
 * @param e pointer to executor
 * @param t pointer to task. If NULL, it will wakeup one work thread
  }
procedure av_executor_execute(e:PAVExecutor; t:PAVTask);cdecl;external;
{$endif}
{AVUTIL_EXECUTOR_H }

implementation


end.
