
unit cdk;
interface

{
  Automatically converted by H2Pas 1.0.0 from cdk.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cdk.h
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
Pboolean  = ^boolean;
Pchar  = ^char;
PEDisplayType  = ^EDisplayType;
PEExitType  = ^EExitType;
PEGraphDisplayType  = ^EGraphDisplayType;
PEHistogramDisplayType  = ^EHistogramDisplayType;
PEObjectType  = ^EObjectType;
PEStripType  = ^EStripType;
PFILE  = ^FILE;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: cdk.h,v 1.38 2012/03/20 22:01:57 tom Exp $
  }
{$ifndef CDK_H}
{$define CDK_H}
{ C++ extern C conditionnal removed }
{
 * Changes 2000-2009,2012 copyright Thomas E. Dickey
 * Copyright 1999, Mike Glover
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, distribute with
 * modifications, sublicense, and/or sell copies of the Software, and to permit
 * persons to whom the Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
 * ABOVE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
 * IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Except as contained in this notice, the name(s) of the above copyright
 * holders shall not be used in advertising or otherwise to promote the sale,
 * use or other dealings in this Software without prior written authorization.
  }
{$include <cdk/cdk_config.h>}
{$include <cdk/cdk_version.h>}
{$ifdef CDK_PERL_EXT}
{$undef	instr}
{$endif}
{$ifdef HAVE_XCURSES}
{$include <xcurses.h>}
{$ifndef mvwhline}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function mvwhline(win,y,x,c,n : longint) : longint;

{$endif}
{$ifndef mvwvline}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function mvwvline(win,y,x,c,n : longint) : longint;

{$endif}
(*** was #elif ****){$else defined(HAVE_NCURSESW_NCURSES_H)}
{$include <ncursesw/ncurses.h>}
(*** was #elif ****){$else defined(HAVE_NCURSES_NCURSES_H)}
{$include <ncurses/ncurses.h>}
(*** was #elif ****){$else defined(CDK_HAVE_NCURSES_H)}
{$include <ncurses.h>}
{$else}
{$include <curses.h>}
{$endif}
{$include <sys/types.h>}
{$include <sys/stat.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$include <ctype.h>}
{$ifdef CDK_HAVE_UNISTD_H}
{$include <unistd.h>}
{$endif}
{$ifdef CDK_HAVE_DIRENT_H}
{$include <dirent.h>}
{$endif}
{$include <time.h>}
{$include <errno.h>}
{$ifdef CDK_HAVE_PWD_H}
{$include <pwd.h>}
{$endif}
{$ifdef CDK_HAVE_GRP_H}
{$include <grp.h>}
{$endif}
{$ifdef CDK_HAVE_LIMITS_H}
{$include <limits.h>}
{$endif}
{$ifdef CDK_HAVE_GETOPT_HEADER}
{$ifdef CDK_HAVE_GETOPT_H}
{$include <getopt.h>}
{$endif}
{$else}
  var
    optind : longint;cvar;external;
    optarg : Pchar;cvar;external;
{$endif}
{
 * Definitions that we do not want if term.h does
  }
{$ifdef buttons}
{$undef buttons}
{$endif}
{$ifdef lines}
{$undef lines}
{$endif}
{$ifdef newline}
{$undef newline}
{$endif}
{
 * Values we normally get from limits.h (assume 32-bits)
  }
{$ifndef INT_MIN}

const
  INT_MIN = (-(INT_MAX))-1;  
{$endif}
{$ifndef INT_MAX}

const
  INT_MAX = 2147483647;  
{$endif}
{$ifndef GCC_UNUSED}
{nothing }
{$define GCC_UNUSED}
{$endif}
{$ifdef HAVE_LIBDMALLOC}
{$include <dmalloc.h>    /* Gray Watson's library */}
{$else}
{$undef  HAVE_LIBDMALLOC}

const
  HAVE_LIBDMALLOC = 0;  
{$endif}
{$ifdef HAVE_LIBDBMALLOC}
{$include <dbmalloc.h>   /* Conor Cahill's library */}
{$else}
{$undef  HAVE_LIBDBMALLOC}

const
  HAVE_LIBDBMALLOC = 0;  
{$endif}
{
 * This enumerated typedef lists all of the CDK widget types.
  }
type
  PEObjectType = ^TEObjectType;
  TEObjectType =  Longint;
  Const
    vNULL = 0;
    vALPHALIST = 1;
    vBUTTON = 2;
    vBUTTONBOX = 3;
    vCALENDAR = 4;
    vDIALOG = 5;
    vDSCALE = 6;
    vENTRY = 7;
    vFSCALE = 8;
    vFSELECT = 9;
    vFSLIDER = 10;
    vGRAPH = 11;
    vHISTOGRAM = 12;
    vITEMLIST = 13;
    vLABEL = 14;
    vMARQUEE = 15;
    vMATRIX = 16;
    vMENTRY = 17;
    vMENU = 18;
    vRADIO = 19;
    vSCALE = 20;
    vSCROLL = 21;
    vSELECTION = 22;
    vSLIDER = 23;
    vSWINDOW = 24;
    vTEMPLATE = 25;
    vTRAVERSE = 26;
    vUSCALE = 27;
    vUSLIDER = 28;
    vVIEWER = 29;
;
{
 * This enumerated typedef lists all the valid display types for
 * the entry, mentry, and template widgets.
  }
type
  PEDisplayType = ^TEDisplayType;
  TEDisplayType =  Longint;
  Const
    vINVALID = 0;
    vCHAR = 1;
    vHCHAR = 2;
    vINT = 3;
    vHINT = 4;
    vMIXED = 5;
    vHMIXED = 6;
    vUCHAR = 7;
    vLCHAR = 8;
    vUHCHAR = 9;
    vLHCHAR = 10;
    vUMIXED = 11;
    vLMIXED = 12;
    vUHMIXED = 13;
    vLHMIXED = 14;
    vVIEWONLY = 15;
;
{
 * This enumerated typedef lists all the display types for
 * the histogram widget.
  }
type
  PEHistogramDisplayType = ^TEHistogramDisplayType;
  TEHistogramDisplayType =  Longint;
  Const
    vNONE = 0;
    vPERCENT = 1;
    vFRACTION = 2;
    vREAL = 3;
;
{
 * This enumerated typedef defines the display types for the graph.
  }
type
  PEGraphDisplayType = ^TEGraphDisplayType;
  TEGraphDisplayType =  Longint;
  Const
    vPLOT = 0;
    vLINE = 1;
;
{
 * This enumerated typedef defines where white space is to be
 * stripped from in the function stripWhiteSpace.
  }
type
  PEStripType = ^TEStripType;
  TEStripType =  Longint;
  Const
    vFRONT = 0;
    vBACK = 1;
    vBOTH = 2;
;
{
 * This enumerated typedef defines the type of exits the widgets
 * recognize.
  }
type
  PEExitType = ^TEExitType;
  TEExitType =  Longint;
  Const
    vEARLY_EXIT = 0;
    vESCAPE_HIT = 1;
    vNORMAL = 2;
    vNEVER_ACTIVATED = 3;
    vERROR = 4;
;
{
 * This defines a boolean type.
  }
type
  Pboolean = ^Tboolean;
  Tboolean = longint;
{
 * Declare miscellaneous defines.
  }

const
  LEFT = 9000;  
  RIGHT = 9001;  
  CENTER = 9002;  
  TOP = 9003;  
  BOTTOM = 9004;  
  HORIZONTAL = 9005;  
  VERTICAL = 9006;  
  FULL = 9007;  
  NONE = 0;  
  ROW = 1;  
  COL = 2;  
{ unused by widgets  }
  MAX_BINDINGS = 300;  
{ unused by widgets  }
  MAX_ITEMS = 2000;  
{ unused by widgets  }
  MAX_BUTTONS = 200;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MAXIMUM(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MINIMUM(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HALF(a : longint) : longint;

{$ifndef COLOR_PAIR}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function COLOR_PAIR(a : longint) : longint;

{$endif}
{ obsolete: use CTRL()  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function CONTROL(c : longint) : Tc;

{ Define the 'GLOBAL DEBUG FILEHANDLE'	 }
  var
    CDKDEBUG : PFILE;cvar;external;
{
 * =========================================================
 * 	Declare Debugging Routines.
 * =========================================================
  }
(* Const before type ignored *)

function startCDKDebug(filename:Pchar):PFILE;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure writeCDKDebugMessage(fd:PFILE; filename:Pchar; _function:Pchar; line:longint; message:Pchar);cdecl;external;
procedure stopCDKDebug(fd:PFILE);cdecl;external;
{
 * These header files define miscellaneous values and prototypes.
  }
{$include <cdk/cdkscreen.h>}
{$include <cdk/curdefs.h>}
{$include <cdk/binding.h>}
{$include <cdk/cdk_util.h>}
{$include <cdk/cdk_objs.h>}
{$include <cdk/cdk_params.h>}
{
 * Include the CDK widget header files.
  }
{$include <cdk/alphalist.h>}
{$include <cdk/buttonbox.h>}
{$include <cdk/calendar.h>}
{$include <cdk/dialog.h>}
{$include <cdk/entry.h>}
{$include <cdk/fselect.h>}
{$include <cdk/graph.h>}
{$include <cdk/histogram.h>}
{$include <cdk/itemlist.h>}
{$include <cdk/label.h>}
{$include <cdk/marquee.h>}
{$include <cdk/matrix.h>}
{$include <cdk/mentry.h>}
{$include <cdk/menu.h>}
{$include <cdk/radio.h>}
{$include <cdk/scroll.h>}
{$include <cdk/selection.h>}
{$include <cdk/swindow.h>}
{$include <cdk/template.h>}
{$include <cdk/viewer.h>}
{$include <cdk/traverse.h>}
{$include <cdk/button.h>}
{
 * Generated headers:
  }
{$include <cdk/dscale.h>}
{$include <cdk/fscale.h>}
{$include <cdk/scale.h>}
{$include <cdk/uscale.h>}
{$include <cdk/fslider.h>}
{$include <cdk/slider.h>}
{$include <cdk/uslider.h>}
{
 * Low-level object drawing
  }
{$include <cdk/draw.h>}
{ C++ end of extern C conditionnal removed }
{$endif}
{ CDK_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mvwhline(win,y,x,c,n : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if ERR then
    if_local1:=ERR
  else
    if_local1:=whline(win,c,n);
  mvwhline:=(wmove(win,y,x))=(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mvwvline(win,y,x,c,n : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if ERR then
    if_local1:=ERR
  else
    if_local1:=wvline(win,c,n);
  mvwvline:=(wmove(win,y,x))=(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MAXIMUM(a,b : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if b then
    if_local1:=a
  else
    if_local1:=b;
  MAXIMUM:=a>(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MINIMUM(a,b : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if b then
    if_local1:=a
  else
    if_local1:=b;
  MINIMUM:=a<(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HALF(a : longint) : longint;
begin
  HALF:=a shr 1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function COLOR_PAIR(a : longint) : longint;
begin
  COLOR_PAIR:=A_NORMAL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function CONTROL(c : longint) : Tc;
begin
  CONTROL:=Tc(@($1f));
end;


end.
