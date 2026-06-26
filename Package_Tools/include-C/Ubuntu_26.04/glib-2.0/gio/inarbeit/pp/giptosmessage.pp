
unit giptosmessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from giptosmessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    giptosmessage.h
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
PGIPTosMessage  = ^GIPTosMessage;
PGSocketControlMessage  = ^GSocketControlMessage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2025 Collabora Ltd.
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
 * Authors: Jakub Adam <jakub.adam@collabora.com>
  }
{$ifndef __G_IP_TOS_MESSAGE_H__}
{$define __G_IP_TOS_MESSAGE_H__}
{$include <gio/gsocketcontrolmessage.h>}

{ was #define dname def_expr }
function G_TYPE_IP_TOS_MESSAGE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GIPTosMessage, g_ip_tos_message, G, IP_TOS_MESSAGE, GSocketControlMessage) }
function g_ip_tos_message_new(dscp:Tguint8; ecn:TGEcnCodePoint):PGSocketControlMessage;cdecl;external;
function g_ip_tos_message_get_dscp(message:PGIPTosMessage):Tguint8;cdecl;external;
function g_ip_tos_message_get_ecn(message:PGIPTosMessage):TGEcnCodePoint;cdecl;external;
{$endif}
{ __G_IP_TOS_MESSAGE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_IP_TOS_MESSAGE : longint; { return type might be wrong }
  begin
    G_TYPE_IP_TOS_MESSAGE:=g_ip_tos_message_get_type;
  end;


end.
