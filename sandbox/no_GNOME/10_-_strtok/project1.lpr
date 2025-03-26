program project1;

uses
  ctypes;

  function strtok(s: pchar; delim: pchar): pchar; cdecl; external 'c';
  function strtok_r(s: pchar; delim: pchar; save_ptr: PPChar): pchar; cdecl; external 'c';
  function printf(format: pchar): integer; cdecl; varargs; external 'c';
  function strdup(s: pchar): pchar; cdecl; external 'c';
  procedure Free(ptr: Pointer); cdecl; external 'c';

const
  key: pchar = 'blabla/blublu/abc/def/xyz';

  procedure tok_without_r;
  var
    token: pchar;
    k: pansichar;
  begin
    k := strdup(key);
    token := strtok(k, '/');

    while token <> nil do begin
      printf('%s'#10, token);
      token := strtok(nil, '/');
    end;

    Free(k);
  end;

  procedure tok_with_r;
  var
    token, save_ptr: pchar;
    k: pansichar;
  begin
    k := strdup(key);
    token := strtok_r(k, '/', @save_ptr);

    while token <> nil do begin
      printf('%s'#10, token);
      token := strtok_r(nil, '/', @save_ptr);
    end;

    Free(k);
  end;

  function main(argc: cint; argv: PPChar): cint;
  begin
    tok_without_r;
    printf('------------'#10);
    tok_with_r;
    Result := 0;
  end;


begin
  main(argc, argv);
end.
