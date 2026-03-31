unit plplot;

interface

uses
  fp_plplot;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  Macros and prototypes for the PLplot package.  This header file must }
{  be included by all user codes. }
{ }
{  Note: some systems allow the Fortran & C namespaces to clobber each }
{  other.  So for PLplot to work from Fortran, we do some rather nasty }
{  things to the externally callable C function names.  This shouldn't }
{  affect any user programs in C as long as this file is included. }
{ }
{ Copyright (C) 1992 Tony Richardson. }
{ Copyright (C) 1992-2001 Geoffrey Furnish }
{ Copyright (C) 1992-2002 Maurice LeBrun }
{ Copyright (C) 1996 Rady Shouman }
{ Copyright (C) 2000-2019 Alan W. Irwin }
{ Copyright (C) 2001-2003 Joao Cardoso }
{ Copyright (C) 2001-2005 Rafael Laboissiere }
{ Copyright (C) 2004-2013 Andrew Ross }
{ Copyright (C) 2005-2008 Arjen Markus }
{ Copyright (C) 2006-2011 Hazen Babcock }
{ Copyright (C) 2008-2009 Werner Smekal }
{ Copyright (C) 2009-2013 Hezekiah M. Carty }
{ Copyright (C) 2013 Jerry Bauck }
{ Copyright (C) 2014-2018 Phil Rosenberg }
{  This file is part of PLplot. }
{ }
{  PLplot is free software; you can redistribute it and/or modify }
{  it under the terms of the GNU Library General Public License as published }
{  by the Free Software Foundation; either version 2 of the License, or }
{  (at your option) any later version. }
{ }
{  PLplot is distributed in the hope that it will be useful, }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{  GNU Library General Public License for more details. }
{ }
{  You should have received a copy of the GNU Library General Public License }
{  along with PLplot; if not, write to the Free Software }
{  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA }
{ }
{$ifndef __PLPLOT_H__}
{$define __PLPLOT_H__}
{$include "plConfig.h"}
{-------------------------------------------------------------------------- }
{    USING PLplot }
{ }
{ To use PLplot from C or C++, it is only necessary to }
{ }
{      #include "plplot.h" }
{ }
{ This file does all the necessary setup to make PLplot accessible to }
{ your program as documented in the manual.  Additionally, this file }
{ allows you to request certain behavior by defining certain symbols }
{ before inclusion.  At the moment the only one is: }
{ }
{ #define DOUBLE	or.. }
{ #define PL_DOUBLE }
{ }
{ This causes PLplot to use doubles instead of floats.  Use the type }
{ PLFLT everywhere in your code, and it will always be the right thing. }
{ }
{ Note: most of the functions visible here begin with "pl", while all }
{ of the data types and switches begin with "PL".  Eventually everything }
{ will conform to this rule in order to keep namespace pollution of the }
{ user code to a minimum.  All the PLplot source files actually include }
{ "plplotP.h", which includes this file as well as all the internally- }
{ visible declarations, etc. }
{-------------------------------------------------------------------------- }
{ The majority of PLplot source files require these, so.. }
{ Under ANSI C, they can be included any number of times. }
{$include <stdio.h>}
{$include <stdlib.h>}
{-------------------------------------------------------------------------- }
{        SYSTEM IDENTIFICATION }
{ }
{ Several systems are supported directly by PLplot.  In order to avoid }
{ confusion, one id macro per system is used.  Since different compilers }
{ may predefine different system id macros, we need to check all the }
{ possibilities, and then set the one we will be referencing.  These are: }
{ }
{ __cplusplus                Any C++ compiler }
{ __unix                     Any Unix-like system }
{ __hpux                     Any HP/UX system }
{ __aix                      Any AIX system }
{ __linux                    Linux for i386 }
{ (others...) }
{ }
{-------------------------------------------------------------------------- }
{-------------------------------------------------------------------------- }
{ Base types for PLplot }
{ }
{ Only those that are necessary for function prototypes are defined here. }
{ Notes: }
{ }
{ short is currently used for device page coordinates, so they are }
{ bounded by (-32767, 32767).  This gives a max resolution of about 3000 }
{ dpi, and improves performance in some areas over using a PLINT. }
{ }
{ PLUNICODE should be a 32-bit unsigned integer on all platforms. }
{ For now, we are using unsigned int for our Linux ix86 unicode experiments, }
{ but that doesn't guarantee 32 bits exactly on all platforms so this will }
{ be subject to change. }
{-------------------------------------------------------------------------- }
{$if defined ( PL_DOUBLE ) || defined ( DOUBLE )}
type
  PPLFLT = ^TPLFLT;
  TPLFLT = Tdouble;

const
  PLFLT_MAX = DBL_MAX;  
  PLFLT_MIN = DBL_MIN;  
  PLFLT_HUGE_VAL = HUGE_VAL;  
{$else}
type
  PPLFLT = ^TPLFLT;
  TPLFLT = single;

const
  PLFLT_MAX = FLT_MAX;  
  PLFLT_MIN = FLT_MIN;  
  PLFLT_HUGE_VAL = HUGE_VALF;  
{$endif}
type
  PPLUINT = ^TPLUINT;
  TPLUINT = Tuint32_t;

  PPLINT = ^TPLINT;
  TPLINT = Tint32_t;

  PPLINT64 = ^TPLINT64;
  TPLINT64 = Tint64_t;

const
  PLINT_MIN = INT32_MIN;  
  PLINT_MAX = INT32_MAX;  
{$else}
{ A reasonable back-up in case stdint.h does not exist on the platform. }
type
  PPLUINT = ^TPLUINT;
  TPLUINT = dword;

  PPLINT = ^TPLINT;
  TPLINT = longint;

  PPLINT64 = ^TPLINT64;
  TPLINT64 = int64;
{ for Visual C++ 2003 and later INT_MIN must be used, otherwise }
{  PLINT_MIN is unsigned and 2147483648 NOT -2147483648, see }
{  http://msdn.microsoft.com/en-us/library/4kh09110(VS.71).aspx for }
{  details }
{$if defined ( _MSC_VER ) && _MSC_VER >= 1310}
{$include <Limits.h>}

const
  PLINT_MIN = INT_MIN;  
{$else}

const
  PLINT_MIN = -(2147483648);  
{$endif}
{ }
{ typedef unsigned int PLUINT; }
{ typedef int PLINT; }
{ typedef long long PLINT64; }
{ }
{$endif}
{ For identifying unicode characters }
type
  PPLUNICODE = ^TPLUNICODE;
  TPLUNICODE = TPLUINT;
{ For identifying logical (boolean) arguments }

  PPLBOOL = ^TPLBOOL;
  TPLBOOL = TPLINT;
{ typedefs for generic pointers. }
{ generic pointer to mutable object: }

  PPLPointer = ^TPLPointer;
  TPLPointer = pointer;
{ PLFLT first element pointers which are used to point to the first }
{ element of a contigous block of memory containing a PLFLT array with }
{ an arbitrary number of dimensions. }
{ mutable version }

  PPLFLT_NC_FE_POINTER = ^TPLFLT_NC_FE_POINTER;
  TPLFLT_NC_FE_POINTER = PPLFLT;
{ immutable version }

  PPLFLT_FE_POINTER = ^TPLFLT_FE_POINTER;
  TPLFLT_FE_POINTER = PPLFLT;
{ typedefs that are typically used for passing scalar, vector, and }
{ matrix arguments to functions.  The NC attribute concerns pointers }
{ to mutable objects, where the objects are used for passing values }
{ that are either output only or both input and output.  Pointers whose }
{ name does not contain the NC attribute point to immutable objects }
{ which are strictly input and guaranteed to be unchanged by the function. }
{ }
{ Pointers to mutable scalars: }

  PPLINT_NC_SCALAR = ^TPLINT_NC_SCALAR;
  TPLINT_NC_SCALAR = PPLINT;

  PPLBOOL_NC_SCALAR = ^TPLBOOL_NC_SCALAR;
  TPLBOOL_NC_SCALAR = PPLBOOL;

  PPLUNICODE_NC_SCALAR = ^TPLUNICODE_NC_SCALAR;
  TPLUNICODE_NC_SCALAR = PPLUNICODE;

  PPLCHAR_NC_SCALAR = ^TPLCHAR_NC_SCALAR;
  TPLCHAR_NC_SCALAR = Pchar;

  PPLFLT_NC_SCALAR = ^TPLFLT_NC_SCALAR;
  TPLFLT_NC_SCALAR = PPLFLT;
{ Pointers to mutable vectors: }

  PPLINT_NC_VECTOR = ^TPLINT_NC_VECTOR;
  TPLINT_NC_VECTOR = PPLINT;

  PPLCHAR_NC_VECTOR = ^TPLCHAR_NC_VECTOR;
  TPLCHAR_NC_VECTOR = Pchar;

  PPLFLT_NC_VECTOR = ^TPLFLT_NC_VECTOR;
  TPLFLT_NC_VECTOR = PPLFLT;
{ Pointers to immutable vectors: }

  PPLINT_VECTOR = ^TPLINT_VECTOR;
  TPLINT_VECTOR = PPLINT;

  PPLBOOL_VECTOR = ^TPLBOOL_VECTOR;
  TPLBOOL_VECTOR = PPLBOOL;

  PPLCHAR_VECTOR = ^TPLCHAR_VECTOR;
  TPLCHAR_VECTOR = Pchar;

  PPLFLT_VECTOR = ^TPLFLT_VECTOR;
  TPLFLT_VECTOR = PPLFLT;
{ Pointers to mutable 2-dimensional matrices: }

  PPLCHAR_NC_MATRIX = ^TPLCHAR_NC_MATRIX;
  TPLCHAR_NC_MATRIX = ^Pchar;

  PPLFLT_NC_MATRIX = ^TPLFLT_NC_MATRIX;
  TPLFLT_NC_MATRIX = ^PPLFLT;
{ Pointers to immutable 2-dimensional matrices, }
{ (i.e., pointers to const pointers to const values): }

  PPLCHAR_MATRIX = ^TPLCHAR_MATRIX;
  TPLCHAR_MATRIX = ^Pchar;

  PPLFLT_MATRIX = ^TPLFLT_MATRIX;
  TPLFLT_MATRIX = ^PPLFLT;
{ Callback-related typedefs }

  TPLMAPFORM_callback = procedure (n:TPLINT; x:TPLFLT_NC_VECTOR; y:TPLFLT_NC_VECTOR);cdecl;

  TPLTRANSFORM_callback = procedure (x:TPLFLT; y:TPLFLT; xp:TPLFLT_NC_SCALAR; yp:TPLFLT_NC_SCALAR; data:TPLPointer);cdecl;

  TPLLABEL_FUNC_callback = procedure (axis:TPLINT; value:TPLFLT; _label:TPLCHAR_NC_VECTOR; length:TPLINT; data:TPLPointer);cdecl;

  TPLF2EVAL_callback = function (ix:TPLINT; iy:TPLINT; data:TPLPointer):TPLFLT;cdecl;

  TPLFILL_callback = procedure (n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR);cdecl;

  TPLDEFINED_callback = function (x:TPLFLT; y:TPLFLT):TPLINT;cdecl;
{-------------------------------------------------------------------------- }
{ Complex data types and other good stuff }
{-------------------------------------------------------------------------- }
{ Switches for escape function call. }
{ Some of these are obsolete but are retained in order to process }
{ old metafiles }

const
  PLESC_SET_RGB = 1;  { obsolete }
  PLESC_ALLOC_NCOL = 2;  { obsolete }
  PLESC_SET_LPB = 3;  { obsolete }
  PLESC_EXPOSE = 4;  { handle window expose }
  PLESC_RESIZE = 5;  { handle window resize }
  PLESC_REDRAW = 6;  { handle window redraw }
  PLESC_TEXT = 7;  { switch to text screen }
  PLESC_GRAPH = 8;  { switch to graphics screen }
  PLESC_FILL = 9;  { fill polygon }
  PLESC_DI = 10;  { handle DI command }
  PLESC_FLUSH = 11;  { flush output }
  PLESC_EH = 12;  { handle Window events }
  PLESC_GETC = 13;  { get cursor position }
  PLESC_SWIN = 14;  { set window parameters }
  PLESC_DOUBLEBUFFERING = 15;  { configure double buffering }
  PLESC_XORMOD = 16;  { set xor mode }
  PLESC_SET_COMPRESSION = 17;  { AFR: set compression }
  PLESC_CLEAR = 18;  { RL: clear graphics region }
  PLESC_DASH = 19;  { RL: draw dashed line }
  PLESC_HAS_TEXT = 20;  { driver draws text }
  PLESC_IMAGE = 21;  { handle image }
  PLESC_IMAGEOPS = 22;  { plimage related operations }
  PLESC_PL2DEVCOL = 23;  { convert PLColor to device color }
  PLESC_DEV2PLCOL = 24;  { convert device color to PLColor }
  PLESC_SETBGFG = 25;  { set BG, FG colors }
  PLESC_DEVINIT = 26;  { alternate device initialization }
  PLESC_GETBACKEND = 27;  { get used backend of (wxWidgets) driver - no longer used }
  PLESC_BEGIN_TEXT = 28;  { get ready to draw a line of text }
  PLESC_TEXT_CHAR = 29;  { render a character of text }
  PLESC_CONTROL_CHAR = 30;  { handle a text control character (super/subscript, etc.) }
  PLESC_END_TEXT = 31;  { finish a drawing a line of text }
  PLESC_START_RASTERIZE = 32;  { start rasterized rendering }
  PLESC_END_RASTERIZE = 33;  { end rasterized rendering }
  PLESC_ARC = 34;  { render an arc }
  PLESC_GRADIENT = 35;  { render a gradient }
  PLESC_MODESET = 36;  { set drawing mode }
  PLESC_MODEGET = 37;  { get drawing mode }
  PLESC_FIXASPECT = 38;  { set or unset fixing the aspect ratio of the plot }
  PLESC_IMPORT_BUFFER = 39;  { set the contents of the buffer to a specified byte string }
  PLESC_APPEND_BUFFER = 40;  { append the given byte string to the buffer }
  PLESC_FLUSH_REMAINING_BUFFER = 41;  { flush the remaining buffer e.g. after new data was appended }
{ Alternative unicode text handling control characters }
  PLTEXT_FONTCHANGE = 0;  { font change in the text stream }
  PLTEXT_SUPERSCRIPT = 1;  { superscript in the text stream }
  PLTEXT_SUBSCRIPT = 2;  { subscript in the text stream }
  PLTEXT_BACKCHAR = 3;  { back-char in the text stream }
  PLTEXT_OVERLINE = 4;  { toggle overline in the text stream }
  PLTEXT_UNDERLINE = 5;  { toggle underline in the text stream }
{ image operations }
  ZEROW2B = 1;  
  ZEROW2D = 2;  
  ONEW2B = 3;  
  ONEW2D = 4;  
{ Window parameter tags }
  PLSWIN_DEVICE = 1;  { device coordinates }
  PLSWIN_WORLD = 2;  { world coordinates }
{ Axis label tags }
  PL_X_AXIS = 1;  { The x-axis }
  PL_Y_AXIS = 2;  { The y-axis }
  PL_Z_AXIS = 3;  { The z-axis }
{ PLplot Option table & support constants }
{ Option-specific settings }
  PL_OPT_ENABLED = $0001;  { Obsolete }
  PL_OPT_ARG = $0002;  { Option has an argument }
  PL_OPT_NODELETE = $0004;  { Don't delete after processing }
  PL_OPT_INVISIBLE = $0008;  { Make invisible }
  PL_OPT_DISABLED = $0010;  { Processing is disabled }
{ Option-processing settings -- mutually exclusive }
  PL_OPT_FUNC = $0100;  { Call handler function }
  PL_OPT_BOOL = $0200;  { Set *var = 1 }
  PL_OPT_INT = $0400;  { Set *var = atoi(optarg) }
  PL_OPT_FLOAT = $0800;  { Set *var = atof(optarg) }
  PL_OPT_STRING = $1000;  { Set var = optarg }
{ Global mode settings }
{ These override per-option settings }
  PL_PARSE_PARTIAL = $0000;  { For backward compatibility }
  PL_PARSE_FULL = $0001;  { Process fully & exit if error }
  PL_PARSE_QUIET = $0002;  { Don't issue messages }
  PL_PARSE_NODELETE = $0004;  { Don't delete options after }
{ processing }
  PL_PARSE_SHOWALL = $0008;  { Show invisible options }
  PL_PARSE_OVERRIDE = $0010;  { Obsolete }
  PL_PARSE_NOPROGRAM = $0020;  { Program name NOT in *argv[0].. }
  PL_PARSE_NODASH = $0040;  { Set if leading dash NOT required }
  PL_PARSE_SKIP = $0080;  { Skip over unrecognized args }
{ FCI (font characterization integer) related constants. }
  PL_FCI_MARK = $80000000;  
  PL_FCI_IMPOSSIBLE = $00000000;  
  PL_FCI_HEXDIGIT_MASK = $f;  
  PL_FCI_HEXPOWER_MASK = $7;  
  PL_FCI_HEXPOWER_IMPOSSIBLE = $f;  
{ These define hexpower values corresponding to each font attribute. }
  PL_FCI_FAMILY = $0;  
  PL_FCI_STYLE = $1;  
  PL_FCI_WEIGHT = $2;  
{ These are legal values for font family attribute }
  PL_FCI_SANS = $0;  
  PL_FCI_SERIF = $1;  
  PL_FCI_MONO = $2;  
  PL_FCI_SCRIPT = $3;  
  PL_FCI_SYMBOL = $4;  
{ These are legal values for font style attribute }
  PL_FCI_UPRIGHT = $0;  
  PL_FCI_ITALIC = $1;  
  PL_FCI_OBLIQUE = $2;  
{ These are legal values for font weight attribute }
  PL_FCI_MEDIUM = $0;  
  PL_FCI_BOLD = $1;  
{ Option table definition }
type
  PPLOptionTable = ^TPLOptionTable;
  TPLOptionTable = record
      opt : TPLCHAR_VECTOR;
      handler : function (para1:TPLCHAR_VECTOR; para2:TPLCHAR_VECTOR; para3:TPLPointer):longint;cdecl;
      client_data : TPLPointer;
      var : TPLPointer;
      mode : longint;
      syntax : TPLCHAR_VECTOR;
      desc : TPLCHAR_VECTOR;
    end;
{ PLplot Graphics Input structure }

const
  PL_MAXKEY = 16;  
{Masks for use with PLGraphicsIn::state }
{These exactly coincide with the X11 masks }
{from X11/X.h, however the values 1<<3 to }
{1<<7 aparently may vary depending upon }
{X implementation and keyboard }
{ Numerical #defines are parsed further to help determine }
{ additional files such as ../bindings/swig-support/plplotcapi.i }
{ so must #define numerical #defines with numbers rather than C operators }
{ such as <<. }
  PL_MASK_SHIFT = $1;  { ( 1 << 0 ) }
  PL_MASK_CAPS = $2;  { ( 1 << 1 ) }
  PL_MASK_CONTROL = $4;  { ( 1 << 2 ) }
  PL_MASK_ALT = $8;  { ( 1 << 3 ) }
  PL_MASK_NUM = $10;  { ( 1 << 4 ) }
  PL_MASK_ALTGR = $20;  {  ( 1 << 5 ) }
  PL_MASK_WIN = $40;  { ( 1 << 6 ) }
  PL_MASK_SCROLL = $80;  { ( 1 << 7 ) }
  PL_MASK_BUTTON1 = $100;  { ( 1 << 8 ) }
  PL_MASK_BUTTON2 = $200;  { ( 1 << 9 ) }
  PL_MASK_BUTTON3 = $400;  { ( 1 << 10 ) }
  PL_MASK_BUTTON4 = $800;  { ( 1 << 11 ) }
  PL_MASK_BUTTON5 = $1000;  { ( 1 << 12 ) }
{ of event (CURRENTLY UNUSED) }
{ key or button mask }
{ key selected }
{ mouse button selected }
{ subwindow (alias subpage, alias subplot) number }
{ translated string }
{ absolute device coordinates of pointer }
{ relative device coordinates of pointer }
{ world coordinates of pointer }
type
  PPLGraphicsIn = ^TPLGraphicsIn;
  TPLGraphicsIn = record
      _type : longint;
      state : dword;
      keysym : dword;
      button : dword;
      subwindow : TPLINT;
      _string : array[0..(PL_MAXKEY)-1] of char;
      pX : longint;
      pY : longint;
      dX : TPLFLT;
      dY : TPLFLT;
      wX : TPLFLT;
      wY : TPLFLT;
    end;
{ Structure for describing the plot window }

const
  PL_MAXWINDOWS = 64;  { Max number of windows/page tracked }
{ min, max window rel dev coords }
{ min, max window world coords }
type
  PPLWindow = ^TPLWindow;
  TPLWindow = record
      dxmi : TPLFLT;
      dxma : TPLFLT;
      dymi : TPLFLT;
      dyma : TPLFLT;
      wxmi : TPLFLT;
      wxma : TPLFLT;
      wymi : TPLFLT;
      wyma : TPLFLT;
    end;
{ Structure for doing display-oriented operations via escape commands }
{ May add other attributes in time }
{ upper left hand corner }
{ window dimensions }

  PPLDisplay = ^TPLDisplay;
  TPLDisplay = record
      x : dword;
      y : dword;
      width : dword;
      height : dword;
    end;
{ Macro used (in some cases) to ignore value of argument }
{ I don't plan on changing the value so you can hard-code it }

const
  PL_NOTSET = -(42);  
{ See plcont.c for examples of the following }
{ }
{ PLfGrid is for passing (as a pointer to the first element) an arbitrarily }
{ dimensioned array.  The grid dimensions MUST be stored, with a maximum of 3 }
{ dimensions assumed for now. }
{ }
type
  PPLfGrid = ^TPLfGrid;
  TPLfGrid = record
      f : TPLFLT_FE_POINTER;
      nx : TPLINT;
      ny : TPLINT;
      nz : TPLINT;
    end;
{ }
{ PLfGrid2 is for passing (as an array of pointers) a 2d function array.  The }
{ grid dimensions are passed for possible bounds checking. }
{ }

  PPLfGrid2 = ^TPLfGrid2;
  TPLfGrid2 = record
      f : TPLFLT_NC_MATRIX;
      nx : TPLINT;
      ny : TPLINT;
    end;
{ }
{ NOTE: a PLfGrid3 is a good idea here but there is no way to exploit it yet }
{ so I'll leave it out for now. }
{ }
{ }
{ PLcGrid is for passing (as a pointer to the first element) arbitrarily }
{ dimensioned coordinate transformation arrays.  The grid dimensions MUST be }
{ stored, with a maximum of 3 dimensions assumed for now. }
{ }

  PPLcGrid = ^TPLcGrid;
  TPLcGrid = record
      xg : TPLFLT_NC_FE_POINTER;
      yg : TPLFLT_NC_FE_POINTER;
      zg : TPLFLT_NC_FE_POINTER;
      nx : TPLINT;
      ny : TPLINT;
      nz : TPLINT;
    end;
{ }
{ PLcGrid2 is for passing (as arrays of pointers) 2d coordinate }
{ transformation arrays.  The grid dimensions are passed for possible bounds }
{ checking. }
{ }

  PPLcGrid2 = ^TPLcGrid2;
  TPLcGrid2 = record
      xg : TPLFLT_NC_MATRIX;
      yg : TPLFLT_NC_MATRIX;
      zg : TPLFLT_NC_MATRIX;
      nx : TPLINT;
      ny : TPLINT;
    end;
{ }
{ NOTE: a PLcGrid3 is a good idea here but there is no way to exploit it yet }
{ so I'll leave it out for now. }
{ }
{ Color limits: }
{ Default number of colors for cmap0 and cmap1. }

const
  PL_DEFAULT_NCOL0 = 16;  
  PL_DEFAULT_NCOL1 = 128;  
{ minimum and maximum PLINT RGB values. }
  MIN_PLINT_RGB = 0;  
  MAX_PLINT_RGB = 255;  
{ minimum and maximum PLFLT cmap1 color index values. }
  MIN_PLFLT_CMAP1 = 0.0;  
  MAX_PLFLT_CMAP1 = 1.0;  
{ minimum and maximum PLFLT alpha values. }
  MIN_PLFLT_ALPHA = 0.0;  
  MAX_PLFLT_ALPHA = 1.0;  
{ PLColor is the usual way to pass an rgb color value. }
{ red }
{ green }
{ blue }
{ alpha (or transparency) }
type
  PPLColor = ^TPLColor;
  TPLColor = record
      r : byte;
      g : byte;
      b : byte;
      a : TPLFLT;
      name : TPLCHAR_VECTOR;
    end;
{ PLControlPt is how cmap1 control points are represented. }
{ hue or red }
{ lightness or green }
{ saturation or blue }
{ position }
{ alpha (or transparency) }
{ if set, interpolate through h=0 }

  PPLControlPt = ^TPLControlPt;
  TPLControlPt = record
      c1 : TPLFLT;
      c2 : TPLFLT;
      c3 : TPLFLT;
      p : TPLFLT;
      a : TPLFLT;
      alt_hue_path : longint;
    end;
{ A PLBufferingCB is a control block for interacting with devices }
{ that support double buffering. }

  PPLBufferingCB = ^TPLBufferingCB;
  TPLBufferingCB = record
      cmd : TPLINT;
      result : TPLINT;
    end;

const
  PLESC_DOUBLEBUFFERING_ENABLE = 1;  
  PLESC_DOUBLEBUFFERING_DISABLE = 2;  
  PLESC_DOUBLEBUFFERING_QUERY = 3;  
type
  PPLLabelDefaults = ^TPLLabelDefaults;
  TPLLabelDefaults = record
      exp_label_disp : TPLFLT;
      exp_label_pos : TPLFLT;
      exp_label_just : TPLFLT;
    end;
{ }
{ typedefs for access methods for arbitrary (i.e. user defined) data storage }
{ }
{ }
{ This type of struct holds pointers to functions that are used to }
{ get, set, modify, and test individual 2-D data points referenced by }
{ a PLPointer or PLPointer.  How these }
{ generic pointers are used depends entirely on the functions }
{ that implement the various operations.  Certain common data }
{ representations have predefined instances of this structure }
{ prepopulated with pointers to predefined functions. }
{ }
{ }
{ f2eval is backwards compatible signature for "f2eval" functions that }
{ existed before plf2ops "operator function families" were used. }
{ }

  Pplf2ops_t = ^Tplf2ops_t;
  Tplf2ops_t = record
      get : function (p:TPLPointer; ix:TPLINT; iy:TPLINT):TPLFLT;cdecl;
      set : function (p:TPLPointer; ix:TPLINT; iy:TPLINT; z:TPLFLT):TPLFLT;cdecl;
      add : function (p:TPLPointer; ix:TPLINT; iy:TPLINT; z:TPLFLT):TPLFLT;cdecl;
      sub : function (p:TPLPointer; ix:TPLINT; iy:TPLINT; z:TPLFLT):TPLFLT;cdecl;
      mul : function (p:TPLPointer; ix:TPLINT; iy:TPLINT; z:TPLFLT):TPLFLT;cdecl;
      div : function (p:TPLPointer; ix:TPLINT; iy:TPLINT; z:TPLFLT):TPLFLT;cdecl;
      is_nan : function (p:TPLPointer; ix:TPLINT; iy:TPLINT):TPLINT;cdecl;
      minmax : procedure (p:TPLPointer; nx:TPLINT; ny:TPLINT; zmin:TPLFLT_NC_SCALAR; zmax:TPLFLT_NC_SCALAR);cdecl;
      f2eval : function (ix:TPLINT; iy:TPLINT; p:TPLPointer):TPLFLT;cdecl;
    end;
{ }
{ A typedef to facilitate declaration of a pointer to a plfops_t structure. }
{ }

  PPLF2OPS = ^TPLF2OPS;
  TPLF2OPS = Pplf2ops_t;
{ }
{ A struct to pass a buffer around }
{ }

  Pplbuffer = ^Tplbuffer;
  Tplbuffer = record
      size : Tsize_t;
      buffer : TPLPointer;
    end;
{-------------------------------------------------------------------------- }
{		BRAINDEAD-ness }
{ }
{ Some systems allow the Fortran & C namespaces to clobber each other. }
{ For PLplot to work from Fortran on these systems, we must name the the }
{ externally callable C functions something other than their Fortran entry }
{ names.  In order to make this as easy as possible for the casual user, }
{ yet reversible to those who abhor my solution, I have done the }
{ following: }
{ }
{	The C-language bindings are actually different from those }
{	described in the manual.  Macros are used to convert the }
{	documented names to the names used in this package.  The }
{	user MUST include plplot.h in order to get the name }
{	redefinition correct. }
{ }
{ Sorry to have to resort to such an ugly kludge, but it is really the }
{ best way to handle the situation at present.  If all available }
{ compilers offer a way to correct this stupidity, then perhaps we can }
{ eventually reverse it. }
{ }
{ If you feel like screaming at someone (I sure do), please }
{ direct it at your nearest system vendor who has a braindead shared }
{ C/Fortran namespace.  Some vendors do offer compiler switches that }
{ change the object names, but then everybody who wants to use the }
{ package must throw these same switches, leading to no end of trouble. }
{ }
{ Note that this definition should not cause any noticable effects except }
{ when debugging PLplot calls, in which case you will need to remember }
{ the real function names (same as before but with a 'c_' prepended). }
{ }
{ Also, to avoid macro conflicts, the BRAINDEAD part must not be expanded }
{ in the stub routines. }
{ }
{ Aside: the reason why a shared Fortran/C namespace is deserving of the }
{ BRAINDEAD characterization is that it completely precludes the the kind }
{ of universal API that is attempted (more or less) with PLplot, without }
{ Herculean efforts (e.g. remapping all of the C bindings by macros as }
{ done here).  The vendors of such a scheme, in order to allow a SINGLE }
{ type of argument to be passed transparently between C and Fortran, }
{ namely, a pointer to a conformable data type, have slammed the door on }
{ insertion of stub routines to handle the conversions needed for other }
{ data types.  Intelligent linkers could solve this problem, but these are }
{ not anywhere close to becoming universal.  So meanwhile, one must live }
{ with either stub routines for the inevitable data conversions, or a }
{ different API.  The former is what is used here, but is made far more }
{ difficult in a braindead shared Fortran/C namespace. }
{-------------------------------------------------------------------------- }
{$ifndef BRAINDEAD}
{$define BRAINDEAD}
{$endif}
{$ifdef BRAINDEAD}
{$ifndef __PLSTUBS_H__   // i.e. do not expand this in the stubs}

const
  pl_setcontlabelformat = c_pl_setcontlabelformat;  
  pl_setcontlabelparam = c_pl_setcontlabelparam;  
  pladv = c_pladv;  
  plarc = c_plarc;  
  plaxes = c_plaxes;  
  plbin = c_plbin;  
  plbop = c_plbop;  
  plbox = c_plbox;  
  plbox3 = c_plbox3;  
  plbtime = c_plbtime;  
  plcalc_world = c_plcalc_world;  
  plclear = c_plclear;  
  plcol0 = c_plcol0;  
  plcol1 = c_plcol1;  
  plcolorbar = c_plcolorbar;  
  plconfigtime = c_plconfigtime;  
  plcont = c_plcont;  
  plcpstrm = c_plcpstrm;  
  plctime = c_plctime;  
  plend = c_plend;  
  plend1 = c_plend1;  
  plenv = c_plenv;  
  plenv0 = c_plenv0;  
  pleop = c_pleop;  
  plerrx = c_plerrx;  
  plerry = c_plerry;  
  plfamadv = c_plfamadv;  
  plfill = c_plfill;  
  plfill3 = c_plfill3;  
  plflush = c_plflush;  
  plfont = c_plfont;  
  plfontld = c_plfontld;  
  plgchr = c_plgchr;  
  plgcmap1_range = c_plgcmap1_range;  
  plgcol0 = c_plgcol0;  
  plgcol0a = c_plgcol0a;  
  plgcolbg = c_plgcolbg;  
  plgcolbga = c_plgcolbga;  
  plgcompression = c_plgcompression;  
  plgdev = c_plgdev;  
  plgdidev = c_plgdidev;  
  plgdiori = c_plgdiori;  
  plgdiplt = c_plgdiplt;  
  plgdrawmode = c_plgdrawmode;  
  plgfam = c_plgfam;  
  plgfci = c_plgfci;  
  plgfnam = c_plgfnam;  
  plgfont = c_plgfont;  
  plglevel = c_plglevel;  
  plgpage = c_plgpage;  
  plgra = c_plgra;  
  plgradient = c_plgradient;  
  plgriddata = c_plgriddata;  
  plgspa = c_plgspa;  
  plgstrm = c_plgstrm;  
  plgver = c_plgver;  
  plgvpd = c_plgvpd;  
  plgvpw = c_plgvpw;  
  plgxax = c_plgxax;  
  plgyax = c_plgyax;  
  plgzax = c_plgzax;  
  plhist = c_plhist;  
  plhlsrgb = c_plhlsrgb;  
  plimage = c_plimage;  
  plimagefr = c_plimagefr;  
  plinit = c_plinit;  
  pljoin = c_pljoin;  
  pllab = c_pllab;  
  pllegend = c_pllegend;  
  pllightsource = c_pllightsource;  
  plline = c_plline;  
  plpath = c_plpath;  
  plline3 = c_plline3;  
  pllsty = c_pllsty;  
  plmap = c_plmap;  
  plmapline = c_plmapline;  
  plmapstring = c_plmapstring;  
  plmaptex = c_plmaptex;  
  plmapfill = c_plmapfill;  
  plmeridians = c_plmeridians;  
  plmesh = c_plmesh;  
  plmeshc = c_plmeshc;  
  plmkstrm = c_plmkstrm;  
  plmtex = c_plmtex;  
  plmtex3 = c_plmtex3;  
  plot3d = c_plot3d;  
  plot3dc = c_plot3dc;  
  plot3dcl = c_plot3dcl;  
  plparseopts = c_plparseopts;  
  plpat = c_plpat;  
  plpoin = c_plpoin;  
  plpoin3 = c_plpoin3;  
  plpoly3 = c_plpoly3;  
  plprec = c_plprec;  
  plpsty = c_plpsty;  
  plptex = c_plptex;  
  plptex3 = c_plptex3;  
  plrandd = c_plrandd;  
  plreplot = c_plreplot;  
  plrgbhls = c_plrgbhls;  
  plschr = c_plschr;  
  plscmap0 = c_plscmap0;  
  plscmap0a = c_plscmap0a;  
  plscmap0n = c_plscmap0n;  
  plscmap1 = c_plscmap1;  
  plscmap1a = c_plscmap1a;  
  plscmap1l = c_plscmap1l;  
  plscmap1la = c_plscmap1la;  
  plscmap1n = c_plscmap1n;  
  plscmap1_range = c_plscmap1_range;  
  plscol0 = c_plscol0;  
  plscol0a = c_plscol0a;  
  plscolbg = c_plscolbg;  
  plscolbga = c_plscolbga;  
  plscolor = c_plscolor;  
  plscompression = c_plscompression;  
  plsdev = c_plsdev;  
  plsdidev = c_plsdidev;  
  plsdimap = c_plsdimap;  
  plsdiori = c_plsdiori;  
  plsdiplt = c_plsdiplt;  
  plsdiplz = c_plsdiplz;  
  plsdrawmode = c_plsdrawmode;  
  plseed = c_plseed;  
  plsesc = c_plsesc;  
  plsetopt = c_plsetopt;  
  plsfam = c_plsfam;  
  plsfci = c_plsfci;  
  plsfnam = c_plsfnam;  
  plsfont = c_plsfont;  
  plshade = c_plshade;  
{$ifdef PL_DEPRECATED}
  plshade1 = c_plshade1;  
{$endif}
{ PL_DEPRECATED }

const
  plshades = c_plshades;  
  plslabelfunc = c_plslabelfunc;  
  plsmaj = c_plsmaj;  
  plsmem = c_plsmem;  
  plsmema = c_plsmema;  
  plsmin = c_plsmin;  
  plsori = c_plsori;  
  plspage = c_plspage;  
  plspal0 = c_plspal0;  
  plspal1 = c_plspal1;  
  plspause = c_plspause;  
  plsstrm = c_plsstrm;  
  plssub = c_plssub;  
  plssym = c_plssym;  
  plstar = c_plstar;  
  plstart = c_plstart;  
  plstransform = c_plstransform;  
  plstring = c_plstring;  
  plstring3 = c_plstring3;  
  plstripa = c_plstripa;  
  plstripc = c_plstripc;  
  plstripd = c_plstripd;  
  plstyl = c_plstyl;  
  plsurf3d = c_plsurf3d;  
  plsurf3dl = c_plsurf3dl;  
  plsvect = c_plsvect;  
  plsvpa = c_plsvpa;  
  plsxax = c_plsxax;  
  plsyax = c_plsyax;  
  plsym = c_plsym;  
  plszax = c_plszax;  
  pltext = c_pltext;  
  pltimefmt = c_pltimefmt;  
  plvasp = c_plvasp;  
  plvect = c_plvect;  
  plvpas = c_plvpas;  
  plvpor = c_plvpor;  
  plvsta = c_plvsta;  
  plw3d = c_plw3d;  
  plwidth = c_plwidth;  
  plwind = c_plwind;  
  plxormod = c_plxormod;  
{$endif}
{ __PLSTUBS_H__ }
{$endif}
{ BRAINDEAD }
{-------------------------------------------------------------------------- }
{		Function Prototypes }
{-------------------------------------------------------------------------- }
{ C++ extern C conditionnal removed }
{ All void types }
{ C routines callable from stub routines come first }
{ set the format of the contour labels }

procedure c_pl_setcontlabelformat(lexp:TPLINT; sigdig:TPLINT);cdecl;external libplplot;
{ set offset and spacing of contour labels }
procedure c_pl_setcontlabelparam(offset:TPLFLT; size:TPLFLT; spacing:TPLFLT; active:TPLINT);cdecl;external libplplot;
{ Advance to subpage "page", or to the next one if "page" = 0. }
procedure c_pladv(page:TPLINT);cdecl;external libplplot;
{ Plot an arc }
procedure c_plarc(x:TPLFLT; y:TPLFLT; a:TPLFLT; b:TPLFLT; angle1:TPLFLT; 
            angle2:TPLFLT; rotate:TPLFLT; fill:TPLBOOL);cdecl;external libplplot;
{ This functions similarly to plbox() except that the origin of the axes }
{ is placed at the user-specified point (x0, y0). }
procedure c_plaxes(x0:TPLFLT; y0:TPLFLT; xopt:TPLCHAR_VECTOR; xtick:TPLFLT; nxsub:TPLINT; 
            yopt:TPLCHAR_VECTOR; ytick:TPLFLT; nysub:TPLINT);cdecl;external libplplot;
{ Plot a histogram using x to store data values and y to store frequencies }
{ Flags for plbin() - opt argument }
const
  PL_BIN_DEFAULT = $0;  
  PL_BIN_CENTRED = $1;  
  PL_BIN_NOEXPAND = $2;  
  PL_BIN_NOEMPTY = $4;  

procedure c_plbin(nbin:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; opt:TPLINT);cdecl;external libplplot;
{ Calculate broken-down time from continuous time for current stream. }
procedure c_plbtime(year:TPLINT_NC_SCALAR; month:TPLINT_NC_SCALAR; day:TPLINT_NC_SCALAR; hour:TPLINT_NC_SCALAR; min:TPLINT_NC_SCALAR; 
            sec:TPLFLT_NC_SCALAR; ctime:TPLFLT);cdecl;external libplplot;
{ Start new page.  Should only be used with pleop(). }
procedure c_plbop;cdecl;external libplplot;
{ This draws a box around the current viewport. }
procedure c_plbox(xopt:TPLCHAR_VECTOR; xtick:TPLFLT; nxsub:TPLINT; yopt:TPLCHAR_VECTOR; ytick:TPLFLT; 
            nysub:TPLINT);cdecl;external libplplot;
{ This is the 3-d analogue of plbox(). }
procedure c_plbox3(xopt:TPLCHAR_VECTOR; xlabel:TPLCHAR_VECTOR; xtick:TPLFLT; nxsub:TPLINT; yopt:TPLCHAR_VECTOR; 
            ylabel:TPLCHAR_VECTOR; ytick:TPLFLT; nysub:TPLINT; zopt:TPLCHAR_VECTOR; zlabel:TPLCHAR_VECTOR; 
            ztick:TPLFLT; nzsub:TPLINT);cdecl;external libplplot;
{ Calculate world coordinates and subpage from relative device coordinates. }
procedure c_plcalc_world(rx:TPLFLT; ry:TPLFLT; wx:TPLFLT_NC_SCALAR; wy:TPLFLT_NC_SCALAR; window:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Clear current subpage. }
procedure c_plclear;cdecl;external libplplot;
{ Set color, map 0.  Argument is integer between 0 and 15. }
procedure c_plcol0(icol0:TPLINT);cdecl;external libplplot;
{ Set color, map 1.  Argument is a float between 0. and 1. }
procedure c_plcol1(col1:TPLFLT);cdecl;external libplplot;
{ Configure transformation between continuous and broken-down time (and }
{ vice versa) for current stream. }
procedure c_plconfigtime(scale:TPLFLT; offset1:TPLFLT; offset2:TPLFLT; ccontrol:TPLINT; ifbtime_offset:TPLBOOL; 
            year:TPLINT; month:TPLINT; day:TPLINT; hour:TPLINT; min:TPLINT; 
            sec:TPLFLT);cdecl;external libplplot;
{ Draws a contour plot from data in f(nx,ny).  Is just a front-end to }
{ plfcont, with a particular choice for f2eval and f2eval_data. }
{ }
procedure c_plcont(f:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; kx:TPLINT; lx:TPLINT; 
            ky:TPLINT; ly:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT; pltr:TPLTRANSFORM_callback; 
            pltr_data:TPLPointer);cdecl;external libplplot;
{ Draws a contour plot using the function evaluator f2eval and data stored }
{ by way of the f2eval_data pointer.  This allows arbitrary organizations }
{ of 2d array data to be used. }
{ }
procedure plfcont(f2eval:TPLF2EVAL_callback; f2eval_data:TPLPointer; nx:TPLINT; ny:TPLINT; kx:TPLINT; 
            lx:TPLINT; ky:TPLINT; ly:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT; 
            pltr:TPLTRANSFORM_callback; pltr_data:TPLPointer);cdecl;external libplplot;
{ Copies state parameters from the reference stream to the current stream. }
procedure c_plcpstrm(iplsr:TPLINT; flags:TPLBOOL);cdecl;external libplplot;
{ Calculate continuous time from broken-down time for current stream. }
procedure c_plctime(year:TPLINT; month:TPLINT; day:TPLINT; hour:TPLINT; min:TPLINT; 
            sec:TPLFLT; ctime:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Converts input values from relative device coordinates to relative plot }
{ coordinates. }
procedure pldid2pc(xmin:TPLFLT_NC_SCALAR; ymin:TPLFLT_NC_SCALAR; xmax:TPLFLT_NC_SCALAR; ymax:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Converts input values from relative plot coordinates to relative }
{ device coordinates. }
procedure pldip2dc(xmin:TPLFLT_NC_SCALAR; ymin:TPLFLT_NC_SCALAR; xmax:TPLFLT_NC_SCALAR; ymax:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ End a plotting session for all open streams. }
procedure c_plend;cdecl;external libplplot;
{ End a plotting session for the current stream only. }
procedure c_plend1;cdecl;external libplplot;
{ Simple interface for defining viewport and window. }
procedure c_plenv(xmin:TPLFLT; xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; just:TPLINT; 
            axis:TPLINT);cdecl;external libplplot;
{ similar to plenv() above, but in multiplot mode does not advance the subpage, }
{ instead the current subpage is cleared }
procedure c_plenv0(xmin:TPLFLT; xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; just:TPLINT; 
            axis:TPLINT);cdecl;external libplplot;
{ End current page.  Should only be used with plbop(). }
procedure c_pleop;cdecl;external libplplot;
{ Plot horizontal error bars (xmin(i),y(i)) to (xmax(i),y(i)) }
procedure c_plerrx(n:TPLINT; xmin:TPLFLT_VECTOR; xmax:TPLFLT_VECTOR; y:TPLFLT_VECTOR);cdecl;external libplplot;
{ Plot vertical error bars (x,ymin(i)) to (x(i),ymax(i)) }
procedure c_plerry(n:TPLINT; x:TPLFLT_VECTOR; ymin:TPLFLT_VECTOR; ymax:TPLFLT_VECTOR);cdecl;external libplplot;
{ Advance to the next family file on the next new page }
procedure c_plfamadv;cdecl;external libplplot;
{ Pattern fills the polygon bounded by the input points. }
procedure c_plfill(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR);cdecl;external libplplot;
{ Pattern fills the 3d polygon bounded by the input points. }
procedure c_plfill3(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_VECTOR);cdecl;external libplplot;
{ Flushes the output stream.  Use sparingly, if at all. }
procedure c_plflush;cdecl;external libplplot;
{ Sets the global font flag to 'ifont'. }
procedure c_plfont(ifont:TPLINT);cdecl;external libplplot;
{ Load specified font set. }
procedure c_plfontld(fnt:TPLINT);cdecl;external libplplot;
{ Get character default height and current (scaled) height }
procedure c_plgchr(p_def:TPLFLT_NC_SCALAR; p_ht:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Get the color map 1 range used in continuous plots }
procedure c_plgcmap1_range(min_color:TPLFLT_NC_SCALAR; max_color:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Returns 8 bit RGB values for given color from color map 0 }
procedure c_plgcol0(icol0:TPLINT; r:TPLINT_NC_SCALAR; g:TPLINT_NC_SCALAR; b:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Returns 8 bit RGB values for given color from color map 0 and alpha value }
procedure c_plgcol0a(icol0:TPLINT; r:TPLINT_NC_SCALAR; g:TPLINT_NC_SCALAR; b:TPLINT_NC_SCALAR; alpha:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Returns the background color by 8 bit RGB value }
procedure c_plgcolbg(r:TPLINT_NC_SCALAR; g:TPLINT_NC_SCALAR; b:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Returns the background color by 8 bit RGB value and alpha value }
procedure c_plgcolbga(r:TPLINT_NC_SCALAR; g:TPLINT_NC_SCALAR; b:TPLINT_NC_SCALAR; alpha:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Returns the current compression setting }
procedure c_plgcompression(compression:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Get the current device (keyword) name }
procedure c_plgdev(p_dev:TPLCHAR_NC_VECTOR);cdecl;external libplplot;
{ Retrieve current window into device space }
procedure c_plgdidev(p_mar:TPLFLT_NC_SCALAR; p_aspect:TPLFLT_NC_SCALAR; p_jx:TPLFLT_NC_SCALAR; p_jy:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Get plot orientation }
procedure c_plgdiori(p_rot:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Retrieve current window into plot space }
procedure c_plgdiplt(p_xmin:TPLFLT_NC_SCALAR; p_ymin:TPLFLT_NC_SCALAR; p_xmax:TPLFLT_NC_SCALAR; p_ymax:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Get the drawing mode }
function c_plgdrawmode:TPLINT;cdecl;external libplplot;
{ Get FCI (font characterization integer) }
procedure c_plgfci(p_fci:TPLUNICODE_NC_SCALAR);cdecl;external libplplot;
{ Get family file parameters }
procedure c_plgfam(p_fam:TPLINT_NC_SCALAR; p_num:TPLINT_NC_SCALAR; p_bmax:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Get the (current) output file name.  Must be preallocated to >80 bytes }
procedure c_plgfnam(fnam:TPLCHAR_NC_VECTOR);cdecl;external libplplot;
{ Get the current font family, style and weight }
procedure c_plgfont(p_family:TPLINT_NC_SCALAR; p_style:TPLINT_NC_SCALAR; p_weight:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Get the (current) run level. }
procedure c_plglevel(p_level:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Get output device parameters. }
procedure c_plgpage(p_xp:TPLFLT_NC_SCALAR; p_yp:TPLFLT_NC_SCALAR; p_xleng:TPLINT_NC_SCALAR; p_yleng:TPLINT_NC_SCALAR; p_xoff:TPLINT_NC_SCALAR; 
            p_yoff:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Switches to graphics screen. }
procedure c_plgra;cdecl;external libplplot;
{ Draw gradient in polygon. }
procedure c_plgradient(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; angle:TPLFLT);cdecl;external libplplot;
{ grid irregularly sampled data }
procedure c_plgriddata(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_VECTOR; npts:TPLINT; xg:TPLFLT_VECTOR; 
            nptsx:TPLINT; yg:TPLFLT_VECTOR; nptsy:TPLINT; zg:TPLFLT_NC_MATRIX; _type:TPLINT; 
            data:TPLFLT);cdecl;external libplplot;
procedure plfgriddata(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_VECTOR; npts:TPLINT; xg:TPLFLT_VECTOR; 
            nptsx:TPLINT; yg:TPLFLT_VECTOR; nptsy:TPLINT; zops:TPLF2OPS; zgp:TPLPointer; 
            _type:TPLINT; data:TPLFLT);cdecl;external libplplot;
{ type of gridding algorithm for plgriddata() }
const
  GRID_CSA = 1;  { Bivariate Cubic Spline approximation }
  GRID_DTLI = 2;  { Delaunay Triangulation Linear Interpolation }
  GRID_NNI = 3;  { Natural Neighbors Interpolation }
  GRID_NNIDW = 4;  { Nearest Neighbors Inverse Distance Weighted }
  GRID_NNLI = 5;  { Nearest Neighbors Linear Interpolation }
  GRID_NNAIDW = 6;  { Nearest Neighbors Around Inverse Distance Weighted }
{ Get subpage boundaries in absolute coordinates }

procedure c_plgspa(xmin:TPLFLT_NC_SCALAR; xmax:TPLFLT_NC_SCALAR; ymin:TPLFLT_NC_SCALAR; ymax:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Get current stream number. }
procedure c_plgstrm(p_strm:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Get the current library version number }
procedure c_plgver(p_ver:TPLCHAR_NC_VECTOR);cdecl;external libplplot;
{ Get viewport boundaries in normalized device coordinates }
procedure c_plgvpd(p_xmin:TPLFLT_NC_SCALAR; p_xmax:TPLFLT_NC_SCALAR; p_ymin:TPLFLT_NC_SCALAR; p_ymax:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Get viewport boundaries in world coordinates }
procedure c_plgvpw(p_xmin:TPLFLT_NC_SCALAR; p_xmax:TPLFLT_NC_SCALAR; p_ymin:TPLFLT_NC_SCALAR; p_ymax:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Get x axis labeling parameters }
procedure c_plgxax(p_digmax:TPLINT_NC_SCALAR; p_digits:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Get y axis labeling parameters }
procedure c_plgyax(p_digmax:TPLINT_NC_SCALAR; p_digits:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Get z axis labeling parameters }
procedure c_plgzax(p_digmax:TPLINT_NC_SCALAR; p_digits:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Draws a histogram of n values of a variable in array data[0..n-1] }
{ Flags for plhist() - opt argument; note: some flags are passed to }
{ plbin() for the actual plotting }
const
  PL_HIST_DEFAULT = $00;  
  PL_HIST_NOSCALING = $01;  
  PL_HIST_IGNORE_OUTLIERS = $02;  
  PL_HIST_NOEXPAND = $08;  
  PL_HIST_NOEMPTY = $10;  

procedure c_plhist(n:TPLINT; data:TPLFLT_VECTOR; datmin:TPLFLT; datmax:TPLFLT; nbin:TPLINT; 
            opt:TPLINT);cdecl;external libplplot;
{ Functions for converting between HLS and RGB color space }
procedure c_plhlsrgb(h:TPLFLT; l:TPLFLT; s:TPLFLT; p_r:TPLFLT_NC_SCALAR; p_g:TPLFLT_NC_SCALAR; 
            p_b:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Initializes PLplot, using preset or default options }
procedure c_plinit;cdecl;external libplplot;
{ Draws a line segment from (x1, y1) to (x2, y2). }
procedure c_pljoin(x1:TPLFLT; y1:TPLFLT; x2:TPLFLT; y2:TPLFLT);cdecl;external libplplot;
{ Simple routine for labelling graphs. }
procedure c_pllab(xlabel:TPLCHAR_VECTOR; ylabel:TPLCHAR_VECTOR; tlabel:TPLCHAR_VECTOR);cdecl;external libplplot;
{flags used for position argument of both pllegend and plcolorbar }
const
  PL_POSITION_NULL = $0;  
  PL_POSITION_LEFT = $1;  
  PL_POSITION_RIGHT = $2;  
  PL_POSITION_TOP = $4;  
  PL_POSITION_BOTTOM = $8;  
  PL_POSITION_INSIDE = $10;  
  PL_POSITION_OUTSIDE = $20;  
  PL_POSITION_VIEWPORT = $40;  
  PL_POSITION_SUBPAGE = $80;  
{ Flags for pllegend. }
  PL_LEGEND_NULL = $0;  
  PL_LEGEND_NONE = $1;  
  PL_LEGEND_COLOR_BOX = $2;  
  PL_LEGEND_LINE = $4;  
  PL_LEGEND_SYMBOL = $8;  
  PL_LEGEND_TEXT_LEFT = $10;  
  PL_LEGEND_BACKGROUND = $20;  
  PL_LEGEND_BOUNDING_BOX = $40;  
  PL_LEGEND_ROW_MAJOR = $80;  
{ Flags for plcolorbar }
  PL_COLORBAR_NULL = $0;  
  PL_COLORBAR_LABEL_LEFT = $1;  
  PL_COLORBAR_LABEL_RIGHT = $2;  
  PL_COLORBAR_LABEL_TOP = $4;  
  PL_COLORBAR_LABEL_BOTTOM = $8;  
  PL_COLORBAR_IMAGE = $10;  
  PL_COLORBAR_SHADE = $20;  
  PL_COLORBAR_GRADIENT = $40;  
  PL_COLORBAR_CAP_NONE = $80;  
  PL_COLORBAR_CAP_LOW = $100;  
  PL_COLORBAR_CAP_HIGH = $200;  
  PL_COLORBAR_SHADE_LABEL = $400;  
  PL_COLORBAR_ORIENT_RIGHT = $800;  
  PL_COLORBAR_ORIENT_TOP = $1000;  
  PL_COLORBAR_ORIENT_LEFT = $2000;  
  PL_COLORBAR_ORIENT_BOTTOM = $4000;  
  PL_COLORBAR_BACKGROUND = $8000;  
  PL_COLORBAR_BOUNDING_BOX = $10000;  
{ Flags for drawing mode }
  PL_DRAWMODE_UNKNOWN = $0;  
  PL_DRAWMODE_DEFAULT = $1;  
  PL_DRAWMODE_REPLACE = $2;  
  PL_DRAWMODE_XOR = $4;  
{ Routine for drawing discrete line, symbol, or cmap0 legends }

procedure c_pllegend(p_legend_width:TPLFLT_NC_SCALAR; p_legend_height:TPLFLT_NC_SCALAR; opt:TPLINT; position:TPLINT; x:TPLFLT; 
            y:TPLFLT; plot_width:TPLFLT; bg_color:TPLINT; bb_color:TPLINT; bb_style:TPLINT; 
            nrow:TPLINT; ncolumn:TPLINT; nlegend:TPLINT; opt_array:TPLINT_VECTOR; text_offset:TPLFLT; 
            text_scale:TPLFLT; text_spacing:TPLFLT; text_justification:TPLFLT; text_colors:TPLINT_VECTOR; text:TPLCHAR_MATRIX; 
            box_colors:TPLINT_VECTOR; box_patterns:TPLINT_VECTOR; box_scales:TPLFLT_VECTOR; box_line_widths:TPLFLT_VECTOR; line_colors:TPLINT_VECTOR; 
            line_styles:TPLINT_VECTOR; line_widths:TPLFLT_VECTOR; symbol_colors:TPLINT_VECTOR; symbol_scales:TPLFLT_VECTOR; symbol_numbers:TPLINT_VECTOR; 
            symbols:TPLCHAR_MATRIX);cdecl;external libplplot;
{ Routine for drawing continuous colour legends }
procedure c_plcolorbar(p_colorbar_width:TPLFLT_NC_SCALAR; p_colorbar_height:TPLFLT_NC_SCALAR; opt:TPLINT; position:TPLINT; x:TPLFLT; 
            y:TPLFLT; x_length:TPLFLT; y_length:TPLFLT; bg_color:TPLINT; bb_color:TPLINT; 
            bb_style:TPLINT; low_cap_color:TPLFLT; high_cap_color:TPLFLT; cont_color:TPLINT; cont_width:TPLFLT; 
            n_labels:TPLINT; label_opts:TPLINT_VECTOR; labels:TPLCHAR_MATRIX; n_axes:TPLINT; axis_opts:TPLCHAR_MATRIX; 
            ticks:TPLFLT_VECTOR; sub_ticks:TPLINT_VECTOR; n_values:TPLINT_VECTOR; values:TPLFLT_MATRIX);cdecl;external libplplot;
{ Sets position of the light source }
procedure c_pllightsource(x:TPLFLT; y:TPLFLT; z:TPLFLT);cdecl;external libplplot;
{ Draws line segments connecting a series of points. }
procedure c_plline(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR);cdecl;external libplplot;
{ Draws a line in 3 space. }
procedure c_plline3(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_VECTOR);cdecl;external libplplot;
{ Set line style. }
procedure c_pllsty(lin:TPLINT);cdecl;external libplplot;
{ Plot continental outline in world coordinates }
procedure c_plmap(mapform:TPLMAPFORM_callback; name:TPLCHAR_VECTOR; minx:TPLFLT; maxx:TPLFLT; miny:TPLFLT; 
            maxy:TPLFLT);cdecl;external libplplot;
{ Plot map outlines }
procedure c_plmapline(mapform:TPLMAPFORM_callback; name:TPLCHAR_VECTOR; minx:TPLFLT; maxx:TPLFLT; miny:TPLFLT; 
            maxy:TPLFLT; plotentries:TPLINT_VECTOR; nplotentries:TPLINT);cdecl;external libplplot;
{ Plot map points }
procedure c_plmapstring(mapform:TPLMAPFORM_callback; name:TPLCHAR_VECTOR; _string:TPLCHAR_VECTOR; minx:TPLFLT; maxx:TPLFLT; 
            miny:TPLFLT; maxy:TPLFLT; plotentries:TPLINT_VECTOR; nplotentries:TPLINT);cdecl;external libplplot;
{ Plot map text }
procedure c_plmaptex(mapform:TPLMAPFORM_callback; name:TPLCHAR_VECTOR; dx:TPLFLT; dy:TPLFLT; just:TPLFLT; 
            text:TPLCHAR_VECTOR; minx:TPLFLT; maxx:TPLFLT; miny:TPLFLT; maxy:TPLFLT; 
            plotentry:TPLINT);cdecl;external libplplot;
{ Plot map fills }
procedure c_plmapfill(mapform:TPLMAPFORM_callback; name:TPLCHAR_VECTOR; minx:TPLFLT; maxx:TPLFLT; miny:TPLFLT; 
            maxy:TPLFLT; plotentries:TPLINT_VECTOR; nplotentries:TPLINT);cdecl;external libplplot;
{ Plot the latitudes and longitudes on the background. }
procedure c_plmeridians(mapform:TPLMAPFORM_callback; dlong:TPLFLT; dlat:TPLFLT; minlong:TPLFLT; maxlong:TPLFLT; 
            minlat:TPLFLT; maxlat:TPLFLT);cdecl;external libplplot;
{ Plots a mesh representation of the function z[x][y]. }
procedure c_plmesh(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; 
            opt:TPLINT);cdecl;external libplplot;
{ Like plmesh, but uses an evaluator function to access z data from zp }
procedure plfmesh(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; zops:TPLF2OPS; zp:TPLPointer; nx:TPLINT; 
            ny:TPLINT; opt:TPLINT);cdecl;external libplplot;
{ Plots a mesh representation of the function z[x][y] with contour }
procedure c_plmeshc(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; 
            opt:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT);cdecl;external libplplot;
{ Like plmeshc, but uses an evaluator function to access z data from zp }
procedure plfmeshc(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; zops:TPLF2OPS; zp:TPLPointer; nx:TPLINT; 
            ny:TPLINT; opt:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT);cdecl;external libplplot;
{ Creates a new stream and makes it the default. }
procedure c_plmkstrm(p_strm:TPLINT_NC_SCALAR);cdecl;external libplplot;
{ Prints out "text" at specified position relative to viewport }
procedure c_plmtex(side:TPLCHAR_VECTOR; disp:TPLFLT; pos:TPLFLT; just:TPLFLT; text:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Prints out "text" at specified position relative to viewport (3D) }
procedure c_plmtex3(side:TPLCHAR_VECTOR; disp:TPLFLT; pos:TPLFLT; just:TPLFLT; text:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Plots a 3-d representation of the function z[x][y]. }
procedure c_plot3d(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; 
            opt:TPLINT; side:TPLBOOL);cdecl;external libplplot;
{ Like plot3d, but uses an evaluator function to access z data from zp }
procedure plfplot3d(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; zops:TPLF2OPS; zp:TPLPointer; nx:TPLINT; 
            ny:TPLINT; opt:TPLINT; side:TPLBOOL);cdecl;external libplplot;
{ Plots a 3-d representation of the function z[x][y] with contour. }
procedure c_plot3dc(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; 
            opt:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT);cdecl;external libplplot;
{ Like plot3dc, but uses an evaluator function to access z data from zp }
procedure plfplot3dc(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; zops:TPLF2OPS; zp:TPLPointer; nx:TPLINT; 
            ny:TPLINT; opt:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT);cdecl;external libplplot;
{ Plots a 3-d representation of the function z[x][y] with contour and }
{ y index limits. }
procedure c_plot3dcl(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; 
            opt:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT; indexxmin:TPLINT; indexxmax:TPLINT; 
            indexymin:TPLINT_VECTOR; indexymax:TPLINT_VECTOR);cdecl;external libplplot;
{ Like plot3dcl, but uses an evaluator function to access z data from zp }
procedure plfplot3dcl(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; zops:TPLF2OPS; zp:TPLPointer; nx:TPLINT; 
            ny:TPLINT; opt:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT; indexxmin:TPLINT; 
            indexxmax:TPLINT; indexymin:TPLINT_VECTOR; indexymax:TPLINT_VECTOR);cdecl;external libplplot;
{ }
{ definitions for the opt argument in plot3dc() and plsurf3d() }
{ }
{ DRAW_LINEX *must* be 1 and DRAW_LINEY *must* be 2, because of legacy code! }
{ }
const
  DRAW_LINEX = $001;  { draw lines parallel to the X axis }
  DRAW_LINEY = $002;  { draw lines parallel to the Y axis }
  DRAW_LINEXY = $003;  { draw lines parallel to both the X and Y axis }
  MAG_COLOR = $004;  { draw the mesh with a color dependent of the magnitude }
  BASE_CONT = $008;  { draw contour plot at bottom xy plane }
  TOP_CONT = $010;  { draw contour plot at top xy plane }
  SURF_CONT = $020;  { draw contour plot at surface }
  DRAW_SIDES = $040;  { draw sides }
  FACETED = $080;  { draw outline for each square that makes up the surface }
  MESH = $100;  { draw mesh }
{ }
{  valid options for plot3dc(): }
{ }
{  DRAW_SIDES, BASE_CONT, TOP_CONT (not yet), }
{  MAG_COLOR, DRAW_LINEX, DRAW_LINEY, DRAW_LINEXY. }
{ }
{  valid options for plsurf3d(): }
{ }
{  MAG_COLOR, BASE_CONT, SURF_CONT, FACETED, DRAW_SIDES. }
{ }
{ Set fill pattern directly. }

procedure c_plpat(nlin:TPLINT; inc:TPLINT_VECTOR; del:TPLINT_VECTOR);cdecl;external libplplot;
{ Draw a line connecting two points, accounting for coordinate transforms }
procedure c_plpath(n:TPLINT; x1:TPLFLT; y1:TPLFLT; x2:TPLFLT; y2:TPLFLT);cdecl;external libplplot;
{ Plots array y against x for n points using ASCII code "code". }
procedure c_plpoin(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; code:TPLINT);cdecl;external libplplot;
{ Draws a series of points in 3 space. }
procedure c_plpoin3(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_VECTOR; code:TPLINT);cdecl;external libplplot;
{ Draws a polygon in 3 space. }
procedure c_plpoly3(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_VECTOR; draw:TPLBOOL_VECTOR; 
            ifcc:TPLBOOL);cdecl;external libplplot;
{ Set the floating point precision (in number of places) in numeric labels. }
procedure c_plprec(setp:TPLINT; prec:TPLINT);cdecl;external libplplot;
{ Set fill pattern, using one of the predefined patterns. }
procedure c_plpsty(patt:TPLINT);cdecl;external libplplot;
{ Prints out "text" at world cooordinate (x,y). }
procedure c_plptex(x:TPLFLT; y:TPLFLT; dx:TPLFLT; dy:TPLFLT; just:TPLFLT; 
            text:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Prints out "text" at world cooordinate (x,y,z). }
procedure c_plptex3(wx:TPLFLT; wy:TPLFLT; wz:TPLFLT; dx:TPLFLT; dy:TPLFLT; 
            dz:TPLFLT; sx:TPLFLT; sy:TPLFLT; sz:TPLFLT; just:TPLFLT; 
            text:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Random number generator based on Mersenne Twister. }
{ Obtain real random number in range [0,1]. }
function c_plrandd:TPLFLT;cdecl;external libplplot;
{ Replays contents of plot buffer to current device/file. }
procedure c_plreplot;cdecl;external libplplot;
{ Functions for converting between HLS and RGB color space }
procedure c_plrgbhls(r:TPLFLT; g:TPLFLT; b:TPLFLT; p_h:TPLFLT_NC_SCALAR; p_l:TPLFLT_NC_SCALAR; 
            p_s:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Set character height. }
procedure c_plschr(def:TPLFLT; scale:TPLFLT);cdecl;external libplplot;
{ Set color map 0 colors by 8 bit RGB values }
procedure c_plscmap0(r:TPLINT_VECTOR; g:TPLINT_VECTOR; b:TPLINT_VECTOR; ncol0:TPLINT);cdecl;external libplplot;
{ Set color map 0 colors by 8 bit RGB values and alpha values }
procedure c_plscmap0a(r:TPLINT_VECTOR; g:TPLINT_VECTOR; b:TPLINT_VECTOR; alpha:TPLFLT_VECTOR; ncol0:TPLINT);cdecl;external libplplot;
{ Set number of colors in cmap 0 }
procedure c_plscmap0n(ncol0:TPLINT);cdecl;external libplplot;
{ Set color map 1 colors by 8 bit RGB values }
procedure c_plscmap1(r:TPLINT_VECTOR; g:TPLINT_VECTOR; b:TPLINT_VECTOR; ncol1:TPLINT);cdecl;external libplplot;
{ Set color map 1 colors by 8 bit RGB and alpha values }
procedure c_plscmap1a(r:TPLINT_VECTOR; g:TPLINT_VECTOR; b:TPLINT_VECTOR; alpha:TPLFLT_VECTOR; ncol1:TPLINT);cdecl;external libplplot;
{ Set color map 1 colors using a piece-wise linear relationship between }
{ intensity [0,1] (cmap 1 index) and position in HLS or RGB color space. }
procedure c_plscmap1l(itype:TPLBOOL; npts:TPLINT; intensity:TPLFLT_VECTOR; coord1:TPLFLT_VECTOR; coord2:TPLFLT_VECTOR; 
            coord3:TPLFLT_VECTOR; alt_hue_path:TPLBOOL_VECTOR);cdecl;external libplplot;
{ Set color map 1 colors using a piece-wise linear relationship between }
{ intensity [0,1] (cmap 1 index) and position in HLS or RGB color space. }
{ Will also linear interpolate alpha values. }
procedure c_plscmap1la(itype:TPLBOOL; npts:TPLINT; intensity:TPLFLT_VECTOR; coord1:TPLFLT_VECTOR; coord2:TPLFLT_VECTOR; 
            coord3:TPLFLT_VECTOR; alpha:TPLFLT_VECTOR; alt_hue_path:TPLBOOL_VECTOR);cdecl;external libplplot;
{ Set number of colors in cmap 1 }
procedure c_plscmap1n(ncol1:TPLINT);cdecl;external libplplot;
{ Set the color map 1 range used in continuous plots }
procedure c_plscmap1_range(min_color:TPLFLT; max_color:TPLFLT);cdecl;external libplplot;
{ Set a given color from color map 0 by 8 bit RGB value }
procedure c_plscol0(icol0:TPLINT; r:TPLINT; g:TPLINT; b:TPLINT);cdecl;external libplplot;
{ Set a given color from color map 0 by 8 bit RGB value }
procedure c_plscol0a(icol0:TPLINT; r:TPLINT; g:TPLINT; b:TPLINT; alpha:TPLFLT);cdecl;external libplplot;
{ Set the background color by 8 bit RGB value }
procedure c_plscolbg(r:TPLINT; g:TPLINT; b:TPLINT);cdecl;external libplplot;
{ Set the background color by 8 bit RGB value and alpha value }
procedure c_plscolbga(r:TPLINT; g:TPLINT; b:TPLINT; alpha:TPLFLT);cdecl;external libplplot;
{ Used to globally turn color output on/off }
procedure c_plscolor(color:TPLINT);cdecl;external libplplot;
{ Set the compression level }
procedure c_plscompression(compression:TPLINT);cdecl;external libplplot;
{ Set the device (keyword) name }
procedure c_plsdev(devname:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Set window into device space using margin, aspect ratio, and }
{ justification }
procedure c_plsdidev(mar:TPLFLT; aspect:TPLFLT; jx:TPLFLT; jy:TPLFLT);cdecl;external libplplot;
{ Set up transformation from metafile coordinates. }
procedure c_plsdimap(dimxmin:TPLINT; dimxmax:TPLINT; dimymin:TPLINT; dimymax:TPLINT; dimxpmm:TPLFLT; 
            dimypmm:TPLFLT);cdecl;external libplplot;
{ Set plot orientation, specifying rotation in units of pi/2. }
procedure c_plsdiori(rot:TPLFLT);cdecl;external libplplot;
{ Set window into plot space }
procedure c_plsdiplt(xmin:TPLFLT; ymin:TPLFLT; xmax:TPLFLT; ymax:TPLFLT);cdecl;external libplplot;
{ Set window into plot space incrementally (zoom) }
procedure c_plsdiplz(xmin:TPLFLT; ymin:TPLFLT; xmax:TPLFLT; ymax:TPLFLT);cdecl;external libplplot;
{ Set the drawing mode }
procedure c_plsdrawmode(mode:TPLINT);cdecl;external libplplot;
{ Set seed for internal random number generator }
procedure c_plseed(seed:dword);cdecl;external libplplot;
{ Set the escape character for text strings. }
procedure c_plsesc(esc:char);cdecl;external libplplot;
{ Set family file parameters }
procedure c_plsfam(fam:TPLINT; num:TPLINT; bmax:TPLINT);cdecl;external libplplot;
{ Set FCI (font characterization integer) }
procedure c_plsfci(fci:TPLUNICODE);cdecl;external libplplot;
{ Set the output file name. }
procedure c_plsfnam(fnam:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Set the current font family, style and weight }
procedure c_plsfont(family:TPLINT; style:TPLINT; weight:TPLINT);cdecl;external libplplot;
{ Shade region. }
procedure c_plshade(a:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; defined:TPLDEFINED_callback; xmin:TPLFLT; 
            xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; shade_min:TPLFLT; shade_max:TPLFLT; 
            sh_cmap:TPLINT; sh_color:TPLFLT; sh_width:TPLFLT; min_color:TPLINT; min_width:TPLFLT; 
            max_color:TPLINT; max_width:TPLFLT; fill:TPLFILL_callback; rectangular:TPLBOOL; pltr:TPLTRANSFORM_callback; 
            pltr_data:TPLPointer);cdecl;external libplplot;
{$ifdef PL_DEPRECATED}
procedure c_plshade1(a:TPLFLT_FE_POINTER; nx:TPLINT; ny:TPLINT; defined:TPLDEFINED_callback; xmin:TPLFLT; 
            xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; shade_min:TPLFLT; shade_max:TPLFLT; 
            sh_cmap:TPLINT; sh_color:TPLFLT; sh_width:TPLFLT; min_color:TPLINT; min_width:TPLFLT; 
            max_color:TPLINT; max_width:TPLFLT; fill:TPLFILL_callback; rectangular:TPLBOOL; pltr:TPLTRANSFORM_callback; 
            pltr_data:TPLPointer);cdecl;external libplplot;
{$endif}
{ PL_DEPRECATED }

procedure c_plshades(a:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; defined:TPLDEFINED_callback; xmin:TPLFLT; 
            xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; clevel:TPLFLT_VECTOR; nlevel:TPLINT; 
            fill_width:TPLFLT; cont_color:TPLINT; cont_width:TPLFLT; fill:TPLFILL_callback; rectangular:TPLBOOL; 
            pltr:TPLTRANSFORM_callback; pltr_data:TPLPointer);cdecl;external libplplot;
procedure plfshades(zops:TPLF2OPS; zp:TPLPointer; nx:TPLINT; ny:TPLINT; defined:TPLDEFINED_callback; 
            xmin:TPLFLT; xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; clevel:TPLFLT_VECTOR; 
            nlevel:TPLINT; fill_width:TPLFLT; cont_color:TPLINT; cont_width:TPLFLT; fill:TPLFILL_callback; 
            rectangular:TPLINT; pltr:TPLTRANSFORM_callback; pltr_data:TPLPointer);cdecl;external libplplot;
procedure plfshade(f2eval:TPLF2EVAL_callback; f2eval_data:TPLPointer; c2eval:TPLF2EVAL_callback; c2eval_data:TPLPointer; nx:TPLINT; 
            ny:TPLINT; left:TPLFLT; right:TPLFLT; bottom:TPLFLT; top:TPLFLT; 
            shade_min:TPLFLT; shade_max:TPLFLT; sh_cmap:TPLINT; sh_color:TPLFLT; sh_width:TPLFLT; 
            min_color:TPLINT; min_width:TPLFLT; max_color:TPLINT; max_width:TPLFLT; fill:TPLFILL_callback; 
            rectangular:TPLBOOL; pltr:TPLTRANSFORM_callback; pltr_data:TPLPointer);cdecl;external libplplot;
procedure plfshade1(zops:TPLF2OPS; zp:TPLPointer; nx:TPLINT; ny:TPLINT; defined:TPLDEFINED_callback; 
            xmin:TPLFLT; xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; shade_min:TPLFLT; 
            shade_max:TPLFLT; sh_cmap:TPLINT; sh_color:TPLFLT; sh_width:TPLFLT; min_color:TPLINT; 
            min_width:TPLFLT; max_color:TPLINT; max_width:TPLFLT; fill:TPLFILL_callback; rectangular:TPLINT; 
            pltr:TPLTRANSFORM_callback; pltr_data:TPLPointer);cdecl;external libplplot;
{ Setup a user-provided custom labeling function }
procedure c_plslabelfunc(label_func:TPLLABEL_FUNC_callback; label_data:TPLPointer);cdecl;external libplplot;
{ Set up lengths of major tick marks. }
procedure c_plsmaj(def:TPLFLT; scale:TPLFLT);cdecl;external libplplot;
{ Set the RGB memory area to be plotted (with the 'mem' or 'memcairo' drivers) }
procedure c_plsmem(maxx:TPLINT; maxy:TPLINT; plotmem:TPLPointer);cdecl;external libplplot;
{ Set the RGBA memory area to be plotted (with the 'memcairo' driver) }
procedure c_plsmema(maxx:TPLINT; maxy:TPLINT; plotmem:TPLPointer);cdecl;external libplplot;
{ Set up lengths of minor tick marks. }
procedure c_plsmin(def:TPLFLT; scale:TPLFLT);cdecl;external libplplot;
{ Set orientation.  Must be done before calling plinit. }
procedure c_plsori(ori:TPLINT);cdecl;external libplplot;
{ Set output device parameters.  Usually ignored by the driver. }
procedure c_plspage(xp:TPLFLT; yp:TPLFLT; xleng:TPLINT; yleng:TPLINT; xoff:TPLINT; 
            yoff:TPLINT);cdecl;external libplplot;
{ Set the colors for color table 0 from a cmap0 file }
procedure c_plspal0(filename:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Set the colors for color table 1 from a cmap1 file }
procedure c_plspal1(filename:TPLCHAR_VECTOR; interpolate:TPLBOOL);cdecl;external libplplot;
{ Set the pause (on end-of-page) status }
procedure c_plspause(pause:TPLBOOL);cdecl;external libplplot;
{ Set stream number. }
procedure c_plsstrm(strm:TPLINT);cdecl;external libplplot;
{ Set the number of subwindows in x and y }
procedure c_plssub(nx:TPLINT; ny:TPLINT);cdecl;external libplplot;
{ Set symbol height. }
procedure c_plssym(def:TPLFLT; scale:TPLFLT);cdecl;external libplplot;
{ Initialize PLplot, passing in the windows/page settings. }
procedure c_plstar(nx:TPLINT; ny:TPLINT);cdecl;external libplplot;
{ Initialize PLplot, passing the device name and windows/page settings. }
procedure c_plstart(devname:TPLCHAR_VECTOR; nx:TPLINT; ny:TPLINT);cdecl;external libplplot;
{ Set the coordinate transform }
procedure c_plstransform(coordinate_transform:TPLTRANSFORM_callback; coordinate_transform_data:TPLPointer);cdecl;external libplplot;
{ Prints out the same string repeatedly at the n points in world }
{ coordinates given by the x and y arrays.  Supersedes plpoin and }
{ plsymbol for the case where text refers to a unicode glyph either }
{ directly as UTF-8 or indirectly via the standard text escape }
{ sequences allowed for PLplot input strings. }
procedure c_plstring(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; _string:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Prints out the same string repeatedly at the n points in world }
{ coordinates given by the x, y, and z arrays.  Supersedes plpoin3 }
{ for the case where text refers to a unicode glyph either directly }
{ as UTF-8 or indirectly via the standard text escape sequences }
{ allowed for PLplot input strings. }
procedure c_plstring3(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_VECTOR; _string:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Add a point to a stripchart. }
procedure c_plstripa(id:TPLINT; pen:TPLINT; x:TPLFLT; y:TPLFLT);cdecl;external libplplot;
{ Create 1d stripchart }
procedure c_plstripc(id:TPLINT_NC_SCALAR; xspec:TPLCHAR_VECTOR; yspec:TPLCHAR_VECTOR; xmin:TPLFLT; xmax:TPLFLT; 
            xjump:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; xlpos:TPLFLT; ylpos:TPLFLT; 
            y_ascl:TPLBOOL; acc:TPLBOOL; colbox:TPLINT; collab:TPLINT; colline:TPLINT_VECTOR; 
            styline:TPLINT_VECTOR; legline:TPLCHAR_MATRIX; labx:TPLCHAR_VECTOR; laby:TPLCHAR_VECTOR; labtop:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Deletes and releases memory used by a stripchart. }
procedure c_plstripd(id:TPLINT);cdecl;external libplplot;
{ plots a 2d image (or a matrix too large for plshade() ) }
procedure c_plimagefr(idata:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; xmin:TPLFLT; xmax:TPLFLT; 
            ymin:TPLFLT; ymax:TPLFLT; zmin:TPLFLT; zmax:TPLFLT; valuemin:TPLFLT; 
            valuemax:TPLFLT; pltr:TPLTRANSFORM_callback; pltr_data:TPLPointer);cdecl;external libplplot;
{ }
{ Like plimagefr, but uses an evaluator function to access image data from }
{ idatap.  getminmax is only used if zmin == zmax. }
{ }
procedure plfimagefr(idataops:TPLF2OPS; idatap:TPLPointer; nx:TPLINT; ny:TPLINT; xmin:TPLFLT; 
            xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; zmin:TPLFLT; zmax:TPLFLT; 
            valuemin:TPLFLT; valuemax:TPLFLT; pltr:TPLTRANSFORM_callback; pltr_data:TPLPointer);cdecl;external libplplot;
{ plots a 2d image (or a matrix too large for plshade() ) - colors }
{ automatically scaled }
procedure c_plimage(idata:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; xmin:TPLFLT; xmax:TPLFLT; 
            ymin:TPLFLT; ymax:TPLFLT; zmin:TPLFLT; zmax:TPLFLT; Dxmin:TPLFLT; 
            Dxmax:TPLFLT; Dymin:TPLFLT; Dymax:TPLFLT);cdecl;external libplplot;
{ }
{ Like plimage, but uses an operator functions to access image data from }
{ idatap. }
{ }
procedure plfimage(idataops:TPLF2OPS; idatap:TPLPointer; nx:TPLINT; ny:TPLINT; xmin:TPLFLT; 
            xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; zmin:TPLFLT; zmax:TPLFLT; 
            Dxmin:TPLFLT; Dxmax:TPLFLT; Dymin:TPLFLT; Dymax:TPLFLT);cdecl;external libplplot;
{ Set up a new line style }
procedure c_plstyl(nms:TPLINT; mark:TPLINT_VECTOR; space:TPLINT_VECTOR);cdecl;external libplplot;
{ Plots the 3d surface representation of the function z[x][y]. }
procedure c_plsurf3d(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; 
            opt:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT);cdecl;external libplplot;
{ Like plsurf3d, but uses an evaluator function to access z data from zp }
procedure plfsurf3d(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; zops:TPLF2OPS; zp:TPLPointer; nx:TPLINT; 
            ny:TPLINT; opt:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT);cdecl;external libplplot;
{ Plots the 3d surface representation of the function z[x][y] with y }
{ index limits. }
procedure c_plsurf3dl(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; z:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; 
            opt:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT; indexxmin:TPLINT; indexxmax:TPLINT; 
            indexymin:TPLINT_VECTOR; indexymax:TPLINT_VECTOR);cdecl;external libplplot;
{ Like plsurf3dl, but uses an evaluator function to access z data from zp }
procedure plfsurf3dl(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; zops:TPLF2OPS; zp:TPLPointer; nx:TPLINT; 
            ny:TPLINT; opt:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT; indexxmin:TPLINT; 
            indexxmax:TPLINT; indexymin:TPLINT_VECTOR; indexymax:TPLINT_VECTOR);cdecl;external libplplot;
{ Set arrow style for vector plots. }
procedure c_plsvect(arrowx:TPLFLT_VECTOR; arrowy:TPLFLT_VECTOR; npts:TPLINT; fill:TPLBOOL);cdecl;external libplplot;
{ Sets the edges of the viewport to the specified absolute coordinates }
procedure c_plsvpa(xmin:TPLFLT; xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT);cdecl;external libplplot;
{ Set x axis labeling parameters }
procedure c_plsxax(digmax:TPLINT; digits:TPLINT);cdecl;external libplplot;
{ Set inferior X window }
procedure plsxwin(window_id:TPLINT);cdecl;external libplplot;
{ Set y axis labeling parameters }
procedure c_plsyax(digmax:TPLINT; digits:TPLINT);cdecl;external libplplot;
{ Plots array y against x for n points using Hershey symbol "code" }
procedure c_plsym(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; code:TPLINT);cdecl;external libplplot;
{ Set z axis labeling parameters }
procedure c_plszax(digmax:TPLINT; digits:TPLINT);cdecl;external libplplot;
{ Switches to text screen. }
procedure c_pltext;cdecl;external libplplot;
{ Set the format for date / time labels for current stream. }
procedure c_pltimefmt(fmt:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Sets the edges of the viewport with the given aspect ratio, leaving }
{ room for labels. }
procedure c_plvasp(aspect:TPLFLT);cdecl;external libplplot;
{ Creates the largest viewport of the specified aspect ratio that fits }
{ within the specified normalized subpage coordinates. }
{ simple arrow plotter. }
procedure c_plvect(u:TPLFLT_MATRIX; v:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; scale:TPLFLT; 
            pltr:TPLTRANSFORM_callback; pltr_data:TPLPointer);cdecl;external libplplot;
{ }
{ Routine to plot a vector array with arbitrary coordinate }
{ and vector transformations }
{ }
procedure plfvect(getuv:TPLF2EVAL_callback; up:TPLPointer; vp:TPLPointer; nx:TPLINT; ny:TPLINT; 
            scale:TPLFLT; pltr:TPLTRANSFORM_callback; pltr_data:TPLPointer);cdecl;external libplplot;
procedure c_plvpas(xmin:TPLFLT; xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT; aspect:TPLFLT);cdecl;external libplplot;
{ Creates a viewport with the specified normalized subpage coordinates. }
procedure c_plvpor(xmin:TPLFLT; xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT);cdecl;external libplplot;
{ Defines a "standard" viewport with seven character heights for }
{ the left margin and four character heights everywhere else. }
procedure c_plvsta;cdecl;external libplplot;
{ Set up a window for three-dimensional plotting. }
procedure c_plw3d(basex:TPLFLT; basey:TPLFLT; height:TPLFLT; xmin:TPLFLT; xmax:TPLFLT; 
            ymin:TPLFLT; ymax:TPLFLT; zmin:TPLFLT; zmax:TPLFLT; alt:TPLFLT; 
            az:TPLFLT);cdecl;external libplplot;
{ Set pen width. }
procedure c_plwidth(width:TPLFLT);cdecl;external libplplot;
{ Set up world coordinates of the viewport boundaries (2d plots). }
procedure c_plwind(xmin:TPLFLT; xmax:TPLFLT; ymin:TPLFLT; ymax:TPLFLT);cdecl;external libplplot;
{ Set xor mode; mode = 1-enter, 0-leave, status = 0 if not interactive device }
procedure c_plxormod(mode:TPLBOOL; status:TPLBOOL_NC_SCALAR);cdecl;external libplplot;
{-------------------------------------------------------------------------- }
{		Functions for use from C or C++ only }
{-------------------------------------------------------------------------- }
{ Returns a list of file-oriented device names and their menu strings }
procedure plgFileDevs(p_menustr:PPPLCHAR_VECTOR; p_devname:PPPLCHAR_VECTOR; p_ndev:Plongint);cdecl;external libplplot;
{ Returns a list of all device names and their menu strings }
procedure plgDevs(p_menustr:PPPLCHAR_VECTOR; p_devname:PPPLCHAR_VECTOR; p_ndev:Plongint);cdecl;external libplplot;
{ Set the function pointer for the keyboard event handler }
procedure plsKeyEH(KeyEH:procedure (para1:PPLGraphicsIn; para2:TPLPointer; para3:Plongint); KeyEH_data:TPLPointer);cdecl;external libplplot;
{ Set the function pointer for the (mouse) button event handler }
procedure plsButtonEH(ButtonEH:procedure (para1:PPLGraphicsIn; para2:TPLPointer; para3:Plongint); ButtonEH_data:TPLPointer);cdecl;external libplplot;
{ Sets an optional user bop handler }
procedure plsbopH(handler:procedure (para1:TPLPointer; para2:Plongint); handler_data:TPLPointer);cdecl;external libplplot;
{ Sets an optional user eop handler }
procedure plseopH(handler:procedure (para1:TPLPointer; para2:Plongint); handler_data:TPLPointer);cdecl;external libplplot;
{ Set the variables to be used for storing error info }
procedure plsError(errcode:TPLINT_NC_SCALAR; errmsg:TPLCHAR_NC_VECTOR);cdecl;external libplplot;
{ Sets an optional user exit handler. }
procedure plsexit(handler:function (para1:TPLCHAR_VECTOR):longint);cdecl;external libplplot;
{ Sets an optional user abort handler. }
procedure plsabort(handler:procedure (para1:TPLCHAR_VECTOR));cdecl;external libplplot;
{ Transformation routines }
{ Identity transformation. }
procedure pltr0(x:TPLFLT; y:TPLFLT; tx:TPLFLT_NC_SCALAR; ty:TPLFLT_NC_SCALAR; pltr_data:TPLPointer);cdecl;external libplplot;
{ Does linear interpolation from singly dimensioned coord arrays. }
procedure pltr1(x:TPLFLT; y:TPLFLT; tx:TPLFLT_NC_SCALAR; ty:TPLFLT_NC_SCALAR; pltr_data:TPLPointer);cdecl;external libplplot;
{ Does linear interpolation from doubly dimensioned coord arrays }
{ (column dominant, as per normal C 2d arrays). }
procedure pltr2(x:TPLFLT; y:TPLFLT; tx:TPLFLT_NC_SCALAR; ty:TPLFLT_NC_SCALAR; pltr_data:TPLPointer);cdecl;external libplplot;
{ Just like pltr2() but uses pointer arithmetic to get coordinates from }
{ 2d grid tables. }
procedure pltr2p(x:TPLFLT; y:TPLFLT; tx:TPLFLT_NC_SCALAR; ty:TPLFLT_NC_SCALAR; pltr_data:TPLPointer);cdecl;external libplplot;
{ Does linear interpolation from doubly dimensioned coord arrays }
{ (row dominant, i.e. Fortran ordering). }
procedure pltr2f(x:TPLFLT; y:TPLFLT; tx:TPLFLT_NC_SCALAR; ty:TPLFLT_NC_SCALAR; pltr_data:TPLPointer);cdecl;external libplplot;
{ }
{ Returns a pointer to a plf2ops_t stucture with pointers to functions for }
{ accessing 2-D data referenced as (PLFLT **), such as the C variable z }
{ declared as... }
{ }
{   PLFLT z[nx][ny]; }
{ }
function plf2ops_c:TPLF2OPS;cdecl;external libplplot;
{ }
{ Returns a pointer to a plf2ops_t stucture with pointers to functions for accessing 2-D data }
{ referenced as (PLfGrid2 *), where the PLfGrid2's "f" is treated as type }
{ (PLFLT **). }
{ }
function plf2ops_grid_c:TPLF2OPS;cdecl;external libplplot;
{ }
{ Returns a pointer to a plf2ops_t stucture with pointers to functions for }
{ accessing 2-D data stored in (PLfGrid2 *), with the PLfGrid2's "f" field }
{ treated as type (PLFLT *) pointing to 2-D data stored in row-major order. }
{ In the context of plotting, it might be easier to think of it as "X-major" }
{ order.  In this ordering, values for a single X index are stored in }
{ consecutive memory locations. }
{ }
function plf2ops_grid_row_major:TPLF2OPS;cdecl;external libplplot;
{ }
{ Returns a pointer to a plf2ops_t stucture with pointers to functions for }
{ accessing 2-D data stored in (PLfGrid2 *), with the PLfGrid2's "f" field }
{ treated as type (PLFLT *) pointing to 2-D data stored in column-major order. }
{ In the context of plotting, it might be easier to think of it as "Y-major" }
{ order.  In this ordering, values for a single Y index are stored in }
{ consecutive memory locations. }
{ }
function plf2ops_grid_col_major:TPLF2OPS;cdecl;external libplplot;
{ Function evaluators (Should these be deprecated in favor of plf2ops?) }
{ }
{ Does a lookup from a 2d function array.  plf2eval_data is treated as type }
{ (PLFLT **) and data for (ix,iy) is returned from... }
{ }
{ plf2eval_data[ix][iy]; }
{ }
function plf2eval1(ix:TPLINT; iy:TPLINT; plf2eval_data:TPLPointer):TPLFLT;cdecl;external libplplot;
{ }
{ Does a lookup from a 2d function array.  plf2eval_data is treated as type }
{ (PLfGrid2 *) and data for (ix,iy) is returned from... }
{ }
{ plf2eval_data->f[ix][iy]; }
{ }
function plf2eval2(ix:TPLINT; iy:TPLINT; plf2eval_data:TPLPointer):TPLFLT;cdecl;external libplplot;
{ }
{ Does a lookup from a 2d function array.  plf2eval_data is treated as type }
{ (PLfGrid *) and data for (ix,iy) is returned from... }
{ }
{ plf2eval_data->f[ix * plf2eval_data->ny + iy]; }
{ }
{ This is commonly called "row-major order", but in the context of plotting, }
{ it might be easier to think of it as "X-major order".  In this ordering, }
{ values for a single X index are stored in consecutive memory locations. }
{ This is also known as C ordering. }
{ }
function plf2eval(ix:TPLINT; iy:TPLINT; plf2eval_data:TPLPointer):TPLFLT;cdecl;external libplplot;
{ }
{ Does a lookup from a 2d function array.  plf2eval_data is treated as type }
{ (PLfGrid *) and data for (ix,iy) is returned from... }
{ }
{ plf2eval_data->f[ix + iy * plf2eval_data->nx]; }
{ }
{ This is commonly called "column-major order", but in the context of }
{ plotting, it might be easier to think of it as "Y-major order".  In this }
{ ordering, values for a single Y index are stored in consecutive memory }
{ locations.  This is also known as FORTRAN ordering. }
{ }
function plf2evalr(ix:TPLINT; iy:TPLINT; plf2eval_data:TPLPointer):TPLFLT;cdecl;external libplplot;
{ Command line parsing utilities }
{ Clear internal option table info structure. }
procedure plClearOpts;cdecl;external libplplot;
{ Reset internal option table info structure. }
procedure plResetOpts;cdecl;external libplplot;
{ Merge user option table into internal info structure. }
function plMergeOpts(options:PPLOptionTable; name:TPLCHAR_VECTOR; notes:PPLCHAR_VECTOR):TPLINT;cdecl;external libplplot;
{ Set the strings used in usage and syntax messages. }
procedure plSetUsage(program_string:TPLCHAR_VECTOR; usage_string:TPLCHAR_VECTOR);cdecl;external libplplot;
{ Process input strings, treating them as an option and argument pair. }
{ The first is for the external API, the second the work routine declared }
{ here for backward compatibilty. }
function c_plsetopt(opt:TPLCHAR_VECTOR; optarg:TPLCHAR_VECTOR):TPLINT;cdecl;external libplplot;
{ Process options list using current options info. }
function c_plparseopts(p_argc:Plongint; argv:TPLCHAR_NC_MATRIX; mode:TPLINT):TPLINT;cdecl;external libplplot;
{ Print usage & syntax message. }
procedure plOptUsage;cdecl;external libplplot;
{ Miscellaneous }
{ Set the output file pointer }
procedure plgfile(p_file:PPFILE);cdecl;external libplplot;
{ Get the output file pointer }
procedure plsfile(file:PFILE);cdecl;external libplplot;
{ Get the escape character for text strings. }
procedure plgesc(p_esc:TPLCHAR_NC_SCALAR);cdecl;external libplplot;
{ Front-end to driver escape function. }
procedure pl_cmd(op:TPLINT; ptr:TPLPointer);cdecl;external libplplot;
{ Return full pathname for given file if executable }
function plFindName(p:TPLCHAR_NC_VECTOR):TPLINT;cdecl;external libplplot;
{ Looks for the specified executable file according to usual search path. }
function plFindCommand(fn:TPLCHAR_VECTOR):TPLCHAR_NC_VECTOR;cdecl;external libplplot;
{ Gets search name for file by concatenating the dir, subdir, and file }
{ name, allocating memory as needed. }
procedure plGetName(dir:TPLCHAR_VECTOR; subdir:TPLCHAR_VECTOR; filename:TPLCHAR_VECTOR; filespec:PPLCHAR_NC_VECTOR);cdecl;external libplplot;
{ Prompts human to input an integer in response to given message. }
function plGetInt(s:TPLCHAR_VECTOR):TPLINT;cdecl;external libplplot;
{ Prompts human to input a float in response to given message. }
function plGetFlt(s:TPLCHAR_VECTOR):TPLFLT;cdecl;external libplplot;
{ C, C++ only.  Determine the Iliffe column vector of pointers to PLFLT row }
{ vectors corresponding to a 2D matrix of PLFLT's that is statically }
{ allocated. }
procedure plStatic2dGrid(zIliffe:TPLFLT_NC_MATRIX; zStatic:TPLFLT_VECTOR; nx:TPLINT; ny:TPLINT);cdecl;external libplplot;
{ C, C++ only.  Allocate a block of memory for use as a 2-d grid of PLFLT's organized }
{ as an Iliffe column vector of pointers to PLFLT row vectors. }
procedure plAlloc2dGrid(f:PPLFLT_NC_MATRIX; nx:TPLINT; ny:TPLINT);cdecl;external libplplot;
{ Frees a block of memory allocated with plAlloc2dGrid(). }
procedure plFree2dGrid(f:TPLFLT_NC_MATRIX; nx:TPLINT; ny:TPLINT);cdecl;external libplplot;
{ Find the maximum and minimum of a 2d matrix allocated with plAllc2dGrid(). }
procedure plMinMax2dGrid(f:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; fmax:TPLFLT_NC_SCALAR; fmin:TPLFLT_NC_SCALAR);cdecl;external libplplot;
{ Wait for graphics input event and translate to world coordinates }
function plGetCursor(gin:PPLGraphicsIn):TPLINT;cdecl;external libplplot;
{ Translates relative device coordinates to world coordinates. }
function plTranslateCursor(gin:PPLGraphicsIn):TPLINT;cdecl;external libplplot;
{ Set the pointer to the data used in driver initialisation }
{ N.B. Currently used only by the wxwidgets device driver and }
{ associated binding.  This function might be used for other device drivers }
{ later on whether written in c++ or c.  But this function is not part of the }
{ common API and should not be propagated to any binding other than }
{ c++. }
procedure plsdevdata(data:TPLPointer);cdecl;external libplplot;
{ C++ end of extern C conditionnal removed }
{$if 0}
{$if defined ( __GNUC__ ) && __GNUC__ > 3}
(** unsupported pragma#pragma GCC visibility pop*)
{$endif}
{$endif}
{$endif}
{ __PLPLOT_H__ }

// === Konventiert am: 31-3-26 20:05:13 ===


implementation



end.
