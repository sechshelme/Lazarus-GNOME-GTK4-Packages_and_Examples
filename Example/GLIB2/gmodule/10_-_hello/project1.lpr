program project1;

uses
  ctypes,
  fp_glib2,
  fp_gmodule;


var
  MyPrintf: function(f: pchar): integer; varargs; cdecl;

  function main(argc: cint; argv: PPChar): cint;
  var
    module: PGModule;
  begin
    if not g_module_supported then begin
      g_printf('Dynamic modules are not supported on this platform'#10);
      Exit(1);
    end;

    module := g_module_open('libc.so.6', G_MODULE_BIND_LAZY);
    if module = nil then begin
      g_printf('Error loading library: %s'#10, g_module_error);
      Exit(1);
    end;

    if not g_module_symbol(module, 'printf', @MyPrintf) then begin
      g_printf('Error loading symbol "printf": %s'#10, g_module_error);
      g_module_close(module);
      Exit(1);
    end;

    MyPrintf('Pchar: %s       Integer: %d'#10, 'Hello World', 123);
    g_module_close(module);
  end;


begin
  main(argc, argv);
end.
