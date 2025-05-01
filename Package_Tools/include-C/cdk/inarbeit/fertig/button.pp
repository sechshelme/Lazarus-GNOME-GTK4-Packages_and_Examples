
unit button;
interface

{
  Automatically converted by H2Pas 1.0.0 from button.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    button.h
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
PCDKBUTTON  = ^CDKBUTTON;
PCDKSCREEN  = ^CDKSCREEN;
Pchar  = ^char;
Pchtype  = ^chtype;
PSButton  = ^SButton;
PWINDOW  = ^WINDOW;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: button.h,v 1.14 2016/01/31 21:08:37 tom Exp $
  }
{$ifndef CDKINCLUDES}
{$ifndef CDKBUTTON_H}

const
  CDKBUTTON_H = 1;  
{$include "cdk.h"}
{$ifndef CDK_H}
{$define CDKINCLUDES}
{$include <cdk.h>}
{$undef CDKINCLUDES}
{$include <cdk/binding.h>}
{$include <cdk/cdkscreen.h>}
{$include <cdk/cdk_objs.h>}
{$endif}
{
 * Changes 2002-2012,2016 copyright Thomas E. Dickey
 * Copyright 1999, Grant Edwards
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
 * Declare any definitions you need to make.
  }
type
  TSButton = TCDKBUTTON;

  TtButtonCallback = procedure (button:PSButton);cdecl;
{
 * Declare the CDK label structure.
  }
  PSButton = ^TSButton;
  TSButton = record
      obj : TCDKOBJS;cdecl;
      parent : PWINDOW;
      win : PWINDOW;
      shadowWin : PWINDOW;
      info : Pchtype;
      callback : TtButtonCallback;
      infoLen : longint;
      infoPos : longint;
      boxWidth : longint;
      boxHeight : longint;
      xpos : longint;
      ypos : longint;
      rows : longint;
      exitType : TEExitType;
      shadow : Tboolean;
      highlight : Tchtype;
      callbackData : pointer;
    end;

{
 * This sets the callback function of the button's argument.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function setCDKButtonCBArgs(button,argPtr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function getCDKButtonCBArgs(button,argType : longint) : TargType;

{
 * This sets the button's highlight mode.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CDKButtonHighlightOf(button : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonHighlight(button,highlightMode : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function getCDKButtonHighlight(button : longint) : longint;

{
 * This creates a new CDK button widget.
  }
{ screen  }{ xPos  }{ yPos  }(* Const before type ignored *)
{ button text  }{ callback function  }{ Box  }{ shadow  }function newCDKButton(para1:PCDKSCREEN; para2:longint; para3:longint; para4:Pchar; para5:TtButtonCallback; 
           para6:Tboolean; para7:Tboolean):PCDKBUTTON;cdecl;external;
{
 * This was added to make the builder simpler. All this will
 * do is call drawCDKLabel.
  }
{ button  }{ actions  }function activateCDKButton(para1:PCDKBUTTON; para2:Pchtype):longint;cdecl;external;
{
 * This injects a single character into the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKButton(obj,input : longint) : longint;

{
 * This sets multiple attributes of the widget.
  }
{ button  }(* Const before type ignored *)
{ text  }{ Box  }procedure setCDKButton(para1:PCDKBUTTON; para2:Pchar; para3:Tboolean);cdecl;external;
{
 * This sets the contents of the button.
  }
{ button  }(* Const before type ignored *)
{ mesg  }procedure setCDKButtonMessage(para1:PCDKBUTTON; para2:Pchar);cdecl;external;
function getCDKButtonMessage(para1:PCDKBUTTON):Pchtype;cdecl;external;
{
 * This sets the box attribute of the widget.
  }
{ button  }{ Box  }procedure setCDKButtonBox(para1:PCDKBUTTON; para2:Tboolean);cdecl;external;
{ button  }function getCDKButtonBox(para1:PCDKBUTTON):Tboolean;cdecl;external;
{
 * This draws the button.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKButton(obj,Box : longint) : longint;

{
 * These set the drawing characters of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonULChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonURChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonLLChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonLRChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonVerticalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonHorizontalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonBoxAttribute(w,c : longint) : longint;

{
 * This sets the background color of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonBackgroundColor(w,c : longint) : longint;

{
 * This sets the background attribute of the widget.
  }{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonBackgroundAttrib(w,c : longint) : longint;

{
 * This erases the button.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKButton(obj : longint) : longint;

{
 * This destroys the button and the memory used by it.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKButton(obj : longint) : longint;

{
 * This moves the button to a new screen location.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKButton(obj,xpos,ypos,relative,refresh : longint) : longint;

{
 * This allows the user to interactively position the button.
  }
procedure positionCDKButton(para1:PCDKBUTTON);cdecl;external;
{$endif}
{ CDKBUTTON_H  }
{$endif}
{ CDKINCLUDES  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonCBArgs(button,argPtr : longint) : longint;
begin
  setCDKButtonCBArgs:=(button^.callbackData):=(pointer(argPtr));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function getCDKButtonCBArgs(button,argType : longint) : TargType;
begin
  getCDKButtonCBArgs:=TargType(button^.callbackData);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CDKButtonHighlightOf(button : longint) : longint;
begin
  CDKButtonHighlightOf:=button^.highlight;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonHighlight(button,highlightMode : longint) : longint;
begin
  setCDKButtonHighlight:=(CDKButtonHighlightOf(button)):=highlightMode;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function getCDKButtonHighlight(button : longint) : longint;
begin
  getCDKButtonHighlight:=CDKButtonHighlightOf(button);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKButton(obj,input : longint) : longint;
begin
  injectCDKButton:=injectCDKObject(obj,input,Int);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKButton(obj,Box : longint) : longint;
begin
  drawCDKButton:=drawCDKObject(obj,Box);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonULChar(w,c : longint) : longint;
begin
  setCDKButtonULChar:=setULCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonURChar(w,c : longint) : longint;
begin
  setCDKButtonURChar:=setURCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonLLChar(w,c : longint) : longint;
begin
  setCDKButtonLLChar:=setLLCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonLRChar(w,c : longint) : longint;
begin
  setCDKButtonLRChar:=setLRCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonVerticalChar(w,c : longint) : longint;
begin
  setCDKButtonVerticalChar:=setVTCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonHorizontalChar(w,c : longint) : longint;
begin
  setCDKButtonHorizontalChar:=setHZCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonBoxAttribute(w,c : longint) : longint;
begin
  setCDKButtonBoxAttribute:=setBXAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonBackgroundColor(w,c : longint) : longint;
begin
  setCDKButtonBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKButtonBackgroundAttrib(w,c : longint) : longint;
begin
  setCDKButtonBackgroundAttrib:=setBKAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKButton(obj : longint) : longint;
begin
  eraseCDKButton:=eraseCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKButton(obj : longint) : longint;
begin
  destroyCDKButton:=destroyCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKButton(obj,xpos,ypos,relative,refresh : longint) : longint;
begin
  moveCDKButton:=moveCDKObject(obj,xpos,ypos,relative,refresh);
end;


end.
