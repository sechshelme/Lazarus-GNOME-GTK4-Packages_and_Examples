program project1;

uses
  fp_glfw3,
  fp_glew,
  draw_gl;

  procedure error_callback(error_code: longint; description: pchar); cdecl;
  begin
    WriteLn('ErrorCallback: (', error_code, ')  ', description);
  end;

  procedure Key_callback(window: PGLFWwindow; key: longint; scancode: longint; action: longint; mods: longint); cdecl;
  type
    Thq = (hq_Qc, hq_d_QT);
  const
    hq: Thq = hq_Qc;

    PointsCount: integer = 200;


  begin
    WriteLn('press Key');
    if action = GLFW_PRESS then begin
      case key of
        GLFW_KEY_ESCAPE: begin
          glfwSetWindowShouldClose(window, GLFW_TRUE);
        end;
        GLFW_KEY_F: begin
          glEnable(GL_CULL_FACE);
          glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
        end;
        GLFW_KEY_L: begin
          glDisable(GL_CULL_FACE);
          glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
        end;
        GLFW_KEY_P: begin
          glDisable(GL_CULL_FACE);
          glPolygonMode(GL_FRONT_AND_BACK, GL_POINT);
        end;
        GLFW_KEY_2: begin
          is3D:=False;
          case hq of
            hq_Qc: begin
              InitScene_Qc;
            end;
            hq_d_QT: begin
              InitScene_d_QT;
            end;
          end;
        end;
        GLFW_KEY_3: begin
          is3D:=True;
          case hq of
            hq_Qc: begin
              InitScene_Qc;
            end;
            hq_d_QT: begin
              InitScene_d_QT;
            end;
          end;
        end;
        GLFW_KEY_C: begin
          hq := hq_Qc;
          InitScene_Qc;
        end;
        GLFW_KEY_D: begin
          hq := hq_d_QT;
          InitScene_d_QT;
        end;
        GLFW_KEY_SPACE: begin
          InitPoints(PointsCount);
          case hq of
            hq_Qc: begin
              InitScene_Qc;
            end;
            hq_d_QT: begin
              InitScene_d_QT;
            end;
          end;
        end;
      end;
    end;
  end;

  procedure Char_callBack(window: PGLFWwindow; codepoint: dword); cdecl;
  begin
    WriteLn('press Char');
  end;

  procedure Mouse_Callback(window: PGLFWwindow; button: longint; action: longint; mods: longint); cdecl;
  begin
    WriteLn('click    button: ', button, '  action: ', action, '  mods: ', mods);
  end;

  procedure main;
  var
    window: PGLFWwindow;
    Width, Height: longint;
    s: string;

  begin
    glfwSetErrorCallback(@error_callback);

    if glfwInit = 0 then begin
      WriteLn('glfwInit Error !');
      Halt(1);
    end;

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 1);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);

    s := {$I %FPCTARGETOS%};

    window := glfwCreateWindow(600, 600, pchar('GLFW-Demo   ( ' + s + ' )'), nil, nil);
    if window = nil then begin
      WriteLn('glfwCreateWindow Error !');
      Halt(1);
    end;

    glfwSetKeyCallback(window, @Key_callback);
    glfwSetCharCallback(window, @Char_callBack);
    glfwSetMouseButtonCallback(window, @Mouse_Callback);
    glfwMakeContextCurrent(window);
    glfwSwapInterval(1);

    if glewInit <> GLEW_OK then begin
      WriteLn('glewInit Fehler');
      Halt(1);
    end;

    InitPoints(10);
    InitScene_Qc;

    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);

    while glfwWindowShouldClose(window) = 0 do begin
      glfwGetFramebufferSize(window, @Width, @Height);

      glViewport(0, 0, Width, Height);
      draw;

      glfwSwapBuffers(window);
      glfwPollEvents;
    end;

    CloseScene;

    glfwDestroyWindow(window);
    glfwTerminate;
  end;

begin
  main;
end.
