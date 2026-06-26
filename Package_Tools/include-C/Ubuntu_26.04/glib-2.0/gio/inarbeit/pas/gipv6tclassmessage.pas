unit gipv6tclassmessage;

interface

uses
  fp_glib2;

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

{G_DECLARE_FINAL_TYPE (GIPv6TclassMessage, g_ipv6_tclass_message, G, IPV6_TCLASS_MESSAGE, GSocketControlMessage) }
function g_ipv6_tclass_message_new(dscp:Tguint8; ecn:TGEcnCodePoint):PGSocketControlMessage;cdecl;external libgio2;
function g_ipv6_tclass_message_get_dscp(message:PGIPv6TclassMessage):Tguint8;cdecl;external libgio2;
function g_ipv6_tclass_message_get_ecn(message:PGIPv6TclassMessage):TGEcnCodePoint;cdecl;external libgio2;
{$endif}
{ __G_IPV6_TCLASS_MESSAGE_H__  }

// === Konventiert am: 26-6-26 19:35:18 ===

function G_TYPE_IPV6_TCLASS_MESSAGE: TGType;
function G_IPV6_TCLASS_MESSAGE(obj: Pointer): PGIPv6TclassMessage;
function G_IS_IPV6_TCLASS_MESSAGE(obj: Pointer): Tgboolean;

implementation

function G_TYPE_IPV6_TCLASS_MESSAGE: TGType;
begin
  Result := g_ipv6_tclass_message_get_type;
end;

function G_IPV6_TCLASS_MESSAGE(obj: Pointer): PGIPv6TclassMessage;
begin
  Result := PGIPv6TclassMessage(g_type_check_instance_cast(obj, G_TYPE_IPV6_TCLASS_MESSAGE));
end;

function G_IS_IPV6_TCLASS_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_IPV6_TCLASS_MESSAGE);
end;

type 
  TGIPv6TclassMessage = record
  end;
  PGIPv6TclassMessage = ^TGIPv6TclassMessage;

  TGIPv6TclassMessageClass = record
    parent_class: TGSocketControlMessageClass;
  end;
  PGIPv6TclassMessageClass = ^TGIPv6TclassMessageClass;

function g_ipv6_tclass_message_get_type: TGType; cdecl; external libgxxxxxxx;



end.
