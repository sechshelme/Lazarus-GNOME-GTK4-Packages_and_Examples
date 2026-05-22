program project1;


uses
  luaconf,
  lauxlib,
  lua,
  lualib,

  fp_lua;

  procedure main;
  var
    L: Plua_State;
    lua_script: pchar;
  begin
    L := luaL_newstate();
    luaL_openlibs(L);

    lua_script := 'print(''Hallo von Lua! Das Ergebnis von 5 + 10 ist: '' .. (5 + 10))';

    if luaL_loadstring(L, lua_script) = 0 then begin
      WriteLn('io');
      if lua_pcall(L, 0, 0, 0) <> 0 then begin
        WriteLn('Fehler beim Ausführen: ', lua_tolstring(L, -1, nil));
      end;
    end;
    lua_close(L);
  end;

begin
  main;
end.
