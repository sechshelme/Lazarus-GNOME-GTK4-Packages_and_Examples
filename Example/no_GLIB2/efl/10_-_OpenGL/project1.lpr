program project1;

uses
  efl,
  fp_eina,
  fp_eo,
  fp_efl,
  fp_ecore,
  fp_ecore_evas,
  fp_evas;

type
  TGLData = record
    ctx: PEvas_GL_Context;
    sfc: PEvas_GL_Surface;
    cfg: PEvas_GL_Config;
    evasgl: PEvas_GL;
    glapi: PEvas_GL_API;
    program_: TGLuint;
    vtx_shader: TGLuint;
    fgmt_shader: TGLuint;
    initialized: boolean;
  end;
  PGLData = ^TGLData;

  const
        gl_Key= 'gld_key';


  procedure on_del(data: pointer; e: PEvas; obj: PEvas_Object; event_info: pointer); cdecl;
  var
    gld: PGLData;
    gl: PEvas_GL_API;
  begin
    gld := evas_object_data_get(obj, gl_Key);
    if gld = nil then begin
      Exit;
    end;
    gl := gld^.glapi;

    evas_object_data_del(obj, gl_Key);

    evas_gl_make_current(gld^.evasgl, gld^.sfc, gld^.ctx);
    gl^.glDeleteShader(gld^.vtx_shader);
    gl^.glDeleteShader(gld^.fgmt_shader);
    gl^.glDeleteProgram(gld^.program_);

    evas_gl_surface_destroy(gld^.evasgl, gld^.sfc);
    evas_gl_context_destroy(gld^.evasgl, gld^.ctx);
    evas_gl_config_free(gld^.cfg);
    evas_gl_free(gld^.evasgl);
    free(gld);
  end;

  function load_shader(gld: PGLData; type_: TGLenum; shader_src: pchar): TGLuint;
  var
    gl: PEvas_GL_API;
    compiled: TGLint = 0;
    shader: TGLuint;
    len: TGLint = 0;
    info: pchar;
  begin
    gl := gld^.glapi;
    shader := gl^.glCreateShader(type_);

    if shader = 0 then begin
      Exit(0);
    end;
    gl^.glShaderSource(shader, 1, @shader_src, nil);
    gl^.glCompileShader(shader);
    gl^.glGetShaderiv(shader, GL_COMPILE_STATUS, @compiled);

    if compiled = 0 then begin
      gl^.glGetShaderiv(shader, GL_INFO_LOG_LENGTH, @len);
      if len > 1 then begin
        info := malloc(sizeof(char) * len);

        if info <> nil then begin
          gl^.glGetShaderInfoLog(shader, len, nil, info);
          WriteLn('Error compiling shader: ', info);
          free(info);
        end;
      end;
      gl^.glDeleteShader(shader);
      Exit(0);
    end;
    Exit(shader);
  end;

  function init_shaders(gld: PGLData): integer;
  const
    vShaderStr =
      'attribute vec4 vPosition;'#10 +
      'void main()'#10 +
      '{'#10 +
      '   gl_Position = vPosition;'#10 +
      '}';

    fShaderStr =
      'precision mediump float;'#10 +
      'void main()'#10 +
      '{'#10 +
      '  gl_FragColor = vec4( 1.0, 0.0, 0.0, 1.0 );'#10 +
      '}';
  var
    linked: TGLint = 0;
    gl: PEvas_GL_API;
    len: TGLint = 0;
    info: pchar;
  begin
    gl := gld^.glapi;

    gld^.vtx_shader := load_shader(gld, GL_VERTEX_SHADER, vShaderStr);
    gld^.fgmt_shader := load_shader(gld, GL_FRAGMENT_SHADER, fShaderStr);

    gld^.program_ := gl^.glCreateProgram();
    if gld^.program_ = 0 then begin
      Exit(0);
    end;

    gl^.glAttachShader(gld^.program_, gld^.vtx_shader);
    gl^.glAttachShader(gld^.program_, gld^.fgmt_shader);

    gl^.glBindAttribLocation(gld^.program_, 0, 'vPosition');
    gl^.glLinkProgram(gld^.program_);
    gl^.glGetProgramiv(gld^.program_, GL_LINK_STATUS, @linked);

    if linked = 0 then begin
      gl^.glGetProgramiv(gld^.program_, GL_INFO_LOG_LENGTH, @len);
      if len > 1 then begin
        info := malloc(sizeof(char) * len);

        if info <> nil then begin
          gl^.glGetProgramInfoLog(gld^.program_, len, nil, info);
          WriteLn('Error linking program: ', info);
          free(info);
        end;
      end;
      gl^.glDeleteProgram(gld^.program_);
      Exit(0);
    end;
    Exit(1);
  end;


  procedure on_pixels(data: pointer; o: PEvas_Object); cdecl;
  var
    gld: PGLData;
    gl: PEvas_GL_API;
    w, h: longint;
  const
    vVertices: array[0..8] of TGLfloat = (
      0.0, 0.5, 0.0,
      -0.5, -0.5, 0.0,
      0.5, -0.5, 0.0);

  begin
    gld := evas_object_data_get(o, gl_Key);
    if gld = nil then begin
      Exit;
    end;
    gl := gld^.glapi;

    evas_object_image_size_get(o, @w, @h);
    evas_gl_make_current(gld^.evasgl, gld^.sfc, gld^.ctx);

    if not gld^.initialized then begin
      if init_shaders(gld) = 0 then begin
        WriteLn('Error Initializing Shaders');
      end;
      gld^.initialized := EINA_TRUE;
    end;

    gl^.glViewport(0, 0, w, h);

    gl^.glClearColor(1.0, 1.0, 0.0, 1);
    gl^.glClear(GL_COLOR_BUFFER_BIT);

    gl^.glEnable(GL_BLEND);

    gl^.glUseProgram(gld^.program_);

    gl^.glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, @vVertices);
    gl^.glEnableVertexAttribArray(0);

    gl^.glDrawArrays(GL_TRIANGLES, 0, 3);
  end;

  function on_animate(data: pointer): TEina_Bool; cdecl;
  begin
    evas_object_image_pixels_dirty_set(data, EINA_TRUE);
    Exit(EINA_TRUE);
  end;

  function main(argc: integer; argv: PPChar): integer;
  const
    w = 256;
    h = 256;
  var
    ee: PEcore_Evas;
    canvas: PEvas;
    gld: PGLData = nil;
    r1: PEvas_Object;
    ns: TEvas_Native_Surface;
  begin
    ecore_init;
    ecore_evas_init;
    ee := ecore_evas_gl_x11_new(nil, 0, 0, 0, 512, 512);
    ecore_evas_title_set(ee, 'Ecore_Evas Template');
    canvas := ecore_evas_get(ee);

    gld := calloc(1, sizeof(TGLData));
    if gld = nil then  begin
      Exit(0);
    end;

    gld^.evasgl := evas_gl_new(canvas);
    gld^.glapi := evas_gl_api_get(gld^.evasgl);

    gld^.cfg := evas_gl_config_new();
    gld^.cfg^.color_format := EVAS_GL_RGBA_8888;

    gld^.sfc := evas_gl_surface_create(gld^.evasgl, gld^.cfg, w, h);
    gld^.ctx := evas_gl_context_create(gld^.evasgl, nil);

    r1 := evas_object_image_filled_add(canvas);
    evas_object_data_set(r1, gl_Key, gld);
    evas_object_event_callback_add(r1, EVAS_CALLBACK_DEL, @on_del, nil);
    evas_object_image_size_set(r1, w, h);

    evas_gl_native_surface_get(gld^.evasgl, gld^.sfc, @ns);
    evas_object_image_native_surface_set(r1, @ns);
    evas_object_image_pixels_get_callback_set(r1, @on_pixels, r1);

    evas_object_move(r1, 128, 128);
    evas_object_resize(r1, w, h);
    evas_object_show(r1);

    ecore_animator_add(@on_animate, r1);

    ecore_evas_show(ee);

    ecore_main_loop_begin;

    ecore_evas_shutdown;
    ecore_shutdown();

    Result := 0;
  end;

begin
  main(argc, argv);
end.
