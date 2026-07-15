
unit colorbalancechannel;
interface

{
  Automatically converted by H2Pas 1.0.0 from colorbalancechannel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    colorbalancechannel.h
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
Pgchar  = ^gchar;
PGstColorBalanceChannel  = ^GstColorBalanceChannel;
PGstColorBalanceChannelClass  = ^GstColorBalanceChannelClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Color Balance
 * Copyright (C) 2003 Ronald Bultje <rbultje@ronald.bitfreak.net>
 *
 * colorbalancechannel.h: individual channel object
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
{$ifndef __GST_COLOR_BALANCE_CHANNEL_H__}
{$define __GST_COLOR_BALANCE_CHANNEL_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_COLOR_BALANCE_CHANNEL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLOR_BALANCE_CHANNEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLOR_BALANCE_CHANNEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_COLOR_BALANCE_CHANNEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_COLOR_BALANCE_CHANNEL_CLASS(klass : longint) : longint;

type
{*
 * GstColorBalanceChannel:
 * @label: A string containing a descriptive name for this channel
 * @min_value: The minimum valid value for this channel.
 * @max_value: The maximum valid value for this channel.
  }
{< public > }
{< private > }
  PGstColorBalanceChannel = ^TGstColorBalanceChannel;
  TGstColorBalanceChannel = record
      parent : TGObject;
      _label : Pgchar;
      min_value : Tgint;
      max_value : Tgint;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstColorBalanceChannelClass:
 * @parent: the parent class
 * @value_changed: default handler for value changed notification
 *
 * Color-balance channel class.
  }
{ signals  }
{< private > }
  PGstColorBalanceChannelClass = ^TGstColorBalanceChannelClass;
  TGstColorBalanceChannelClass = record
      parent : TGObjectClass;
      value_changed : procedure (channel:PGstColorBalanceChannel; value:Tgint);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_color_balance_channel_get_type:TGType;cdecl;external;
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstColorBalanceChannel, gst_object_unref) }
{$endif}
{ __GST_COLOR_BALANCE_CHANNEL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_COLOR_BALANCE_CHANNEL : longint; { return type might be wrong }
  begin
    GST_TYPE_COLOR_BALANCE_CHANNEL:=gst_color_balance_channel_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLOR_BALANCE_CHANNEL(obj : longint) : longint;
begin
  GST_COLOR_BALANCE_CHANNEL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_COLOR_BALANCE_CHANNEL,GstColorBalanceChannel);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLOR_BALANCE_CHANNEL_CLASS(klass : longint) : longint;
begin
  GST_COLOR_BALANCE_CHANNEL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_COLOR_BALANCE_CHANNEL,GstColorBalanceChannelClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_COLOR_BALANCE_CHANNEL(obj : longint) : longint;
begin
  GST_IS_COLOR_BALANCE_CHANNEL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_COLOR_BALANCE_CHANNEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_COLOR_BALANCE_CHANNEL_CLASS(klass : longint) : longint;
begin
  GST_IS_COLOR_BALANCE_CHANNEL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_COLOR_BALANCE_CHANNEL);
end;


end.
