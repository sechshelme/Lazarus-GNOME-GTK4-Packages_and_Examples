unit gstplayer_signal_dispatcher;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2014-2015 Sebastian Dröge <sebastian@centricular.com>
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
{$ifndef __GST_PLAYER_SIGNAL_DISPATCHER_H__}
{$define __GST_PLAYER_SIGNAL_DISPATCHER_H__}
{$include <gst/gst.h>}
{$include <gst/player/gstplayer-types.h>}
type

type

  TGstPlayerSignalDispatcherFunc = procedure (data:Tgpointer);cdecl;
  PGstPlayerSignalDispatcherInterface = ^TGstPlayerSignalDispatcherInterface;
  TGstPlayerSignalDispatcherInterface = record
      parent_iface : TGTypeInterface;cdecl;
      dispatch : procedure (self:PGstPlayerSignalDispatcher; player:PGstPlayer; emitter:TGstPlayerSignalDispatcherFunc; data:Tgpointer; destroy:TGDestroyNotify);cdecl;
    end;


function gst_player_signal_dispatcher_get_type:TGType;cdecl;external libgstplayer;
{$endif}
{ __GST_PLAYER_SIGNAL_DISPATCHER_H__  }

// === Konventiert am: 24-7-26 19:52:01 ===

function GST_TYPE_PLAYER_SIGNAL_DISPATCHER : TGType;
function GST_PLAYER_SIGNAL_DISPATCHER(obj : Pointer) : PGstPlayerSignalDispatcher;
function GST_IS_PLAYER_SIGNAL_DISPATCHER(obj : Pointer) : Tgboolean;
function GST_PLAYER_SIGNAL_DISPATCHER_GET_INTERFACE(obj : Pointer) : PGstPlayerSignalDispatcherInterface;

implementation

function GST_TYPE_PLAYER_SIGNAL_DISPATCHER : TGType;
  begin
    GST_TYPE_PLAYER_SIGNAL_DISPATCHER:=gst_player_signal_dispatcher_get_type;
  end;

function GST_PLAYER_SIGNAL_DISPATCHER(obj : Pointer) : PGstPlayerSignalDispatcher;
begin
  Result := PGstPlayerSignalDispatcher(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_SIGNAL_DISPATCHER));
end;

function GST_IS_PLAYER_SIGNAL_DISPATCHER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_PLAYER_SIGNAL_DISPATCHER);
end;

function GST_PLAYER_SIGNAL_DISPATCHER_GET_INTERFACE(obj : Pointer) : PGstPlayerSignalDispatcherInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_PLAYER_SIGNAL_DISPATCHER);
end;



end.
