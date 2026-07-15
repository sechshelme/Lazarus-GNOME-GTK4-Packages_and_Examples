unit video_tile;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2013> Wim Taymans <wim.taymans@gmail.com>
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
{$ifndef __GST_VIDEO_TILE_H__}
{$define __GST_VIDEO_TILE_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}
{*
 * GstVideoTileType:
 * @GST_VIDEO_TILE_TYPE_INDEXED: Tiles are indexed. Use
 *   gst_video_tile_get_index () to retrieve the tile at the requested
 *   coordinates.
 *
 * Enum value describing the most common tiling types.
  }
type
  PGstVideoTileType = ^TGstVideoTileType;
  TGstVideoTileType =  Longint;
  Const
    GST_VIDEO_TILE_TYPE_INDEXED = 0;
;
  GST_VIDEO_TILE_TYPE_SHIFT = 16;  
{*
 * GST_VIDEO_TILE_TYPE_MASK: (value 65535)
  }
  GST_VIDEO_TILE_TYPE_MASK = (1 shl GST_VIDEO_TILE_TYPE_SHIFT)-1;  
{*
 * GST_VIDEO_TILE_MAKE_MODE:
 * @num: the mode number to create
 * @type: the tile mode type
 *
 * use this macro to create new tile modes.
  }
{*
 * GST_VIDEO_TILE_MODE_TYPE:
 * @mode: the tile mode
 *
 * Get the tile mode type of @mode
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_VIDEO_TILE_MODE_TYPE(mode : longint) : Tmode;

{*
 * GST_VIDEO_TILE_MODE_IS_INDEXED:
 * @mode: a tile mode
 *
 * Check if @mode is an indexed tile type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_TILE_MODE_IS_INDEXED(mode : longint) : longint;

const
  GST_VIDEO_TILE_Y_TILES_SHIFT = 16;  
{*
 * GST_VIDEO_TILE_X_TILES_MASK: (value 65535)
  }
  GST_VIDEO_TILE_X_TILES_MASK = (1 shl GST_VIDEO_TILE_Y_TILES_SHIFT)-1;  
{*
 * GST_VIDEO_TILE_MAKE_STRIDE:
 * @x_tiles: number of tiles in X
 * @y_tiles: number of tiles in Y
 *
 * Encode the number of tile in X and Y into the stride.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_VIDEO_TILE_MAKE_STRIDE(x_tiles,y_tiles : longint) : longint;

{*
 * GST_VIDEO_TILE_X_TILES:
 * @stride: plane stride
 *
 * Extract the number of tiles in X from the stride value.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_TILE_X_TILES(stride : longint) : Tstride;

{*
 * GST_VIDEO_TILE_Y_TILES:
 * @stride: plane stride
 *
 * Extract the number of tiles in Y from the stride value.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_TILE_Y_TILES(stride : longint) : longint;

type
{*
 * GstVideoTileMode:
 * @GST_VIDEO_TILE_MODE_UNKNOWN: Unknown or unset tile mode
 * @GST_VIDEO_TILE_MODE_ZFLIPZ_2X2: Every four adjacent blocks - two
 *    horizontally and two vertically are grouped together and are located
 *    in memory in Z or flipped Z order. In case of odd rows, the last row
 *    of blocks is arranged in linear order.
 * @GST_VIDEO_TILE_MODE_LINEAR: Tiles are in row order. (Since: 1.18)
 * @GST_VIDEO_TILE_MODE_LINEAR_SUBSAMPLED: Tiles are in row order, with
 *   variable tile size according to subsampling. (Since: 1.20)
 *
 * Enum value describing the available tiling modes.
  }
{*
   * GST_VIDEO_TILE_MODE_LINEAR:
   *
   * Tiles are in row order.
   *
   * Since: 1.18
    }

  PGstVideoTileMode = ^TGstVideoTileMode;
  TGstVideoTileMode =  Longint;
  Const
    GST_VIDEO_TILE_MODE_UNKNOWN = 0;
    GST_VIDEO_TILE_MODE_ZFLIPZ_2X2 = GST_VIDEO_TILE_MAKE_MODE(1,INDEXED);
    GST_VIDEO_TILE_MODE_LINEAR = GST_VIDEO_TILE_MAKE_MODE(2,INDEXED);
;
{*
 * GstVideoTileInfo:
 *
 * Description of a tile. This structure allow to describe arbitrary tile
 * dimensions and sizes.
 *
 * Since: 1.22
  }
{*
   * GstVideoTileInfo.width:
   *
   * The width in pixels of a tile. This value can be zero if the number of
   * pixels per line is not an integer value.
   *
   * Since: 1.22
    }
{*
   * GstVideoTileInfo::height:
   *
   * The width in pixels of a tile. This value can be zero if the number of
   * pixels per line is not an integer value.
   *
   * Since: 1.22
    }
{*
   * GstVideoTileInfo.stride:
   *
   * The stride (in bytes) of a tile line. Regardless if the tile have sub-tiles
   * this stride multiplied by the height should be equal to
   * #GstVideoTileInfo.size. This value is used to translate into linear stride
   * when older APIs are being used to expose this format.
   *
   * Since: 1.22
    }
{*
   * GstVideoTileInfo.size:
   *
   * The size in bytes of a tile. This value must be divisible by
   * #GstVideoTileInfo.stride.
   *
   * Since: 1.22
    }
{ <private>  }
type
  PGstVideoTileInfo = ^TGstVideoTileInfo;
  TGstVideoTileInfo = record
      width : Tguint;
      height : Tguint;
      stride : Tguint;
      size : Tguint;
      padding : array[0..(GST_PADDING)-1] of Tguint32;
    end;


function gst_video_tile_get_index(mode:TGstVideoTileMode; x:Tgint; y:Tgint; x_tiles:Tgint; y_tiles:Tgint):Tguint;cdecl;external libgstvideo;
{$endif}
{ __GST_VIDEO_TILE_H__  }

// === Konventiert am: 15-7-26 13:38:57 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_TILE_MODE_TYPE(mode : longint) : Tmode;
begin
  GST_VIDEO_TILE_MODE_TYPE:=Tmode(@(GST_VIDEO_TILE_TYPE_MASK));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_TILE_MODE_IS_INDEXED(mode : longint) : longint;
begin
  GST_VIDEO_TILE_MODE_IS_INDEXED:=(GST_VIDEO_TILE_MODE_TYPE(mode))=GST_VIDEO_TILE_TYPE_INDEXED;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_TILE_MAKE_STRIDE(x_tiles,y_tiles : longint) : longint;
begin
  GST_VIDEO_TILE_MAKE_STRIDE:=(y_tiles shl GST_VIDEO_TILE_Y_TILES_SHIFT) or x_tiles;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_TILE_X_TILES(stride : longint) : Tstride;
begin
  GST_VIDEO_TILE_X_TILES:=Tstride(@(GST_VIDEO_TILE_X_TILES_MASK));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_TILE_Y_TILES(stride : longint) : longint;
begin
  GST_VIDEO_TILE_Y_TILES:=stride shr GST_VIDEO_TILE_Y_TILES_SHIFT;
end;


end.
