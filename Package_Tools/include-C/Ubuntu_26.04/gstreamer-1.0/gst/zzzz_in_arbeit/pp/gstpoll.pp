
unit gstpoll;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstpoll.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstpoll.h
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
PGPollFD  = ^GPollFD;
PGstPoll  = ^GstPoll;
PGstPollFD  = ^GstPollFD;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999 Erik Walthinsen <omega@cse.ogi.edu>
 * Copyright (C) 2004 Wim Taymans <wim.taymans@gmail.com>
 * Copyright (C) 2007 Peter Kjellerstedt <pkj@axis.com>
 *
 * gstpoll.h: File descriptor set
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_POLL_H__}
{$define __GST_POLL_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gst/gstclock.h>}
{*
 * GstPoll:
 *
 * A set of file/network descriptors.
  }
type
{*
 * GstPollFD:
 * @fd: a file descriptor
 *
 * A file descriptor object.
  }
{< private > }

  PGstPollFD = ^TGstPollFD;
  TGstPollFD = record
      fd : longint;
      idx : Tgint;
    end;
{*
 * GST_POLL_FD_INIT:
 *
 * A #GstPollFD must be initialized with this macro, before it can be
 * used. This macro can used be to initialize a variable, but it cannot
 * be assigned to a variable. In that case you have to use
 * gst_poll_fd_init().
  }
{ xxxxx #define GST_POLL_FD_INIT   -1, -1  }

function gst_poll_new(controllable:Tgboolean):PGstPoll;cdecl;external;
function gst_poll_new_timer:PGstPoll;cdecl;external;
procedure gst_poll_free(set:PGstPoll);cdecl;external;
procedure gst_poll_get_read_gpollfd(set:PGstPoll; fd:PGPollFD);cdecl;external;
procedure gst_poll_fd_init(fd:PGstPollFD);cdecl;external;
function gst_poll_add_fd(set:PGstPoll; fd:PGstPollFD):Tgboolean;cdecl;external;
function gst_poll_remove_fd(set:PGstPoll; fd:PGstPollFD):Tgboolean;cdecl;external;
function gst_poll_fd_ctl_write(set:PGstPoll; fd:PGstPollFD; active:Tgboolean):Tgboolean;cdecl;external;
function gst_poll_fd_ctl_read(set:PGstPoll; fd:PGstPollFD; active:Tgboolean):Tgboolean;cdecl;external;
function gst_poll_fd_ctl_pri(set:PGstPoll; fd:PGstPollFD; active:Tgboolean):Tgboolean;cdecl;external;
procedure gst_poll_fd_ignored(set:PGstPoll; fd:PGstPollFD);cdecl;external;
(* Const before type ignored *)
function gst_poll_fd_has_closed(set:PGstPoll; fd:PGstPollFD):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_poll_fd_has_error(set:PGstPoll; fd:PGstPollFD):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_poll_fd_can_read(set:PGstPoll; fd:PGstPollFD):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_poll_fd_can_write(set:PGstPoll; fd:PGstPollFD):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_poll_fd_has_pri(set:PGstPoll; fd:PGstPollFD):Tgboolean;cdecl;external;
function gst_poll_wait(set:PGstPoll; timeout:TGstClockTime):Tgint;cdecl;external;
function gst_poll_set_controllable(set:PGstPoll; controllable:Tgboolean):Tgboolean;cdecl;external;
procedure gst_poll_restart(set:PGstPoll);cdecl;external;
procedure gst_poll_set_flushing(set:PGstPoll; flushing:Tgboolean);cdecl;external;
function gst_poll_write_control(set:PGstPoll):Tgboolean;cdecl;external;
function gst_poll_read_control(set:PGstPoll):Tgboolean;cdecl;external;
{$endif}
{ __GST_POLL_H__  }

implementation


end.
