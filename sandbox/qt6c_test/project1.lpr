program project1;

uses
  ctypes,
  fp_glib2,
  fp_gmodule;


var
  q_application_new: function(argc: cint; argv: PPChar): integer; varargs; cdecl;

  procedure Init;
  var
    module: PGModule;
  begin
    if not g_module_supported then begin
      g_printf('Dynamic modules are not supported on this platform'#10);
      Exit;
    end;

    module := g_module_open('/home/tux/Schreibtisch/von_Git/libqt6c/libqt6c/zig-out/lib/libqt6c.so', G_MODULE_BIND_LAZY);
    if module = nil then begin
      g_printf('Error loading library: %s'#10, g_module_error);
      Exit;
    end;

    if not g_module_symbol(module, 'q_application_new', @q_application_new) then begin
      g_printf('Error loading symbol "q_application_new": %s'#10, g_module_error);
      g_module_close(module);
      Exit;
    end;



  end;

  function main(argc: cint; argv: PPChar): cint;
  begin
    Init;

//    g_module_close(module);
  end;


begin
  main(argc, argv);
end.
