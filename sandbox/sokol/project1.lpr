program project1;

uses
  sokol_gfx,
  sokol_app,
  sokol_args,
  sokol_audio,
  sokol_fetch,
  sokol_glue,
  sokol_log,
  sokol_time,

  fp_sokol;

type
  Tstate = record
    pip: Tsg_pipeline;
    bind: Tsg_bindings;
    pass_action: Tsg_pass_action;
  end;
var
  state: Tstate;

  procedure init; cdecl;
  const
    vs_src =
      '#version 330'#10 +
      'in vec4 position;'#10 +
      'in vec4 color0;'#10 +
      'out vec4 color;'#10 +
      'void main() {'#10 +
      '  gl_Position = position;'#10 +
      '  color = color0;'#10 +
      '}';

    fs_src =
      '#version 330'#10 +
      'in vec4 color;'#10 +
      'out vec4 frag_color;'#10 +
      'void main() {'#10 +
      '  frag_color = color;'#10 +
      '}';
  const
    vertices: array of single = (
      0.0, 0.5, 0.5, 1.0, 0.0, 0.0, 1.0,
      0.5, -0.5, 0.5, 0.0, 1.0, 0.0, 1.0,
      -0.5, -0.5, 0.5, 0.0, 0.0, 1.0, 1.0);
  var
    sg_desc: Tsg_desc;
    sg_buffer_desc: Tsg_buffer_desc;
    range: Tsg_range;
    sg_pipeline_desc: Tsg_pipeline_desc;
    shd_desc: Tsg_shader_desc;
  begin
    FillChar(shd_desc, SizeOf(shd_desc), 0);
    shd_desc.attrs[0].glsl_name := 'position';
    shd_desc.attrs[1].glsl_name := 'color0';
    shd_desc.vertex_func.source := pchar(vs_src);
    shd_desc.fragment_func.source := pchar(fs_src);

    FillChar(sg_desc, SizeOf(sg_desc), 0);
    sg_desc.environment := sglue_environment;
    sg_desc.logger.func := @slog_func;
    sg_setup(@sg_desc);

    FillChar(sg_buffer_desc, SizeOf(sg_buffer_desc), 0);
    range.ptr := Pointer(vertices);
    range.size := Length(vertices) * SizeOf(single);
    sg_buffer_desc.data := range;
    state.bind.vertex_buffers[0] := sg_make_buffer(@sg_buffer_desc);

    FillChar(sg_pipeline_desc, SizeOf(sg_pipeline_desc), 0); //
    sg_pipeline_desc.layout.attrs[0].format := SG_VERTEXFORMAT_FLOAT3;
    sg_pipeline_desc.layout.attrs[1].format := SG_VERTEXFORMAT_FLOAT4;
    sg_pipeline_desc.shader := sg_make_shader(@shd_desc);
    state.pip := sg_make_pipeline(@sg_pipeline_desc);

    FillChar(state.pass_action, SizeOf(state.pass_action), 0);
    state.pass_action.colors[0].load_action := SG_LOADACTION_CLEAR;

    state.pass_action.colors[0].clear_value.r := 0.0;
    state.pass_action.colors[0].clear_value.g := 0.0;
    state.pass_action.colors[0].clear_value.b := 0.0;
    state.pass_action.colors[0].clear_value.a := 1.0;
  end;

  procedure frame; cdecl;
  var
    render_pass: Tsg_pass;
  begin
    FillChar(render_pass, SizeOf(render_pass), 0);

    render_pass.action := state.pass_action;
    render_pass.swapchain := sglue_swapchain();
    sg_begin_pass(@render_pass);
    sg_apply_pipeline(state.pip);
    sg_apply_bindings(@state.bind);
    sg_draw(0, 3, 1);
    sg_end_pass;
    sg_commit;
  end;

  procedure cleanup; cdecl;
  begin
    sg_shutdown;
  end;

  procedure slog_func(tag: pchar; log_level: Tuint32_t; log_item_id: Tuint32_t;
    message_or_null: pchar; line_nr: Tuint32_t; filename_or_null: pchar; user_data: pointer); cdecl;
  begin
    Write('SOKOL [', tag, '] ');
    Write('ID:', log_item_id, ' ');

    if message_or_null <> nil then begin
      WriteLn(': ', message_or_null);
    end else begin
      WriteLn(': (keine Nachricht)');
    end;

    if line_nr > 0 then begin
      WriteLn('  Fehler in Datei: ', filename_or_null, ' Zeile: ', line_nr);
    end;
  end;

  procedure main;
  var
    desc: Tsapp_desc;
  begin
    sg_d3d11_device;
    FillChar(desc, SizeOf(desc), 0);

    desc.init_cb := @init;
    desc.frame_cb := @frame;
    desc.cleanup_cb := @cleanup;
    desc.width := 640;
    desc.height := 480;
    desc.window_title := 'Triangle';
    desc.icon.sokol_default := True;
    desc.logger.func := @slog_func;

    sapp_run(@desc);
  end;

begin
  main;
end.
