program project1;

uses
  fp_glib2,
  fp_gmodule;

var
  AusgabeStr: procedure(s: pchar); cdecl;
  AusgabeInt: procedure(i: Integer); cdecl;

procedure main;
  var
    module: PGModule;
  begin
    if not g_module_supported then begin
      g_printf('Dynamic modules are not supported on this platform'#10);
      Exit;
    end;

    module := g_module_open('../library/libmylib.so', G_MODULE_BIND_LAZY);
    if module = nil then begin
      g_printf('Error loading library: %s'#10, g_module_error);
      Exit;
    end;

    if not g_module_symbol(module, 'AusgabeStr', @AusgabeStr) then begin
      g_printf('Error loading symbol "AusgabeStr": %s'#10, g_module_error);
      g_module_close(module);
      Exit;
    end;

    if not g_module_symbol(module, 'AusgabeInt', @AusgabeInt) then begin
      g_printf('Error loading symbol "AusgabeInt": %s'#10, g_module_error);
      g_module_close(module);
      Exit;
    end;

    AusgabeStr('Hello World');
    AusgabeInt(1234);

    g_module_close(module);
  end;


begin
  main;
end.
