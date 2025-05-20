
unit emile_image;
interface

{
  Automatically converted by H2Pas 1.0.0 from emile_image.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    emile_image.h
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
PEina_Binbuf  = ^Eina_Binbuf;
PEina_File  = ^Eina_File;
PEina_List  = ^Eina_List;
PEmile_Action  = ^Emile_Action;
PEmile_Colorspace  = ^Emile_Colorspace;
PEmile_Image  = ^Emile_Image;
PEmile_Image_Animated  = ^Emile_Image_Animated;
PEmile_Image_Animated_Loop_Hint  = ^Emile_Image_Animated_Loop_Hint;
PEmile_Image_Encoding  = ^Emile_Image_Encoding;
PEmile_Image_Load_Error  = ^Emile_Image_Load_Error;
PEmile_Image_Load_Opts  = ^Emile_Image_Load_Opts;
PEmile_Image_Property  = ^Emile_Image_Property;
PEmile_Image_Scale_Hint  = ^Emile_Image_Scale_Hint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EMILE_IMAGE_H}
{$define EMILE_IMAGE_H}
{*
 * @defgroup Emile_Image_Group Top level functions
 * @ingroup Emile
 * Function that allow reading/saving image.
 *
 * @
  }
{*
 * @typedef Emile_Colorspace
 *
 * Flags that describe all colorspace known by EFL. Some routine may not know all of them.
 * All the value from below enum should be the same as in Evas_Loader.h
 *
 * @see Evas_Colorspace
 * @see Eet_Colorspace
 *
 * @since 1.14
  }
{*< ARGB 32 bits per pixel, high-byte is Alpha, accessed 1 32bit word at a time  }
{*< YCbCr 4:2:2 Planar, ITU.BT-601 specifications. The data pointed to is just an array of row pointer, pointing to the Y rows, then the Cb, then Cr rows  }
{*< YCbCr 4:2:2 Planar, ITU.BT-709 specifications. The data pointed to is just an array of row pointer, pointing to the Y rows, then the Cb, then Cr rows  }
{*< 16bit rgb565 + Alpha plane at end - 5 bits of the 8 being used per alpha byte  }
{*<  YCbCr 4:2:2, ITU.BT-601 specifications. The data pointed to is just an array of row pointer, pointing to line of Y,Cb,Y,Cr bytes  }
{*< YCbCr 4:2:0, ITU.BT-601 specification. The data pointed to is just an array of row pointer, pointing to the Y rows, then the Cb,Cr rows.  }
{*< YCbCr 4:2:0, ITU.BT-601 specification. The data pointed to is just an array of tiled row pointer, pointing to the Y rows, then the Cb,Cr rows.  }
{*< AY 8bits Alpha and 8bits Grey, accessed 1 16bits at a time  }
{*< OpenGL ETC1 encoding of RGB texture (4 bit per pixel) @since 1.10  }
{*< OpenGL GL_COMPRESSED_RGB8_ETC2 texture compression format (4 bit per pixel) @since 1.10  }
{*< OpenGL GL_COMPRESSED_RGBA8_ETC2_EAC texture compression format, supports alpha (8 bit per pixel) @since 1.10  }
{*< ETC1 with alpha support using two planes: ETC1 RGB and ETC1 grey for alpha @since 1.11  }
{*< OpenGL COMPRESSED_RGB_S3TC_DXT1_EXT format with RGB only. @since 1.11  }
{*< OpenGL COMPRESSED_RGBA_S3TC_DXT1_EXT format with RGBA punchthrough. @since 1.11  }
{*< DirectDraw DXT2 format with premultiplied RGBA. Not supported by OpenGL itself. @since 1.11  }
{*< OpenGL COMPRESSED_RGBA_S3TC_DXT3_EXT format with RGBA. @since 1.11  }
{*< DirectDraw DXT4 format with premultiplied RGBA. Not supported by OpenGL itself. @since 1.11  }
{*< OpenGL COMPRESSED_RGBA_S3TC_DXT5_EXT format with RGBA. @since 1.11  }
type
  PEmile_Colorspace = ^TEmile_Colorspace;
  TEmile_Colorspace =  Longint;
  Const
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
;
{*
 * @typedef Emile_Image_Encoding
 *
 * Flags that describe the supported encoding. Some routine may not know all of them.
 * The value are the same as the one provided before in Eet.h
 *
 * @see Eet_Image_Encoding
 *
 * @since 1.14
  }
type
  PEmile_Image_Encoding = ^TEmile_Image_Encoding;
  TEmile_Image_Encoding =  Longint;
  Const
    EMILE_IMAGE_LOSSLESS = 0;
    EMILE_IMAGE_JPEG = 1;
    EMILE_IMAGE_ETC1 = 2;
    EMILE_IMAGE_ETC2_RGB = 3;
    EMILE_IMAGE_ETC2_RGBA = 4;
    EMILE_IMAGE_ETC1_ALPHA = 5;
;
{*
 * @typedef Emile_Image_Scale_Hint
 *
 * Flags that describe the scale hint used by the loader infrastructure.
 *
 * @see Evas_Image_Scale_Hint
 *
 * @since 1.14
  }
{*< No scale hint at all  }
{*< Image is being re-scaled over time, thus turning scaling cache @b off for its data  }
{*< Image is not being re-scaled over time, thus turning scaling cache @b on for its data  }
type
  PEmile_Image_Scale_Hint = ^TEmile_Image_Scale_Hint;
  TEmile_Image_Scale_Hint =  Longint;
  Const
    EMILE_IMAGE_SCALE_HINT_NONE = 0;
    EMILE_IMAGE_SCALE_HINT_DYNAMIC = 1;
    EMILE_IMAGE_SCALE_HINT_STATIC = 2;
;
{*
 * @typedef Emile_Image_Animated_Loop_Hint
 *
 * Flags describing the behavior of animation from a loaded image.
 *
 * @see Evas_Image_Animated_Loop_Hint
 *
 * @since 1.14
  }
type
  PEmile_Image_Animated_Loop_Hint = ^TEmile_Image_Animated_Loop_Hint;
  TEmile_Image_Animated_Loop_Hint =  Longint;
  Const
    EMILE_IMAGE_ANIMATED_HINT_NONE = 0;
    EMILE_IMAGE_ANIMATED_HINT_LOOP = 1;
    EMILE_IMAGE_ANIMATED_HINT_PINGPONG = 2;
;
{*
 * @typedef Emile_Image_Load_Error
 *
 * Flags describing error state as discovered by an image loader.
 *
 * @see Evas_Load_Error
 *
 * @since 1.14
  }
{*< No error on load  }
{*< A non-specific error occurred  }
{*< File (or file path) does not exist  }
{*< Permission denied to an existing file (or path)  }
{*< Allocation of resources failure prevented load  }
{*< File corrupt (but was detected as a known format)  }
{*< File is not a known format  }
{*< File loading has been cancelled  }
type
  PEmile_Image_Load_Error = ^TEmile_Image_Load_Error;
  TEmile_Image_Load_Error =  Longint;
  Const
    EMILE_IMAGE_LOAD_ERROR_NONE = 0;
    EMILE_IMAGE_LOAD_ERROR_GENERIC = 1;
    EMILE_IMAGE_LOAD_ERROR_DOES_NOT_EXIST = 2;
    EMILE_IMAGE_LOAD_ERROR_PERMISSION_DENIED = 3;
    EMILE_IMAGE_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED = 4;
    EMILE_IMAGE_LOAD_ERROR_CORRUPT_FILE = 5;
    EMILE_IMAGE_LOAD_ERROR_UNKNOWN_FORMAT = 6;
    EMILE_IMAGE_LOAD_ERROR_CANCELLED = 7;
;
{*< Emile image load error codes one can get - see emile_load_error_str() too.  }
{*
 * @typedef Emile_Image
 *
 * Internal type representing an opened image.
 *
 * @since 1.14
  }
type
{*
 * @typedef Emile_Image_Load_Opts
 *
 * Description of the possible load option.
 *
 * @since 1.14
  }
{*
 * @typedef Emile_Image_Animated
 *
 * Description animation.
 *
 * @since 1.14
  }
{*
 * @typedef Emile_Image_Property
 *
 * Description of a loaded image property.
 *
 * @since 1.14
  }
{*
 * @enum _Emile_Action
 * @typedef Emile_Action
 * What action emile is referring to.
 * @since 1.19
  }

  PEmile_Action = ^TEmile_Action;
  TEmile_Action =  Longint;
  Const
    EMILE_ACTION_NONE = 0;
    EMILE_ACTION_CANCELLED = 1;
;
{*
 * @typedef Emile_Action_Cb
 * A callback triggered by emile to learn what to do about a specific action.
 * @since 1.19
  }
type

  TEmile_Action_Cb = function (data:pointer; image:PEmile_Image; action:TEmile_Action):TEina_Bool;cdecl;
(* Const before type ignored *)
  PEmile_Image_Property = ^TEmile_Image_Property;
  TEmile_Image_Property = record
      borders : record
          l : byte;cdecl;
          r : byte;
          t : byte;
          b : byte;
        end;
      cspaces : PEmile_Colorspace;
      cspace : TEmile_Colorspace;
      encoding : TEmile_Image_Encoding;
      w : dword;
      h : dword;
      row_stride : dword;
      scale : byte;
      rotated : TEina_Bool;
      alpha : TEina_Bool;
      premul : TEina_Bool;
      alpha_sparse : TEina_Bool;
      flipped : TEina_Bool;
      comp : TEina_Bool;
    end;

  PEmile_Image_Animated = ^TEmile_Image_Animated;
  TEmile_Image_Animated = record
      frames : PEina_List;
      loop_hint : TEmile_Image_Animated_Loop_Hint;
      frame_count : longint;
      loop_count : longint;
      cur_frame : longint;
      animated : TEina_Bool;
    end;

{ This should have never been part of this structure, but we keep it
       for ABI/API compatibility with Evas_Loader  }
  PEmile_Image_Load_Opts = ^TEmile_Image_Load_Opts;
  TEmile_Image_Load_Opts = record
      region : TEina_Rectangle;
      scale_load : record
          src_x : longint;
          src_y : longint;
          src_w : longint;
          src_h : longint;
          dst_w : longint;
          dst_h : longint;
          smooth : longint;
          scale_hint : TEmile_Image_Scale_Hint;
        end;
      dpi : Tdouble;
      w : dword;
      h : dword;
      degree : dword;
      scale_down_by : longint;
      orientation : TEina_Bool;
    end;

{ FIXME: should we set region at load time, instead of head time }
{ FIXME: should we regive the animated structure for head and data ? }
{*
 * Open a TGV image from memory.
 *
 * @param source The Eina_Binbuf with TGV image in it.
 * @param opts Load option for the image to open (it can be @c NULL).
 * @param animated Description of the image animation property, set during head reading and updated for each frame read by data (can be @c NULL)
 * @param error Contain a valid error code if the function return @c NULL.
 * @return a handler of the image if successfully opened, otherwise @c NULL.
 *
 * @since 1.14
  }

function emile_image_tgv_memory_open(source:PEina_Binbuf; opts:PEmile_Image_Load_Opts; animated:PEmile_Image_Animated; error:PEmile_Image_Load_Error):PEmile_Image;cdecl;external;
{*
 * Open a TGV image from a file.
 *
 * @param source The Eina_File with TGV image in it.
 * @param opts Load option for the image to open (it can be @c NULL).
 * @param animated Description of the image animation property, set during head reading and updated for each frame read by data (can be @c NULL)
 * @param error Contain a valid error code if the function return @c NULL.
 * @return a handler of the image if successfully opened, otherwise @c NULL.
 *
 * @since 1.14
  }
function emile_image_tgv_file_open(source:PEina_File; opts:PEmile_Image_Load_Opts; animated:PEmile_Image_Animated; error:PEmile_Image_Load_Error):PEmile_Image;cdecl;external;
{*
 * Open a JPEG image from memory.
 *
 * @param source The Eina_Binbuf with JPEG image in it.
 * @param opts Load option for the image to open (it can be @c NULL).
 * @param animated Description of the image animation property, set during head reading and updated for each frame read by data (can be @c NULL)
 * @param error Contain a valid error code if the function return @c NULL.
 * @return a handler of the image if successfully opened, otherwise @c NULL.
 *
 * @since 1.14
  }
function emile_image_jpeg_memory_open(source:PEina_Binbuf; opts:PEmile_Image_Load_Opts; animated:PEmile_Image_Animated; error:PEmile_Image_Load_Error):PEmile_Image;cdecl;external;
{*
 * Open a JPEG image from file.
 *
 * @param source The Eina_File with JPEG image in it.
 * @param opts Load option for the image to open (it can be @c NULL).
 * @param animated Description of the image animation property, set during head reading and updated for each frame read by data (can be @c NULL)
 * @param error Contain a valid error code if the function return @c NULL.
 * @return a handler of the image if successfully opened, otherwise @c NULL.
 *
 * @since 1.14
  }
function emile_image_jpeg_file_open(source:PEina_File; opts:PEmile_Image_Load_Opts; animated:PEmile_Image_Animated; error:PEmile_Image_Load_Error):PEmile_Image;cdecl;external;
{*
 * Read the header of an image to fill Emile_Image_Property.
 *
 * @param image The Emile_Image handler.
 * @param prop The Emile_Image_Property to be filled.
 * @param property_size The size of the Emile_Image_Property as known during compilation.
 * @param error Contain a valid error code if the function return @c NULL.
 * @return @c EINA_TRUE if the header was successfully readed and prop properly filled.
 *
 * @since 1.14
  }
function emile_image_head(image:PEmile_Image; prop:PEmile_Image_Property; property_size:dword; error:PEmile_Image_Load_Error):TEina_Bool;cdecl;external;
{*
 * Read the pixels from an image file.
 *
 * @param image The Emile_Image handler.
 * @param prop The property to respect while reading this pixels.
 * @param property_size The size of the Emile_Image_Property as known during compilation.
 * @param pixels The actual pointer to the already allocated pixels buffer to fill.
 * @param error Contain a valid error code if the function return @c NULL.
 * @return @c EINA_TRUE if the data was successfully read and the pixels correctly filled.
 *
 * @since 1.14
  }
function emile_image_data(image:PEmile_Image; prop:PEmile_Image_Property; property_size:dword; pixels:pointer; error:PEmile_Image_Load_Error):TEina_Bool;cdecl;external;
{*
 * Register a callback for emile to ask what to do during the processing of an image
 *
 * @param image The Emile_Image handler to register on.
 * @param callback The callback to use
 * @param action The action this callback is triggered on.
 * @since 1.19
  }
(* Const before type ignored *)
procedure emile_image_callback_set(image:PEmile_Image; callback:TEmile_Action_Cb; action:TEmile_Action; data:pointer);cdecl;external;
{*
 * Close an opened image handler.
 *
 * @param source The handler to close.
 *
 * @since 1.14
  }
procedure emile_image_close(source:PEmile_Image);cdecl;external;
{*
 * Convert an error code related to an image handler into a meaningful string.
 *
 * @param source The handler related to the error (can be @c NULL).
 * @param error The error code to get a message from.
 * @return a string that will be owned by Emile, either by the handler if it is not @c NULL or by the library directly if it is.
 *
 * @since 1.14
  }
(* Const before type ignored *)
function emile_load_error_str(source:PEmile_Image; error:TEmile_Image_Load_Error):Pchar;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
