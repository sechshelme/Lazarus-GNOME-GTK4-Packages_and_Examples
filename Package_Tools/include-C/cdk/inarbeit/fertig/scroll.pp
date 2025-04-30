
unit scroll;
interface

{
  Automatically converted by H2Pas 1.0.0 from scroll.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    scroll.h
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
PCDKSCREEN  = ^CDKSCREEN;
PCDKSCROLL  = ^CDKSCROLL;
Pchar  = ^char;
Pchtype  = ^chtype;
PSScroll  = ^SScroll;
PWINDOW  = ^WINDOW;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: scroll.h,v 1.34 2013/09/01 18:06:41 tom Exp $
  }
{$ifndef CDKINCLUDES}
{$ifndef CDKSCROLL_H}

const
  CDKSCROLL_H = 1;  
{ C++ extern C conditionnal removed }
{$ifndef CDK_H}
{$define CDKINCLUDES}
{$include <cdk.h>}
{$undef CDKINCLUDES}
{$include <cdk/binding.h>}
{$include <cdk/cdkscreen.h>}
{$include <cdk/cdk_objs.h>}
{$endif}
{$include <cdk/scroller.h>}
{
 * Copyright 1999-2012,2013 Thomas E. Dickey
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
 * Declare scrolling list definitions.
  }

const
  NUMBERS = _TRUE;  
  NONUMBERS = _FALSE;  
{
 * Declare scrolling list definitions.
  }
{ This field must stay on top  }
{   SCROLLER_FIELDS; ?????????????????? }
{  }
{  }
type
  PSScroll = ^TSScroll;
  TSScroll = record
      numbers : Tboolean;
      titlehighlight : Tchtype;
      listWin : PWINDOW;
    end;

  TSScroll = TCDKSCROLL;
{
 * This creates a new CDK scrolling list pointer.
  }
{ cdkscreen  }{ xpos  }{ ypos  }{ spos  }{ height  }{ width  }(* Const before type ignored *)
{ title  }{ itemList  }{ items  }{ numbers  }{ highlight  }{ Box  }{ shadow  }
function newCDKScroll(para1:PCDKSCREEN; para2:longint; para3:longint; para4:longint; para5:longint; 
           para6:longint; para7:Pchar; para8:TCDK_CSTRING2; para9:longint; para10:Tboolean; 
           para11:Tchtype; para12:Tboolean; para13:Tboolean):PCDKSCROLL;cdecl;external;
{
 * This activates the scrolling list.
  }
{ scroll  }{ actions  }function activateCDKScroll(para1:PCDKSCROLL; para2:Pchtype):longint;cdecl;external;
{
 * This injects a single character into the scrolling list.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKScroll(obj,input : longint) : longint;

{
 * This sets various attributes of the scrolling list.
  }
{ scroll  }{ itemList  }{ items  }{ numbers  }{ highlight  }{ Box  }procedure setCDKScroll(para1:PCDKSCROLL; para2:TCDK_CSTRING2; para3:longint; para4:Tboolean; para5:Tchtype; 
            para6:Tboolean);cdecl;external;
{ scroll  }{ item  }procedure setCDKScrollPosition(para1:PCDKSCROLL; para2:longint);cdecl;external;
{ scroll  }function getCDKScrollCurrent(para1:PCDKSCROLL):longint;cdecl;external;
{ scroll  }{ i  }procedure setCDKScrollCurrent(para1:PCDKSCROLL; para2:longint);cdecl;external;
{ scroll  }function getCDKScrollCurrentTop(para1:PCDKSCROLL):longint;cdecl;external;
{ scroll  }{ i  }procedure setCDKScrollCurrentTop(para1:PCDKSCROLL; para2:longint);cdecl;external;
{ scroll  }function getCDKScrollCurrentItem(para1:PCDKSCROLL):longint;cdecl;external;
{ scroll  }{ i  }procedure setCDKScrollCurrentItem(para1:PCDKSCROLL; para2:longint);cdecl;external;
{
 * This sets the contents of the scrolling list.
  }
{ scroll  }{ itemList  }{ items  }{ numbers  }procedure setCDKScrollItems(para1:PCDKSCROLL; para2:TCDK_CSTRING2; para3:longint; para4:Tboolean);cdecl;external;
{ scroll  }{ itemList  }function getCDKScrollItems(para1:PCDKSCROLL; para2:PPchar):longint;cdecl;external;
{
 * This sets the highlight bar of the scrolling list.
  }
{ scroll  }{ highlight  }procedure setCDKScrollHighlight(para1:PCDKSCROLL; para2:Tchtype);cdecl;external;
{ scroll  }{ highlight  }function getCDKScrollHighlight(para1:PCDKSCROLL; para2:Tchtype):Tchtype;cdecl;external;
{
 * This sets the box attribute of the widget.
  }
{ scroll  }{ Box  }procedure setCDKScrollBox(para1:PCDKSCROLL; para2:Tboolean);cdecl;external;
{ scroll  }function getCDKScrollBox(para1:PCDKSCROLL):Tboolean;cdecl;external;
{
 * These set the drawing characters of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollULChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollURChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollLLChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollLRChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollVerticalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollHorizontalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollBoxAttribute(w,c : longint) : longint;

{
 * This sets the background color of the widget.
  }{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollBackgroundColor(w,c : longint) : longint;

{
 * This sets the background attribute of the widget.
  }{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollBackgroundAttrib(w,c : longint) : longint;

{
 * This adds a single item to the end of scrolling list.
  }
{ scroll  }(* Const before type ignored *)
{ item  }procedure addCDKScrollItem(para1:PCDKSCROLL; para2:Pchar);cdecl;external;
{
 * This adds a single item into the scrolling list.
  }
{ scroll  }(* Const before type ignored *)
{ item  }procedure insertCDKScrollItem(para1:PCDKSCROLL; para2:Pchar);cdecl;external;
{
 * This deletes a single item from the scrolling list.
  }
{ scroll  }{ position  }procedure deleteCDKScrollItem(para1:PCDKSCROLL; para2:longint);cdecl;external;
{
 * This draws the scrolling list on the screen.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKScroll(obj,Box : longint) : longint;

{
 * This removes the scrolling list from the screen.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKScroll(obj : longint) : longint;

{
 * This moves the widget to the given location.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKScroll(obj,xpos,ypos,relative,refresh : longint) : longint;

{
 * This allows the user to interactively position the widget on the screen.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function positionCDKScroll(widget : longint) : longint;

{
 * This destroys the widget and all associated memory.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKScroll(obj : longint) : longint;

{
 * These set the scrolling list pre/post process functions.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollPreProcess(w,f,d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollPostProcess(w,f,d : longint) : longint;

{ C++ end of extern C conditionnal removed }
{$endif}
{ CDKSCROLL_H  }
{$endif}
{ CDKINCLUDES  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKScroll(obj,input : longint) : longint;
begin
  injectCDKScroll:=injectCDKObject(obj,input,Int);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollULChar(w,c : longint) : longint;
begin
  setCDKScrollULChar:=setULCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollURChar(w,c : longint) : longint;
begin
  setCDKScrollURChar:=setURCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollLLChar(w,c : longint) : longint;
begin
  setCDKScrollLLChar:=setLLCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollLRChar(w,c : longint) : longint;
begin
  setCDKScrollLRChar:=setLRCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollVerticalChar(w,c : longint) : longint;
begin
  setCDKScrollVerticalChar:=setVTCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollHorizontalChar(w,c : longint) : longint;
begin
  setCDKScrollHorizontalChar:=setHZCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollBoxAttribute(w,c : longint) : longint;
begin
  setCDKScrollBoxAttribute:=setBXAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollBackgroundColor(w,c : longint) : longint;
begin
  setCDKScrollBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollBackgroundAttrib(w,c : longint) : longint;
begin
  setCDKScrollBackgroundAttrib:=setBKAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKScroll(obj,Box : longint) : longint;
begin
  drawCDKScroll:=drawCDKObject(obj,Box);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKScroll(obj : longint) : longint;
begin
  eraseCDKScroll:=eraseCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKScroll(obj,xpos,ypos,relative,refresh : longint) : longint;
begin
  moveCDKScroll:=moveCDKObject(obj,xpos,ypos,relative,refresh);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function positionCDKScroll(widget : longint) : longint;
begin
  positionCDKScroll:=positionCDKObject(ObjOf(widget),widget^.win);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKScroll(obj : longint) : longint;
begin
  destroyCDKScroll:=destroyCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollPreProcess(w,f,d : longint) : longint;
begin
  setCDKScrollPreProcess:=setCDKObjectPreProcess(ObjOf(w),f,d);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKScrollPostProcess(w,f,d : longint) : longint;
begin
  setCDKScrollPostProcess:=setCDKObjectPostProcess(ObjOf(w),f,d);
end;


end.
