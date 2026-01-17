program project1;

uses
  fp_ltdl;

const
  {$IFDEF Linux}
  libc = 'libc.so.6';
  libpath='/usr/lib';
  {$ENDIF}

  {$IFDEF windows}
  libc = 'msvcrt.dll';
  libpath='c:\windows\system32';
  {$ENDIF}


  function File_cp(filename: pchar; data: Pointer): longint; cdecl;
  begin
    WriteLn('Gefundenes Modul: ', filename);
    Result := 0;
  end;

  procedure FindModules;
  begin
    lt_dlforeachfile(libpath, @File_cp, nil);
  end;

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

    FindModules;
    WriteLn();

    handle := lt_dlopen(libc);
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

    my_printf('Integer: %d,  Float: %f  String: "%s"'#10, 123, single(12.45), 'Hello World');

    lt_dlclose(handle);
    lt_dlexit;
  end;

begin
  main;
end.
