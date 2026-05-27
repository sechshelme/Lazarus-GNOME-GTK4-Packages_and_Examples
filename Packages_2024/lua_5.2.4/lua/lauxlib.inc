{$IFDEF read_interface}


const
  LUA_ERRFILE = LUA_ERRERR + 1;

type
  TluaL_Reg = record
    name: pchar;
    func: Tlua_CFunction;
  end;
  PluaL_Reg = ^TluaL_Reg;

procedure luaL_checkversion_(L: Plua_State; ver: Tlua_Number); cdecl; external liblua;

function luaL_getmetafield(L: Plua_State; obj: longint; e: pchar): longint; cdecl; external liblua;
function luaL_callmeta(L: Plua_State; obj: longint; e: pchar): longint; cdecl; external liblua;
function luaL_tolstring(L: Plua_State; idx: longint; len: Psize_t): pchar; cdecl; external liblua;
function luaL_argerror(L: Plua_State; numarg: longint; extramsg: pchar): longint; cdecl; external liblua;
function luaL_checklstring(L: Plua_State; numArg: longint; l_: Psize_t): pchar; cdecl; external liblua;
function luaL_optlstring(L: Plua_State; numArg: longint; def: pchar; l_: Psize_t): pchar; cdecl; external liblua;
function luaL_checknumber(L: Plua_State; numArg: longint): Tlua_Number; cdecl; external liblua;
function luaL_optnumber(L: Plua_State; nArg: longint; def: Tlua_Number): Tlua_Number; cdecl; external liblua;
function luaL_checkinteger(L: Plua_State; numArg: longint): Tlua_Integer; cdecl; external liblua;
function luaL_optinteger(L: Plua_State; nArg: longint; def: Tlua_Integer): Tlua_Integer; cdecl; external liblua;
function luaL_checkunsigned(L: Plua_State; numArg: longint): Tlua_Unsigned; cdecl; external liblua;
function luaL_optunsigned(L: Plua_State; numArg: longint; def: Tlua_Unsigned): Tlua_Unsigned; cdecl; external liblua;
procedure luaL_checkstack(L: Plua_State; sz: longint; msg: pchar); cdecl; external liblua;
procedure luaL_checktype(L: Plua_State; narg: longint; t: longint); cdecl; external liblua;
procedure luaL_checkany(L: Plua_State; narg: longint); cdecl; external liblua;
function luaL_newmetatable(L: Plua_State; tname: pchar): longint; cdecl; external liblua;
procedure luaL_setmetatable(L: Plua_State; tname: pchar); cdecl; external liblua;
function luaL_testudata(L: Plua_State; ud: longint; tname: pchar): pointer; cdecl; external liblua;
function luaL_checkudata(L: Plua_State; ud: longint; tname: pchar): pointer; cdecl; external liblua;
procedure luaL_where(L: Plua_State; lvl: longint); cdecl; external liblua;
function luaL_error(L: Plua_State; fmt: pchar; args: array of const): longint; cdecl; external liblua;
function luaL_error(L: Plua_State; fmt: pchar): longint; cdecl; external liblua;
function luaL_checkoption(L: Plua_State; narg: longint; def: pchar; lst: PPchar): longint; cdecl; external liblua;
function luaL_fileresult(L: Plua_State; stat: longint; fname: pchar): longint; cdecl; external liblua;
function luaL_execresult(L: Plua_State; stat: longint): longint; cdecl; external liblua;

const
  LUA_NOREF = -(2);
  LUA_REFNIL = -(1);

function luaL_ref(L: Plua_State; t: longint): longint; cdecl; external liblua;
procedure luaL_unref(L: Plua_State; t: longint; ref: longint); cdecl; external liblua;
function luaL_loadfilex(L: Plua_State; filename: pchar; mode: pchar): longint; cdecl; external liblua;
function luaL_loadbufferx(L: Plua_State; buff: pchar; sz: Tsize_t; name: pchar; mode: pchar): longint; cdecl; external liblua;
function luaL_loadstring(L: Plua_State; s: pchar): longint; cdecl; external liblua;
function luaL_newstate: Plua_State; cdecl; external liblua;
function luaL_len(L: Plua_State; idx: longint): longint; cdecl; external liblua;
function luaL_gsub(L: Plua_State; s: pchar; p: pchar; r: pchar): pchar; cdecl; external liblua;
procedure luaL_setfuncs(L: Plua_State; l_: PluaL_Reg; nup: longint); cdecl; external liblua;
function luaL_getsubtable(L: Plua_State; idx: longint; fname: pchar): longint; cdecl; external liblua;
procedure luaL_traceback(L: Plua_State; L1: Plua_State; msg: pchar; level: longint); cdecl; external liblua;
procedure luaL_requiref(L: Plua_State; modname: pchar; openf: Tlua_CFunction; glb: longint); cdecl; external liblua;

type
  TluaL_Buffer = record
    b: pchar;
    size: Tsize_t;
    n: Tsize_t;
    L: Plua_State;
    initb: array[0..(LUAL_BUFFERSIZE) - 1] of char;
  end;
  PluaL_Buffer = ^TluaL_Buffer;

procedure luaL_buffinit(L: Plua_State; B: PluaL_Buffer); cdecl; external liblua;
function luaL_prepbuffsize(B: PluaL_Buffer; sz: Tsize_t): pchar; cdecl; external liblua;
procedure luaL_addlstring(B: PluaL_Buffer; s: pchar; l: Tsize_t); cdecl; external liblua;
procedure luaL_addstring(B: PluaL_Buffer; s: pchar); cdecl; external liblua;
procedure luaL_addvalue(B: PluaL_Buffer); cdecl; external liblua;
procedure luaL_pushresult(B: PluaL_Buffer); cdecl; external liblua;
procedure luaL_pushresultsize(B: PluaL_Buffer; sz: Tsize_t); cdecl; external liblua;
function luaL_buffinitsize(L: Plua_State; B: PluaL_Buffer; sz: Tsize_t): pchar; cdecl; external liblua;

const
  LUA_FILEHANDLE = 'FILE*';

type
  TluaL_Stream = record
    f: PFILE;
    closef: Tlua_CFunction;
  end;
  PluaL_Stream = ^TluaL_Stream;

procedure luaL_pushmodule(L: Plua_State; modname: pchar; sizehint: longint); cdecl; external liblua;
procedure luaL_openlib(L: Plua_State; libname: pchar; l_: PluaL_Reg; nup: longint); cdecl; external liblua;

// === Konventiert am: 27-5-26 19:26:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
