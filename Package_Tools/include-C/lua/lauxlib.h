/*
** $Id: lauxlib.h,v 1.88.1.1 2007/12/27 13:02:25 roberto Exp $
** Auxiliary functions for building Lua libraries
** See Copyright Notice in lua.h
*/


#ifndef lauxlib_h
#define lauxlib_h


#include <stddef.h>
#include <stdio.h>

#include "lua.h"


#if defined(LUA_COMPAT_GETN)
extern int (luaL_getn) (lua_State *L, int t);
extern void (luaL_setn) (lua_State *L, int t, int n);
#else
#define luaL_getn(L,i)          ((int)lua_objlen(L, i))
#define luaL_setn(L,i,j)        ((void)0)  /* no op! */
#endif

#if defined(LUA_COMPAT_OPENLIB)
#define luaI_openlib	luaL_openlib
#endif


/* extra error code for `luaL_load' */
#define LUA_ERRFILE     (LUA_ERRERR+1)


typedef struct luaL_Reg {
  const char *name;
  lua_CFunction func;
} luaL_Reg;



extern void (luaI_openlib) (lua_State *L, const char *libname,
                                const luaL_Reg *l, int nup);
extern void (luaL_register) (lua_State *L, const char *libname,
                                const luaL_Reg *l);
extern int (luaL_getmetafield) (lua_State *L, int obj, const char *e);
extern int (luaL_callmeta) (lua_State *L, int obj, const char *e);
extern int (luaL_typerror) (lua_State *L, int narg, const char *tname);
extern int (luaL_argerror) (lua_State *L, int numarg, const char *extramsg);
extern const char *(luaL_checklstring) (lua_State *L, int numArg,
                                                          size_t *l);
extern const char *(luaL_optlstring) (lua_State *L, int numArg,
                                          const char *def, size_t *l);
extern lua_Number (luaL_checknumber) (lua_State *L, int numArg);
extern lua_Number (luaL_optnumber) (lua_State *L, int nArg, lua_Number def);

extern lua_Integer (luaL_checkinteger) (lua_State *L, int numArg);
extern lua_Integer (luaL_optinteger) (lua_State *L, int nArg,
                                          lua_Integer def);

extern void (luaL_checkstack) (lua_State *L, int sz, const char *msg);
extern void (luaL_checktype) (lua_State *L, int narg, int t);
extern void (luaL_checkany) (lua_State *L, int narg);

extern int   (luaL_newmetatable) (lua_State *L, const char *tname);
extern void *(luaL_checkudata) (lua_State *L, int ud, const char *tname);

extern void (luaL_where) (lua_State *L, int lvl);
extern int (luaL_error) (lua_State *L, const char *fmt, ...);

extern int (luaL_checkoption) (lua_State *L, int narg, const char *def,
                                   const char *const lst[]);

extern int (luaL_ref) (lua_State *L, int t);
extern void (luaL_unref) (lua_State *L, int t, int ref);

extern int (luaL_loadfile) (lua_State *L, const char *filename);
extern int (luaL_loadbuffer) (lua_State *L, const char *buff, size_t sz,
                                  const char *name);
extern int (luaL_loadstring) (lua_State *L, const char *s);

extern lua_State *(luaL_newstate) (void);


extern const char *(luaL_gsub) (lua_State *L, const char *s, const char *p,
                                                  const char *r);

extern const char *(luaL_findtable) (lua_State *L, int idx,
                                         const char *fname, int szhint);




/*
** ===============================================================
** some useful macros
** ===============================================================
*/



typedef struct luaL_Buffer {
  char *p;			/* current position in buffer */
  int lvl;  /* number of strings in the stack (level) */
  lua_State *L;
  char buffer[LUAL_BUFFERSIZE];
} luaL_Buffer;

extern void (luaL_buffinit) (lua_State *L, luaL_Buffer *B);
extern char *(luaL_prepbuffer) (luaL_Buffer *B);
extern void (luaL_addlstring) (luaL_Buffer *B, const char *s, size_t l);
extern void (luaL_addstring) (luaL_Buffer *B, const char *s);
extern void (luaL_addvalue) (luaL_Buffer *B);
extern void (luaL_pushresult) (luaL_Buffer *B);


/* }====================================================== */


/* compatibility with ref system */


