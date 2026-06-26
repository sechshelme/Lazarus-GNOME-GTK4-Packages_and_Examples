unit gicon;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
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
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_ICON_H__}
{$define __G_ICON_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{*
 * GIconIface:
 * @g_iface: The parent interface.
 * @hash: A hash for a given #GIcon.
 * @equal: Checks if two #GIcons are equal.
 * @to_tokens: Serializes a #GIcon into tokens. The tokens must not
 * contain any whitespace. Don't implement if the #GIcon can't be
 * serialized (Since 2.20).
 * @from_tokens: Constructs a #GIcon from tokens. Set the #GError if
 * the tokens are malformed. Don't implement if the #GIcon can't be
 * serialized (Since 2.20).
 * @serialize: Serializes a #GIcon into a #GVariant. Since: 2.38
 *
 * GIconIface is used to implement GIcon types for various
 * different systems. See #GThemedIcon and #GLoadableIcon for
 * examples of how to implement this interface.
  }
{ Virtual Table  }
{*
   * GIconIface::to_tokens:
   * @icon: The #GIcon
   * @tokens: (element-type utf8) (out caller-allocates):
   *   The array to fill with tokens
   * @out_version: (out): version of serialized tokens
   *
   * Serializes the @icon into string tokens.
   * This is can be invoked when g_icon_new_for_string() is called.
   *
   * Returns: %TRUE if serialization took place, %FALSE otherwise
   *
   * Since: 2.20
    }
{*
   * GIconIface::from_tokens:
   * @tokens: (array length=num_tokens): An array of tokens
   * @num_tokens: The number of tokens in @tokens (guaranteed to be non-negative)
   * @version: Version of the serialized tokens
   * @error: Return location for errors, or %NULL to ignore
   *
   * Constructs a #GIcon from a list of @tokens.
   *
   * Returns: (nullable) (transfer full): the #GIcon or %NULL on error
   *
   * Since: 2.20
    }
  PGIconIface = ^TGIconIface;
  TGIconIface = record
      g_iface : TGTypeInterface;
      hash : function (icon:PGIcon):Tguint;cdecl;
      equal : function (icon1:PGIcon; icon2:PGIcon):Tgboolean;cdecl;
      to_tokens : function (icon:PGIcon; tokens:PGPtrArray; out_version:Pgint):Tgboolean;cdecl;
      from_tokens : function (tokens:PPgchar; num_tokens:Tgint; version:Tgint; error:PPGError):PGIcon;cdecl;
      serialize : function (icon:PGIcon):PGVariant;cdecl;
    end;


function g_icon_get_type:TGType;cdecl;external libgio2;
function g_icon_hash(icon:Tgconstpointer):Tguint;cdecl;external libgio2;
function g_icon_equal(icon1:PGIcon; icon2:PGIcon):Tgboolean;cdecl;external libgio2;
function g_icon_to_string(icon:PGIcon):Pgchar;cdecl;external libgio2;
function g_icon_new_for_string(str:Pgchar; error:PPGError):PGIcon;cdecl;external libgio2;
function g_icon_serialize(icon:PGIcon):PGVariant;cdecl;external libgio2;
function g_icon_deserialize(value:PGVariant):PGIcon;cdecl;external libgio2;
{$endif}
{ __G_ICON_H__  }

// === Konventiert am: 26-6-26 19:26:23 ===

function G_TYPE_ICON : TGType;
function G_ICON(obj : Pointer) : PGIcon;
function G_IS_ICON(obj : Pointer) : Tgboolean;
function G_ICON_GET_IFACE(obj : Pointer) : PGIconIface;

implementation

function G_TYPE_ICON : TGType;
  begin
    G_TYPE_ICON:=g_icon_get_type;
  end;

function G_ICON(obj : Pointer) : PGIcon;
begin
  Result := PGIcon(g_type_check_instance_cast(obj, G_TYPE_ICON));
end;

function G_IS_ICON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_ICON);
end;

function G_ICON_GET_IFACE(obj : Pointer) : PGIconIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_ICON);
end;



end.
