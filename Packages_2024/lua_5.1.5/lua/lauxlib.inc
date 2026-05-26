{$IFDEF read_interface}

function luaL_getn(L: Plua_State; t: longint): longint; cdecl; external liblua;
procedure luaL_setn(L: Plua_State; t: longint; n: longint); cdecl; external liblua;

const
  LUA_ERRFILE = LUA_ERRERR + 1;

type
  TluaL_Reg = record
    name: pchar;
    func: Tlua_CFunction;
  end;
  PluaL_Reg = ^TluaL_Reg;

procedure luaI_openlib(L: Plua_State; libname: pchar; l_: PluaL_Reg; nup: longint); cdecl; external liblua;
procedure luaL_register(L: Plua_State; libname: pchar; l_: PluaL_Reg); cdecl; external liblua;
function luaL_getmetafield(L: Plua_State; obj: longint; e: pchar): longint; cdecl; external liblua;
function luaL_callmeta(L: Plua_State; obj: longint; e: pchar): longint; cdecl; external liblua;
function luaL_typerror(L: Plua_State; narg: longint; tname: pchar): longint; cdecl; external liblua;
function luaL_argerror(L: Plua_State; numarg: longint; extramsg: pchar): longint; cdecl; external liblua;
function luaL_checklstring(L: Plua_State; numArg: longint; l_: Psize_t): pchar; cdecl; external liblua;
function luaL_optlstring(L: Plua_State; numArg: longint; def: pchar; l_: Psize_t): pchar; cdecl; external liblua;
function luaL_checknumber(L: Plua_State; numArg: longint): Tlua_Number; cdecl; external liblua;
function luaL_optnumber(L: Plua_State; nArg: longint; def: Tlua_Number): Tlua_Number; cdecl; external liblua;
function luaL_checkinteger(L: Plua_State; numArg: longint): Tlua_Integer; cdecl; external liblua;
function luaL_optinteger(L: Plua_State; nArg: longint; def: Tlua_Integer): Tlua_Integer; cdecl; external liblua;
procedure luaL_checkstack(L: Plua_State; sz: longint; msg: pchar); cdecl; external liblua;
procedure luaL_checktype(L: Plua_State; narg: longint; t: longint); cdecl; external liblua;
procedure luaL_checkany(L: Plua_State; narg: longint); cdecl; external liblua;
function luaL_newmetatable(L: Plua_State; tname: pchar): longint; cdecl; external liblua;
function luaL_checkudata(L: Plua_State; ud: longint; tname: pchar): pointer; cdecl; external liblua;
procedure luaL_where(L: Plua_State; lvl: longint); cdecl; external liblua;
function luaL_error(L: Plua_State; fmt: pchar; args: array of const): longint; cdecl; external liblua;
function luaL_error(L: Plua_State; fmt: pchar): longint; cdecl; external liblua;
function luaL_checkoption(L: Plua_State; narg: longint; def: pchar; lst: PPchar): longint; cdecl; external liblua;
function luaL_ref(L: Plua_State; t: longint): longint; cdecl; external liblua;
procedure luaL_unref(L: Plua_State; t: longint; ref: longint); cdecl; external liblua;
function luaL_loadfile(L: Plua_State; filename: pchar): longint; cdecl; external liblua;
function luaL_loadbuffer(L: Plua_State; buff: pchar; sz: Tsize_t; name: pchar): longint; cdecl; external liblua;
function luaL_loadstring(L: Plua_State; s: pchar): longint; cdecl; external liblua;
function luaL_newstate: Plua_State; cdecl; external liblua;
function luaL_gsub(L: Plua_State; s: pchar; p: pchar; r: pchar): pchar; cdecl; external liblua;
function luaL_findtable(L: Plua_State; idx: longint; fname: pchar; szhint: longint): pchar; cdecl; external liblua;

type
  TluaL_Buffer = record
    p: pchar;
    lvl: longint;
    L: Plua_State;
    buffer: array[0..(LUAL_BUFFERSIZE) - 1] of char;
  end;
  PluaL_Buffer = ^TluaL_Buffer;

procedure luaL_buffinit(L: Plua_State; B: PluaL_Buffer); cdecl; external liblua;
function luaL_prepbuffer(B: PluaL_Buffer): pchar; cdecl; external liblua;
procedure luaL_addlstring(B: PluaL_Buffer; s: pchar; l: Tsize_t); cdecl; external liblua;
procedure luaL_addstring(B: PluaL_Buffer; s: pchar); cdecl; external liblua;
procedure luaL_addvalue(B: PluaL_Buffer); cdecl; external liblua;
procedure luaL_pushresult(B: PluaL_Buffer); cdecl; external liblua;

// === Konventiert am: 21-5-26 17:20:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
