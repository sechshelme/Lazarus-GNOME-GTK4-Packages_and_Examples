unit giptosmessage;

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
{$ifndef __G_IP_TOS_MESSAGE_H__}
{$define __G_IP_TOS_MESSAGE_H__}
{$include <gio/gsocketcontrolmessage.h>}

{G_DECLARE_FINAL_TYPE (GIPTosMessage, g_ip_tos_message, G, IP_TOS_MESSAGE, GSocketControlMessage) }
function g_ip_tos_message_new(dscp:Tguint8; ecn:TGEcnCodePoint):PGSocketControlMessage;cdecl;external libgio2;
function g_ip_tos_message_get_dscp(message:PGIPTosMessage):Tguint8;cdecl;external libgio2;
function g_ip_tos_message_get_ecn(message:PGIPTosMessage):TGEcnCodePoint;cdecl;external libgio2;
{$endif}
{ __G_IP_TOS_MESSAGE_H__  }

// === Konventiert am: 26-6-26 19:35:14 ===

function G_TYPE_IP_TOS_MESSAGE: TGType;
function G_IP_TOS_MESSAGE(obj: Pointer): PGIPTosMessage;
function G_IS_IP_TOS_MESSAGE(obj: Pointer): Tgboolean;

implementation

function G_TYPE_IP_TOS_MESSAGE: TGType;
begin
  Result := g_ip_tos_message_get_type;
end;

function G_IP_TOS_MESSAGE(obj: Pointer): PGIPTosMessage;
begin
  Result := PGIPTosMessage(g_type_check_instance_cast(obj, G_TYPE_IP_TOS_MESSAGE));
end;

function G_IS_IP_TOS_MESSAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_IP_TOS_MESSAGE);
end;

type 
  TGIPTosMessage = record
  end;
  PGIPTosMessage = ^TGIPTosMessage;

  TGIPTosMessageClass = record
    parent_class: TGSocketControlMessageClass;
  end;
  PGIPTosMessageClass = ^TGIPTosMessageClass;

function g_ip_tos_message_get_type: TGType; cdecl; external libgxxxxxxx;



end.
