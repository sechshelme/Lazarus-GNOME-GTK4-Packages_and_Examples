
{$IFDEF read_interface}

type
  PGdkPixbufAlphaMode = ^TGdkPixbufAlphaMode;
  TGdkPixbufAlphaMode = longint;

const
  GDK_PIXBUF_ALPHA_BILEVEL = 0;
  GDK_PIXBUF_ALPHA_FULL = 1;

type
  PGdkColorspace = ^TGdkColorspace;
  TGdkColorspace = longint;

const
  GDK_COLORSPACE_RGB = 0;

type
  TGdkPixbufDestroyNotify = procedure(pixels: Pguchar; Data: Tgpointer); cdecl;

type
  PGdkPixbufError = ^TGdkPixbufError;
  TGdkPixbufError = longint;

const
  GDK_PIXBUF_ERROR_CORRUPT_IMAGE = 0;
  GDK_PIXBUF_ERROR_INSUFFICIENT_MEMORY = 1;
  GDK_PIXBUF_ERROR_BAD_OPTION = 2;
  GDK_PIXBUF_ERROR_UNKNOWN_TYPE = 3;
  GDK_PIXBUF_ERROR_UNSUPPORTED_OPERATION = 4;
  GDK_PIXBUF_ERROR_FAILED = 5;
  GDK_PIXBUF_ERROR_INCOMPLETE_ANIMATION = 6;

type
  TGdkPixbuf = record
  end;
  PGdkPixbuf = ^TGdkPixbuf;

function gdk_pixbuf_error_quark: TGQuark; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_type: TGType; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_ref(pixbuf: PGdkPixbuf): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_unref(pixbuf: PGdkPixbuf); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_colorspace(pixbuf: PGdkPixbuf): TGdkColorspace; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_n_channels(pixbuf: PGdkPixbuf): longint; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_has_alpha(pixbuf: PGdkPixbuf): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_bits_per_sample(pixbuf: PGdkPixbuf): longint; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_pixels(pixbuf: PGdkPixbuf): Pguchar; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_width(pixbuf: PGdkPixbuf): longint; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_height(pixbuf: PGdkPixbuf): longint; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_rowstride(pixbuf: PGdkPixbuf): longint; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_byte_length(pixbuf: PGdkPixbuf): Tgsize; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_pixels_with_length(pixbuf: PGdkPixbuf; length: Pguint): Pguchar; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_read_pixels(pixbuf: PGdkPixbuf): Pguint8; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_read_pixel_bytes(pixbuf: PGdkPixbuf): PGBytes; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new(colorspace: TGdkColorspace; has_alpha: Tgboolean; bits_per_sample: longint; Width: longint; Height: longint): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_calculate_rowstride(colorspace: TGdkColorspace; has_alpha: Tgboolean; bits_per_sample: longint; Width: longint; Height: longint): Tgint; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_copy(pixbuf: PGdkPixbuf): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_subpixbuf(src_pixbuf: PGdkPixbuf; src_x: longint; src_y: longint; Width: longint; Height: longint): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
{$ifdef windows}
function gdk_pixbuf_new_from_file_utf8(filename: pansichar; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_file_at_size_utf8(filename: pansichar; Width: longint; Height: longint; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_file_at_scale_utf8(filename: pansichar; Width: longint; Height: longint; preserve_aspect_ratio: Tgboolean; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
{$endif}
function gdk_pixbuf_new_from_file(filename: pansichar; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_file_at_size(filename: pansichar; Width: longint; Height: longint; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_file_at_scale(filename: pansichar; Width: longint; Height: longint; preserve_aspect_ratio: Tgboolean; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_resource(resource_path: pansichar; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_resource_at_scale(resource_path: pansichar; Width: longint; Height: longint; preserve_aspect_ratio: Tgboolean; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_data(Data: Pguchar; colorspace: TGdkColorspace; has_alpha: Tgboolean; bits_per_sample: longint; Width: longint;
  Height: longint; rowstride: longint; destroy_fn: TGdkPixbufDestroyNotify; destroy_fn_data: Tgpointer): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_bytes(Data: PGBytes; colorspace: TGdkColorspace; has_alpha: Tgboolean; bits_per_sample: longint; Width: longint;
  Height: longint; rowstride: longint): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_xpm_data(Data: PPansichar): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_inline(data_length: Tgint; Data: Pguint8; copy_pixels: Tgboolean; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_fill(pixbuf: PGdkPixbuf; pixel: Tguint32); cdecl; external libgdk_pixbuf2;

//const
//  gdk_pixbuf_save = gdk_pixbuf_save_utf8;

function gdk_pixbuf_save(pixbuf: PGdkPixbuf; filename: pansichar; _type: pansichar; error: PPGError): Tgboolean; varargs cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_savev(pixbuf: PGdkPixbuf; filename: pansichar; _type: pansichar; option_keys: PPansichar; option_values: PPansichar;
  error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
{$ifdef windows}
function gdk_pixbuf_savev_utf8(pixbuf: PGdkPixbuf; filename: pansichar; _type: pansichar; option_keys: PPansichar; option_values: PPansichar;
  error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
{$endif}
type
  TGdkPixbufSaveFunc = function(buf: Pgchar; Count: Tgsize; error: PPGError; Data: Tgpointer): Tgboolean; cdecl;

function gdk_pixbuf_save_to_callback(pixbuf: PGdkPixbuf; save_func: TGdkPixbufSaveFunc; user_data: Tgpointer; _type: pansichar; error: PPGError): Tgboolean; varargs cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_save_to_callbackv(pixbuf: PGdkPixbuf; save_func: TGdkPixbufSaveFunc; user_data: Tgpointer; _type: pansichar; option_keys: PPansichar;
  option_values: PPansichar; error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_save_to_buffer(pixbuf: PGdkPixbuf; buffer: PPgchar; buffer_size: Pgsize; _type: pansichar; error: PPGError): Tgboolean; varargs cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_save_to_bufferv(pixbuf: PGdkPixbuf; buffer: PPgchar; buffer_size: Pgsize; _type: pansichar; option_keys: PPansichar;
  option_values: PPansichar; error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_stream(stream: PGInputStream; cancellable: PGCancellable; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_new_from_stream_async(stream: PGInputStream; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_stream_finish(async_result: PGAsyncResult; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_new_from_stream_at_scale(stream: PGInputStream; Width: Tgint; Height: Tgint; preserve_aspect_ratio: Tgboolean; cancellable: PGCancellable;
  error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_new_from_stream_at_scale_async(stream: PGInputStream; Width: Tgint; Height: Tgint; preserve_aspect_ratio: Tgboolean; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_save_to_stream(pixbuf: PGdkPixbuf; stream: PGOutputStream; _type: pansichar; cancellable: PGCancellable; error: PPGError): Tgboolean; varargs cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_save_to_stream_async(pixbuf: PGdkPixbuf; stream: PGOutputStream; _type: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); varargs; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_save_to_stream_finish(async_result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_save_to_streamv_async(pixbuf: PGdkPixbuf; stream: PGOutputStream; _type: Pgchar; option_keys: PPgchar; option_values: PPgchar;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_save_to_streamv(pixbuf: PGdkPixbuf; stream: PGOutputStream; _type: pansichar; option_keys: PPansichar; option_values: PPansichar;
  cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_add_alpha(pixbuf: PGdkPixbuf; substitute_color: Tgboolean; r: Tguchar; g: Tguchar; b: Tguchar): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_copy_area(src_pixbuf: PGdkPixbuf; src_x: longint; src_y: longint; Width: longint; Height: longint;
  dest_pixbuf: PGdkPixbuf; dest_x: longint; dest_y: longint); cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_saturate_and_pixelate(src: PGdkPixbuf; dest: PGdkPixbuf; saturation: Tgfloat; pixelate: Tgboolean); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_apply_embedded_orientation(src: PGdkPixbuf): PGdkPixbuf; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_set_option(pixbuf: PGdkPixbuf; key: Pgchar; Value: Pgchar): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_option(pixbuf: PGdkPixbuf; key: Pgchar): Pgchar; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_remove_option(pixbuf: PGdkPixbuf; key: Pgchar): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_options(pixbuf: PGdkPixbuf): PGHashTable; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_copy_options(src_pixbuf: PGdkPixbuf; dest_pixbuf: PGdkPixbuf): Tgboolean; cdecl; external libgdk_pixbuf2;

function GDK_PIXBUF_ERROR: TGQuark;

// === Konventiert am: 6-11-24 17:24:42 ===

function GDK_TYPE_PIXBUF: TGType;
function GDK_PIXBUF(obj: Pointer): PGdkPixbuf;
function GDK_IS_PIXBUF(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_PIXBUF: TGType;
begin
  GDK_TYPE_PIXBUF := gdk_pixbuf_get_type;
end;

function GDK_PIXBUF(obj: Pointer): PGdkPixbuf;
begin
  Result := PGdkPixbuf(g_type_check_instance_cast(obj, GDK_TYPE_PIXBUF));
end;

function GDK_IS_PIXBUF(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_PIXBUF);
end;


function GDK_PIXBUF_ERROR: TGQuark;
begin
  GDK_PIXBUF_ERROR := gdk_pixbuf_error_quark;
end;


{$ENDIF read_implementation}
