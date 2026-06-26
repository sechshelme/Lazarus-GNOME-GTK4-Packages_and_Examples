
unit gipv6tclassmessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gipv6tclassmessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gipv6tclassmessage.h
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
PGIPv6TclassMessage  = ^GIPv6TclassMessage;
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
{$ifndef __G_IPV6_TCLASS_MESSAGE_H__}
{$define __G_IPV6_TCLASS_MESSAGE_H__}
{$include <gio/gsocketcontrolmessage.h>}

{ was #define dname def_expr }
function G_TYPE_IPV6_TCLASS_MESSAGE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GIPv6TclassMessage, g_ipv6_tclass_message, G, IPV6_TCLASS_MESSAGE, GSocketControlMessage) }
function g_ipv6_tclass_message_new(dscp:Tguint8; ecn:TGEcnCodePoint):PGSocketControlMessage;cdecl;external;
function g_ipv6_tclass_message_get_dscp(message:PGIPv6TclassMessage):Tguint8;cdecl;external;
function g_ipv6_tclass_message_get_ecn(message:PGIPv6TclassMessage):TGEcnCodePoint;cdecl;external;
{$endif}
{ __G_IPV6_TCLASS_MESSAGE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_IPV6_TCLASS_MESSAGE : longint; { return type might be wrong }
  begin
    G_TYPE_IPV6_TCLASS_MESSAGE:=g_ipv6_tclass_message_get_type;
  end;


end.
