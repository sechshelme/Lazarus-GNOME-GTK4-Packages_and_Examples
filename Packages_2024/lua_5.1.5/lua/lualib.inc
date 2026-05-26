{$IFDEF read_interface}


const
  LUA_FILEHANDLE = 'FILE*';
  LUA_COLIBNAME = 'coroutine';

function luaopen_base(L: Plua_State): longint; cdecl; external liblua;

const
  LUA_TABLIBNAME = 'table';

function luaopen_table(L: Plua_State): longint; cdecl; external liblua;

const
  LUA_IOLIBNAME = 'io';

function luaopen_io(L: Plua_State): longint; cdecl; external liblua;

const
  LUA_OSLIBNAME = 'os';

function luaopen_os(L: Plua_State): longint; cdecl; external liblua;

const
  LUA_STRLIBNAME = 'string';

function luaopen_string(L: Plua_State): longint; cdecl; external liblua;

const
  LUA_MATHLIBNAME = 'math';

function luaopen_math(L: Plua_State): longint; cdecl; external liblua;

const
  LUA_DBLIBNAME = 'debug';

function luaopen_debug(L: Plua_State): longint; cdecl; external liblua;

const
  LUA_LOADLIBNAME = 'package';

function luaopen_package(L: Plua_State): longint; cdecl; external liblua;
procedure luaL_openlibs(L: Plua_State); cdecl; external liblua;

// === Konventiert am: 21-5-26 17:20:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
