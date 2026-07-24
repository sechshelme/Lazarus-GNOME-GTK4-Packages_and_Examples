
unit gstplayer_g_main_context_signal_dispatcher;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstplayer_g_main_context_signal_dispatcher.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstplayer_g_main_context_signal_dispatcher.h
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
PGMainContext  = ^GMainContext;
PGstPlayerGMainContextSignalDispatcher  = ^GstPlayerGMainContextSignalDispatcher;
PGstPlayerSignalDispatcher  = ^GstPlayerSignalDispatcher;
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
{$ifndef __GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_H__}
{$define __GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_H__}
{$include <gst/player/gstplayer-types.h>}
{$include <gst/player/gstplayer-signal-dispatcher.h>}
type

{ was #define dname def_expr }
function GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CAST(obj : longint) : PGstPlayerGMainContextSignalDispatcher;

function gst_player_g_main_context_signal_dispatcher_get_type:TGType;cdecl;external;
function gst_player_g_main_context_signal_dispatcher_new(application_context:PGMainContext):PGstPlayerSignalDispatcher;cdecl;external;
{$endif}
{ __GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER:=gst_player_g_main_context_signal_dispatcher_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj : longint) : longint;
begin
  GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_GET_CLASS(obj : longint) : longint;
begin
  GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER,GstPlayerGMainContextSignalDispatcherClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER(obj : longint) : longint;
begin
  GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER,GstPlayerGMainContextSignalDispatcher);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER,GstPlayerGMainContextSignalDispatcherClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CAST(obj : longint) : PGstPlayerGMainContextSignalDispatcher;
begin
  GST_PLAYER_G_MAIN_CONTEXT_SIGNAL_DISPATCHER_CAST:=PGstPlayerGMainContextSignalDispatcher(obj);
end;


end.
