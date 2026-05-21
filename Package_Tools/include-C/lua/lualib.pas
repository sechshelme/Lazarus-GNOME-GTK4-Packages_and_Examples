unit lualib;

interface

uses
  fp_lua;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
** $Id: lualib.h,v 1.36.1.1 2007/12/27 13:02:25 roberto Exp $
** Lua standard libraries
** See Copyright Notice in lua.h
 }
{$ifndef lualib_h}
{$define lualib_h}
{$include "lua.h"}
{ Key to file-handle type  }

const
  LUA_FILEHANDLE = 'FILE*';  
  LUA_COLIBNAME = 'coroutine';  

function luaopen_base(L:Plua_State):longint;cdecl;external liblua;
const
  LUA_TABLIBNAME = 'table';  

function luaopen_table(L:Plua_State):longint;cdecl;external liblua;
const
  LUA_IOLIBNAME = 'io';  

function luaopen_io(L:Plua_State):longint;cdecl;external liblua;
const
  LUA_OSLIBNAME = 'os';  

function luaopen_os(L:Plua_State):longint;cdecl;external liblua;
const
  LUA_STRLIBNAME = 'string';  

function luaopen_string(L:Plua_State):longint;cdecl;external liblua;
const
  LUA_MATHLIBNAME = 'math';  

function luaopen_math(L:Plua_State):longint;cdecl;external liblua;
const
  LUA_DBLIBNAME = 'debug';  

function luaopen_debug(L:Plua_State):longint;cdecl;external liblua;
const
  LUA_LOADLIBNAME = 'package';  

function luaopen_package(L:Plua_State):longint;cdecl;external liblua;
{ open all previous libraries  }
procedure luaL_openlibs(L:Plua_State);cdecl;external liblua;
{$ifndef lua_assert}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function lua_assert(x : longint) : pointer;

{$endif}
{$endif}

// === Konventiert am: 21-5-26 17:20:20 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function lua_assert(x : longint) : pointer;
begin
  lua_assert:=pointer(0);
end;


end.
