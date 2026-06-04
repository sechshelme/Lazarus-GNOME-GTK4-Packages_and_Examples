program project1;

uses
  vulkan_core,
//  fp_glew,
  fp_glfw3, fp_vulkan;
//  fp_GL_Tools;

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

  procedure main;
  var
    window: PGLFWwindow;
    Width, Height: longint;
    s: String;

  begin
    glfwSetErrorCallback(@error_callback);

    if glfwInit = 0 then begin
      WriteLn('glfwInit Error !');
      Halt(1);
    end;

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);

    s := {$I %FPCTARGETOS%};

    window := glfwCreateWindow(640, 480, pchar('GLFW-Demo   ( ' + s + ' )'), nil, nil);
    if window = nil then begin
      WriteLn('glfwCreateWindow Error !');
      Halt(1);
    end;

    glfwSetKeyCallback(window, @Key_callback);
    glfwMakeContextCurrent(window);
    glfwSwapInterval(1);


    while glfwWindowShouldClose(window) = 0 do begin
      glfwGetFramebufferSize(window, @Width, @Height);

      glfwSwapBuffers(window);
      glfwPollEvents;
    end;

    glfwDestroyWindow(window);
    glfwTerminate;
  end;

begin
  main;
end.
