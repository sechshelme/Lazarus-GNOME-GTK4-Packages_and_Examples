
unit fselect;
interface

{
  Automatically converted by H2Pas 1.0.0 from fselect.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fselect.h
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
PCDKFSELECT  = ^CDKFSELECT;
PCDKSCREEN  = ^CDKSCREEN;
PCDKSCROLL  = ^CDKSCROLL;
Pchar  = ^char;
Pchtype  = ^chtype;
Plongint  = ^longint;
PSFileSelector  = ^SFileSelector;
PWINDOW  = ^WINDOW;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: fselect.h,v 1.26 2012/03/21 21:15:30 tom Exp $
  }
{$ifndef CDKINCLUDES}
{$ifndef CDKFSELECT_H}

const
  CDKFSELECT_H = 1;  
{ C++ extern C conditionnal removed }
{$ifndef CDK_H}
{$define CDKINCLUDES}
{$include <cdk.h>}
{$undef CDKINCLUDES}
{$include <cdk/binding.h>}
{$include <cdk/cdkscreen.h>}
{$include <cdk/cdk_objs.h>}
{$include <cdk/entry.h>}
{$include <cdk/scroll.h>}
{$endif}
{
 * Copyright 1999-2006,2012 Thomas E. Dickey
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
 * Define the CDK file selector widget structure.
  }
type
  PSFileSelector = ^TSFileSelector;
  TSFileSelector = record
      obj : TCDKOBJS;
      parent : PWINDOW;
      win : PWINDOW;
      shadowWin : PWINDOW;
      entryField : PCDKENTRY;
      scrollField : PCDKSCROLL;
      dirContents : ^Pchar;
      fileCounter : longint;
      pwd : Pchar;
      pathname : Pchar;
      xpos : longint;
      ypos : longint;
      boxHeight : longint;
      boxWidth : longint;
      fieldAttribute : Tchtype;
      fillerCharacter : Tchtype;
      highlight : Tchtype;
      dirAttribute : Pchar;
      fileAttribute : Pchar;
      linkAttribute : Pchar;
      sockAttribute : Pchar;
      exitType : TEExitType;
      shadow : Tboolean;
    end;

  TSFileSelector = TCDKFSELECT;
{
 * This creates a new CDK file selector widget.
  }
{ cdkscreen  }{ xpos  }{ ypos  }{ height  }{ width  }(* Const before type ignored *)
{ title  }(* Const before type ignored *)
{ label  }{ fieldAttribute  }{ fillerChar  }{ highlight  }(* Const before type ignored *)
{ dirAttributes  }(* Const before type ignored *)
{ fileAttributes  }(* Const before type ignored *)
{ linkAttribute  }(* Const before type ignored *)
{ sockAttribute  }{ Box  }{ shadow  }
function newCDKFselect(para1:PCDKSCREEN; para2:longint; para3:longint; para4:longint; para5:longint; 
           para6:Pchar; para7:Pchar; para8:Tchtype; para9:Tchtype; para10:Tchtype; 
           para11:Pchar; para12:Pchar; para13:Pchar; para14:Pchar; para15:Tboolean; 
           para16:Tboolean):PCDKFSELECT;cdecl;external;
{
 * This activates the file selector.
  }
{ fselect  }{ actions  }function activateCDKFselect(para1:PCDKFSELECT; para2:Pchtype):Pchar;cdecl;external;
{
 * This injects a single character into the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKFselect(obj,input : longint) : longint;

{
 * This sets various attributes of the file selector.
  }
{ fselect  }(* Const before type ignored *)
{ directory  }{ fieldAttrib  }{ filler  }{ highlight  }(* Const before type ignored *)
{ dirAttribute  }(* Const before type ignored *)
{ fileAttribute  }(* Const before type ignored *)
{ linkAttribute  }(* Const before type ignored *)
{ sockAttribute  }{ Box  }procedure setCDKFselect(para1:PCDKFSELECT; para2:Pchar; para3:Tchtype; para4:Tchtype; para5:Tchtype; 
            para6:Pchar; para7:Pchar; para8:Pchar; para9:Pchar; para10:Tboolean);cdecl;external;
{
 * This sets the current directory of the file selector.
  }
{ fselect  }(* Const before type ignored *)
{ directory  }function setCDKFselectDirectory(para1:PCDKFSELECT; para2:Pchar):longint;cdecl;external;
{ fselect  }function getCDKFselectDirectory(para1:PCDKFSELECT):Pchar;cdecl;external;
{
 * This sets the filler character of the entry field.
  }
{ fselect  }{ fillerCharacter  }procedure setCDKFselectFillerChar(para1:PCDKFSELECT; para2:Tchtype);cdecl;external;
{ fselect  }function getCDKFselectFillerChar(para1:PCDKFSELECT):Tchtype;cdecl;external;
{
 * This sets the highlight bar of the scrolling list.
  }
{ fselect  }{ highlight  }procedure setCDKFselectHighlight(para1:PCDKFSELECT; para2:Tchtype);cdecl;external;
{ fselect  }function getCDKFselectHighlight(para1:PCDKFSELECT):Tchtype;cdecl;external;
{
 * These functions set the attribute of the directories, links,
 * files, and sockets in the scrolling list portion of the file
 * selector widget.
  }
{ fselect  }(* Const before type ignored *)
{ attribute  }procedure setCDKFselectDirAttribute(para1:PCDKFSELECT; para2:Pchar);cdecl;external;
{ fselect  }(* Const before type ignored *)
{ attribute  }procedure setCDKFselectLinkAttribute(para1:PCDKFSELECT; para2:Pchar);cdecl;external;
{ fselect  }(* Const before type ignored *)
{ attribute  }procedure setCDKFselectFileAttribute(para1:PCDKFSELECT; para2:Pchar);cdecl;external;
{ fselect  }(* Const before type ignored *)
{ attribute  }procedure setCDKFselectSocketAttribute(para1:PCDKFSELECT; para2:Pchar);cdecl;external;
{
 * These functions return the attribute of the directories, links,
 * files, and sockets in the scrolling list portion of the file
 * selector widget.
  }
{ fselect  }function getCDKFselectDirAttribute(para1:PCDKFSELECT):Pchar;cdecl;external;
{ fselect  }function getCDKFselectLinkAttribute(para1:PCDKFSELECT):Pchar;cdecl;external;
{ fselect  }function getCDKFselectFileAttribute(para1:PCDKFSELECT):Pchar;cdecl;external;
{ fselect  }function getCDKFselectSocketAttribute(para1:PCDKFSELECT):Pchar;cdecl;external;
{
 * This sets the box attribute of the widget.
  }
{ fselect  }{ Box  }procedure setCDKFselectBox(para1:PCDKFSELECT; para2:Tboolean);cdecl;external;
{ fselect  }function getCDKFselectBox(para1:PCDKFSELECT):Tboolean;cdecl;external;
{
 * This sets the contents of the file selector.
  }
{ fselect  }function setCDKFselectDirContents(para1:PCDKFSELECT):longint;cdecl;external;
{ fselect  }{ count  }function getCDKFselectDirContents(para1:PCDKFSELECT; para2:Plongint):^Pchar;cdecl;external;
{
 * This sets the contents of the file selector.
  }
{ fselect  }{ list  }{ listSize  }procedure setCDKFselectContents(para1:PCDKFSELECT; para2:TCDK_CSTRING2; para3:longint);cdecl;external;
{ fselect  }{ size  }function getCDKFselectContents(para1:PCDKFSELECT; para2:Plongint):^Pchar;cdecl;external;
{
 * Get/set the current position in the scroll-widget.
  }
{ widget  }function getCDKFselectCurrentItem(para1:PCDKFSELECT):longint;cdecl;external;
{ widget  }{ item  }procedure setCDKFselectCurrentItem(para1:PCDKFSELECT; para2:longint);cdecl;external;
{
 * These functions set the drawing characters of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectULChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectURChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectLLChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectLRChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectVerticalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectHorizontalChar(w,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectBoxAttribute(w,c : longint) : longint;

{
 * This sets the background color of the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectBackgroundColor(w,c : longint) : longint;

{
 * This sets the background attribute of the widget.
  }{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectBackgroundAttrib(w,c : longint) : longint;

{
 * This draws the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKFselect(obj,Box : longint) : longint;

{
 * This erases the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKFselect(obj : longint) : longint;

{
 * This moves the widget to the given location.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKFselect(obj,xpos,ypos,relative,refresh : longint) : longint;

{
 * This allows the user to interactively position the widget.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function positionCDKFselect(widget : longint) : longint;

{
 * This destroys the widget and all the associated memory.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKFselect(obj : longint) : longint;

{
 * This is a callback which allows you to delete files from within the
 * file selector. It is NOT an active default: it MUST be set by the
 * user.
  }
{ objectType  }{ object  }{ clientData  }procedure deleteFileCB(para1:TEObjectType; para2:pointer; para3:pointer);cdecl;external;
{
 * This function sets the pre-process function.
  }
{ fselect  }{ callback  }{ data  }procedure setCDKFselectPreProcess(para1:PCDKFSELECT; para2:TPROCESSFN; para3:pointer);cdecl;external;
{
 * This function sets the post-process function.
  }
{ fselect  }{ callback  }{ data  }procedure setCDKFselectPostProcess(para1:PCDKFSELECT; para2:TPROCESSFN; para3:pointer);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ CDKFSELECT_H  }
{$endif}
{ CDKINCLUDES  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function injectCDKFselect(obj,input : longint) : longint;
begin
  injectCDKFselect:=injectCDKObject(obj,input,_String);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectULChar(w,c : longint) : longint;
begin
  setCDKFselectULChar:=setULCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectURChar(w,c : longint) : longint;
begin
  setCDKFselectURChar:=setURCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectLLChar(w,c : longint) : longint;
begin
  setCDKFselectLLChar:=setLLCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectLRChar(w,c : longint) : longint;
begin
  setCDKFselectLRChar:=setLRCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectVerticalChar(w,c : longint) : longint;
begin
  setCDKFselectVerticalChar:=setVTCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectHorizontalChar(w,c : longint) : longint;
begin
  setCDKFselectHorizontalChar:=setHZCharOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectBoxAttribute(w,c : longint) : longint;
begin
  setCDKFselectBoxAttribute:=setBXAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectBackgroundColor(w,c : longint) : longint;
begin
  setCDKFselectBackgroundColor:=setCDKObjectBackgroundColor(ObjOf(w),c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setCDKFselectBackgroundAttrib(w,c : longint) : longint;
begin
  setCDKFselectBackgroundAttrib:=setBKAttrOf(w,c);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKFselect(obj,Box : longint) : longint;
begin
  drawCDKFselect:=drawCDKObject(obj,Box);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKFselect(obj : longint) : longint;
begin
  eraseCDKFselect:=eraseCDKObject(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKFselect(obj,xpos,ypos,relative,refresh : longint) : longint;
begin
  moveCDKFselect:=moveCDKObject(obj,xpos,ypos,relative,refresh);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function positionCDKFselect(widget : longint) : longint;
begin
  positionCDKFselect:=positionCDKObject(ObjOf(widget),widget^.win);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKFselect(obj : longint) : longint;
begin
  destroyCDKFselect:=destroyCDKObject(obj);
end;


end.
