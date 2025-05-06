unit cdk_objs;

interface

uses
  ncurses, cdk, binding, cdkscreen;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PCDKBINDING = ^TCDKBINDING;
  TCDKBINDING = record
      bindFunction : TBINDFN;
      bindData : pointer;
      callbackfn : TPROCESSFN;
    end;

  PCDKDataType = ^TCDKDataType;
  TCDKDataType =  Longint;
  Const
    DataTypeUnknown = 0;
    DataTypeString = 1;
    DataTypeInt = 2;
    DataTypeFloat = 3;
    DataTypeDouble = 4;
    DataTypeUnsigned = 5;

type
  PCDKDataUnion = ^TCDKDataUnion;
  TCDKDataUnion = record
      case longint of
        0 : ( valueString : Pchar );
        1 : ( valueInt : longint );
        2 : ( valueFloat : single );
        3 : ( valueDouble : Double );
        4 : ( valueUnsigned : dword );
      end;


const
  unknownInt = -(1);  
  unknownFloat = 0.0;  
  unknownDouble = 0.0;  
  unknownUnsigned = 0;  
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


function validCDKObject(para1:PCDKOBJS):Boolean;cdecl;external libcdk;
function _newCDKObject(para1:dword; para2:PCDKFUNCS):pointer;cdecl;external libcdk;

procedure _destroyCDKObject(para1:PCDKOBJS);cdecl;external libcdk;

function getcCDKObject(para1:PCDKOBJS):longint;cdecl;external libcdk;
function getchCDKObject(para1:PCDKOBJS; para2:Pboolean):longint;cdecl;external libcdk;
procedure positionCDKObject(para1:PCDKOBJS; para2:PWINDOW);cdecl;external libcdk;
procedure setCDKObjectPreProcess(para1:PCDKOBJS; para2:TPROCESSFN; para3:pointer);cdecl;external libcdk;
procedure setCDKObjectPostProcess(para1:PCDKOBJS; para2:TPROCESSFN; para3:pointer);cdecl;external libcdk;
procedure setCDKObjectBackgroundColor(para1:PCDKOBJS; para2:Pchar);cdecl;external libcdk;
function getCdkTitle(para1:PCDKOBJS):Pchar;cdecl;external libcdk;
function setCdkTitle(para1:PCDKOBJS; para2:Pchar; para3:longint):longint;cdecl;external libcdk;
procedure drawCdkTitle(para1:PWINDOW; para2:PCDKOBJS);cdecl;external libcdk;
procedure cleanCdkTitle(para1:PCDKOBJS);cdecl;external libcdk;
procedure setCdkExitType(para1:PCDKOBJS; para2:PEExitType; para3:Tchtype);cdecl;external libcdk;

function unknownString : Pchar;

// === Konventiert am: 30-4-25 17:36:59 ===

function ObjOf(ptr : PCDKOBJS) : PCDKOBJS;
function MethodOf(ptr : PCDKOBJS) : PCDKFUNCS;
function ScreenOf(ptr : PCDKOBJS) : PCDKSCREEN;
function WindowOf(ptr : PCDKOBJS) : PWINDOW;
function BorderOf(p : PCDKOBJS) : longint;
function ResultOf(p : PCDKOBJS) : TCDKDataUnion;
function ExitTypeOf(p : PCDKOBJS) : TEExitType;
function EarlyExitOf(p : PCDKOBJS) : TEExitType;


procedure destroyCDKObject(o : Pointer);


implementation

function unknownString : Pchar;
  begin
    unknownString:=Pchar(0);
  end;

function ObjOf(ptr: PCDKOBJS): PCDKOBJS;
begin
  Result:=ptr;
//  ObjOf:=@(ptr^.obj);
end;

function MethodOf(ptr: PCDKOBJS): PCDKFUNCS;
begin
  MethodOf:=ObjOf(ptr)^.fn;
end;

function ScreenOf(ptr: PCDKOBJS): PCDKSCREEN;
begin
  ScreenOf:=ObjOf(ptr)^.screen;
end;

function WindowOf(ptr: PCDKOBJS): PWINDOW;
begin
  WindowOf:=ScreenOf(ptr)^.window;
end;

function BorderOf(p: PCDKOBJS): longint;
begin
  BorderOf:=(ObjOf(p))^.borderSize;
end;

function ResultOf(p: PCDKOBJS): TCDKDataUnion;
begin
  ResultOf:=(ObjOf(p))^.resultData;
end;

function ExitTypeOf(p: PCDKOBJS): TEExitType;
begin
  ExitTypeOf:=(ObjOf(p))^.exitType;
end;

function EarlyExitOf(p: PCDKOBJS): TEExitType;
begin
  EarlyExitOf:=(ObjOf(p))^.earlyExit;
end;

procedure destroyCDKObject(o: Pointer);
begin
//  _destroyCDKObject(ObjOf(o));
  _destroyCDKObject(o);
end;


end.
