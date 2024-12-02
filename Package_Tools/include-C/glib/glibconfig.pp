
unit glibconfig;
interface

{
  Automatically converted by H2Pas 1.0.0 from glibconfig.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    glibconfig.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgint16  = ^gint16;
Pgint32  = ^gint32;
Pgint64  = ^gint64;
Pgint8  = ^gint8;
Pgintptr  = ^gintptr;
Pgoffset  = ^goffset;
PGPid  = ^GPid;
Pgsize  = ^gsize;
Pgssize  = ^gssize;
Pguint16  = ^guint16;
Pguint32  = ^guint32;
Pguint64  = ^guint64;
Pguint8  = ^guint8;
Pguintptr  = ^guintptr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ glibconfig.h
 *
 * This is a generated file.  Please modify 'glibconfig.h.in'
  }
{$ifndef __GLIBCONFIG_H__}
{$define __GLIBCONFIG_H__}
{$include <glib/gmacros.h>}
{$include <limits.h>}
{$include <float.h>}
{$define GLIB_HAVE_ALLOCA_H}
{ #undef GLIB_STATIC_COMPILATION  }
{ #undef GOBJECT_STATIC_COMPILATION  }
{ #undef GIO_STATIC_COMPILATION  }
{ #undef GMODULE_STATIC_COMPILATION  }
{ #undef GI_STATIC_COMPILATION  }
{ #undef G_INTL_STATIC_COMPILATION  }
{ #undef FFI_STATIC_BUILD  }
{ Specifies that GLib's g_print*() functions wrap the
 * system printf functions.  This is useful to know, for example,
 * when using glibc's register_printf_function().
  }
{$define GLIB_USING_SYSTEM_PRINTF}

const
  G_MINFLOAT = FLT_MIN;  
  G_MAXFLOAT = FLT_MAX;  
  G_MINDOUBLE = DBL_MIN;  
  G_MAXDOUBLE = DBL_MAX;  
  G_MINSHORT = SHRT_MIN;  
  G_MAXSHORT = SHRT_MAX;  
  G_MAXUSHORT = USHRT_MAX;  
  G_MININT = INT_MIN;  
  G_MAXINT = INT_MAX;  
  G_MAXUINT = UINT_MAX;  
  G_MINLONG = LONG_MIN;  
  G_MAXLONG = LONG_MAX;  
  G_MAXULONG = ULONG_MAX;  
type
  Pgint8 = ^Tgint8;
  Tgint8 = char;

  Pguint8 = ^Tguint8;
  Tguint8 = byte;

  Pgint16 = ^Tgint16;
  Tgint16 = smallint;

  Pguint16 = ^Tguint16;
  Tguint16 = word;

const
  G_GINT16_MODIFIER = 'h';  
  G_GINT16_FORMAT = 'hi';  
  G_GUINT16_FORMAT = 'hu';  
type
  Pgint32 = ^Tgint32;
  Tgint32 = longint;

  Pguint32 = ^Tguint32;
  Tguint32 = dword;

const
  G_GINT32_MODIFIER = '';  
  G_GINT32_FORMAT = 'i';  
  G_GUINT32_FORMAT = 'u';  
{ deprecated, always true  }
  G_HAVE_GINT64 = 1;  
type
  Pgint64 = ^Tgint64;
  Tgint64 = longint;

  Pguint64 = ^Tguint64;
  Tguint64 = dword;
{ xxxxxxxxxxxx }
{#define G_GINT64_CONSTANT(val)	(val##L) }
{#define G_GUINT64_CONSTANT(val)	(val##UL) }

const
  G_GINT64_MODIFIER = 'l';  
  G_GINT64_FORMAT = 'li';  
  G_GUINT64_FORMAT = 'lu';  
  GLIB_SIZEOF_VOID_P = 8;  
  GLIB_SIZEOF_LONG = 8;  
  GLIB_SIZEOF_SIZE_T = 8;  
  GLIB_SIZEOF_SSIZE_T = 8;  
type
  Pgssize = ^Tgssize;
  Tgssize = longint;

  Pgsize = ^Tgsize;
  Tgsize = dword;

const
  G_GSIZE_MODIFIER = 'l';  
  G_GSSIZE_MODIFIER = 'l';  
  G_GSIZE_FORMAT = 'lu';  
  G_GSSIZE_FORMAT = 'li';  
  G_MAXSIZE = G_MAXULONG;  
  G_MINSSIZE = G_MINLONG;  
  G_MAXSSIZE = G_MAXLONG;  
type
  Pgoffset = ^Tgoffset;
  Tgoffset = Tgint64;

const
  G_MINOFFSET = G_MININT64;  
  G_MAXOFFSET = G_MAXINT64;  
  G_GOFFSET_MODIFIER = G_GINT64_MODIFIER;  
  G_GOFFSET_FORMAT = G_GINT64_FORMAT;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_GOFFSET_CONSTANT(val : longint) : longint;

const
  G_POLLFD_FORMAT = '%d';  
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

type
  Pgintptr = ^Tgintptr;
  Tgintptr = longint;

  Pguintptr = ^Tguintptr;
  Tguintptr = dword;

const
  G_GINTPTR_MODIFIER = 'l';  
  G_GINTPTR_FORMAT = 'li';  
  G_GUINTPTR_FORMAT = 'lu';  
  GLIB_MAJOR_VERSION = 2;  
  GLIB_MINOR_VERSION = 80;  
  GLIB_MICRO_VERSION = 0;  
{$define G_OS_UNIX}
  G_VA_COPY = va_copy;  
  G_VA_COPY_AS_ARRAY = 1;  
  G_HAVE_ISO_VARARGS = 1;  
{ gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
 * is passed ISO vararg support is turned off, and there is no work
 * around to turn it on, so we unconditionally turn it off.
  }
{$if __GNUC__ == 2 && __GNUC_MINOR__ == 95}
{$undef G_HAVE_ISO_VARARGS}
{$endif}

const
  G_HAVE_GROWING_STACK = 0;  
{$ifndef _MSC_VER}

const
  G_HAVE_GNUC_VARARGS = 1;  
{$endif}
{$if defined(__SUNPRO_C) && (__SUNPRO_C >= 0x590)}

{ was #define dname def_expr }
function G_GNUC_INTERNAL : longint; { return type might be wrong }

(*** was #elif ****){$else defined(__SUNPRO_C) && (__SUNPRO_C >= 0x550)}

const
  G_GNUC_INTERNAL = __hidden;  
(*** was #elif ****){$else defined (__GNUC__) && defined (G_HAVE_GNUC_VISIBILITY)}

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

const
  G_BYTE_ORDER = G_LITTLE_ENDIAN;  
{ No way to disable deprecation warnings for macros, so only emit deprecation
 * warnings on platforms where usage of this macro is broken  }
{$if defined(__APPLE__) || defined(_MSC_VER) || defined(__CYGWIN__)}

const
  G_MODULE_SUFFIX = 'so';  
{$else}

const
  G_MODULE_SUFFIX = 'so';  
{$endif}
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
