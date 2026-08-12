unit gegl_buffer;

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gegl_buffer_get_type: TGType; cdecl; external libgegl;

const
  GEGL_AUTO_ROWSTRIDE = 0;

type
  TGeglRectangle = record
    x: Tgint;
    y: Tgint;
    width: Tgint;
    height: Tgint;
  end;
  PGeglRectangle = ^TGeglRectangle;

function gegl_buffer_new(extent: PGeglRectangle; format: PBabl): PGeglBuffer; cdecl; external libgegl;
function gegl_buffer_new_for_backend(extent: PGeglRectangle; backend: PGeglTileBackend): PGeglBuffer; cdecl; external libgegl;
procedure gegl_buffer_add_handler(buffer: PGeglBuffer; handler: Tgpointer); cdecl; external libgegl;
procedure gegl_buffer_remove_handler(buffer: PGeglBuffer; handler: Tgpointer); cdecl; external libgegl;
function gegl_buffer_open(path: Pgchar): PGeglBuffer; cdecl; external libgegl;
procedure gegl_buffer_save(buffer: PGeglBuffer; path: Pgchar; roi: PGeglRectangle); cdecl; external libgegl;
function gegl_buffer_load(path: Pgchar): PGeglBuffer; cdecl; external libgegl;
procedure gegl_buffer_flush(buffer: PGeglBuffer); cdecl; external libgegl;
function gegl_buffer_create_sub_buffer(buffer: PGeglBuffer; extent: PGeglRectangle): PGeglBuffer; cdecl; external libgegl;
function gegl_buffer_get_extent(buffer: PGeglBuffer): PGeglRectangle; cdecl; external libgegl;
function gegl_buffer_set_extent(buffer: PGeglBuffer; extent: PGeglRectangle): Tgboolean; cdecl; external libgegl;
function gegl_buffer_set_abyss(buffer: PGeglBuffer; abyss: PGeglRectangle): Tgboolean; cdecl; external libgegl;

procedure gegl_buffer_get(buffer: PGeglBuffer; rect: PGeglRectangle; scale: Tgdouble; format: PBabl; dest: Tgpointer;
  rowstride: Tgint; repeat_mode: TGeglAbyssPolicy); cdecl; external libgegl;
procedure gegl_buffer_set(buffer: PGeglBuffer; rect: PGeglRectangle; mipmap_level: Tgint; format: PBabl; src: pointer;
  rowstride: Tgint); cdecl; external libgegl;
procedure gegl_buffer_set_color_from_pixel(buffer: PGeglBuffer; rect: PGeglRectangle; pixel: Tgconstpointer; pixel_format: PBabl); cdecl; external libgegl;
procedure gegl_buffer_set_pattern(buffer: PGeglBuffer; rect: PGeglRectangle; pattern: PGeglBuffer; x_offset: Tgint; y_offset: Tgint); cdecl; external libgegl;
function gegl_buffer_get_format(buffer: PGeglBuffer): PBabl; cdecl; external libgegl;
function gegl_buffer_set_format(buffer: PGeglBuffer; format: PBabl): PBabl; cdecl; external libgegl;
procedure gegl_buffer_clear(buffer: PGeglBuffer; roi: PGeglRectangle); cdecl; external libgegl;
procedure gegl_buffer_copy(src: PGeglBuffer; src_rect: PGeglRectangle; repeat_mode: TGeglAbyssPolicy; dst: PGeglBuffer; dst_rect: PGeglRectangle); cdecl; external libgegl;
function gegl_buffer_dup(buffer: PGeglBuffer): PGeglBuffer; cdecl; external libgegl;
procedure gegl_buffer_sample_at_level(buffer: PGeglBuffer; x: Tgdouble; y: Tgdouble; scale: PGeglBufferMatrix2; dest: Tgpointer;
  format: PBabl; level: Tgint; sampler_type: TGeglSamplerType; repeat_mode: TGeglAbyssPolicy); cdecl; external libgegl;
procedure gegl_buffer_sample(buffer: PGeglBuffer; x: Tgdouble; y: Tgdouble; scale: PGeglBufferMatrix2; dest: Tgpointer;
  format: PBabl; sampler_type: TGeglSamplerType; repeat_mode: TGeglAbyssPolicy); cdecl; external libgegl;
procedure gegl_buffer_sample_cleanup(buffer: PGeglBuffer); cdecl; external libgegl; deprecated;

type
  TGeglSamplerGetFun = procedure(self: PGeglSampler; x: Tgdouble; y: Tgdouble; scale: PGeglBufferMatrix2; output: pointer;
    repeat_mode: TGeglAbyssPolicy); cdecl;

function gegl_sampler_get_fun(sampler: PGeglSampler): TGeglSamplerGetFun; cdecl; external libgegl;
function gegl_buffer_sampler_new(buffer: PGeglBuffer; format: PBabl; sampler_type: TGeglSamplerType): PGeglSampler; cdecl; external libgegl;
function gegl_buffer_sampler_new_at_level(buffer: PGeglBuffer; format: PBabl; sampler_type: TGeglSamplerType; level: Tgint): PGeglSampler; cdecl; external libgegl;
procedure gegl_sampler_get(sampler: PGeglSampler; x: Tgdouble; y: Tgdouble; scale: PGeglBufferMatrix2; output: pointer;
  repeat_mode: TGeglAbyssPolicy); cdecl; external libgegl;

function gegl_sampler_get_context_rect(sampler: PGeglSampler): PGeglRectangle; cdecl; external libgegl;
function gegl_buffer_linear_new(extent: PGeglRectangle; format: PBabl): PGeglBuffer; cdecl; external libgegl;
function gegl_buffer_linear_new_from_data(data: Tgpointer; format: PBabl; extent: PGeglRectangle; rowstride: Tgint; destroy_fn: TGDestroyNotify;
  destroy_fn_data: Tgpointer): PGeglBuffer; cdecl; external libgegl;
function gegl_buffer_linear_open(buffer: PGeglBuffer; extent: PGeglRectangle; rowstride: Pgint; format: PBabl): Tgpointer; cdecl; external libgegl;
procedure gegl_buffer_linear_close(buffer: PGeglBuffer; linear: Tgpointer); cdecl; external libgegl;
function gegl_buffer_get_abyss(buffer: PGeglBuffer): PGeglRectangle; cdecl; external libgegl;
function gegl_buffer_share_storage(buffer1: PGeglBuffer; buffer2: PGeglBuffer): Tgboolean; cdecl; external libgegl;
function gegl_buffer_signal_connect(buffer: PGeglBuffer; detailed_signal: pchar; c_handler: TGCallback; data: Tgpointer): Tglong; cdecl; external libgegl;
procedure gegl_buffer_freeze_changed(buffer: PGeglBuffer); cdecl; external libgegl;
procedure gegl_buffer_thaw_changed(buffer: PGeglBuffer); cdecl; external libgegl;
procedure gegl_buffer_flush_ext(buffer: PGeglBuffer; rect: PGeglRectangle); cdecl; external libgegl;

procedure gegl_sampler_compute_scale(var matrix: TGeglMatrix2; x, y: single); inline;

function gegl_buffer_get_x(buffer: PGeglBuffer): Tgint;
function gegl_buffer_get_y(buffer: PGeglBuffer): Tgint;
function gegl_buffer_get_width(buffer: PGeglBuffer): Tgint;
function gegl_buffer_get_height(buffer: PGeglBuffer): Tgint;
function gegl_buffer_get_pixel_count(buffer: PGeglBuffer): Tgint;

// === Konventiert am: 12-8-26 14:31:36 ===

function GEGL_TYPE_BUFFER: TGType;
function GEGL_BUFFER(obj: Pointer): PGeglBuffer;
function GEGL_IS_BUFFER(obj: Pointer): Tgboolean;

implementation

procedure gegl_sampler_compute_scale(var matrix: TGeglMatrix2; x, y: single); inline;
var
  ax, ay, bx, by: single;
begin
  gegl_unmap(x + 0.5, y, ax, ay);
  gegl_unmap(x - 0.5, y, bx, by);
  matrix.coeff[0][0] := ax - bx;
  matrix.coeff[1][0] := ay - by;

  gegl_unmap(x, y + 0.5, ax, ay);
  gegl_unmap(x, y - 0.5, bx, by);
  matrix.coeff[0][1] := ax - bx;
  matrix.coeff[1][1] := ay - by;
end;

function GEGL_TYPE_BUFFER: TGType;
begin
  GEGL_TYPE_BUFFER := gegl_buffer_get_type;
end;

function GEGL_BUFFER(obj: Pointer): PGeglBuffer;
begin
  Result := PGeglBuffer(g_type_check_instance_cast(obj, GEGL_TYPE_BUFFER));
end;

function GEGL_IS_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_BUFFER);
end;


function gegl_buffer_get_x(buffer: PGeglBuffer): Tgint;
begin
  gegl_buffer_get_x := (gegl_buffer_get_extent(buffer))^.x;
end;

function gegl_buffer_get_y(buffer: PGeglBuffer): Tgint;
begin
  gegl_buffer_get_y := (gegl_buffer_get_extent(buffer))^.y;
end;

function gegl_buffer_get_width(buffer: PGeglBuffer): Tgint;
begin
  gegl_buffer_get_width := (gegl_buffer_get_extent(buffer))^.width;
end;

function gegl_buffer_get_height(buffer: PGeglBuffer): Tgint;
begin
  gegl_buffer_get_height := (gegl_buffer_get_extent(buffer))^.height;
end;

function gegl_buffer_get_pixel_count(buffer: PGeglBuffer): Tgint;
begin
  gegl_buffer_get_pixel_count := (gegl_buffer_get_width(buffer)) * (gegl_buffer_get_height(buffer));
end;


end.
