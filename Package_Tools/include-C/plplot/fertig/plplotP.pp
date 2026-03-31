
unit plplotP;
interface

{
  Automatically converted by H2Pas 1.0.0 from plplotP.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    plplotP.h
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
Parc_struct  = ^arc_struct;
Pbyte  = ^byte;
Pcaddr_t  = ^caddr_t;
Pchar  = ^char;
Pcont_level  = ^cont_level;
Pcont_line  = ^cont_line;
PDrvOpt  = ^DrvOpt;
PEscText  = ^EscText;
PFCI_to_FontName_Table  = ^FCI_to_FontName_Table;
PFILE  = ^FILE;
PHershey_to_Unicode_table  = ^Hershey_to_Unicode_table;
PIMG_DT  = ^IMG_DT;
PPLColor  = ^PLColor;
PPLFLT  = ^PLFLT;
PPLINT  = ^PLINT;
PPLStream  = ^PLStream;
PPLUNICODE  = ^PLUNICODE;
PPLWindow  = ^PLWindow;
Psmallint  = ^smallint;
Pword  = ^word;
Pxxxxxxxxxxx  = ^xxxxxxxxxxx;
Pxxxxxxxxxxxxx  = ^xxxxxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  Internal (private) macros and prototypes for the PLplot package.  This }
{  header file must be included before all others, including system header }
{  files.  This file is typically needed when including driver specific }
{  header files (e.g. pltkd.h). }
{ }
{  Copyright (C) 1993, 1994, 1995  by }
{  Maurice J. LeBrun, Geoff Furnish, Tony Richardson. }
{ }
{  Copyright (C) 2004  Rafael Laboissiere }
{  Copyright (C) 2004  Joao Cardoso }
{  Copyright (C) 2004  Andrew Roach }
{  Copyright (C) 2006  Andrew Ross }
{  Copyright (C) 2006  Hazen Babcock }
{  Copyright (C) 2001-2015  Alan W. Irwin }
{ }
{ }
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
{ }
{ }
{$ifndef __PLPLOTP_H__}
{$define __PLPLOTP_H__}
{-------------------------------------------------------------------------- }
{ Select environment.  Must be done before anything else. }
{ }
{ Basically we want the widest range of system services that are available. }
{ Fortunately on many systems, that is the default.  To get "everything", }
{ one of the following must be defined, as appropriate: }
{ }
{ _GNU_SOURCE     on Linux (default) }
{ _OSF_SOURCE     on OSF1 (default) }
{ _HPUX_SOURCE    on HP (not default) }
{ _ALL_SOURCE     on AIX (no idea) }
{ }
{ To see where these are set, do the following: }
{ }
{    cd /usr/include; grep SOURCE *.h | fgrep 'define ' }
{ }
{ and the file containing lots of these is the one you want (features.h on }
{ Linux, standards.h on OSF1, etc).  Follow the logic to see what needs to be }
{ defined to get "everything", i.e. POSIX.*, XOPEN, etc. }
{ }
{ Note that for specific functionality, we test using autoconf.  Still it's }
{ best to stick to ANSI C, POSIX.1, and POSIX.2, in that order, for maximum }
{ portability. }
{-------------------------------------------------------------------------- }
{ HPUX - if this is no longer needed, please remove it }
{$ifdef _HPUX}
{$define _HPUX_SOURCE}
{$endif}
{ A/IX - if this is no longer needed, please remove it }
{$ifdef _AIX}
{$define _ALL_SOURCE}
{$endif}
{ Add others here as needed. }
{-------------------------------------------------------------------------- }
{	Configuration settings }
{ }
{ Some of the macros set during configuration are described here. }
{ }
{ If HAVE_TERMIOS_H is set, we employ POSIX.1 tty terminal I/O. }
{ }
{ If STDC_HEADERS is defined, the system's libc is ANSI-compliant. }
{ ANSI libc calls are used for: (a) setting up handlers to be called }
{ before program exit (via the "atexit" call), and (b) for seek }
{ operations.  Again, the code is usable without these.  An ANSI libc }
{ should be available, given the requirement of an ANSI compiler.  Some }
{ reasons why not: (a) the vendor didn't supply a complete ANSI }
{ environment, or (b) the ANSI libc calls are buggy, or (c) you ported }
{ gcc to your system but not glibc (for whatever reason).  Note: without }
{ an ANSI C lib, if you ^C out of a program using one of the PLplot tek }
{ drivers, your terminal may be left in a strange state. }
{-------------------------------------------------------------------------- }
{$include "plConfig.h"}
{$ifdef caddr_t}
{$undef caddr_t}
{$ifndef __USE_BSD}
type
  Pcaddr_t = ^Tcaddr_t;
  Tcaddr_t = Pchar;
{$endif}
{$endif}
{ System headers }
{$include <ctype.h>}
{$include <math.h>}
{$include <string.h>}
{$include <limits.h>}
{$include <float.h>}
{$ifdef PL_HAVE_UNISTD_H}
{$include <unistd.h>}
{$endif}
{$include <locale.h>}
{ (AM) Define M_PI if the platform does not include it }
{ (MSVC for instance) }
{$if !defined ( M_PI )}

const
  M_PI = 3.14159265358979323846;  
{$endif}
{ }
{ Macros for file positioning.  I tried switching to f[sg]etpos() because I }
{ like the semantics better, but ran into the problem that fpos_t is not }
{ always a base type (it may be a struct).  This is a problem because the }
{ metafile driver needs to write relative offsets into the file itself.  So }
{ instead we use fseek,tell at a low level but keep the f[sg]etpos }
{ semantics using these macros. }
{ }
{$ifdef STDC_FPOS_T}
{$undef STDC_FPOS_T}
{$endif}
{$include "pldll.h"}
{ Include all externally-visible definitions and prototypes }
{ plplot.h also includes some handy system header files }
{$include "plplot.h"}
{ plstream definition }
{$include "plstrm.h"}
{ If not including this file from inside of plcore.h, declare plsc }
{$ifndef __PLCORE_H__}
{ C++ extern C conditionnal removed }
{ extern PLStream PLDLLIMPORT *plsc; }
  var
    plsc : PPLStream;cvar;external;
{ C++ end of extern C conditionnal removed }
{$include "pldebug.h"}
{$endif}
{-------------------------------------------------------------------------- }
{                       Utility macros }
{-------------------------------------------------------------------------- }
{$ifndef TRUE}

const
  TRUE = 1;  
  FALSE = 0;  
{$endif}
{ Used to help ensure everything malloc'ed gets freed }
{ A coordinate value that should never occur }

const
  PL_UNDEFINED = -(9999999);  
{ Declarations for save string functions }
{$ifdef PL_HAVE_SNPRINTF}
{ In case only _snprintf is declared (as for Visual C++ and }
{ Borland compiler toolset) we redefine the function names }
{$ifdef _PL_HAVE_SNPRINTF}
  snprintf = _snprintf;  
  snscanf = _snscanf;  
{$endif}
{ _PL_HAVE_SNPRINTF }
{$else}
{ !PL_HAVE_SNPRINTF }
{ declare dummy functions which just call the unsafe }
{ functions ignoring the size of the string }

function plsnprintf(buffer:Pchar; n:longint; format:TPLCHAR_VECTOR; args:array of const):longint;cdecl;external;
function plsnprintf(buffer:Pchar; n:longint; format:TPLCHAR_VECTOR):longint;cdecl;external;
function plsnscanf(buffer:TPLCHAR_VECTOR; n:longint; format:TPLCHAR_VECTOR; args:array of const):longint;cdecl;external;
function plsnscanf(buffer:TPLCHAR_VECTOR; n:longint; format:TPLCHAR_VECTOR):longint;cdecl;external;
const
  snprintf = plsnprintf;  
  snscanf = plsnscanf;  
{$endif}
{ PL_HAVE_SNPRINTF }
{-------------------------------------------------------------------------- }
{ Add in missing isnan / isinf functions on some platforms }
{-------------------------------------------------------------------------- }
{$if defined ( PL__HAVE_ISNAN )}

const
  isnan = _isnan;  
{$if defined ( _MSC_VER )}
{$include <float.h>}
{$endif}
{$endif}
{$if defined ( PL__HAVE_ISINF )}

const
  isinf = _isinf;  
{$endif}
{$if defined ( PL_HAVE_FINITE )}

const
  isfinite = finite;  
{$endif}
{$if defined ( PL__HAVE_FINITE )}

const
  isfinite = _finite;  
{$endif}
{ Note these replacements follow the old BSD convention and not }
{ C99. In particular isinf does not distinguish +/- inf. }
{$if !defined ( PL_HAVE_ISNAN )}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function isnan(x : longint) : longint;

{$endif}
{$if !defined ( PL_HAVE_ISINF )}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function isinf(x : longint) : longint;

{$endif}
{$if !defined ( PL_HAVE_ISFINITE )}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function isfinite(x : longint) : longint;

{$endif}
{ Check if C99 HUGE_VAL macro is available - if not then }
{ define a replacement }
{$ifndef HUGE_VAL}

const
  HUGE_VAL = 1.0/0.0;  
{$endif}
{-------------------------------------------------------------------------- }
{                       PLPLOT control macros }
{-------------------------------------------------------------------------- }
{ Some constants }

const
  PL_MAXPOLY = 256;  { Max segments in polyline or polygon }
  PL_NSTREAMS = 100;  { Max number of concurrent streams. }
  PL_RGB_COLOR = -(1);  { A hack }
  TEXT_MODE = 0;  
  GRAPHICS_MODE = 1;  
{$ifndef PI}

const
  PI = 3.1415926535897932384;  
{$endif}
{ These define the virtual coordinate system used by the metafile driver. }
{ Others are free to use it, or some variation, or define their own. }
{ Note desktop monitors of reasonable quality typically have 0.25 mm spacing }
{ between dots which corresponds to 4.0 dots per mm.  The parameters here }
{ roughly correspond to a 14" monitor at 1024x768 resolution, which should }
{ work fine at other sizes/resolutions.  The number of virtual dots per mm is }
{ scaled by a factor of 32, with pixels scaled accordingly.  The customary }
{ x/y ratio of 4:3 is used. }
{ }

const
  PIXELS_X = 32768;  { Number of virtual pixels in x }
  PIXELS_Y = 24576;  { Number of virtual pixels in x }
  DPMM = 4.0;  { dots per mm }
{xxxxxxx#define VDPMM       ( DPMM * 32 )        // virtual dots per mm }
  LPAGE_X = PIXELS_X/VDPMM;  { virtual page length in x in mm (256) }
  LPAGE_Y = PIXELS_Y/VDPMM;  { virtual page length in y in mm (192) }
{ Constants that help to define ideal plspage arguments for devices }
  PLPLOT_MM_PER_INCH = 25.4;  
  PLPLOT_POINTS_PER_INCH = 72.0;  
  PLPLOT_WIDTH_A4_MM = 297.0;  
  PLPLOT_HEIGHT_A4_MM = 210.0;  
  PLPLOT_WIDTH_A5_MM = 210.0;  
  PLPLOT_HEIGHT_A5_MM = 148.0;  
{ Devices with pixel units for sizes. }
{ Adopt this default value as reasonable approximation for typical }
{ LCD monitors, but note that the user can replace this default by }
{ setting plsc->[xy]dpi values (e.g., by using the -dpi command-line }
{ option or by calling plspage with non-zero first two arguments). }
  PLPLOT_DEFAULT_PIXELS_PER_INCH = 90.0;  
{ These default pixel dimensions correspond to A5 size if actual }
{ pixels per inch is PLPLOT_DEFAULT_PIXELS_PER_INCH }
{ xxxxxxxxxxx#define PLPLOT_DEFAULT_WIDTH_PIXELS       ( (int) ( PLPLOT_WIDTH_A5_MM * PLPLOT_DEFAULT_PIXELS_PER_INCH / PLPLOT_MM_PER_INCH ) ) }
{ xxxxxxxxxxxx#define PLPLOT_DEFAULT_HEIGHT_PIXELS      ( (int) ( PLPLOT_HEIGHT_A5_MM * PLPLOT_DEFAULT_PIXELS_PER_INCH / PLPLOT_MM_PER_INCH ) ) }
{ Devices with real world units for sizes. }
{ N.B. these devices normally use fixed values of units per inch, }
{ i.e., they ignore any attempt by users to set plsc->[xy]dpi values }
{ (e.g., by using the -dpi command-line option or by calling plspage }
{ with non-zero first two arguments). }
{ 1. Devices with mm units for sizes. }
{ These default mm dimensions correspond to A4 size. }
{ xxxxxx#define PLPLOT_DEFAULT_WIDTH_MM     ( (int) ( PLPLOT_WIDTH_A4_MM ) }
{ xxxxxxxxxx#define PLPLOT_DEFAULT_HEIGHT_MM    ( (int) ( PLPLOT_HEIGHT_A4_MM ) }
{ 2. Devices with points (= 1/72 inch) units for sizes. }
{ These default points dimensions correspond to A4 size. }
{xxxxxxxx#define PLPLOT_DEFAULT_WIDTH_POINTS     ( (int) ( PLPLOT_WIDTH_A4_MM * PLPLOT_POINTS_PER_INCH / PLPLOT_MM_PER_INCH ) ) }
{ xxxxxxxxxxx #define PLPLOT_DEFAULT_HEIGHT_POINTS    ( (int) ( PLPLOT_HEIGHT_A4_MM * PLPLOT_POINTS_PER_INCH / PLPLOT_MM_PER_INCH ) ) }
{ This defines the first argument of the plRotPhy invocation that is made }
{ in a number of device drivers (e.g., found in ps.c }
{ and pstex.c) to rotate them "permanently" from portrait mode to non- }
{ portrait mode.  ORIENTATION of 1 corresponds to seascape mode (90 deg }
{ clockwise rotation from portrait).  This is the traditional value }
{ effectively used in all older versions of PLplot. ORIENTATION of 3 }
{ corresponds to landscape mode (90 deg *counter*-clockwise rotation from }
{ portrait) which is the new default non-portrait orientation. }
  ORIENTATION = 3;  
{ Switches for state function call. }
  PLSTATE_WIDTH = 1;  { pen width }
  PLSTATE_COLOR0 = 2;  { change to color in cmap 0 }
  PLSTATE_COLOR1 = 3;  { change to color in cmap 1 }
  PLSTATE_FILL = 4;  { set area fill to a standard pattern }
  PLSTATE_CMAP0 = 5;  { change to cmap 0 }
  PLSTATE_CMAP1 = 6;  { change to cmap 1 }
  PLSTATE_CHR = 7;  { change character height }
  PLSTATE_SYM = 8;  { change symbol size }
  PLSTATE_EOFILL = 9;  { change to even odd fill rule }
{ Enum for flagging the render status of PLplot }
type
  Txxxxxxxxxxx =  Longint;
  Const
    AT_BOP = 0;
    DRAWING = 1;
    AT_EOP = 2;

{ Bit switches used in the driver interface }
  PLDI_MAP = $01;  
  PLDI_ORI = $02;  
  PLDI_PLT = $04;  
  PLDI_DEV = $08;  
{ Default size for family files, in KB. }
{$ifndef PL_FILESIZE_KB}

const
  PL_FILESIZE_KB = 1000;  
{$endif}
{ Font file names. }
{$define PLPLOT5_FONTS}
{$ifdef PLPLOT5_FONTS}

const
  PL_XFONT = 'plxtnd5.fnt';  
  PL_SFONT = 'plstnd5.fnt';  
{$else}

const
  PL_XFONT = 'plxtnd4.fnt';  
  PL_SFONT = 'plstnd4.fnt';  
{$endif}
{-------------------------------------------------------------------------- }
{ The following environment variables are defined: }
{ }
{	PLPLOT_BIN      # where to find executables }
{	PLPLOT_LIB      # where to find library files (fonts, maps, etc) }
{	PLPLOT_TCL      # where to find tcl scripts }
{ }
{	PLPLOT_HOME     # basename of plplot hierarchy }
{ }
{ search order: }
{	1)	the most specific possible locators, one of }
{			$(PLPLOT_BIN) }
{			$(PLPLOT_LIB) }
{			$(PLPLOT_TCL) }
{		as appropriate }
{ }
{	2)	the current directory }
{ }
{	3)	one of  $(PLPLOT_HOME)/bin }
{			$(PLPLOT_HOME)/lib }
{			$(PLPLOT_HOME)/tcl }
{		as appropriate }
{ }
{	4)	as appropriate, the compile-time (Makefile) }
{		BIN_DIR, LIB_DIR, TCL_DIR }
{ }
{  8 Jun 1994  mj olesen (olesen@weber.me.queensu.ca) }
{ }
{ Other notes: }
{ }
{ In addition to the directories above, the following are also used: }
{ }
{ Lib file search path: PLLIBDEV (see plctrl.c).  This is checked last, }
{ and is a system-dependent hardwired location. }
{ }
{ Tcl search path: $HOME/tcl is searched before the install location, }
{ TCL_DIR. }
{-------------------------------------------------------------------------- }

const
  PLPLOT_BIN_ENV = 'PLPLOT_BIN';  
  PLPLOT_LIB_ENV = 'PLPLOT_LIB';  
  PLPLOT_TCL_ENV = 'PLPLOT_TCL';  
  PLPLOT_HOME_ENV = 'PLPLOT_HOME';  
{ Maximum size for path strings in the plplot code }
  PLPLOT_MAX_PATH = 1024;  
{ }
{   Some stuff that is included (and compiled into) plsym.h }
{   Other modules might want this, so we will "extern" it }
{ }
{ }
{$ifndef __PLSYM_H__}
type
  PHershey_to_Unicode_table = ^THershey_to_Unicode_table;
  THershey_to_Unicode_table = record
      Hershey : dword;
      Unicode : TPLUNICODE;
      Font : char;
    end;
  var
    number_of_entries_in_hershey_to_unicode_table : longint;cvar;external;
    hershey_to_unicode_lookup_table : PHershey_to_Unicode_table;cvar;external;
{$endif}
{ Greek character translation array (defined in plcore.c) }
(* Const before type ignored *)
  var
    plP_greek_mnemonic : Pchar;cvar;external;
{-------------------------------------------------------------------------- }
{		Function Prototypes }
{ }
{ These typically should not be called directly by the user. }
{-------------------------------------------------------------------------- }
{ C++ extern C conditionnal removed }
{ Number of elements in the affine vector representation of the affine }
{ transformation matrix. }

const
  NAFFINE = 6;  
{ Returns affine identity matrix }

procedure plP_affine_identity(affine_vector:PPLFLT);cdecl;external;
{ Translate new coordinate system axes relative to the old. }
procedure plP_affine_translate(affine_vector:PPLFLT; xtranslate:TPLFLT; ytranslate:TPLFLT);cdecl;external;
{ Scale new coordinate system axes relative to the old. }
procedure plP_affine_scale(affine_vector:PPLFLT; xscale:TPLFLT; yscale:TPLFLT);cdecl;external;
{ Rotate new coordinate system axes relative to the old. }
{ angle is in degrees. }
procedure plP_affine_rotate(affine_vector:PPLFLT; angle:TPLFLT);cdecl;external;
{ Skew new X coordinate axis relative to the old. }
{ angle is in degrees. }
procedure plP_affine_xskew(affine_vector:PPLFLT; angle:TPLFLT);cdecl;external;
{ Skew new Y coordinate axis relative to the old. }
{ angle is in degrees. }
procedure plP_affine_yskew(affine_vector:PPLFLT; angle:TPLFLT);cdecl;external;
{ Multiply two affine transformation matrices to form a third. }
{ }
{ A = B * C }
{ }
{ }
procedure plP_affine_multiply(affine_vectorA:PPLFLT; affine_vectorB:TPLFLT_VECTOR; affine_vectorC:TPLFLT_VECTOR);cdecl;external;
{ Determines interval between numeric labels }
procedure pldtik(vmin:TPLFLT; vmax:TPLFLT; tick:PPLFLT; nsubt:PPLINT; ld:TPLBOOL);cdecl;external;
{ Writes numeric labels on side(s) of box in custom locations }
procedure label_box_custom(xopt:TPLCHAR_VECTOR; n_xticks:TPLINT; xticks:TPLFLT_VECTOR; yopt:TPLCHAR_VECTOR; n_yticks:TPLINT; 
            yticks:TPLFLT_VECTOR);cdecl;external;
{ Determine factor to convert date / time in seconds to more natural }
{ units }
procedure pldtfac(vmin:TPLFLT; vmax:TPLFLT; factor:PPLFLT; tstart:PPLFLT);cdecl;external;
{ Determines precision of box labels }
procedure pldprec(vmin:TPLFLT; vmax:TPLFLT; tick:TPLFLT; lf:TPLINT; mode:PPLINT; 
            prec:PPLINT; digmax:TPLINT; scale:PPLINT);cdecl;external;
{ Draws a polyline within the clip limits. }
procedure plP_pllclp(x:PPLINT; y:PPLINT; npts:TPLINT; xmin:TPLINT; xmax:TPLINT; 
            ymin:TPLINT; ymax:TPLINT; draw:procedure (para1:Psmallint; para2:Psmallint; para3:TPLINT));cdecl;external;
{ Fills a polygon within the clip limits. }
procedure plP_plfclp(x:PPLINT; y:PPLINT; npts:TPLINT; xmin:TPLINT; xmax:TPLINT; 
            ymin:TPLINT; ymax:TPLINT; draw:procedure (para1:Psmallint; para2:Psmallint; para3:TPLINT));cdecl;external;
{ Clip a polygon to the 3d bounding plane }
function plP_clip_poly(Ni:longint; Vi:array[0..2] of PPLFLT; axis:longint; dir:TPLFLT; offset:TPLFLT):longint;cdecl;external;
{ Get clipped endpoints }
function plP_clipline(p_x1:PPLINT; p_y1:PPLINT; p_x2:PPLINT; p_y2:PPLINT; xmin:TPLINT; 
           xmax:TPLINT; ymin:TPLINT; ymax:TPLINT):longint;cdecl;external;
{ Stores hex digit value into FCI (font characterization integer). }
procedure plP_hex2fci(hexdigit:byte; hexpower:byte; pfci:PPLUNICODE);cdecl;external;
{ Retrieves hex digit value from FCI (font characterization integer). }
procedure plP_fci2hex(fci:TPLUNICODE; phexdigit:Pbyte; hexpower:byte);cdecl;external;
{ Pattern fills in software the polygon bounded by the input points. }
procedure plfill_soft(x:Psmallint; y:Psmallint; npts:TPLINT);cdecl;external;
{ In case of an abort this routine is called.  It just prints out an }
{ error message and tries to clean up as much as possible. }
procedure plexit(errormsg:TPLCHAR_VECTOR);cdecl;external;
{ Just a front-end to exit(). }
procedure pl_exit;cdecl;external;
{ A handy way to issue warnings, if need be. }
procedure plwarn(errormsg:TPLCHAR_VECTOR);cdecl;external;
{ Same as plwarn(), but appends ", aborting plot" to the error message }
procedure plabort(errormsg:TPLCHAR_VECTOR);cdecl;external;
{ Loads either the standard or extended font. }
procedure plfntld(fnt:TPLINT);cdecl;external;
{ Release memory for fonts. }
procedure plfontrel;cdecl;external;
{ A replacement for strdup(), which isn't portable. }
function plstrdup(src:TPLCHAR_VECTOR):Pchar;cdecl;external;
{ Bin up cmap 1 space and assign colors to make inverse mapping easy. }
procedure plcmap1_calc;cdecl;external;
{ Draws a slanting tick at position (mx,my) (measured in mm) of }
{ vector length (dx,dy). }
procedure plstik(mx:TPLFLT; my:TPLFLT; dx:TPLFLT; dy:TPLFLT);cdecl;external;
{ Prints out a "string" at reference position with physical coordinates }
{ (refx,refy). }
procedure plstr(base:TPLINT; xform:PPLFLT; refx:TPLINT; refy:TPLINT; _string:TPLCHAR_VECTOR);cdecl;external;
{ Draws a tick parallel to x. }
procedure plxtik(x:TPLINT; y:TPLINT; below:TPLINT; above:TPLINT);cdecl;external;
{ Draws a tick parallel to y. }
procedure plytik(x:TPLINT; y:TPLINT; left:TPLINT; right:TPLINT);cdecl;external;
{ Driver interface filter -- }
{ passes all coordinates through a variety of filters. }
procedure difilt(para1:PPLINT; para2:PPLINT; para3:TPLINT; para4:PPLINT; para5:PPLINT; 
            para6:PPLINT; para7:PPLINT);cdecl;external;
{ Transforms the clipping region coordinates as necessary }
{ based on the current plot orientation, etc. }
procedure difilt_clip(para1:PPLINT; para2:PPLINT);cdecl;external;
{ Calculate scale of font size and scale of magnitude of vertical }
{ offset associated with superscripts and subscripts. }
procedure plP_script_scale(ifupper:TPLBOOL; level:PPLINT; old_scale:PPLFLT; scale:PPLFLT; old_offset:PPLFLT; 
            offset:PPLFLT);cdecl;external;
{ Driver draws text }
procedure plP_text(base:TPLINT; just:TPLFLT; xform:PPLFLT; x:TPLINT; y:TPLINT; 
            refx:TPLINT; refy:TPLINT; _string:TPLCHAR_VECTOR);cdecl;external;
{ Save LC_NUMERIC locale string, then set "C" locale to protect }
{ parts of PLplot which absolutely demand the LC_NUMERIC "C" locale. }
function plsave_set_locale:Pchar;cdecl;external;
{ Restore LC_NUMERIC locale that was determined by plsave_set_locale. }
procedure plrestore_locale(save_lc_numeric_locale:Pchar);cdecl;external;
{ Writes the Hershey symbol "ch" centred at the physical coordinate (x,y). }
procedure plhrsh(ch:TPLINT; x:TPLINT; y:TPLINT);cdecl;external;
{ where should structure definitions that must be seen by drivers and core source files, be? }
{ structure to be used by plcore.c and anydriver.c, related to plP_text() }
{ Indicates the type of text stored in the structure.  This flag }
{ is used by the plot metafiles to correctly store and then render }
{ the contents. }
{ Positioning settings }
{ ref point at base(1) or center(0) of text. Currently plplot only use 0 }
{ continuos justification, 0 left, 0.5 center, 1 right }
{ transformation (rotation) matrix }
{ raw reference point--after any transformation }
{ processed ref. point--after justification, displacement, etc, processing }
{ font face OPTIONALLY used for rendering hershey codes }
{ The following 3 fields are used by the alternative text handling pathway. }
{ The alternative text handling pathway allows the driver to process }
{ each character individually for unicode font handling }
{ See drivers/cairo.h for details about how this works. }
{ font storage }
{ character storage }
{ control character }
{ Used by plsym to store a unicode character for use by plfreetype }
{ an int to hold either a Hershey, ASC-II, or Unicode value for plsym calls }
{ Used to store a processed unicode string.  Used by plsym and }
{ text rendering by the driver }
{ a pointer to an array of ints holding either a Hershey, ASC-II, or Unicode value for cached plsym }
{ Non-unicode strings and unprocessed string in the unicode case }
(* Const before type ignored *)
{ text to draw }
{ plot symbol to draw }
type
  PEscText = ^TEscText;
  TEscText = record
      text_type :  Longint;
      Const
        PL_STRING_TEXT = 0;
        PL_STRING_SYMBOL = 1;
;
      base : TPLINT;
      just : TPLFLT;
      xform : PPLFLT;
      x : TPLINT;
      y : TPLINT;
      refx : TPLINT;
      refy : TPLINT;
      font_face : char;
      n_fci : TPLUNICODE;
      n_char : TPLUNICODE;
      n_ctrl_char : TPLINT;
      unicode_char : TPLUNICODE;
      unicode_array : PPLUNICODE;
      unicode_array_len : word;
      _string : Pchar;
      symbol : TPLINT;
    end;
{ }
{ structure that contains driver specific information, to be used by }
{ plargs.c and anydriver.c, related to plParseDrvOpts() and plHelpDrvOpts() }
{ }
{ a string with the name of the option }
{ the type of the variable to be set, see bellow the available types }
{ a pointer to the variable to be set }
{ help message of the option }
type
  PDrvOpt = ^TDrvOpt;
  TDrvOpt = record
      opt : TPLCHAR_VECTOR;
      _type : TPLINT;
      var_ptr : pointer;
      hlp_msg : TPLCHAR_VECTOR;
    end;
{ the available variable types, DrvOpt.type, for driver specific options }
  Txxxxxxxxxxxxx =  Longint;
  Const
    DRV_INT = 0;
    DRV_FLT = 1;
    DRV_STR = 2;

{ parse driver specific options, as in -drvopt <option[=value]>* }

function plParseDrvOpts(para1:PDrvOpt):longint;cdecl;external;
{ give help on driver specific options }
procedure plHelpDrvOpts(para1:PDrvOpt);cdecl;external;
{ }
{ structures to store contour lines }
{ }
const
  LINE_ITEMS = 20;  
type
  Pcont_line = ^Tcont_line;
  Tcont_line = record
      x : PPLFLT;
      y : PPLFLT;
      npts : TPLINT;
      next : Pcont_line;
    end;
{ INDENT-OFF (stop infinite recursion) }
{ contour level }
{ contour line struct }
{ contour level struct }
{ INDENT-ON }

  Pcont_level = ^Tcont_level;
  Tcont_level = record
      level : TPLFLT;
      line : Pcont_line;
      next : Pcont_level;
    end;

procedure cont_store(f:TPLFLT_MATRIX; nx:TPLINT; ny:TPLINT; kx:TPLINT; lx:TPLINT; 
            ky:TPLINT; ly:TPLINT; clevel:TPLFLT_VECTOR; nlevel:TPLINT; pltr:procedure (para1:TPLFLT; para2:TPLFLT; para3:PPLFLT; para4:PPLFLT; para5:TPLPointer); 
            pltr_data:TPLPointer; contour:PPCONT_LEVEL);cdecl;external;
procedure cont_clean_store(ct:PCONT_LEVEL);cdecl;external;
{ Get the viewport boundaries in world coordinates, expanded slightly }
procedure plP_xgvpw(p_xmin:PPLFLT; p_xmax:PPLFLT; p_ymin:PPLFLT; p_ymax:PPLFLT);cdecl;external;
{ Get x-y domain in world coordinates for 3d plots }
procedure plP_gdom(p_xmin:PPLFLT; p_xmax:PPLFLT; p_ymin:PPLFLT; p_ymax:PPLFLT);cdecl;external;
{ Get vertical (z) scale parameters for 3-d plot }
procedure plP_grange(p_zscl:PPLFLT; p_zmin:PPLFLT; p_zmax:PPLFLT);cdecl;external;
{ Get parameters used in 3d plots }
procedure plP_gw3wc(p_dxx:PPLFLT; p_dxy:PPLFLT; p_dyx:PPLFLT; p_dyy:PPLFLT; p_dyz:PPLFLT);cdecl;external;
{ Get clip boundaries in physical coordinates }
procedure plP_gclp(p_ixmin:PPLINT; p_ixmax:PPLINT; p_iymin:PPLINT; p_iymax:PPLINT);cdecl;external;
{ Set clip boundaries in physical coordinates }
procedure plP_sclp(ixmin:TPLINT; ixmax:TPLINT; iymin:TPLINT; iymax:TPLINT);cdecl;external;
{ Get physical device limits in physical coordinates }
procedure plP_gphy(p_ixmin:PPLINT; p_ixmax:PPLINT; p_iymin:PPLINT; p_iymax:PPLINT);cdecl;external;
{ Get number of subpages on physical device and current subpage }
procedure plP_gsub(p_nx:PPLINT; p_ny:PPLINT; p_cs:PPLINT);cdecl;external;
{ Set number of subpages on physical device and current subpage }
procedure plP_ssub(nx:TPLINT; ny:TPLINT; cs:TPLINT);cdecl;external;
{ Set up plot parameters according to the number of subpages. }
procedure plP_subpInit;cdecl;external;
{ Get number of pixels to a millimeter }
procedure plP_gpixmm(p_x:PPLFLT; p_y:PPLFLT);cdecl;external;
{ All the drivers call this to set physical pixels/mm. }
procedure plP_setpxl(xpmm0:TPLFLT; ypmm0:TPLFLT);cdecl;external;
{ Get background parameters (including line width) for 3d plot. }
procedure plP_gzback(zbf:PPPLINT; zbc:PPPLINT; zbt:PPPLFLT; zbw:PPPLFLT);cdecl;external;
{ Move to physical coordinates (x,y). }
procedure plP_movphy(x:TPLINT; y:TPLINT);cdecl;external;
{ Draw to physical coordinates (x,y). }
procedure plP_draphy(x:TPLINT; y:TPLINT);cdecl;external;
{ Move to world coordinates (x,y). }
procedure plP_movwor(x:TPLFLT; y:TPLFLT);cdecl;external;
{ Draw to world coordinates (x,y). }
procedure plP_drawor(x:TPLFLT; y:TPLFLT);cdecl;external;
{ Draw polyline in physical coordinates. }
procedure plP_draphy_poly(x:PPLINT; y:PPLINT; n:TPLINT);cdecl;external;
{ Draw polyline in world coordinates. }
procedure plP_drawor_poly(x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; n:TPLINT);cdecl;external;
{ Sets up physical limits of plotting device. }
procedure plP_setphy(xmin:TPLINT; xmax:TPLINT; ymin:TPLINT; ymax:TPLINT);cdecl;external;
{ Set up the subpage boundaries according to the current subpage selected }
procedure plP_setsub;cdecl;external;
{ Get the floating point precision (in number of places) in numeric labels. }
procedure plP_gprec(p_setp:PPLINT; p_prec:PPLINT);cdecl;external;
{ Get the date / time format for numeric labels }
(* Const before type ignored *)
function plP_gtimefmt:Pchar;cdecl;external;
{ Computes the length of a string in mm, including escape sequences. }
function plstrl(_string:TPLCHAR_VECTOR):TPLFLT;cdecl;external;
{ Similar to strpos, but searches for occurence of string str2. }
function plP_stindex(str1:TPLCHAR_VECTOR; str2:TPLCHAR_VECTOR):TPLINT;cdecl;external;
{ Searches string str for first occurence of character chr. }
function plP_strpos(str:TPLCHAR_VECTOR; chr:longint):TPLINT;cdecl;external;
{ Searches string str for character chr (case insensitive). }
function plP_stsearch(str:TPLCHAR_VECTOR; chr:longint):TPLBOOL;cdecl;external;
{ Conversion functions }
{ device coords to physical coords (x) }
function plP_dcpcx(x:TPLFLT):TPLINT;cdecl;external;
{ device coords to physical coords (y) }
function plP_dcpcy(y:TPLFLT):TPLINT;cdecl;external;
{ millimeters from bottom left-hand corner to physical coords (x) }
function plP_mmpcx(x:TPLFLT):TPLINT;cdecl;external;
{ millimeters from bottom left-hand corner to physical coords (y) }
function plP_mmpcy(y:TPLFLT):TPLINT;cdecl;external;
{ world coords to physical coords (x) }
function plP_wcpcx(x:TPLFLT):TPLINT;cdecl;external;
{ world coords to physical coords (y) }
function plP_wcpcy(y:TPLFLT):TPLINT;cdecl;external;
{ physical coords to device coords (x) }
function plP_pcdcx(x:TPLINT):TPLFLT;cdecl;external;
{ physical coords to device coords (y) }
function plP_pcdcy(y:TPLINT):TPLFLT;cdecl;external;
{ millimeters from bottom left corner to device coords (x) }
function plP_mmdcx(x:TPLFLT):TPLFLT;cdecl;external;
{ millimeters from bottom left corner to device coords (y) }
function plP_mmdcy(y:TPLFLT):TPLFLT;cdecl;external;
{ world coords into device coords (x) }
function plP_wcdcx(x:TPLFLT):TPLFLT;cdecl;external;
{ world coords into device coords (y) }
function plP_wcdcy(y:TPLFLT):TPLFLT;cdecl;external;
{ subpage coords to device coords (x) }
function plP_scdcx(x:TPLFLT):TPLFLT;cdecl;external;
{ subpage coords to device coords (y) }
function plP_scdcy(y:TPLFLT):TPLFLT;cdecl;external;
{ device coords to millimeters from bottom left-hand corner (x) }
function plP_dcmmx(x:TPLFLT):TPLFLT;cdecl;external;
{ device coords to millimeters from bottom left-hand corner (y) }
function plP_dcmmy(y:TPLFLT):TPLFLT;cdecl;external;
{ world coords into millimeters (x) }
function plP_wcmmx(x:TPLFLT):TPLFLT;cdecl;external;
{ world coords into millimeters (y) }
function plP_wcmmy(y:TPLFLT):TPLFLT;cdecl;external;
{ device coords to subpage coords (x) }
function plP_dcscx(x:TPLFLT):TPLFLT;cdecl;external;
{ device coords to subpage coords (y) }
function plP_dcscy(y:TPLFLT):TPLFLT;cdecl;external;
{ 3-d coords to 2-d projection (x) }
function plP_w3wcx(x:TPLFLT; y:TPLFLT; z:TPLFLT):TPLFLT;cdecl;external;
{ 3-d coords to 2-d projection (y) }
function plP_w3wcy(x:TPLFLT; y:TPLFLT; z:TPLFLT):TPLFLT;cdecl;external;
{ 3-d coords to 2-d projection (z) }
function plP_w3wcz(x:TPLFLT; y:TPLFLT; z:TPLFLT):TPLFLT;cdecl;external;
{ Returns the rotation and shear angle and stride from a plplot transformation matrix }
procedure plRotationShear(xFormMatrix:PPLFLT; rotation:PPLFLT; shear:PPLFLT; stride:PPLFLT);cdecl;external;
{ Test whether a point is in a polygon. }
function plP_pointinpolygon(n:TPLINT; x:TPLFLT_VECTOR; y:TPLFLT_VECTOR; xp:TPLFLT; yp:TPLFLT):longint;cdecl;external;
{ Driver calls }
{ Initialize device. }
procedure plP_init;cdecl;external;
{ Draw line between two points }
procedure plP_line(x:Psmallint; y:Psmallint);cdecl;external;
{ Draw polyline }
procedure plP_polyline(x:Psmallint; y:Psmallint; npts:TPLINT);cdecl;external;
{ Fill polygon }
procedure plP_fill(x:Psmallint; y:Psmallint; npts:TPLINT);cdecl;external;
{ Render gradient }
procedure plP_gradient(x:Psmallint; y:Psmallint; npts:TPLINT);cdecl;external;
{ draw image }
procedure plP_image(z:PPLFLT; nx:TPLINT; ny:TPLINT; xmin:TPLFLT; ymin:TPLFLT; 
            dx:TPLFLT; dy:TPLFLT; pltr:procedure (para1:TPLFLT; para2:TPLFLT; para3:PPLFLT; para4:PPLFLT; para5:TPLPointer); pltr_data:TPLPointer);cdecl;external;
{ Structure for holding arc data }
type
  Parc_struct = ^Tarc_struct;
  Tarc_struct = record
      x : TPLFLT;
      y : TPLFLT;
      a : TPLFLT;
      b : TPLFLT;
      angle1 : TPLFLT;
      angle2 : TPLFLT;
      rotate : TPLFLT;
      fill : TPLBOOL;
    end;
{ End of page }

procedure plP_eop;cdecl;external;
{ End of page }
procedure plP_bop;cdecl;external;
{ Tidy up device (flush buffers, close file, etc.) }
procedure plP_tidy;cdecl;external;
{ Change state. }
procedure plP_state(op:TPLINT);cdecl;external;
{ Escape function, for driver-specific commands. }
procedure plP_esc(op:TPLINT; ptr:pointer);cdecl;external;
{ Set up plot window parameters. }
procedure plP_swin(plwin:PPLWindow);cdecl;external;
{ Wait for user input }
procedure plP_wait;cdecl;external;
{ Return file pointer to lib file. }
function plLibOpen(fn:TPLCHAR_VECTOR):PFILE;cdecl;external;
{ Does required startup initialization of library. }
procedure pllib_init;cdecl;external;
{ Does preliminary setup of device driver. }
procedure pllib_devinit;cdecl;external;
{ Utility to copy one PLColor to another. }
procedure pl_cpcolor(to:PPLColor; from:PPLColor);cdecl;external;
{ Does required startup initialization of a stream. }
procedure plstrm_init;cdecl;external;
{ Builds a list of the active devices/streams by device name }
procedure plP_getinitdriverlist(names:Pchar);cdecl;external;
{ Checks a give list of device names against active streams and returns the number of matches }
function plP_checkdriverinit(names:Pchar):TPLINT;cdecl;external;
{ disable writing to plot buffer and pixmap }
procedure NoBufferNoPixmap;cdecl;external;
{ restart writing to plot buffer and pixmap }
procedure RestoreWrite2BufferPixmap;cdecl;external;
procedure grimage(x:Psmallint; y:Psmallint; z:Pword; nx:TPLINT; ny:TPLINT);cdecl;external;
function plInBuildTree:longint;cdecl;external;
procedure plimageslow(idata:PPLFLT; nx:TPLINT; ny:TPLINT; xmin:TPLFLT; ymin:TPLFLT; 
            dx:TPLFLT; dy:TPLFLT; pltr:procedure (para1:TPLFLT; para2:TPLFLT; para3:PPLFLT; para4:PPLFLT; para5:TPLPointer); pltr_data:TPLPointer);cdecl;external;
type
  PIMG_DT = ^TIMG_DT;
  TIMG_DT = record
      xmin : TPLFLT;
      ymin : TPLFLT;
      dx : TPLFLT;
      dy : TPLFLT;
    end;
{ }
{ void plfvect() }
{ }
{ Internal routine to plot a vector array with arbitrary coordinate }
{ and vector transformations. }
{ This is not currently intended to be called direct by the user }
{ }

procedure plfvect(plf2eval:function (para1:TPLINT; para2:TPLINT; para3:TPLPointer):TPLFLT; f2evalv_data:TPLPointer; f2evalc_data:TPLPointer; nx:TPLINT; ny:TPLINT; 
            scale:TPLFLT; pltr:procedure (para1:TPLFLT; para2:TPLFLT; para3:PPLFLT; para4:PPLFLT; para5:TPLPointer); pltr_data:TPLPointer);cdecl;external;
{ }
{  Internal function to get an index to the hershey table }
{ }
function plhershey2unicode(in:longint):longint;cdecl;external;
{ struct used for FCI to FontName lookups. }
(* Const before type ignored *)
type
  PFCI_to_FontName_Table = ^TFCI_to_FontName_Table;
  TFCI_to_FontName_Table = record
      fci : TPLUNICODE;
      pfont : Pbyte;
    end;
{ Internal function to obtain a pointer to a valid font name. }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function plP_FCI2FontName(fci:TPLUNICODE; lookup:PFCI_to_FontName_Table; nlookup:longint):Pchar;cdecl;external;
{ Internal function to free memory from driver options }
procedure plP_FreeDrvOpts;cdecl;external;
{ Convert a ucs4 unichar to utf8 char string }
function ucs4_to_utf8(unichar:TPLUNICODE; ptr:Pchar):longint;cdecl;external;
{ }
{ Wrapper functions for the system IO routines fread, fwrite }
{ }
{ wraps fwrite }
procedure plio_fwrite(para1:pointer; para2:Tsize_t; para3:Tsize_t; para4:PFILE);cdecl;external;
{ wraps fread }
procedure plio_fread(para1:pointer; para2:Tsize_t; para3:Tsize_t; para4:PFILE);cdecl;external;
{ wraps fgets }
procedure plio_fgets(para1:Pchar; para2:longint; para3:PFILE);cdecl;external;
{ Draws a tick parallel to x, using world coordinates }
procedure plwxtik(x:TPLFLT; y:TPLFLT; minor:TPLBOOL; invert:TPLBOOL);cdecl;external;
{ Draws a tick parallel to y, using world coordinates }
procedure plwytik(x:TPLFLT; y:TPLFLT; minor:TPLBOOL; invert:TPLBOOL);cdecl;external;
{ get drivers directory }
(* Const before type ignored *)
function plGetDrvDir:Pchar;cdecl;external;
{$ifdef PL_HAVE_FREETYPE}
procedure plD_FreeType_init(para1:PPLStream);cdecl;external;
procedure plD_render_freetype_text(para1:PPLStream; para2:PEscText);cdecl;external;
procedure plD_FreeType_Destroy(para1:PPLStream);cdecl;external;
procedure pl_set_extended_cmap0(para1:PPLStream; para2:longint; para3:longint);cdecl;external;
{$endif}
{ Create a temporary file securely }

function pl_create_tempfile(fname:PPchar):PFILE;cdecl;external;
{ Create a temporary fifo securely }
(* Const before type ignored *)
(* Const before type ignored *)
function pl_create_tempfifo(p_fifoname:PPchar; p_dirname:PPchar):Pchar;cdecl;external;
{ Read a meta file }
procedure plreadmetafile(infile:Pchar);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __PLPLOTP_H__ }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function isnan(x : longint) : longint;
begin
  isnan:=x<>x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function isinf(x : longint) : longint;
begin
  isinf:=( not (isnan(x))) and (@(isnan(x-x)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function isfinite(x : longint) : longint;
begin
  isfinite:= not (isnan(x-x));
end;


end.
