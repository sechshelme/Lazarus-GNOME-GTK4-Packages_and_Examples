
unit ges_title_clip;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_title_clip.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_title_clip.h
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
PGESTitleClip  = ^GESTitleClip;
PGESTitleClipClass  = ^GESTitleClipClass;
PGESTitleClipPrivate  = ^GESTitleClipPrivate;
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
{$include <ges/ges-source-clip.h>}
{$include <ges/ges-track.h>}

{ was #define dname def_expr }
function GES_TYPE_TITLE_CLIP : longint; { return type might be wrong }

{GES_DECLARE_TYPE (TitleClip, title_clip, TITLE_CLIP); }
{*
 * GESTitleClip:
 *
 * Render stand-alone titles in GESLayer.
  }
{< private > }
{ Padding for API extension  }
type
  PGESTitleClip = ^TGESTitleClip;
  TGESTitleClip = record
      parent : TGESSourceClip;
      priv : PGESTitleClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{< private > }
{ Padding for API extension  }
  PGESTitleClipClass = ^TGESTitleClipClass;
  TGESTitleClipClass = record
      parent_class : TGESSourceClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

(* Const before type ignored *)

procedure ges_title_clip_set_text(self:PGESTitleClip; text:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure ges_title_clip_set_font_desc(self:PGESTitleClip; font_desc:Pgchar);cdecl;external;
procedure ges_title_clip_set_valignment(self:PGESTitleClip; valign:TGESTextVAlign);cdecl;external;
procedure ges_title_clip_set_halignment(self:PGESTitleClip; halign:TGESTextHAlign);cdecl;external;
procedure ges_title_clip_set_color(self:PGESTitleClip; color:Tguint32);cdecl;external;
procedure ges_title_clip_set_background(self:PGESTitleClip; background:Tguint32);cdecl;external;
procedure ges_title_clip_set_xpos(self:PGESTitleClip; position:Tgdouble);cdecl;external;
procedure ges_title_clip_set_ypos(self:PGESTitleClip; position:Tgdouble);cdecl;external;
(* Const before type ignored *)
function ges_title_clip_get_font_desc(self:PGESTitleClip):Pgchar;cdecl;external;
function ges_title_clip_get_valignment(self:PGESTitleClip):TGESTextVAlign;cdecl;external;
function ges_title_clip_get_halignment(self:PGESTitleClip):TGESTextHAlign;cdecl;external;
(* Const before type ignored *)
function ges_title_clip_get_text_color(self:PGESTitleClip):Tguint32;cdecl;external;
(* Const before type ignored *)
function ges_title_clip_get_background_color(self:PGESTitleClip):Tguint32;cdecl;external;
(* Const before type ignored *)
function ges_title_clip_get_xpos(self:PGESTitleClip):Tgdouble;cdecl;external;
(* Const before type ignored *)
function ges_title_clip_get_ypos(self:PGESTitleClip):Tgdouble;cdecl;external;
(* Const before type ignored *)
function ges_title_clip_get_text(self:PGESTitleClip):Pgchar;cdecl;external;
function ges_title_clip_new:PGESTitleClip;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_TITLE_CLIP : longint; { return type might be wrong }
  begin
    GES_TYPE_TITLE_CLIP:=ges_title_clip_get_type;
  end;


end.
