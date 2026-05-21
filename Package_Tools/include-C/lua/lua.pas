unit lua;

interface

uses
  fp_lua;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  LUA_VERSION = 'Lua 5.1';  
  LUA_RELEASE = 'Lua 5.1.5';  
  LUA_VERSION_NUM = 501;  
  LUA_COPYRIGHT = 'Copyright (C) 1994-2012 Lua.org, PUC-Rio';  
  LUA_AUTHORS = 'R. Ierusalimschy, L. H. de Figueiredo & W. Celes';  
  LUA_SIGNATURE = '\033Lua';
  LUA_MULTRET = -(1);

  LUA_REGISTRYINDEX = -(10000);
  LUA_ENVIRONINDEX = -(10001);  
  LUA_GLOBALSINDEX = -(10002);  

function lua_upvalueindex(i : longint) : longint;

const
  LUA_YIELD = 1;  
  LUA_ERRRUN = 2;  
  LUA_ERRSYNTAX = 3;  
  LUA_ERRMEM = 4;  
  LUA_ERRERR = 5;  
type
  Plua_State=type Pointer;

  Tlua_CFunction = function (L:Plua_State):longint;cdecl;
  Tlua_Reader = function (L:Plua_State; ud:pointer; sz:Psize_t):Pchar;cdecl;
  Tlua_Writer = function (L:Plua_State; p:pointer; sz:Tsize_t; ud:pointer):longint;cdecl;
  Tlua_Alloc = function (ud:pointer; ptr:pointer; osize:Tsize_t; nsize:Tsize_t):pointer;cdecl;

const
  LUA_TNONE = -(1);  
  LUA_TNIL = 0;  
  LUA_TBOOLEAN = 1;  
  LUA_TLIGHTUSERDATA = 2;  
  LUA_TNUMBER = 3;  
  LUA_TSTRING = 4;  
  LUA_TTABLE = 5;  
  LUA_TFUNCTION = 6;  
  LUA_TUSERDATA = 7;  
  LUA_TTHREAD = 8;  
  LUA_MINSTACK = 20;
type
  Plua_Number = ^Tlua_Number;
  Tlua_Number = TLUA_NUMBER;

  Plua_Integer = ^Tlua_Integer;
  Tlua_Integer = TLUA_INTEGER;

function lua_newstate(f:Tlua_Alloc; ud:pointer):Plua_State;cdecl;external liblua;
procedure lua_close(L:Plua_State);cdecl;external liblua;
function lua_newthread(L:Plua_State):Plua_State;cdecl;external liblua;
function lua_atpanic(L:Plua_State; panicf:Tlua_CFunction):Tlua_CFunction;cdecl;external liblua;

function lua_gettop(L:Plua_State):longint;cdecl;external liblua;
procedure lua_settop(L:Plua_State; idx:longint);cdecl;external liblua;
procedure lua_pushvalue(L:Plua_State; idx:longint);cdecl;external liblua;
procedure lua_remove(L:Plua_State; idx:longint);cdecl;external liblua;
procedure lua_insert(L:Plua_State; idx:longint);cdecl;external liblua;
procedure lua_replace(L:Plua_State; idx:longint);cdecl;external liblua;
function lua_checkstack(L:Plua_State; sz:longint):longint;cdecl;external liblua;
procedure lua_xmove(from:Plua_State; to:Plua_State; n:longint);cdecl;external liblua;

function lua_isnumber(L:Plua_State; idx:longint):longint;cdecl;external liblua;
function lua_isstring(L:Plua_State; idx:longint):longint;cdecl;external liblua;
function lua_iscfunction(L:Plua_State; idx:longint):longint;cdecl;external liblua;
function lua_isuserdata(L:Plua_State; idx:longint):longint;cdecl;external liblua;
function lua_type(L:Plua_State; idx:longint):longint;cdecl;external liblua;
function lua_typename(L:Plua_State; tp:longint):Pchar;cdecl;external liblua;
function lua_equal(L:Plua_State; idx1:longint; idx2:longint):longint;cdecl;external liblua;
function lua_rawequal(L:Plua_State; idx1:longint; idx2:longint):longint;cdecl;external liblua;
function lua_lessthan(L:Plua_State; idx1:longint; idx2:longint):longint;cdecl;external liblua;
function lua_tonumber(L:Plua_State; idx:longint):Tlua_Number;cdecl;external liblua;
function lua_tointeger(L:Plua_State; idx:longint):Tlua_Integer;cdecl;external liblua;
function lua_toboolean(L:Plua_State; idx:longint):longint;cdecl;external liblua;
function lua_tolstring(L:Plua_State; idx:longint; len:Psize_t):Pchar;cdecl;external liblua;
function lua_objlen(L:Plua_State; idx:longint):Tsize_t;cdecl;external liblua;
function lua_tocfunction(L:Plua_State; idx:longint):Tlua_CFunction;cdecl;external liblua;
function lua_touserdata(L:Plua_State; idx:longint):pointer;cdecl;external liblua;
function lua_tothread(L:Plua_State; idx:longint):Plua_State;cdecl;external liblua;
function lua_topointer(L:Plua_State; idx:longint):pointer;cdecl;external liblua;

procedure lua_pushnil(L:Plua_State);cdecl;external liblua;
procedure lua_pushnumber(L:Plua_State; n:Tlua_Number);cdecl;external liblua;
procedure lua_pushinteger(L:Plua_State; n:Tlua_Integer);cdecl;external liblua;
procedure lua_pushlstring(L:Plua_State; s:Pchar; l:Tsize_t);cdecl;external liblua;
procedure lua_pushstring(L:Plua_State; s:Pchar);cdecl;external liblua;
function lua_pushvfstring(L:Plua_State; fmt:Pchar; argp:Tva_list):Pchar;cdecl;external liblua;
function lua_pushfstring(L:Plua_State; fmt:Pchar; args:array of const):Pchar;cdecl;external liblua;
function lua_pushfstring(L:Plua_State; fmt:Pchar):Pchar;cdecl;external liblua;
procedure lua_pushcclosure(L:Plua_State; fn:Tlua_CFunction; n:longint);cdecl;external liblua;
procedure lua_pushboolean(L:Plua_State; b:longint);cdecl;external liblua;
procedure lua_pushlightuserdata(L:Plua_State; p:pointer);cdecl;external liblua;
function lua_pushthread(L:Plua_State):longint;cdecl;external liblua;

procedure lua_gettable(L:Plua_State; idx:longint);cdecl;external liblua;
procedure lua_getfield(L:Plua_State; idx:longint; k:Pchar);cdecl;external liblua;
procedure lua_rawget(L:Plua_State; idx:longint);cdecl;external liblua;
procedure lua_rawgeti(L:Plua_State; idx:longint; n:longint);cdecl;external liblua;
procedure lua_createtable(L:Plua_State; narr:longint; nrec:longint);cdecl;external liblua;
function lua_newuserdata(L:Plua_State; sz:Tsize_t):pointer;cdecl;external liblua;
function lua_getmetatable(L:Plua_State; objindex:longint):longint;cdecl;external liblua;
procedure lua_getfenv(L:Plua_State; idx:longint);cdecl;external liblua;

procedure lua_settable(L:Plua_State; idx:longint);cdecl;external liblua;
procedure lua_setfield(L:Plua_State; idx:longint; k:Pchar);cdecl;external liblua;
procedure lua_rawset(L:Plua_State; idx:longint);cdecl;external liblua;
procedure lua_rawseti(L:Plua_State; idx:longint; n:longint);cdecl;external liblua;
function lua_setmetatable(L:Plua_State; objindex:longint):longint;cdecl;external liblua;
function lua_setfenv(L:Plua_State; idx:longint):longint;cdecl;external liblua;

procedure lua_call(L:Plua_State; nargs:longint; nresults:longint);cdecl;external liblua;
function lua_pcall(L:Plua_State; nargs:longint; nresults:longint; errfunc:longint):longint;cdecl;external liblua;
function lua_cpcall(L:Plua_State; func:Tlua_CFunction; ud:pointer):longint;cdecl;external liblua;
function lua_load(L:Plua_State; reader:Tlua_Reader; dt:pointer; chunkname:Pchar):longint;cdecl;external liblua;
function lua_dump(L:Plua_State; writer:Tlua_Writer; data:pointer):longint;cdecl;external liblua;

function lua_yield(L:Plua_State; nresults:longint):longint;cdecl;external liblua;
function lua_resume(L:Plua_State; narg:longint):longint;cdecl;external liblua;
function lua_status(L:Plua_State):longint;cdecl;external liblua;
const
  LUA_GCSTOP = 0;  
  LUA_GCRESTART = 1;  
  LUA_GCCOLLECT = 2;  
  LUA_GCCOUNT = 3;  
  LUA_GCCOUNTB = 4;  
  LUA_GCSTEP = 5;  
  LUA_GCSETPAUSE = 6;  
  LUA_GCSETSTEPMUL = 7;  

function lua_gc(L:Plua_State; what:longint; data:longint):longint;cdecl;external liblua;

function lua_error(L:Plua_State):longint;cdecl;external liblua;
function lua_next(L:Plua_State; idx:longint):longint;cdecl;external liblua;
procedure lua_concat(L:Plua_State; n:longint);cdecl;external liblua;
function lua_getallocf(L:Plua_State; ud:Ppointer):Tlua_Alloc;cdecl;external liblua;
procedure lua_setallocf(L:Plua_State; f:Tlua_Alloc; ud:pointer);cdecl;external liblua;
type
  Tlua_Chunkreader = Tlua_Reader;
  Tlua_Chunkwriter = Tlua_Writer;  

procedure lua_setlevel(from:Plua_State; to_:Plua_State);cdecl;external liblua;
const
  LUA_HOOKCALL = 0;  
  LUA_HOOKRET = 1;  
  LUA_HOOKLINE = 2;  
  LUA_HOOKCOUNT = 3;  
  LUA_HOOKTAILRET = 4;  

  LUA_MASKCALL = 1 shl LUA_HOOKCALL;
  LUA_MASKRET = 1 shl LUA_HOOKRET;  
  LUA_MASKLINE = 1 shl LUA_HOOKLINE;  
  LUA_MASKCOUNT = 1 shl LUA_HOOKCOUNT;  
type
  Tlua_Hook = procedure (L:Plua_State; ar:Plua_Debug);cdecl;

function lua_getstack(L:Plua_State; level:longint; ar:Plua_Debug):longint;cdecl;external liblua;
function lua_getinfo(L:Plua_State; what:Pchar; ar:Plua_Debug):longint;cdecl;external liblua;
function lua_getlocal(L:Plua_State; ar:Plua_Debug; n:longint):Pchar;cdecl;external liblua;
function lua_setlocal(L:Plua_State; ar:Plua_Debug; n:longint):Pchar;cdecl;external liblua;
function lua_getupvalue(L:Plua_State; funcindex:longint; n:longint):Pchar;cdecl;external liblua;
function lua_setupvalue(L:Plua_State; funcindex:longint; n:longint):Pchar;cdecl;external liblua;
function lua_sethook(L:Plua_State; func:Tlua_Hook; mask:longint; count:longint):longint;cdecl;external liblua;
function lua_gethook(L:Plua_State):Tlua_Hook;cdecl;external liblua;
function lua_gethookmask(L:Plua_State):longint;cdecl;external liblua;
function lua_gethookcount(L:Plua_State):longint;cdecl;external liblua;
type
  Tlua_Debug = record
      event : longint;cdecl;
      name : Pchar;
      namewhat : Pchar;
      what : Pchar;
      source : Pchar;
      currentline : longint;
      nups : longint;
      linedefined : longint;
      lastlinedefined : longint;
      short_src : array[0..(LUA_IDSIZE)-1] of char;
      i_ci : longint;
    end;
  Plua_Debug = ^Tlua_Debug;


// === Konventiert am: 21-5-26 17:20:10 ===


implementation


end.
