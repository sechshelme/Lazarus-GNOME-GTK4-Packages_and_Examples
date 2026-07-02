unit gdkdmabufformats;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gdkdmabufformats.h
 *
 * Copyright 2023 Red Hat, Inc.
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

function gdk_dmabuf_formats_get_type:TGType;cdecl;external libgtk4;
function gdk_dmabuf_formats_ref(formats:PGdkDmabufFormats):PGdkDmabufFormats;cdecl;external libgtk4;
procedure gdk_dmabuf_formats_unref(formats:PGdkDmabufFormats);cdecl;external libgtk4;
function gdk_dmabuf_formats_get_n_formats(formats:PGdkDmabufFormats):Tgsize;cdecl;external libgtk4;
procedure gdk_dmabuf_formats_get_format(formats:PGdkDmabufFormats; idx:Tgsize; fourcc:Pguint32; modifier:Pguint64);cdecl;external libgtk4;
function gdk_dmabuf_formats_contains(formats:PGdkDmabufFormats; fourcc:Tguint32; modifier:Tguint64):Tgboolean;cdecl;external libgtk4;
function gdk_dmabuf_formats_equal(formats1:PGdkDmabufFormats; formats2:PGdkDmabufFormats):Tgboolean;cdecl;external libgtk4;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkDmabufFormats, gdk_dmabuf_formats_unref) }

// === Konventiert am: 2-7-26 19:12:35 ===

function GDK_TYPE_DMABUF_FORMATS : TGType;

implementation

function GDK_TYPE_DMABUF_FORMATS : TGType;
  begin
    GDK_TYPE_DMABUF_FORMATS:=gdk_dmabuf_formats_get_type;
  end;



end.
