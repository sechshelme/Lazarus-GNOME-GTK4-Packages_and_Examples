
unit cdk_objs;
interface

{
  Automatically converted by H2Pas 1.0.0 from cdk_objs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cdk_objs.h
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
PCDKBINDING  = ^CDKBINDING;
PCDKDataType  = ^CDKDataType;
PCDKDataUnion  = ^CDKDataUnion;
PCDKFUNCS  = ^CDKFUNCS;
PCDKOBJS  = ^CDKOBJS;
PCDKSCREEN  = ^CDKSCREEN;
Pchar  = ^char;
Pchtype  = ^chtype;
PEExitType  = ^EExitType;
Plongint  = ^longint;
Ptype  = ^type;
PWINDOW  = ^WINDOW;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: cdk_objs.h,v 1.43 2019/02/21 01:31:12 tom Exp $
  }
{$ifndef CDKINCLUDES}
{$ifndef CDK_OBJS_H}
{$define CDK_OBJS_H}
{ C++ extern C conditionnal removed }
{$ifndef CDK_H}
{$define CDKINCLUDES}
{$include <cdk.h>}
{$undef CDKINCLUDES}
{$include <cdk/binding.h>}
{$include <cdk/cdkscreen.h>}
{$endif}
{
 * Copyright 1999-2012,2019 Thomas E. Dickey
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
type
  PCDKBINDING = ^TCDKBINDING;
  TCDKBINDING = record
      bindFunction : TBINDFN;
      bindData : pointer;
      callbackfn : TPROCESSFN;
    end;
  PCDKOBJS = ^TCDKOBJS;
  TCDKOBJS = record
      {undefined structure}
    end;

{
 * Types for CDKFUNCS.returnType
  }

  PCDKDataType = ^TCDKDataType;
  TCDKDataType =  Longint;
  Const
    DataTypeUnknown = 0;
    DataTypeString = 1;
    DataTypeInt = 2;
    DataTypeFloat = 3;
    DataTypeDouble = 4;
    DataTypeUnsigned = 5;
;
type
  PCDKDataUnion = ^TCDKDataUnion;
  TCDKDataUnion = record
      case longint of
        0 : ( valueString : Pchar );
        1 : ( valueInt : longint );
        2 : ( valueFloat : single );
        3 : ( valueDouble : Tdouble );
        4 : ( valueUnsigned : dword );
      end;

{ was #define dname def_expr }
function unknownString : Pchar;  

const
  unknownInt = -(1);  
  unknownFloat = 0.0;  
  unknownDouble = 0.0;  
  unknownUnsigned = 0;  
{
 * Methods common to all widgets.
  }
{ line-drawing  }
{ background attribute  }
type
  PCDKFUNCS = ^TCDKFUNCS;
  TCDKFUNCS = record
      objectType : TEObjectType;
      returnType : TCDKDataType;
      drawObj : procedure (para1:PCDKOBJS; para2:Tboolean);cdecl;
      eraseObj : procedure (para1:PCDKOBJS);cdecl;
      moveObj : procedure (para1:PCDKOBJS; para2:longint; para3:longint; para4:Tboolean; para5:Tboolean);cdecl;
      injectObj : function (para1:PCDKOBJS; para2:Tchtype):longint;cdecl;
      focusObj : procedure (para1:PCDKOBJS);cdecl;
      unfocusObj : procedure (para1:PCDKOBJS);cdecl;
      saveDataObj : procedure (para1:PCDKOBJS);cdecl;
      refreshDataObj : procedure (para1:PCDKOBJS);cdecl;
      destroyObj : procedure (para1:PCDKOBJS);cdecl;
      setULcharObj : procedure (para1:PCDKOBJS; para2:Tchtype);cdecl;
      setURcharObj : procedure (para1:PCDKOBJS; para2:Tchtype);cdecl;
      setLLcharObj : procedure (para1:PCDKOBJS; para2:Tchtype);cdecl;
      setLRcharObj : procedure (para1:PCDKOBJS; para2:Tchtype);cdecl;
      setVTcharObj : procedure (para1:PCDKOBJS; para2:Tchtype);cdecl;
      setHZcharObj : procedure (para1:PCDKOBJS; para2:Tchtype);cdecl;
      setBXattrObj : procedure (para1:PCDKOBJS; para2:Tchtype);cdecl;
      setBKattrObj : procedure (para1:PCDKOBJS; para2:Tchtype);cdecl;
    end;
{
 * Data common to all objects (widget instances).  This appears first in
 * each widget's struct to allow us to use generic functions in binding.c,
 * cdkscreen.c, position.c, etc.
  }
(* Const before type ignored *)
{ title-drawing  }
{ line-drawing (see 'box')  }
{ lines: upper-left  }
{ lines: upper-right  }
{ lines: lower-left  }
{ lines: lower-right  }
{ lines: vertical  }
{ lines: horizontal  }
{ events  }
{ pre/post-processing  }

  PCDKOBJS = ^TCDKOBJS;
  TCDKOBJS = record
      screenIndex : longint;
      screen : PCDKSCREEN;
      fn : PCDKFUNCS;
      box : Tboolean;
      borderSize : longint;
      acceptsFocus : Tboolean;
      hasFocus : Tboolean;
      isVisible : Tboolean;
      inputWindow : PWINDOW;
      dataPtr : pointer;
      resultData : TCDKDataUnion;
      bindingCount : dword;
      bindingList : PCDKBINDING;
      title : ^Pchtype;
      titlePos : Plongint;
      titleLen : Plongint;
      titleLines : longint;
      ULChar : Tchtype;
      URChar : Tchtype;
      LLChar : Tchtype;
      LRChar : Tchtype;
      VTChar : Tchtype;
      HZChar : Tchtype;
      BXAttr : Tchtype;
      exitType : TEExitType;
      earlyExit : TEExitType;
      preProcessFunction : TPROCESSFN;
      preProcessData : pointer;
      postProcessFunction : TPROCESSFN;
      postProcessData : pointer;
    end;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ObjOf(ptr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MethodOf(ptr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ScreenOf(ptr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WindowOf(ptr : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BorderOf(p : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ResultOf(p : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ExitTypeOf(p : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EarlyExitOf(p : longint) : longint;

{ titles  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TitleOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TitlePosOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TitleLenOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TitleLinesOf(w : longint) : longint;

{ line-drawing characters  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ULCharOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function URCharOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LLCharOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LRCharOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTCharOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HZCharOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BXAttrOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setULCharOf(o,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setURCharOf(o,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setLLCharOf(o,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setLRCharOf(o,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setVTCharOf(o,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setHZCharOf(o,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setBXAttrOf(o,c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setBKAttrOf(o,c : longint) : longint;

{ pre/post-processing  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PreProcessFuncOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PreProcessDataOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PostProcessFuncOf(w : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PostProcessDataOf(w : longint) : longint;

{ FIXME - remove this  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ReturnOf(p : longint) : longint;

function validCDKObject(para1:PCDKOBJS):Tbool;cdecl;external;
(* Const before type ignored *)
function _newCDKObject(para1:dword; para2:PCDKFUNCS):pointer;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function newCDKObject(_type,funcs : longint) : Ptype;

procedure _destroyCDKObject(para1:PCDKOBJS);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKObject(o : longint) : longint;

{ Use these for widgets that have an obj member which is a CDKOBJS struct  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKObject(o,box : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKObject(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKObject(o,x,y,rel,ref : longint) : longint;

{#define injectCDKObject(o,c,type)      (MethodOf(o)->injectObj    (ObjOf(o),c) ? ResultOf(o).value ## type : unknown ## type) }
{ functions to set line-drawing are bound to cdk_objs.c if the widget is
 * simple, but are built into the widget for complex widgets.
  }
{DeclareSetXXchar(extern,setCdk); }
{
 * Read keycode from object, optionally translating bindings.
 * Depcrecated: use getchCDKObject().
  }
{ object  }function getcCDKObject(para1:PCDKOBJS):longint;cdecl;external;
{
 * Read keycode from object, optionally translating bindings.  Set a flag to
 * tell if the keycode is a function key.
  }
{ object  }{ functionKey  }function getchCDKObject(para1:PCDKOBJS; para2:Pboolean):longint;cdecl;external;
{
 * Interactively reposition an object within a window.
  }
{ object  }{ win  }procedure positionCDKObject(para1:PCDKOBJS; para2:PWINDOW);cdecl;external;
{
 * Pre/postprocessing.
  }
{ object  }{ func  }{ data  }procedure setCDKObjectPreProcess(para1:PCDKOBJS; para2:TPROCESSFN; para3:pointer);cdecl;external;
{ object  }{ func  }{ data  }procedure setCDKObjectPostProcess(para1:PCDKOBJS; para2:TPROCESSFN; para3:pointer);cdecl;external;
{
 * Background color.
  }
{ object  }(* Const before type ignored *)
{ color  }procedure setCDKObjectBackgroundColor(para1:PCDKOBJS; para2:Pchar);cdecl;external;
{ title-storage is implemented identically with all widgets  }
function getCdkTitle(para1:PCDKOBJS):Pchar;cdecl;external;
(* Const before type ignored *)
function setCdkTitle(para1:PCDKOBJS; para2:Pchar; para3:longint):longint;cdecl;external;
procedure drawCdkTitle(para1:PWINDOW; para2:PCDKOBJS);cdecl;external;
procedure cleanCdkTitle(para1:PCDKOBJS);cdecl;external;
{#define setCdkEarlyExit(p,q)    EarlyExitOf(p) = q }
{ obj  }{ type  }{ ch  }procedure setCdkExitType(para1:PCDKOBJS; para2:PEExitType; para3:Tchtype);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ CDK_OBJS_H  }
{$endif}
{ CDKINCLUDES  }

implementation

{ was #define dname def_expr }
function unknownString : Pchar;
  begin
    unknownString:=Pchar(0);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ObjOf(ptr : longint) : longint;
begin
  ObjOf:=@(ptr^.obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MethodOf(ptr : longint) : longint;
begin
  MethodOf:=(ObjOf(ptr))^.fn;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ScreenOf(ptr : longint) : longint;
begin
  ScreenOf:=(ObjOf(ptr))^.screen;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WindowOf(ptr : longint) : longint;
begin
  WindowOf:=(ScreenOf(ptr))^.window;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BorderOf(p : longint) : longint;
begin
  BorderOf:=(ObjOf(p))^.borderSize;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ResultOf(p : longint) : longint;
begin
  ResultOf:=(ObjOf(p))^.resultData;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ExitTypeOf(p : longint) : longint;
begin
  ExitTypeOf:=(ObjOf(p))^.exitType;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EarlyExitOf(p : longint) : longint;
begin
  EarlyExitOf:=(ObjOf(p))^.earlyExit;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TitleOf(w : longint) : longint;
begin
  TitleOf:=(ObjOf(w))^.title;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TitlePosOf(w : longint) : longint;
begin
  TitlePosOf:=(ObjOf(w))^.titlePos;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TitleLenOf(w : longint) : longint;
begin
  TitleLenOf:=(ObjOf(w))^.titleLen;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TitleLinesOf(w : longint) : longint;
begin
  TitleLinesOf:=(ObjOf(w))^.titleLines;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ULCharOf(w : longint) : longint;
begin
  ULCharOf:=(ObjOf(w))^.ULChar;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function URCharOf(w : longint) : longint;
begin
  URCharOf:=(ObjOf(w))^.URChar;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LLCharOf(w : longint) : longint;
begin
  LLCharOf:=(ObjOf(w))^.LLChar;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LRCharOf(w : longint) : longint;
begin
  LRCharOf:=(ObjOf(w))^.LRChar;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTCharOf(w : longint) : longint;
begin
  VTCharOf:=(ObjOf(w))^.VTChar;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HZCharOf(w : longint) : longint;
begin
  HZCharOf:=(ObjOf(w))^.HZChar;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BXAttrOf(w : longint) : longint;
begin
  BXAttrOf:=(ObjOf(w))^.BXAttr;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setULCharOf(o,c : longint) : longint;
begin
  setULCharOf:=(MethodOf(o))^.(setULcharObj(ObjOf(o),c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setURCharOf(o,c : longint) : longint;
begin
  setURCharOf:=(MethodOf(o))^.(setURcharObj(ObjOf(o),c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setLLCharOf(o,c : longint) : longint;
begin
  setLLCharOf:=(MethodOf(o))^.(setLLcharObj(ObjOf(o),c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setLRCharOf(o,c : longint) : longint;
begin
  setLRCharOf:=(MethodOf(o))^.(setLRcharObj(ObjOf(o),c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setVTCharOf(o,c : longint) : longint;
begin
  setVTCharOf:=(MethodOf(o))^.(setVTcharObj(ObjOf(o),c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setHZCharOf(o,c : longint) : longint;
begin
  setHZCharOf:=(MethodOf(o))^.(setHZcharObj(ObjOf(o),c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setBXAttrOf(o,c : longint) : longint;
begin
  setBXAttrOf:=(MethodOf(o))^.(setBXattrObj(ObjOf(o),c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function setBKAttrOf(o,c : longint) : longint;
begin
  setBKAttrOf:=(MethodOf(o))^.(setBKattrObj(ObjOf(o),c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PreProcessFuncOf(w : longint) : longint;
begin
  PreProcessFuncOf:=(ObjOf(w))^.preProcessFunction;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PreProcessDataOf(w : longint) : longint;
begin
  PreProcessDataOf:=(ObjOf(w))^.preProcessData;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PostProcessFuncOf(w : longint) : longint;
begin
  PostProcessFuncOf:=(ObjOf(w))^.postProcessFunction;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PostProcessDataOf(w : longint) : longint;
begin
  PostProcessDataOf:=(ObjOf(w))^.postProcessData;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ReturnOf(p : longint) : longint;
begin
  ReturnOf:=(ObjPtr(p))^.dataPtr;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function newCDKObject(_type,funcs : longint) : Ptype;
begin
  newCDKObject:=Ptype(_newCDKObject(sizeof(_type),funcs));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function destroyCDKObject(o : longint) : longint;
begin
  destroyCDKObject:=_destroyCDKObject(ObjOf(o));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function drawCDKObject(o,box : longint) : longint;
begin
  drawCDKObject:=(MethodOf(o))^.(drawObj(ObjOf(o),box));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eraseCDKObject(o : longint) : longint;
begin
  eraseCDKObject:=(MethodOf(o))^.(eraseObj(ObjOf(o)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function moveCDKObject(o,x,y,rel,ref : longint) : longint;
begin
  moveCDKObject:=(MethodOf(o))^.(moveObj(ObjOf(o),x,y,rel,ref));
end;


end.
