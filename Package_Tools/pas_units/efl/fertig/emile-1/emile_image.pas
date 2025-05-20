unit emile_image;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEmile_Colorspace = ^TEmile_Colorspace;
  TEmile_Colorspace = longint;

const
  EMILE_COLORSPACE_ARGB8888 = 0;
  EMILE_COLORSPACE_YCBCR422P601_PL = 1;
  EMILE_COLORSPACE_YCBCR422P709_PL = 2;
  EMILE_COLORSPACE_RGB565_A5P = 3;
  EMILE_COLORSPACE_GRY8 = 4;
  EMILE_COLORSPACE_YCBCR422601_PL = 5;
  EMILE_COLORSPACE_YCBCR420NV12601_PL = 6;
  EMILE_COLORSPACE_YCBCR420TM12601_PL = 7;
  EMILE_COLORSPACE_AGRY88 = 8;
  EMILE_COLORSPACE_ETC1 = 9;
  EMILE_COLORSPACE_RGB8_ETC2 = 10;
  EMILE_COLORSPACE_RGBA8_ETC2_EAC = 11;
  EMILE_COLORSPACE_ETC1_ALPHA = 12;
  EMILE_COLORSPACE_RGB_S3TC_DXT1 = 13;
  EMILE_COLORSPACE_RGBA_S3TC_DXT1 = 14;
  EMILE_COLORSPACE_RGBA_S3TC_DXT2 = 15;
  EMILE_COLORSPACE_RGBA_S3TC_DXT3 = 16;
  EMILE_COLORSPACE_RGBA_S3TC_DXT4 = 17;
  EMILE_COLORSPACE_RGBA_S3TC_DXT5 = 18;

type
  PEmile_Image_Encoding = ^TEmile_Image_Encoding;
  TEmile_Image_Encoding = longint;

const
  EMILE_IMAGE_LOSSLESS = 0;
  EMILE_IMAGE_JPEG = 1;
  EMILE_IMAGE_ETC1 = 2;
  EMILE_IMAGE_ETC2_RGB = 3;
  EMILE_IMAGE_ETC2_RGBA = 4;
  EMILE_IMAGE_ETC1_ALPHA = 5;

type
  PEmile_Image_Scale_Hint = ^TEmile_Image_Scale_Hint;
  TEmile_Image_Scale_Hint = longint;

const
  EMILE_IMAGE_SCALE_HINT_NONE = 0;
  EMILE_IMAGE_SCALE_HINT_DYNAMIC = 1;
  EMILE_IMAGE_SCALE_HINT_STATIC = 2;

type
  PEmile_Image_Animated_Loop_Hint = ^TEmile_Image_Animated_Loop_Hint;
  TEmile_Image_Animated_Loop_Hint = longint;

const
  EMILE_IMAGE_ANIMATED_HINT_NONE = 0;
  EMILE_IMAGE_ANIMATED_HINT_LOOP = 1;
  EMILE_IMAGE_ANIMATED_HINT_PINGPONG = 2;

type
  PEmile_Image_Load_Error = ^TEmile_Image_Load_Error;
  TEmile_Image_Load_Error = longint;

const
  EMILE_IMAGE_LOAD_ERROR_NONE = 0;
  EMILE_IMAGE_LOAD_ERROR_GENERIC = 1;
  EMILE_IMAGE_LOAD_ERROR_DOES_NOT_EXIST = 2;
  EMILE_IMAGE_LOAD_ERROR_PERMISSION_DENIED = 3;
  EMILE_IMAGE_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED = 4;
  EMILE_IMAGE_LOAD_ERROR_CORRUPT_FILE = 5;
  EMILE_IMAGE_LOAD_ERROR_UNKNOWN_FORMAT = 6;
  EMILE_IMAGE_LOAD_ERROR_CANCELLED = 7;

type
  PEmile_Action = ^TEmile_Action;
  TEmile_Action = longint;

const
  EMILE_ACTION_NONE = 0;
  EMILE_ACTION_CANCELLED = 1;

type
  TEmile_Image = record
  end;
  PEmile_Image = ^TEmile_Image;

  TEmile_Action_Cb = function(data: pointer; image: PEmile_Image; action: TEmile_Action): TEina_Bool; cdecl;

  TEmile_Image_Property = record
    borders: record
      l: byte;
      r: byte;
      t: byte;
      b: byte;
      end;
    cspaces: PEmile_Colorspace;
    cspace: TEmile_Colorspace;
    encoding: TEmile_Image_Encoding;
    w: dword;
    h: dword;
    row_stride: dword;
    scale: byte;
    rotated: TEina_Bool;
    alpha: TEina_Bool;
    premul: TEina_Bool;
    alpha_sparse: TEina_Bool;
    flipped: TEina_Bool;
    comp: TEina_Bool;
  end;
  PEmile_Image_Property = ^TEmile_Image_Property;

  TEmile_Image_Animated = record
    frames: PEina_List;
    loop_hint: TEmile_Image_Animated_Loop_Hint;
    frame_count: longint;
    loop_count: longint;
    cur_frame: longint;
    animated: TEina_Bool;
  end;
  PEmile_Image_Animated = ^TEmile_Image_Animated;

  TEmile_Image_Load_Opts = record
    region: TEina_Rectangle;
    scale_load: record
      src_x: longint;
      src_y: longint;
      src_w: longint;
      src_h: longint;
      dst_w: longint;
      dst_h: longint;
      smooth: longint;
      scale_hint: TEmile_Image_Scale_Hint;
      end;
    dpi: double;
    w: dword;
    h: dword;
    degree: dword;
    scale_down_by: longint;
    orientation: TEina_Bool;
  end;
  PEmile_Image_Load_Opts = ^TEmile_Image_Load_Opts;

function emile_image_tgv_memory_open(source: PEina_Binbuf; opts: PEmile_Image_Load_Opts; animated: PEmile_Image_Animated; error: PEmile_Image_Load_Error): PEmile_Image; cdecl; external libemile;
function emile_image_tgv_file_open(source: PEina_File; opts: PEmile_Image_Load_Opts; animated: PEmile_Image_Animated; error: PEmile_Image_Load_Error): PEmile_Image; cdecl; external libemile;
function emile_image_jpeg_memory_open(source: PEina_Binbuf; opts: PEmile_Image_Load_Opts; animated: PEmile_Image_Animated; error: PEmile_Image_Load_Error): PEmile_Image; cdecl; external libemile;
function emile_image_jpeg_file_open(source: PEina_File; opts: PEmile_Image_Load_Opts; animated: PEmile_Image_Animated; error: PEmile_Image_Load_Error): PEmile_Image; cdecl; external libemile;
function emile_image_head(image: PEmile_Image; prop: PEmile_Image_Property; property_size: dword; error: PEmile_Image_Load_Error): TEina_Bool; cdecl; external libemile;
function emile_image_data(image: PEmile_Image; prop: PEmile_Image_Property; property_size: dword; pixels: pointer; error: PEmile_Image_Load_Error): TEina_Bool; cdecl; external libemile;
procedure emile_image_callback_set(image: PEmile_Image; callback: TEmile_Action_Cb; action: TEmile_Action; data: pointer); cdecl; external libemile;
procedure emile_image_close(source: PEmile_Image); cdecl; external libemile;
function emile_load_error_str(source: PEmile_Image; error: TEmile_Image_Load_Error): pchar; cdecl; external libemile;

// === Konventiert am: 20-5-25 15:35:39 ===


implementation



end.
