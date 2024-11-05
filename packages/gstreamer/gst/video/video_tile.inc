/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstVideoTileType = ^TGstVideoTileType;
  TGstVideoTileType = longint;

const
  GST_VIDEO_TILE_TYPE_INDEXED = 0;

const
  GST_VIDEO_TILE_TYPE_SHIFT = 16;
  GST_VIDEO_TILE_TYPE_MASK = (1 shl GST_VIDEO_TILE_TYPE_SHIFT) - 1;

const
  GST_VIDEO_TILE_Y_TILES_SHIFT = 16;
  GST_VIDEO_TILE_X_TILES_MASK = (1 shl GST_VIDEO_TILE_Y_TILES_SHIFT) - 1;

type
  PGstVideoTileMode = ^TGstVideoTileMode;
  TGstVideoTileMode = longint;

const
  GST_VIDEO_TILE_MODE_UNKNOWN = 0;
  GST_VIDEO_TILE_MODE_ZFLIPZ_2X2 = (1 shl GST_VIDEO_TILE_TYPE_SHIFT) or GST_VIDEO_TILE_TYPE_INDEXED;
  GST_VIDEO_TILE_MODE_LINEAR = (2 shl GST_VIDEO_TILE_TYPE_SHIFT) or GST_VIDEO_TILE_TYPE_INDEXED;

type
  TGstVideoTileInfo = record
    Width: Tguint;
    Height: Tguint;
    stride: Tguint;
    size: Tguint;
    padding: array[0..(GST_PADDING) - 1] of Tguint32;
  end;
  PGstVideoTileInfo = ^TGstVideoTileInfo;

function gst_video_tile_get_index(mode: TGstVideoTileMode; x: Tgint; y: Tgint; x_tiles: Tgint; y_tiles: Tgint): Tguint; cdecl; external libgstvideo;

function GST_VIDEO_TILE_MODE_TYPE(mode: TGstVideoTileMode): TGstVideoTileMode;
function GST_VIDEO_TILE_MODE_IS_INDEXED(mode: TGstVideoTileMode): Tgboolean;
function GST_VIDEO_TILE_MAKE_STRIDE(x_tiles, y_tiles: longint): longint;
function GST_VIDEO_TILE_X_TILES(stride: longint): longint;
function GST_VIDEO_TILE_Y_TILES(stride: longint): longint;

// === Konventiert am: 29-9-24 14:56:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_VIDEO_TILE_MODE_TYPE(mode: TGstVideoTileMode): TGstVideoTileMode;
begin
  GST_VIDEO_TILE_MODE_TYPE := mode and GST_VIDEO_TILE_TYPE_MASK;
end;

function GST_VIDEO_TILE_MODE_IS_INDEXED(mode: TGstVideoTileMode): Tgboolean;
begin
  GST_VIDEO_TILE_MODE_IS_INDEXED := (GST_VIDEO_TILE_MODE_TYPE(mode)) = GST_VIDEO_TILE_TYPE_INDEXED;
end;

function GST_VIDEO_TILE_MAKE_STRIDE(x_tiles, y_tiles: longint): longint;
begin
  GST_VIDEO_TILE_MAKE_STRIDE := (y_tiles shl GST_VIDEO_TILE_Y_TILES_SHIFT) or x_tiles;
end;

function GST_VIDEO_TILE_X_TILES(stride: longint): longint;
begin
  GST_VIDEO_TILE_X_TILES := stride and GST_VIDEO_TILE_X_TILES_MASK;
end;

function GST_VIDEO_TILE_Y_TILES(stride: longint): longint;
begin
  GST_VIDEO_TILE_Y_TILES := stride shr GST_VIDEO_TILE_Y_TILES_SHIFT;
end;


{$ENDIF read_implementation}
