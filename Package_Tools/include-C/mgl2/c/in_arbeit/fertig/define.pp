
unit define;
interface

{
  Automatically converted by H2Pas 1.0.0 from define.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    define.h
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
Pchar  = ^char;
Pcmdual  = ^cmdual;
Pint16_t  = ^int16_t;
Pint32_t  = ^int32_t;
Pint64_t  = ^int64_t;
Pint8_t  = ^int8_t;
Plongint  = ^longint;
Pmdual  = ^mdual;
Pmreal  = ^mreal;
Pmsize  = ^msize;
Puint16_t  = ^uint16_t;
Puint32_t  = ^uint32_t;
Puint64_t  = ^uint64_t;
Puint8_t  = ^uint8_t;
Puintptr_t  = ^uintptr_t;
Pwchar_t  = ^wchar_t;
Pxxxxxx  = ^xxxxxx;
Pxxxxxxx  = ^xxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{**************************************************************************
 * define.h is part of Math Graphic Library
 * Copyright (C) 2007-2016 Alexey Balakin <mathgl.abalakin@gmail.ru>       *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU Lesser General Public License  as       *
 *   published by the Free Software Foundation; either version 3 of the    *
 *   License, or (at your option) any later version.                       *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU Lesser General Public     *
 *   License along with this program; if not, write to the                 *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ************************************************************************** }
{$ifndef _MGL_DEFINE_H_}
{$define _MGL_DEFINE_H_}
{----------------------------------------------------------------------------- }
{ Disable warnings for MSVC: }
{ 4190 - C-linkage of std::complex, }
{ 4996 - deprecated abi functions }
{ 4786 - disable warnings on 255 char debug symbols }
{ 4231 - disable warnings on extern before template instantiation }
{ 4800	- "int,uint32_t,etc" forcing value to bool 'true' or 'false' (performance warning) }
{ 4244 - conversion from 'mreal,double' to 'float', possible loss of data }
{ 4267	- conversion from 'size_t' to 'long,int,etc', possible loss of data }
{ 4305	- truncation from 'double' to 'float' }
{ 4251 - class 'type' needs to have dll-interface to be used by clients of class 'type2' }
{$if defined(_MSC_VER)}
(** unsupported pragma#pragma warning(disable: 4190 4996 4786 4800 4244 4267 4305 4251)*)
{$endif}
{$if defined(_WIN32) && !defined(WIN32)}

const
  WIN32 = 1;  
{$endif}
{$include "mgl2/config.h"}
{$ifndef SWIG}
{$if MGL_HAVE_PTHR_WIDGET|MGL_HAVE_PTHREAD}
{$include <pthread.h>}
{$endif}
{----------------------------------------------------------------------------- }
{$ifdef MGL_SRC}
{$if MGL_HAVE_ZLIB}
{$include <zlib.h>}
{$ifndef Z_BEST_COMPRESSION}

const
  Z_BEST_COMPRESSION = 9;  
{$endif}
{$else}
{ ???????????????????'' }
{#define gzFile	FILE* }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gzread(fp,buf,size : longint) : longint;

const
  gzopen = fopen;  
  gzclose = fclose;  
  gzprintf = fprintf;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gzgets(fp,str,size : longint) : longint;

const
  gzgetc = fgetc;  
{$endif}
{$endif}
{$if (defined(_MSC_VER) && (_MSC_VER<1600)) || defined(__BORLANDC__)}
type
  Pint8_t = ^Tint8_t;
  Tint8_t = char;

  Pint16_t = ^Tint16_t;
  Tint16_t = smallint;

  Pint32_t = ^Tint32_t;
  Tint32_t = longint;

  Pint64_t = ^Tint64_t;
  Tint64_t = int64;

  Puint8_t = ^Tuint8_t;
  Tuint8_t = byte;

  Puint16_t = ^Tuint16_t;
  Tuint16_t = word;

  Puint32_t = ^Tuint32_t;
  Tuint32_t = dword;

  Puint64_t = ^Tuint64_t;
  Tuint64_t = qword;
{$else}
{$include <stdint.h>}
{$endif}
{$if defined(__BORLANDC__)}
type
  Puintptr_t = ^Tuintptr_t;
  Tuintptr_t = dword;
{$endif}
{$if ((defined(_MSC_VER) || defined(__BORLANDC__)) && !defined(M_PI))	//_MSC_VER needs this before math.h}
{$define _USE_MATH_DEFINES}
{$endif}
{$include <math.h>}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$include <wchar.h>}
type
  Pmsize = ^Tmsize;
  Tmsize = Tsize_t;
{$if !MGL_SYS_NAN}
{$include <float.h>}
{ ?????? }
{const unsigned long long mgl_nan[2] = 0x7fffffffffffffff, 0x7fffffff; }
{const unsigned long long mgl_inf[2] = 0x7ff0000000000000, 0x7f800000; }
{#define NANd    (*(double*)mgl_nan) }
{#define NANf    (*(float*)(mgl_nan+1)) }
{#define INFd    (*(double*)mgl_inf) }
{#define INFf    (*(float*)(mgl_inf+1)) }
{$if !defined(NAN)}
{$if MGL_USE_DOUBLE}

const
  NAN = NANd;  
{$else}

const
  NAN = NANf;  
{$endif}
{$endif}
{$if !defined(INFINITY)}
{$if MGL_USE_DOUBLE}

const
  INFINITY = INFd;  
{$else}

const
  INFINITY = INFf;  
{$endif}
{$endif}
{$endif}
{ !MGL_SYS_NAN }
{$ifndef M_PI}
{ pi  }

const
  M_PI = 3.14159265358979323846;  
{$endif}
{----------------------------------------------------------------------------- }
{$ifdef WIN32}

const
  mglprintf = _snwprintf;  
{$else}

const
  mglprintf = swprintf;  
{$endif}
{#define FLT_EPS	1.1920928955078125e-07 }
{----------------------------------------------------------------------------- }
{$if MGL_USE_DOUBLE}
type
  Pmreal = ^Tmreal;
  Tmreal = Tdouble;

{ was #define dname def_expr }
function MGL_EPSILON : longint; { return type might be wrong }

const
  MGL_MIN_VAL = 1e-307;  
{$else}
type
  Pmreal = ^Tmreal;
  Tmreal = single;

{ was #define dname def_expr }
function MGL_EPSILON : longint; { return type might be wrong }

const
  MGL_MIN_VAL = 1e-37;  
{$endif}

{ was #define dname def_expr }
function MGL_FEPSILON : longint; { return type might be wrong }

{----------------------------------------------------------------------------- }
{$ifndef MGL_CMAP_COLOR}

const
  MGL_CMAP_COLOR = 32;  
{$endif}
{----------------------------------------------------------------------------- }
{$ifndef MGL_DEF_VIEWER}

const
  MGL_DEF_VIEWER = 'evince';  
{$endif}
{----------------------------------------------------------------------------- }
{ types of predefined curvelinear coordinate systems }
{ no transformation }
type
  Pxxxxxx = ^Txxxxxx;
  Txxxxxx =  Longint;
  Const
    mglCartesian = 0;
    mglPolar = 1;
    mglSpherical = 2;
    mglParabolic = 3;
    mglParaboloidal = 4;
    mglOblate = 5;
    mglProlate = 6;
    mglElliptic = 7;
    mglToroidal = 8;
    mglBispherical = 9;
    mglBipolar = 10;
    mglLogLog = 11;
    mglLogX = 12;
    mglLogY = 13;
;
{----------------------------------------------------------------------------- }
{ types of drawing }
  MGL_DRAW_WIRE = 0;  { fastest, no faces }
  MGL_DRAW_FAST = 1;  { fast, no color interpolation }
  MGL_DRAW_NORM = 2;  { high quality, slower }
  MGL_DRAW_LMEM = 4;  { low memory usage (direct to pixel) }
  MGL_DRAW_DOTS = 8;  { draw dots instead of primitives }
  MGL_DRAW_NONE = 9;  { no ouput (for testing only) }
{----------------------------------------------------------------------------- }
{ Codes for warnings/messages }
{ Everything OK }
{ Data dimension(s) is incompatible }
{ Data dimension(s) is too small }
{ Minimal data value is negative }
{ No file or wrong data dimensions }
{ Not enough memory }
{ Data values are zero }
{ No legend entries }
{ Slice value is out of range }
{ Number of contours is zero or negative }
{ Couldn't open file }
{ Light: ID is out of range }
{ Setsize: size(s) is zero or negative }
{ Format is not supported for that build }
{ Axis ranges are incompatible }
{ Pointer is NULL }
{ Not enough space for plot }
{ Wrong argument(s) in MGL script }
{ Wrong command in MGL script }
{ Too long line in MGL script }
{ Unbalanced ' in MGL script }
{ Change temporary data in MGL script }
{ Maximal number of warnings (must be last) }
type
  Pxxxxxxx = ^Txxxxxxx;
  Txxxxxxx =  Longint;
  Const
    mglWarnNone = 0;
    mglWarnDim = 1;
    mglWarnLow = 2;
    mglWarnNeg = 3;
    mglWarnFile = 4;
    mglWarnMem = 5;
    mglWarnZero = 6;
    mglWarnLeg = 7;
    mglWarnSlc = 8;
    mglWarnCnt = 9;
    mglWarnOpen = 10;
    mglWarnLId = 11;
    mglWarnSize = 12;
    mglWarnFmt = 13;
    mglWarnTern = 14;
    mglWarnNull = 15;
    mglWarnSpc = 16;
    mglScrArg = 17;
    mglScrCmd = 18;
    mglScrLong = 19;
    mglScrStr = 20;
    mglScrTemp = 21;
    mglWarnEnd = 22;
;
{----------------------------------------------------------------------------- }
  MGL_DEF_PAL = 'bgrcmyhlnqeupH';  { default palette }
  MGL_DEF_SCH = 'BbcyrR';  { default palette }
  MGL_COLORS = 'kwrgbcymhWRGBCYMHlenpquLENPQU';  
{----------------------------------------------------------------------------- }
{/ Brushes for mask with symbol "-+=;oOsS~<>jdD*^" correspondingly }
  var
    mgl_mask_val : array[0..15] of Tuint64_t;cvar;external;

const
  MGL_MASK_ID = '-+=;oOsS~<>jdD*^';  
  MGL_SOLID_MASK = $ffffffffffffffff;  
{----------------------------------------------------------------------------- }
  MGL_TRANSP_NORM = $00000000;  
  MGL_TRANSP_GLASS = $00000001;  
  MGL_TRANSP_LAMP = $00000002;  
  MGL_ENABLE_CUT = $00000004;  {/< Flag which determines how points outside bounding box are drown. }
  MGL_ENABLE_RTEXT = $00000008;  {/< Use text rotation along axis }
  MGL_AUTO_FACTOR = $00000010;  {/< Enable autochange PlotFactor }
  MGL_ENABLE_ALPHA = $00000020;  {/< Flag that Alpha is used }
  MGL_ENABLE_LIGHT = $00000040;  {/< Flag of using lightning }
  MGL_TICKS_ROTATE = $00000080;  {/< Allow ticks rotation }
  MGL_TICKS_SKIP = $00000100;  {/< Allow ticks rotation }
{ flags for internal use only }
  MGL_DISABLE_SCALE = $00000200;  {/< Temporary flag for disable scaling (used for axis) }
  MGL_FINISHED = $00000400;  {/< Flag that final picture (i.e. mglCanvas::G) is ready }
  MGL_USE_GMTIME = $00000800;  {/< Use gmtime instead of localtime }
  MGL_SHOW_POS = $00001000;  {/< Switch to show or not mouse click position }
  MGL_CLF_ON_UPD = $00002000;  {/< Clear plot before Update() }
  MGL_NOSUBTICKS = $00004000;  {/< Disable subticks drawing (for bounding box) }
  MGL_LOCAL_LIGHT = $00008000;  {/< Keep light sources for each inplot }
  MGL_VECT_FRAME = $00010000;  {/< Use DrwDat to remember all data of frames }
  MGL_REDUCEACC = $00020000;  {/< Reduce accuracy of points (to reduce size of output files) }
  MGL_PREFERVC = $00040000;  {/< Prefer vertex color instead of texture if output format supports }
  MGL_ONESIDED = $00080000;  {/< Render only front side of surfaces if output format supports (for debugging) }
  MGL_NO_ORIGIN = $00100000;  {/< Don't draw tick labels at axis origin }
  MGL_GRAY_MODE = $00200000;  {/< Convert all colors to gray ones }
  MGL_FULL_CURV = $00400000;  {/< Disable omitting points in straight-line part(s). }
  MGL_NO_SCALE_REL = $00800000;  {/< Disable font scaling in relative inplots }
  MGL_FAST_PRIM = $01000000;  {/< Disable accurate primitive cutting at axis borders }
{----------------------------------------------------------------------------- }
{----------------------------------------------------------------------------- }
{ complex number (bypass C/C++ incompatibility) }
{ real and imaginary parts }
type
  Pcmdual = ^Tcmdual;
  Tcmdual = record
      re : Tmreal;
      im : Tmreal;
    end;


  Pmdual = ^Tmdual;
  Tmdual = Tcmdual;
{----------------------------------------------------------------------------- }
  var
    mgl_cos : array[0..359] of single;cvar;external;
{/< contain cosine with step 1 degree }

procedure mgl_init;cdecl;external;
{/< initialize MathGL structures }
procedure mgl_fini;cdecl;external;
{/< free MathGL structures }
{----------------------------------------------------------------------------- }
{/ Calculate sqrt(x*x+y*y) }
function mgl_hypot(x:Tdouble; y:Tdouble):Tdouble;cdecl;external;
{/ Find length of wchar_t string (bypass standard wcslen bug) }
(* Const before type ignored *)
function mgl_wcslen(str:Pwchar_t):Tsize_t;cdecl;external;
{/ Get RGB values for given color id or fill by -1 if no one found }
procedure mgl_chrrgb(id:char; rgb:array[0..2] of single);cdecl;external;
{/ Get number of colors in the string }
(* Const before type ignored *)
function mgl_get_num_color(s:Pchar; smooth:longint):Tsize_t;cdecl;external;
{/ Check if string contain color id and return its number }
(* Const before type ignored *)
function mgl_have_color(stl:Pchar):longint;cdecl;external;
{/ Find symbol in string excluding  and return its position or NULL }
(* Const before type ignored *)
(* Const before type ignored *)
function mglchr(str:Pchar; ch:char):Pchar;cdecl;external;
{/ Find any symbol from chr in string excluding  and return its position or NULL }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mglchrs(str:Pchar; chr:Pchar):Pchar;cdecl;external;
{/ Set number of thread for plotting and data handling (for pthread version only) }
procedure mgl_set_num_thr(n:longint);cdecl;external;
procedure mgl_set_num_thr_(n:Plongint);cdecl;external;
(* Const before type ignored *)
procedure mgl_test_txt(str:Pchar; args:array of const);cdecl;external;
procedure mgl_test_txt(str:Pchar);cdecl;external;
procedure mgl_set_test_mode(enable:longint);cdecl;external;
{/ Remove spaces at begining and at the end of the string }
procedure mgl_strtrim(str:Pchar);cdecl;external;
procedure mgl_wcstrim(str:Pwchar_t);cdecl;external;
{* Change register to lowercase (only for ANSI symbols)  }
procedure mgl_strlwr(str:Pchar);cdecl;external;
procedure mgl_wcslwr(str:Pwchar_t);cdecl;external;
{/ Convert wchar_t* string into char* one }
(* Const before type ignored *)
procedure mgl_wcstombs(dst:Pchar; src:Pwchar_t; size:longint);cdecl;external;
{/ Clear internal data for speeding up FFT and Hankel transforms }
procedure mgl_clear_fft;cdecl;external;
{/ Set global warning message }
(* Const before type ignored *)
procedure mgl_set_global_warn(text:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_set_global_warn_(text:Pchar; para2:longint);cdecl;external;
{/ Get text of global warning message(s) }
(* Const before type ignored *)
function mgl_get_global_warn:Pchar;cdecl;external;
function mgl_get_global_warn_(out:Pchar; len:longint):longint;cdecl;external;
{/ Clear global warning message }
procedure mgl_clear_global_warn;cdecl;external;
procedure mgl_clear_global_warn_;cdecl;external;
{/ Setup gettext usage. NOTE: Russian translation MUST be installed. }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mgl_textdomain(argv0:Pchar; locale:Pchar);cdecl;external;
(* Const before type ignored *)
procedure mgl_textdomain_(locale:Pchar; para2:longint);cdecl;external;
{/ size of var array }
{ ???????? }
{const int MGL_VS = 'z'-'a'+1; }
{ C++ end of extern C conditionnal removed }
{----------------------------------------------------------------------------- }
{$endif}
{----------------------------------------------------------------------------- }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gzread(fp,buf,size : longint) : longint;
begin
  gzread:=fread(buf,1,size,fp);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gzgets(fp,str,size : longint) : longint;
begin
  gzgets:=fgets(str,size,fp);
end;

{ was #define dname def_expr }
function MGL_EPSILON : longint; { return type might be wrong }
  begin
    MGL_EPSILON:=1.(+(1e-10));
  end;

{ was #define dname def_expr }
function MGL_EPSILON : longint; { return type might be wrong }
  begin
    MGL_EPSILON:=1.(+(1e-5));
  end;

{ was #define dname def_expr }
function MGL_FEPSILON : longint; { return type might be wrong }
  begin
    MGL_FEPSILON:=1.(+(1e-5));
  end;


end.
