
unit ges_uri_clip;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_uri_clip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_uri_clip.h
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
PGESUriClip  = ^GESUriClip;
PGESUriClipClass  = ^GESUriClipClass;
PGESUriClipPrivate  = ^GESUriClipPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2009 Edward Hervey <edward.hervey@collabora.co.uk>
 *               2009 Nokia Corporation
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
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-source-clip.h>}
{$include <ges/ges-track.h>}

{ was #define dname def_expr }
function GES_TYPE_URI_CLIP : longint; { return type might be wrong }

{GES_DECLARE_TYPE (UriClip, uri_clip, URI_CLIP); }
{< private > }
{ Padding for API extension  }
type
  PGESUriClip = ^TGESUriClip;
  TGESUriClip = record
      parent : TGESSourceClip;
      priv : PGESUriClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESUriClipClass:
  }
{< private > }
{ Padding for API extension  }
  PGESUriClipClass = ^TGESUriClipClass;
  TGESUriClipClass = record
      parent_class : TGESSourceClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


procedure ges_uri_clip_set_mute(self:PGESUriClip; mute:Tgboolean);cdecl;external;
procedure ges_uri_clip_set_is_image(self:PGESUriClip; is_image:Tgboolean);cdecl;external;
function ges_uri_clip_is_muted(self:PGESUriClip):Tgboolean;cdecl;external;
function ges_uri_clip_is_image(self:PGESUriClip):Tgboolean;cdecl;external;
(* Const before type ignored *)
function ges_uri_clip_get_uri(self:PGESUriClip):Pgchar;cdecl;external;
(* Const before type ignored *)
function ges_uri_clip_new(uri:Pgchar):PGESUriClip;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_URI_CLIP : longint; { return type might be wrong }
  begin
    GES_TYPE_URI_CLIP:=ges_uri_clip_get_type;
  end;


end.
