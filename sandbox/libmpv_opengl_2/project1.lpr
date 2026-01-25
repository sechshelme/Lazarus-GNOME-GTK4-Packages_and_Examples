program project1;

uses
  fp_glfw3,
  fp_mpv,
  oglglad_gl,
  oglDebug,
  oglShader;

    {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure Char_callBack(window: PGLFWwindow; codepoint: dword); cdecl;
begin
  WriteLn('press Char');
end;

procedure Mouse_Callback(window: PGLFWwindow; button: longint; action: longint; mods: longint); cdecl;
begin
  WriteLn('click    button: ', button, '  action: ', action, '  mods: ', mods);
end;

  procedure error_callback(error_code: longint; description: pchar); cdecl;
  begin
    WriteLn('ErrorCallback: (', error_code, ')  ', description);
  end;

  procedure Key_callback(window: PGLFWwindow; key: longint; scancode: longint; action: longint; mods: longint); cdecl;
  begin
    WriteLn('press Key');
    if (key = GLFW_KEY_ESCAPE) and (action = GLFW_PRESS) then begin
      glfwSetWindowShouldClose(window, GLFW_TRUE);
    end;
  end;

const
  Quad: array[0..23] of TGLfloat = (
    // Pos        // Tex
    -0.8, 0.8, 0.0, 1.0,
    -0.8, -0.8, 0.0, 0.0,
    0.8, -0.8, 1.0, 0.0,

    -0.8, 0.8, 0.0, 1.0,
    0.8, -0.8, 1.0, 0.0,
    0.8, 0.8, 1.0, 1.0);

  vertex_shader_text: string =
    '#version 330 core'#10 +
    'layout (location = 0) in vec2 aPos;'#10 +
    'layout (location = 1) in vec2 aTexCoords;'#10 +
    'out vec2 TexCoords;'#10 +
    'void main() {'#10 +
    '   gl_Position = vec4(aPos.x, aPos.y, 0.0, 1.0);'#10 +
    '   TexCoords = aTexCoords;'#10 +
    '}';

  fragment_shader_text =
    '#version 330 core'#10 +
    'out vec4 FragColor;'#10 +
    'in vec2 TexCoords;'#10 +
    'uniform sampler2D videoTexture;'#10 +
    'void main() {'#10 +
    '   FragColor = texture(videoTexture, TexCoords);'#10 +
    '   FragColor.r = 0.5;'#10 +
    '   FragColor = vec4(1.0, 1.0, 0.0, 1.0);'#10 +  // GRÜN!
    '}';

  function get_proc_address(ctx: pointer; name: pchar): pointer; cdecl;
  begin
    glfwGetCurrentContext;
    Result := Pointer(glfwGetProcAddress(name));
  end;

  procedure on_mpv_render_update(cb_ctx: pointer); cdecl;
  begin
    PInteger(cb_ctx)^ := 1;
  end;

  procedure main;
  var
    window: PGLFWwindow;
    Width: integer = 1280;
    Height: integer = 720;
    Shader: TShader;

    VAO: TGLuint;
    VBO: TGLuint;
    fbo, texture: TGLuint;

    s: string;

    cmd: array[0..2] of pchar = ('loadfile', '/n4800/Multimedia/Videos/WNDSURF1.AVI', nil);
    mpv: Pmpv_handle;
    gl_init_params: Tmpv_opengl_init_params;
    advanced_control: integer;
    params: array[0..3] of Tmpv_render_param;
    mpv_ctx: Pmpv_render_context;
    mpv_fbo: Tmpv_opengl_fbo;

    flip_y: integer;
    params_fbo: array[0..2] of Tmpv_render_param;

    wakeup_flag: integer;
    status: LongInt;

  begin
    // === glfw

    glfwSetErrorCallback(@error_callback);

    if glfwInit = 0 then begin
      WriteLn('glfwInit Error !');
      Halt(1);
    end;

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    s := {$I %FPCTARGETOS%};

    window := glfwCreateWindow(Width, Height, pchar('GLFW-MPV   ( ' + s + ' )'), nil, nil);
    if window = nil then begin
      WriteLn('glfwCreateWindow Error !');
      Halt(1);
    end;

    glfwSetKeyCallback(window, @Key_callback);
    glfwSetCharCallback(window, @Char_callBack);
    glfwSetMouseButtonCallback(window, @Mouse_Callback);

    glfwMakeContextCurrent(window);
    glfwSwapInterval(1);

    Load_GLADE;

    // === MPV

    mpv := mpv_create;
    if mpv_initialize(mpv) < 0 then  begin
      WriteLn('mpv_initialize()   Error');
      Exit;
    end;

    gl_init_params.get_proc_address := @get_proc_address;
    gl_init_params.get_proc_address_ctx := nil;
    advanced_control := 1;

    params[0]._type := MPV_RENDER_PARAM_API_TYPE;
    params[0].data := PChar(MPV_RENDER_API_TYPE_OPENGL);
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

    mpv_command(mpv, @cmd);
    mpv_set_option_string(mpv, 'hwdec', 'auto');
    mpv_set_option_string(mpv, 'loop', 'inf');


    // === OpenGL

    // Textur

    glGenFramebuffers(1, @fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);

    glGenTextures(1, @texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, Width, Height, 0, GL_RGB, GL_UNSIGNED_BYTE, nil);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, 0);

    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) <> GL_FRAMEBUFFER_COMPLETE) then begin
      WriteLn('FBO Error');
    end;

    glBindFramebuffer(GL_FRAMEBUFFER, 0);

    // Vertex

    glClearColor(0.3, 0.3, 0.2, 1.0); // Hintergrundfarbe

    // Daten für Quadrat
    glGenVertexArrays(1, @VAO);
    glGenBuffers(1, @VBO);
    glBindVertexArray(VAO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, SizeOf(Quad), @Quad, GL_STATIC_DRAW);

    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 4 * sizeof(TGLfloat), Pointer(0));
    glEnableVertexAttribArray(1);
    glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 4 * sizeof(TGLfloat), Pointer(2 * sizeof(TGLfloat)));

    // Shader
    Shader := TShader.Create;
    Shader.LoadShaderObject(GL_VERTEX_SHADER, vertex_shader_text);
    Shader.LoadShaderObject(GL_FRAGMENT_SHADER, fragment_shader_text);
    Shader.LinkProgram;
    Shader.UseProgram;
    glUniform1i(glGetUniformLocation(Shader.ID, 'videoTexture'), 0);

    while glfwWindowShouldClose(window) = 0 do begin
      glfwPollEvents;

      // NACH glfwMakeContextCurrent(window);   ← HIER HIN!
      glfwGetFramebufferSize(window, @Width, @Height);
      WriteLn('Real Size: ', Width, 'x', Height);  // Muss 1280x720 sein!


      if wakeup_flag <> 0 then begin
        if (mpv_render_context_update(mpv_ctx) and MPV_RENDER_UPDATE_FRAME) <> 0 then begin
          WriteLn('← MPV FRAME READY!');
        WriteLn('FBO Status: ', glCheckFramebufferStatus(GL_FRAMEBUFFER));          FillChar(mpv_fbo, SizeOf(mpv_fbo),0);
          mpv_fbo.fbo := integer(fbo);
          mpv_fbo.w := Width;
          mpv_fbo.h := Height;
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
      glViewport(0, 0, Width, Height);
      glClearColor(0.3, 0.3, 0.2, 1.0); // Hintergrundfarbe

      glClear(GL_COLOR_BUFFER_BIT);

      Shader.UseProgram;
      glBindVertexArray(VAO);

      glActiveTexture(GL_TEXTURE0);
      glBindTexture(GL_TEXTURE_2D, texture);

      glDrawArrays(GL_TRIANGLES, 0, 6);

      glfwSwapBuffers(window);
    end;

    mpv_render_context_free(mpv_ctx);
    mpv_destroy(mpv);

    glDeleteVertexArrays(1, @VAO);
    glDeleteBuffers(1, @VBO);

    glfwDestroyWindow(window);
    glfwTerminate;
  end;

begin
  main;
end.
