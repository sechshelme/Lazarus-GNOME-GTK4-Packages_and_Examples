
unit colorbalance;
interface

{
  Automatically converted by H2Pas 1.0.0 from colorbalance.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    colorbalance
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
PGList  = ^GList;
PGstColorBalance  = ^GstColorBalance;
PGstColorBalanceChannel  = ^GstColorBalanceChannel;
PGstColorBalanceInterface  = ^GstColorBalanceInterface;
PGstColorBalanceType  = ^GstColorBalanceType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Color Balance
 * Copyright (C) 2003 Ronald Bultje <rbultje@ronald.bitfreak.net>
 *
 * color-balance.h: image color balance interface design
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
{$ifndef __GST_COLOR_BALANCE_H__}
{$define __GST_COLOR_BALANCE_H__}
{$include <gst/gst.h>}
{$include <gst/video/colorbalancechannel.h>}

{ was #define dname def_expr }
function GST_TYPE_COLOR_BALANCE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLOR_BALANCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_COLOR_BALANCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLOR_BALANCE_GET_INTERFACE(inst : longint) : longint;

type
{*
 * GstColorBalanceType:
 * @GST_COLOR_BALANCE_HARDWARE: Color balance is implemented with dedicated
 *         hardware.
 * @GST_COLOR_BALANCE_SOFTWARE: Color balance is implemented via software
 *         processing.
 *
 * An enumeration indicating whether an element implements color balancing
 * operations in software or in dedicated hardware. In general, dedicated
 * hardware implementations (such as those provided by xvimagesink) are
 * preferred.
  }

  PGstColorBalanceType = ^TGstColorBalanceType;
  TGstColorBalanceType =  Longint;
  Const
    GST_COLOR_BALANCE_HARDWARE = 0;
    GST_COLOR_BALANCE_SOFTWARE = 1;
;
{*
 * GstColorBalanceInterface:
 * @iface: the parent interface
 * @get_balance_type: implementation type
 * @list_channels: list handled channels
 * @set_value: set a channel value
 * @get_value: get a channel value
 * @value_changed: default handler for value changed notification
 *
 * Color-balance interface.
  }
{ virtual functions  }
(* Const before type ignored *)
{ signals  }
{< private > }
type
  PGstColorBalanceInterface = ^TGstColorBalanceInterface;
  TGstColorBalanceInterface = record
      iface : TGTypeInterface;
      list_channels : function (balance:PGstColorBalance):PGList;cdecl;
      set_value : procedure (balance:PGstColorBalance; channel:PGstColorBalanceChannel; value:Tgint);cdecl;
      get_value : function (balance:PGstColorBalance; channel:PGstColorBalanceChannel):Tgint;cdecl;
      get_balance_type : function (balance:PGstColorBalance):TGstColorBalanceType;cdecl;
      value_changed : procedure (balance:PGstColorBalance; channel:PGstColorBalanceChannel; value:Tgint);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_color_balance_get_type:TGType;cdecl;external;
{ virtual class function wrappers  }
(* Const before type ignored *)
function gst_color_balance_list_channels(balance:PGstColorBalance):PGList;cdecl;external;
procedure gst_color_balance_set_value(balance:PGstColorBalance; channel:PGstColorBalanceChannel; value:Tgint);cdecl;external;
function gst_color_balance_get_value(balance:PGstColorBalance; channel:PGstColorBalanceChannel):Tgint;cdecl;external;
function gst_color_balance_get_balance_type(balance:PGstColorBalance):TGstColorBalanceType;cdecl;external;
{ trigger signal  }
procedure gst_color_balance_value_changed(balance:PGstColorBalance; channel:PGstColorBalanceChannel; value:Tgint);cdecl;external;
{$endif}
{ __GST_COLOR_BALANCE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_COLOR_BALANCE : longint; { return type might be wrong }
  begin
    GST_TYPE_COLOR_BALANCE:=gst_color_balance_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLOR_BALANCE(obj : longint) : longint;
begin
  GST_COLOR_BALANCE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_COLOR_BALANCE,GstColorBalance);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_COLOR_BALANCE(obj : longint) : longint;
begin
  GST_IS_COLOR_BALANCE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_COLOR_BALANCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_COLOR_BALANCE_GET_INTERFACE(inst : longint) : longint;
begin
  GST_COLOR_BALANCE_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GST_TYPE_COLOR_BALANCE,GstColorBalanceInterface);
end;


end.
