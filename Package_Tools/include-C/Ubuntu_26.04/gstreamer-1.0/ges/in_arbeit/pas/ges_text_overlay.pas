unit ges_text_overlay;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon.lewis@collabora.co.uk>
 *               2010 Nokia Corporation
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
{$include <ges/ges-title-source.h>}
{$include <ges/ges-operation.h>}

{GES_DECLARE_TYPE(TextOverlay, text_overlay, TEXT_OVERLAY); }
{*
 * GESTextOverlay:
  }
{< private >  }
{ Padding for API extension  }
type
  PGESTextOverlay = ^TGESTextOverlay;
  TGESTextOverlay = record
      parent : TGESOperation;
      priv : PGESTextOverlayPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{< private >  }
{ Padding for API extension  }
  PGESTextOverlayClass = ^TGESTextOverlayClass;
  TGESTextOverlayClass = record
      parent_class : TGESOperationClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


procedure ges_text_overlay_set_text(self:PGESTextOverlay; text:Pgchar);cdecl;external libges;
procedure ges_text_overlay_set_font_desc(self:PGESTextOverlay; font_desc:Pgchar);cdecl;external libges;
procedure ges_text_overlay_set_halignment(self:PGESTextOverlay; halign:TGESTextHAlign);cdecl;external libges;
procedure ges_text_overlay_set_valignment(self:PGESTextOverlay; valign:TGESTextVAlign);cdecl;external libges;
procedure ges_text_overlay_set_color(self:PGESTextOverlay; color:Tguint32);cdecl;external libges;
procedure ges_text_overlay_set_xpos(self:PGESTextOverlay; position:Tgdouble);cdecl;external libges;
procedure ges_text_overlay_set_ypos(self:PGESTextOverlay; position:Tgdouble);cdecl;external libges;
{xxxxxxGES_DEPRECATED }
function ges_text_overlay_new:PGESTextOverlay;cdecl;external libges;
function ges_text_overlay_get_text(self:PGESTextOverlay):Pgchar;cdecl;external libges;
function ges_text_overlay_get_font_desc(self:PGESTextOverlay):Pchar;cdecl;external libges;
function ges_text_overlay_get_halignment(self:PGESTextOverlay):TGESTextHAlign;cdecl;external libges;
function ges_text_overlay_get_valignment(self:PGESTextOverlay):TGESTextVAlign;cdecl;external libges;
function ges_text_overlay_get_color(self:PGESTextOverlay):Tguint32;cdecl;external libges;
function ges_text_overlay_get_xpos(self:PGESTextOverlay):Tgdouble;cdecl;external libges;
function ges_text_overlay_get_ypos(self:PGESTextOverlay):Tgdouble;cdecl;external libges;

// === Konventiert am: 28-7-26 13:14:01 ===

function GES_TYPE_TEXT_OVERLAY: TGType;
function GES_TEXT_OVERLAY(obj: Pointer): PGESTextOverlay;
function GES_IS_TEXT_OVERLAY(obj: Pointer): Tgboolean;
function GES_TEXT_OVERLAY_CLASS(klass: Pointer): PGESTextOverlayClass;
function GES_IS_TEXT_OVERLAY_CLASS(klass: Pointer): Tgboolean;
function GES_TEXT_OVERLAY_GET_CLASS(obj: Pointer): PGESTextOverlayClass;

implementation

function GES_TYPE_TEXT_OVERLAY: TGType;
begin
  Result := ges_text_overlay_get_type;
end;

function GES_TEXT_OVERLAY(obj: Pointer): PGESTextOverlay;
begin
  Result := PGESTextOverlay(g_type_check_instance_cast(obj, GES_TYPE_TEXT_OVERLAY));
end;

function GES_IS_TEXT_OVERLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TEXT_OVERLAY);
end;

function GES_TEXT_OVERLAY_CLASS(klass: Pointer): PGESTextOverlayClass;
begin
  Result := PGESTextOverlayClass(g_type_check_class_cast(klass, GES_TYPE_TEXT_OVERLAY));
end;

function GES_IS_TEXT_OVERLAY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TEXT_OVERLAY);
end;

function GES_TEXT_OVERLAY_GET_CLASS(obj: Pointer): PGESTextOverlayClass;
begin
  Result := PGESTextOverlayClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESTextOverlayPrivate = type Pointer

function ges_text_overlay_get_type: TGType; cdecl; external libgxxxxxxx;



end.
