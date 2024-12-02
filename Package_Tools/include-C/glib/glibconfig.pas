unit glibconfig;

interface

uses
  fp_cairo, fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



{ xxxxxxxxxxxx }
{#define G_GINT64_CONSTANT(val)	(val##L) }
{#define G_GUINT64_CONSTANT(val)	(val##UL) }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_GOFFSET_CONSTANT(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GPOINTER_TO_INT(p : longint) : Tgint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GPOINTER_TO_UINT(p : longint) : Tguint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT_TO_POINTER(i : longint) : Tgpointer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT_TO_POINTER(u : longint) : Tgpointer;

{ gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
 * is passed ISO vararg support is turned off, and there is no work
 * around to turn it on, so we unconditionally turn it off.
  }
{$if __GNUC__ == 2 && __GNUC_MINOR__ == 95}
{$undef G_HAVE_ISO_VARARGS}
{$endif}

{$endif}
{$if defined(__SUNPRO_C) && (__SUNPRO_C >= 0x590)}

{ was #define dname def_expr }
function G_GNUC_INTERNAL : longint; { return type might be wrong }

(*** was #elif ****){$else defined(__SUNPRO_C) && (__SUNPRO_C >= 0x550)}

{ was #define dname def_expr }
function G_GNUC_INTERNAL : longint; { return type might be wrong }

{$else}
{$define G_GNUC_INTERNAL}
{$endif}
{$define G_THREADS_ENABLED}
{$define G_THREADS_IMPL_POSIX}
{$define G_ATOMIC_LOCK_FREE}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GINT16_TO_LE(val : longint) : Tgint16;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT16_TO_LE(val : longint) : Tguint16;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT16_TO_BE(val : longint) : Tgint16;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_TO_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT32_TO_LE(val : longint) : Tgint32;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT32_TO_LE(val : longint) : Tguint32;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT32_TO_BE(val : longint) : Tgint32;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT32_TO_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT64_TO_LE(val : longint) : Tgint64;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT64_TO_LE(val : longint) : Tguint64;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT64_TO_BE(val : longint) : Tgint64;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT64_TO_BE(val : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GLONG_TO_LE(val : longint) : Tglong;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GULONG_TO_LE(val : longint) : Tgulong;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GLONG_TO_BE(val : longint) : Tglong;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GULONG_TO_BE(val : longint) : Tgulong;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT_TO_LE(val : longint) : Tgint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT_TO_LE(val : longint) : Tguint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT_TO_BE(val : longint) : Tgint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT_TO_BE(val : longint) : Tguint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GSIZE_TO_LE(val : longint) : Tgsize;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GSSIZE_TO_LE(val : longint) : Tgssize;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GSIZE_TO_BE(val : longint) : Tgsize;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GSSIZE_TO_BE(val : longint) : Tgssize;

type
  PGPid = ^TGPid;
  TGPid = longint;

const
  G_PID_FORMAT = 'i';  
  GLIB_SYSDEF_AF_UNIX = 1;  
  GLIB_SYSDEF_AF_INET = 2;  
  GLIB_SYSDEF_AF_INET6 = 10;  
  GLIB_SYSDEF_MSG_OOB = 1;  
  GLIB_SYSDEF_MSG_PEEK = 2;  
  GLIB_SYSDEF_MSG_DONTROUTE = 4;  
  G_DIR_SEPARATOR = '/';  
  G_DIR_SEPARATOR_S = '/';  
  G_SEARCHPATH_SEPARATOR = ':';  
  G_SEARCHPATH_SEPARATOR_S = ':';  
{$undef G_HAVE_FREE_SIZED}
{$endif}
{ __GLIBCONFIG_H__  }

// === Konventiert am: 2-12-24 17:19:01 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_GOFFSET_CONSTANT(val : longint) : longint;
begin
  G_GOFFSET_CONSTANT:=G_GINT64_CONSTANT(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GPOINTER_TO_INT(p : longint) : Tgint;
begin
  GPOINTER_TO_INT:=Tgint(Tglong(p));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GPOINTER_TO_UINT(p : longint) : Tguint;
begin
  GPOINTER_TO_UINT:=Tguint(Tgulong(p));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT_TO_POINTER(i : longint) : Tgpointer;
begin
  GINT_TO_POINTER:=Tgpointer(Tglong(i));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT_TO_POINTER(u : longint) : Tgpointer;
begin
  GUINT_TO_POINTER:=Tgpointer(Tgulong(u));
end;

{ was #define dname def_expr }
function G_GNUC_INTERNAL : longint; { return type might be wrong }
  begin
    G_GNUC_INTERNAL:=__attribute__(visibility('hidden'));
  end;

{ was #define dname def_expr }
function G_GNUC_INTERNAL : longint; { return type might be wrong }
  begin
    G_GNUC_INTERNAL:=__attribute__(visibility('hidden'));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT16_TO_LE(val : longint) : Tgint16;
begin
  GINT16_TO_LE:=Tgint16(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT16_TO_LE(val : longint) : Tguint16;
begin
  GUINT16_TO_LE:=Tguint16(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT16_TO_BE(val : longint) : Tgint16;
begin
  GINT16_TO_BE:=Tgint16(GUINT16_SWAP_LE_BE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT16_TO_BE(val : longint) : longint;
begin
  GUINT16_TO_BE:=GUINT16_SWAP_LE_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT32_TO_LE(val : longint) : Tgint32;
begin
  GINT32_TO_LE:=Tgint32(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT32_TO_LE(val : longint) : Tguint32;
begin
  GUINT32_TO_LE:=Tguint32(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT32_TO_BE(val : longint) : Tgint32;
begin
  GINT32_TO_BE:=Tgint32(GUINT32_SWAP_LE_BE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT32_TO_BE(val : longint) : longint;
begin
  GUINT32_TO_BE:=GUINT32_SWAP_LE_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT64_TO_LE(val : longint) : Tgint64;
begin
  GINT64_TO_LE:=Tgint64(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT64_TO_LE(val : longint) : Tguint64;
begin
  GUINT64_TO_LE:=Tguint64(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT64_TO_BE(val : longint) : Tgint64;
begin
  GINT64_TO_BE:=Tgint64(GUINT64_SWAP_LE_BE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GUINT64_TO_BE(val : longint) : longint;
begin
  GUINT64_TO_BE:=GUINT64_SWAP_LE_BE(val);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GLONG_TO_LE(val : longint) : Tglong;
begin
  GLONG_TO_LE:=Tglong(GINT64_TO_LE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GULONG_TO_LE(val : longint) : Tgulong;
begin
  GULONG_TO_LE:=Tgulong(GUINT64_TO_LE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GLONG_TO_BE(val : longint) : Tglong;
begin
  GLONG_TO_BE:=Tglong(GINT64_TO_BE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GULONG_TO_BE(val : longint) : Tgulong;
begin
  GULONG_TO_BE:=Tgulong(GUINT64_TO_BE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT_TO_LE(val : longint) : Tgint;
begin
  GINT_TO_LE:=Tgint(GINT32_TO_LE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT_TO_LE(val : longint) : Tguint;
begin
  GUINT_TO_LE:=Tguint(GUINT32_TO_LE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GINT_TO_BE(val : longint) : Tgint;
begin
  GINT_TO_BE:=Tgint(GINT32_TO_BE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GUINT_TO_BE(val : longint) : Tguint;
begin
  GUINT_TO_BE:=Tguint(GUINT32_TO_BE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GSIZE_TO_LE(val : longint) : Tgsize;
begin
  GSIZE_TO_LE:=Tgsize(GUINT64_TO_LE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GSSIZE_TO_LE(val : longint) : Tgssize;
begin
  GSSIZE_TO_LE:=Tgssize(GINT64_TO_LE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GSIZE_TO_BE(val : longint) : Tgsize;
begin
  GSIZE_TO_BE:=Tgsize(GUINT64_TO_BE(val));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GSSIZE_TO_BE(val : longint) : Tgssize;
begin
  GSSIZE_TO_BE:=Tgssize(GINT64_TO_BE(val));
end;


end.
