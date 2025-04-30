
unit cdkscreen;
interface

{
  Automatically converted by H2Pas 1.0.0 from cdkscreen.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cdkscreen.h
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
PCDKOBJS  = ^CDKOBJS;
PCDKSCREEN  = ^CDKSCREEN;
PEExitStatus  = ^EExitStatus;
PSScreen  = ^SScreen;
PWINDOW  = ^WINDOW;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: cdkscreen.h,v 1.19 2016/11/20 14:42:21 tom Exp $
  }
{$ifndef CDKINCLUDES}
{$ifndef CDKSCREEN_H}

const
  CDKSCREEN_H = 1;  
{ C++ extern C conditionnal removed }
{$ifndef CDK_H}
{$define CDKINCLUDES}
{$include <cdk.h>}
{$undef CDKINCLUDES}
{$endif}
{
 * Changes 1999-2015,2016 copyright Thomas E. Dickey
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
{
 * Declare and definitions needed for the widget.
  }
{ not used by widgets  }

const
  MAX_OBJECTS = 1000;  
type
  PCDKOBJS = ^TCDKOBJS;
  TCDKOBJS = record
      {undefined structure}
    end;


  PEExitStatus = ^TEExitStatus;
  TEExitStatus =  Longint;
  Const
    CDKSCREEN_NOEXIT = 0;
    CDKSCREEN_EXITOK = 1;
    CDKSCREEN_EXITCANCEL = 2;
;
{
 * Define the CDK screen structure.
  }
{ last-used index in object[]  }
{ sizeof(object[])  }
{ focus index in object[]  }
type
  PSScreen = ^TSScreen;
  TSScreen = record
      window : PWINDOW;
      object : ^PCDKOBJS;
      objectCount : longint;
      objectLimit : longint;
      exitStatus : TEExitStatus;
      objectFocus : longint;
    end;

  TSScreen = TCDKSCREEN;
{
 * This function creates a CDKSCREEN pointer.
  }
{ window  }
function initCDKScreen(para1:PWINDOW):PCDKSCREEN;cdecl;external;
{
 * This sets which CDKSCREEN pointer will be the default screen
 * in the list of managed screen.
  }
{ screenNumber  }function setDefaultCDKScreen(para1:longint):PCDKSCREEN;cdecl;external;
{
 * This function registers a CDK widget with a given screen.
  }
{ screen  }{ cdktype  }{ object  }procedure registerCDKObject(para1:PCDKSCREEN; para2:TEObjectType; para3:pointer);cdecl;external;
{
 * This function registers a CDK widget with it's former screen.
  }
{ cdktype  }{ object  }procedure reRegisterCDKObject(para1:TEObjectType; para2:pointer);cdecl;external;
{
 * This unregisters a CDK widget from a screen.
  }
{ cdktype  }{ object  }procedure unregisterCDKObject(para1:TEObjectType; para2:pointer);cdecl;external;
{
 * This function raises a widget on a screen to the top of the widget
 * stack of the screen the widget is associated with. The side effect
 * of doing this is the widget will be on 'top' of all the other
 * widgets on their screens.
  }
{ cdktype  }{ object  }procedure raiseCDKObject(para1:TEObjectType; para2:pointer);cdecl;external;
{
 * This function lowers a widget on a screen to the bottom of the widget
 * stack of the screen the widget is associated with. The side effect
 * of doing this is that all the other widgets will be on 'top' of the
 * widget on their screens.
  }
{ cdktype  }{ object  }procedure lowerCDKObject(para1:TEObjectType; para2:pointer);cdecl;external;
{
 * This redraws a window, forcing it to the top of the stack.
  }
{ win  }procedure refreshCDKWindow(para1:PWINDOW);cdecl;external;
{
 * This redraws all the widgets associated with the given screen.
  }
{ screen  }procedure refreshCDKScreen(para1:PCDKSCREEN);cdecl;external;
{
 * This calls refreshCDKScreen. (it is here to try to be consistent
 * with the drawCDKXXX functions associated with the widgets)
  }
{ screen  }procedure drawCDKScreen(para1:PCDKSCREEN);cdecl;external;
{
 * This removes all the widgets from the screen.
  }
{ screen  }procedure eraseCDKScreen(para1:PCDKSCREEN);cdecl;external;
{
 * Destroy all of the widgets on a screen
  }
procedure destroyCDKScreenObjects(cdkscreen:PCDKSCREEN);cdecl;external;
{
 * This frees up any memory the CDKSCREEN pointer used.
  }
{ screen  }procedure destroyCDKScreen(para1:PCDKSCREEN);cdecl;external;
{
 * This shuts down curses and everything else needed to
 * exit cleanly.
  }
procedure endCDK;cdecl;external;
{
 * This creates all the color pairs.
  }
procedure initCDKColor;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ CDKSCREEN_H  }
{$endif}
{ CDKINCLUDES  }

implementation


end.
