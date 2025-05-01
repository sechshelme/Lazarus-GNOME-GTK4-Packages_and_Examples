
unit itemlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from itemlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    itemlist.h
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
PCDKITEMLIST  = ^CDKITEMLIST;
PCDKSCREEN  = ^CDKSCREEN;
Pchar  = ^char;
Pchtype  = ^chtype;
Plongint  = ^longint;
PSItemList  = ^SItemList;
PWINDOW  = ^WINDOW;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: itemlist.h,v 1.25 2012/03/21 21:15:30 tom Exp $
  }
{$ifndef CDKINCLUDES}
{$ifndef CDKITEMLIST_H}

const
  CDKITEMLIST_H = 1;  
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
 * Copyright 1999-2004,2012 Thomas E. Dickey
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
 * Define the CDK itemlist widget structure.
  }
type
  PSItemList = ^TSItemList;
  TSItemList = record
      obj : TCDKOBJS;
      parent : PWINDOW;
      win : PWINDOW;
      shadowWin : PWINDOW;
      labelWin : PWINDOW;
      fieldWin : PWINDOW;
      titleAdj : longint;
      _label : Pchtype;
      labelLen : longint;
      fieldWidth : longint;
      item : ^Pchtype;
      itemPos : Plongint;
      itemLen : Plongint;
      listSize : longint;
      currentItem : longint;
      defaultItem : longint;
      boxWidth : longint;
      boxHeight : longint;
      exitType : TEExitType;
      shadow : Tboolean;
    end;

  TSItemList = TCDKITEMLIST;
{
 * This creates a pointer to a CDK itemlist widget.
  }
{ cdkscreen  }{ xpos  }{ ypos  }(* Const before type ignored *)
{ title  }(* Const before type ignored *)
{ label  }{ itemlist  }{ count  }{ defaultItem  }{ Box  }{ shadow  }
function newCDKItemlist(para1:PCDKSCREEN; para2:longint; para3:longint; para4:Pchar; para5:Pchar; 
           para6:TCDK_CSTRING2; para7:longint; para8:longint; para9:Tboolean; para10:Tboolean):PCDKITEMLIST;cdecl;external;
{
 * This activates the itemlist widget.
  }
{ itemlist  }{ actions  }function activateCDKItemlist(para1:PCDKITEMLIST; para2:Pchtype):longint;cdecl;external;
{
 * This injects a single character into the itemlist widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKItemlist(obj,input : longint) : longint;

{
 * These functions set specific elements of the itemlist widget.
  }
{ itemlist  }{ list  }{ count  }{ current  }{ Box  }procedure setCDKItemlist(para1:PCDKITEMLIST; para2:TCDK_CSTRING2; para3:longint; para4:longint; para5:Tboolean);cdecl;external;
{
 * This function sets the values of the item list widget.
  }
{ itemlist  }{ list  }{ count  }{ defaultItem  }procedure setCDKItemlistValues(para1:PCDKITEMLIST; para2:TCDK_CSTRING2; para3:longint; para4:longint);cdecl;external;
{ itemlist  }{ size  }function getCDKItemlistValues(para1:PCDKITEMLIST; para2:Plongint):^Pchtype;cdecl;external;
{
 * This sets the default item in the list.
  }
{ itemlist  }{ defaultItem  }procedure setCDKItemlistDefaultItem(para1:PCDKITEMLIST; para2:longint);cdecl;external;
{ itemlist  }function getCDKItemlistDefaultItem(para1:PCDKITEMLIST):longint;cdecl;external;
{
 * This returns an index to the current item in the list.
  }
{ itemlist  }{ currentItem  }procedure setCDKItemlistCurrentItem(para1:PCDKITEMLIST; para2:longint);cdecl;external;
{ itemlist  }function getCDKItemlistCurrentItem(para1:PCDKITEMLIST):longint;cdecl;external;
{
 * This sets the box attribute of the widget.
  }
{ itemlist  }{ Box  }procedure setCDKItemlistBox(para1:PCDKITEMLIST; para2:Tboolean);cdecl;external;
{ itemlist  }function getCDKItemlistBox(para1:PCDKITEMLIST):Tboolean;cdecl;external;
{
 * These set the drawing characters of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistULChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistURChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistLLChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistLRChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistVerticalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistHorizontalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistBoxAttribute(w,c : longint) : longint;

{
 * This sets the background color of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistBackgroundColor(w,c : longint) : longint;

{
 * This sets the background attribute of the widget.
  }{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistBackgroundAttrib(w,c : longint) : longint;

{
 * This draws the itemlist widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKItemlist(obj,Box : longint) : longint;

{
 * This draws the itemlist field.
  }
{ itemlist  }{ highlight  }procedure drawCDKItemlistField(para1:PCDKITEMLIST; para2:Tboolean);cdecl;external;
{
 * This removes the widget from the screen.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKItemlist(obj : longint) : longint;

{
 * This moves the widget to the given position.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKItemlist(obj,xpos,ypos,relative,refresh : longint) : longint;

{
 * This allows the user to interactively move the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function positionCDKItemlist(widget : longint) : longint;

{
 * This destroys the widget and all the associated memory.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKItemlist(obj : longint) : longint;

{
 * These functions set the pre/post process functions.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistPreProcess(w,f,d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistPostProcess(w,f,d : longint) : longint;

{ C++ end of extern C conditionnal removed }
{$endif}
{ CDKITEMLIST_H  }
{$endif}
{ CDKINCLUDES  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKItemlist(obj,input : longint) : longint;
begin
  injectCDKItemlist:=injectCDKObject(obj,input,Int);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistULChar(w,c : longint) : longint;
begin
  setCDKItemlistULChar:=setULCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistURChar(w,c : longint) : longint;
begin
  setCDKItemlistURChar:=setURCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistLLChar(w,c : longint) : longint;
begin
  setCDKItemlistLLChar:=setLLCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistLRChar(w,c : longint) : longint;
begin
  setCDKItemlistLRChar:=setLRCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistVerticalChar(w,c : longint) : longint;
begin
  setCDKItemlistVerticalChar:=setVTCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistHorizontalChar(w,c : longint) : longint;
begin
  setCDKItemlistHorizontalChar:=setHZCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistBoxAttribute(w,c : longint) : longint;
begin
  setCDKItemlistBoxAttribute:=setBXAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistBackgroundColor(w,c : longint) : longint;
begin
  setCDKItemlistBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistBackgroundAttrib(w,c : longint) : longint;
begin
  setCDKItemlistBackgroundAttrib:=setBKAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKItemlist(obj,Box : longint) : longint;
begin
  drawCDKItemlist:=drawCDKObject(obj,Box);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKItemlist(obj : longint) : longint;
begin
  eraseCDKItemlist:=eraseCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKItemlist(obj,xpos,ypos,relative,refresh : longint) : longint;
begin
  moveCDKItemlist:=moveCDKObject(obj,xpos,ypos,relative,refresh);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function positionCDKItemlist(widget : longint) : longint;
begin
  positionCDKItemlist:=positionCDKObject(ObjOf(widget),widget^.win);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKItemlist(obj : longint) : longint;
begin
  destroyCDKItemlist:=destroyCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistPreProcess(w,f,d : longint) : longint;
begin
  setCDKItemlistPreProcess:=setCDKObjectPreProcess(ObjOf(w),f,d);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKItemlistPostProcess(w,f,d : longint) : longint;
begin
  setCDKItemlistPostProcess:=setCDKObjectPostProcess(ObjOf(w),f,d);
end;


end.
