unit gdkcontentproviderimpl;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 *
 * Copyright (C) 2017 Benjamin Otte <otte@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

function gdk_content_provider_new_for_value(value:PGValue):PGdkContentProvider;cdecl;external libgtk4;
function gdk_content_provider_new_typed(_type:TGType; args:array of const):PGdkContentProvider;cdecl;external libgtk4;
function gdk_content_provider_new_typed(_type:TGType):PGdkContentProvider;cdecl;external libgtk4;
function gdk_content_provider_new_union(providers:PPGdkContentProvider; n_providers:Tgsize):PGdkContentProvider;cdecl;external libgtk4;
function gdk_content_provider_new_for_bytes(mime_type:Pchar; bytes:PGBytes):PGdkContentProvider;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 17:29:31 ===


implementation



end.
