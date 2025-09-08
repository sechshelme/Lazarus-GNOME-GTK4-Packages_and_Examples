program project1;

uses
  fp_ltdl;

var
  my_printf: function(f: pchar): double; varargs; cdecl;

  procedure main;
  var
    handle: Tlt_dlhandle;
    err: pchar;
  begin
    if lt_dlinit <> 0 then begin
      WriteLn('Fehler bei lt_dlinit: ', lt_dlerror);
      Exit;
    end;

    handle := lt_dlopen('libc.so.6');
    if handle = nil then begin
      WriteLn('Fehler beim Laden der Bibliothek: ', lt_dlerror);
      lt_dlexit;
      Exit;
    end;

    Pointer(my_printf) := lt_dlsym(handle, 'printf');
    err := lt_dlerror;
    if err <> nil then  begin
      WriteLn('Fehler beim Finden der Funktion printf: ', err);
      lt_dlclose(handle);
      lt_dlexit;
      Exit;
    end;

    my_printf('Double: %f,  Integer: %d'#10, 12.45, 123);

    lt_dlclose(handle);
    lt_dlexit;
  end;

begin
  main;
end.
