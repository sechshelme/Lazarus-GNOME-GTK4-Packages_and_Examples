unit ges_title_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums;

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

{GES_DECLARE_TYPE(TitleClip, title_clip, TITLE_CLIP); }
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

{GES_DEPRECATED_FOR(ges_timeline_element_set_children_properties)  }

procedure ges_title_clip_set_text(self:PGESTitleClip; text:Pgchar);cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_set_children_properties)  }
procedure ges_title_clip_set_font_desc(self:PGESTitleClip; font_desc:Pgchar);cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_set_children_properties)  }
procedure ges_title_clip_set_valignment(self:PGESTitleClip; valign:TGESTextVAlign);cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_set_children_properties)  }
procedure ges_title_clip_set_halignment(self:PGESTitleClip; halign:TGESTextHAlign);cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_set_children_properties)  }
procedure ges_title_clip_set_color(self:PGESTitleClip; color:Tguint32);cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_set_children_properties)  }
procedure ges_title_clip_set_background(self:PGESTitleClip; background:Tguint32);cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_set_children_properties)  }
procedure ges_title_clip_set_xpos(self:PGESTitleClip; position:Tgdouble);cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_set_children_properties)  }
procedure ges_title_clip_set_ypos(self:PGESTitleClip; position:Tgdouble);cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_get_children_properties)  }
function ges_title_clip_get_font_desc(self:PGESTitleClip):Pgchar;cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_get_children_properties)  }
function ges_title_clip_get_valignment(self:PGESTitleClip):TGESTextVAlign;cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_get_children_properties)  }
function ges_title_clip_get_halignment(self:PGESTitleClip):TGESTextHAlign;cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_get_children_properties)  }
function ges_title_clip_get_text_color(self:PGESTitleClip):Tguint32;cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_get_children_properties)  }
function ges_title_clip_get_background_color(self:PGESTitleClip):Tguint32;cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_get_children_properties)  }
function ges_title_clip_get_xpos(self:PGESTitleClip):Tgdouble;cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_get_children_properties)  }
function ges_title_clip_get_ypos(self:PGESTitleClip):Tgdouble;cdecl;external libges;
{GES_DEPRECATED_FOR(ges_timeline_element_get_children_properties) }
function ges_title_clip_get_text(self:PGESTitleClip):Pgchar;cdecl;external libges;
function ges_title_clip_new:PGESTitleClip;cdecl;external libges;

// === Konventiert am: 28-7-26 13:13:24 ===

function GES_TYPE_TITLE_CLIP: TGType;
function GES_TITLE_CLIP(obj: Pointer): PGESTitleClip;
function GES_IS_TITLE_CLIP(obj: Pointer): Tgboolean;
function GES_TITLE_CLIP_CLASS(klass: Pointer): PGESTitleClipClass;
function GES_IS_TITLE_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_TITLE_CLIP_GET_CLASS(obj: Pointer): PGESTitleClipClass;

implementation

function GES_TYPE_TITLE_CLIP: TGType;
begin
  Result := ges_title_clip_get_type;
end;

function GES_TITLE_CLIP(obj: Pointer): PGESTitleClip;
begin
  Result := PGESTitleClip(g_type_check_instance_cast(obj, GES_TYPE_TITLE_CLIP));
end;

function GES_IS_TITLE_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TITLE_CLIP);
end;

function GES_TITLE_CLIP_CLASS(klass: Pointer): PGESTitleClipClass;
begin
  Result := PGESTitleClipClass(g_type_check_class_cast(klass, GES_TYPE_TITLE_CLIP));
end;

function GES_IS_TITLE_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TITLE_CLIP);
end;

function GES_TITLE_CLIP_GET_CLASS(obj: Pointer): PGESTitleClipClass;
begin
  Result := PGESTitleClipClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESTitleClipPrivate = type Pointer

function ges_title_clip_get_type: TGType; cdecl; external libgxxxxxxx;



end.
