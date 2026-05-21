program project1;


uses
  luaconf,
  lauxlib,
  lua,
  lualib,

  fp_lua;

procedure main;
begin

  #include <stdio.h>
  #include <lua.h>
  #include <lualib.h>
  #include <lauxlib.h>

  int main(void) {
      // 1. Einen neuen Lua-Zustand (State) erstellen
      lua_State *L = luaL_newstate();

      // 2. Standard-Lua-Bibliotheken laden (math, table, string, etc.)
      luaL_openlibs(L);

      // 3. Einen einfachen Lua-String ausführen
      const char *lua_script = "print('Hallo von Lua! Das Ergebnis von 5 + 10 ist: ' .. (5 + 10))";

      if (luaL_dostring(L, lua_script) != LUA_OK) {
          // Fehlerbehandlung, falls das Skript fehlschlägt
          fprintf(stderr, "Fehler: %s\n", lua_tostring(L, -1));
      }

      // 4. Lua-Zustand schließen und Ressourcen freigeben
      lua_close(L);

      return 0;
  }

end;

begin
  main;

end.

