
unit ges_text_overlay_clip;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_text_overlay_clip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_text_overlay_clip.h
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
PGESTextOverlayClip  = ^GESTextOverlayClip;
PGESTextOverlayClipClass  = ^GESTextOverlayClipClass;
PGESTextOverlayClipPrivate  = ^GESTextOverlayClipPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2009 Brandon Lewis <brandon.lewis@collabora.co.uk>
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
{$include <ges/ges-overlay-clip.h>}
{$include <ges/ges-track.h>}

{ was #define dname def_expr }
function GES_TYPE_OVERLAY_TEXT_CLIP : longint; { return type might be wrong }

{GES_DECLARE_TYPE (TextOverlayClip, text_overlay_clip, OVERLAY_TEXT_CLIP); }
{*
 * GESTextOverlayClip:
  }
{< private >  }
{ Padding for API extension  }
type
  PGESTextOverlayClip = ^TGESTextOverlayClip;
  TGESTextOverlayClip = record
      parent : TGESOverlayClip;
      priv : PGESTextOverlayClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESTextOverlayClipClass:
  }
{< private >  }
{ Padding for API extension  }
  PGESTextOverlayClipClass = ^TGESTextOverlayClipClass;
  TGESTextOverlayClipClass = record
      parent_class : TGESOverlayClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

(* Const before type ignored *)

procedure ges_text_overlay_clip_set_text(self:PGESTextOverlayClip; text:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure ges_text_overlay_clip_set_font_desc(self:PGESTextOverlayClip; font_desc:Pgchar);cdecl;external;
procedure ges_text_overlay_clip_set_valign(self:PGESTextOverlayClip; valign:TGESTextVAlign);cdecl;external;
procedure ges_text_overlay_clip_set_halign(self:PGESTextOverlayClip; halign:TGESTextHAlign);cdecl;external;
procedure ges_text_overlay_clip_set_color(self:PGESTextOverlayClip; color:Tguint32);cdecl;external;
procedure ges_text_overlay_clip_set_xpos(self:PGESTextOverlayClip; position:Tgdouble);cdecl;external;
procedure ges_text_overlay_clip_set_ypos(self:PGESTextOverlayClip; position:Tgdouble);cdecl;external;
(* Const before type ignored *)
function ges_text_overlay_clip_get_text(self:PGESTextOverlayClip):Pgchar;cdecl;external;
(* Const before type ignored *)
function ges_text_overlay_clip_get_font_desc(self:PGESTextOverlayClip):Pgchar;cdecl;external;
function ges_text_overlay_clip_get_valignment(self:PGESTextOverlayClip):TGESTextVAlign;cdecl;external;
(* Const before type ignored *)
function ges_text_overlay_clip_get_color(self:PGESTextOverlayClip):Tguint32;cdecl;external;
(* Const before type ignored *)
function ges_text_overlay_clip_get_xpos(self:PGESTextOverlayClip):Tgdouble;cdecl;external;
(* Const before type ignored *)
function ges_text_overlay_clip_get_ypos(self:PGESTextOverlayClip):Tgdouble;cdecl;external;
function ges_text_overlay_clip_get_halignment(self:PGESTextOverlayClip):TGESTextHAlign;cdecl;external;
function ges_text_overlay_clip_new:PGESTextOverlayClip;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_OVERLAY_TEXT_CLIP : longint; { return type might be wrong }
  begin
    GES_TYPE_OVERLAY_TEXT_CLIP:=ges_text_overlay_clip_get_type;
  end;


end.
