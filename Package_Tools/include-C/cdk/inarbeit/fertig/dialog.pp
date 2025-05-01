
unit dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dialog.h
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
PCDKDIALOG  = ^CDKDIALOG;
PCDKSCREEN  = ^CDKSCREEN;
Pchtype  = ^chtype;
Plongint  = ^longint;
PSDialogBox  = ^SDialogBox;
PWINDOW  = ^WINDOW;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: dialog.h,v 1.27 2012/03/21 21:15:30 tom Exp $
  }
{$ifndef CDKINCLUDES}
{$ifndef CDKDIALOG_H}

const
  CDKDIALOG_H = 1;  
{ C++ extern C conditionnal removed }
{$ifndef CDK_H}
{$define CDKINCLUDES}
{$include <cdk.h>}
{$undef CDKINCLUDES}
{$include <cdk/binding.h>}
{$include <cdk/cdkscreen.h>}
{$include <cdk/cdk_objs.h>}
{$endif}
{
 * Copyright 1999-2003,2012 Thomas E. Dickey
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
 * Declare definitions the dialog box may need.
  }
{ unused by widgets  }

const
  MAX_DIALOG_ROWS = 50;  
{ unused by widgets  }
  MAX_DIALOG_BUTTONS = 25;  
  MIN_DIALOG_WIDTH = 10;  
{
 * Define the CDK dialog structure.
  }
type
  PSDialogBox = ^TSDialogBox;
  TSDialogBox = record
      obj : TCDKOBJS;
      parent : PWINDOW;
      win : PWINDOW;
      shadowWin : PWINDOW;
      info : ^Pchtype;
      infoLen : Plongint;
      infoPos : Plongint;
      buttonLabel : ^Pchtype;
      buttonLen : Plongint;
      buttonPos : Plongint;
      messageRows : longint;
      buttonCount : longint;
      currentButton : longint;
      boxWidth : longint;
      boxHeight : longint;
      exitType : TEExitType;
      separator : Tboolean;
      shadow : Tboolean;
      highlight : Tchtype;
    end;

  TSDialogBox = TCDKDIALOG;
{
 * This returns a CDK dialog widget pointer.
  }
{ cdkscreen  }{ xPos  }{ yPos  }{ message  }{ Rows  }{ buttons  }{ buttonCount  }{ highlight  }{ separator  }{ Box  }{ shadow  }
function newCDKDialog(para1:PCDKSCREEN; para2:longint; para3:longint; para4:TCDK_CSTRING2; para5:longint; 
           para6:TCDK_CSTRING2; para7:longint; para8:Tchtype; para9:Tboolean; para10:Tboolean; 
           para11:Tboolean):PCDKDIALOG;cdecl;external;
{
 * This activates the widget.
  }
{ dialog  }{ actions  }function activateCDKDialog(para1:PCDKDIALOG; para2:Pchtype):longint;cdecl;external;
{
 * This injects a single character into the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKDialog(obj,input : longint) : longint;

{
 * This sets multiple attributes of the widget.
  }
{ dialog  }{ highlight  }{ separator  }{ Box  }procedure setCDKDialog(para1:PCDKDIALOG; para2:Tchtype; para3:Tboolean; para4:Tboolean);cdecl;external;
{
 * This sets the highlight attribute for the buttons.
  }
{ dialog  }{ highlight  }procedure setCDKDialogHighlight(para1:PCDKDIALOG; para2:Tchtype);cdecl;external;
{ dialog  }function getCDKDialogHighlight(para1:PCDKDIALOG):Tchtype;cdecl;external;
{
 * This sets whether or not the dialog box will have a separator line.
  }
{ dialog  }{ separator  }procedure setCDKDialogSeparator(para1:PCDKDIALOG; para2:Tboolean);cdecl;external;
{ dialog  }function getCDKDialogSeparator(para1:PCDKDIALOG):Tboolean;cdecl;external;
{
 * This sets the box attribute of the widget.
  }
{ dialog  }{ Box  }procedure setCDKDialogBox(para1:PCDKDIALOG; para2:Tboolean);cdecl;external;
{ dialog  }function getCDKDialogBox(para1:PCDKDIALOG):Tboolean;cdecl;external;
{
 * These set the drawing characters of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogULChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogURChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogLLChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogLRChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogVerticalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogHorizontalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogBoxAttribute(w,c : longint) : longint;

{
 * This sets the background color of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogBackgroundColor(w,c : longint) : longint;

{
 * This sets the background attribute of the widget.
  }{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogBackgroundAttrib(w,c : longint) : longint;

{
 * This draws the dialog box widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKDialog(obj,box : longint) : longint;

{
 * This erases the dialog box from the screen.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKDialog(obj : longint) : longint;

{
 * This moves the dialog box to a new screen location.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKDialog(obj,xpos,ypos,relative,refresh : longint) : longint;

{
 * This allows the user to position the widget on the screen interactively.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function positionCDKDialog(widget : longint) : longint;

{
 * This destroys the widget and all the memory associated with it.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKDialog(obj : longint) : longint;

{
 * This draws the dialog box buttons.
  }
{ dialog  }procedure drawCDKDialogButtons(para1:PCDKDIALOG);cdecl;external;
{
 * These set the pre/post process functions of the dialog widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogPreProcess(w,f,d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogPostProcess(w,f,d : longint) : longint;

{ C++ end of extern C conditionnal removed }
{$endif}
{ CDKDIALOG_H  }
{$endif}
{ CDKINCLUDES  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKDialog(obj,input : longint) : longint;
begin
  injectCDKDialog:=injectCDKObject(obj,input,Int);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogULChar(w,c : longint) : longint;
begin
  setCDKDialogULChar:=setULCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogURChar(w,c : longint) : longint;
begin
  setCDKDialogURChar:=setURCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogLLChar(w,c : longint) : longint;
begin
  setCDKDialogLLChar:=setLLCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogLRChar(w,c : longint) : longint;
begin
  setCDKDialogLRChar:=setLRCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogVerticalChar(w,c : longint) : longint;
begin
  setCDKDialogVerticalChar:=setVTCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogHorizontalChar(w,c : longint) : longint;
begin
  setCDKDialogHorizontalChar:=setHZCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogBoxAttribute(w,c : longint) : longint;
begin
  setCDKDialogBoxAttribute:=setBXAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogBackgroundColor(w,c : longint) : longint;
begin
  setCDKDialogBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogBackgroundAttrib(w,c : longint) : longint;
begin
  setCDKDialogBackgroundAttrib:=setBKAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKDialog(obj,box : longint) : longint;
begin
  drawCDKDialog:=drawCDKObject(obj,box);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKDialog(obj : longint) : longint;
begin
  eraseCDKDialog:=eraseCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKDialog(obj,xpos,ypos,relative,refresh : longint) : longint;
begin
  moveCDKDialog:=moveCDKObject(obj,xpos,ypos,relative,refresh);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function positionCDKDialog(widget : longint) : longint;
begin
  positionCDKDialog:=positionCDKObject(ObjOf(widget),widget^.win);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKDialog(obj : longint) : longint;
begin
  destroyCDKDialog:=destroyCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogPreProcess(w,f,d : longint) : longint;
begin
  setCDKDialogPreProcess:=setCDKObjectPreProcess(ObjOf(w),f,d);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKDialogPostProcess(w,f,d : longint) : longint;
begin
  setCDKDialogPostProcess:=setCDKObjectPostProcess(ObjOf(w),f,d);
end;


end.
