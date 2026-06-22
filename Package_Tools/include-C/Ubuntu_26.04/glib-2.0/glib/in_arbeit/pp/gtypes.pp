
unit gtypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtypes.h
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
Pgatomicrefcount  = ^gatomicrefcount;
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
Pgconstpointer  = ^gconstpointer;
Pgdouble  = ^gdouble;
PGDoubleIEEE754  = ^GDoubleIEEE754;
Pgfloat  = ^gfloat;
PGFloatIEEE754  = ^GFloatIEEE754;
Pgint  = ^gint;
Pglong  = ^glong;
Pgpointer  = ^gpointer;
Pgrefcount  = ^grefcount;
Pgshort  = ^gshort;
PGTimeVal  = ^GTimeVal;
PGTranslateFunc  = ^GTranslateFunc;
Pguchar  = ^guchar;
Pguint  = ^guint;
Pgulong  = ^gulong;
Pgushort  = ^gushort;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{xxxxxxxxxxxxx abgleichenmit alter Version !!! }
{$ifndef __G_TYPES_H__}
{$define __G_TYPES_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glibconfig.h>}
{$include <glib/gmacros.h>}
{$include <glib/gversionmacros.h>}
{ Must be included after the 3 headers above  }
{$include <glib/glib-visibility.h>}
{$include <time.h>}
{ Provide type definitions for commonly used types.
 *  These are useful because a "gint8" can be adjusted
 *  to be 1 byte (8 bits) on all platforms. Similarly and
 *  more importantly, "gint32" can be adjusted to be
 *  4 bytes (32 bits) on all platforms.
  }
type
  Pgchar = ^Tgchar;
  Tgchar = char;

  Pgshort = ^Tgshort;
  Tgshort = smallint;
{xxxxxxxxxxxxxxxxxx }

  Pglong = ^Tglong;
  Tglong = longint;

  Pgint = ^Tgint;
  Tgint = longint;

  Pgboolean = ^Tgboolean;
  Tgboolean = Tgint;

  Pguchar = ^Tguchar;
  Tguchar = byte;

  Pgushort = ^Tgushort;
  Tgushort = word;

  Pgulong = ^Tgulong;
  Tgulong = dword;

  Pguint = ^Tguint;
  Tguint = dword;

  Pgfloat = ^Tgfloat;
  Tgfloat = single;

  Pgdouble = ^Tgdouble;
  Tgdouble = Tdouble;
{ Define min and max constants for the fixed size numerical types  }
{*
 * G_MININT8: (value -128)
 *
 * The minimum value which can be held in a #gint8.
 *
 * Since: 2.4
  }

{ was #define dname def_expr }
function G_MININT8 : Tgint8;  

{ was #define dname def_expr }
function G_MAXINT8 : Tgint8;  

{ was #define dname def_expr }
function G_MAXUINT8 : Tguint8;  

{*
 * G_MININT16: (value -32768)
 *
 * The minimum value which can be held in a #gint16.
 *
 * Since: 2.4
  }
{ was #define dname def_expr }
function G_MININT16 : Tgint16;  

{ was #define dname def_expr }
function G_MAXINT16 : Tgint16;  

{ was #define dname def_expr }
function G_MAXUINT16 : Tguint16;  

{*
 * G_MININT32: (value -2147483648)
 *
 * The minimum value which can be held in a #gint32.
 *
 * Since: 2.4
  }
{ was #define dname def_expr }
function G_MININT32 : Tgint32;  

{ was #define dname def_expr }
function G_MAXINT32 : Tgint32;  

{ was #define dname def_expr }
function G_MAXUINT32 : Tguint32;  

{*
 * G_MININT64: (value -9223372036854775808)
 *
 * The minimum value which can be held in a #gint64.
  }
{ was #define dname def_expr }
function G_MININT64 : Tgint64;  

{ was #define dname def_expr }
function G_MAXINT64 : longint; { return type might be wrong }

{ was #define dname def_expr }
function G_MAXUINT64 : longint; { return type might be wrong }

type
  Pgpointer = ^Tgpointer;
  Tgpointer = pointer;
(* Const before type ignored *)

  Pgconstpointer = ^Tgconstpointer;
  Tgconstpointer = pointer;

  TGCompareFunc = function (a:Tgconstpointer; b:Tgconstpointer):Tgint;cdecl;

  TGCompareDataFunc = function (a:Tgconstpointer; b:Tgconstpointer; user_data:Tgpointer):Tgint;cdecl;

  TGEqualFunc = function (a:Tgconstpointer; b:Tgconstpointer):Tgboolean;cdecl;
{*
 * GEqualFuncFull:
 * @a: a value
 * @b: a value to compare with
 * @user_data: user data provided by the caller
 *
 * Specifies the type of a function used to test two values for
 * equality. The function should return %TRUE if both values are equal
 * and %FALSE otherwise.
 *
 * This is a version of #GEqualFunc which provides a @user_data closure from
 * the caller.
 *
 * Returns: %TRUE if @a = @b; %FALSE otherwise
 * Since: 2.74
  }

  TGEqualFuncFull = function (a:Tgconstpointer; b:Tgconstpointer; user_data:Tgpointer):Tgboolean;cdecl;

  TGDestroyNotify = procedure (data:Tgpointer);cdecl;

  TGFunc = procedure (data:Tgpointer; user_data:Tgpointer);cdecl;

  TGHashFunc = function (key:Tgconstpointer):Tguint;cdecl;

  TGHFunc = procedure (key:Tgpointer; value:Tgpointer; user_data:Tgpointer);cdecl;
{*
 * GCopyFunc:
 * @src: (not nullable): A pointer to the data which should be copied
 * @data: Additional data
 *
 * A function of this signature is used to copy the node data
 * when doing a deep-copy of a tree.
 *
 * Returns: (not nullable): A pointer to the copy
 *
 * Since: 2.4
  }

  TGCopyFunc = function (src:Tgconstpointer; data:Tgpointer):Tgpointer;cdecl;
{*
 * GFreeFunc:
 * @data: a data pointer
 *
 * Declares a type of function which takes an arbitrary
 * data pointer argument and has no return value. It is
 * not currently used in GLib or GTK.
  }

  TGFreeFunc = procedure (data:Tgpointer);cdecl;
{*
 * GTranslateFunc:
 * @str: the untranslated string
 * @data: user data specified when installing the function, e.g.
 *  in g_option_group_set_translate_func()
 * 
 * The type of functions which are used to translate user-visible
 * strings, for <option>--help</option> output.
 * 
 * Returns: a translation of the string for the current locale.
 *  The returned string is owned by GLib and must not be freed.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  PGTranslateFunc = ^TGTranslateFunc;
  TGTranslateFunc = function (str:Pgchar; data:Tgpointer):Pgchar;cdecl;
{ Define some mathematical constants that aren't available
 * symbolically in some strict ISO C implementations.
 *
 * Note that the large number of digits used in these definitions
 * doesn't imply that GLib or current computers in general would be
 * able to handle floating point numbers with an accuracy like this.
 * It's mostly an exercise in futility and future proofing. For
 * extended precision floating point support, look somewhere else
 * than GLib.
  }

const
  G_E = 2.7182818284590452353602874713526624977572470937000;  
  G_LN2 = 0.69314718055994530941723212145817656807550013436026;  
  G_LN10 = 2.3025850929940456840179914546843642076011014886288;  
  G_PI = 3.1415926535897932384626433832795028841971693993751;  
  G_PI_2 = 1.5707963267948966192313216916397514420985846996876;  
  G_PI_4 = 0.78539816339744830961566084581987572104929234984378;  
  G_SQRT2 = 1.4142135623730950488016887242096980785696718753769;  
{ Portable endian checks and conversions
 *
 * glibconfig.h defines G_BYTE_ORDER which expands to one of
 * the below macros.
  }
  G_LITTLE_ENDIAN = 1234;  
  G_BIG_ENDIAN = 4321;  
{ unused, need specific PDP check  }  G_PDP_ENDIAN = 3412;  
{ Basic bit swapping functions
  }
type
  PGDoubleIEEE754 = ^TGDoubleIEEE754;
  TGDoubleIEEE754 = TGDoubleIEEE754;

  PGFloatIEEE754 = ^TGFloatIEEE754;
  TGFloatIEEE754 = TGFloatIEEE754;

const
  G_IEEE754_FLOAT_BIAS = 127;  
  G_IEEE754_DOUBLE_BIAS = 1023;  
{ multiply with base2 exponent to get base10 exponent (normal numbers)  }
  G_LOG_2_BASE_10 = 0.30102999566398119521;  
{$if G_BYTE_ORDER == G_LITTLE_ENDIAN}
type
  PGFloatIEEE754 = ^TGFloatIEEE754;
  TGFloatIEEE754 = record
      case longint of
        0 : ( v_float : Tgfloat );
        1 : ( mpn : record
            flag0 : longint;
          end );
      end;


const
  bm_TGFloatIEEE754_mantissa = $7FFFFF;
  bp_TGFloatIEEE754_mantissa = 0;
  bm_TGFloatIEEE754_biased_exponent = $7F800000;
  bp_TGFloatIEEE754_biased_exponent = 23;
  bm_TGFloatIEEE754_sign = $80000000;
  bp_TGFloatIEEE754_sign = 31;

type
  PGDoubleIEEE754 = ^TGDoubleIEEE754;
  TGDoubleIEEE754 = record
      case longint of
        0 : ( v_double : Tgdouble );
        1 : ( mpn : record
            flag0 : longint;
            flag1 : longint;
          end );
      end;


const
  bm_TGDoubleIEEE754_mantissa_low = $FFFFFFFF;
  bp_TGDoubleIEEE754_mantissa_low = 0;
  bm_TGDoubleIEEE754_mantissa_high = $FFFFF;
  bp_TGDoubleIEEE754_mantissa_high = 0;
  bm_TGDoubleIEEE754_biased_exponent = $7FF00000;
  bp_TGDoubleIEEE754_biased_exponent = 20;
  bm_TGDoubleIEEE754_sign = $80000000;
  bp_TGDoubleIEEE754_sign = 31;

(*** was #elif ****){$else G_BYTE_ORDER == G_BIG_ENDIAN}
type
  PGFloatIEEE754 = ^TGFloatIEEE754;
  TGFloatIEEE754 = record
      case longint of
        0 : ( v_float : Tgfloat );
        1 : ( mpn : record
            flag0 : longint;
          end );
      end;


const
  bm_TGFloatIEEE754_sign = $1;
  bp_TGFloatIEEE754_sign = 0;
  bm_TGFloatIEEE754_biased_exponent = $1FE;
  bp_TGFloatIEEE754_biased_exponent = 1;
  bm_TGFloatIEEE754_mantissa = $FFFFFE00;
  bp_TGFloatIEEE754_mantissa = 9;

type
  PGDoubleIEEE754 = ^TGDoubleIEEE754;
  TGDoubleIEEE754 = record
      case longint of
        0 : ( v_double : Tgdouble );
        1 : ( mpn : record
            flag0 : longint;
            flag1 : longint;
          end );
      end;


const
  bm_TGDoubleIEEE754_sign = $1;
  bp_TGDoubleIEEE754_sign = 0;
  bm_TGDoubleIEEE754_biased_exponent = $FFE;
  bp_TGDoubleIEEE754_biased_exponent = 1;
  bm_TGDoubleIEEE754_mantissa_high = $FFFFF000;
  bp_TGDoubleIEEE754_mantissa_high = 12;
  bm_TGDoubleIEEE754_mantissa_low = $FFFFFFFF;
  bp_TGDoubleIEEE754_mantissa_low = 0;

{$else}
{ !G_LITTLE_ENDIAN && !G_BIG_ENDIAN  }
{$error unknown ENDIAN type}
{$endif}
{ !G_LITTLE_ENDIAN && !G_BIG_ENDIAN  }
type
  PGTimeVal = ^TGTimeVal;
  TGTimeVal = record
      tv_sec : Tglong;
      tv_usec : Tglong;
    end;


  Pgrefcount = ^Tgrefcount;
  Tgrefcount = Tgint;

  Pgatomicrefcount = ^Tgatomicrefcount;
  Tgatomicrefcount = Tgint;
{ should be accessed only using atomics  }
{$endif}
{ __G_TYPES_H__  }

implementation

{ was #define dname def_expr }
function G_MININT8 : Tgint8;
  begin
    G_MININT8:=Tgint8((-(G_MAXINT8))-1);
  end;

{ was #define dname def_expr }
function G_MAXINT8 : Tgint8;
  begin
    G_MAXINT8:=Tgint8($7f);
  end;

{ was #define dname def_expr }
function G_MAXUINT8 : Tguint8;
  begin
    G_MAXUINT8:=Tguint8($ff);
  end;

{ was #define dname def_expr }
function G_MININT16 : Tgint16;
  begin
    G_MININT16:=Tgint16((-(G_MAXINT16))-1);
  end;

{ was #define dname def_expr }
function G_MAXINT16 : Tgint16;
  begin
    G_MAXINT16:=Tgint16($7fff);
  end;

{ was #define dname def_expr }
function G_MAXUINT16 : Tguint16;
  begin
    G_MAXUINT16:=Tguint16($ffff);
  end;

{ was #define dname def_expr }
function G_MININT32 : Tgint32;
  begin
    G_MININT32:=Tgint32((-(G_MAXINT32))-1);
  end;

{ was #define dname def_expr }
function G_MAXINT32 : Tgint32;
  begin
    G_MAXINT32:=Tgint32($7fffffff);
  end;

{ was #define dname def_expr }
function G_MAXUINT32 : Tguint32;
  begin
    G_MAXUINT32:=Tguint32($ffffffff);
  end;

{ was #define dname def_expr }
function G_MININT64 : Tgint64;
  begin
    G_MININT64:=Tgint64((-(G_MAXINT64))-(G_GINT64_CONSTANT(1)));
  end;

{ was #define dname def_expr }
function G_MAXINT64 : longint; { return type might be wrong }
  begin
    G_MAXINT64:=G_GINT64_CONSTANT($7fffffffffffffff);
  end;

{ was #define dname def_expr }
function G_MAXUINT64 : longint; { return type might be wrong }
  begin
    G_MAXUINT64:=G_GUINT64_CONSTANT($ffffffffffffffff);
  end;


end.
