
unit ges_text_overlay;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_text_overlay.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_text_overlay.h
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
Pchar  = ^char;
Pgchar  = ^gchar;
PGESTextOverlay  = ^GESTextOverlay;
PGESTextOverlayClass  = ^GESTextOverlayClass;
PGESTextOverlayPrivate  = ^GESTextOverlayPrivate;
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

{ was #define dname def_expr }
function GES_TYPE_TEXT_OVERLAY : longint; { return type might be wrong }

{GES_DECLARE_TYPE( TextOverlay, text_overlay, TEXT_OVERLAY); }
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

(* Const before type ignored *)

procedure ges_text_overlay_set_text(self:PGESTextOverlay; text:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure ges_text_overlay_set_font_desc(self:PGESTextOverlay; font_desc:Pgchar);cdecl;external;
procedure ges_text_overlay_set_halignment(self:PGESTextOverlay; halign:TGESTextHAlign);cdecl;external;
procedure ges_text_overlay_set_valignment(self:PGESTextOverlay; valign:TGESTextVAlign);cdecl;external;
procedure ges_text_overlay_set_color(self:PGESTextOverlay; color:Tguint32);cdecl;external;
procedure ges_text_overlay_set_xpos(self:PGESTextOverlay; position:Tgdouble);cdecl;external;
procedure ges_text_overlay_set_ypos(self:PGESTextOverlay; position:Tgdouble);cdecl;external;
function ges_text_overlay_new:PGESTextOverlay;cdecl;external;
(* Const before type ignored *)
function ges_text_overlay_get_text(self:PGESTextOverlay):Pgchar;cdecl;external;
(* Const before type ignored *)
function ges_text_overlay_get_font_desc(self:PGESTextOverlay):Pchar;cdecl;external;
function ges_text_overlay_get_halignment(self:PGESTextOverlay):TGESTextHAlign;cdecl;external;
function ges_text_overlay_get_valignment(self:PGESTextOverlay):TGESTextVAlign;cdecl;external;
(* Const before type ignored *)
function ges_text_overlay_get_color(self:PGESTextOverlay):Tguint32;cdecl;external;
(* Const before type ignored *)
function ges_text_overlay_get_xpos(self:PGESTextOverlay):Tgdouble;cdecl;external;
(* Const before type ignored *)
function ges_text_overlay_get_ypos(self:PGESTextOverlay):Tgdouble;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_TEXT_OVERLAY : longint; { return type might be wrong }
  begin
    GES_TYPE_TEXT_OVERLAY:=ges_text_overlay_get_type;
  end;


end.
