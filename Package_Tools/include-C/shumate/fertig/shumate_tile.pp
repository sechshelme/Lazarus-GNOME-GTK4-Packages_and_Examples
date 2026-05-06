
unit shumate_tile;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_tile.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_tile
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
PGDateTime  = ^GDateTime;
PGdkPaintable  = ^GdkPaintable;
PShumateState  = ^ShumateState;
PShumateTile  = ^ShumateTile;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2008-2009 Pierre-Luc Beaudoin <pierre-luc@pierlux.com>
 * Copyright (C) 2010-2013 Jiri Techet <techet@gmail.com>
 * Copyright (C) 2019 Marcus Lundblad <ml@update.uu.se>
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef SHUMATE_MAP_TILE_H}
{$define SHUMATE_MAP_TILE_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_TILE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateTile, shumate_tile, SHUMATE, TILE, GObject) }
{*
 * ShumateState:
 * @SHUMATE_STATE_NONE: Initial or undefined state
 * @SHUMATE_STATE_LOADING: Tile is loading
 * @SHUMATE_STATE_LOADED: Tile is loaded but not yet displayed
 * @SHUMATE_STATE_DONE: Tile loading finished. Also used to inform map sources
 *     that tile loading has been cancelled.
 *
 * Tile loading state.
  }
type
  PShumateState = ^TShumateState;
  TShumateState =  Longint;
  Const
    SHUMATE_STATE_NONE = 0;
    SHUMATE_STATE_LOADING = 1;
    SHUMATE_STATE_LOADED = 2;
    SHUMATE_STATE_DONE = 3;
;

function shumate_tile_new:PShumateTile;cdecl;external;
function shumate_tile_new_full(x:Tguint; y:Tguint; size:Tguint; zoom_level:Tguint):PShumateTile;cdecl;external;
function shumate_tile_get_x(self:PShumateTile):Tguint;cdecl;external;
procedure shumate_tile_set_x(self:PShumateTile; x:Tguint);cdecl;external;
function shumate_tile_get_y(self:PShumateTile):Tguint;cdecl;external;
procedure shumate_tile_set_y(self:PShumateTile; y:Tguint);cdecl;external;
function shumate_tile_get_zoom_level(self:PShumateTile):Tguint;cdecl;external;
procedure shumate_tile_set_zoom_level(self:PShumateTile; zoom_level:Tguint);cdecl;external;
function shumate_tile_get_size(self:PShumateTile):Tguint;cdecl;external;
procedure shumate_tile_set_size(self:PShumateTile; size:Tguint);cdecl;external;
function shumate_tile_get_state(self:PShumateTile):TShumateState;cdecl;external;
procedure shumate_tile_set_state(self:PShumateTile; state:TShumateState);cdecl;external;
function shumate_tile_get_modified_time(self:PShumateTile):PGDateTime;cdecl;external;
procedure shumate_tile_set_modified_time(self:PShumateTile; modified_time:PGDateTime);cdecl;external;
(* Const before type ignored *)
function shumate_tile_get_etag(self:PShumateTile):Pchar;cdecl;external;
(* Const before type ignored *)
procedure shumate_tile_set_etag(self:PShumateTile; etag:Pchar);cdecl;external;
function shumate_tile_get_fade_in(self:PShumateTile):Tgboolean;cdecl;external;
procedure shumate_tile_set_fade_in(self:PShumateTile; fade_in:Tgboolean);cdecl;external;
function shumate_tile_get_paintable(self:PShumateTile):PGdkPaintable;cdecl;external;
procedure shumate_tile_set_paintable(self:PShumateTile; paintable:PGdkPaintable);cdecl;external;
function shumate_tile_get_scale_factor(self:PShumateTile):Tdouble;cdecl;external;
procedure shumate_tile_set_scale_factor(self:PShumateTile; scale_factor:Tdouble);cdecl;external;
{$endif}
{ SHUMATE_MAP_TILE_H  }

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_TILE : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_TILE:=shumate_tile_get_type;
  end;


end.
