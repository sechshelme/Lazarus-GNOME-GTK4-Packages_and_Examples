unit luaconf;

interface

uses
  fp_lua;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  LUA_PATH = 'LUA_PATH';  
  LUA_CPATH = 'LUA_CPATH';  
  LUA_INIT = 'LUA_INIT';

{$ifdef windows}
  LUA_DIRSEP = '\\';
{$else}
  LUA_DIRSEP = '/';
{$endif}

  LUA_PATHSEP = ';';
  LUA_PATH_MARK = '?';  
  LUA_EXECDIR = '!';  
  LUA_IGMARK = '-';
type
  LUA_INTEGER = Tptrdiff_t;
const
  LUA_IDSIZE = 60;

  LUA_PROMPT = '> ';
  LUA_PROMPT2 = '>> ';  
  LUA_PROGNAME = 'lua';
  LUA_MAXINPUT = 512;
  LUAI_GCPAUSE = 200;
  LUAI_GCMUL = 200;
  LUA_COMPAT_LSTR = 1;

const
  LUAI_BITSINT = 32;  
type
  LUAI_UINT32 = UInt32;  
  LUAI_INT32 = Int32;
  LUAI_MAXINT32 = INT_MAX;  
  LUAI_UMEM = Tsize_t;  
  LUAI_MEM = Tptrdiff_t;  

const
  LUAI_MAXCALLS = 20000;  
  LUAI_MAXCSTACK = 8000;
  LUAI_MAXCCALLS = 200;
  LUAI_MAXVARS = 200;
  LUAI_MAXUPVALUES = 60;
  LUAL_BUFFERSIZE = BUFSIZ;
type  LUA_NUMBER = double;
  LUAI_UACNUMBER = double;
const  LUA_NUMBER_SCAN = '%lf';
  LUA_NUMBER_FMT = '%.14g';  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function lua_number2str(s,n : longint) : longint;

{ 16 digits, sign, point, and \0  }
const
  LUAI_MAXNUMBER2STR = 32;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function lua_str2number(s,p : longint) : longint;

{
@@ The luai_num* macros define the primitive operations over numbers.
 }
{$if defined(LUA_CORE)}
{$include <math.h>}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function luai_numadd(a,b : longint) : Ta;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_numsub(a,b : longint) : Ta;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_nummul(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numdiv(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_nummod(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numpow(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numunm(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numeq(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numlt(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numle(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numisnan(a : longint) : longint;

{$endif}
{
@@ lua_number2int is a macro to convert lua_Number to int.
@@ lua_number2integer is a macro to convert lua_Number to lua_Integer.
** CHANGE them if you know a faster way to convert a lua_Number to
** int (with any rounding method and without throwing errors) in your
** system. In Pentium machines, a naive typecast from double to int
** in C is extremely slow, so any alternative is worth trying.
 }
{ the next trick should work on any Pentium, but sometimes clashes
   with a DirectX idiosyncrasy  }
{$else}
type
  Pluai_Cast = ^Tluai_Cast;
  Tluai_Cast = record
      case longint of
        0 : ( l_d : Tdouble );
        1 : ( l_l : longint );
      end;

{ ==================================================================  }
{
@@ LUAI_USER_ALIGNMENT_T is a type that requires maximum alignment.
** CHANGE it if your system requires alignments larger than double. (For
** instance, if your system supports long doubles and they must be
** aligned in 16-byte boundaries, then you should add long double in the
** union.) Probably you do not need to change this.
 }
{
@@ LUAI_THROW/LUAI_TRY define how Lua does exception handling.
** CHANGE them if you prefer to use longjmp/setjmp even with C++
** or if want/don't to use _longjmp/_setjmp instead of regular
** longjmp/setjmp. By default, Lua handles errors with exceptions when
** compiling as C++ code, with _longjmp/_setjmp when asked to use them,
** and with longjmp/setjmp otherwise.
 }
{
@@ LUA_MAXCAPTURES is the maximum number of captures that a pattern
@* can do during pattern-matching.
** CHANGE it if you need more captures. This limit is arbitrary.
 }

const
  LUA_MAXCAPTURES = 32;  
{
@@ lua_tmpnam is the function that the OS library uses to create a
@* temporary name.
@@ LUA_TMPNAMBUFSIZE is the maximum size of a name created by lua_tmpnam.
** CHANGE them if you have an alternative to tmpnam (which is considered
** insecure) or if you want the original tmpnam anyway.  By default, Lua
** uses tmpnam except when POSIX is available, where it uses mkstemp.
 }
{$if defined(loslib_c) || defined(luaall_c)}
{
@@ lua_popen spawns a new process connected to the current one through
@* the file streams.
** CHANGE it if you have a way to implement it in your system.
 }
{
@@ LUA_DL_* define which dynamic-library system Lua should use.
** CHANGE here if Lua has problems choosing the appropriate
** dynamic-library system for your platform (either Windows' DLL, Mac's
** dyld, or Unix's dlopen). If your system is some kind of Unix, there
** is a good chance that it has dlopen, so LUA_DL_DLOPEN will work for
** it.  To use dlopen you also need to adapt the src/Makefile (probably
** adding -ldl to the linker options), so Lua does not select it
** automatically.  (When you change the makefile to add -ldl, you must
** also add -DLUA_USE_DLOPEN.)
** If you do not want any kind of dynamic library, undefine all these
** options.
** By default, _WIN32 gets LUA_DL_DLL and MAC OS X gets LUA_DL_DYLD.
 }
{$if defined(LUA_USE_DLOPEN)}
{$define LUA_DL_DLOPEN}
{$endif}
{$if defined(LUA_WIN)}
{$define LUA_DL_DLL}
{$endif}
{
@@ LUAI_EXTRASPACE allows you to add user-specific data in a lua_State
@* (the data goes just *before* the lua_State pointer).
** CHANGE (define) this if you really need that. This value must be
** a multiple of the maximum alignment required for your machine.
 }

const
  LUAI_EXTRASPACE = 0;  
{
@@ luai_userstate* allow user-specific actions on threads.
** CHANGE them if you defined LUAI_EXTRASPACE and need to do something
** extra when a thread is created/deleted/resumed/yielded.
 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function luai_userstateopen(L : longint) : pointer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstateclose(L : longint) : pointer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstatethread(L,L1 : longint) : pointer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstatefree(L : longint) : pointer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstateresume(L,n : longint) : pointer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstateyield(L,n : longint) : pointer;

{
@@ LUA_INTFRMLEN is the length modifier for integer conversions
@* in 'string.format'.
@@ LUA_INTFRM_T is the integer type correspoding to the previous length
@* modifier.
** CHANGE them if your system supports long long or does not support long.
 }
{$if defined(LUA_USELONGLONG)}

const
  LUA_INTFRMLEN = 'll';  
  LUA_INTFRM_T = int64;  
{$else}

const
  LUA_INTFRMLEN = 'l';  
  LUA_INTFRM_T = longint;  
{$endif}
{ ===================================================================  }
{
** Local configuration. You can use this space to add your redefinitions
** without modifying the main part of the file.
 }
{$endif}

// === Konventiert am: 21-5-26 17:31:15 ===


implementation


{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function lua_stdin_is_tty : longint;
begin
  lua_stdin_is_tty:=isatty(0);
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function lua_stdin_is_tty : longint;
begin
  lua_stdin_is_tty:=_isatty(_fileno(stdin));
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function lua_stdin_is_tty : longint;
begin
  lua_stdin_is_tty:=1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function lua_number2str(s,n : longint) : longint;
begin
  lua_number2str:=sprintf(s,LUA_NUMBER_FMT,n);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function lua_str2number(s,p : longint) : longint;
begin
  lua_str2number:=strtod(s,p);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_numadd(a,b : longint) : Ta;
begin
  luai_numadd:=Ta(+(b));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_numsub(a,b : longint) : Ta;
begin
  luai_numsub:=Ta(-(b));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_nummul(a,b : longint) : longint;
begin
  luai_nummul:=a*b;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numdiv(a,b : longint) : longint;
begin
  luai_numdiv:=a/b;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_nummod(a,b : longint) : longint;
begin
  luai_nummod:=(Ta(-(floor(a/b))))*b;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numpow(a,b : longint) : longint;
begin
  luai_numpow:=pow(a,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numunm(a : longint) : longint;
begin
  luai_numunm:=-(a);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numeq(a,b : longint) : longint;
begin
  luai_numeq:=a=b;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numlt(a,b : longint) : longint;
begin
  luai_numlt:=a<b;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numle(a,b : longint) : longint;
begin
  luai_numle:=a<=b;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function luai_numisnan(a : longint) : longint;
begin
  luai_numisnan:= not (luai_numeq(a,a));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstateopen(L : longint) : pointer;
begin
  luai_userstateopen:=pointer(L);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstateclose(L : longint) : pointer;
begin
  luai_userstateclose:=pointer(L);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstatethread(L,L1 : longint) : pointer;
begin
  luai_userstatethread:=pointer(L);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstatefree(L : longint) : pointer;
begin
  luai_userstatefree:=pointer(L);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstateresume(L,n : longint) : pointer;
begin
  luai_userstateresume:=pointer(L);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function luai_userstateyield(L,n : longint) : pointer;
begin
  luai_userstateyield:=pointer(L);
end;


end.
