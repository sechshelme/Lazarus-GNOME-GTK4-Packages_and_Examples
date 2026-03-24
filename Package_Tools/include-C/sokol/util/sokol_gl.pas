unit sokol_gl;

interface

uses
  fp_sokol, sokol_gfx;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tsgl_logger_t = record
    func: procedure(tag: pchar; log_level: Tuint32_t; log_item_id: Tuint32_t; message_or_null: pchar; line_nr: Tuint32_t;
      filename_or_null: pchar; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psgl_logger_t = ^Tsgl_logger_t;

  Tsgl_pipeline = record
    id: Tuint32_t;
  end;
  Psgl_pipeline = ^Tsgl_pipeline;

  Tsgl_context = record
    id: Tuint32_t;
  end;
  Psgl_context = ^Tsgl_context;

  Tsgl_error_t = record
    any: boolean;
    vertices_full: boolean;
    uniforms_full: boolean;
    commands_full: boolean;
    stack_overflow: boolean;
    stack_underflow: boolean;
    no_context: boolean;
  end;
  Psgl_error_t = ^Tsgl_error_t;

  Tsgl_context_desc_t = record
    max_vertices: longint;
    max_commands: longint;
    color_format: Tsg_pixel_format;
    depth_format: Tsg_pixel_format;
    sample_count: longint;
  end;
  Psgl_context_desc_t = ^Tsgl_context_desc_t;

  Tsgl_allocator_t = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psgl_allocator_t = ^Tsgl_allocator_t;

  Tsgl_desc_t = record
    max_vertices: longint;
    max_commands: longint;
    context_pool_size: longint;
    pipeline_pool_size: longint;
    color_format: Tsg_pixel_format;
    depth_format: Tsg_pixel_format;
    sample_count: longint;
    face_winding: Tsg_face_winding;
    allocator: Tsgl_allocator_t;
    logger: Tsgl_logger_t;
  end;
  Psgl_desc_t = ^Tsgl_desc_t;

procedure sgl_setup(desc: Psgl_desc_t); cdecl; external libsokol;
procedure sgl_shutdown; cdecl; external libsokol;
function sgl_rad(deg: single): single; cdecl; external libsokol;
function sgl_deg(rad: single): single; cdecl; external libsokol;
function sgl_error: Tsgl_error_t; cdecl; external libsokol;
function sgl_context_error(ctx: Tsgl_context): Tsgl_error_t; cdecl; external libsokol;

function sgl_make_context(desc: Psgl_context_desc_t): Tsgl_context; cdecl; external libsokol;
procedure sgl_destroy_context(ctx: Tsgl_context); cdecl; external libsokol;
procedure sgl_set_context(ctx: Tsgl_context); cdecl; external libsokol;
function sgl_get_context: Tsgl_context; cdecl; external libsokol;
function sgl_default_context: Tsgl_context; cdecl; external libsokol;

function sgl_num_vertices: longint; cdecl; external libsokol;
function sgl_num_commands: longint; cdecl; external libsokol;

procedure sgl_draw; cdecl; external libsokol;
procedure sgl_context_draw(ctx: Tsgl_context); cdecl; external libsokol;
procedure sgl_draw_layer(layer_id: longint); cdecl; external libsokol;
procedure sgl_context_draw_layer(ctx: Tsgl_context; layer_id: longint); cdecl; external libsokol;

function sgl_make_pipeline(desc: Psg_pipeline_desc): Tsgl_pipeline; cdecl; external libsokol;
function sgl_context_make_pipeline(ctx: Tsgl_context; desc: Psg_pipeline_desc): Tsgl_pipeline; cdecl; external libsokol;
procedure sgl_destroy_pipeline(pip: Tsgl_pipeline); cdecl; external libsokol;

procedure sgl_defaults; cdecl; external libsokol;
procedure sgl_viewport(x: longint; y: longint; w: longint; h: longint; origin_top_left: boolean); cdecl; external libsokol;
procedure sgl_viewportf(x: single; y: single; w: single; h: single; origin_top_left: boolean); cdecl; external libsokol;
procedure sgl_scissor_rect(x: longint; y: longint; w: longint; h: longint; origin_top_left: boolean); cdecl; external libsokol;
procedure sgl_scissor_rectf(x: single; y: single; w: single; h: single; origin_top_left: boolean); cdecl; external libsokol;
procedure sgl_enable_texture; cdecl; external libsokol;
procedure sgl_disable_texture; cdecl; external libsokol;
procedure sgl_texture(tex_view: Tsg_view; smp: Tsg_sampler); cdecl; external libsokol;
procedure sgl_layer(layer_id: longint); cdecl; external libsokol;

procedure sgl_load_default_pipeline; cdecl; external libsokol;
procedure sgl_load_pipeline(pip: Tsgl_pipeline); cdecl; external libsokol;
procedure sgl_push_pipeline; cdecl; external libsokol;
procedure sgl_pop_pipeline; cdecl; external libsokol;

procedure sgl_matrix_mode_modelview; cdecl; external libsokol;
procedure sgl_matrix_mode_projection; cdecl; external libsokol;
procedure sgl_matrix_mode_texture; cdecl; external libsokol;
procedure sgl_load_identity; cdecl; external libsokol;
procedure sgl_load_matrix(m: Psingle); cdecl; external libsokol;
procedure sgl_load_transpose_matrix(m: Psingle); cdecl; external libsokol;
procedure sgl_mult_matrix(m: Psingle); cdecl; external libsokol;
procedure sgl_mult_transpose_matrix(m: Psingle); cdecl; external libsokol;
procedure sgl_rotate(angle_rad: single; x: single; y: single; z: single); cdecl; external libsokol;
procedure sgl_scale(x: single; y: single; z: single); cdecl; external libsokol;
procedure sgl_translate(x: single; y: single; z: single); cdecl; external libsokol;
procedure sgl_frustum(l: single; r: single; b: single; t: single; n: single; f: single); cdecl; external libsokol;
procedure sgl_ortho(l: single; r: single; b: single; t: single; n: single; f: single); cdecl; external libsokol;
procedure sgl_perspective(fov_y: single; aspect: single; z_near: single; z_far: single); cdecl; external libsokol;
procedure sgl_lookat(eye_x: single; eye_y: single; eye_z: single; center_x: single; center_y: single; center_z: single; up_x: single; up_y: single; up_z: single); cdecl; external libsokol;
procedure sgl_push_matrix; cdecl; external libsokol;
procedure sgl_pop_matrix; cdecl; external libsokol;

procedure sgl_t2f(u: single; v: single); cdecl; external libsokol;
procedure sgl_c3f(r: single; g: single; b: single); cdecl; external libsokol;
procedure sgl_c4f(r: single; g: single; b: single; a: single); cdecl; external libsokol;
procedure sgl_c3b(r: Tuint8_t; g: Tuint8_t; b: Tuint8_t); cdecl; external libsokol;
procedure sgl_c4b(r: Tuint8_t; g: Tuint8_t; b: Tuint8_t; a: Tuint8_t); cdecl; external libsokol;
procedure sgl_c1i(rgba: Tuint32_t); cdecl; external libsokol;
procedure sgl_point_size(s: single); cdecl; external libsokol;

procedure sgl_begin_points; cdecl; external libsokol;
procedure sgl_begin_lines; cdecl; external libsokol;
procedure sgl_begin_line_strip; cdecl; external libsokol;
procedure sgl_begin_triangles; cdecl; external libsokol;
procedure sgl_begin_triangle_strip; cdecl; external libsokol;
procedure sgl_begin_quads; cdecl; external libsokol;
procedure sgl_v2f(x: single; y: single); cdecl; external libsokol;
procedure sgl_v3f(x: single; y: single; z: single); cdecl; external libsokol;
procedure sgl_v2f_t2f(x: single; y: single; u: single; v: single); cdecl; external libsokol;
procedure sgl_v3f_t2f(x: single; y: single; z: single; u: single; v: single); cdecl; external libsokol;
procedure sgl_v2f_c3f(x: single; y: single; r: single; g: single; b: single); cdecl; external libsokol;
procedure sgl_v2f_c3b(x: single; y: single; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t); cdecl; external libsokol;
procedure sgl_v2f_c4f(x: single; y: single; r: single; g: single; b: single; a: single); cdecl; external libsokol;
procedure sgl_v2f_c4b(x: single; y: single; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t; a: Tuint8_t); cdecl; external libsokol;
procedure sgl_v2f_c1i(x: single; y: single; rgba: Tuint32_t); cdecl; external libsokol;
procedure sgl_v3f_c3f(x: single; y: single; z: single; r: single; g: single; b: single); cdecl; external libsokol;
procedure sgl_v3f_c3b(x: single; y: single; z: single; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t); cdecl; external libsokol;
procedure sgl_v3f_c4f(x: single; y: single; z: single; r: single; g: single; b: single; a: single); cdecl; external libsokol;
procedure sgl_v3f_c4b(x: single; y: single; z: single; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t; a: Tuint8_t); cdecl; external libsokol;
procedure sgl_v3f_c1i(x: single; y: single; z: single; rgba: Tuint32_t); cdecl; external libsokol;
procedure sgl_v2f_t2f_c3f(x: single; y: single; u: single; v: single; r: single; g: single; b: single); cdecl; external libsokol;
procedure sgl_v2f_t2f_c3b(x: single; y: single; u: single; v: single; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t); cdecl; external libsokol;
procedure sgl_v2f_t2f_c4f(x: single; y: single; u: single; v: single; r: single; g: single; b: single; a: single); cdecl; external libsokol;
procedure sgl_v2f_t2f_c4b(x: single; y: single; u: single; v: single; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t; a: Tuint8_t); cdecl; external libsokol;
procedure sgl_v2f_t2f_c1i(x: single; y: single; u: single; v: single; rgba: Tuint32_t); cdecl; external libsokol;
procedure sgl_v3f_t2f_c3f(x: single; y: single; z: single; u: single; v: single; r: single; g: single; b: single); cdecl; external libsokol;
procedure sgl_v3f_t2f_c3b(x: single; y: single; z: single; u: single; v: single; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t); cdecl; external libsokol;
procedure sgl_v3f_t2f_c4f(x: single; y: single; z: single; u: single; v: single; r: single; g: single; b: single; a: single); cdecl; external libsokol;
procedure sgl_v3f_t2f_c4b(x: single; y: single; z: single; u: single; v: single; r: Tuint8_t; g: Tuint8_t; b: Tuint8_t; a: Tuint8_t); cdecl; external libsokol;
procedure sgl_v3f_t2f_c1i(x: single; y: single; z: single; u: single; v: single; rgba: Tuint32_t); cdecl; external libsokol;
procedure sgl_end; cdecl; external libsokol;

// === Konventiert am: 24-3-26 13:40:02 ===


implementation



end.
