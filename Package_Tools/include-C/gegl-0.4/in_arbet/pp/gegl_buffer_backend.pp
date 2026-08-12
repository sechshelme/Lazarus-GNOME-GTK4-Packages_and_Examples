
unit gegl_buffer_backend;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_buffer_backend.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_buffer_backend.h
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
PGeglBuffer  = ^GeglBuffer;
PGeglTile  = ^GeglTile;
PGeglTileCommand  = ^GeglTileCommand;
PGeglTileCopyParams  = ^GeglTileCopyParams;
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
 * Copyright 2006-2008 Øyvind Kolås <pippin@gimp.org>
  }
{$ifndef __GEGL_BUFFER_BACKEND_H__}
{$define __GEGL_BUFFER_BACKEND_H__}
type

  TGeglTileCallback = procedure (tile:PGeglTile; user_data:Tgpointer);cdecl;
{ All commands have the ability to pass commands to all tiles the handlers
 * add abstraction to the commands the documentaiton given here is valid
 * when the commands are issued to a full blown GeglBuffer instance.
  }

  PGeglTileCommand = ^TGeglTileCommand;
  TGeglTileCommand =  Longint;
  Const
    GEGL_TILE_IDLE = 0;
    GEGL_TILE_SET = 1;
    GEGL_TILE_GET = 2;
    GEGL_TILE_IS_CACHED = 3;
    GEGL_TILE_EXIST = 4;
    GEGL_TILE_VOID = 5;
    GEGL_TILE_FLUSH = 6;
    GEGL_TILE_REFETCH = 7;
    GEGL_TILE_REINIT = 8;
    _GEGL_TILE_LAST_0_4_8_COMMAND = 9;
    GEGL_TILE_COPY = _GEGL_TILE_LAST_0_4_8_COMMAND;
    GEGL_TILE_LAST_COMMAND = (_GEGL_TILE_LAST_0_4_8_COMMAND)+1;
;
type
  PGeglTileCopyParams = ^TGeglTileCopyParams;
  TGeglTileCopyParams = record
      dst_buffer : PGeglBuffer;
      dst_x : Tgint;
      dst_y : Tgint;
      dst_z : Tgint;
    end;
{$include "gegl-buffer.h"}
{$include "gegl-buffer-enums.h"}
{$include "gegl-tile-backend.h"}
{$include "gegl-tile-source.h"}
{$include "gegl-tile-handler.h"}
{$include "gegl-tile.h"}
{$endif}

implementation


end.
