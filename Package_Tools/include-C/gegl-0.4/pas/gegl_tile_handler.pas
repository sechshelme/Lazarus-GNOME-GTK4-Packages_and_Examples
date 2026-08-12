unit gegl_tile_handler;

interface

uses
  fp_glib2, fp_gegl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2006,2007 Øyvind Kolås <pippin@gimp.org>
  }
{$ifndef __GEGL_TILE_HANDLER_H__}
{$define __GEGL_TILE_HANDLER_H__}
{$include "gegl-tile-source.h"}
{**
 * GeglTileHandler define the chain pattern that allow to stack GeglTileSource classes on
 * top of each others, each doing different task in response to command given (see GeglTileSource).
 *
 * A classical GeglBuffer is a stack of subclasses of GeglTileHandler with a GeglTileBackend on
 * the bottom. This architecture is designed to be modular and flexible on purpose, even allowing
 * to use a GeglBuffer as a source for another GeglBuffer.
  }

type
{ The source of the data, which we can rely
                             on if our command handler doesn't handle
                             a command, this is typically done with
                             gegl_tile_handler_source_command passing
                             ourself as the first parameter.  }
  PGeglTileHandler = ^TGeglTileHandler;
  TGeglTileHandler = record
      parent_instance : TGeglTileSource;
      source : PGeglTileSource;
      priv : PGeglTileHandlerPrivate;
    end;

  PGeglTileHandlerClass = ^TGeglTileHandlerClass;
  TGeglTileHandlerClass = record
      parent_class : TGeglTileSourceClass;
    end;


function gegl_tile_handler_get_type:TGType;cdecl;external libgegl;
procedure gegl_tile_handler_set_source(handler:PGeglTileHandler; source:PGeglTileSource);cdecl;external libgegl;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gegl_tile_handler_get_source(handler : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gegl_tile_handler_source_command(handler,command,x,y,z,data : longint) : longint;

{*
 * gegl_tile_handler_create_tile: (skip)
 * @handler: a #GeglTileHandler
 * @x: The tile space x coordinate for the tile
 * @y: The tile space y coordinate for the tile
 * @z: The tile space z coordinate for the tile
 *
 * Create a new tile associated with this tile handler.
 *
 * Return value: the new tile
  }
function gegl_tile_handler_create_tile(handler:PGeglTileHandler; x:Tgint; y:Tgint; z:Tgint):PGeglTile;cdecl;external libgegl;
{*
 * gegl_tile_handler_get_tile: (skip)
 * @handler: a #GeglTileHandler
 * @x: The tile space x coordinate for the tile
 * @y: The tile space y coordinate for the tile
 * @z: The tile space z coordinate for the tile
 * @preserve_data: whether existing tile data should be preserved
 *
 * Fetches the tile at the given coordinates from @handler.  If the tile
 * doesn't exist, creates a new tile associated with this tile handler.
 *
 * If @preserve_data is FALSE, the tile contents are unspecified.
 *
 * Return value: the tile
  }
function gegl_tile_handler_get_tile(handler:PGeglTileHandler; x:Tgint; y:Tgint; z:Tgint; preserve_data:Tgboolean):PGeglTile;cdecl;external libgegl;
{*
 * gegl_tile_handler_get_source_tile: (skip)
 * @handler: a #GeglTileHandler
 * @x: The tile space x coordinate for the tile
 * @y: The tile space y coordinate for the tile
 * @z: The tile space z coordinate for the tile
 * @preserve_data: whether existing tile data should be preserved
 *
 * Fetches the tile at the given coordinates from @handler source.  If the tile
 * doesn't exist, or if @handler doesn't have a source, creates a new tile
 * associated with this tile handler.
 *
 * If @preserve_data is FALSE, the tile contents are unspecified.
 *
 * Return value: the tile
  }
function gegl_tile_handler_get_source_tile(handler:PGeglTileHandler; x:Tgint; y:Tgint; z:Tgint; preserve_data:Tgboolean):PGeglTile;cdecl;external libgegl;
{*
 * gegl_tile_handler_dup_tile: (skip)
 * @handler: a #GeglTileHandler
 * @tile: the #GeglTile to copy
 * @x: The tile space x coordinate for the tile
 * @y: The tile space y coordinate for the tile
 * @z: The tile space z coordinate for the tile
 *
 * Create a duplicate of @tile, associated with this tile handler.
 *
 * Return value: the new tile
  }
function gegl_tile_handler_dup_tile(handler:PGeglTileHandler; tile:PGeglTile; x:Tgint; y:Tgint; z:Tgint):PGeglTile;cdecl;external libgegl;
procedure gegl_tile_handler_damage_tile(handler:PGeglTileHandler; x:Tgint; y:Tgint; z:Tgint; damage:Tguint64);cdecl;external libgegl;
procedure gegl_tile_handler_damage_rect(handler:PGeglTileHandler; rect:PGeglRectangle);cdecl;external libgegl;
procedure gegl_tile_handler_lock(handler:PGeglTileHandler);cdecl;external libgegl;
procedure gegl_tile_handler_unlock(handler:PGeglTileHandler);cdecl;external libgegl;
{$endif}

// === Konventiert am: 12-8-26 17:16:50 ===

function GEGL_TYPE_TILE_HANDLER : TGType;
function GEGL_TILE_HANDLER(obj : Pointer) : PGeglTileHandler;
function GEGL_TILE_HANDLER_CLASS(klass : Pointer) : PGeglTileHandlerClass;
function GEGL_IS_TILE_HANDLER(obj : Pointer) : Tgboolean;
function GEGL_IS_TILE_HANDLER_CLASS(klass : Pointer) : Tgboolean;
function GEGL_TILE_HANDLER_GET_CLASS(obj : Pointer) : PGeglTileHandlerClass;

implementation

function GEGL_TYPE_TILE_HANDLER : TGType;
  begin
    GEGL_TYPE_TILE_HANDLER:=gegl_tile_handler_get_type;
  end;

function GEGL_TILE_HANDLER(obj : Pointer) : PGeglTileHandler;
begin
  Result := PGeglTileHandler(g_type_check_instance_cast(obj, GEGL_TYPE_TILE_HANDLER));
end;

function GEGL_TILE_HANDLER_CLASS(klass : Pointer) : PGeglTileHandlerClass;
begin
  Result := PGeglTileHandlerClass(g_type_check_class_cast(klass, GEGL_TYPE_TILE_HANDLER));
end;

function GEGL_IS_TILE_HANDLER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GEGL_TYPE_TILE_HANDLER);
end;

function GEGL_IS_TILE_HANDLER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GEGL_TYPE_TILE_HANDLER);
end;

function GEGL_TILE_HANDLER_GET_CLASS(obj : Pointer) : PGeglTileHandlerClass;
begin
  Result := PGeglTileHandlerClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gegl_tile_handler_get_source(handler : longint) : longint;
begin
  gegl_tile_handler_get_source:=(PGeglTileHandler(handler))^.source;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gegl_tile_handler_source_command(handler,command,x,y,z,data : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if gegl_tile_handler_get_source(handler) then
    if_local1:=gegl_tile_source_command(gegl_tile_handler_get_source(handler),command,x,y,z,data)
  else
    if_local1:=NULL;
  gegl_tile_handler_source_command:=if_local1;
end;


end.
