
unit entry;
interface

{
  Automatically converted by H2Pas 1.0.0 from entry.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    entry.h
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
PCDKENTRY  = ^CDKENTRY;
PCDKSCREEN  = ^CDKSCREEN;
Pchar  = ^char;
Pchtype  = ^chtype;
PSEntry  = ^SEntry;
PWINDOW  = ^WINDOW;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: entry.h,v 1.30 2016/11/20 14:41:44 tom Exp $
  }
{$ifndef CDKINCLUDES}
{$ifndef CDKENTRY_H}

const
  CDKENTRY_H = 1;  
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
 * Define the CDK entry widget structure.
  }
type
  TSEntry = TCDKENTRY;

  TENTRYCB = procedure (entry:PSEntry; character:Tchtype);cdecl;
  PSEntry = ^TSEntry;
  TSEntry = record
      obj : TCDKOBJS;cdecl;
      parent : PWINDOW;
      win : PWINDOW;
      shadowWin : PWINDOW;
      labelWin : PWINDOW;
      fieldWin : PWINDOW;
      _label : Pchtype;
      labelLen : longint;
      titleAdj : longint;
      fieldAttr : Tchtype;
      fieldWidth : longint;
      info : Pchar;
      infoWidth : longint;
      screenCol : longint;
      leftChar : longint;
      min : longint;
      max : longint;
      boxWidth : longint;
      boxHeight : longint;
      exitType : TEExitType;
      dispType : TEDisplayType;
      shadow : Tboolean;
      filler : Tchtype;
      hidden : Tchtype;
      callbackfn : TENTRYCB;
      callbackData : pointer;
    end;

{
 * This sets the callback function of the button's argument.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function setCDKEntryCBArgs(entry,argPtr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function getCDKEntryCBArgs(entry,argType : longint) : TargType;

{
 * This creates a pointer to a new CDK entry widget.
  }
{ cdkscreen  }{ xpos  }{ ypos  }(* Const before type ignored *)
{ title  }(* Const before type ignored *)
{ label  }{ fieldAttrib  }{ filler  }{ disptype  }{ fieldWidth  }{ min  }{ max  }{ Box  }{ shadow  }function newCDKEntry(para1:PCDKSCREEN; para2:longint; para3:longint; para4:Pchar; para5:Pchar; 
           para6:Tchtype; para7:Tchtype; para8:TEDisplayType; para9:longint; para10:longint; 
           para11:longint; para12:Tboolean; para13:Tboolean):PCDKENTRY;cdecl;external;
{
 * This activates the entry widget.
  }
{ entry  }{ actions  }function activateCDKEntry(para1:PCDKENTRY; para2:Pchtype):Pchar;cdecl;external;
{
 * This injects a single character into the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKEntry(obj,input : longint) : longint;

{
 * This sets various attributes of the entry field.
  }
{ entry  }(* Const before type ignored *)
{ value  }{ min  }{ max  }{ Box  }procedure setCDKEntry(para1:PCDKENTRY; para2:Pchar; para3:longint; para4:longint; para5:Tboolean);cdecl;external;
{
 * This sets the value of the entry field.
  }
{ entry  }(* Const before type ignored *)
{ value  }procedure setCDKEntryValue(para1:PCDKENTRY; para2:Pchar);cdecl;external;
{ entry  }function getCDKEntryValue(para1:PCDKENTRY):Pchar;cdecl;external;
{
 * This sets the maximum length of a string allowable for
 * the given widget.
  }
{ entry  }{ max  }procedure setCDKEntryMax(para1:PCDKENTRY; para2:longint);cdecl;external;
{ entry  }function getCDKEntryMax(para1:PCDKENTRY):longint;cdecl;external;
{
 * This sets the minimum length of a string allowable for
 * the given widget.
  }
{ entry  }{ min  }procedure setCDKEntryMin(para1:PCDKENTRY; para2:longint);cdecl;external;
{ entry  }function getCDKEntryMin(para1:PCDKENTRY):longint;cdecl;external;
{
 * This sets the filler character of the entry field.
  }
{ entry  }{ fillerCharacter  }procedure setCDKEntryFillerChar(para1:PCDKENTRY; para2:Tchtype);cdecl;external;
{ entry  }function getCDKEntryFillerChar(para1:PCDKENTRY):Tchtype;cdecl;external;
{
 * This sets the character to use when a hidden type is used.
  }
{ entry  }{ hiddenCharacter  }procedure setCDKEntryHiddenChar(para1:PCDKENTRY; para2:Tchtype);cdecl;external;
{ entry  }function getCDKEntryHiddenChar(para1:PCDKENTRY):Tchtype;cdecl;external;
{
 * This sets the box attribute of the widget.
  }
{ entry  }{ Box  }procedure setCDKEntryBox(para1:PCDKENTRY; para2:Tboolean);cdecl;external;
{ entry  }function getCDKEntryBox(para1:PCDKENTRY):Tboolean;cdecl;external;
{
 * These set the drawing characters of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryULChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryURChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryLLChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryLRChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryVerticalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryHorizontalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryBoxAttribute(w,c : longint) : longint;

{
 * This sets the background color of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryBackgroundColor(w,c : longint) : longint;

{
 * This sets the background attribute of the widget.
  }{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryBackgroundAttrib(w,c : longint) : longint;

{
 * This sets the attribute of the entry field.
  }
{ entry  }{ highlight  }{ cursor  }procedure setCDKEntryHighlight(para1:PCDKENTRY; para2:Tchtype; para3:Tboolean);cdecl;external;
{
 * This draws the entry field.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKEntry(obj,box : longint) : longint;

{
 * This erases the widget from the screen.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKEntry(obj : longint) : longint;

{
 * This cleans out the value of the entry field.
  }
{ entry  }procedure cleanCDKEntry(para1:PCDKENTRY);cdecl;external;
{
 * This moves the widget to the given location.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKEntry(obj,xpos,ypos,relative,refresh : longint) : longint;

{
 * This is an interactive method of moving the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function positionCDKEntry(widget : longint) : longint;

{
 * This destroys the widget and all the memory associated with the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKEntry(obj : longint) : longint;

{
 * This sets the callback to the entry fields main handler
  }
{ entry  }{ callback  }procedure setCDKEntryCB(para1:PCDKENTRY; para2:TENTRYCB);cdecl;external;
{
 * These set the callbacks to the pre and post process functions.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryPreProcess(w,f,d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryPostProcess(w,f,d : longint) : longint;

{ C++ end of extern C conditionnal removed }
{$endif}
{ CDKENTRY_H  }
{$endif}
{ CDKINCLUDES  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryCBArgs(entry,argPtr : longint) : longint;
begin
  setCDKEntryCBArgs:=(entry^.callbackData):=(pointer(argPtr));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function getCDKEntryCBArgs(entry,argType : longint) : TargType;
begin
  getCDKEntryCBArgs:=TargType(entry^.callbackData);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKEntry(obj,input : longint) : longint;
begin
  injectCDKEntry:=injectCDKObject(obj,input,_String);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryULChar(w,c : longint) : longint;
begin
  setCDKEntryULChar:=setULCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryURChar(w,c : longint) : longint;
begin
  setCDKEntryURChar:=setURCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryLLChar(w,c : longint) : longint;
begin
  setCDKEntryLLChar:=setLLCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryLRChar(w,c : longint) : longint;
begin
  setCDKEntryLRChar:=setLRCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryVerticalChar(w,c : longint) : longint;
begin
  setCDKEntryVerticalChar:=setVTCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryHorizontalChar(w,c : longint) : longint;
begin
  setCDKEntryHorizontalChar:=setHZCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryBoxAttribute(w,c : longint) : longint;
begin
  setCDKEntryBoxAttribute:=setBXAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryBackgroundColor(w,c : longint) : longint;
begin
  setCDKEntryBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryBackgroundAttrib(w,c : longint) : longint;
begin
  setCDKEntryBackgroundAttrib:=setBKAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKEntry(obj,box : longint) : longint;
begin
  drawCDKEntry:=drawCDKObject(obj,box);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKEntry(obj : longint) : longint;
begin
  eraseCDKEntry:=eraseCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKEntry(obj,xpos,ypos,relative,refresh : longint) : longint;
begin
  moveCDKEntry:=moveCDKObject(obj,xpos,ypos,relative,refresh);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function positionCDKEntry(widget : longint) : longint;
begin
  positionCDKEntry:=positionCDKObject(ObjOf(widget),widget^.win);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKEntry(obj : longint) : longint;
begin
  destroyCDKEntry:=destroyCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryPreProcess(w,f,d : longint) : longint;
begin
  setCDKEntryPreProcess:=setCDKObjectPreProcess(ObjOf(w),f,d);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKEntryPostProcess(w,f,d : longint) : longint;
begin
  setCDKEntryPostProcess:=setCDKObjectPostProcess(ObjOf(w),f,d);
end;


end.
