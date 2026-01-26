program project1;

uses
  fp_mpv,
  fp_GL_Tools,
  fp_glew,
  fp_glfw3;

const
  {$IFDEF linux}
  libc = 'c';
  {$ENDIF}

  {$IFDEF windows}
  libc = 'msvcrt.dll';
  {$ENDIF}

  function usleep(__useconds: uint32): longint; cdecl; external libc;

const
  Quad: array[0..23] of TGLfloat = (
    -0.8, 0.8, 0.0, 1.0,
    -0.8, -0.8, 0.0, 0.0,
    0.8, -0.8, 1.0, 0.0,

    -0.8, 0.8, 0.0, 1.0,
    0.8, -0.8, 1.0, 0.0,
    0.8, 0.8, 1.0, 1.0);

  vertex_shader_text =
    '#version 330 core'#10 +
    'layout (location = 0) in vec2 vPos;'#10 +
    'layout (location = 1) in vec2 vUV;'#10 +

    'uniform float x;'#10 +

    'out vec2 UV;'#10 +
    'void main() {'#10 +
    '   gl_Position = vec4(vPos.xy, 0.0, 1.0);'#10 +
    '   gl_Position.x *= x;'#10 +
    '   UV = vUV;'#10 +
    '}';

  fragment_shader_text =
    '#version 330 core'#10 +
    'out vec4 col;'#10 +
    'in vec2 UV;'#10 +
    'uniform sampler2D videoTexture;'#10 +
    'void main() {'#10 +
    '   col = texture(videoTexture, UV);'#10 +
    '}';

  function get_proc_address(ctx: pointer; name: pchar): pointer; cdecl;
  begin
    glfwGetCurrentContext;
    Result := Pointer(glfwGetProcAddress(name));
  end;

  procedure on_mpv_render_update(cb_ctx: pointer); cdecl;
  begin
    PLongint(cb_ctx)^ := 1;
  end;

  procedure main;
  var
    window: PGLFWwindow;
    shader: PShader;

    ScreenWidth: integer = 800;
    ScreenHeight: integer = 600;

    VAO: TGLuint;
    VBO: TGLuint;
    fbo, texture: TGLuint;

    cmd: array[0..2] of pchar = ('loadfile', '/n4800/Multimedia/Videos/WNDSURF1.AVI', nil);
    // cmd: array[0..2] of pchar = ('loadfile', '/home/tux/Schreibtisch/sound/test.mp3', nil);
    mpv: Pmpv_handle;
    gl_init_params: Tmpv_opengl_init_params;
    params: array[0..3] of Tmpv_render_param;
    mpv_ctx: Pmpv_render_context;
    mpv_fbo: Tmpv_opengl_fbo;

    params_fbo: array[0..2] of Tmpv_render_param;

    flip_y,
    advanced_control,
    wakeup_flag,
    status: integer;

    w: int64 = 0;
    h: int64 = 0;
    timeout: int64 = 0;

    x: single;

  begin
    // === glfw
    if glfwInit = 0 then begin
      WriteLn('glfwInit Error !');
      Halt(1);
    end;

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    window := glfwCreateWindow(ScreenWidth, ScreenHeight, pchar('GLFW-MPV   ( ' + {$I %FPCTARGETOS%} + ' )'), nil, nil);
    if window = nil then begin
      WriteLn('glfwCreateWindow Error !');
      Halt(1);
    end;

    glfwMakeContextCurrent(window);
    glfwSwapInterval(1);

    // === Load glew
    if glewInit <> GLEW_OK then begin
      WriteLn('glxewInit Fehler');
      Halt(1);
    end;

    // === MPV
    mpv := mpv_create;
    if mpv_initialize(mpv) < 0 then  begin
      WriteLn('mpv_initialize()   Error');
      Exit;
    end;

    mpv_command(mpv, @cmd);

    mpv_set_option_string(mpv, 'hwdec', 'auto');
    mpv_set_option_string(mpv, 'loop', 'inf');

    gl_init_params.get_proc_address := @get_proc_address;
    gl_init_params.get_proc_address_ctx := nil;
    advanced_control := 1;

    params[0]._type := MPV_RENDER_PARAM_API_TYPE;
    params[0].data := pchar(MPV_RENDER_API_TYPE_OPENGL);
    params[1]._type := MPV_RENDER_PARAM_OPENGL_INIT_PARAMS;
    params[1].data := @gl_init_params;
    params[2]._type := MPV_RENDER_PARAM_ADVANCED_CONTROL;
    params[2].data := @advanced_control;
    params[3]._type := MPV_RENDER_PARAM_INVALID;
    params[3].data := nil;

    status := mpv_render_context_create(@mpv_ctx, mpv, @params[0]);
    if status < 0 then begin
      WriteLn('MPV Context create failed: ', mpv_error_string(status));
      Exit;
    end;

    wakeup_flag := 0;
    mpv_render_context_set_update_callback(mpv_ctx, @on_mpv_render_update, @wakeup_flag);

    repeat
      Inc(timeout);
      usleep(10);
      Write('.');
      mpv_get_property(mpv, 'width', MPV_FORMAT_INT64, @w);
      mpv_get_property(mpv, 'height', MPV_FORMAT_INT64, @h);
    until ((w > 0) and (h > 0)) or (timeout > 10000);

    if w = 0 then begin
      WriteLn('Keine Video Datei!');
    end else begin
      WriteLn(#10'Video Size: ', w, ' x ', h);
    end;

    // === OpenGL
    // Shader
    shader := shader_new;
    if not shader_load_shaderobject(shader, GL_VERTEX_SHADER, pchar(vertex_shader_text)) then begin
      WriteLn('Fehler im Vertex-Shader:'#10, shader_get_errortext(shader));
    end;
    if not shader_load_shaderobject(shader, GL_FRAGMENT_SHADER, fragment_shader_text) then begin
      WriteLn('Fehler im Fragment-Shader:'#10, shader_get_errortext(shader));
    end;
    if not shader_link_program(shader) then begin
      WriteLn('Fehler beim Linken der Shader:'#10, shader_get_errortext(shader));
    end;
    shader_use_program(shader);

    // Textur
    glGenFramebuffers(1, @fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);

    glGenTextures(1, @texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, w, h, 0, GL_RGB, GL_UNSIGNED_BYTE, nil);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, 0);
    glUniform1i(glGetUniformLocation(shader_get_ID(shader), 'videoTexture'), 0);

    // Vertex
    glGenVertexArrays(1, @VAO);
    glGenBuffers(1, @VBO);
    glBindVertexArray(VAO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, SizeOf(Quad), @Quad, GL_STATIC_DRAW);

    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 4 * sizeof(TGLfloat), Pointer(0));
    glEnableVertexAttribArray(1);
    glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 4 * sizeof(TGLfloat), Pointer(2 * sizeof(TGLfloat)));

    // === Loop
    timeout := 0;
    while glfwWindowShouldClose(window) = 0 do begin
      glfwPollEvents;
      glfwMakeContextCurrent(window);
      glfwGetFramebufferSize(window, @ScreenWidth, @ScreenHeight);

      if wakeup_flag <> 0 then begin
        status := mpv_render_context_update(mpv_ctx);
        if (status and MPV_RENDER_UPDATE_FRAME) <> 0 then begin
          mpv_fbo.fbo := integer(fbo);
          mpv_fbo.w := w;
          mpv_fbo.h := h;
          mpv_fbo.internal_format := 0;
          flip_y := 1;

          params_fbo[0]._type := MPV_RENDER_PARAM_OPENGL_FBO;
          params_fbo[0].data := @mpv_fbo;
          params_fbo[1]._type := MPV_RENDER_PARAM_FLIP_Y;
          params_fbo[1].data := @flip_y;
          params_fbo[2]._type := MPV_RENDER_PARAM_INVALID;
          params_fbo[2].data := nil;

          mpv_render_context_render(mpv_ctx, @params_fbo[0]);
          mpv_render_context_report_swap(mpv_ctx);
        end;
        wakeup_flag := 0;
      end;

      glBindFramebuffer(GL_FRAMEBUFFER, 0);
      glClearColor(0.3, 0.3, 0.3, 1.0);
      glViewport(0, 0, ScreenWidth, ScreenHeight);
      glClear(GL_COLOR_BUFFER_BIT);

      shader_use_program(shader);

      x := sin(timeout / 100);
      glUniform1f(shader_uniform_location(shader, 'x'), x);
      Inc(timeout);

      glActiveTexture(GL_TEXTURE0);
      glBindTexture(GL_TEXTURE_2D, texture);

      glBindVertexArray(VAO);
      glDrawArrays(GL_TRIANGLES, 0, 6);

      glfwSwapBuffers(window);
    end;

    mpv_render_context_free(mpv_ctx);
    mpv_destroy(mpv);

    glDeleteVertexArrays(1, @VAO);
    glDeleteBuffers(1, @VBO);

    shader_unref(shader);

    glfwDestroyWindow(window);
    glfwTerminate;
  end;

begin
  main;
end.
