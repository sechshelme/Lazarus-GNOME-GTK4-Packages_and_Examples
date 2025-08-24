program project1;

uses
  fp_stdio,
  fp_stdlib,
  fp_string;


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

    free(k);
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

    free(k);
  end;

  function main(argc: Integer; argv: PPChar): Integer;
  begin
    tok_without_r;
    printf('------------'#10);
    tok_with_r;
    Result := 0;
  end;


begin
  main(argc, argv);
end.
