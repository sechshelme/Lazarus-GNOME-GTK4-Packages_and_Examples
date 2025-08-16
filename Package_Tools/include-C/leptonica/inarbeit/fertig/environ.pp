
unit environ;
interface

{
  Automatically converted by H2Pas 1.0.0 from environ.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    environ.h
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
Pintptr_t  = ^intptr_t;
Pl_float32  = ^l_float32;
Pl_float64  = ^l_float64;
Pl_int16  = ^l_int16;
Pl_int32  = ^l_int32;
Pl_int64  = ^l_int64;
Pl_int8  = ^l_int8;
Pl_intptr_t  = ^l_intptr_t;
Pl_ok  = ^l_ok;
PL_TIMER  = ^L_TIMER;
Pl_uint16  = ^l_uint16;
Pl_uint32  = ^l_uint32;
Pl_uint64  = ^l_uint64;
Pl_uint8  = ^l_uint8;
Pl_uintptr_t  = ^l_uintptr_t;
PL_WallTimer  = ^L_WallTimer;
Puintptr_t  = ^uintptr_t;
Pxxxxxxxxxx  = ^xxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{====================================================================*
 -  Copyright (C) 2001 Leptonica.  All rights reserved.
 -
 -  Redistribution and use in source and binary forms, with or without
 -  modification, are permitted provided that the following conditions
 -  are met:
 -  1. Redistributions of source code must retain the above copyright
 -     notice, this list of conditions and the following disclaimer.
 -  2. Redistributions in binary form must reproduce the above
 -     copyright notice, this list of conditions and the following
 -     disclaimer in the documentation and/or other materials
 -     provided with the distribution.
 -
 -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 -  ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 -  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL ANY
 -  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 -  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 -  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 -  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *==================================================================== }
{$ifndef  LEPTONICA_ENVIRON_H}
{$define LEPTONICA_ENVIRON_H}
{------------------------------------------------------------------------*
 *  Defines and includes differ for Unix and Windows.  Also for Windows,  *
 *  differentiate between conditionals based on platform and compiler.    *
 *      For platforms:                                                    *
 *          _WIN32       =>     Windows, 32- or 64-bit                    *
 *          _WIN64       =>     Windows, 64-bit only                      *
 *          __CYGWIN__   =>     Cygwin                                    *
 *      For compilers:                                                    *
 *          __GNUC__     =>     gcc                                       *
 *          _MSC_VER     =>     msvc                                      *
 *------------------------------------------------------------------------ }
{ MS VC++ does not provide stdint.h, so define the missing types here  }
{$ifndef _MSC_VER}
{$include <stdint.h>}
{$else}
{ Note that _WIN32 is defined for both 32 and 64 bit applications,
   whereas _WIN64 is defined only for the latter  }
{$ifdef _WIN64}
type
  Pintptr_t = ^Tintptr_t;
  Tintptr_t = int64;

  Puintptr_t = ^Tuintptr_t;
  Tuintptr_t = qword;
{$else}
type
  Pintptr_t = ^Tintptr_t;
  Tintptr_t = longint;

  Puintptr_t = ^Tuintptr_t;
  Tuintptr_t = dword;
{$endif}
{ VC++6 doesn't seem to have powf, expf.  }
{$if (_MSC_VER < 1400)}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function powf(x,y : longint) : single;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function expf(x : longint) : single;

{$endif}
{$endif}
{ _MSC_VER  }
{$ifndef _WIN32  /* non-Windows specifics */}
{$include <stdint.h>}
{$endif}
{ _WIN32  }
type
  Pl_intptr_t = ^Tl_intptr_t;
  Tl_intptr_t = Tintptr_t;

  Pl_uintptr_t = ^Tl_uintptr_t;
  Tl_uintptr_t = Tuintptr_t;
{--------------------------------------------------------------------*
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*
 *                          USER CONFIGURABLE                         *
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*
 *               Environment variables with I/O libraries             *
 *               Manual Configuration Only: NOT AUTO_CONF             *
 *-------------------------------------------------------------------- }
{
 *  Leptonica provides interfaces to link to several external image
 *  I/O libraries, plus zlib.  Setting any of these to 0 here causes
 *  non-functioning stubs to be linked.
  }
{$if !defined(HAVE_CONFIG_H) && !defined(ANDROID_BUILD) && !defined(OS_IOS)}
{$if !defined(HAVE_LIBJPEG)}

const
  HAVE_LIBJPEG = 1;  
{$endif}
{$if !defined(HAVE_LIBTIFF)}

const
  HAVE_LIBTIFF = 1;  
{$endif}
{$if !defined(HAVE_LIBPNG)}

const
  HAVE_LIBPNG = 1;  
{$endif}
{$if !defined(HAVE_LIBZ)}

const
  HAVE_LIBZ = 1;  
{$endif}
{$if !defined(HAVE_LIBGIF)}

const
  HAVE_LIBGIF = 0;  
{$endif}
{$if !defined(HAVE_LIBUNGIF)}

const
  HAVE_LIBUNGIF = 0;  
{$endif}
{$if !defined(HAVE_LIBWEBP)}

const
  HAVE_LIBWEBP = 0;  
{$endif}
{$if !defined(HAVE_LIBWEBP_ANIM)}

const
  HAVE_LIBWEBP_ANIM = 0;  
{$endif}
{$if !defined(HAVE_LIBJP2K)}

const
  HAVE_LIBJP2K = 0;  
{$endif}
{-----------------------------------------------------------------------*
   * Leptonica supports OpenJPEG 2.0+.  If you have a version of openjpeg  *
   * (HAVE_LIBJP2K == 1) that is >= 2.0, set the path to the openjpeg.h    *
   * header in angle brackets here.                                        *
   *----------------------------------------------------------------------- }
{  #define  LIBJP2K_HEADER   <openjpeg-2.3/openjpeg.h> }
{$endif}
{ ! HAVE_CONFIG_H etc.  }
{--------------------------------------------------------------------*
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*
 *                          USER CONFIGURABLE                         *
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*
 *     Environ variables for image I/O without external libraries     *
 *-------------------------------------------------------------------- }
{
 *  Leptonica supplies I/O support without using external libraries for:
 *     * image read/write for bmp, pnm
 *     * header read for jp2k
 *     * image wrapping write for pdf and ps.
 *  Setting any of these to 0 causes non-functioning stubs to be linked.
  }

const
  USE_BMPIO = 1;  
  USE_PNMIO = 1;  
  USE_JP2KHEADER = 1;  
  USE_PDFIO = 1;  
  USE_PSIO = 1;  
{-------------------------------------------------------------------------*
 * On linux systems, you can do I/O between Pix and memory.  Specifically,
 * you can compress (write compressed data to memory from a Pix) and
 * uncompress (read from compressed data in memory to a Pix).
 * For jpeg, png, jp2k, gif, pnm and bmp, these use the non-posix GNU
 * functions fmemopen() and open_memstream().  These functions are not
 * available on other systems.
 * To use these functions in linux, you must define HAVE_FMEMOPEN to 1.
 * To use them on MacOS, which does not support these functions, set it to 0.
 *------------------------------------------------------------------------- }
{-------------------------------------------------------------------------*
 * fstatat() is defined by POSIX, but some systems do not support it.      *
 * One example is older macOS systems (pre-10.10).                         *
 * Play it safe and set the default value to 0.                            *
 *------------------------------------------------------------------------- }
{$if !defined(HAVE_CONFIG_H)}

const
  HAVE_FSTATAT = 0;  
{$endif}
{ ! HAVE_CONFIG_H  }
{--------------------------------------------------------------------*
 * It is desirable on Windows to have all temp files written to the same
 * subdirectory of the Windows <Temp> directory, because files under <Temp>
 * persist after reboot, and the regression tests write a lot of files.
 * We write all test files to /tmp/lept or subdirectories of /tmp/lept.
 * Windows temp files are specified as in unix, but have the translation
 *        /tmp/lept/xxx  -->   <Temp>/lept/xxx
 *-------------------------------------------------------------------- }
{--------------------------------------------------------------------*
 *                          Built-in types                            *
 *-------------------------------------------------------------------- }
type
  Pl_ok = ^Tl_ok;
  Tl_ok = longint;
{!< return type 0 if OK, 1 on error  }

  Pl_int8 = ^Tl_int8;
  Tl_int8 = char;
{!< signed 8-bit value  }

  Pl_uint8 = ^Tl_uint8;
  Tl_uint8 = byte;
{!< unsigned 8-bit value  }

  Pl_int16 = ^Tl_int16;
  Tl_int16 = smallint;
{!< signed 16-bit value  }

  Pl_uint16 = ^Tl_uint16;
  Tl_uint16 = word;
{!< unsigned 16-bit value  }

  Pl_int32 = ^Tl_int32;
  Tl_int32 = longint;
{!< signed 32-bit value  }

  Pl_uint32 = ^Tl_uint32;
  Tl_uint32 = dword;
{!< unsigned 32-bit value  }

  Pl_float32 = ^Tl_float32;
  Tl_float32 = single;
{!< 32-bit floating point value  }

  Pl_float64 = ^Tl_float64;
  Tl_float64 = Tdouble;
{!< 64-bit floating point value  }
{$ifdef COMPILER_MSVC}

  Pl_int64 = ^Tl_int64;
  Tl_int64 = int64;
{!< signed 64-bit value  }

  Pl_uint64 = ^Tl_uint64;
  Tl_uint64 = qword;
{!< unsigned 64-bit value  }
{$else}
type
  Pl_int64 = ^Tl_int64;
  Tl_int64 = int64;
{!< signed 64-bit value  }

  Pl_uint64 = ^Tl_uint64;
  Tl_uint64 = qword;
{!< unsigned 64-bit value  }
{$endif}
{ COMPILER_MSVC  }
{-------------------------------------------------------------------------*
 * For security, the library is distributed in a configuration that does   *
 * not permit (1) forking with 'system', which is used for displaying      *
 * images and generating gnuplots, and (2) writing files with specified    *
 * compiled-in file names.  All such writes are with functions such as     *
 * pixWriteDebug() where the "Debug" is appended to the usual name.        *
 * Whether the "Debug" version defaults to the standard version or is a    *
 * no-op depends on the value of this global variable.  The default value  *
 * of LeptDebugOK is 0, and it is set in writefile.c.  This value can be   *
 * over-ridden, for development and debugging, by setLeptDebugOK().        *
 *------------------------------------------------------------------------- }
  var
    LeptDebugOK : Tl_int32;cvar;external;
{ default is 0  }
{------------------------------------------------------------------------*
 *                            Standard macros                             *
 *------------------------------------------------------------------------ }
{$ifndef L_MIN}
{! Minimum of %x and %y  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function L_MIN(x,y : longint) : longint;

{$endif}
{$ifndef L_MAX}
{! Maximum of %x and %y  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function L_MAX(x,y : longint) : longint;

{$endif}
{$ifndef L_ABS}
{! Absolute value of %x  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function L_ABS(x : longint) : longint;

{$endif}
{$ifndef L_SIGN}
{! Sign of %x  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function L_SIGN(x : longint) : longint;

{$endif}
{$ifndef UNDEF}
{! Undefined value  }

const
  UNDEF = -(1);  
{$endif}
{$ifndef NULL}
{! NULL value  }

const
  NULL = 0;  
{$endif}
{$ifndef TRUE}
{! True value  }

const
  TRUE = 1;  
{$endif}
{$ifndef FALSE}
{! False value  }

const
  FALSE = 0;  
{$endif}
{--------------------------------------------------------------------*
 *            Environment variables for endian dependence             *
 *-------------------------------------------------------------------- }
{
 *  To control conditional compilation, one of two variables
 *
 *       L_LITTLE_ENDIAN  (e.g., for Intel X86)
 *       L_BIG_ENDIAN     (e.g., for Sun SPARC, Mac Power PC)
 *
 *  is defined when the GCC compiler is invoked.
 *  All code should compile properly for both hardware architectures.
  }
{------------------------------------------------------------------------*
 *                    Simple search state variables                       *
 *------------------------------------------------------------------------ }
{! Search State  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_NOT_FOUND = 0;
    L_FOUND = 1;

{------------------------------------------------------------------------*
 *                     Path separator conversion                          *
 *------------------------------------------------------------------------ }
{! Path Separators  }
type
  Txxxxxxxxxx =  Longint;
  Const
    UNIX_PATH_SEPCHAR = 0;
    WIN_PATH_SEPCHAR = 1;

{------------------------------------------------------------------------*
 *                          Timing structs                                *
 *------------------------------------------------------------------------ }
type
  PL_TIMER = ^TL_TIMER;
  TL_TIMER = pointer;
{! Timing struct  }
  PL_WallTimer = ^TL_WallTimer;
  TL_WallTimer = record
      start_sec : Tl_int32;
      start_usec : Tl_int32;
      stop_sec : Tl_int32;
      stop_usec : Tl_int32;
    end;

{------------------------------------------------------------------------*
 *                      Standard memory allocation                        *
 *                                                                        *
 *  All default heap allocation is through the system malloc and free.    *
 *                                                                        *
 *  Leptonica also provides non-default allocation in two situations:     *
 *                                                                        *
 *  (1) A special allocator/deallocator pair can be provided for the      *
 *      pix image data array.  This might be useful to prevent memory     *
 *      fragmentation when large images are repeatedly allocated and      *
 *      freed.  See the PixMemoryManager in pix1.c for details,           *
 *      where the default is defined.                                     *
 *                                                                        *
 *  (2) Special allocator/deallocators can be provided for ALL heap       *
 *      allocation if required, for example, for embedded systems.        *
 *      For such builds, define LEPTONICA_INTERCEPT_ALLOC, and provide    *
 *      custom leptonica_malloc, calloc, realloc, free functions.       *
 *------------------------------------------------------------------------ }
{$ifdef LEPTONICA_INTERCEPT_ALLOC}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LEPT_MALLOC(blocksize : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_CALLOC(numelem,elemsize : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_REALLOC(ptr,blocksize : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_FREE(ptr : longint) : longint;

function leptonica_malloc(blocksize:Tsize_t):pointer;cdecl;external;
function leptonica_calloc(numelem:Tsize_t; elemsize:Tsize_t):pointer;cdecl;external;
function leptonica_realloc(ptr:pointer; blocksize:Tsize_t):pointer;cdecl;external;
procedure leptonica_free(ptr:pointer);cdecl;external;
{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LEPT_MALLOC(blocksize : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_CALLOC(numelem,elemsize : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_REALLOC(ptr,blocksize : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_FREE(ptr : longint) : longint;

{$endif}
{ LEPTONICA_INTERCEPT_ALLOC  }
{------------------------------------------------------------------------*
 *         Control printing of error, warning, and info messages          *
 *                                                                        *
 *  Leptonica never sends output to stdout.  By default, all messages     *
 *  go to stderr.  However, we provide a mechanism for runtime            *
 *  redirection of output, using a custom stderr handler defined          *
 *  by the user.  See utils1.c for details and examples.                  *
 *                                                                        *
 *  To omit all messages to stderr, simply define NO_CONSOLE_IO on the    *
 *  command line.  For finer grained control, we have a mechanism         *
 *  based on the message severity level.  The following assumes that      *
 *  NO_CONSOLE_IO is not defined.                                         *
 *                                                                        *
 *  Messages are printed if the message severity is greater than or equal *
 *  to the current severity threshold.  The current severity threshold    *
 *  is the greater of the compile-time severity, which is the minimum     *
 *  severity that can be reported, and the run-time severity, which is    *
 *  the severity threshold at the moment.                                 *
 *                                                                        *
 *  The compile-time threshold determines which messages are compiled     *
 *  into the library for potential printing.  Messages below the          *
 *  compile-time threshold are omitted and can never be printed.  The     *
 *  default compile-time threshold is L_SEVERITY_INFO, but this may be    *
 *  overridden by defining MINIMUM_SEVERITY to the desired enumeration    *
 *  identifier on the compiler command line.  Defining NO_CONSOLE_IO on   *
 *  the command line is the same as setting MINIMUM_SEVERITY to           *
 *  L_SEVERITY_NONE.                                                      *
 *                                                                        *
 *  The run-time threshold determines which messages are printed during   *
 *  library execution.  It defaults to the compile-time threshold but     *
 *  may be changed either statically by defining DEFAULT_SEVERITY to      *
 *  the desired enumeration identifier on the compiler command line, or   *
 *  dynamically by calling setMsgSeverity() to specify a new threshold.   *
 *  The run-time threshold may also be set from the value of the          *
 *  environment variable LEPT_MSG_SEVERITY by calling setMsgSeverity()   *
 *  and specifying L_SEVERITY_EXTERNAL.                                   *
 *                                                                        *
 *  In effect, the compile-time threshold setting says, "Generate code    *
 *  to permit messages of equal or greater severity than this to be       *
 *  printed, if desired," whereas the run-time threshold setting says,    *
 *  "Print messages that have an equal or greater severity than this."    *
 *------------------------------------------------------------------------ }
{! Control printing of error, warning and info messages  }
{! Message Control  }
{ Get the severity from the environment    }
{ Lowest severity: print all messages      }
{ Print debugging and higher messages      }
{ Print informational and higher messages  }
{ Print warning and higher messages        }
{ Print error and higher messages          }
{ Highest severity: print no messages      }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_SEVERITY_EXTERNAL = 0;
    L_SEVERITY_ALL = 1;
    L_SEVERITY_DEBUG = 2;
    L_SEVERITY_INFO = 3;
    L_SEVERITY_WARNING = 4;
    L_SEVERITY_ERROR = 5;
    L_SEVERITY_NONE = 6;

{  No message less than the compile-time threshold will ever be
 *  reported, regardless of the current run-time threshold.  This allows
 *  selection of the set of messages to include in the library.  For
 *  example, setting the threshold to L_SEVERITY_WARNING eliminates all
 *  informational messages from the library.  With that setting, both
 *  warning and error messages would be printed unless setMsgSeverity()
 *  was called, or DEFAULT_SEVERITY was redefined, to set the run-time
 *  severity to L_SEVERITY_ERROR.  In that case, only error messages
 *  would be printed.
 *
 *  This mechanism makes the library smaller and faster, by eliminating
 *  undesired message reporting and the associated run-time overhead for
 *  message threshold checking, because code for messages whose severity
 *  is lower than MINIMUM_SEVERITY won't be generated.
 *
 *  A production library might typically permit ERROR messages to be
 *  generated, and a development library might permit DEBUG and higher.
 *  The actual messages printed (as opposed to generated) would depend
 *  on the current run-time severity threshold.
 *
 *  This is a complex mechanism and a few examples may help.
 *  (1) No output permitted under any circumstances.
 *      Use:  -DNO_CONSOLE_IO  or  -DMINIMUM_SEVERITY=6
 *  (2) Suppose you want to only allow error messages, and you don't
 *      want to permit info or warning messages at runtime.
 *      Use:  -DMINIMUM_SEVERITY=5
 *  (3) Suppose you want to only allow error messages by default,
 *      but you will permit this to be over-ridden at runtime.
 *      Use:  -DDEFAULT_SEVERITY=5
 *            and to allow info and warning override:
 *                 setMsgSeverity(L_SEVERITY_INFO);
  }
{$ifdef  NO_CONSOLE_IO}
{$undef MINIMUM_SEVERITY}
{$undef DEFAULT_SEVERITY}
{!< Compile-time default  }
  MINIMUM_SEVERITY = L_SEVERITY_NONE;  
{!< Run-time default  }
  DEFAULT_SEVERITY = L_SEVERITY_NONE;  
{$else}
{$ifndef MINIMUM_SEVERITY}
{!< Compile-time default  }

const
  MINIMUM_SEVERITY = L_SEVERITY_INFO;  
{$endif}
{$ifndef DEFAULT_SEVERITY}
{!< Run-time default  }

const
  DEFAULT_SEVERITY = MINIMUM_SEVERITY;  
{$endif}
{$endif}
{!  The run-time message severity threshold is defined in utils1.c.   }
  var
    LeptMsgSeverity : Tl_int32;cvar;external;
{
 * <pre>
 *  Usage
 *  =====
 *  Messages are of two types.
 *
 *  (1) The messages
 *      ERROR_INT(a,b,c)       : returns l_int32
 *      ERROR_FLOAT(a,b,c)     : returns l_float32
 *      ERROR_PTR(a,b,c)       : returns void*
 *  are used to return from functions and take a fixed set of parameters:
 *      a : <message string>
 *      b : procName
 *      c : <return value from function>
 *  where procName is the name of the local variable naming the function.
 *
 *  (2) The purely informational L_* messages
 *      L_ERROR(a,...)
 *      L_WARNING(a,...)
 *      L_INFO(a,...)
 *  do not take a return value, but they take at least two parameters:
 *      a  :  <message string> with optional format conversions
 *      v1 : procName    (this must be included as the first vararg)
 *      v2, ... :  optional varargs to match format converters in the message
 *
 *  To return an error from a function that returns void, use:
 *      L_ERROR(<message string>, procName, [...])
 *      return;
 *
 *  Implementation details
 *  ======================
 *  Messages are defined with the IF_SEV macro.  The first parameter is
 *  the message severity, the second is the function to call if the
 *  message is to be printed, and the third is the return value if the
 *  message is to be suppressed.  For example, we might have an
 *  informational message defined as:
 *
 *    IF_SEV(L_SEVERITY_INFO, fprintf(.......), 0)
 *
 *  The macro expands into a conditional.  Because the first comparison
 *  is between two constants, an optimizing compiler will remove either
 *  the comparison (if it's true) or the entire macro expansion (if it
 *  is false).  This means that there is no run-time overhead for
 *  messages whose severity falls below the minimum specified at compile
 *  time, and for others the overhead is one (not two) comparisons.
 *
 *  The L_nnn() macros below do not return a value, but because the
 *  conditional operator requires one for the false condition, we
 *  specify a void expression.
 * </pre>
  }
{------------------------------------------------------------------------*
 *              snprintf() renamed in MSVC (pre-VS2015)                   *
 *------------------------------------------------------------------------ }
{$endif}
{ LEPTONICA_ENVIRON_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function powf(x,y : longint) : single;
begin
  powf:=single(pow(Tdouble(x),Tdouble(y)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function expf(x : longint) : single;
begin
  expf:=single(exp(Tdouble(x)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function L_MIN(x,y : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if x<y then
    if_local1:=x
  else
    if_local1:=y;
  L_MIN:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function L_MAX(x,y : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if x>y then
    if_local1:=x
  else
    if_local1:=y;
  L_MAX:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function L_ABS(x : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if x<0 then
    if_local1:=(-(1))*x
  else
    if_local1:=x;
  L_ABS:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function L_SIGN(x : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if x<0 then
    if_local1:=-(1)
  else
    if_local1:=1;
  L_SIGN:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_MALLOC(blocksize : longint) : longint;
begin
  LEPT_MALLOC:=leptonica_malloc(blocksize);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_CALLOC(numelem,elemsize : longint) : longint;
begin
  LEPT_CALLOC:=leptonica_calloc(numelem,elemsize);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_REALLOC(ptr,blocksize : longint) : longint;
begin
  LEPT_REALLOC:=leptonica_realloc(ptr,blocksize);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_FREE(ptr : longint) : longint;
begin
  LEPT_FREE:=leptonica_free(ptr);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_MALLOC(blocksize : longint) : longint;
begin
  LEPT_MALLOC:=malloc(blocksize);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_CALLOC(numelem,elemsize : longint) : longint;
begin
  LEPT_CALLOC:=calloc(numelem,elemsize);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_REALLOC(ptr,blocksize : longint) : longint;
begin
  LEPT_REALLOC:=realloc(ptr,blocksize);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LEPT_FREE(ptr : longint) : longint;
begin
  LEPT_FREE:=free(ptr);
end;


end.
