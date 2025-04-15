unit tclDecls;

interface

uses
  ctypes, tk_tcl_common, tcl, tclPlatDecls;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

function Tcl_PkgProvideEx(interp:PTcl_Interp; name:Pchar; version:Pchar; clientData:pointer):longint;cdecl;external libtclstub8_6;
function Tcl_PkgRequireEx(interp:PTcl_Interp; name:Pchar; version:Pchar; exact:longint; clientDataPtr:pointer):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_Panic(format:Pchar; args:array of const);cdecl;external libtclstub8_6;
procedure Tcl_Panic(format:Pchar);cdecl;external libtclstub8_6;
function Tcl_Alloc(size:dword):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_Free(ptr:Pchar);cdecl;external libtclstub8_6;
function Tcl_Realloc(ptr:Pchar; size:dword):Pchar;cdecl;external libtclstub8_6;
function Tcl_DbCkalloc(size:dword; file_:Pchar; line:longint):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_DbCkfree(ptr:Pchar; file_:Pchar; line:longint);cdecl;external libtclstub8_6;
function Tcl_DbCkrealloc(ptr:Pchar; size:dword; file_:Pchar; line:longint):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_CreateFileHandler(fd:longint; mask:longint; proc:PTcl_FileProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_DeleteFileHandler(fd:longint);cdecl;external libtclstub8_6;
procedure Tcl_SetTimer(timePtr:PTcl_Time);cdecl;external libtclstub8_6;
procedure Tcl_Sleep(ms:longint);cdecl;external libtclstub8_6;
function Tcl_WaitForEvent(timePtr:PTcl_Time):longint;cdecl;external libtclstub8_6;
function Tcl_AppendAllObjTypes(interp:PTcl_Interp; objPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
procedure Tcl_AppendStringsToObj(objPtr:PTcl_Obj; args:array of const);cdecl;external libtclstub8_6;
procedure Tcl_AppendStringsToObj(objPtr:PTcl_Obj);cdecl;external libtclstub8_6;
procedure Tcl_AppendToObj(objPtr:PTcl_Obj; bytes:Pchar; length:longint);cdecl;external libtclstub8_6;
function Tcl_ConcatObj(objc:longint; objv:PPTcl_Obj):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_ConvertToType(interp:PTcl_Interp; objPtr:PTcl_Obj; typePtr:PTcl_ObjType):longint;cdecl;external libtclstub8_6;
procedure Tcl_DbDecrRefCount(objPtr:PTcl_Obj; file_:Pchar; line:longint);cdecl;external libtclstub8_6;
procedure Tcl_DbIncrRefCount(objPtr:PTcl_Obj; file_:Pchar; line:longint);cdecl;external libtclstub8_6;
function Tcl_DbIsShared(objPtr:PTcl_Obj; file_:Pchar; line:longint):longint;cdecl;external libtclstub8_6;
function Tcl_DbNewBooleanObj(intValue:longint; file_:Pchar; line:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_DbNewByteArrayObj(bytes:Pbyte; length:longint; file_:Pchar; line:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_DbNewDoubleObj(doubleValue:double; file_:Pchar; line:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_DbNewListObj(objc:longint; objv:PPTcl_Obj; file_:Pchar; line:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_DbNewLongObj(longValue:longint; file_:Pchar; line:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_DbNewObj(file_:Pchar; line:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_DbNewStringObj(bytes:Pchar; length:longint; file_:Pchar; line:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_DuplicateObj(objPtr:PTcl_Obj):PTcl_Obj;cdecl;external libtclstub8_6;
procedure TclFreeObj(objPtr:PTcl_Obj);cdecl;external libtclstub8_6;
function Tcl_GetBoolean(interp:PTcl_Interp; src:Pchar; intPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_GetBooleanFromObj(interp:PTcl_Interp; objPtr:PTcl_Obj; intPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_GetByteArrayFromObj(objPtr:PTcl_Obj; numBytesPtr:Plongint):Pbyte;cdecl;external libtclstub8_6;
function Tcl_GetDouble(interp:PTcl_Interp; src:Pchar; doublePtr:Pdouble):longint;cdecl;external libtclstub8_6;
function Tcl_GetDoubleFromObj(interp:PTcl_Interp; objPtr:PTcl_Obj; doublePtr:Pdouble):longint;cdecl;external libtclstub8_6;
function Tcl_GetIndexFromObj(interp:PTcl_Interp; objPtr:PTcl_Obj; tablePtr:PPchar; msg:Pchar; flags:longint;
           indexPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_GetInt(interp:PTcl_Interp; src:Pchar; intPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_GetIntFromObj(interp:PTcl_Interp; objPtr:PTcl_Obj; intPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_GetLongFromObj(interp:PTcl_Interp; objPtr:PTcl_Obj; longPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_GetObjType(typeName:Pchar):PTcl_ObjType;cdecl;external libtclstub8_6;
function Tcl_GetStringFromObj(objPtr:PTcl_Obj; lengthPtr:Plongint):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_InvalidateStringRep(objPtr:PTcl_Obj);cdecl;external libtclstub8_6;
function Tcl_ListObjAppendList(interp:PTcl_Interp; listPtr:PTcl_Obj; elemListPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_ListObjAppendElement(interp:PTcl_Interp; listPtr:PTcl_Obj; objPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_ListObjGetElements(interp:PTcl_Interp; listPtr:PTcl_Obj; objcPtr:Plongint; objvPtr:PPPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_ListObjIndex(interp:PTcl_Interp; listPtr:PTcl_Obj; index:longint; objPtrPtr:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_ListObjLength(interp:PTcl_Interp; listPtr:PTcl_Obj; lengthPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_ListObjReplace(interp:PTcl_Interp; listPtr:PTcl_Obj; first:longint; count:longint; objc:longint;
           objv:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_NewBooleanObj(intValue:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_NewByteArrayObj(bytes:Pbyte; numBytes:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_NewDoubleObj(doubleValue:double):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_NewIntObj(intValue:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_NewListObj(objc:longint; objv:PPTcl_Obj):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_NewLongObj(longValue:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_NewObj:PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_NewStringObj(bytes:Pchar; length:longint):PTcl_Obj;cdecl;external libtclstub8_6;
procedure Tcl_SetBooleanObj(objPtr:PTcl_Obj; intValue:longint);cdecl;external libtclstub8_6;
function Tcl_SetByteArrayLength(objPtr:PTcl_Obj; numBytes:longint):Pbyte;cdecl;external libtclstub8_6;
procedure Tcl_SetByteArrayObj(objPtr:PTcl_Obj; bytes:Pbyte; numBytes:longint);cdecl;external libtclstub8_6;
procedure Tcl_SetDoubleObj(objPtr:PTcl_Obj; doubleValue:double);cdecl;external libtclstub8_6;
procedure Tcl_SetIntObj(objPtr:PTcl_Obj; intValue:longint);cdecl;external libtclstub8_6;
procedure Tcl_SetListObj(objPtr:PTcl_Obj; objc:longint; objv:PPTcl_Obj);cdecl;external libtclstub8_6;
procedure Tcl_SetLongObj(objPtr:PTcl_Obj; longValue:longint);cdecl;external libtclstub8_6;
procedure Tcl_SetObjLength(objPtr:PTcl_Obj; length:longint);cdecl;external libtclstub8_6;
procedure Tcl_SetStringObj(objPtr:PTcl_Obj; bytes:Pchar; length:longint);cdecl;external libtclstub8_6;
procedure Tcl_AddErrorInfo(interp:PTcl_Interp; message:Pchar);cdecl;external libtclstub8_6;
procedure Tcl_AddObjErrorInfo(interp:PTcl_Interp; message:Pchar; length:longint);cdecl;external libtclstub8_6;
procedure Tcl_AllowExceptions(interp:PTcl_Interp);cdecl;external libtclstub8_6;
procedure Tcl_AppendElement(interp:PTcl_Interp; element:Pchar);cdecl;external libtclstub8_6;
procedure Tcl_AppendResult(interp:PTcl_Interp; args:array of const);cdecl;external libtclstub8_6;
procedure Tcl_AppendResult(interp:PTcl_Interp);cdecl;external libtclstub8_6;
function Tcl_AsyncCreate(proc:PTcl_AsyncProc; clientData:TClientData):TTcl_AsyncHandler;cdecl;external libtclstub8_6;
procedure Tcl_AsyncDelete(async:TTcl_AsyncHandler);cdecl;external libtclstub8_6;
function Tcl_AsyncInvoke(interp:PTcl_Interp; code:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_AsyncMark(async:TTcl_AsyncHandler);cdecl;external libtclstub8_6;
function Tcl_AsyncReady:longint;cdecl;external libtclstub8_6;
procedure Tcl_BackgroundError(interp:PTcl_Interp);cdecl;external libtclstub8_6;
function Tcl_Backslash(src:Pchar; readPtr:Plongint):char;cdecl;external libtclstub8_6;
function Tcl_BadChannelOption(interp:PTcl_Interp; optionName:Pchar; optionList:Pchar):longint;cdecl;external libtclstub8_6;
procedure Tcl_CallWhenDeleted(interp:PTcl_Interp; proc:PTcl_InterpDeleteProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_CancelIdleCall(idleProc:PTcl_IdleProc; clientData:TClientData);cdecl;external libtclstub8_6;
function Tcl_Close(interp:PTcl_Interp; chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_CommandComplete(cmd:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_Concat(argc:longint; argv:PPchar):Pchar;cdecl;external libtclstub8_6;
function Tcl_ConvertElement(src:Pchar; dst:Pchar; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_ConvertCountedElement(src:Pchar; length:longint; dst:Pchar; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_CreateAlias(childInterp:PTcl_Interp; childCmd:Pchar; target:PTcl_Interp; targetCmd:Pchar; argc:longint;
           argv:PPchar):longint;cdecl;external libtclstub8_6;
function Tcl_CreateAliasObj(childInterp:PTcl_Interp; childCmd:Pchar; target:PTcl_Interp; targetCmd:Pchar; objc:longint;
           objv:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_CreateChannel(typePtr:PTcl_ChannelType; chanName:Pchar; instanceData:TClientData; mask:longint):TTcl_Channel;cdecl;external libtclstub8_6;
procedure Tcl_CreateChannelHandler(chan:TTcl_Channel; mask:longint; proc:PTcl_ChannelProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_CreateCloseHandler(chan:TTcl_Channel; proc:PTcl_CloseProc; clientData:TClientData);cdecl;external libtclstub8_6;
function Tcl_CreateCommand(interp:PTcl_Interp; cmdName:Pchar; proc:PTcl_CmdProc; clientData:TClientData; deleteProc:PTcl_CmdDeleteProc):TTcl_Command;cdecl;external libtclstub8_6;
procedure Tcl_CreateEventSource(setupProc:PTcl_EventSetupProc; checkProc:PTcl_EventCheckProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_CreateExitHandler(proc:PTcl_ExitProc; clientData:TClientData);cdecl;external libtclstub8_6;
function Tcl_CreateInterp:PTcl_Interp;cdecl;external libtclstub8_6;
procedure Tcl_CreateMathFunc(interp:PTcl_Interp; name:Pchar; numArgs:longint; argTypes:PTcl_ValueType; proc:PTcl_MathProc;
            clientData:TClientData);cdecl;external libtclstub8_6;
function Tcl_CreateObjCommand(interp:PTcl_Interp; cmdName:Pchar; proc:PTcl_ObjCmdProc; clientData:TClientData; deleteProc:PTcl_CmdDeleteProc):TTcl_Command;cdecl;external libtclstub8_6;
function Tcl_CreateSlave(interp:PTcl_Interp; name:Pchar; isSafe:longint):PTcl_Interp;cdecl;external libtclstub8_6;
function Tcl_CreateTimerHandler(milliseconds:longint; proc:PTcl_TimerProc; clientData:TClientData):TTcl_TimerToken;cdecl;external libtclstub8_6;
function Tcl_CreateTrace(interp:PTcl_Interp; level:longint; proc:PTcl_CmdTraceProc; clientData:TClientData):TTcl_Trace;cdecl;external libtclstub8_6;
procedure Tcl_DeleteAssocData(interp:PTcl_Interp; name:Pchar);cdecl;external libtclstub8_6;
procedure Tcl_DeleteChannelHandler(chan:TTcl_Channel; proc:PTcl_ChannelProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_DeleteCloseHandler(chan:TTcl_Channel; proc:PTcl_CloseProc; clientData:TClientData);cdecl;external libtclstub8_6;
function Tcl_DeleteCommand(interp:PTcl_Interp; cmdName:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_DeleteCommandFromToken(interp:PTcl_Interp; command:TTcl_Command):longint;cdecl;external libtclstub8_6;
procedure Tcl_DeleteEvents(proc:PTcl_EventDeleteProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_DeleteEventSource(setupProc:PTcl_EventSetupProc; checkProc:PTcl_EventCheckProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_DeleteExitHandler(proc:PTcl_ExitProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_DeleteHashEntry(entryPtr:PTcl_HashEntry);cdecl;external libtclstub8_6;
procedure Tcl_DeleteHashTable(tablePtr:PTcl_HashTable);cdecl;external libtclstub8_6;
procedure Tcl_DeleteInterp(interp:PTcl_Interp);cdecl;external libtclstub8_6;
procedure Tcl_DetachPids(numPids:longint; pidPtr:PTcl_Pid);cdecl;external libtclstub8_6;
procedure Tcl_DeleteTimerHandler(token:TTcl_TimerToken);cdecl;external libtclstub8_6;
procedure Tcl_DeleteTrace(interp:PTcl_Interp; trace:TTcl_Trace);cdecl;external libtclstub8_6;
procedure Tcl_DontCallWhenDeleted(interp:PTcl_Interp; proc:PTcl_InterpDeleteProc; clientData:TClientData);cdecl;external libtclstub8_6;
function Tcl_DoOneEvent(flags:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_DoWhenIdle(proc:PTcl_IdleProc; clientData:TClientData);cdecl;external libtclstub8_6;
function Tcl_DStringAppend(dsPtr:PTcl_DString; bytes:Pchar; length:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_DStringAppendElement(dsPtr:PTcl_DString; element:Pchar):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_DStringEndSublist(dsPtr:PTcl_DString);cdecl;external libtclstub8_6;
procedure Tcl_DStringFree(dsPtr:PTcl_DString);cdecl;external libtclstub8_6;
procedure Tcl_DStringGetResult(interp:PTcl_Interp; dsPtr:PTcl_DString);cdecl;external libtclstub8_6;
procedure Tcl_DStringInit(dsPtr:PTcl_DString);cdecl;external libtclstub8_6;
procedure Tcl_DStringResult(interp:PTcl_Interp; dsPtr:PTcl_DString);cdecl;external libtclstub8_6;
procedure Tcl_DStringSetLength(dsPtr:PTcl_DString; length:longint);cdecl;external libtclstub8_6;
procedure Tcl_DStringStartSublist(dsPtr:PTcl_DString);cdecl;external libtclstub8_6;
function Tcl_Eof(chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_ErrnoId:Pchar;cdecl;external libtclstub8_6;
function Tcl_ErrnoMsg(err:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_Eval(interp:PTcl_Interp; script:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_EvalFile(interp:PTcl_Interp; fileName:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_EvalObj(interp:PTcl_Interp; objPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
procedure Tcl_EventuallyFree(clientData:TClientData; freeProc:PTcl_FreeProc);cdecl;external libtclstub8_6;
procedure Tcl_Exit(status:longint);cdecl;external libtclstub8_6;
function Tcl_ExposeCommand(interp:PTcl_Interp; hiddenCmdToken:Pchar; cmdName:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_ExprBoolean(interp:PTcl_Interp; expr:Pchar; ptr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_ExprBooleanObj(interp:PTcl_Interp; objPtr:PTcl_Obj; ptr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_ExprDouble(interp:PTcl_Interp; expr:Pchar; ptr:Pdouble):longint;cdecl;external libtclstub8_6;
function Tcl_ExprDoubleObj(interp:PTcl_Interp; objPtr:PTcl_Obj; ptr:Pdouble):longint;cdecl;external libtclstub8_6;
function Tcl_ExprLong(interp:PTcl_Interp; expr:Pchar; ptr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_ExprLongObj(interp:PTcl_Interp; objPtr:PTcl_Obj; ptr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_ExprObj(interp:PTcl_Interp; objPtr:PTcl_Obj; resultPtrPtr:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_ExprString(interp:PTcl_Interp; expr:Pchar):longint;cdecl;external libtclstub8_6;
procedure Tcl_Finalize;cdecl;external libtclstub8_6;
procedure Tcl_FindExecutable(argv0:Pchar);cdecl;external libtclstub8_6;
function Tcl_FirstHashEntry(tablePtr:PTcl_HashTable; searchPtr:PTcl_HashSearch):PTcl_HashEntry;cdecl;external libtclstub8_6;
function Tcl_Flush(chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
procedure Tcl_FreeResult(interp:PTcl_Interp);cdecl;external libtclstub8_6;
function Tcl_GetAlias(interp:PTcl_Interp; childCmd:Pchar; targetInterpPtr:PPTcl_Interp; targetCmdPtr:PPchar; argcPtr:Plongint;
           argvPtr:PPPchar):longint;cdecl;external libtclstub8_6;
function Tcl_GetAliasObj(interp:PTcl_Interp; childCmd:Pchar; targetInterpPtr:PPTcl_Interp; targetCmdPtr:PPchar; objcPtr:Plongint;
           objv:PPPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetAssocData(interp:PTcl_Interp; name:Pchar; procPtr:PPTcl_InterpDeleteProc):TClientData;cdecl;external libtclstub8_6;
function Tcl_GetChannel(interp:PTcl_Interp; chanName:Pchar; modePtr:Plongint):TTcl_Channel;cdecl;external libtclstub8_6;
function Tcl_GetChannelBufferSize(chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_GetChannelHandle(chan:TTcl_Channel; direction:longint; handlePtr:PClientData):longint;cdecl;external libtclstub8_6;
function Tcl_GetChannelInstanceData(chan:TTcl_Channel):TClientData;cdecl;external libtclstub8_6;
function Tcl_GetChannelMode(chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_GetChannelName(chan:TTcl_Channel):Pchar;cdecl;external libtclstub8_6;
function Tcl_GetChannelOption(interp:PTcl_Interp; chan:TTcl_Channel; optionName:Pchar; dsPtr:PTcl_DString):longint;cdecl;external libtclstub8_6;
function Tcl_GetChannelType(chan:TTcl_Channel):PTcl_ChannelType;cdecl;external libtclstub8_6;
function Tcl_GetCommandInfo(interp:PTcl_Interp; cmdName:Pchar; infoPtr:PTcl_CmdInfo):longint;cdecl;external libtclstub8_6;
function Tcl_GetCommandName(interp:PTcl_Interp; command:TTcl_Command):Pchar;cdecl;external libtclstub8_6;
function Tcl_GetErrno:longint;cdecl;external libtclstub8_6;
function Tcl_GetHostName:Pchar;cdecl;external libtclstub8_6;
function Tcl_GetInterpPath(interp:PTcl_Interp; childInterp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
function Tcl_GetMaster(interp:PTcl_Interp):PTcl_Interp;cdecl;external libtclstub8_6;
function Tcl_GetNameOfExecutable:Pchar;cdecl;external libtclstub8_6;
function Tcl_GetObjResult(interp:PTcl_Interp):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_GetOpenFile(interp:PTcl_Interp; chanID:Pchar; forWriting:longint; checkUsage:longint; filePtr:PClientData):longint;cdecl;external libtclstub8_6;
function Tcl_GetPathType(path:Pchar):TTcl_PathType;cdecl;external libtclstub8_6;
function Tcl_Gets(chan:TTcl_Channel; dsPtr:PTcl_DString):longint;cdecl;external libtclstub8_6;
function Tcl_GetsObj(chan:TTcl_Channel; objPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetServiceMode:longint;cdecl;external libtclstub8_6;
function Tcl_GetSlave(interp:PTcl_Interp; name:Pchar):PTcl_Interp;cdecl;external libtclstub8_6;
function Tcl_GetStdChannel(_type:longint):TTcl_Channel;cdecl;external libtclstub8_6;
function Tcl_GetStringResult(interp:PTcl_Interp):Pchar;cdecl;external libtclstub8_6;
function Tcl_GetVar(interp:PTcl_Interp; varName:Pchar; flags:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_GetVar2(interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_GlobalEval(interp:PTcl_Interp; command:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_GlobalEvalObj(interp:PTcl_Interp; objPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_HideCommand(interp:PTcl_Interp; cmdName:Pchar; hiddenCmdToken:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_Init(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
procedure Tcl_InitHashTable(tablePtr:PTcl_HashTable; keyType:longint);cdecl;external libtclstub8_6;
function Tcl_InputBlocked(chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_InputBuffered(chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_InterpDeleted(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
function Tcl_IsSafe(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
function Tcl_JoinPath(argc:longint; argv:PPchar; resultPtr:PTcl_DString):Pchar;cdecl;external libtclstub8_6;
function Tcl_LinkVar(interp:PTcl_Interp; varName:Pchar; addr:Pchar; _type:longint):longint;cdecl;external libtclstub8_6;
function Tcl_MakeFileChannel(handle:TClientData; mode:longint):TTcl_Channel;cdecl;external libtclstub8_6;
function Tcl_MakeSafe(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
function Tcl_MakeTcpClientChannel(tcpSocket:TClientData):TTcl_Channel;cdecl;external libtclstub8_6;
function Tcl_Merge(argc:longint; argv:PPchar):Pchar;cdecl;external libtclstub8_6;
function Tcl_NextHashEntry(searchPtr:PTcl_HashSearch):PTcl_HashEntry;cdecl;external libtclstub8_6;
procedure Tcl_NotifyChannel(channel:TTcl_Channel; mask:longint);cdecl;external libtclstub8_6;
function Tcl_ObjGetVar2(interp:PTcl_Interp; part1Ptr:PTcl_Obj; part2Ptr:PTcl_Obj; flags:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_ObjSetVar2(interp:PTcl_Interp; part1Ptr:PTcl_Obj; part2Ptr:PTcl_Obj; newValuePtr:PTcl_Obj; flags:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_OpenCommandChannel(interp:PTcl_Interp; argc:longint; argv:PPchar; flags:longint):TTcl_Channel;cdecl;external libtclstub8_6;
function Tcl_OpenFileChannel(interp:PTcl_Interp; fileName:Pchar; modeString:Pchar; permissions:longint):TTcl_Channel;cdecl;external libtclstub8_6;
function Tcl_OpenTcpClient(interp:PTcl_Interp; port:longint; address:Pchar; myaddr:Pchar; myport:longint;
           flags:longint):TTcl_Channel;cdecl;external libtclstub8_6;
function Tcl_OpenTcpServer(interp:PTcl_Interp; port:longint; host:Pchar; acceptProc:PTcl_TcpAcceptProc; callbackData:TClientData):TTcl_Channel;cdecl;external libtclstub8_6;
procedure Tcl_Preserve(data:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_PrintDouble(interp:PTcl_Interp; value:double; dst:Pchar);cdecl;external libtclstub8_6;
function Tcl_PutEnv(assignment:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_PosixError(interp:PTcl_Interp):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_QueueEvent(evPtr:PTcl_Event; position:TTcl_QueuePosition);cdecl;external libtclstub8_6;
function Tcl_Read(chan:TTcl_Channel; bufPtr:Pchar; toRead:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_ReapDetachedProcs;cdecl;external libtclstub8_6;
function Tcl_RecordAndEval(interp:PTcl_Interp; cmd:Pchar; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_RecordAndEvalObj(interp:PTcl_Interp; cmdPtr:PTcl_Obj; flags:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_RegisterChannel(interp:PTcl_Interp; chan:TTcl_Channel);cdecl;external libtclstub8_6;
procedure Tcl_RegisterObjType(typePtr:PTcl_ObjType);cdecl;external libtclstub8_6;
function Tcl_RegExpCompile(interp:PTcl_Interp; pattern:Pchar):TTcl_RegExp;cdecl;external libtclstub8_6;
function Tcl_RegExpExec(interp:PTcl_Interp; regexp:TTcl_RegExp; text:Pchar; start:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_RegExpMatch(interp:PTcl_Interp; text:Pchar; pattern:Pchar):longint;cdecl;external libtclstub8_6;
procedure Tcl_RegExpRange(regexp:TTcl_RegExp; index:longint; startPtr:PPchar; endPtr:PPchar);cdecl;external libtclstub8_6;
procedure Tcl_Release(clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_ResetResult(interp:PTcl_Interp);cdecl;external libtclstub8_6;
function Tcl_ScanElement(src:Pchar; flagPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_ScanCountedElement(src:Pchar; length:longint; flagPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_SeekOld(chan:TTcl_Channel; offset:longint; mode:longint):longint;cdecl;external libtclstub8_6;
function Tcl_ServiceAll:longint;cdecl;external libtclstub8_6;
function Tcl_ServiceEvent(flags:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_SetAssocData(interp:PTcl_Interp; name:Pchar; proc:PTcl_InterpDeleteProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_SetChannelBufferSize(chan:TTcl_Channel; sz:longint);cdecl;external libtclstub8_6;
function Tcl_SetChannelOption(interp:PTcl_Interp; chan:TTcl_Channel; optionName:Pchar; newValue:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_SetCommandInfo(interp:PTcl_Interp; cmdName:Pchar; infoPtr:PTcl_CmdInfo):longint;cdecl;external libtclstub8_6;
procedure Tcl_SetErrno(err:longint);cdecl;external libtclstub8_6;
procedure Tcl_SetErrorCode(interp:PTcl_Interp; args:array of const);cdecl;external libtclstub8_6;
procedure Tcl_SetErrorCode(interp:PTcl_Interp);cdecl;external libtclstub8_6;
procedure Tcl_SetMaxBlockTime(timePtr:PTcl_Time);cdecl;external libtclstub8_6;
procedure Tcl_SetPanicProc(panicProc:PTcl_PanicProc);cdecl;external libtclstub8_6;
function Tcl_SetRecursionLimit(interp:PTcl_Interp; depth:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_SetResult(interp:PTcl_Interp; result:Pchar; freeProc:PTcl_FreeProc);cdecl;external libtclstub8_6;
function Tcl_SetServiceMode(mode:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_SetObjErrorCode(interp:PTcl_Interp; errorObjPtr:PTcl_Obj);cdecl;external libtclstub8_6;
procedure Tcl_SetObjResult(interp:PTcl_Interp; resultObjPtr:PTcl_Obj);cdecl;external libtclstub8_6;
procedure Tcl_SetStdChannel(channel:TTcl_Channel; _type:longint);cdecl;external libtclstub8_6;
function Tcl_SetVar(interp:PTcl_Interp; varName:Pchar; newValue:Pchar; flags:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_SetVar2(interp:PTcl_Interp; part1:Pchar; part2:Pchar; newValue:Pchar; flags:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_SignalId(sig:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_SignalMsg(sig:longint):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_SourceRCFile(interp:PTcl_Interp);cdecl;external libtclstub8_6;
function Tcl_SplitList(interp:PTcl_Interp; listStr:Pchar; argcPtr:Plongint; argvPtr:PPPchar):longint;cdecl;external libtclstub8_6;
procedure Tcl_SplitPath(path:Pchar; argcPtr:Plongint; argvPtr:PPPchar);cdecl;external libtclstub8_6;
procedure Tcl_StaticPackage(interp:PTcl_Interp; prefix:Pchar; initProc:PTcl_PackageInitProc; safeInitProc:PTcl_PackageInitProc);cdecl;external libtclstub8_6;
function Tcl_StringMatch(str:Pchar; pattern:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_TellOld(chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_TraceVar(interp:PTcl_Interp; varName:Pchar; flags:longint; proc:PTcl_VarTraceProc; clientData:TClientData):longint;cdecl;external libtclstub8_6;
function Tcl_TraceVar2(interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint; proc:PTcl_VarTraceProc;
           clientData:TClientData):longint;cdecl;external libtclstub8_6;
function Tcl_TranslateFileName(interp:PTcl_Interp; name:Pchar; bufferPtr:PTcl_DString):Pchar;cdecl;external libtclstub8_6;
function Tcl_Ungets(chan:TTcl_Channel; str:Pchar; len:longint; atHead:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_UnlinkVar(interp:PTcl_Interp; varName:Pchar);cdecl;external libtclstub8_6;
function Tcl_UnregisterChannel(interp:PTcl_Interp; chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_UnsetVar(interp:PTcl_Interp; varName:Pchar; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UnsetVar2(interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_UntraceVar(interp:PTcl_Interp; varName:Pchar; flags:longint; proc:PTcl_VarTraceProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_UntraceVar2(interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint; proc:PTcl_VarTraceProc;
            clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_UpdateLinkedVar(interp:PTcl_Interp; varName:Pchar);cdecl;external libtclstub8_6;
function Tcl_UpVar(interp:PTcl_Interp; frameName:Pchar; varName:Pchar; localName:Pchar; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UpVar2(interp:PTcl_Interp; frameName:Pchar; part1:Pchar; part2:Pchar; localName:Pchar;
           flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_VarEval(interp:PTcl_Interp; args:array of const):longint;cdecl;external libtclstub8_6;
function Tcl_VarEval(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
function Tcl_VarTraceInfo(interp:PTcl_Interp; varName:Pchar; flags:longint; procPtr:PTcl_VarTraceProc; prevClientData:TClientData):TClientData;cdecl;external libtclstub8_6;
function Tcl_VarTraceInfo2(interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint; procPtr:PTcl_VarTraceProc;
           prevClientData:TClientData):TClientData;cdecl;external libtclstub8_6;
function Tcl_Write(chan:TTcl_Channel; s:Pchar; slen:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_WrongNumArgs(interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj; message:Pchar);cdecl;external libtclstub8_6;
function Tcl_DumpActiveMemory(fileName:Pchar):longint;cdecl;external libtclstub8_6;
procedure Tcl_ValidateAllMemory(file_:Pchar; line:longint);cdecl;external libtclstub8_6;
procedure Tcl_AppendResultVA(interp:PTcl_Interp; argList:Tva_list);cdecl;external libtclstub8_6;
procedure Tcl_AppendStringsToObjVA(objPtr:PTcl_Obj; argList:Tva_list);cdecl;external libtclstub8_6;
function Tcl_HashStats(tablePtr:PTcl_HashTable):Pchar;cdecl;external libtclstub8_6;
function Tcl_ParseVar(interp:PTcl_Interp; start:Pchar; termPtr:PPchar):Pchar;cdecl;external libtclstub8_6;
function Tcl_PkgPresent(interp:PTcl_Interp; name:Pchar; version:Pchar; exact:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_PkgPresentEx(interp:PTcl_Interp; name:Pchar; version:Pchar; exact:longint; clientDataPtr:pointer):Pchar;cdecl;external libtclstub8_6;
function Tcl_PkgProvide(interp:PTcl_Interp; name:Pchar; version:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_PkgRequire(interp:PTcl_Interp; name:Pchar; version:Pchar; exact:longint):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_SetErrorCodeVA(interp:PTcl_Interp; argList:Tva_list);cdecl;external libtclstub8_6;
function Tcl_VarEvalVA(interp:PTcl_Interp; argList:Tva_list):longint;cdecl;external libtclstub8_6;
function Tcl_WaitPid(pid:TTcl_Pid; statPtr:Plongint; options:longint):TTcl_Pid;cdecl;external libtclstub8_6;
procedure Tcl_PanicVA(format:Pchar; argList:Tva_list);cdecl;external libtclstub8_6;
procedure Tcl_GetVersion(major:Plongint; minor:Plongint; patchLevel:Plongint; _type:Plongint);cdecl;external libtclstub8_6;
procedure Tcl_InitMemory(interp:PTcl_Interp);cdecl;external libtclstub8_6;
function Tcl_StackChannel(interp:PTcl_Interp; typePtr:PTcl_ChannelType; instanceData:TClientData; mask:longint; prevChan:TTcl_Channel):TTcl_Channel;cdecl;external libtclstub8_6;
function Tcl_UnstackChannel(interp:PTcl_Interp; chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_GetStackedChannel(chan:TTcl_Channel):TTcl_Channel;cdecl;external libtclstub8_6;
procedure Tcl_SetMainLoop(proc:PTcl_MainLoopProc);cdecl;external libtclstub8_6;
procedure Tcl_AppendObjToObj(objPtr:PTcl_Obj; appendObjPtr:PTcl_Obj);cdecl;external libtclstub8_6;
function Tcl_CreateEncoding(typePtr:PTcl_EncodingType):TTcl_Encoding;cdecl;external libtclstub8_6;
procedure Tcl_CreateThreadExitHandler(proc:PTcl_ExitProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_DeleteThreadExitHandler(proc:PTcl_ExitProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_DiscardResult(statePtr:PTcl_SavedResult);cdecl;external libtclstub8_6;
function Tcl_EvalEx(interp:PTcl_Interp; script:Pchar; numBytes:longint; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_EvalObjv(interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_EvalObjEx(interp:PTcl_Interp; objPtr:PTcl_Obj; flags:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_ExitThread(status:longint);cdecl;external libtclstub8_6;
function Tcl_externalToUtf(interp:PTcl_Interp; encoding:TTcl_Encoding; src:Pchar; srcLen:longint; flags:longint;
           statePtr:PTcl_EncodingState; dst:Pchar; dstLen:longint; srcReadPtr:Plongint; dstWrotePtr:Plongint; 
           dstCharsPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_externalToUtfDString(encoding:TTcl_Encoding; src:Pchar; srcLen:longint; dsPtr:PTcl_DString):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_FinalizeThread;cdecl;external libtclstub8_6;
procedure Tcl_FinalizeNotifier(clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_FreeEncoding(encoding:TTcl_Encoding);cdecl;external libtclstub8_6;
function Tcl_GetCurrentThread:TTcl_ThreadId;cdecl;external libtclstub8_6;
function Tcl_GetEncoding(interp:PTcl_Interp; name:Pchar):TTcl_Encoding;cdecl;external libtclstub8_6;
function Tcl_GetEncodingName(encoding:TTcl_Encoding):Pchar;cdecl;external libtclstub8_6;
procedure Tcl_GetEncodingNames(interp:PTcl_Interp);cdecl;external libtclstub8_6;
function Tcl_GetIndexFromObjStruct(interp:PTcl_Interp; objPtr:PTcl_Obj; tablePtr:pointer; offset:longint; msg:Pchar;
           flags:longint; indexPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_GetThreadData(keyPtr:PTcl_ThreadDataKey; size:longint):pointer;cdecl;external libtclstub8_6;
function Tcl_GetVar2Ex(interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_InitNotifier:TClientData;cdecl;external libtclstub8_6;
procedure Tcl_MutexLock(mutexPtr:PTcl_Mutex);cdecl;external libtclstub8_6;
procedure Tcl_MutexUnlock(mutexPtr:PTcl_Mutex);cdecl;external libtclstub8_6;
procedure Tcl_ConditionNotify(condPtr:PTcl_Condition);cdecl;external libtclstub8_6;
procedure Tcl_ConditionWait(condPtr:PTcl_Condition; mutexPtr:PTcl_Mutex; timePtr:PTcl_Time);cdecl;external libtclstub8_6;
function Tcl_NumUtfChars(src:Pchar; length:longint):longint;cdecl;external libtclstub8_6;
function Tcl_ReadChars(channel:TTcl_Channel; objPtr:PTcl_Obj; charsToRead:longint; appendFlag:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_RestoreResult(interp:PTcl_Interp; statePtr:PTcl_SavedResult);cdecl;external libtclstub8_6;
procedure Tcl_SaveResult(interp:PTcl_Interp; statePtr:PTcl_SavedResult);cdecl;external libtclstub8_6;
function Tcl_SetSystemEncoding(interp:PTcl_Interp; name:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_SetVar2Ex(interp:PTcl_Interp; part1:Pchar; part2:Pchar; newValuePtr:PTcl_Obj; flags:longint):PTcl_Obj;cdecl;external libtclstub8_6;
procedure Tcl_ThreadAlert(threadId:TTcl_ThreadId);cdecl;external libtclstub8_6;
procedure Tcl_ThreadQueueEvent(threadId:TTcl_ThreadId; evPtr:PTcl_Event; position:TTcl_QueuePosition);cdecl;external libtclstub8_6;
function Tcl_UniCharAtIndex(src:Pchar; index:longint):TTcl_UniChar;cdecl;external libtclstub8_6;
function Tcl_UniCharToLower(ch:longint):TTcl_UniChar;cdecl;external libtclstub8_6;
function Tcl_UniCharToTitle(ch:longint):TTcl_UniChar;cdecl;external libtclstub8_6;
function Tcl_UniCharToUpper(ch:longint):TTcl_UniChar;cdecl;external libtclstub8_6;
function Tcl_UniCharToUtf(ch:longint; buf:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_UtfAtIndex(src:Pchar; index:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_UtfCharComplete(src:Pchar; length:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UtfBackslash(src:Pchar; readPtr:Plongint; dst:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_UtfFindFirst(src:Pchar; ch:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_UtfFindLast(src:Pchar; ch:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_UtfNext(src:Pchar):Pchar;cdecl;external libtclstub8_6;
function Tcl_UtfPrev(src:Pchar; start:Pchar):Pchar;cdecl;external libtclstub8_6;
function Tcl_UtfToexternal(interp:PTcl_Interp; encoding:TTcl_Encoding; src:Pchar; srcLen:longint; flags:longint;
           statePtr:PTcl_EncodingState; dst:Pchar; dstLen:longint; srcReadPtr:Plongint; dstWrotePtr:Plongint; 
           dstCharsPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_UtfToexternalDString(encoding:TTcl_Encoding; src:Pchar; srcLen:longint; dsPtr:PTcl_DString):Pchar;cdecl;external libtclstub8_6;
function Tcl_UtfToLower(src:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_UtfToTitle(src:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_UtfToUniChar(src:Pchar; chPtr:PTcl_UniChar):longint;cdecl;external libtclstub8_6;
function Tcl_UtfToUpper(src:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_WriteChars(chan:TTcl_Channel; src:Pchar; srcLen:longint):longint;cdecl;external libtclstub8_6;
function Tcl_WriteObj(chan:TTcl_Channel; objPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetString(objPtr:PTcl_Obj):Pchar;cdecl;external libtclstub8_6;
function Tcl_GetDefaultEncodingDir:Pchar;cdecl;external libtclstub8_6;
procedure Tcl_SetDefaultEncodingDir(path:Pchar);cdecl;external libtclstub8_6;
procedure Tcl_AlertNotifier(clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_ServiceModeHook(mode:longint);cdecl;external libtclstub8_6;
function Tcl_UniCharIsAlnum(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharIsAlpha(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharIsDigit(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharIsLower(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharIsSpace(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharIsUpper(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharIsWordChar(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharLen(uniStr:PTcl_UniChar):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharNcmp(ucs:PTcl_UniChar; uct:PTcl_UniChar; numChars:dword):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharToUtfDString(uniStr:PTcl_UniChar; uniLength:longint; dsPtr:PTcl_DString):Pchar;cdecl;external libtclstub8_6;
function Tcl_UtfToUniCharDString(src:Pchar; length:longint; dsPtr:PTcl_DString):PTcl_UniChar;cdecl;external libtclstub8_6;
function Tcl_GetRegExpFromObj(interp:PTcl_Interp; patObj:PTcl_Obj; flags:longint):TTcl_RegExp;cdecl;external libtclstub8_6;
function Tcl_EvalTokens(interp:PTcl_Interp; tokenPtr:PTcl_Token; count:longint):PTcl_Obj;cdecl;external libtclstub8_6;
procedure Tcl_FreeParse(parsePtr:PTcl_Parse);cdecl;external libtclstub8_6;
procedure Tcl_LogCommandInfo(interp:PTcl_Interp; script:Pchar; command:Pchar; length:longint);cdecl;external libtclstub8_6;
function Tcl_ParseBraces(interp:PTcl_Interp; start:Pchar; numBytes:longint; parsePtr:PTcl_Parse; append:longint;
           termPtr:PPchar):longint;cdecl;external libtclstub8_6;
function Tcl_ParseCommand(interp:PTcl_Interp; start:Pchar; numBytes:longint; nested:longint; parsePtr:PTcl_Parse):longint;cdecl;external libtclstub8_6;
function Tcl_ParseExpr(interp:PTcl_Interp; start:Pchar; numBytes:longint; parsePtr:PTcl_Parse):longint;cdecl;external libtclstub8_6;
function Tcl_ParseQuotedString(interp:PTcl_Interp; start:Pchar; numBytes:longint; parsePtr:PTcl_Parse; append:longint;
           termPtr:PPchar):longint;cdecl;external libtclstub8_6;
function Tcl_ParseVarName(interp:PTcl_Interp; start:Pchar; numBytes:longint; parsePtr:PTcl_Parse; append:longint):longint;cdecl;external libtclstub8_6;
function Tcl_GetCwd(interp:PTcl_Interp; cwdPtr:PTcl_DString):Pchar;cdecl;external libtclstub8_6;
function Tcl_Chdir(dirName:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_Access(path:Pchar; mode:longint):longint;cdecl;external libtclstub8_6;
function Tcl_Stat(path:Pchar; bufPtr:Pstat):longint;cdecl;external libtclstub8_6;
function Tcl_UtfNcmp(s1:Pchar; s2:Pchar; n:dword):longint;cdecl;external libtclstub8_6;
function Tcl_UtfNcasecmp(s1:Pchar; s2:Pchar; n:dword):longint;cdecl;external libtclstub8_6;
function Tcl_StringCaseMatch(str:Pchar; pattern:Pchar; nocase:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharIsControl(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharIsGraph(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharIsPrint(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharIsPunct(ch:longint):longint;cdecl;external libtclstub8_6;
function Tcl_RegExpExecObj(interp:PTcl_Interp; regexp:TTcl_RegExp; textObj:PTcl_Obj; offset:longint; nmatches:longint;
           flags:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_RegExpGetInfo(regexp:TTcl_RegExp; infoPtr:PTcl_RegExpInfo);cdecl;external libtclstub8_6;
function Tcl_NewUnicodeObj(unicode:PTcl_UniChar; numChars:longint):PTcl_Obj;cdecl;external libtclstub8_6;
procedure Tcl_SetUnicodeObj(objPtr:PTcl_Obj; unicode:PTcl_UniChar; numChars:longint);cdecl;external libtclstub8_6;
function Tcl_GetCharLength(objPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetUniChar(objPtr:PTcl_Obj; index:longint):TTcl_UniChar;cdecl;external libtclstub8_6;
function Tcl_GetUnicode(objPtr:PTcl_Obj):PTcl_UniChar;cdecl;external libtclstub8_6;
function Tcl_GetRange(objPtr:PTcl_Obj; first:longint; last:longint):PTcl_Obj;cdecl;external libtclstub8_6;
procedure Tcl_AppendUnicodeToObj(objPtr:PTcl_Obj; unicode:PTcl_UniChar; length:longint);cdecl;external libtclstub8_6;
function Tcl_RegExpMatchObj(interp:PTcl_Interp; textObj:PTcl_Obj; patternObj:PTcl_Obj):longint;cdecl;external libtclstub8_6;
procedure Tcl_SetNotifier(notifierProcPtr:PTcl_NotifierProcs);cdecl;external libtclstub8_6;
function Tcl_GetAllocMutex:PTcl_Mutex;cdecl;external libtclstub8_6;
function Tcl_GetChannelNames(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
function Tcl_GetChannelNamesEx(interp:PTcl_Interp; pattern:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_ProcObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
procedure Tcl_ConditionFinalize(condPtr:PTcl_Condition);cdecl;external libtclstub8_6;
procedure Tcl_MutexFinalize(mutex:PTcl_Mutex);cdecl;external libtclstub8_6;
function Tcl_CreateThread(idPtr:PTcl_ThreadId; proc:PTcl_ThreadCreateProc; clientData:TClientData; stackSize:longint; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_ReadRaw(chan:TTcl_Channel; dst:Pchar; bytesToRead:longint):longint;cdecl;external libtclstub8_6;
function Tcl_WriteRaw(chan:TTcl_Channel; src:Pchar; srcLen:longint):longint;cdecl;external libtclstub8_6;
function Tcl_GetTopChannel(chan:TTcl_Channel):TTcl_Channel;cdecl;external libtclstub8_6;
function Tcl_ChannelBuffered(chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_ChannelName(chanTypePtr:PTcl_ChannelType):Pchar;cdecl;external libtclstub8_6;
function Tcl_ChannelVersion(chanTypePtr:PTcl_ChannelType):TTcl_ChannelTypeVersion;cdecl;external libtclstub8_6;
function Tcl_ChannelBlockModeProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverBlockModeProc;cdecl;external libtclstub8_6;
function Tcl_ChannelCloseProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverCloseProc;cdecl;external libtclstub8_6;
function Tcl_ChannelClose2Proc(chanTypePtr:PTcl_ChannelType):PTcl_DriverClose2Proc;cdecl;external libtclstub8_6;
function Tcl_ChannelInputProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverInputProc;cdecl;external libtclstub8_6;
function Tcl_ChannelOutputProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverOutputProc;cdecl;external libtclstub8_6;
function Tcl_ChannelSeekProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverSeekProc;cdecl;external libtclstub8_6;
function Tcl_ChannelSetOptionProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverSetOptionProc;cdecl;external libtclstub8_6;
function Tcl_ChannelGetOptionProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverGetOptionProc;cdecl;external libtclstub8_6;
function Tcl_ChannelWatchProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverWatchProc;cdecl;external libtclstub8_6;
function Tcl_ChannelGetHandleProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverGetHandleProc;cdecl;external libtclstub8_6;
function Tcl_ChannelFlushProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverFlushProc;cdecl;external libtclstub8_6;
function Tcl_ChannelHandlerProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverHandlerProc;cdecl;external libtclstub8_6;
function Tcl_JoinThread(threadId:TTcl_ThreadId; result:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_IsChannelShared(channel:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_IsChannelRegistered(interp:PTcl_Interp; channel:TTcl_Channel):longint;cdecl;external libtclstub8_6;
procedure Tcl_CutChannel(channel:TTcl_Channel);cdecl;external libtclstub8_6;
procedure Tcl_SpliceChannel(channel:TTcl_Channel);cdecl;external libtclstub8_6;
procedure Tcl_ClearChannelHandlers(channel:TTcl_Channel);cdecl;external libtclstub8_6;
function Tcl_IsChannelExisting(channelName:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharNcasecmp(ucs:PTcl_UniChar; uct:PTcl_UniChar; numChars:dword):longint;cdecl;external libtclstub8_6;
function Tcl_UniCharCaseMatch(uniStr:PTcl_UniChar; uniPattern:PTcl_UniChar; nocase:longint):longint;cdecl;external libtclstub8_6;
function Tcl_FindHashEntry(tablePtr:PTcl_HashTable; key:pointer):PTcl_HashEntry;cdecl;external libtclstub8_6;
function Tcl_CreateHashEntry(tablePtr:PTcl_HashTable; key:pointer; newPtr:Plongint):PTcl_HashEntry;cdecl;external libtclstub8_6;
procedure Tcl_InitCustomHashTable(tablePtr:PTcl_HashTable; keyType:longint; typePtr:PTcl_HashKeyType);cdecl;external libtclstub8_6;
procedure Tcl_InitObjHashTable(tablePtr:PTcl_HashTable);cdecl;external libtclstub8_6;
function Tcl_CommandTraceInfo(interp:PTcl_Interp; varName:Pchar; flags:longint; procPtr:PTcl_CommandTraceProc; prevClientData:TClientData):TClientData;cdecl;external libtclstub8_6;
function Tcl_TraceCommand(interp:PTcl_Interp; varName:Pchar; flags:longint; proc:PTcl_CommandTraceProc; clientData:TClientData):longint;cdecl;external libtclstub8_6;
procedure Tcl_UntraceCommand(interp:PTcl_Interp; varName:Pchar; flags:longint; proc:PTcl_CommandTraceProc; clientData:TClientData);cdecl;external libtclstub8_6;
function Tcl_AttemptAlloc(size:dword):Pchar;cdecl;external libtclstub8_6;
function Tcl_AttemptDbCkalloc(size:dword; file_:Pchar; line:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_AttemptRealloc(ptr:Pchar; size:dword):Pchar;cdecl;external libtclstub8_6;
function Tcl_AttemptDbCkrealloc(ptr:Pchar; size:dword; file_:Pchar; line:longint):Pchar;cdecl;external libtclstub8_6;
function Tcl_AttemptSetObjLength(objPtr:PTcl_Obj; length:longint):longint;cdecl;external libtclstub8_6;
function Tcl_GetChannelThread(channel:TTcl_Channel):TTcl_ThreadId;cdecl;external libtclstub8_6;
function Tcl_GetUnicodeFromObj(objPtr:PTcl_Obj; lengthPtr:Plongint):PTcl_UniChar;cdecl;external libtclstub8_6;
function Tcl_GetMathFuncInfo(interp:PTcl_Interp; name:Pchar; numArgsPtr:Plongint; argTypesPtr:PPTcl_ValueType; procPtr:PPTcl_MathProc;
           clientDataPtr:PClientData):longint;cdecl;external libtclstub8_6;
function Tcl_ListMathFuncs(interp:PTcl_Interp; pattern:Pchar):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_SubstObj(interp:PTcl_Interp; objPtr:PTcl_Obj; flags:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_DetachChannel(interp:PTcl_Interp; channel:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_IsStandardChannel(channel:TTcl_Channel):longint;cdecl;external libtclstub8_6;
function Tcl_FSCopyFile(srcPathPtr:PTcl_Obj; destPathPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSCopyDirectory(srcPathPtr:PTcl_Obj; destPathPtr:PTcl_Obj; errorPtr:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSCreateDirectory(pathPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSDeleteFile(pathPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSLoadFile(interp:PTcl_Interp; pathPtr:PTcl_Obj; sym1:Pchar; sym2:Pchar; proc1Ptr:PPTcl_PackageInitProc;
           proc2Ptr:PPTcl_PackageInitProc; handlePtr:PTcl_LoadHandle; unloadProcPtr:PPTcl_FSUnloadFileProc):longint;cdecl;external libtclstub8_6;
function Tcl_FSMatchInDirectory(interp:PTcl_Interp; result:PTcl_Obj; pathPtr:PTcl_Obj; pattern:Pchar; types:PTcl_GlobTypeData):longint;cdecl;external libtclstub8_6;
function Tcl_FSLink(pathPtr:PTcl_Obj; toPtr:PTcl_Obj; linkAction:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSRemoveDirectory(pathPtr:PTcl_Obj; recursive:longint; errorPtr:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSRenameFile(srcPathPtr:PTcl_Obj; destPathPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSLstat(pathPtr:PTcl_Obj; buf:PTcl_StatBuf):longint;cdecl;external libtclstub8_6;
function Tcl_FSUtime(pathPtr:PTcl_Obj; tval:Putimbuf):longint;cdecl;external libtclstub8_6;
function Tcl_FSFileAttrsGet(interp:PTcl_Interp; index:longint; pathPtr:PTcl_Obj; objPtrRef:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSFileAttrsSet(interp:PTcl_Interp; index:longint; pathPtr:PTcl_Obj; objPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSFileAttrStrings(pathPtr:PTcl_Obj; objPtrRef:PPTcl_Obj):PPchar;cdecl;external libtclstub8_6;
function Tcl_FSStat(pathPtr:PTcl_Obj; buf:PTcl_StatBuf):longint;cdecl;external libtclstub8_6;
function Tcl_FSAccess(pathPtr:PTcl_Obj; mode:longint):longint;cdecl;external libtclstub8_6;
function Tcl_FSOpenFileChannel(interp:PTcl_Interp; pathPtr:PTcl_Obj; modeString:Pchar; permissions:longint):TTcl_Channel;cdecl;external libtclstub8_6;
function Tcl_FSGetCwd(interp:PTcl_Interp):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSChdir(pathPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSConvertToPathType(interp:PTcl_Interp; pathPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSJoinPath(listObj:PTcl_Obj; elements:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSSplitPath(pathPtr:PTcl_Obj; lenPtr:Plongint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSEqualPaths(firstPtr:PTcl_Obj; secondPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSGetNormalizedPath(interp:PTcl_Interp; pathPtr:PTcl_Obj):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSJoinToPath(pathPtr:PTcl_Obj; objc:longint; objv:PPTcl_Obj):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSGetInternalRep(pathPtr:PTcl_Obj; fsPtr:PTcl_Filesystem):TClientData;cdecl;external libtclstub8_6;
function Tcl_FSGetTranslatedPath(interp:PTcl_Interp; pathPtr:PTcl_Obj):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSEvalFile(interp:PTcl_Interp; fileName:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_FSNewNativePath(fromFilesystem:PTcl_Filesystem; clientData:TClientData):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSGetNativePath(pathPtr:PTcl_Obj):pointer;cdecl;external libtclstub8_6;
function Tcl_FSFileSystemInfo(pathPtr:PTcl_Obj):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSPathSeparator(pathPtr:PTcl_Obj):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSListVolumes:PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_FSRegister(clientData:TClientData; fsPtr:PTcl_Filesystem):longint;cdecl;external libtclstub8_6;
function Tcl_FSUnregister(fsPtr:PTcl_Filesystem):longint;cdecl;external libtclstub8_6;
function Tcl_FSData(fsPtr:PTcl_Filesystem):TClientData;cdecl;external libtclstub8_6;
function Tcl_FSGetTranslatedStringPath(interp:PTcl_Interp; pathPtr:PTcl_Obj):Pchar;cdecl;external libtclstub8_6;
function Tcl_FSGetFileSystemForPath(pathPtr:PTcl_Obj):PTcl_Filesystem;cdecl;external libtclstub8_6;
function Tcl_FSGetPathType(pathPtr:PTcl_Obj):TTcl_PathType;cdecl;external libtclstub8_6;
function Tcl_OutputBuffered(chan:TTcl_Channel):longint;cdecl;external libtclstub8_6;
procedure Tcl_FSMountsChanged(fsPtr:PTcl_Filesystem);cdecl;external libtclstub8_6;
function Tcl_EvalTokensStandard(interp:PTcl_Interp; tokenPtr:PTcl_Token; count:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_GetTime(timeBuf:PTcl_Time);cdecl;external libtclstub8_6;
function Tcl_CreateObjTrace(interp:PTcl_Interp; level:longint; flags:longint; objProc:PTcl_CmdObjTraceProc; clientData:TClientData;
           delProc:PTcl_CmdObjTraceDeleteProc):TTcl_Trace;cdecl;external libtclstub8_6;
function Tcl_GetCommandInfoFromToken(token:TTcl_Command; infoPtr:PTcl_CmdInfo):longint;cdecl;external libtclstub8_6;
function Tcl_SetCommandInfoFromToken(token:TTcl_Command; infoPtr:PTcl_CmdInfo):longint;cdecl;external libtclstub8_6;
function Tcl_DbNewWideIntObj(wideValue:TTcl_WideInt; file_:Pchar; line:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_GetWideIntFromObj(interp:PTcl_Interp; objPtr:PTcl_Obj; widePtr:PTcl_WideInt):longint;cdecl;external libtclstub8_6;
function Tcl_NewWideIntObj(wideValue:TTcl_WideInt):PTcl_Obj;cdecl;external libtclstub8_6;
procedure Tcl_SetWideIntObj(objPtr:PTcl_Obj; wideValue:TTcl_WideInt);cdecl;external libtclstub8_6;
function Tcl_AllocStatBuf:PTcl_StatBuf;cdecl;external libtclstub8_6;
function Tcl_Seek(chan:TTcl_Channel; offset:TTcl_WideInt; mode:longint):TTcl_WideInt;cdecl;external libtclstub8_6;
function Tcl_Tell(chan:TTcl_Channel):TTcl_WideInt;cdecl;external libtclstub8_6;
function Tcl_ChannelWideSeekProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverWideSeekProc;cdecl;external libtclstub8_6;
function Tcl_DictObjPut(interp:PTcl_Interp; dictPtr:PTcl_Obj; keyPtr:PTcl_Obj; valuePtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_DictObjGet(interp:PTcl_Interp; dictPtr:PTcl_Obj; keyPtr:PTcl_Obj; valuePtrPtr:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_DictObjRemove(interp:PTcl_Interp; dictPtr:PTcl_Obj; keyPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_DictObjSize(interp:PTcl_Interp; dictPtr:PTcl_Obj; sizePtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_DictObjFirst(interp:PTcl_Interp; dictPtr:PTcl_Obj; searchPtr:PTcl_DictSearch; keyPtrPtr:PPTcl_Obj; valuePtrPtr:PPTcl_Obj;
           donePtr:Plongint):longint;cdecl;external libtclstub8_6;
procedure Tcl_DictObjNext(searchPtr:PTcl_DictSearch; keyPtrPtr:PPTcl_Obj; valuePtrPtr:PPTcl_Obj; donePtr:Plongint);cdecl;external libtclstub8_6;
procedure Tcl_DictObjDone(searchPtr:PTcl_DictSearch);cdecl;external libtclstub8_6;
function Tcl_DictObjPutKeyList(interp:PTcl_Interp; dictPtr:PTcl_Obj; keyc:longint; keyv:PPTcl_Obj; valuePtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_DictObjRemoveKeyList(interp:PTcl_Interp; dictPtr:PTcl_Obj; keyc:longint; keyv:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_NewDictObj:PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_DbNewDictObj(file_:Pchar; line:longint):PTcl_Obj;cdecl;external libtclstub8_6;
procedure Tcl_RegisterConfig(interp:PTcl_Interp; pkgName:Pchar; configuration:PTcl_Config; valEncoding:Pchar);cdecl;external libtclstub8_6;
function Tcl_CreateNamespace(interp:PTcl_Interp; name:Pchar; clientData:TClientData; deleteProc:PTcl_NamespaceDeleteProc):PTcl_Namespace;cdecl;external libtclstub8_6;
procedure Tcl_DeleteNamespace(nsPtr:PTcl_Namespace);cdecl;external libtclstub8_6;
function Tcl_AppendExportList(interp:PTcl_Interp; nsPtr:PTcl_Namespace; objPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_Export(interp:PTcl_Interp; nsPtr:PTcl_Namespace; pattern:Pchar; resetListFirst:longint):longint;cdecl;external libtclstub8_6;
function Tcl_Import(interp:PTcl_Interp; nsPtr:PTcl_Namespace; pattern:Pchar; allowOverwrite:longint):longint;cdecl;external libtclstub8_6;
function Tcl_ForgetImport(interp:PTcl_Interp; nsPtr:PTcl_Namespace; pattern:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_GetCurrentNamespace(interp:PTcl_Interp):PTcl_Namespace;cdecl;external libtclstub8_6;
function Tcl_GetGlobalNamespace(interp:PTcl_Interp):PTcl_Namespace;cdecl;external libtclstub8_6;
function Tcl_FindNamespace(interp:PTcl_Interp; name:Pchar; contextNsPtr:PTcl_Namespace; flags:longint):PTcl_Namespace;cdecl;external libtclstub8_6;
function Tcl_FindCommand(interp:PTcl_Interp; name:Pchar; contextNsPtr:PTcl_Namespace; flags:longint):TTcl_Command;cdecl;external libtclstub8_6;
function Tcl_GetCommandFromObj(interp:PTcl_Interp; objPtr:PTcl_Obj):TTcl_Command;cdecl;external libtclstub8_6;
procedure Tcl_GetCommandFullName(interp:PTcl_Interp; command:TTcl_Command; objPtr:PTcl_Obj);cdecl;external libtclstub8_6;
function Tcl_FSEvalFileEx(interp:PTcl_Interp; fileName:PTcl_Obj; encodingName:Pchar):longint;cdecl;external libtclstub8_6;
function Tcl_SetExitProc(proc:PTcl_ExitProc):PTcl_ExitProc;cdecl;external libtclstub8_6;
procedure Tcl_LimitAddHandler(interp:PTcl_Interp; _type:longint; handlerProc:PTcl_LimitHandlerProc; clientData:TClientData; deleteProc:PTcl_LimitHandlerDeleteProc);cdecl;external libtclstub8_6;
procedure Tcl_LimitRemoveHandler(interp:PTcl_Interp; _type:longint; handlerProc:PTcl_LimitHandlerProc; clientData:TClientData);cdecl;external libtclstub8_6;
function Tcl_LimitReady(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
function Tcl_LimitCheck(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
function Tcl_LimitExceeded(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
procedure Tcl_LimitSetCommands(interp:PTcl_Interp; commandLimit:longint);cdecl;external libtclstub8_6;
procedure Tcl_LimitSetTime(interp:PTcl_Interp; timeLimitPtr:PTcl_Time);cdecl;external libtclstub8_6;
procedure Tcl_LimitSetGranularity(interp:PTcl_Interp; _type:longint; granularity:longint);cdecl;external libtclstub8_6;
function Tcl_LimitTypeEnabled(interp:PTcl_Interp; _type:longint):longint;cdecl;external libtclstub8_6;
function Tcl_LimitTypeExceeded(interp:PTcl_Interp; _type:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_LimitTypeSet(interp:PTcl_Interp; _type:longint);cdecl;external libtclstub8_6;
procedure Tcl_LimitTypeReset(interp:PTcl_Interp; _type:longint);cdecl;external libtclstub8_6;
function Tcl_LimitGetCommands(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
procedure Tcl_LimitGetTime(interp:PTcl_Interp; timeLimitPtr:PTcl_Time);cdecl;external libtclstub8_6;
function Tcl_LimitGetGranularity(interp:PTcl_Interp; _type:longint):longint;cdecl;external libtclstub8_6;
function Tcl_SaveInterpState(interp:PTcl_Interp; status:longint):TTcl_InterpState;cdecl;external libtclstub8_6;
function Tcl_RestoreInterpState(interp:PTcl_Interp; state:TTcl_InterpState):longint;cdecl;external libtclstub8_6;
procedure Tcl_DiscardInterpState(state:TTcl_InterpState);cdecl;external libtclstub8_6;
function Tcl_SetReturnOptions(interp:PTcl_Interp; options:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetReturnOptions(interp:PTcl_Interp; result:longint):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_IsEnsemble(token:TTcl_Command):longint;cdecl;external libtclstub8_6;
function Tcl_CreateEnsemble(interp:PTcl_Interp; name:Pchar; namespacePtr:PTcl_Namespace; flags:longint):TTcl_Command;cdecl;external libtclstub8_6;
function Tcl_FindEnsemble(interp:PTcl_Interp; cmdNameObj:PTcl_Obj; flags:longint):TTcl_Command;cdecl;external libtclstub8_6;
function Tcl_SetEnsembleSubcommandList(interp:PTcl_Interp; token:TTcl_Command; subcmdList:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_SetEnsembleMappingDict(interp:PTcl_Interp; token:TTcl_Command; mapDict:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_SetEnsembleUnknownHandler(interp:PTcl_Interp; token:TTcl_Command; unknownList:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_SetEnsembleFlags(interp:PTcl_Interp; token:TTcl_Command; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_GetEnsembleSubcommandList(interp:PTcl_Interp; token:TTcl_Command; subcmdListPtr:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetEnsembleMappingDict(interp:PTcl_Interp; token:TTcl_Command; mapDictPtr:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetEnsembleUnknownHandler(interp:PTcl_Interp; token:TTcl_Command; unknownListPtr:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetEnsembleFlags(interp:PTcl_Interp; token:TTcl_Command; flagsPtr:Plongint):longint;cdecl;external libtclstub8_6;
function Tcl_GetEnsembleNamespace(interp:PTcl_Interp; token:TTcl_Command; namespacePtrPtr:PPTcl_Namespace):longint;cdecl;external libtclstub8_6;
procedure Tcl_SetTimeProc(getProc:PTcl_GetTimeProc; scaleProc:PTcl_ScaleTimeProc; clientData:TClientData);cdecl;external libtclstub8_6;
procedure Tcl_QueryTimeProc(getProc:PPTcl_GetTimeProc; scaleProc:PPTcl_ScaleTimeProc; clientData:PClientData);cdecl;external libtclstub8_6;
function Tcl_ChannelThreadActionProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverThreadActionProc;cdecl;external libtclstub8_6;
function Tcl_NewBignumObj(value:Pmp_int):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_DbNewBignumObj(value:Pmp_int; file_:Pchar; line:longint):PTcl_Obj;cdecl;external libtclstub8_6;
procedure Tcl_SetBignumObj(obj:PTcl_Obj; value:Pmp_int);cdecl;external libtclstub8_6;
function Tcl_GetBignumFromObj(interp:PTcl_Interp; obj:PTcl_Obj; value:Pmp_int):longint;cdecl;external libtclstub8_6;
function Tcl_TakeBignumFromObj(interp:PTcl_Interp; obj:PTcl_Obj; value:Pmp_int):longint;cdecl;external libtclstub8_6;
function Tcl_TruncateChannel(chan:TTcl_Channel; length:TTcl_WideInt):longint;cdecl;external libtclstub8_6;
function Tcl_ChannelTruncateProc(chanTypePtr:PTcl_ChannelType):PTcl_DriverTruncateProc;cdecl;external libtclstub8_6;
procedure Tcl_SetChannelErrorInterp(interp:PTcl_Interp; msg:PTcl_Obj);cdecl;external libtclstub8_6;
procedure Tcl_GetChannelErrorInterp(interp:PTcl_Interp; msg:PPTcl_Obj);cdecl;external libtclstub8_6;
procedure Tcl_SetChannelError(chan:TTcl_Channel; msg:PTcl_Obj);cdecl;external libtclstub8_6;
procedure Tcl_GetChannelError(chan:TTcl_Channel; msg:PPTcl_Obj);cdecl;external libtclstub8_6;
function Tcl_InitBignumFromDouble(interp:PTcl_Interp; initval:double; toInit:Pmp_int):longint;cdecl;external libtclstub8_6;
function Tcl_GetNamespaceUnknownHandler(interp:PTcl_Interp; nsPtr:PTcl_Namespace):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_SetNamespaceUnknownHandler(interp:PTcl_Interp; nsPtr:PTcl_Namespace; handlerPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetEncodingFromObj(interp:PTcl_Interp; objPtr:PTcl_Obj; encodingPtr:PTcl_Encoding):longint;cdecl;external libtclstub8_6;
function Tcl_GetEncodingSearchPath:PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_SetEncodingSearchPath(searchPath:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetEncodingNameFromEnvironment(bufPtr:PTcl_DString):Pchar;cdecl;external libtclstub8_6;
function Tcl_PkgRequireProc(interp:PTcl_Interp; name:Pchar; objc:longint; objv:PPTcl_Obj; clientDataPtr:pointer):longint;cdecl;external libtclstub8_6;
procedure Tcl_AppendObjToErrorInfo(interp:PTcl_Interp; objPtr:PTcl_Obj);cdecl;external libtclstub8_6;
procedure Tcl_AppendLimitedToObj(objPtr:PTcl_Obj; bytes:Pchar; length:longint; limit:longint; ellipsis:Pchar);cdecl;external libtclstub8_6;
function Tcl_Format(interp:PTcl_Interp; format:Pchar; objc:longint; objv:PPTcl_Obj):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_AppendFormatToObj(interp:PTcl_Interp; objPtr:PTcl_Obj; format:Pchar; objc:longint; objv:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_ObjPrintf(format:Pchar; args:array of const):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_ObjPrintf(format:Pchar):PTcl_Obj;cdecl;external libtclstub8_6;
procedure Tcl_AppendPrintfToObj(objPtr:PTcl_Obj; format:Pchar; args:array of const);cdecl;external libtclstub8_6;
procedure Tcl_AppendPrintfToObj(objPtr:PTcl_Obj; format:Pchar);cdecl;external libtclstub8_6;
function Tcl_CancelEval(interp:PTcl_Interp; resultObjPtr:PTcl_Obj; clientData:TClientData; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_Canceled(interp:PTcl_Interp; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_CreatePipe(interp:PTcl_Interp; rchan:PTcl_Channel; wchan:PTcl_Channel; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_NRCreateCommand(interp:PTcl_Interp; cmdName:Pchar; proc:PTcl_ObjCmdProc; nreProc:PTcl_ObjCmdProc; clientData:TClientData;
           deleteProc:PTcl_CmdDeleteProc):TTcl_Command;cdecl;external libtclstub8_6;
function Tcl_NREvalObj(interp:PTcl_Interp; objPtr:PTcl_Obj; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_NREvalObjv(interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_NRCmdSwap(interp:PTcl_Interp; cmd:TTcl_Command; objc:longint; objv:PPTcl_Obj; flags:longint):longint;cdecl;external libtclstub8_6;
procedure Tcl_NRAddCallback(interp:PTcl_Interp; postProcPtr:PTcl_NRPostProc; data0:TClientData; data1:TClientData; data2:TClientData;
            data3:TClientData);cdecl;external libtclstub8_6;
function Tcl_NRCallObjProc(interp:PTcl_Interp; objProc:PTcl_ObjCmdProc; clientData:TClientData; objc:longint; objv:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetFSDeviceFromStat(statPtr:PTcl_StatBuf):dword;cdecl;external libtclstub8_6;
function Tcl_GetFSInodeFromStat(statPtr:PTcl_StatBuf):dword;cdecl;external libtclstub8_6;
function Tcl_GetModeFromStat(statPtr:PTcl_StatBuf):dword;cdecl;external libtclstub8_6;
function Tcl_GetLinkCountFromStat(statPtr:PTcl_StatBuf):longint;cdecl;external libtclstub8_6;
function Tcl_GetUserIdFromStat(statPtr:PTcl_StatBuf):longint;cdecl;external libtclstub8_6;
function Tcl_GetGroupIdFromStat(statPtr:PTcl_StatBuf):longint;cdecl;external libtclstub8_6;
function Tcl_GetDeviceTypeFromStat(statPtr:PTcl_StatBuf):longint;cdecl;external libtclstub8_6;
function Tcl_GetAccessTimeFromStat(statPtr:PTcl_StatBuf):TTcl_WideInt;cdecl;external libtclstub8_6;
function Tcl_GetModificationTimeFromStat(statPtr:PTcl_StatBuf):TTcl_WideInt;cdecl;external libtclstub8_6;
function Tcl_GetChangeTimeFromStat(statPtr:PTcl_StatBuf):TTcl_WideInt;cdecl;external libtclstub8_6;
function Tcl_GetSizeFromStat(statPtr:PTcl_StatBuf):TTcl_WideUInt;cdecl;external libtclstub8_6;
function Tcl_GetBlocksFromStat(statPtr:PTcl_StatBuf):TTcl_WideUInt;cdecl;external libtclstub8_6;
function Tcl_GetBlockSizeFromStat(statPtr:PTcl_StatBuf):dword;cdecl;external libtclstub8_6;
function Tcl_SetEnsembleParameterList(interp:PTcl_Interp; token:TTcl_Command; paramList:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetEnsembleParameterList(interp:PTcl_Interp; token:TTcl_Command; paramListPtr:PPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_ParseArgsObjv(interp:PTcl_Interp; argTable:PTcl_ArgvInfo; objcPtr:Plongint; objv:PPTcl_Obj; remObjv:PPPTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_GetErrorLine(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
procedure Tcl_SetErrorLine(interp:PTcl_Interp; lineNum:longint);cdecl;external libtclstub8_6;
procedure Tcl_TransferResult(sourceInterp:PTcl_Interp; code:longint; targetInterp:PTcl_Interp);cdecl;external libtclstub8_6;
function Tcl_InterpActive(interp:PTcl_Interp):longint;cdecl;external libtclstub8_6;
procedure Tcl_BackgroundException(interp:PTcl_Interp; code:longint);cdecl;external libtclstub8_6;
function Tcl_ZlibDeflate(interp:PTcl_Interp; format:longint; data:PTcl_Obj; level:longint; gzipHeaderDictObj:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_ZlibInflate(interp:PTcl_Interp; format:longint; data:PTcl_Obj; buffersize:longint; gzipHeaderDictObj:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_ZlibCRC32(crc:dword; buf:Pbyte; len:longint):dword;cdecl;external libtclstub8_6;
function Tcl_ZlibAdler32(adler:dword; buf:Pbyte; len:longint):dword;cdecl;external libtclstub8_6;
function Tcl_ZlibStreamInit(interp:PTcl_Interp; mode:longint; format:longint; level:longint; dictObj:PTcl_Obj;
           zshandle:PTcl_ZlibStream):longint;cdecl;external libtclstub8_6;
function Tcl_ZlibStreamGetCommandName(zshandle:TTcl_ZlibStream):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_ZlibStreamEof(zshandle:TTcl_ZlibStream):longint;cdecl;external libtclstub8_6;
function Tcl_ZlibStreamChecksum(zshandle:TTcl_ZlibStream):longint;cdecl;external libtclstub8_6;
function Tcl_ZlibStreamPut(zshandle:TTcl_ZlibStream; data:PTcl_Obj; flush:longint):longint;cdecl;external libtclstub8_6;
function Tcl_ZlibStreamGet(zshandle:TTcl_ZlibStream; data:PTcl_Obj; count:longint):longint;cdecl;external libtclstub8_6;
function Tcl_ZlibStreamClose(zshandle:TTcl_ZlibStream):longint;cdecl;external libtclstub8_6;
function Tcl_ZlibStreamReset(zshandle:TTcl_ZlibStream):longint;cdecl;external libtclstub8_6;
procedure Tcl_SetStartupScript(path:PTcl_Obj; encoding:Pchar);cdecl;external libtclstub8_6;
function Tcl_GetStartupScript(encodingPtr:PPchar):PTcl_Obj;cdecl;external libtclstub8_6;
function Tcl_CloseEx(interp:PTcl_Interp; chan:TTcl_Channel; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_NRExprObj(interp:PTcl_Interp; objPtr:PTcl_Obj; resultPtr:PTcl_Obj):longint;cdecl;external libtclstub8_6;
function Tcl_NRSubstObj(interp:PTcl_Interp; objPtr:PTcl_Obj; flags:longint):longint;cdecl;external libtclstub8_6;
function Tcl_LoadFile(interp:PTcl_Interp; pathPtr:PTcl_Obj; symv:PPchar; flags:longint; procPtrs:pointer;
           handlePtr:PTcl_LoadHandle):longint;cdecl;external libtclstub8_6;
function Tcl_FindSymbol(interp:PTcl_Interp; handle:TTcl_LoadHandle; symbol:Pchar):pointer;cdecl;external libtclstub8_6;
function Tcl_FSUnloadFile(interp:PTcl_Interp; handlePtr:TTcl_LoadHandle):longint;cdecl;external libtclstub8_6;
procedure Tcl_ZlibStreamSetCompressionDictionary(zhandle:TTcl_ZlibStream; compressionDictionaryObj:PTcl_Obj);cdecl;external libtclstub8_6;
procedure TclUnusedStubEntry;cdecl;external libtclstub8_6;

// nur privat
//type
//  PTclStubHooks = ^TTclStubHooks;
//  TTclStubHooks = record
//      tclPlatStubs : PTclPlatStubs;
//      tclIntStubs : PTclIntStubs;
//      tclIntPlatStubs : PTclIntPlatStubs;
//    end;
//type
//  PTclStubs = ^TTclStubs;
//  TTclStubs = record
//      magic : longint;
//      hooks : PTclStubHooks;
//      tcl_PkgProvideEx : function (interp:PTcl_Interp; name:Pchar; version:Pchar; clientData:pointer):longint;cdecl;
//      tcl_PkgRequireEx : function (interp:PTcl_Interp; name:Pchar; version:Pchar; exact:longint; clientDataPtr:pointer):Pchar;cdecl;
//      tcl_Panic : procedure (format:Pchar; args:array of const);cdecl;
//      tcl_Alloc : function (size:dword):Pchar;cdecl;
//      tcl_Free : procedure (ptr:Pchar);cdecl;
//      tcl_Realloc : function (ptr:Pchar; size:dword):Pchar;cdecl;
//      tcl_DbCkalloc : function (size:dword; file_:Pchar; line:longint):Pchar;cdecl;
//      tcl_DbCkfree : procedure (ptr:Pchar; file_:Pchar; line:longint);cdecl;
//      tcl_DbCkrealloc : function (ptr:Pchar; size:dword; file_:Pchar; line:longint):Pchar;cdecl;
//      tcl_CreateFileHandler : procedure (fd:longint; mask:longint; proc:PTcl_FileProc; clientData:TClientData);cdecl;
//      reserved9 : procedure ;cdecl;
//      tcl_CreateFileHandler : procedure (fd:longint; mask:longint; proc:PTcl_FileProc; clientData:TClientData);cdecl;
//      tcl_DeleteFileHandler : procedure (fd:longint);cdecl;
//      reserved10 : procedure ;cdecl;
//      tcl_DeleteFileHandler : procedure (fd:longint);cdecl;
//      tcl_SetTimer : procedure (timePtr:PTcl_Time);cdecl;
//      tcl_Sleep : procedure (ms:longint);cdecl;
//      tcl_WaitForEvent : function (timePtr:PTcl_Time):longint;cdecl;
//      tcl_AppendAllObjTypes : function (interp:PTcl_Interp; objPtr:PTcl_Obj):longint;cdecl;
//      tcl_AppendStringsToObj : procedure (objPtr:PTcl_Obj; args:array of const);cdecl;
//      tcl_AppendToObj : procedure (objPtr:PTcl_Obj; bytes:Pchar; length:longint);cdecl;
//      tcl_ConcatObj : function (objc:longint; objv:PPTcl_Obj):PTcl_Obj;cdecl;
//      tcl_ConvertToType : function (interp:PTcl_Interp; objPtr:PTcl_Obj; typePtr:PTcl_ObjType):longint;cdecl;
//      tcl_DbDecrRefCount : procedure (objPtr:PTcl_Obj; file_:Pchar; line:longint);cdecl;
//      tcl_DbIncrRefCount : procedure (objPtr:PTcl_Obj; file_:Pchar; line:longint);cdecl;
//      tcl_DbIsShared : function (objPtr:PTcl_Obj; file_:Pchar; line:longint):longint;cdecl;
//      tcl_DbNewBooleanObj : function (intValue:longint; file_:Pchar; line:longint):PTcl_Obj;cdecl;
//      tcl_DbNewByteArrayObj : function (bytes:Pbyte; length:longint; file_:Pchar; line:longint):PTcl_Obj;cdecl;
//      tcl_DbNewDoubleObj : function (doubleValue:Tdouble; file_:Pchar; line:longint):PTcl_Obj;cdecl;
//      tcl_DbNewListObj : function (objc:longint; objv:PPTcl_Obj; file_:Pchar; line:longint):PTcl_Obj;cdecl;
//      tcl_DbNewLongObj : function (longValue:longint; file_:Pchar; line:longint):PTcl_Obj;cdecl;
//      tcl_DbNewObj : function (file_:Pchar; line:longint):PTcl_Obj;cdecl;
//      tcl_DbNewStringObj : function (bytes:Pchar; length:longint; file_:Pchar; line:longint):PTcl_Obj;cdecl;
//      tcl_DuplicateObj : function (objPtr:PTcl_Obj):PTcl_Obj;cdecl;
//      tclFreeObj : procedure (objPtr:PTcl_Obj);cdecl;
//      tcl_GetBoolean : function (interp:PTcl_Interp; src:Pchar; intPtr:Plongint):longint;cdecl;
//      tcl_GetBooleanFromObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; intPtr:Plongint):longint;cdecl;
//      tcl_GetByteArrayFromObj : function (objPtr:PTcl_Obj; numBytesPtr:Plongint):Pbyte;cdecl;
//      tcl_GetDouble : function (interp:PTcl_Interp; src:Pchar; doublePtr:Pdouble):longint;cdecl;
//      tcl_GetDoubleFromObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; doublePtr:Pdouble):longint;cdecl;
//      tcl_GetIndexFromObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; tablePtr:PPchar; msg:Pchar; flags:longint; 
//                   indexPtr:Plongint):longint;cdecl;
//      tcl_GetInt : function (interp:PTcl_Interp; src:Pchar; intPtr:Plongint):longint;cdecl;
//      tcl_GetIntFromObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; intPtr:Plongint):longint;cdecl;
//      tcl_GetLongFromObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; longPtr:Plongint):longint;cdecl;
//      tcl_GetObjType : function (typeName:Pchar):PTcl_ObjType;cdecl;
//      tcl_GetStringFromObj : function (objPtr:PTcl_Obj; lengthPtr:Plongint):Pchar;cdecl;
//      tcl_InvalidateStringRep : procedure (objPtr:PTcl_Obj);cdecl;
//      tcl_ListObjAppendList : function (interp:PTcl_Interp; listPtr:PTcl_Obj; elemListPtr:PTcl_Obj):longint;cdecl;
//      tcl_ListObjAppendElement : function (interp:PTcl_Interp; listPtr:PTcl_Obj; objPtr:PTcl_Obj):longint;cdecl;
//      tcl_ListObjGetElements : function (interp:PTcl_Interp; listPtr:PTcl_Obj; objcPtr:Plongint; objvPtr:PPPTcl_Obj):longint;cdecl;
//      tcl_ListObjIndex : function (interp:PTcl_Interp; listPtr:PTcl_Obj; index:longint; objPtrPtr:PPTcl_Obj):longint;cdecl;
//      tcl_ListObjLength : function (interp:PTcl_Interp; listPtr:PTcl_Obj; lengthPtr:Plongint):longint;cdecl;
//      tcl_ListObjReplace : function (interp:PTcl_Interp; listPtr:PTcl_Obj; first:longint; count:longint; objc:longint; 
//                   objv:PPTcl_Obj):longint;cdecl;
//      tcl_NewBooleanObj : function (intValue:longint):PTcl_Obj;cdecl;
//      tcl_NewByteArrayObj : function (bytes:Pbyte; numBytes:longint):PTcl_Obj;cdecl;
//      tcl_NewDoubleObj : function (doubleValue:Tdouble):PTcl_Obj;cdecl;
//      tcl_NewIntObj : function (intValue:longint):PTcl_Obj;cdecl;
//      tcl_NewListObj : function (objc:longint; objv:PPTcl_Obj):PTcl_Obj;cdecl;
//      tcl_NewLongObj : function (longValue:longint):PTcl_Obj;cdecl;
//      tcl_NewObj : function :PTcl_Obj;cdecl;
//      tcl_NewStringObj : function (bytes:Pchar; length:longint):PTcl_Obj;cdecl;
//      tcl_SetBooleanObj : procedure (objPtr:PTcl_Obj; intValue:longint);cdecl;
//      tcl_SetByteArrayLength : function (objPtr:PTcl_Obj; numBytes:longint):Pbyte;cdecl;
//      tcl_SetByteArrayObj : procedure (objPtr:PTcl_Obj; bytes:Pbyte; numBytes:longint);cdecl;
//      tcl_SetDoubleObj : procedure (objPtr:PTcl_Obj; doubleValue:Tdouble);cdecl;
//      tcl_SetIntObj : procedure (objPtr:PTcl_Obj; intValue:longint);cdecl;
//      tcl_SetListObj : procedure (objPtr:PTcl_Obj; objc:longint; objv:PPTcl_Obj);cdecl;
//      tcl_SetLongObj : procedure (objPtr:PTcl_Obj; longValue:longint);cdecl;
//      tcl_SetObjLength : procedure (objPtr:PTcl_Obj; length:longint);cdecl;
//      tcl_SetStringObj : procedure (objPtr:PTcl_Obj; bytes:Pchar; length:longint);cdecl;
//      tcl_AddErrorInfo : procedure (interp:PTcl_Interp; message:Pchar);cdecl;
//      tcl_AddObjErrorInfo : procedure (interp:PTcl_Interp; message:Pchar; length:longint);cdecl;
//      tcl_AllowExceptions : procedure (interp:PTcl_Interp);cdecl;
//      tcl_AppendElement : procedure (interp:PTcl_Interp; element:Pchar);cdecl;
//      tcl_AppendResult : procedure (interp:PTcl_Interp; args:array of const);cdecl;
//      tcl_AsyncCreate : function (proc:PTcl_AsyncProc; clientData:TClientData):TTcl_AsyncHandler;cdecl;
//      tcl_AsyncDelete : procedure (async:TTcl_AsyncHandler);cdecl;
//      tcl_AsyncInvoke : function (interp:PTcl_Interp; code:longint):longint;cdecl;
//      tcl_AsyncMark : procedure (async:TTcl_AsyncHandler);cdecl;
//      tcl_AsyncReady : function :longint;cdecl;
//      tcl_BackgroundError : procedure (interp:PTcl_Interp);cdecl;
//      tcl_Backslash : function (src:Pchar; readPtr:Plongint):char;cdecl;
//      tcl_BadChannelOption : function (interp:PTcl_Interp; optionName:Pchar; optionList:Pchar):longint;cdecl;
//      tcl_CallWhenDeleted : procedure (interp:PTcl_Interp; proc:PTcl_InterpDeleteProc; clientData:TClientData);cdecl;
//      tcl_CancelIdleCall : procedure (idleProc:PTcl_IdleProc; clientData:TClientData);cdecl;
//      tcl_Close : function (interp:PTcl_Interp; chan:TTcl_Channel):longint;cdecl;
//      tcl_CommandComplete : function (cmd:Pchar):longint;cdecl;
//      tcl_Concat : function (argc:longint; argv:PPchar):Pchar;cdecl;
//      tcl_ConvertElement : function (src:Pchar; dst:Pchar; flags:longint):longint;cdecl;
//      tcl_ConvertCountedElement : function (src:Pchar; length:longint; dst:Pchar; flags:longint):longint;cdecl;
//      tcl_CreateAlias : function (childInterp:PTcl_Interp; childCmd:Pchar; target:PTcl_Interp; targetCmd:Pchar; argc:longint; 
//                   argv:PPchar):longint;cdecl;
//      tcl_CreateAliasObj : function (childInterp:PTcl_Interp; childCmd:Pchar; target:PTcl_Interp; targetCmd:Pchar; objc:longint; 
//                   objv:PPTcl_Obj):longint;cdecl;
//      tcl_CreateChannel : function (typePtr:PTcl_ChannelType; chanName:Pchar; instanceData:TClientData; mask:longint):TTcl_Channel;cdecl;
//      tcl_CreateChannelHandler : procedure (chan:TTcl_Channel; mask:longint; proc:PTcl_ChannelProc; clientData:TClientData);cdecl;
//      tcl_CreateCloseHandler : procedure (chan:TTcl_Channel; proc:PTcl_CloseProc; clientData:TClientData);cdecl;
//      tcl_CreateCommand : function (interp:PTcl_Interp; cmdName:Pchar; proc:PTcl_CmdProc; clientData:TClientData; deleteProc:PTcl_CmdDeleteProc):TTcl_Command;cdecl;
//      tcl_CreateEventSource : procedure (setupProc:PTcl_EventSetupProc; checkProc:PTcl_EventCheckProc; clientData:TClientData);cdecl;
//      tcl_CreateExitHandler : procedure (proc:PTcl_ExitProc; clientData:TClientData);cdecl;
//      tcl_CreateInterp : function :PTcl_Interp;cdecl;
//      tcl_CreateMathFunc : procedure (interp:PTcl_Interp; name:Pchar; numArgs:longint; argTypes:PTcl_ValueType; proc:PTcl_MathProc; 
//                    clientData:TClientData);cdecl;
//      tcl_CreateObjCommand : function (interp:PTcl_Interp; cmdName:Pchar; proc:PTcl_ObjCmdProc; clientData:TClientData; deleteProc:PTcl_CmdDeleteProc):TTcl_Command;cdecl;
//      tcl_CreateSlave : function (interp:PTcl_Interp; name:Pchar; isSafe:longint):PTcl_Interp;cdecl;
//      tcl_CreateTimerHandler : function (milliseconds:longint; proc:PTcl_TimerProc; clientData:TClientData):TTcl_TimerToken;cdecl;
//      tcl_CreateTrace : function (interp:PTcl_Interp; level:longint; proc:PTcl_CmdTraceProc; clientData:TClientData):TTcl_Trace;cdecl;
//      tcl_DeleteAssocData : procedure (interp:PTcl_Interp; name:Pchar);cdecl;
//      tcl_DeleteChannelHandler : procedure (chan:TTcl_Channel; proc:PTcl_ChannelProc; clientData:TClientData);cdecl;
//      tcl_DeleteCloseHandler : procedure (chan:TTcl_Channel; proc:PTcl_CloseProc; clientData:TClientData);cdecl;
//      tcl_DeleteCommand : function (interp:PTcl_Interp; cmdName:Pchar):longint;cdecl;
//      tcl_DeleteCommandFromToken : function (interp:PTcl_Interp; command:TTcl_Command):longint;cdecl;
//      tcl_DeleteEvents : procedure (proc:PTcl_EventDeleteProc; clientData:TClientData);cdecl;
//      tcl_DeleteEventSource : procedure (setupProc:PTcl_EventSetupProc; checkProc:PTcl_EventCheckProc; clientData:TClientData);cdecl;
//      tcl_DeleteExitHandler : procedure (proc:PTcl_ExitProc; clientData:TClientData);cdecl;
//      tcl_DeleteHashEntry : procedure (entryPtr:PTcl_HashEntry);cdecl;
//      tcl_DeleteHashTable : procedure (tablePtr:PTcl_HashTable);cdecl;
//      tcl_DeleteInterp : procedure (interp:PTcl_Interp);cdecl;
//      tcl_DetachPids : procedure (numPids:longint; pidPtr:PTcl_Pid);cdecl;
//      tcl_DeleteTimerHandler : procedure (token:TTcl_TimerToken);cdecl;
//      tcl_DeleteTrace : procedure (interp:PTcl_Interp; trace:TTcl_Trace);cdecl;
//      tcl_DontCallWhenDeleted : procedure (interp:PTcl_Interp; proc:PTcl_InterpDeleteProc; clientData:TClientData);cdecl;
//      tcl_DoOneEvent : function (flags:longint):longint;cdecl;
//      tcl_DoWhenIdle : procedure (proc:PTcl_IdleProc; clientData:TClientData);cdecl;
//      tcl_DStringAppend : function (dsPtr:PTcl_DString; bytes:Pchar; length:longint):Pchar;cdecl;
//      tcl_DStringAppendElement : function (dsPtr:PTcl_DString; element:Pchar):Pchar;cdecl;
//      tcl_DStringEndSublist : procedure (dsPtr:PTcl_DString);cdecl;
//      tcl_DStringFree : procedure (dsPtr:PTcl_DString);cdecl;
//      tcl_DStringGetResult : procedure (interp:PTcl_Interp; dsPtr:PTcl_DString);cdecl;
//      tcl_DStringInit : procedure (dsPtr:PTcl_DString);cdecl;
//      tcl_DStringResult : procedure (interp:PTcl_Interp; dsPtr:PTcl_DString);cdecl;
//      tcl_DStringSetLength : procedure (dsPtr:PTcl_DString; length:longint);cdecl;
//      tcl_DStringStartSublist : procedure (dsPtr:PTcl_DString);cdecl;
//      tcl_Eof : function (chan:TTcl_Channel):longint;cdecl;
//      tcl_ErrnoId : function :Pchar;cdecl;
//      tcl_ErrnoMsg : function (err:longint):Pchar;cdecl;
//      tcl_Eval : function (interp:PTcl_Interp; script:Pchar):longint;cdecl;
//      tcl_EvalFile : function (interp:PTcl_Interp; fileName:Pchar):longint;cdecl;
//      tcl_EvalObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj):longint;cdecl;
//      tcl_EventuallyFree : procedure (clientData:TClientData; freeProc:PTcl_FreeProc);cdecl;
//      tcl_Exit : procedure (status:longint);cdecl;
//      tcl_ExposeCommand : function (interp:PTcl_Interp; hiddenCmdToken:Pchar; cmdName:Pchar):longint;cdecl;
//      tcl_ExprBoolean : function (interp:PTcl_Interp; expr:Pchar; ptr:Plongint):longint;cdecl;
//      tcl_ExprBooleanObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; ptr:Plongint):longint;cdecl;
//      tcl_ExprDouble : function (interp:PTcl_Interp; expr:Pchar; ptr:Pdouble):longint;cdecl;
//      tcl_ExprDoubleObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; ptr:Pdouble):longint;cdecl;
//      tcl_ExprLong : function (interp:PTcl_Interp; expr:Pchar; ptr:Plongint):longint;cdecl;
//      tcl_ExprLongObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; ptr:Plongint):longint;cdecl;
//      tcl_ExprObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; resultPtrPtr:PPTcl_Obj):longint;cdecl;
//      tcl_ExprString : function (interp:PTcl_Interp; expr:Pchar):longint;cdecl;
//      tcl_Finalize : procedure ;cdecl;
//      tcl_FindExecutable : procedure (argv0:Pchar);cdecl;
//      tcl_FirstHashEntry : function (tablePtr:PTcl_HashTable; searchPtr:PTcl_HashSearch):PTcl_HashEntry;cdecl;
//      tcl_Flush : function (chan:TTcl_Channel):longint;cdecl;
//      tcl_FreeResult : procedure (interp:PTcl_Interp);cdecl;
//      tcl_GetAlias : function (interp:PTcl_Interp; childCmd:Pchar; targetInterpPtr:PPTcl_Interp; targetCmdPtr:PPchar; argcPtr:Plongint; 
//                   argvPtr:PPPchar):longint;cdecl;
//      tcl_GetAliasObj : function (interp:PTcl_Interp; childCmd:Pchar; targetInterpPtr:PPTcl_Interp; targetCmdPtr:PPchar; objcPtr:Plongint; 
//                   objv:PPPTcl_Obj):longint;cdecl;
//      tcl_GetAssocData : function (interp:PTcl_Interp; name:Pchar; procPtr:PPTcl_InterpDeleteProc):TClientData;cdecl;
//      tcl_GetChannel : function (interp:PTcl_Interp; chanName:Pchar; modePtr:Plongint):TTcl_Channel;cdecl;
//      tcl_GetChannelBufferSize : function (chan:TTcl_Channel):longint;cdecl;
//      tcl_GetChannelHandle : function (chan:TTcl_Channel; direction:longint; handlePtr:PClientData):longint;cdecl;
//      tcl_GetChannelInstanceData : function (chan:TTcl_Channel):TClientData;cdecl;
//      tcl_GetChannelMode : function (chan:TTcl_Channel):longint;cdecl;
//      tcl_GetChannelName : function (chan:TTcl_Channel):Pchar;cdecl;
//      tcl_GetChannelOption : function (interp:PTcl_Interp; chan:TTcl_Channel; optionName:Pchar; dsPtr:PTcl_DString):longint;cdecl;
//      tcl_GetChannelType : function (chan:TTcl_Channel):PTcl_ChannelType;cdecl;
//      tcl_GetCommandInfo : function (interp:PTcl_Interp; cmdName:Pchar; infoPtr:PTcl_CmdInfo):longint;cdecl;
//      tcl_GetCommandName : function (interp:PTcl_Interp; command:TTcl_Command):Pchar;cdecl;
//      tcl_GetErrno : function :longint;cdecl;
//      tcl_GetHostName : function :Pchar;cdecl;
//      tcl_GetInterpPath : function (interp:PTcl_Interp; childInterp:PTcl_Interp):longint;cdecl;
//      tcl_GetMaster : function (interp:PTcl_Interp):PTcl_Interp;cdecl;
//      tcl_GetNameOfExecutable : function :Pchar;cdecl;
//      tcl_GetObjResult : function (interp:PTcl_Interp):PTcl_Obj;cdecl;
//      tcl_GetOpenFile : function (interp:PTcl_Interp; chanID:Pchar; forWriting:longint; checkUsage:longint; filePtr:PClientData):longint;cdecl;
//      reserved167 : procedure ;cdecl;
//      tcl_GetOpenFile : function (interp:PTcl_Interp; chanID:Pchar; forWriting:longint; checkUsage:longint; filePtr:PClientData):longint;cdecl;
//      tcl_GetPathType : function (path:Pchar):TTcl_PathType;cdecl;
//      tcl_Gets : function (chan:TTcl_Channel; dsPtr:PTcl_DString):longint;cdecl;
//      tcl_GetsObj : function (chan:TTcl_Channel; objPtr:PTcl_Obj):longint;cdecl;
//      tcl_GetServiceMode : function :longint;cdecl;
//      tcl_GetSlave : function (interp:PTcl_Interp; name:Pchar):PTcl_Interp;cdecl;
//      tcl_GetStdChannel : function (_type:longint):TTcl_Channel;cdecl;
//      tcl_GetStringResult : function (interp:PTcl_Interp):Pchar;cdecl;
//      tcl_GetVar : function (interp:PTcl_Interp; varName:Pchar; flags:longint):Pchar;cdecl;
//      tcl_GetVar2 : function (interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint):Pchar;cdecl;
//      tcl_GlobalEval : function (interp:PTcl_Interp; command:Pchar):longint;cdecl;
//      tcl_GlobalEvalObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj):longint;cdecl;
//      tcl_HideCommand : function (interp:PTcl_Interp; cmdName:Pchar; hiddenCmdToken:Pchar):longint;cdecl;
//      tcl_Init : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_InitHashTable : procedure (tablePtr:PTcl_HashTable; keyType:longint);cdecl;
//      tcl_InputBlocked : function (chan:TTcl_Channel):longint;cdecl;
//      tcl_InputBuffered : function (chan:TTcl_Channel):longint;cdecl;
//      tcl_InterpDeleted : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_IsSafe : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_JoinPath : function (argc:longint; argv:PPchar; resultPtr:PTcl_DString):Pchar;cdecl;
//      tcl_LinkVar : function (interp:PTcl_Interp; varName:Pchar; addr:Pchar; _type:longint):longint;cdecl;
//      reserved188 : procedure ;cdecl;
//      tcl_MakeFileChannel : function (handle:TClientData; mode:longint):TTcl_Channel;cdecl;
//      tcl_MakeSafe : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_MakeTcpClientChannel : function (tcpSocket:TClientData):TTcl_Channel;cdecl;
//      tcl_Merge : function (argc:longint; argv:PPchar):Pchar;cdecl;
//      tcl_NextHashEntry : function (searchPtr:PTcl_HashSearch):PTcl_HashEntry;cdecl;
//      tcl_NotifyChannel : procedure (channel:TTcl_Channel; mask:longint);cdecl;
//      tcl_ObjGetVar2 : function (interp:PTcl_Interp; part1Ptr:PTcl_Obj; part2Ptr:PTcl_Obj; flags:longint):PTcl_Obj;cdecl;
//      tcl_ObjSetVar2 : function (interp:PTcl_Interp; part1Ptr:PTcl_Obj; part2Ptr:PTcl_Obj; newValuePtr:PTcl_Obj; flags:longint):PTcl_Obj;cdecl;
//      tcl_OpenCommandChannel : function (interp:PTcl_Interp; argc:longint; argv:PPchar; flags:longint):TTcl_Channel;cdecl;
//      tcl_OpenFileChannel : function (interp:PTcl_Interp; fileName:Pchar; modeString:Pchar; permissions:longint):TTcl_Channel;cdecl;
//      tcl_OpenTcpClient : function (interp:PTcl_Interp; port:longint; address:Pchar; myaddr:Pchar; myport:longint; 
//                   flags:longint):TTcl_Channel;cdecl;
//      tcl_OpenTcpServer : function (interp:PTcl_Interp; port:longint; host:Pchar; acceptProc:PTcl_TcpAcceptProc; callbackData:TClientData):TTcl_Channel;cdecl;
//      tcl_Preserve : procedure (data:TClientData);cdecl;
//      tcl_PrintDouble : procedure (interp:PTcl_Interp; value:Tdouble; dst:Pchar);cdecl;
//      tcl_PutEnv : function (assignment:Pchar):longint;cdecl;
//      tcl_PosixError : function (interp:PTcl_Interp):Pchar;cdecl;
//      tcl_QueueEvent : procedure (evPtr:PTcl_Event; position:TTcl_QueuePosition);cdecl;
//      tcl_Read : function (chan:TTcl_Channel; bufPtr:Pchar; toRead:longint):longint;cdecl;
//      tcl_ReapDetachedProcs : procedure ;cdecl;
//      tcl_RecordAndEval : function (interp:PTcl_Interp; cmd:Pchar; flags:longint):longint;cdecl;
//      tcl_RecordAndEvalObj : function (interp:PTcl_Interp; cmdPtr:PTcl_Obj; flags:longint):longint;cdecl;
//      tcl_RegisterChannel : procedure (interp:PTcl_Interp; chan:TTcl_Channel);cdecl;
//      tcl_RegisterObjType : procedure (typePtr:PTcl_ObjType);cdecl;
//      tcl_RegExpCompile : function (interp:PTcl_Interp; pattern:Pchar):TTcl_RegExp;cdecl;
//      tcl_RegExpExec : function (interp:PTcl_Interp; regexp:TTcl_RegExp; text:Pchar; start:Pchar):longint;cdecl;
//      tcl_RegExpMatch : function (interp:PTcl_Interp; text:Pchar; pattern:Pchar):longint;cdecl;
//      tcl_RegExpRange : procedure (regexp:TTcl_RegExp; index:longint; startPtr:PPchar; endPtr:PPchar);cdecl;
//      tcl_Release : procedure (clientData:TClientData);cdecl;
//      tcl_ResetResult : procedure (interp:PTcl_Interp);cdecl;
//      tcl_ScanElement : function (src:Pchar; flagPtr:Plongint):longint;cdecl;
//      tcl_ScanCountedElement : function (src:Pchar; length:longint; flagPtr:Plongint):longint;cdecl;
//      tcl_SeekOld : function (chan:TTcl_Channel; offset:longint; mode:longint):longint;cdecl;
//      tcl_ServiceAll : function :longint;cdecl;
//      tcl_ServiceEvent : function (flags:longint):longint;cdecl;
//      tcl_SetAssocData : procedure (interp:PTcl_Interp; name:Pchar; proc:PTcl_InterpDeleteProc; clientData:TClientData);cdecl;
//      tcl_SetChannelBufferSize : procedure (chan:TTcl_Channel; sz:longint);cdecl;
//      tcl_SetChannelOption : function (interp:PTcl_Interp; chan:TTcl_Channel; optionName:Pchar; newValue:Pchar):longint;cdecl;
//      tcl_SetCommandInfo : function (interp:PTcl_Interp; cmdName:Pchar; infoPtr:PTcl_CmdInfo):longint;cdecl;
//      tcl_SetErrno : procedure (err:longint);cdecl;
//      tcl_SetErrorCode : procedure (interp:PTcl_Interp; args:array of const);cdecl;
//      tcl_SetMaxBlockTime : procedure (timePtr:PTcl_Time);cdecl;
//      tcl_SetPanicProc : procedure (panicProc:PTcl_PanicProc);cdecl;
//      tcl_SetRecursionLimit : function (interp:PTcl_Interp; depth:longint):longint;cdecl;
//      tcl_SetResult : procedure (interp:PTcl_Interp; result:Pchar; freeProc:PTcl_FreeProc);cdecl;
//      tcl_SetServiceMode : function (mode:longint):longint;cdecl;
//      tcl_SetObjErrorCode : procedure (interp:PTcl_Interp; errorObjPtr:PTcl_Obj);cdecl;
//      tcl_SetObjResult : procedure (interp:PTcl_Interp; resultObjPtr:PTcl_Obj);cdecl;
//      tcl_SetStdChannel : procedure (channel:TTcl_Channel; _type:longint);cdecl;
//      tcl_SetVar : function (interp:PTcl_Interp; varName:Pchar; newValue:Pchar; flags:longint):Pchar;cdecl;
//      tcl_SetVar2 : function (interp:PTcl_Interp; part1:Pchar; part2:Pchar; newValue:Pchar; flags:longint):Pchar;cdecl;
//      tcl_SignalId : function (sig:longint):Pchar;cdecl;
//      tcl_SignalMsg : function (sig:longint):Pchar;cdecl;
//      tcl_SourceRCFile : procedure (interp:PTcl_Interp);cdecl;
//      tcl_SplitList : function (interp:PTcl_Interp; listStr:Pchar; argcPtr:Plongint; argvPtr:PPPchar):longint;cdecl;
//      tcl_SplitPath : procedure (path:Pchar; argcPtr:Plongint; argvPtr:PPPchar);cdecl;
//      tcl_StaticPackage : procedure (interp:PTcl_Interp; prefix:Pchar; initProc:PTcl_PackageInitProc; safeInitProc:PTcl_PackageInitProc);cdecl;
//      tcl_StringMatch : function (str:Pchar; pattern:Pchar):longint;cdecl;
//      tcl_TellOld : function (chan:TTcl_Channel):longint;cdecl;
//      tcl_TraceVar : function (interp:PTcl_Interp; varName:Pchar; flags:longint; proc:PTcl_VarTraceProc; clientData:TClientData):longint;cdecl;
//      tcl_TraceVar2 : function (interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint; proc:PTcl_VarTraceProc; 
//                   clientData:TClientData):longint;cdecl;
//      tcl_TranslateFileName : function (interp:PTcl_Interp; name:Pchar; bufferPtr:PTcl_DString):Pchar;cdecl;
//      tcl_Ungets : function (chan:TTcl_Channel; str:Pchar; len:longint; atHead:longint):longint;cdecl;
//      tcl_UnlinkVar : procedure (interp:PTcl_Interp; varName:Pchar);cdecl;
//      tcl_UnregisterChannel : function (interp:PTcl_Interp; chan:TTcl_Channel):longint;cdecl;
//      tcl_UnsetVar : function (interp:PTcl_Interp; varName:Pchar; flags:longint):longint;cdecl;
//      tcl_UnsetVar2 : function (interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint):longint;cdecl;
//      tcl_UntraceVar : procedure (interp:PTcl_Interp; varName:Pchar; flags:longint; proc:PTcl_VarTraceProc; clientData:TClientData);cdecl;
//      tcl_UntraceVar2 : procedure (interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint; proc:PTcl_VarTraceProc; 
//                    clientData:TClientData);cdecl;
//      tcl_UpdateLinkedVar : procedure (interp:PTcl_Interp; varName:Pchar);cdecl;
//      tcl_UpVar : function (interp:PTcl_Interp; frameName:Pchar; varName:Pchar; localName:Pchar; flags:longint):longint;cdecl;
//      tcl_UpVar2 : function (interp:PTcl_Interp; frameName:Pchar; part1:Pchar; part2:Pchar; localName:Pchar; 
//                   flags:longint):longint;cdecl;
//      tcl_VarEval : function (interp:PTcl_Interp; args:array of const):longint;cdecl;
//      tcl_VarTraceInfo : function (interp:PTcl_Interp; varName:Pchar; flags:longint; procPtr:PTcl_VarTraceProc; prevClientData:TClientData):TClientData;cdecl;
//      tcl_VarTraceInfo2 : function (interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint; procPtr:PTcl_VarTraceProc; 
//                   prevClientData:TClientData):TClientData;cdecl;
//      tcl_Write : function (chan:TTcl_Channel; s:Pchar; slen:longint):longint;cdecl;
//      tcl_WrongNumArgs : procedure (interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj; message:Pchar);cdecl;
//      tcl_DumpActiveMemory : function (fileName:Pchar):longint;cdecl;
//      tcl_ValidateAllMemory : procedure (file_:Pchar; line:longint);cdecl;
//      tcl_AppendResultVA : procedure (interp:PTcl_Interp; argList:Tva_list);cdecl;
//      tcl_AppendStringsToObjVA : procedure (objPtr:PTcl_Obj; argList:Tva_list);cdecl;
//      tcl_HashStats : function (tablePtr:PTcl_HashTable):Pchar;cdecl;
//      tcl_ParseVar : function (interp:PTcl_Interp; start:Pchar; termPtr:PPchar):Pchar;cdecl;
//      tcl_PkgPresent : function (interp:PTcl_Interp; name:Pchar; version:Pchar; exact:longint):Pchar;cdecl;
//      tcl_PkgPresentEx : function (interp:PTcl_Interp; name:Pchar; version:Pchar; exact:longint; clientDataPtr:pointer):Pchar;cdecl;
//      tcl_PkgProvide : function (interp:PTcl_Interp; name:Pchar; version:Pchar):longint;cdecl;
//      tcl_PkgRequire : function (interp:PTcl_Interp; name:Pchar; version:Pchar; exact:longint):Pchar;cdecl;
//      tcl_SetErrorCodeVA : procedure (interp:PTcl_Interp; argList:Tva_list);cdecl;
//      tcl_VarEvalVA : function (interp:PTcl_Interp; argList:Tva_list):longint;cdecl;
//      tcl_WaitPid : function (pid:TTcl_Pid; statPtr:Plongint; options:longint):TTcl_Pid;cdecl;
//      tcl_PanicVA : procedure (format:Pchar; argList:Tva_list);cdecl;
//      tcl_GetVersion : procedure (major:Plongint; minor:Plongint; patchLevel:Plongint; _type:Plongint);cdecl;
//      tcl_InitMemory : procedure (interp:PTcl_Interp);cdecl;
//      tcl_StackChannel : function (interp:PTcl_Interp; typePtr:PTcl_ChannelType; instanceData:TClientData; mask:longint; prevChan:TTcl_Channel):TTcl_Channel;cdecl;
//      tcl_UnstackChannel : function (interp:PTcl_Interp; chan:TTcl_Channel):longint;cdecl;
//      tcl_GetStackedChannel : function (chan:TTcl_Channel):TTcl_Channel;cdecl;
//      tcl_SetMainLoop : procedure (proc:PTcl_MainLoopProc);cdecl;
//      reserved285 : procedure ;cdecl;
//      tcl_AppendObjToObj : procedure (objPtr:PTcl_Obj; appendObjPtr:PTcl_Obj);cdecl;
//      tcl_CreateEncoding : function (typePtr:PTcl_EncodingType):TTcl_Encoding;cdecl;
//      tcl_CreateThreadExitHandler : procedure (proc:PTcl_ExitProc; clientData:TClientData);cdecl;
//      tcl_DeleteThreadExitHandler : procedure (proc:PTcl_ExitProc; clientData:TClientData);cdecl;
//      tcl_DiscardResult : procedure (statePtr:PTcl_SavedResult);cdecl;
//      tcl_EvalEx : function (interp:PTcl_Interp; script:Pchar; numBytes:longint; flags:longint):longint;cdecl;
//      tcl_EvalObjv : function (interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj; flags:longint):longint;cdecl;
//      tcl_EvalObjEx : function (interp:PTcl_Interp; objPtr:PTcl_Obj; flags:longint):longint;cdecl;
//      tcl_ExitThread : procedure (status:longint);cdecl;
//      tcl_externalToUtf : function (interp:PTcl_Interp; encoding:TTcl_Encoding; src:Pchar; srcLen:longint; flags:longint; 
//                   statePtr:PTcl_EncodingState; dst:Pchar; dstLen:longint; srcReadPtr:Plongint; dstWrotePtr:Plongint; 
//                   dstCharsPtr:Plongint):longint;cdecl;
//      tcl_externalToUtfDString : function (encoding:TTcl_Encoding; src:Pchar; srcLen:longint; dsPtr:PTcl_DString):Pchar;cdecl;
//      tcl_FinalizeThread : procedure ;cdecl;
//      tcl_FinalizeNotifier : procedure (clientData:TClientData);cdecl;
//      tcl_FreeEncoding : procedure (encoding:TTcl_Encoding);cdecl;
//      tcl_GetCurrentThread : function :TTcl_ThreadId;cdecl;
//      tcl_GetEncoding : function (interp:PTcl_Interp; name:Pchar):TTcl_Encoding;cdecl;
//      tcl_GetEncodingName : function (encoding:TTcl_Encoding):Pchar;cdecl;
//      tcl_GetEncodingNames : procedure (interp:PTcl_Interp);cdecl;
//      tcl_GetIndexFromObjStruct : function (interp:PTcl_Interp; objPtr:PTcl_Obj; tablePtr:pointer; offset:longint; msg:Pchar; 
//                   flags:longint; indexPtr:Plongint):longint;cdecl;
//      tcl_GetThreadData : function (keyPtr:PTcl_ThreadDataKey; size:longint):pointer;cdecl;
//      tcl_GetVar2Ex : function (interp:PTcl_Interp; part1:Pchar; part2:Pchar; flags:longint):PTcl_Obj;cdecl;
//      tcl_InitNotifier : function :TClientData;cdecl;
//      tcl_MutexLock : procedure (mutexPtr:PTcl_Mutex);cdecl;
//      tcl_MutexUnlock : procedure (mutexPtr:PTcl_Mutex);cdecl;
//      tcl_ConditionNotify : procedure (condPtr:PTcl_Condition);cdecl;
//      tcl_ConditionWait : procedure (condPtr:PTcl_Condition; mutexPtr:PTcl_Mutex; timePtr:PTcl_Time);cdecl;
//      tcl_NumUtfChars : function (src:Pchar; length:longint):longint;cdecl;
//      tcl_ReadChars : function (channel:TTcl_Channel; objPtr:PTcl_Obj; charsToRead:longint; appendFlag:longint):longint;cdecl;
//      tcl_RestoreResult : procedure (interp:PTcl_Interp; statePtr:PTcl_SavedResult);cdecl;
//      tcl_SaveResult : procedure (interp:PTcl_Interp; statePtr:PTcl_SavedResult);cdecl;
//      tcl_SetSystemEncoding : function (interp:PTcl_Interp; name:Pchar):longint;cdecl;
//      tcl_SetVar2Ex : function (interp:PTcl_Interp; part1:Pchar; part2:Pchar; newValuePtr:PTcl_Obj; flags:longint):PTcl_Obj;cdecl;
//      tcl_ThreadAlert : procedure (threadId:TTcl_ThreadId);cdecl;
//      tcl_ThreadQueueEvent : procedure (threadId:TTcl_ThreadId; evPtr:PTcl_Event; position:TTcl_QueuePosition);cdecl;
//      tcl_UniCharAtIndex : function (src:Pchar; index:longint):TTcl_UniChar;cdecl;
//      tcl_UniCharToLower : function (ch:longint):TTcl_UniChar;cdecl;
//      tcl_UniCharToTitle : function (ch:longint):TTcl_UniChar;cdecl;
//      tcl_UniCharToUpper : function (ch:longint):TTcl_UniChar;cdecl;
//      tcl_UniCharToUtf : function (ch:longint; buf:Pchar):longint;cdecl;
//      tcl_UtfAtIndex : function (src:Pchar; index:longint):Pchar;cdecl;
//      tcl_UtfCharComplete : function (src:Pchar; length:longint):longint;cdecl;
//      tcl_UtfBackslash : function (src:Pchar; readPtr:Plongint; dst:Pchar):longint;cdecl;
//      tcl_UtfFindFirst : function (src:Pchar; ch:longint):Pchar;cdecl;
//      tcl_UtfFindLast : function (src:Pchar; ch:longint):Pchar;cdecl;
//      tcl_UtfNext : function (src:Pchar):Pchar;cdecl;
//      tcl_UtfPrev : function (src:Pchar; start:Pchar):Pchar;cdecl;
//      tcl_UtfToexternal : function (interp:PTcl_Interp; encoding:TTcl_Encoding; src:Pchar; srcLen:longint; flags:longint; 
//                   statePtr:PTcl_EncodingState; dst:Pchar; dstLen:longint; srcReadPtr:Plongint; dstWrotePtr:Plongint; 
//                   dstCharsPtr:Plongint):longint;cdecl;
//      tcl_UtfToexternalDString : function (encoding:TTcl_Encoding; src:Pchar; srcLen:longint; dsPtr:PTcl_DString):Pchar;cdecl;
//      tcl_UtfToLower : function (src:Pchar):longint;cdecl;
//      tcl_UtfToTitle : function (src:Pchar):longint;cdecl;
//      tcl_UtfToUniChar : function (src:Pchar; chPtr:PTcl_UniChar):longint;cdecl;
//      tcl_UtfToUpper : function (src:Pchar):longint;cdecl;
//      tcl_WriteChars : function (chan:TTcl_Channel; src:Pchar; srcLen:longint):longint;cdecl;
//      tcl_WriteObj : function (chan:TTcl_Channel; objPtr:PTcl_Obj):longint;cdecl;
//      tcl_GetString : function (objPtr:PTcl_Obj):Pchar;cdecl;
//      tcl_GetDefaultEncodingDir : function :Pchar;cdecl;
//      tcl_SetDefaultEncodingDir : procedure (path:Pchar);cdecl;
//      tcl_AlertNotifier : procedure (clientData:TClientData);cdecl;
//      tcl_ServiceModeHook : procedure (mode:longint);cdecl;
//      tcl_UniCharIsAlnum : function (ch:longint):longint;cdecl;
//      tcl_UniCharIsAlpha : function (ch:longint):longint;cdecl;
//      tcl_UniCharIsDigit : function (ch:longint):longint;cdecl;
//      tcl_UniCharIsLower : function (ch:longint):longint;cdecl;
//      tcl_UniCharIsSpace : function (ch:longint):longint;cdecl;
//      tcl_UniCharIsUpper : function (ch:longint):longint;cdecl;
//      tcl_UniCharIsWordChar : function (ch:longint):longint;cdecl;
//      tcl_UniCharLen : function (uniStr:PTcl_UniChar):longint;cdecl;
//      tcl_UniCharNcmp : function (ucs:PTcl_UniChar; uct:PTcl_UniChar; numChars:dword):longint;cdecl;
//      tcl_UniCharToUtfDString : function (uniStr:PTcl_UniChar; uniLength:longint; dsPtr:PTcl_DString):Pchar;cdecl;
//      tcl_UtfToUniCharDString : function (src:Pchar; length:longint; dsPtr:PTcl_DString):PTcl_UniChar;cdecl;
//      tcl_GetRegExpFromObj : function (interp:PTcl_Interp; patObj:PTcl_Obj; flags:longint):TTcl_RegExp;cdecl;
//      tcl_EvalTokens : function (interp:PTcl_Interp; tokenPtr:PTcl_Token; count:longint):PTcl_Obj;cdecl;
//      tcl_FreeParse : procedure (parsePtr:PTcl_Parse);cdecl;
//      tcl_LogCommandInfo : procedure (interp:PTcl_Interp; script:Pchar; command:Pchar; length:longint);cdecl;
//      tcl_ParseBraces : function (interp:PTcl_Interp; start:Pchar; numBytes:longint; parsePtr:PTcl_Parse; append:longint; 
//                   termPtr:PPchar):longint;cdecl;
//      tcl_ParseCommand : function (interp:PTcl_Interp; start:Pchar; numBytes:longint; nested:longint; parsePtr:PTcl_Parse):longint;cdecl;
//      tcl_ParseExpr : function (interp:PTcl_Interp; start:Pchar; numBytes:longint; parsePtr:PTcl_Parse):longint;cdecl;
//      tcl_ParseQuotedString : function (interp:PTcl_Interp; start:Pchar; numBytes:longint; parsePtr:PTcl_Parse; append:longint; 
//                   termPtr:PPchar):longint;cdecl;
//      tcl_ParseVarName : function (interp:PTcl_Interp; start:Pchar; numBytes:longint; parsePtr:PTcl_Parse; append:longint):longint;cdecl;
//      tcl_GetCwd : function (interp:PTcl_Interp; cwdPtr:PTcl_DString):Pchar;cdecl;
//      tcl_Chdir : function (dirName:Pchar):longint;cdecl;
//      tcl_Access : function (path:Pchar; mode:longint):longint;cdecl;
//      tcl_Stat : function (path:Pchar; bufPtr:Pstat):longint;cdecl;
//      tcl_UtfNcmp : function (s1:Pchar; s2:Pchar; n:dword):longint;cdecl;
//      tcl_UtfNcasecmp : function (s1:Pchar; s2:Pchar; n:dword):longint;cdecl;
//      tcl_StringCaseMatch : function (str:Pchar; pattern:Pchar; nocase:longint):longint;cdecl;
//      tcl_UniCharIsControl : function (ch:longint):longint;cdecl;
//      tcl_UniCharIsGraph : function (ch:longint):longint;cdecl;
//      tcl_UniCharIsPrint : function (ch:longint):longint;cdecl;
//      tcl_UniCharIsPunct : function (ch:longint):longint;cdecl;
//      tcl_RegExpExecObj : function (interp:PTcl_Interp; regexp:TTcl_RegExp; textObj:PTcl_Obj; offset:longint; nmatches:longint; 
//                   flags:longint):longint;cdecl;
//      tcl_RegExpGetInfo : procedure (regexp:TTcl_RegExp; infoPtr:PTcl_RegExpInfo);cdecl;
//      tcl_NewUnicodeObj : function (unicode:PTcl_UniChar; numChars:longint):PTcl_Obj;cdecl;
//      tcl_SetUnicodeObj : procedure (objPtr:PTcl_Obj; unicode:PTcl_UniChar; numChars:longint);cdecl;
//      tcl_GetCharLength : function (objPtr:PTcl_Obj):longint;cdecl;
//      tcl_GetUniChar : function (objPtr:PTcl_Obj; index:longint):TTcl_UniChar;cdecl;
//      tcl_GetUnicode : function (objPtr:PTcl_Obj):PTcl_UniChar;cdecl;
//      tcl_GetRange : function (objPtr:PTcl_Obj; first:longint; last:longint):PTcl_Obj;cdecl;
//      tcl_AppendUnicodeToObj : procedure (objPtr:PTcl_Obj; unicode:PTcl_UniChar; length:longint);cdecl;
//      tcl_RegExpMatchObj : function (interp:PTcl_Interp; textObj:PTcl_Obj; patternObj:PTcl_Obj):longint;cdecl;
//      tcl_SetNotifier : procedure (notifierProcPtr:PTcl_NotifierProcs);cdecl;
//      tcl_GetAllocMutex : function :PTcl_Mutex;cdecl;
//      tcl_GetChannelNames : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_GetChannelNamesEx : function (interp:PTcl_Interp; pattern:Pchar):longint;cdecl;
//      tcl_ProcObjCmd : function (clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;
//      tcl_ConditionFinalize : procedure (condPtr:PTcl_Condition);cdecl;
//      tcl_MutexFinalize : procedure (mutex:PTcl_Mutex);cdecl;
//      tcl_CreateThread : function (idPtr:PTcl_ThreadId; proc:PTcl_ThreadCreateProc; clientData:TClientData; stackSize:longint; flags:longint):longint;cdecl;
//      tcl_ReadRaw : function (chan:TTcl_Channel; dst:Pchar; bytesToRead:longint):longint;cdecl;
//      tcl_WriteRaw : function (chan:TTcl_Channel; src:Pchar; srcLen:longint):longint;cdecl;
//      tcl_GetTopChannel : function (chan:TTcl_Channel):TTcl_Channel;cdecl;
//      tcl_ChannelBuffered : function (chan:TTcl_Channel):longint;cdecl;
//      tcl_ChannelName : function (chanTypePtr:PTcl_ChannelType):Pchar;cdecl;
//      tcl_ChannelVersion : function (chanTypePtr:PTcl_ChannelType):TTcl_ChannelTypeVersion;cdecl;
//      tcl_ChannelBlockModeProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverBlockModeProc;cdecl;
//      tcl_ChannelCloseProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverCloseProc;cdecl;
//      tcl_ChannelClose2Proc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverClose2Proc;cdecl;
//      tcl_ChannelInputProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverInputProc;cdecl;
//      tcl_ChannelOutputProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverOutputProc;cdecl;
//      tcl_ChannelSeekProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverSeekProc;cdecl;
//      tcl_ChannelSetOptionProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverSetOptionProc;cdecl;
//      tcl_ChannelGetOptionProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverGetOptionProc;cdecl;
//      tcl_ChannelWatchProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverWatchProc;cdecl;
//      tcl_ChannelGetHandleProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverGetHandleProc;cdecl;
//      tcl_ChannelFlushProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverFlushProc;cdecl;
//      tcl_ChannelHandlerProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverHandlerProc;cdecl;
//      tcl_JoinThread : function (threadId:TTcl_ThreadId; result:Plongint):longint;cdecl;
//      tcl_IsChannelShared : function (channel:TTcl_Channel):longint;cdecl;
//      tcl_IsChannelRegistered : function (interp:PTcl_Interp; channel:TTcl_Channel):longint;cdecl;
//      tcl_CutChannel : procedure (channel:TTcl_Channel);cdecl;
//      tcl_SpliceChannel : procedure (channel:TTcl_Channel);cdecl;
//      tcl_ClearChannelHandlers : procedure (channel:TTcl_Channel);cdecl;
//      tcl_IsChannelExisting : function (channelName:Pchar):longint;cdecl;
//      tcl_UniCharNcasecmp : function (ucs:PTcl_UniChar; uct:PTcl_UniChar; numChars:dword):longint;cdecl;
//      tcl_UniCharCaseMatch : function (uniStr:PTcl_UniChar; uniPattern:PTcl_UniChar; nocase:longint):longint;cdecl;
//      tcl_FindHashEntry : function (tablePtr:PTcl_HashTable; key:pointer):PTcl_HashEntry;cdecl;
//      tcl_CreateHashEntry : function (tablePtr:PTcl_HashTable; key:pointer; newPtr:Plongint):PTcl_HashEntry;cdecl;
//      tcl_InitCustomHashTable : procedure (tablePtr:PTcl_HashTable; keyType:longint; typePtr:PTcl_HashKeyType);cdecl;
//      tcl_InitObjHashTable : procedure (tablePtr:PTcl_HashTable);cdecl;
//      tcl_CommandTraceInfo : function (interp:PTcl_Interp; varName:Pchar; flags:longint; procPtr:PTcl_CommandTraceProc; prevClientData:TClientData):TClientData;cdecl;
//      tcl_TraceCommand : function (interp:PTcl_Interp; varName:Pchar; flags:longint; proc:PTcl_CommandTraceProc; clientData:TClientData):longint;cdecl;
//      tcl_UntraceCommand : procedure (interp:PTcl_Interp; varName:Pchar; flags:longint; proc:PTcl_CommandTraceProc; clientData:TClientData);cdecl;
//      tcl_AttemptAlloc : function (size:dword):Pchar;cdecl;
//      tcl_AttemptDbCkalloc : function (size:dword; file_:Pchar; line:longint):Pchar;cdecl;
//      tcl_AttemptRealloc : function (ptr:Pchar; size:dword):Pchar;cdecl;
//      tcl_AttemptDbCkrealloc : function (ptr:Pchar; size:dword; file_:Pchar; line:longint):Pchar;cdecl;
//      tcl_AttemptSetObjLength : function (objPtr:PTcl_Obj; length:longint):longint;cdecl;
//      tcl_GetChannelThread : function (channel:TTcl_Channel):TTcl_ThreadId;cdecl;
//      tcl_GetUnicodeFromObj : function (objPtr:PTcl_Obj; lengthPtr:Plongint):PTcl_UniChar;cdecl;
//      tcl_GetMathFuncInfo : function (interp:PTcl_Interp; name:Pchar; numArgsPtr:Plongint; argTypesPtr:PPTcl_ValueType; procPtr:PPTcl_MathProc; 
//                   clientDataPtr:PClientData):longint;cdecl;
//      tcl_ListMathFuncs : function (interp:PTcl_Interp; pattern:Pchar):PTcl_Obj;cdecl;
//      tcl_SubstObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; flags:longint):PTcl_Obj;cdecl;
//      tcl_DetachChannel : function (interp:PTcl_Interp; channel:TTcl_Channel):longint;cdecl;
//      tcl_IsStandardChannel : function (channel:TTcl_Channel):longint;cdecl;
//      tcl_FSCopyFile : function (srcPathPtr:PTcl_Obj; destPathPtr:PTcl_Obj):longint;cdecl;
//      tcl_FSCopyDirectory : function (srcPathPtr:PTcl_Obj; destPathPtr:PTcl_Obj; errorPtr:PPTcl_Obj):longint;cdecl;
//      tcl_FSCreateDirectory : function (pathPtr:PTcl_Obj):longint;cdecl;
//      tcl_FSDeleteFile : function (pathPtr:PTcl_Obj):longint;cdecl;
//      tcl_FSLoadFile : function (interp:PTcl_Interp; pathPtr:PTcl_Obj; sym1:Pchar; sym2:Pchar; proc1Ptr:PPTcl_PackageInitProc; 
//                   proc2Ptr:PPTcl_PackageInitProc; handlePtr:PTcl_LoadHandle; unloadProcPtr:PPTcl_FSUnloadFileProc):longint;cdecl;
//      tcl_FSMatchInDirectory : function (interp:PTcl_Interp; result:PTcl_Obj; pathPtr:PTcl_Obj; pattern:Pchar; types:PTcl_GlobTypeData):longint;cdecl;
//      tcl_FSLink : function (pathPtr:PTcl_Obj; toPtr:PTcl_Obj; linkAction:longint):PTcl_Obj;cdecl;
//      tcl_FSRemoveDirectory : function (pathPtr:PTcl_Obj; recursive:longint; errorPtr:PPTcl_Obj):longint;cdecl;
//      tcl_FSRenameFile : function (srcPathPtr:PTcl_Obj; destPathPtr:PTcl_Obj):longint;cdecl;
//      tcl_FSLstat : function (pathPtr:PTcl_Obj; buf:PTcl_StatBuf):longint;cdecl;
//      tcl_FSUtime : function (pathPtr:PTcl_Obj; tval:Putimbuf):longint;cdecl;
//      tcl_FSFileAttrsGet : function (interp:PTcl_Interp; index:longint; pathPtr:PTcl_Obj; objPtrRef:PPTcl_Obj):longint;cdecl;
//      tcl_FSFileAttrsSet : function (interp:PTcl_Interp; index:longint; pathPtr:PTcl_Obj; objPtr:PTcl_Obj):longint;cdecl;
//      tcl_FSFileAttrStrings : function (pathPtr:PTcl_Obj; objPtrRef:PPTcl_Obj):PPchar;cdecl;
//      tcl_FSStat : function (pathPtr:PTcl_Obj; buf:PTcl_StatBuf):longint;cdecl;
//      tcl_FSAccess : function (pathPtr:PTcl_Obj; mode:longint):longint;cdecl;
//      tcl_FSOpenFileChannel : function (interp:PTcl_Interp; pathPtr:PTcl_Obj; modeString:Pchar; permissions:longint):TTcl_Channel;cdecl;
//      tcl_FSGetCwd : function (interp:PTcl_Interp):PTcl_Obj;cdecl;
//      tcl_FSChdir : function (pathPtr:PTcl_Obj):longint;cdecl;
//      tcl_FSConvertToPathType : function (interp:PTcl_Interp; pathPtr:PTcl_Obj):longint;cdecl;
//      tcl_FSJoinPath : function (listObj:PTcl_Obj; elements:longint):PTcl_Obj;cdecl;
//      tcl_FSSplitPath : function (pathPtr:PTcl_Obj; lenPtr:Plongint):PTcl_Obj;cdecl;
//      tcl_FSEqualPaths : function (firstPtr:PTcl_Obj; secondPtr:PTcl_Obj):longint;cdecl;
//      tcl_FSGetNormalizedPath : function (interp:PTcl_Interp; pathPtr:PTcl_Obj):PTcl_Obj;cdecl;
//      tcl_FSJoinToPath : function (pathPtr:PTcl_Obj; objc:longint; objv:PPTcl_Obj):PTcl_Obj;cdecl;
//      tcl_FSGetInternalRep : function (pathPtr:PTcl_Obj; fsPtr:PTcl_Filesystem):TClientData;cdecl;
//      tcl_FSGetTranslatedPath : function (interp:PTcl_Interp; pathPtr:PTcl_Obj):PTcl_Obj;cdecl;
//      tcl_FSEvalFile : function (interp:PTcl_Interp; fileName:PTcl_Obj):longint;cdecl;
//      tcl_FSNewNativePath : function (fromFilesystem:PTcl_Filesystem; clientData:TClientData):PTcl_Obj;cdecl;
//      tcl_FSGetNativePath : function (pathPtr:PTcl_Obj):pointer;cdecl;
//      tcl_FSFileSystemInfo : function (pathPtr:PTcl_Obj):PTcl_Obj;cdecl;
//      tcl_FSPathSeparator : function (pathPtr:PTcl_Obj):PTcl_Obj;cdecl;
//      tcl_FSListVolumes : function :PTcl_Obj;cdecl;
//      tcl_FSRegister : function (clientData:TClientData; fsPtr:PTcl_Filesystem):longint;cdecl;
//      tcl_FSUnregister : function (fsPtr:PTcl_Filesystem):longint;cdecl;
//      tcl_FSData : function (fsPtr:PTcl_Filesystem):TClientData;cdecl;
//      tcl_FSGetTranslatedStringPath : function (interp:PTcl_Interp; pathPtr:PTcl_Obj):Pchar;cdecl;
//      tcl_FSGetFileSystemForPath : function (pathPtr:PTcl_Obj):PTcl_Filesystem;cdecl;
//      tcl_FSGetPathType : function (pathPtr:PTcl_Obj):TTcl_PathType;cdecl;
//      tcl_OutputBuffered : function (chan:TTcl_Channel):longint;cdecl;
//      tcl_FSMountsChanged : procedure (fsPtr:PTcl_Filesystem);cdecl;
//      tcl_EvalTokensStandard : function (interp:PTcl_Interp; tokenPtr:PTcl_Token; count:longint):longint;cdecl;
//      tcl_GetTime : procedure (timeBuf:PTcl_Time);cdecl;
//      tcl_CreateObjTrace : function (interp:PTcl_Interp; level:longint; flags:longint; objProc:PTcl_CmdObjTraceProc; clientData:TClientData; 
//                   delProc:PTcl_CmdObjTraceDeleteProc):TTcl_Trace;cdecl;
//      tcl_GetCommandInfoFromToken : function (token:TTcl_Command; infoPtr:PTcl_CmdInfo):longint;cdecl;
//      tcl_SetCommandInfoFromToken : function (token:TTcl_Command; infoPtr:PTcl_CmdInfo):longint;cdecl;
//      tcl_DbNewWideIntObj : function (wideValue:TTcl_WideInt; file_:Pchar; line:longint):PTcl_Obj;cdecl;
//      tcl_GetWideIntFromObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; widePtr:PTcl_WideInt):longint;cdecl;
//      tcl_NewWideIntObj : function (wideValue:TTcl_WideInt):PTcl_Obj;cdecl;
//      tcl_SetWideIntObj : procedure (objPtr:PTcl_Obj; wideValue:TTcl_WideInt);cdecl;
//      tcl_AllocStatBuf : function :PTcl_StatBuf;cdecl;
//      tcl_Seek : function (chan:TTcl_Channel; offset:TTcl_WideInt; mode:longint):TTcl_WideInt;cdecl;
//      tcl_Tell : function (chan:TTcl_Channel):TTcl_WideInt;cdecl;
//      tcl_ChannelWideSeekProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverWideSeekProc;cdecl;
//      tcl_DictObjPut : function (interp:PTcl_Interp; dictPtr:PTcl_Obj; keyPtr:PTcl_Obj; valuePtr:PTcl_Obj):longint;cdecl;
//      tcl_DictObjGet : function (interp:PTcl_Interp; dictPtr:PTcl_Obj; keyPtr:PTcl_Obj; valuePtrPtr:PPTcl_Obj):longint;cdecl;
//      tcl_DictObjRemove : function (interp:PTcl_Interp; dictPtr:PTcl_Obj; keyPtr:PTcl_Obj):longint;cdecl;
//      tcl_DictObjSize : function (interp:PTcl_Interp; dictPtr:PTcl_Obj; sizePtr:Plongint):longint;cdecl;
//      tcl_DictObjFirst : function (interp:PTcl_Interp; dictPtr:PTcl_Obj; searchPtr:PTcl_DictSearch; keyPtrPtr:PPTcl_Obj; valuePtrPtr:PPTcl_Obj; 
//                   donePtr:Plongint):longint;cdecl;
//      tcl_DictObjNext : procedure (searchPtr:PTcl_DictSearch; keyPtrPtr:PPTcl_Obj; valuePtrPtr:PPTcl_Obj; donePtr:Plongint);cdecl;
//      tcl_DictObjDone : procedure (searchPtr:PTcl_DictSearch);cdecl;
//      tcl_DictObjPutKeyList : function (interp:PTcl_Interp; dictPtr:PTcl_Obj; keyc:longint; keyv:PPTcl_Obj; valuePtr:PTcl_Obj):longint;cdecl;
//      tcl_DictObjRemoveKeyList : function (interp:PTcl_Interp; dictPtr:PTcl_Obj; keyc:longint; keyv:PPTcl_Obj):longint;cdecl;
//      tcl_NewDictObj : function :PTcl_Obj;cdecl;
//      tcl_DbNewDictObj : function (file_:Pchar; line:longint):PTcl_Obj;cdecl;
//      tcl_RegisterConfig : procedure (interp:PTcl_Interp; pkgName:Pchar; configuration:PTcl_Config; valEncoding:Pchar);cdecl;
//      tcl_CreateNamespace : function (interp:PTcl_Interp; name:Pchar; clientData:TClientData; deleteProc:PTcl_NamespaceDeleteProc):PTcl_Namespace;cdecl;
//      tcl_DeleteNamespace : procedure (nsPtr:PTcl_Namespace);cdecl;
//      tcl_AppendExportList : function (interp:PTcl_Interp; nsPtr:PTcl_Namespace; objPtr:PTcl_Obj):longint;cdecl;
//      tcl_Export : function (interp:PTcl_Interp; nsPtr:PTcl_Namespace; pattern:Pchar; resetListFirst:longint):longint;cdecl;
//      tcl_Import : function (interp:PTcl_Interp; nsPtr:PTcl_Namespace; pattern:Pchar; allowOverwrite:longint):longint;cdecl;
//      tcl_ForgetImport : function (interp:PTcl_Interp; nsPtr:PTcl_Namespace; pattern:Pchar):longint;cdecl;
//      tcl_GetCurrentNamespace : function (interp:PTcl_Interp):PTcl_Namespace;cdecl;
//      tcl_GetGlobalNamespace : function (interp:PTcl_Interp):PTcl_Namespace;cdecl;
//      tcl_FindNamespace : function (interp:PTcl_Interp; name:Pchar; contextNsPtr:PTcl_Namespace; flags:longint):PTcl_Namespace;cdecl;
//      tcl_FindCommand : function (interp:PTcl_Interp; name:Pchar; contextNsPtr:PTcl_Namespace; flags:longint):TTcl_Command;cdecl;
//      tcl_GetCommandFromObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj):TTcl_Command;cdecl;
//      tcl_GetCommandFullName : procedure (interp:PTcl_Interp; command:TTcl_Command; objPtr:PTcl_Obj);cdecl;
//      tcl_FSEvalFileEx : function (interp:PTcl_Interp; fileName:PTcl_Obj; encodingName:Pchar):longint;cdecl;
//      tcl_SetExitProc : function (proc:PTcl_ExitProc):PTcl_ExitProc;cdecl;
//      tcl_LimitAddHandler : procedure (interp:PTcl_Interp; _type:longint; handlerProc:PTcl_LimitHandlerProc; clientData:TClientData; deleteProc:PTcl_LimitHandlerDeleteProc);cdecl;
//      tcl_LimitRemoveHandler : procedure (interp:PTcl_Interp; _type:longint; handlerProc:PTcl_LimitHandlerProc; clientData:TClientData);cdecl;
//      tcl_LimitReady : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_LimitCheck : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_LimitExceeded : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_LimitSetCommands : procedure (interp:PTcl_Interp; commandLimit:longint);cdecl;
//      tcl_LimitSetTime : procedure (interp:PTcl_Interp; timeLimitPtr:PTcl_Time);cdecl;
//      tcl_LimitSetGranularity : procedure (interp:PTcl_Interp; _type:longint; granularity:longint);cdecl;
//      tcl_LimitTypeEnabled : function (interp:PTcl_Interp; _type:longint):longint;cdecl;
//      tcl_LimitTypeExceeded : function (interp:PTcl_Interp; _type:longint):longint;cdecl;
//      tcl_LimitTypeSet : procedure (interp:PTcl_Interp; _type:longint);cdecl;
//      tcl_LimitTypeReset : procedure (interp:PTcl_Interp; _type:longint);cdecl;
//      tcl_LimitGetCommands : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_LimitGetTime : procedure (interp:PTcl_Interp; timeLimitPtr:PTcl_Time);cdecl;
//      tcl_LimitGetGranularity : function (interp:PTcl_Interp; _type:longint):longint;cdecl;
//      tcl_SaveInterpState : function (interp:PTcl_Interp; status:longint):TTcl_InterpState;cdecl;
//      tcl_RestoreInterpState : function (interp:PTcl_Interp; state:TTcl_InterpState):longint;cdecl;
//      tcl_DiscardInterpState : procedure (state:TTcl_InterpState);cdecl;
//      tcl_SetReturnOptions : function (interp:PTcl_Interp; options:PTcl_Obj):longint;cdecl;
//      tcl_GetReturnOptions : function (interp:PTcl_Interp; result:longint):PTcl_Obj;cdecl;
//      tcl_IsEnsemble : function (token:TTcl_Command):longint;cdecl;
//      tcl_CreateEnsemble : function (interp:PTcl_Interp; name:Pchar; namespacePtr:PTcl_Namespace; flags:longint):TTcl_Command;cdecl;
//      tcl_FindEnsemble : function (interp:PTcl_Interp; cmdNameObj:PTcl_Obj; flags:longint):TTcl_Command;cdecl;
//      tcl_SetEnsembleSubcommandList : function (interp:PTcl_Interp; token:TTcl_Command; subcmdList:PTcl_Obj):longint;cdecl;
//      tcl_SetEnsembleMappingDict : function (interp:PTcl_Interp; token:TTcl_Command; mapDict:PTcl_Obj):longint;cdecl;
//      tcl_SetEnsembleUnknownHandler : function (interp:PTcl_Interp; token:TTcl_Command; unknownList:PTcl_Obj):longint;cdecl;
//      tcl_SetEnsembleFlags : function (interp:PTcl_Interp; token:TTcl_Command; flags:longint):longint;cdecl;
//      tcl_GetEnsembleSubcommandList : function (interp:PTcl_Interp; token:TTcl_Command; subcmdListPtr:PPTcl_Obj):longint;cdecl;
//      tcl_GetEnsembleMappingDict : function (interp:PTcl_Interp; token:TTcl_Command; mapDictPtr:PPTcl_Obj):longint;cdecl;
//      tcl_GetEnsembleUnknownHandler : function (interp:PTcl_Interp; token:TTcl_Command; unknownListPtr:PPTcl_Obj):longint;cdecl;
//      tcl_GetEnsembleFlags : function (interp:PTcl_Interp; token:TTcl_Command; flagsPtr:Plongint):longint;cdecl;
//      tcl_GetEnsembleNamespace : function (interp:PTcl_Interp; token:TTcl_Command; namespacePtrPtr:PPTcl_Namespace):longint;cdecl;
//      tcl_SetTimeProc : procedure (getProc:PTcl_GetTimeProc; scaleProc:PTcl_ScaleTimeProc; clientData:TClientData);cdecl;
//      tcl_QueryTimeProc : procedure (getProc:PPTcl_GetTimeProc; scaleProc:PPTcl_ScaleTimeProc; clientData:PClientData);cdecl;
//      tcl_ChannelThreadActionProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverThreadActionProc;cdecl;
//      tcl_NewBignumObj : function (value:Pmp_int):PTcl_Obj;cdecl;
//      tcl_DbNewBignumObj : function (value:Pmp_int; file_:Pchar; line:longint):PTcl_Obj;cdecl;
//      tcl_SetBignumObj : procedure (obj:PTcl_Obj; value:Pmp_int);cdecl;
//      tcl_GetBignumFromObj : function (interp:PTcl_Interp; obj:PTcl_Obj; value:Pmp_int):longint;cdecl;
//      tcl_TakeBignumFromObj : function (interp:PTcl_Interp; obj:PTcl_Obj; value:Pmp_int):longint;cdecl;
//      tcl_TruncateChannel : function (chan:TTcl_Channel; length:TTcl_WideInt):longint;cdecl;
//      tcl_ChannelTruncateProc : function (chanTypePtr:PTcl_ChannelType):PTcl_DriverTruncateProc;cdecl;
//      tcl_SetChannelErrorInterp : procedure (interp:PTcl_Interp; msg:PTcl_Obj);cdecl;
//      tcl_GetChannelErrorInterp : procedure (interp:PTcl_Interp; msg:PPTcl_Obj);cdecl;
//      tcl_SetChannelError : procedure (chan:TTcl_Channel; msg:PTcl_Obj);cdecl;
//      tcl_GetChannelError : procedure (chan:TTcl_Channel; msg:PPTcl_Obj);cdecl;
//      tcl_InitBignumFromDouble : function (interp:PTcl_Interp; initval:Tdouble; toInit:Pmp_int):longint;cdecl;
//      tcl_GetNamespaceUnknownHandler : function (interp:PTcl_Interp; nsPtr:PTcl_Namespace):PTcl_Obj;cdecl;
//      tcl_SetNamespaceUnknownHandler : function (interp:PTcl_Interp; nsPtr:PTcl_Namespace; handlerPtr:PTcl_Obj):longint;cdecl;
//      tcl_GetEncodingFromObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; encodingPtr:PTcl_Encoding):longint;cdecl;
//      tcl_GetEncodingSearchPath : function :PTcl_Obj;cdecl;
//      tcl_SetEncodingSearchPath : function (searchPath:PTcl_Obj):longint;cdecl;
//      tcl_GetEncodingNameFromEnvironment : function (bufPtr:PTcl_DString):Pchar;cdecl;
//      tcl_PkgRequireProc : function (interp:PTcl_Interp; name:Pchar; objc:longint; objv:PPTcl_Obj; clientDataPtr:pointer):longint;cdecl;
//      tcl_AppendObjToErrorInfo : procedure (interp:PTcl_Interp; objPtr:PTcl_Obj);cdecl;
//      tcl_AppendLimitedToObj : procedure (objPtr:PTcl_Obj; bytes:Pchar; length:longint; limit:longint; ellipsis:Pchar);cdecl;
//      tcl_Format : function (interp:PTcl_Interp; format:Pchar; objc:longint; objv:PPTcl_Obj):PTcl_Obj;cdecl;
//      tcl_AppendFormatToObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; format:Pchar; objc:longint; objv:PPTcl_Obj):longint;cdecl;
//      tcl_ObjPrintf : function (format:Pchar; args:array of const):PTcl_Obj;cdecl;
//      tcl_AppendPrintfToObj : procedure (objPtr:PTcl_Obj; format:Pchar; args:array of const);cdecl;
//      tcl_CancelEval : function (interp:PTcl_Interp; resultObjPtr:PTcl_Obj; clientData:TClientData; flags:longint):longint;cdecl;
//      tcl_Canceled : function (interp:PTcl_Interp; flags:longint):longint;cdecl;
//      tcl_CreatePipe : function (interp:PTcl_Interp; rchan:PTcl_Channel; wchan:PTcl_Channel; flags:longint):longint;cdecl;
//      tcl_NRCreateCommand : function (interp:PTcl_Interp; cmdName:Pchar; proc:PTcl_ObjCmdProc; nreProc:PTcl_ObjCmdProc; clientData:TClientData; 
//                   deleteProc:PTcl_CmdDeleteProc):TTcl_Command;cdecl;
//      tcl_NREvalObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; flags:longint):longint;cdecl;
//      tcl_NREvalObjv : function (interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj; flags:longint):longint;cdecl;
//      tcl_NRCmdSwap : function (interp:PTcl_Interp; cmd:TTcl_Command; objc:longint; objv:PPTcl_Obj; flags:longint):longint;cdecl;
//      tcl_NRAddCallback : procedure (interp:PTcl_Interp; postProcPtr:PTcl_NRPostProc; data0:TClientData; data1:TClientData; data2:TClientData; 
//                    data3:TClientData);cdecl;
//      tcl_NRCallObjProc : function (interp:PTcl_Interp; objProc:PTcl_ObjCmdProc; clientData:TClientData; objc:longint; objv:PPTcl_Obj):longint;cdecl;
//      tcl_GetFSDeviceFromStat : function (statPtr:PTcl_StatBuf):dword;cdecl;
//      tcl_GetFSInodeFromStat : function (statPtr:PTcl_StatBuf):dword;cdecl;
//      tcl_GetModeFromStat : function (statPtr:PTcl_StatBuf):dword;cdecl;
//      tcl_GetLinkCountFromStat : function (statPtr:PTcl_StatBuf):longint;cdecl;
//      tcl_GetUserIdFromStat : function (statPtr:PTcl_StatBuf):longint;cdecl;
//      tcl_GetGroupIdFromStat : function (statPtr:PTcl_StatBuf):longint;cdecl;
//      tcl_GetDeviceTypeFromStat : function (statPtr:PTcl_StatBuf):longint;cdecl;
//      tcl_GetAccessTimeFromStat : function (statPtr:PTcl_StatBuf):TTcl_WideInt;cdecl;
//      tcl_GetModificationTimeFromStat : function (statPtr:PTcl_StatBuf):TTcl_WideInt;cdecl;
//      tcl_GetChangeTimeFromStat : function (statPtr:PTcl_StatBuf):TTcl_WideInt;cdecl;
//      tcl_GetSizeFromStat : function (statPtr:PTcl_StatBuf):TTcl_WideUInt;cdecl;
//      tcl_GetBlocksFromStat : function (statPtr:PTcl_StatBuf):TTcl_WideUInt;cdecl;
//      tcl_GetBlockSizeFromStat : function (statPtr:PTcl_StatBuf):dword;cdecl;
//      tcl_SetEnsembleParameterList : function (interp:PTcl_Interp; token:TTcl_Command; paramList:PTcl_Obj):longint;cdecl;
//      tcl_GetEnsembleParameterList : function (interp:PTcl_Interp; token:TTcl_Command; paramListPtr:PPTcl_Obj):longint;cdecl;
//      tcl_ParseArgsObjv : function (interp:PTcl_Interp; argTable:PTcl_ArgvInfo; objcPtr:Plongint; objv:PPTcl_Obj; remObjv:PPPTcl_Obj):longint;cdecl;
//      tcl_GetErrorLine : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_SetErrorLine : procedure (interp:PTcl_Interp; lineNum:longint);cdecl;
//      tcl_TransferResult : procedure (sourceInterp:PTcl_Interp; code:longint; targetInterp:PTcl_Interp);cdecl;
//      tcl_InterpActive : function (interp:PTcl_Interp):longint;cdecl;
//      tcl_BackgroundException : procedure (interp:PTcl_Interp; code:longint);cdecl;
//      tcl_ZlibDeflate : function (interp:PTcl_Interp; format:longint; data:PTcl_Obj; level:longint; gzipHeaderDictObj:PTcl_Obj):longint;cdecl;
//      tcl_ZlibInflate : function (interp:PTcl_Interp; format:longint; data:PTcl_Obj; buffersize:longint; gzipHeaderDictObj:PTcl_Obj):longint;cdecl;
//      tcl_ZlibCRC32 : function (crc:dword; buf:Pbyte; len:longint):dword;cdecl;
//      tcl_ZlibAdler32 : function (adler:dword; buf:Pbyte; len:longint):dword;cdecl;
//      tcl_ZlibStreamInit : function (interp:PTcl_Interp; mode:longint; format:longint; level:longint; dictObj:PTcl_Obj; 
//                   zshandle:PTcl_ZlibStream):longint;cdecl;
//      tcl_ZlibStreamGetCommandName : function (zshandle:TTcl_ZlibStream):PTcl_Obj;cdecl;
//      tcl_ZlibStreamEof : function (zshandle:TTcl_ZlibStream):longint;cdecl;
//      tcl_ZlibStreamChecksum : function (zshandle:TTcl_ZlibStream):longint;cdecl;
//      tcl_ZlibStreamPut : function (zshandle:TTcl_ZlibStream; data:PTcl_Obj; flush:longint):longint;cdecl;
//      tcl_ZlibStreamGet : function (zshandle:TTcl_ZlibStream; data:PTcl_Obj; count:longint):longint;cdecl;
//      tcl_ZlibStreamClose : function (zshandle:TTcl_ZlibStream):longint;cdecl;
//      tcl_ZlibStreamReset : function (zshandle:TTcl_ZlibStream):longint;cdecl;
//      tcl_SetStartupScript : procedure (path:PTcl_Obj; encoding:Pchar);cdecl;
//      tcl_GetStartupScript : function (encodingPtr:PPchar):PTcl_Obj;cdecl;
//      tcl_CloseEx : function (interp:PTcl_Interp; chan:TTcl_Channel; flags:longint):longint;cdecl;
//      tcl_NRExprObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; resultPtr:PTcl_Obj):longint;cdecl;
//      tcl_NRSubstObj : function (interp:PTcl_Interp; objPtr:PTcl_Obj; flags:longint):longint;cdecl;
//      tcl_LoadFile : function (interp:PTcl_Interp; pathPtr:PTcl_Obj; symv:PPchar; flags:longint; procPtrs:pointer; 
//                   handlePtr:PTcl_LoadHandle):longint;cdecl;
//      tcl_FindSymbol : function (interp:PTcl_Interp; handle:TTcl_LoadHandle; symbol:Pchar):pointer;cdecl;
//      tcl_FSUnloadFile : function (interp:PTcl_Interp; handlePtr:TTcl_LoadHandle):longint;cdecl;
//      tcl_ZlibStreamSetCompressionDictionary : procedure (zhandle:TTcl_ZlibStream; compressionDictionaryObj:PTcl_Obj);cdecl;
//      reserved631 : procedure ;cdecl;
//      reserved632 : procedure ;cdecl;
//      reserved633 : procedure ;cdecl;
//      reserved634 : procedure ;cdecl;
//      reserved635 : procedure ;cdecl;
//      reserved636 : procedure ;cdecl;
//      reserved637 : procedure ;cdecl;
//      reserved638 : procedure ;cdecl;
//      reserved639 : procedure ;cdecl;
//      reserved640 : procedure ;cdecl;
//      reserved641 : procedure ;cdecl;
//      reserved642 : procedure ;cdecl;
//      reserved643 : procedure ;cdecl;
//      reserved644 : procedure ;cdecl;
//      reserved645 : procedure ;cdecl;
//      reserved646 : procedure ;cdecl;
//      reserved647 : procedure ;cdecl;
//      reserved648 : procedure ;cdecl;
//      reserved649 : procedure ;cdecl;
//      reserved650 : procedure ;cdecl;
//      reserved651 : procedure ;cdecl;
//      reserved652 : procedure ;cdecl;
//      reserved653 : procedure ;cdecl;
//      reserved654 : procedure ;cdecl;
//      reserved655 : procedure ;cdecl;
//      reserved656 : procedure ;cdecl;
//      reserved657 : procedure ;cdecl;
//      reserved658 : procedure ;cdecl;
//      reserved659 : procedure ;cdecl;
//      reserved660 : procedure ;cdecl;
//      reserved661 : procedure ;cdecl;
//      reserved662 : procedure ;cdecl;
//      reserved663 : procedure ;cdecl;
//      reserved664 : procedure ;cdecl;
//      reserved665 : procedure ;cdecl;
//      reserved666 : procedure ;cdecl;
//      reserved667 : procedure ;cdecl;
//      reserved668 : procedure ;cdecl;
//      reserved669 : procedure ;cdecl;
//      reserved670 : procedure ;cdecl;
//      reserved671 : procedure ;cdecl;
//      reserved672 : procedure ;cdecl;
//      reserved673 : procedure ;cdecl;
//      reserved674 : procedure ;cdecl;
//      reserved675 : procedure ;cdecl;
//      reserved676 : procedure ;cdecl;
//      reserved677 : procedure ;cdecl;
//      reserved678 : procedure ;cdecl;
//      reserved679 : procedure ;cdecl;
//      reserved680 : procedure ;cdecl;
//      reserved681 : procedure ;cdecl;
//      reserved682 : procedure ;cdecl;
//      reserved683 : procedure ;cdecl;
//      reserved684 : procedure ;cdecl;
//      reserved685 : procedure ;cdecl;
//      reserved686 : procedure ;cdecl;
//      reserved687 : procedure ;cdecl;
//      tclUnusedStubEntry : procedure ;cdecl;
//    end;
//  var
//    tclStubsPtr : PTclStubs;cvar;external libtclstub8_6;
//{ C++ end of extern C conditionnal removed }
//{$if defined(USE_TCL_STUBS)}
//{
// * Inline function declarations:
//  }
//{ 0  }
//
//const
//  Tcl_PkgProvideEx = tclStubsPtr^.tcl_PkgProvideEx;  
//{ 1  }
//  Tcl_PkgRequireEx = tclStubsPtr^.tcl_PkgRequireEx;  
//{ 2  }
//  Tcl_Panic = tclStubsPtr^.tcl_Panic;  
//{ 3  }
//  Tcl_Alloc = tclStubsPtr^.tcl_Alloc;  
//{ 4  }
//  Tcl_Free = tclStubsPtr^.tcl_Free;  
//{ 5  }
//  Tcl_Realloc = tclStubsPtr^.tcl_Realloc;  
//{ 6  }
//  Tcl_DbCkalloc = tclStubsPtr^.tcl_DbCkalloc;  
//{ 7  }
//  Tcl_DbCkfree = tclStubsPtr^.tcl_DbCkfree;  
//{ 8  }
//  Tcl_DbCkrealloc = tclStubsPtr^.tcl_DbCkrealloc;  
//{$if !defined(_WIN32) && !defined(MAC_OSX_TCL) /* UNIX */}
//{ 9  }
//
//const
//  Tcl_CreateFileHandler = tclStubsPtr^.tcl_CreateFileHandler;  
//{$endif}
//{ UNIX  }
//{$ifdef MAC_OSX_TCL /* MACOSX */}
//{ 9  }
//
//const
//  Tcl_CreateFileHandler = tclStubsPtr^.tcl_CreateFileHandler;  
//{$endif}
//{ MACOSX  }
//{$if !defined(_WIN32) && !defined(MAC_OSX_TCL) /* UNIX */}
//{ 10  }
//
//const
//  Tcl_DeleteFileHandler = tclStubsPtr^.tcl_DeleteFileHandler;  
//{$endif}
//{ UNIX  }
//{$ifdef MAC_OSX_TCL /* MACOSX */}
//{ 10  }
//
//const
//  Tcl_DeleteFileHandler = tclStubsPtr^.tcl_DeleteFileHandler;  
//{$endif}
//{ MACOSX  }
//{ 11  }
//
//const
//  Tcl_SetTimer = tclStubsPtr^.tcl_SetTimer;  
//{ 12  }
//  Tcl_Sleep = tclStubsPtr^.tcl_Sleep;  
//{ 13  }
//  Tcl_WaitForEvent = tclStubsPtr^.tcl_WaitForEvent;  
//{ 14  }
//  Tcl_AppendAllObjTypes = tclStubsPtr^.tcl_AppendAllObjTypes;  
//{ 15  }
//  Tcl_AppendStringsToObj = tclStubsPtr^.tcl_AppendStringsToObj;  
//{ 16  }
//  Tcl_AppendToObj = tclStubsPtr^.tcl_AppendToObj;  
//{ 17  }
//  Tcl_ConcatObj = tclStubsPtr^.tcl_ConcatObj;  
//{ 18  }
//  Tcl_ConvertToType = tclStubsPtr^.tcl_ConvertToType;  
//{ 19  }
//  Tcl_DbDecrRefCount = tclStubsPtr^.tcl_DbDecrRefCount;  
//{ 20  }
//  Tcl_DbIncrRefCount = tclStubsPtr^.tcl_DbIncrRefCount;  
//{ 21  }
//  Tcl_DbIsShared = tclStubsPtr^.tcl_DbIsShared;  
//{ 22  }
//  Tcl_DbNewBooleanObj = tclStubsPtr^.tcl_DbNewBooleanObj;  
//{ 23  }
//  Tcl_DbNewByteArrayObj = tclStubsPtr^.tcl_DbNewByteArrayObj;  
//{ 24  }
//  Tcl_DbNewDoubleObj = tclStubsPtr^.tcl_DbNewDoubleObj;  
//{ 25  }
//  Tcl_DbNewListObj = tclStubsPtr^.tcl_DbNewListObj;  
//{ 26  }
//  Tcl_DbNewLongObj = tclStubsPtr^.tcl_DbNewLongObj;  
//{ 27  }
//  Tcl_DbNewObj = tclStubsPtr^.tcl_DbNewObj;  
//{ 28  }
//  Tcl_DbNewStringObj = tclStubsPtr^.tcl_DbNewStringObj;  
//{ 29  }
//  Tcl_DuplicateObj = tclStubsPtr^.tcl_DuplicateObj;  
//{ 30  }
//  TclFreeObj = tclStubsPtr^.tclFreeObj;  
//{ 31  }
//  Tcl_GetBoolean = tclStubsPtr^.tcl_GetBoolean;  
//{ 32  }
//  Tcl_GetBooleanFromObj = tclStubsPtr^.tcl_GetBooleanFromObj;  
//{ 33  }
//  Tcl_GetByteArrayFromObj = tclStubsPtr^.tcl_GetByteArrayFromObj;  
//{ 34  }
//  Tcl_GetDouble = tclStubsPtr^.tcl_GetDouble;  
//{ 35  }
//  Tcl_GetDoubleFromObj = tclStubsPtr^.tcl_GetDoubleFromObj;  
//{ 36  }
//  Tcl_GetIndexFromObj = tclStubsPtr^.tcl_GetIndexFromObj;  
//{ 37  }
//  Tcl_GetInt = tclStubsPtr^.tcl_GetInt;  
//{ 38  }
//  Tcl_GetIntFromObj = tclStubsPtr^.tcl_GetIntFromObj;  
//{ 39  }
//  Tcl_GetLongFromObj = tclStubsPtr^.tcl_GetLongFromObj;  
//{ 40  }
//  Tcl_GetObjType = tclStubsPtr^.tcl_GetObjType;  
//{ 41  }
//  Tcl_GetStringFromObj = tclStubsPtr^.tcl_GetStringFromObj;  
//{ 42  }
//  Tcl_InvalidateStringRep = tclStubsPtr^.tcl_InvalidateStringRep;  
//{ 43  }
//  Tcl_ListObjAppendList = tclStubsPtr^.tcl_ListObjAppendList;  
//{ 44  }
//  Tcl_ListObjAppendElement = tclStubsPtr^.tcl_ListObjAppendElement;  
//{ 45  }
//  Tcl_ListObjGetElements = tclStubsPtr^.tcl_ListObjGetElements;  
//{ 46  }
//  Tcl_ListObjIndex = tclStubsPtr^.tcl_ListObjIndex;  
//{ 47  }
//  Tcl_ListObjLength = tclStubsPtr^.tcl_ListObjLength;  
//{ 48  }
//  Tcl_ListObjReplace = tclStubsPtr^.tcl_ListObjReplace;  
//{ 49  }
//  Tcl_NewBooleanObj = tclStubsPtr^.tcl_NewBooleanObj;  
//{ 50  }
//  Tcl_NewByteArrayObj = tclStubsPtr^.tcl_NewByteArrayObj;  
//{ 51  }
//  Tcl_NewDoubleObj = tclStubsPtr^.tcl_NewDoubleObj;  
//{ 52  }
//  Tcl_NewIntObj = tclStubsPtr^.tcl_NewIntObj;  
//{ 53  }
//  Tcl_NewListObj = tclStubsPtr^.tcl_NewListObj;  
//{ 54  }
//  Tcl_NewLongObj = tclStubsPtr^.tcl_NewLongObj;  
//{ 55  }
//  Tcl_NewObj = tclStubsPtr^.tcl_NewObj;  
//{ 56  }
//  Tcl_NewStringObj = tclStubsPtr^.tcl_NewStringObj;  
//{ 57  }
//  Tcl_SetBooleanObj = tclStubsPtr^.tcl_SetBooleanObj;  
//{ 58  }
//  Tcl_SetByteArrayLength = tclStubsPtr^.tcl_SetByteArrayLength;  
//{ 59  }
//  Tcl_SetByteArrayObj = tclStubsPtr^.tcl_SetByteArrayObj;  
//{ 60  }
//  Tcl_SetDoubleObj = tclStubsPtr^.tcl_SetDoubleObj;  
//{ 61  }
//  Tcl_SetIntObj = tclStubsPtr^.tcl_SetIntObj;  
//{ 62  }
//  Tcl_SetListObj = tclStubsPtr^.tcl_SetListObj;  
//{ 63  }
//  Tcl_SetLongObj = tclStubsPtr^.tcl_SetLongObj;  
//{ 64  }
//  Tcl_SetObjLength = tclStubsPtr^.tcl_SetObjLength;  
//{ 65  }
//  Tcl_SetStringObj = tclStubsPtr^.tcl_SetStringObj;  
//{ 66  }
//  Tcl_AddErrorInfo = tclStubsPtr^.tcl_AddErrorInfo;  
//{ 67  }
//  Tcl_AddObjErrorInfo = tclStubsPtr^.tcl_AddObjErrorInfo;  
//{ 68  }
//  Tcl_AllowExceptions = tclStubsPtr^.tcl_AllowExceptions;  
//{ 69  }
//  Tcl_AppendElement = tclStubsPtr^.tcl_AppendElement;  
//{ 70  }
//  Tcl_AppendResult = tclStubsPtr^.tcl_AppendResult;  
//{ 71  }
//  Tcl_AsyncCreate = tclStubsPtr^.tcl_AsyncCreate;  
//{ 72  }
//  Tcl_AsyncDelete = tclStubsPtr^.tcl_AsyncDelete;  
//{ 73  }
//  Tcl_AsyncInvoke = tclStubsPtr^.tcl_AsyncInvoke;  
//{ 74  }
//  Tcl_AsyncMark = tclStubsPtr^.tcl_AsyncMark;  
//{ 75  }
//  Tcl_AsyncReady = tclStubsPtr^.tcl_AsyncReady;  
//{ 76  }
//  Tcl_BackgroundError = tclStubsPtr^.tcl_BackgroundError;  
//{ 77  }
//  Tcl_Backslash = tclStubsPtr^.tcl_Backslash;  
//{ 78  }
//  Tcl_BadChannelOption = tclStubsPtr^.tcl_BadChannelOption;  
//{ 79  }
//  Tcl_CallWhenDeleted = tclStubsPtr^.tcl_CallWhenDeleted;  
//{ 80  }
//  Tcl_CancelIdleCall = tclStubsPtr^.tcl_CancelIdleCall;  
//{ 81  }
//  Tcl_Close = tclStubsPtr^.tcl_Close;  
//{ 82  }
//  Tcl_CommandComplete = tclStubsPtr^.tcl_CommandComplete;  
//{ 83  }
//  Tcl_Concat = tclStubsPtr^.tcl_Concat;  
//{ 84  }
//  Tcl_ConvertElement = tclStubsPtr^.tcl_ConvertElement;  
//{ 85  }
//  Tcl_ConvertCountedElement = tclStubsPtr^.tcl_ConvertCountedElement;  
//{ 86  }
//  Tcl_CreateAlias = tclStubsPtr^.tcl_CreateAlias;  
//{ 87  }
//  Tcl_CreateAliasObj = tclStubsPtr^.tcl_CreateAliasObj;  
//{ 88  }
//  Tcl_CreateChannel = tclStubsPtr^.tcl_CreateChannel;  
//{ 89  }
//  Tcl_CreateChannelHandler = tclStubsPtr^.tcl_CreateChannelHandler;  
//{ 90  }
//  Tcl_CreateCloseHandler = tclStubsPtr^.tcl_CreateCloseHandler;  
//{ 91  }
//  Tcl_CreateCommand = tclStubsPtr^.tcl_CreateCommand;  
//{ 92  }
//  Tcl_CreateEventSource = tclStubsPtr^.tcl_CreateEventSource;  
//{ 93  }
//  Tcl_CreateExitHandler = tclStubsPtr^.tcl_CreateExitHandler;  
//{ 94  }
//  Tcl_CreateInterp = tclStubsPtr^.tcl_CreateInterp;  
//{ 95  }
//  Tcl_CreateMathFunc = tclStubsPtr^.tcl_CreateMathFunc;  
//{ 96  }
//  Tcl_CreateObjCommand = tclStubsPtr^.tcl_CreateObjCommand;  
//{ 97  }
//  Tcl_CreateSlave = tclStubsPtr^.tcl_CreateSlave;  
//{ 98  }
//  Tcl_CreateTimerHandler = tclStubsPtr^.tcl_CreateTimerHandler;  
//{ 99  }
//  Tcl_CreateTrace = tclStubsPtr^.tcl_CreateTrace;  
//{ 100  }
//  Tcl_DeleteAssocData = tclStubsPtr^.tcl_DeleteAssocData;  
//{ 101  }
//  Tcl_DeleteChannelHandler = tclStubsPtr^.tcl_DeleteChannelHandler;  
//{ 102  }
//  Tcl_DeleteCloseHandler = tclStubsPtr^.tcl_DeleteCloseHandler;  
//{ 103  }
//  Tcl_DeleteCommand = tclStubsPtr^.tcl_DeleteCommand;  
//{ 104  }
//  Tcl_DeleteCommandFromToken = tclStubsPtr^.tcl_DeleteCommandFromToken;  
//{ 105  }
//  Tcl_DeleteEvents = tclStubsPtr^.tcl_DeleteEvents;  
//{ 106  }
//  Tcl_DeleteEventSource = tclStubsPtr^.tcl_DeleteEventSource;  
//{ 107  }
//  Tcl_DeleteExitHandler = tclStubsPtr^.tcl_DeleteExitHandler;  
//{ 108  }
//  Tcl_DeleteHashEntry = tclStubsPtr^.tcl_DeleteHashEntry;  
//{ 109  }
//  Tcl_DeleteHashTable = tclStubsPtr^.tcl_DeleteHashTable;  
//{ 110  }
//  Tcl_DeleteInterp = tclStubsPtr^.tcl_DeleteInterp;  
//{ 111  }
//  Tcl_DetachPids = tclStubsPtr^.tcl_DetachPids;  
//{ 112  }
//  Tcl_DeleteTimerHandler = tclStubsPtr^.tcl_DeleteTimerHandler;  
//{ 113  }
//  Tcl_DeleteTrace = tclStubsPtr^.tcl_DeleteTrace;  
//{ 114  }
//  Tcl_DontCallWhenDeleted = tclStubsPtr^.tcl_DontCallWhenDeleted;  
//{ 115  }
//  Tcl_DoOneEvent = tclStubsPtr^.tcl_DoOneEvent;  
//{ 116  }
//  Tcl_DoWhenIdle = tclStubsPtr^.tcl_DoWhenIdle;  
//{ 117  }
//  Tcl_DStringAppend = tclStubsPtr^.tcl_DStringAppend;  
//{ 118  }
//  Tcl_DStringAppendElement = tclStubsPtr^.tcl_DStringAppendElement;  
//{ 119  }
//  Tcl_DStringEndSublist = tclStubsPtr^.tcl_DStringEndSublist;  
//{ 120  }
//  Tcl_DStringFree = tclStubsPtr^.tcl_DStringFree;  
//{ 121  }
//  Tcl_DStringGetResult = tclStubsPtr^.tcl_DStringGetResult;  
//{ 122  }
//  Tcl_DStringInit = tclStubsPtr^.tcl_DStringInit;  
//{ 123  }
//  Tcl_DStringResult = tclStubsPtr^.tcl_DStringResult;  
//{ 124  }
//  Tcl_DStringSetLength = tclStubsPtr^.tcl_DStringSetLength;  
//{ 125  }
//  Tcl_DStringStartSublist = tclStubsPtr^.tcl_DStringStartSublist;  
//{ 126  }
//  Tcl_Eof = tclStubsPtr^.tcl_Eof;  
//{ 127  }
//  Tcl_ErrnoId = tclStubsPtr^.tcl_ErrnoId;  
//{ 128  }
//  Tcl_ErrnoMsg = tclStubsPtr^.tcl_ErrnoMsg;  
//{ 129  }
//  Tcl_Eval = tclStubsPtr^.tcl_Eval;  
//{ 130  }
//  Tcl_EvalFile = tclStubsPtr^.tcl_EvalFile;  
//{ 131  }
//  Tcl_EvalObj = tclStubsPtr^.tcl_EvalObj;  
//{ 132  }
//  Tcl_EventuallyFree = tclStubsPtr^.tcl_EventuallyFree;  
//{ 133  }
//  Tcl_Exit = tclStubsPtr^.tcl_Exit;  
//{ 134  }
//  Tcl_ExposeCommand = tclStubsPtr^.tcl_ExposeCommand;  
//{ 135  }
//  Tcl_ExprBoolean = tclStubsPtr^.tcl_ExprBoolean;  
//{ 136  }
//  Tcl_ExprBooleanObj = tclStubsPtr^.tcl_ExprBooleanObj;  
//{ 137  }
//  Tcl_ExprDouble = tclStubsPtr^.tcl_ExprDouble;  
//{ 138  }
//  Tcl_ExprDoubleObj = tclStubsPtr^.tcl_ExprDoubleObj;  
//{ 139  }
//  Tcl_ExprLong = tclStubsPtr^.tcl_ExprLong;  
//{ 140  }
//  Tcl_ExprLongObj = tclStubsPtr^.tcl_ExprLongObj;  
//{ 141  }
//  Tcl_ExprObj = tclStubsPtr^.tcl_ExprObj;  
//{ 142  }
//  Tcl_ExprString = tclStubsPtr^.tcl_ExprString;  
//{ 143  }
//  Tcl_Finalize = tclStubsPtr^.tcl_Finalize;  
//{ 144  }
//  Tcl_FindExecutable = tclStubsPtr^.tcl_FindExecutable;  
//{ 145  }
//  Tcl_FirstHashEntry = tclStubsPtr^.tcl_FirstHashEntry;  
//{ 146  }
//  Tcl_Flush = tclStubsPtr^.tcl_Flush;  
//{ 147  }
//  Tcl_FreeResult = tclStubsPtr^.tcl_FreeResult;  
//{ 148  }
//  Tcl_GetAlias = tclStubsPtr^.tcl_GetAlias;  
//{ 149  }
//  Tcl_GetAliasObj = tclStubsPtr^.tcl_GetAliasObj;  
//{ 150  }
//  Tcl_GetAssocData = tclStubsPtr^.tcl_GetAssocData;  
//{ 151  }
//  Tcl_GetChannel = tclStubsPtr^.tcl_GetChannel;  
//{ 152  }
//  Tcl_GetChannelBufferSize = tclStubsPtr^.tcl_GetChannelBufferSize;  
//{ 153  }
//  Tcl_GetChannelHandle = tclStubsPtr^.tcl_GetChannelHandle;  
//{ 154  }
//  Tcl_GetChannelInstanceData = tclStubsPtr^.tcl_GetChannelInstanceData;  
//{ 155  }
//  Tcl_GetChannelMode = tclStubsPtr^.tcl_GetChannelMode;  
//{ 156  }
//  Tcl_GetChannelName = tclStubsPtr^.tcl_GetChannelName;  
//{ 157  }
//  Tcl_GetChannelOption = tclStubsPtr^.tcl_GetChannelOption;  
//{ 158  }
//  Tcl_GetChannelType = tclStubsPtr^.tcl_GetChannelType;  
//{ 159  }
//  Tcl_GetCommandInfo = tclStubsPtr^.tcl_GetCommandInfo;  
//{ 160  }
//  Tcl_GetCommandName = tclStubsPtr^.tcl_GetCommandName;  
//{ 161  }
//  Tcl_GetErrno = tclStubsPtr^.tcl_GetErrno;  
//{ 162  }
//  Tcl_GetHostName = tclStubsPtr^.tcl_GetHostName;  
//{ 163  }
//  Tcl_GetInterpPath = tclStubsPtr^.tcl_GetInterpPath;  
//{ 164  }
//  Tcl_GetMaster = tclStubsPtr^.tcl_GetMaster;  
//{ 165  }
//  Tcl_GetNameOfExecutable = tclStubsPtr^.tcl_GetNameOfExecutable;  
//{ 166  }
//  Tcl_GetObjResult = tclStubsPtr^.tcl_GetObjResult;  
//{$if !defined(_WIN32) && !defined(MAC_OSX_TCL) /* UNIX */}
//{ 167  }
//
//const
//  Tcl_GetOpenFile = tclStubsPtr^.tcl_GetOpenFile;  
//{$endif}
//{ UNIX  }
//{$ifdef MAC_OSX_TCL /* MACOSX */}
//{ 167  }
//
//const
//  Tcl_GetOpenFile = tclStubsPtr^.tcl_GetOpenFile;  
//{$endif}
//{ MACOSX  }
//{ 168  }
//
//const
//  Tcl_GetPathType = tclStubsPtr^.tcl_GetPathType;  
//{ 169  }
//  Tcl_Gets = tclStubsPtr^.tcl_Gets;  
//{ 170  }
//  Tcl_GetsObj = tclStubsPtr^.tcl_GetsObj;  
//{ 171  }
//  Tcl_GetServiceMode = tclStubsPtr^.tcl_GetServiceMode;  
//{ 172  }
//  Tcl_GetSlave = tclStubsPtr^.tcl_GetSlave;  
//{ 173  }
//  Tcl_GetStdChannel = tclStubsPtr^.tcl_GetStdChannel;  
//{ 174  }
//  Tcl_GetStringResult = tclStubsPtr^.tcl_GetStringResult;  
//{ 175  }
//  Tcl_GetVar = tclStubsPtr^.tcl_GetVar;  
//{ 176  }
//  Tcl_GetVar2 = tclStubsPtr^.tcl_GetVar2;  
//{ 177  }
//  Tcl_GlobalEval = tclStubsPtr^.tcl_GlobalEval;  
//{ 178  }
//  Tcl_GlobalEvalObj = tclStubsPtr^.tcl_GlobalEvalObj;  
//{ 179  }
//  Tcl_HideCommand = tclStubsPtr^.tcl_HideCommand;  
//{ 180  }
//  Tcl_Init = tclStubsPtr^.tcl_Init;  
//{ 181  }
//  Tcl_InitHashTable = tclStubsPtr^.tcl_InitHashTable;  
//{ 182  }
//  Tcl_InputBlocked = tclStubsPtr^.tcl_InputBlocked;  
//{ 183  }
//  Tcl_InputBuffered = tclStubsPtr^.tcl_InputBuffered;  
//{ 184  }
//  Tcl_InterpDeleted = tclStubsPtr^.tcl_InterpDeleted;  
//{ 185  }
//  Tcl_IsSafe = tclStubsPtr^.tcl_IsSafe;  
//{ 186  }
//  Tcl_JoinPath = tclStubsPtr^.tcl_JoinPath;  
//{ 187  }
//  Tcl_LinkVar = tclStubsPtr^.tcl_LinkVar;  
//{ Slot 188 is reserved  }
//{ 189  }
//  Tcl_MakeFileChannel = tclStubsPtr^.tcl_MakeFileChannel;  
//{ 190  }
//  Tcl_MakeSafe = tclStubsPtr^.tcl_MakeSafe;  
//{ 191  }
//  Tcl_MakeTcpClientChannel = tclStubsPtr^.tcl_MakeTcpClientChannel;  
//{ 192  }
//  Tcl_Merge = tclStubsPtr^.tcl_Merge;  
//{ 193  }
//  Tcl_NextHashEntry = tclStubsPtr^.tcl_NextHashEntry;  
//{ 194  }
//  Tcl_NotifyChannel = tclStubsPtr^.tcl_NotifyChannel;  
//{ 195  }
//  Tcl_ObjGetVar2 = tclStubsPtr^.tcl_ObjGetVar2;  
//{ 196  }
//  Tcl_ObjSetVar2 = tclStubsPtr^.tcl_ObjSetVar2;  
//{ 197  }
//  Tcl_OpenCommandChannel = tclStubsPtr^.tcl_OpenCommandChannel;  
//{ 198  }
//  Tcl_OpenFileChannel = tclStubsPtr^.tcl_OpenFileChannel;  
//{ 199  }
//  Tcl_OpenTcpClient = tclStubsPtr^.tcl_OpenTcpClient;  
//{ 200  }
//  Tcl_OpenTcpServer = tclStubsPtr^.tcl_OpenTcpServer;  
//{ 201  }
//  Tcl_Preserve = tclStubsPtr^.tcl_Preserve;  
//{ 202  }
//  Tcl_PrintDouble = tclStubsPtr^.tcl_PrintDouble;  
//{ 203  }
//  Tcl_PutEnv = tclStubsPtr^.tcl_PutEnv;  
//{ 204  }
//  Tcl_PosixError = tclStubsPtr^.tcl_PosixError;  
//{ 205  }
//  Tcl_QueueEvent = tclStubsPtr^.tcl_QueueEvent;  
//{ 206  }
//  Tcl_Read = tclStubsPtr^.tcl_Read;  
//{ 207  }
//  Tcl_ReapDetachedProcs = tclStubsPtr^.tcl_ReapDetachedProcs;  
//{ 208  }
//  Tcl_RecordAndEval = tclStubsPtr^.tcl_RecordAndEval;  
//{ 209  }
//  Tcl_RecordAndEvalObj = tclStubsPtr^.tcl_RecordAndEvalObj;  
//{ 210  }
//  Tcl_RegisterChannel = tclStubsPtr^.tcl_RegisterChannel;  
//{ 211  }
//  Tcl_RegisterObjType = tclStubsPtr^.tcl_RegisterObjType;  
//{ 212  }
//  Tcl_RegExpCompile = tclStubsPtr^.tcl_RegExpCompile;  
//{ 213  }
//  Tcl_RegExpExec = tclStubsPtr^.tcl_RegExpExec;  
//{ 214  }
//  Tcl_RegExpMatch = tclStubsPtr^.tcl_RegExpMatch;  
//{ 215  }
//  Tcl_RegExpRange = tclStubsPtr^.tcl_RegExpRange;  
//{ 216  }
//  Tcl_Release = tclStubsPtr^.tcl_Release;  
//{ 217  }
//  Tcl_ResetResult = tclStubsPtr^.tcl_ResetResult;  
//{ 218  }
//  Tcl_ScanElement = tclStubsPtr^.tcl_ScanElement;  
//{ 219  }
//  Tcl_ScanCountedElement = tclStubsPtr^.tcl_ScanCountedElement;  
//{ 220  }
//  Tcl_SeekOld = tclStubsPtr^.tcl_SeekOld;  
//{ 221  }
//  Tcl_ServiceAll = tclStubsPtr^.tcl_ServiceAll;  
//{ 222  }
//  Tcl_ServiceEvent = tclStubsPtr^.tcl_ServiceEvent;  
//{ 223  }
//  Tcl_SetAssocData = tclStubsPtr^.tcl_SetAssocData;  
//{ 224  }
//  Tcl_SetChannelBufferSize = tclStubsPtr^.tcl_SetChannelBufferSize;  
//{ 225  }
//  Tcl_SetChannelOption = tclStubsPtr^.tcl_SetChannelOption;  
//{ 226  }
//  Tcl_SetCommandInfo = tclStubsPtr^.tcl_SetCommandInfo;  
//{ 227  }
//  Tcl_SetErrno = tclStubsPtr^.tcl_SetErrno;  
//{ 228  }
//  Tcl_SetErrorCode = tclStubsPtr^.tcl_SetErrorCode;  
//{ 229  }
//  Tcl_SetMaxBlockTime = tclStubsPtr^.tcl_SetMaxBlockTime;  
//{ 230  }
//  Tcl_SetPanicProc = tclStubsPtr^.tcl_SetPanicProc;  
//{ 231  }
//  Tcl_SetRecursionLimit = tclStubsPtr^.tcl_SetRecursionLimit;  
//{ 232  }
//  Tcl_SetResult = tclStubsPtr^.tcl_SetResult;  
//{ 233  }
//  Tcl_SetServiceMode = tclStubsPtr^.tcl_SetServiceMode;  
//{ 234  }
//  Tcl_SetObjErrorCode = tclStubsPtr^.tcl_SetObjErrorCode;  
//{ 235  }
//  Tcl_SetObjResult = tclStubsPtr^.tcl_SetObjResult;  
//{ 236  }
//  Tcl_SetStdChannel = tclStubsPtr^.tcl_SetStdChannel;  
//{ 237  }
//  Tcl_SetVar = tclStubsPtr^.tcl_SetVar;  
//{ 238  }
//  Tcl_SetVar2 = tclStubsPtr^.tcl_SetVar2;  
//{ 239  }
//  Tcl_SignalId = tclStubsPtr^.tcl_SignalId;  
//{ 240  }
//  Tcl_SignalMsg = tclStubsPtr^.tcl_SignalMsg;  
//{ 241  }
//  Tcl_SourceRCFile = tclStubsPtr^.tcl_SourceRCFile;  
//{ 242  }
//  Tcl_SplitList = tclStubsPtr^.tcl_SplitList;  
//{ 243  }
//  Tcl_SplitPath = tclStubsPtr^.tcl_SplitPath;  
//{ 244  }
//  Tcl_StaticPackage = tclStubsPtr^.tcl_StaticPackage;  
//{ 245  }
//  Tcl_StringMatch = tclStubsPtr^.tcl_StringMatch;  
//{ 246  }
//  Tcl_TellOld = tclStubsPtr^.tcl_TellOld;  
//{ 247  }
//  Tcl_TraceVar = tclStubsPtr^.tcl_TraceVar;  
//{ 248  }
//  Tcl_TraceVar2 = tclStubsPtr^.tcl_TraceVar2;  
//{ 249  }
//  Tcl_TranslateFileName = tclStubsPtr^.tcl_TranslateFileName;  
//{ 250  }
//  Tcl_Ungets = tclStubsPtr^.tcl_Ungets;  
//{ 251  }
//  Tcl_UnlinkVar = tclStubsPtr^.tcl_UnlinkVar;  
//{ 252  }
//  Tcl_UnregisterChannel = tclStubsPtr^.tcl_UnregisterChannel;  
//{ 253  }
//  Tcl_UnsetVar = tclStubsPtr^.tcl_UnsetVar;  
//{ 254  }
//  Tcl_UnsetVar2 = tclStubsPtr^.tcl_UnsetVar2;  
//{ 255  }
//  Tcl_UntraceVar = tclStubsPtr^.tcl_UntraceVar;  
//{ 256  }
//  Tcl_UntraceVar2 = tclStubsPtr^.tcl_UntraceVar2;  
//{ 257  }
//  Tcl_UpdateLinkedVar = tclStubsPtr^.tcl_UpdateLinkedVar;  
//{ 258  }
//  Tcl_UpVar = tclStubsPtr^.tcl_UpVar;  
//{ 259  }
//  Tcl_UpVar2 = tclStubsPtr^.tcl_UpVar2;  
//{ 260  }
//  Tcl_VarEval = tclStubsPtr^.tcl_VarEval;  
//{ 261  }
//  Tcl_VarTraceInfo = tclStubsPtr^.tcl_VarTraceInfo;  
//{ 262  }
//  Tcl_VarTraceInfo2 = tclStubsPtr^.tcl_VarTraceInfo2;  
//{ 263  }
//  Tcl_Write = tclStubsPtr^.tcl_Write;  
//{ 264  }
//  Tcl_WrongNumArgs = tclStubsPtr^.tcl_WrongNumArgs;  
//{ 265  }
//  Tcl_DumpActiveMemory = tclStubsPtr^.tcl_DumpActiveMemory;  
//{ 266  }
//  Tcl_ValidateAllMemory = tclStubsPtr^.tcl_ValidateAllMemory;  
//{ 267  }
//  Tcl_AppendResultVA = tclStubsPtr^.tcl_AppendResultVA;  
//{ 268  }
//  Tcl_AppendStringsToObjVA = tclStubsPtr^.tcl_AppendStringsToObjVA;  
//{ 269  }
//  Tcl_HashStats = tclStubsPtr^.tcl_HashStats;  
//{ 270  }
//  Tcl_ParseVar = tclStubsPtr^.tcl_ParseVar;  
//{ 271  }
//  Tcl_PkgPresent = tclStubsPtr^.tcl_PkgPresent;  
//{ 272  }
//  Tcl_PkgPresentEx = tclStubsPtr^.tcl_PkgPresentEx;  
//{ 273  }
//  Tcl_PkgProvide = tclStubsPtr^.tcl_PkgProvide;  
//{ 274  }
//  Tcl_PkgRequire = tclStubsPtr^.tcl_PkgRequire;  
//{ 275  }
//  Tcl_SetErrorCodeVA = tclStubsPtr^.tcl_SetErrorCodeVA;  
//{ 276  }
//  Tcl_VarEvalVA = tclStubsPtr^.tcl_VarEvalVA;  
//{ 277  }
//  Tcl_WaitPid = tclStubsPtr^.tcl_WaitPid;  
//{ 278  }
//  Tcl_PanicVA = tclStubsPtr^.tcl_PanicVA;  
//{ 279  }
//  Tcl_GetVersion = tclStubsPtr^.tcl_GetVersion;  
//{ 280  }
//  Tcl_InitMemory = tclStubsPtr^.tcl_InitMemory;  
//{ 281  }
//  Tcl_StackChannel = tclStubsPtr^.tcl_StackChannel;  
//{ 282  }
//  Tcl_UnstackChannel = tclStubsPtr^.tcl_UnstackChannel;  
//{ 283  }
//  Tcl_GetStackedChannel = tclStubsPtr^.tcl_GetStackedChannel;  
//{ 284  }
//  Tcl_SetMainLoop = tclStubsPtr^.tcl_SetMainLoop;  
//{ Slot 285 is reserved  }
//{ 286  }
//  Tcl_AppendObjToObj = tclStubsPtr^.tcl_AppendObjToObj;  
//{ 287  }
//  Tcl_CreateEncoding = tclStubsPtr^.tcl_CreateEncoding;  
//{ 288  }
//  Tcl_CreateThreadExitHandler = tclStubsPtr^.tcl_CreateThreadExitHandler;  
//{ 289  }
//  Tcl_DeleteThreadExitHandler = tclStubsPtr^.tcl_DeleteThreadExitHandler;  
//{ 290  }
//  Tcl_DiscardResult = tclStubsPtr^.tcl_DiscardResult;  
//{ 291  }
//  Tcl_EvalEx = tclStubsPtr^.tcl_EvalEx;  
//{ 292  }
//  Tcl_EvalObjv = tclStubsPtr^.tcl_EvalObjv;  
//{ 293  }
//  Tcl_EvalObjEx = tclStubsPtr^.tcl_EvalObjEx;  
//{ 294  }
//  Tcl_ExitThread = tclStubsPtr^.tcl_ExitThread;  
//{ 295  }
//  Tcl_externalToUtf = tclStubsPtr^.tcl_externalToUtf;  
//{ 296  }
//  Tcl_externalToUtfDString = tclStubsPtr^.tcl_externalToUtfDString;  
//{ 297  }
//  Tcl_FinalizeThread = tclStubsPtr^.tcl_FinalizeThread;  
//{ 298  }
//  Tcl_FinalizeNotifier = tclStubsPtr^.tcl_FinalizeNotifier;  
//{ 299  }
//  Tcl_FreeEncoding = tclStubsPtr^.tcl_FreeEncoding;  
//{ 300  }
//  Tcl_GetCurrentThread = tclStubsPtr^.tcl_GetCurrentThread;  
//{ 301  }
//  Tcl_GetEncoding = tclStubsPtr^.tcl_GetEncoding;  
//{ 302  }
//  Tcl_GetEncodingName = tclStubsPtr^.tcl_GetEncodingName;  
//{ 303  }
//  Tcl_GetEncodingNames = tclStubsPtr^.tcl_GetEncodingNames;  
//{ 304  }
//  Tcl_GetIndexFromObjStruct = tclStubsPtr^.tcl_GetIndexFromObjStruct;  
//{ 305  }
//  Tcl_GetThreadData = tclStubsPtr^.tcl_GetThreadData;  
//{ 306  }
//  Tcl_GetVar2Ex = tclStubsPtr^.tcl_GetVar2Ex;  
//{ 307  }
//  Tcl_InitNotifier = tclStubsPtr^.tcl_InitNotifier;  
//{ 308  }
//  Tcl_MutexLock = tclStubsPtr^.tcl_MutexLock;  
//{ 309  }
//  Tcl_MutexUnlock = tclStubsPtr^.tcl_MutexUnlock;  
//{ 310  }
//  Tcl_ConditionNotify = tclStubsPtr^.tcl_ConditionNotify;  
//{ 311  }
//  Tcl_ConditionWait = tclStubsPtr^.tcl_ConditionWait;  
//{ 312  }
//  Tcl_NumUtfChars = tclStubsPtr^.tcl_NumUtfChars;  
//{ 313  }
//  Tcl_ReadChars = tclStubsPtr^.tcl_ReadChars;  
//{ 314  }
//  Tcl_RestoreResult = tclStubsPtr^.tcl_RestoreResult;  
//{ 315  }
//  Tcl_SaveResult = tclStubsPtr^.tcl_SaveResult;  
//{ 316  }
//  Tcl_SetSystemEncoding = tclStubsPtr^.tcl_SetSystemEncoding;  
//{ 317  }
//  Tcl_SetVar2Ex = tclStubsPtr^.tcl_SetVar2Ex;  
//{ 318  }
//  Tcl_ThreadAlert = tclStubsPtr^.tcl_ThreadAlert;  
//{ 319  }
//  Tcl_ThreadQueueEvent = tclStubsPtr^.tcl_ThreadQueueEvent;  
//{ 320  }
//  Tcl_UniCharAtIndex = tclStubsPtr^.tcl_UniCharAtIndex;  
//{ 321  }
//  Tcl_UniCharToLower = tclStubsPtr^.tcl_UniCharToLower;  
//{ 322  }
//  Tcl_UniCharToTitle = tclStubsPtr^.tcl_UniCharToTitle;  
//{ 323  }
//  Tcl_UniCharToUpper = tclStubsPtr^.tcl_UniCharToUpper;  
//{ 324  }
//  Tcl_UniCharToUtf = tclStubsPtr^.tcl_UniCharToUtf;  
//{ 325  }
//  Tcl_UtfAtIndex = tclStubsPtr^.tcl_UtfAtIndex;  
//{ 326  }
//  Tcl_UtfCharComplete = tclStubsPtr^.tcl_UtfCharComplete;  
//{ 327  }
//  Tcl_UtfBackslash = tclStubsPtr^.tcl_UtfBackslash;  
//{ 328  }
//  Tcl_UtfFindFirst = tclStubsPtr^.tcl_UtfFindFirst;  
//{ 329  }
//  Tcl_UtfFindLast = tclStubsPtr^.tcl_UtfFindLast;  
//{ 330  }
//  Tcl_UtfNext = tclStubsPtr^.tcl_UtfNext;  
//{ 331  }
//  Tcl_UtfPrev = tclStubsPtr^.tcl_UtfPrev;  
//{ 332  }
//  Tcl_UtfToexternal = tclStubsPtr^.tcl_UtfToexternal libtclstub8_6;  
//{ 333  }
//  Tcl_UtfToexternalDString = tclStubsPtr^.tcl_UtfToexternalDString;  
//{ 334  }
//  Tcl_UtfToLower = tclStubsPtr^.tcl_UtfToLower;  
//{ 335  }
//  Tcl_UtfToTitle = tclStubsPtr^.tcl_UtfToTitle;  
//{ 336  }
//  Tcl_UtfToUniChar = tclStubsPtr^.tcl_UtfToUniChar;  
//{ 337  }
//  Tcl_UtfToUpper = tclStubsPtr^.tcl_UtfToUpper;  
//{ 338  }
//  Tcl_WriteChars = tclStubsPtr^.tcl_WriteChars;  
//{ 339  }
//  Tcl_WriteObj = tclStubsPtr^.tcl_WriteObj;  
//{ 340  }
//  Tcl_GetString = tclStubsPtr^.tcl_GetString;  
//{ 341  }
//  Tcl_GetDefaultEncodingDir = tclStubsPtr^.tcl_GetDefaultEncodingDir;  
//{ 342  }
//  Tcl_SetDefaultEncodingDir = tclStubsPtr^.tcl_SetDefaultEncodingDir;  
//{ 343  }
//  Tcl_AlertNotifier = tclStubsPtr^.tcl_AlertNotifier;  
//{ 344  }
//  Tcl_ServiceModeHook = tclStubsPtr^.tcl_ServiceModeHook;  
//{ 345  }
//  Tcl_UniCharIsAlnum = tclStubsPtr^.tcl_UniCharIsAlnum;  
//{ 346  }
//  Tcl_UniCharIsAlpha = tclStubsPtr^.tcl_UniCharIsAlpha;  
//{ 347  }
//  Tcl_UniCharIsDigit = tclStubsPtr^.tcl_UniCharIsDigit;  
//{ 348  }
//  Tcl_UniCharIsLower = tclStubsPtr^.tcl_UniCharIsLower;  
//{ 349  }
//  Tcl_UniCharIsSpace = tclStubsPtr^.tcl_UniCharIsSpace;  
//{ 350  }
//  Tcl_UniCharIsUpper = tclStubsPtr^.tcl_UniCharIsUpper;  
//{ 351  }
//  Tcl_UniCharIsWordChar = tclStubsPtr^.tcl_UniCharIsWordChar;  
//{ 352  }
//  Tcl_UniCharLen = tclStubsPtr^.tcl_UniCharLen;  
//{ 353  }
//  Tcl_UniCharNcmp = tclStubsPtr^.tcl_UniCharNcmp;  
//{ 354  }
//  Tcl_UniCharToUtfDString = tclStubsPtr^.tcl_UniCharToUtfDString;  
//{ 355  }
//  Tcl_UtfToUniCharDString = tclStubsPtr^.tcl_UtfToUniCharDString;  
//{ 356  }
//  Tcl_GetRegExpFromObj = tclStubsPtr^.tcl_GetRegExpFromObj;  
//{ 357  }
//  Tcl_EvalTokens = tclStubsPtr^.tcl_EvalTokens;  
//{ 358  }
//  Tcl_FreeParse = tclStubsPtr^.tcl_FreeParse;  
//{ 359  }
//  Tcl_LogCommandInfo = tclStubsPtr^.tcl_LogCommandInfo;  
//{ 360  }
//  Tcl_ParseBraces = tclStubsPtr^.tcl_ParseBraces;  
//{ 361  }
//  Tcl_ParseCommand = tclStubsPtr^.tcl_ParseCommand;  
//{ 362  }
//  Tcl_ParseExpr = tclStubsPtr^.tcl_ParseExpr;  
//{ 363  }
//  Tcl_ParseQuotedString = tclStubsPtr^.tcl_ParseQuotedString;  
//{ 364  }
//  Tcl_ParseVarName = tclStubsPtr^.tcl_ParseVarName;  
//{ 365  }
//  Tcl_GetCwd = tclStubsPtr^.tcl_GetCwd;  
//{ 366  }
//  Tcl_Chdir = tclStubsPtr^.tcl_Chdir;  
//{ 367  }
//  Tcl_Access = tclStubsPtr^.tcl_Access;  
//{ 368  }
//  Tcl_Stat = tclStubsPtr^.tcl_Stat;  
//{ 369  }
//  Tcl_UtfNcmp = tclStubsPtr^.tcl_UtfNcmp;  
//{ 370  }
//  Tcl_UtfNcasecmp = tclStubsPtr^.tcl_UtfNcasecmp;  
//{ 371  }
//  Tcl_StringCaseMatch = tclStubsPtr^.tcl_StringCaseMatch;  
//{ 372  }
//  Tcl_UniCharIsControl = tclStubsPtr^.tcl_UniCharIsControl;  
//{ 373  }
//  Tcl_UniCharIsGraph = tclStubsPtr^.tcl_UniCharIsGraph;  
//{ 374  }
//  Tcl_UniCharIsPrint = tclStubsPtr^.tcl_UniCharIsPrint;  
//{ 375  }
//  Tcl_UniCharIsPunct = tclStubsPtr^.tcl_UniCharIsPunct;  
//{ 376  }
//  Tcl_RegExpExecObj = tclStubsPtr^.tcl_RegExpExecObj;  
//{ 377  }
//  Tcl_RegExpGetInfo = tclStubsPtr^.tcl_RegExpGetInfo;  
//{ 378  }
//  Tcl_NewUnicodeObj = tclStubsPtr^.tcl_NewUnicodeObj;  
//{ 379  }
//  Tcl_SetUnicodeObj = tclStubsPtr^.tcl_SetUnicodeObj;  
//{ 380  }
//  Tcl_GetCharLength = tclStubsPtr^.tcl_GetCharLength;  
//{ 381  }
//  Tcl_GetUniChar = tclStubsPtr^.tcl_GetUniChar;  
//{ 382  }
//  Tcl_GetUnicode = tclStubsPtr^.tcl_GetUnicode;  
//{ 383  }
//  Tcl_GetRange = tclStubsPtr^.tcl_GetRange;  
//{ 384  }
//  Tcl_AppendUnicodeToObj = tclStubsPtr^.tcl_AppendUnicodeToObj;  
//{ 385  }
//  Tcl_RegExpMatchObj = tclStubsPtr^.tcl_RegExpMatchObj;  
//{ 386  }
//  Tcl_SetNotifier = tclStubsPtr^.tcl_SetNotifier;  
//{ 387  }
//  Tcl_GetAllocMutex = tclStubsPtr^.tcl_GetAllocMutex;  
//{ 388  }
//  Tcl_GetChannelNames = tclStubsPtr^.tcl_GetChannelNames;  
//{ 389  }
//  Tcl_GetChannelNamesEx = tclStubsPtr^.tcl_GetChannelNamesEx;  
//{ 390  }
//  Tcl_ProcObjCmd = tclStubsPtr^.tcl_ProcObjCmd;  
//{ 391  }
//  Tcl_ConditionFinalize = tclStubsPtr^.tcl_ConditionFinalize;  
//{ 392  }
//  Tcl_MutexFinalize = tclStubsPtr^.tcl_MutexFinalize;  
//{ 393  }
//  Tcl_CreateThread = tclStubsPtr^.tcl_CreateThread;  
//{ 394  }
//  Tcl_ReadRaw = tclStubsPtr^.tcl_ReadRaw;  
//{ 395  }
//  Tcl_WriteRaw = tclStubsPtr^.tcl_WriteRaw;  
//{ 396  }
//  Tcl_GetTopChannel = tclStubsPtr^.tcl_GetTopChannel;  
//{ 397  }
//  Tcl_ChannelBuffered = tclStubsPtr^.tcl_ChannelBuffered;  
//{ 398  }
//  Tcl_ChannelName = tclStubsPtr^.tcl_ChannelName;  
//{ 399  }
//  Tcl_ChannelVersion = tclStubsPtr^.tcl_ChannelVersion;  
//{ 400  }
//  Tcl_ChannelBlockModeProc = tclStubsPtr^.tcl_ChannelBlockModeProc;  
//{ 401  }
//  Tcl_ChannelCloseProc = tclStubsPtr^.tcl_ChannelCloseProc;  
//{ 402  }
//  Tcl_ChannelClose2Proc = tclStubsPtr^.tcl_ChannelClose2Proc;  
//{ 403  }
//  Tcl_ChannelInputProc = tclStubsPtr^.tcl_ChannelInputProc;  
//{ 404  }
//  Tcl_ChannelOutputProc = tclStubsPtr^.tcl_ChannelOutputProc;  
//{ 405  }
//  Tcl_ChannelSeekProc = tclStubsPtr^.tcl_ChannelSeekProc;  
//{ 406  }
//  Tcl_ChannelSetOptionProc = tclStubsPtr^.tcl_ChannelSetOptionProc;  
//{ 407  }
//  Tcl_ChannelGetOptionProc = tclStubsPtr^.tcl_ChannelGetOptionProc;  
//{ 408  }
//  Tcl_ChannelWatchProc = tclStubsPtr^.tcl_ChannelWatchProc;  
//{ 409  }
//  Tcl_ChannelGetHandleProc = tclStubsPtr^.tcl_ChannelGetHandleProc;  
//{ 410  }
//  Tcl_ChannelFlushProc = tclStubsPtr^.tcl_ChannelFlushProc;  
//{ 411  }
//  Tcl_ChannelHandlerProc = tclStubsPtr^.tcl_ChannelHandlerProc;  
//{ 412  }
//  Tcl_JoinThread = tclStubsPtr^.tcl_JoinThread;  
//{ 413  }
//  Tcl_IsChannelShared = tclStubsPtr^.tcl_IsChannelShared;  
//{ 414  }
//  Tcl_IsChannelRegistered = tclStubsPtr^.tcl_IsChannelRegistered;  
//{ 415  }
//  Tcl_CutChannel = tclStubsPtr^.tcl_CutChannel;  
//{ 416  }
//  Tcl_SpliceChannel = tclStubsPtr^.tcl_SpliceChannel;  
//{ 417  }
//  Tcl_ClearChannelHandlers = tclStubsPtr^.tcl_ClearChannelHandlers;  
//{ 418  }
//  Tcl_IsChannelExisting = tclStubsPtr^.tcl_IsChannelExisting;  
//{ 419  }
//  Tcl_UniCharNcasecmp = tclStubsPtr^.tcl_UniCharNcasecmp;  
//{ 420  }
//  Tcl_UniCharCaseMatch = tclStubsPtr^.tcl_UniCharCaseMatch;  
//{ 421  }
//  Tcl_FindHashEntry = tclStubsPtr^.tcl_FindHashEntry;  
//{ 422  }
//  Tcl_CreateHashEntry = tclStubsPtr^.tcl_CreateHashEntry;  
//{ 423  }
//  Tcl_InitCustomHashTable = tclStubsPtr^.tcl_InitCustomHashTable;  
//{ 424  }
//  Tcl_InitObjHashTable = tclStubsPtr^.tcl_InitObjHashTable;  
//{ 425  }
//  Tcl_CommandTraceInfo = tclStubsPtr^.tcl_CommandTraceInfo;  
//{ 426  }
//  Tcl_TraceCommand = tclStubsPtr^.tcl_TraceCommand;  
//{ 427  }
//  Tcl_UntraceCommand = tclStubsPtr^.tcl_UntraceCommand;  
//{ 428  }
//  Tcl_AttemptAlloc = tclStubsPtr^.tcl_AttemptAlloc;  
//{ 429  }
//  Tcl_AttemptDbCkalloc = tclStubsPtr^.tcl_AttemptDbCkalloc;  
//{ 430  }
//  Tcl_AttemptRealloc = tclStubsPtr^.tcl_AttemptRealloc;  
//{ 431  }
//  Tcl_AttemptDbCkrealloc = tclStubsPtr^.tcl_AttemptDbCkrealloc;  
//{ 432  }
//  Tcl_AttemptSetObjLength = tclStubsPtr^.tcl_AttemptSetObjLength;  
//{ 433  }
//  Tcl_GetChannelThread = tclStubsPtr^.tcl_GetChannelThread;  
//{ 434  }
//  Tcl_GetUnicodeFromObj = tclStubsPtr^.tcl_GetUnicodeFromObj;  
//{ 435  }
//  Tcl_GetMathFuncInfo = tclStubsPtr^.tcl_GetMathFuncInfo;  
//{ 436  }
//  Tcl_ListMathFuncs = tclStubsPtr^.tcl_ListMathFuncs;  
//{ 437  }
//  Tcl_SubstObj = tclStubsPtr^.tcl_SubstObj;  
//{ 438  }
//  Tcl_DetachChannel = tclStubsPtr^.tcl_DetachChannel;  
//{ 439  }
//  Tcl_IsStandardChannel = tclStubsPtr^.tcl_IsStandardChannel;  
//{ 440  }
//  Tcl_FSCopyFile = tclStubsPtr^.tcl_FSCopyFile;  
//{ 441  }
//  Tcl_FSCopyDirectory = tclStubsPtr^.tcl_FSCopyDirectory;  
//{ 442  }
//  Tcl_FSCreateDirectory = tclStubsPtr^.tcl_FSCreateDirectory;  
//{ 443  }
//  Tcl_FSDeleteFile = tclStubsPtr^.tcl_FSDeleteFile;  
//{ 444  }
//  Tcl_FSLoadFile = tclStubsPtr^.tcl_FSLoadFile;  
//{ 445  }
//  Tcl_FSMatchInDirectory = tclStubsPtr^.tcl_FSMatchInDirectory;  
//{ 446  }
//  Tcl_FSLink = tclStubsPtr^.tcl_FSLink;  
//{ 447  }
//  Tcl_FSRemoveDirectory = tclStubsPtr^.tcl_FSRemoveDirectory;  
//{ 448  }
//  Tcl_FSRenameFile = tclStubsPtr^.tcl_FSRenameFile;  
//{ 449  }
//  Tcl_FSLstat = tclStubsPtr^.tcl_FSLstat;  
//{ 450  }
//  Tcl_FSUtime = tclStubsPtr^.tcl_FSUtime;  
//{ 451  }
//  Tcl_FSFileAttrsGet = tclStubsPtr^.tcl_FSFileAttrsGet;  
//{ 452  }
//  Tcl_FSFileAttrsSet = tclStubsPtr^.tcl_FSFileAttrsSet;  
//{ 453  }
//  Tcl_FSFileAttrStrings = tclStubsPtr^.tcl_FSFileAttrStrings;  
//{ 454  }
//  Tcl_FSStat = tclStubsPtr^.tcl_FSStat;  
//{ 455  }
//  Tcl_FSAccess = tclStubsPtr^.tcl_FSAccess;  
//{ 456  }
//  Tcl_FSOpenFileChannel = tclStubsPtr^.tcl_FSOpenFileChannel;  
//{ 457  }
//  Tcl_FSGetCwd = tclStubsPtr^.tcl_FSGetCwd;  
//{ 458  }
//  Tcl_FSChdir = tclStubsPtr^.tcl_FSChdir;  
//{ 459  }
//  Tcl_FSConvertToPathType = tclStubsPtr^.tcl_FSConvertToPathType;  
//{ 460  }
//  Tcl_FSJoinPath = tclStubsPtr^.tcl_FSJoinPath;  
//{ 461  }
//  Tcl_FSSplitPath = tclStubsPtr^.tcl_FSSplitPath;  
//{ 462  }
//  Tcl_FSEqualPaths = tclStubsPtr^.tcl_FSEqualPaths;  
//{ 463  }
//  Tcl_FSGetNormalizedPath = tclStubsPtr^.tcl_FSGetNormalizedPath;  
//{ 464  }
//  Tcl_FSJoinToPath = tclStubsPtr^.tcl_FSJoinToPath;  
//{ 465  }
//  Tcl_FSGetInternalRep = tclStubsPtr^.tcl_FSGetInternalRep;  
//{ 466  }
//  Tcl_FSGetTranslatedPath = tclStubsPtr^.tcl_FSGetTranslatedPath;  
//{ 467  }
//  Tcl_FSEvalFile = tclStubsPtr^.tcl_FSEvalFile;  
//{ 468  }
//  Tcl_FSNewNativePath = tclStubsPtr^.tcl_FSNewNativePath;  
//{ 469  }
//  Tcl_FSGetNativePath = tclStubsPtr^.tcl_FSGetNativePath;  
//{ 470  }
//  Tcl_FSFileSystemInfo = tclStubsPtr^.tcl_FSFileSystemInfo;  
//{ 471  }
//  Tcl_FSPathSeparator = tclStubsPtr^.tcl_FSPathSeparator;  
//{ 472  }
//  Tcl_FSListVolumes = tclStubsPtr^.tcl_FSListVolumes;  
//{ 473  }
//  Tcl_FSRegister = tclStubsPtr^.tcl_FSRegister;  
//{ 474  }
//  Tcl_FSUnregister = tclStubsPtr^.tcl_FSUnregister;  
//{ 475  }
//  Tcl_FSData = tclStubsPtr^.tcl_FSData;  
//{ 476  }
//  Tcl_FSGetTranslatedStringPath = tclStubsPtr^.tcl_FSGetTranslatedStringPath;  
//{ 477  }
//  Tcl_FSGetFileSystemForPath = tclStubsPtr^.tcl_FSGetFileSystemForPath;  
//{ 478  }
//  Tcl_FSGetPathType = tclStubsPtr^.tcl_FSGetPathType;  
//{ 479  }
//  Tcl_OutputBuffered = tclStubsPtr^.tcl_OutputBuffered;  
//{ 480  }
//  Tcl_FSMountsChanged = tclStubsPtr^.tcl_FSMountsChanged;  
//{ 481  }
//  Tcl_EvalTokensStandard = tclStubsPtr^.tcl_EvalTokensStandard;  
//{ 482  }
//  Tcl_GetTime = tclStubsPtr^.tcl_GetTime;  
//{ 483  }
//  Tcl_CreateObjTrace = tclStubsPtr^.tcl_CreateObjTrace;  
//{ 484  }
//  Tcl_GetCommandInfoFromToken = tclStubsPtr^.tcl_GetCommandInfoFromToken;  
//{ 485  }
//  Tcl_SetCommandInfoFromToken = tclStubsPtr^.tcl_SetCommandInfoFromToken;  
//{ 486  }
//  Tcl_DbNewWideIntObj = tclStubsPtr^.tcl_DbNewWideIntObj;  
//{ 487  }
//  Tcl_GetWideIntFromObj = tclStubsPtr^.tcl_GetWideIntFromObj;  
//{ 488  }
//  Tcl_NewWideIntObj = tclStubsPtr^.tcl_NewWideIntObj;  
//{ 489  }
//  Tcl_SetWideIntObj = tclStubsPtr^.tcl_SetWideIntObj;  
//{ 490  }
//  Tcl_AllocStatBuf = tclStubsPtr^.tcl_AllocStatBuf;  
//{ 491  }
//  Tcl_Seek = tclStubsPtr^.tcl_Seek;  
//{ 492  }
//  Tcl_Tell = tclStubsPtr^.tcl_Tell;  
//{ 493  }
//  Tcl_ChannelWideSeekProc = tclStubsPtr^.tcl_ChannelWideSeekProc;  
//{ 494  }
//  Tcl_DictObjPut = tclStubsPtr^.tcl_DictObjPut;  
//{ 495  }
//  Tcl_DictObjGet = tclStubsPtr^.tcl_DictObjGet;  
//{ 496  }
//  Tcl_DictObjRemove = tclStubsPtr^.tcl_DictObjRemove;  
//{ 497  }
//  Tcl_DictObjSize = tclStubsPtr^.tcl_DictObjSize;  
//{ 498  }
//  Tcl_DictObjFirst = tclStubsPtr^.tcl_DictObjFirst;  
//{ 499  }
//  Tcl_DictObjNext = tclStubsPtr^.tcl_DictObjNext;  
//{ 500  }
//  Tcl_DictObjDone = tclStubsPtr^.tcl_DictObjDone;  
//{ 501  }
//  Tcl_DictObjPutKeyList = tclStubsPtr^.tcl_DictObjPutKeyList;  
//{ 502  }
//  Tcl_DictObjRemoveKeyList = tclStubsPtr^.tcl_DictObjRemoveKeyList;  
//{ 503  }
//  Tcl_NewDictObj = tclStubsPtr^.tcl_NewDictObj;  
//{ 504  }
//  Tcl_DbNewDictObj = tclStubsPtr^.tcl_DbNewDictObj;  
//{ 505  }
//  Tcl_RegisterConfig = tclStubsPtr^.tcl_RegisterConfig;  
//{ 506  }
//  Tcl_CreateNamespace = tclStubsPtr^.tcl_CreateNamespace;  
//{ 507  }
//  Tcl_DeleteNamespace = tclStubsPtr^.tcl_DeleteNamespace;  
//{ 508  }
//  Tcl_AppendExportList = tclStubsPtr^.tcl_AppendExportList;  
//{ 509  }
//  Tcl_Export = tclStubsPtr^.tcl_Export;  
//{ 510  }
//  Tcl_Import = tclStubsPtr^.tcl_Import;  
//{ 511  }
//  Tcl_ForgetImport = tclStubsPtr^.tcl_ForgetImport;  
//{ 512  }
//  Tcl_GetCurrentNamespace = tclStubsPtr^.tcl_GetCurrentNamespace;  
//{ 513  }
//  Tcl_GetGlobalNamespace = tclStubsPtr^.tcl_GetGlobalNamespace;  
//{ 514  }
//  Tcl_FindNamespace = tclStubsPtr^.tcl_FindNamespace;  
//{ 515  }
//  Tcl_FindCommand = tclStubsPtr^.tcl_FindCommand;  
//{ 516  }
//  Tcl_GetCommandFromObj = tclStubsPtr^.tcl_GetCommandFromObj;  
//{ 517  }
//  Tcl_GetCommandFullName = tclStubsPtr^.tcl_GetCommandFullName;  
//{ 518  }
//  Tcl_FSEvalFileEx = tclStubsPtr^.tcl_FSEvalFileEx;  
//{ 519  }
//  Tcl_SetExitProc = tclStubsPtr^.tcl_SetExitProc;  
//{ 520  }
//  Tcl_LimitAddHandler = tclStubsPtr^.tcl_LimitAddHandler;  
//{ 521  }
//  Tcl_LimitRemoveHandler = tclStubsPtr^.tcl_LimitRemoveHandler;  
//{ 522  }
//  Tcl_LimitReady = tclStubsPtr^.tcl_LimitReady;  
//{ 523  }
//  Tcl_LimitCheck = tclStubsPtr^.tcl_LimitCheck;  
//{ 524  }
//  Tcl_LimitExceeded = tclStubsPtr^.tcl_LimitExceeded;  
//{ 525  }
//  Tcl_LimitSetCommands = tclStubsPtr^.tcl_LimitSetCommands;  
//{ 526  }
//  Tcl_LimitSetTime = tclStubsPtr^.tcl_LimitSetTime;  
//{ 527  }
//  Tcl_LimitSetGranularity = tclStubsPtr^.tcl_LimitSetGranularity;  
//{ 528  }
//  Tcl_LimitTypeEnabled = tclStubsPtr^.tcl_LimitTypeEnabled;  
//{ 529  }
//  Tcl_LimitTypeExceeded = tclStubsPtr^.tcl_LimitTypeExceeded;  
//{ 530  }
//  Tcl_LimitTypeSet = tclStubsPtr^.tcl_LimitTypeSet;  
//{ 531  }
//  Tcl_LimitTypeReset = tclStubsPtr^.tcl_LimitTypeReset;  
//{ 532  }
//  Tcl_LimitGetCommands = tclStubsPtr^.tcl_LimitGetCommands;  
//{ 533  }
//  Tcl_LimitGetTime = tclStubsPtr^.tcl_LimitGetTime;  
//{ 534  }
//  Tcl_LimitGetGranularity = tclStubsPtr^.tcl_LimitGetGranularity;  
//{ 535  }
//  Tcl_SaveInterpState = tclStubsPtr^.tcl_SaveInterpState;  
//{ 536  }
//  Tcl_RestoreInterpState = tclStubsPtr^.tcl_RestoreInterpState;  
//{ 537  }
//  Tcl_DiscardInterpState = tclStubsPtr^.tcl_DiscardInterpState;  
//{ 538  }
//  Tcl_SetReturnOptions = tclStubsPtr^.tcl_SetReturnOptions;  
//{ 539  }
//  Tcl_GetReturnOptions = tclStubsPtr^.tcl_GetReturnOptions;  
//{ 540  }
//  Tcl_IsEnsemble = tclStubsPtr^.tcl_IsEnsemble;  
//{ 541  }
//  Tcl_CreateEnsemble = tclStubsPtr^.tcl_CreateEnsemble;  
//{ 542  }
//  Tcl_FindEnsemble = tclStubsPtr^.tcl_FindEnsemble;  
//{ 543  }
//  Tcl_SetEnsembleSubcommandList = tclStubsPtr^.tcl_SetEnsembleSubcommandList;  
//{ 544  }
//  Tcl_SetEnsembleMappingDict = tclStubsPtr^.tcl_SetEnsembleMappingDict;  
//{ 545  }
//  Tcl_SetEnsembleUnknownHandler = tclStubsPtr^.tcl_SetEnsembleUnknownHandler;  
//{ 546  }
//  Tcl_SetEnsembleFlags = tclStubsPtr^.tcl_SetEnsembleFlags;  
//{ 547  }
//  Tcl_GetEnsembleSubcommandList = tclStubsPtr^.tcl_GetEnsembleSubcommandList;  
//{ 548  }
//  Tcl_GetEnsembleMappingDict = tclStubsPtr^.tcl_GetEnsembleMappingDict;  
//{ 549  }
//  Tcl_GetEnsembleUnknownHandler = tclStubsPtr^.tcl_GetEnsembleUnknownHandler;  
//{ 550  }
//  Tcl_GetEnsembleFlags = tclStubsPtr^.tcl_GetEnsembleFlags;  
//{ 551  }
//  Tcl_GetEnsembleNamespace = tclStubsPtr^.tcl_GetEnsembleNamespace;  
//{ 552  }
//  Tcl_SetTimeProc = tclStubsPtr^.tcl_SetTimeProc;  
//{ 553  }
//  Tcl_QueryTimeProc = tclStubsPtr^.tcl_QueryTimeProc;  
//{ 554  }
//  Tcl_ChannelThreadActionProc = tclStubsPtr^.tcl_ChannelThreadActionProc;  
//{ 555  }
//  Tcl_NewBignumObj = tclStubsPtr^.tcl_NewBignumObj;  
//{ 556  }
//  Tcl_DbNewBignumObj = tclStubsPtr^.tcl_DbNewBignumObj;  
//{ 557  }
//  Tcl_SetBignumObj = tclStubsPtr^.tcl_SetBignumObj;  
//{ 558  }
//  Tcl_GetBignumFromObj = tclStubsPtr^.tcl_GetBignumFromObj;  
//{ 559  }
//  Tcl_TakeBignumFromObj = tclStubsPtr^.tcl_TakeBignumFromObj;  
//{ 560  }
//  Tcl_TruncateChannel = tclStubsPtr^.tcl_TruncateChannel;  
//{ 561  }
//  Tcl_ChannelTruncateProc = tclStubsPtr^.tcl_ChannelTruncateProc;  
//{ 562  }
//  Tcl_SetChannelErrorInterp = tclStubsPtr^.tcl_SetChannelErrorInterp;  
//{ 563  }
//  Tcl_GetChannelErrorInterp = tclStubsPtr^.tcl_GetChannelErrorInterp;  
//{ 564  }
//  Tcl_SetChannelError = tclStubsPtr^.tcl_SetChannelError;  
//{ 565  }
//  Tcl_GetChannelError = tclStubsPtr^.tcl_GetChannelError;  
//{ 566  }
//  Tcl_InitBignumFromDouble = tclStubsPtr^.tcl_InitBignumFromDouble;  
//{ 567  }
//  Tcl_GetNamespaceUnknownHandler = tclStubsPtr^.tcl_GetNamespaceUnknownHandler;  
//{ 568  }
//  Tcl_SetNamespaceUnknownHandler = tclStubsPtr^.tcl_SetNamespaceUnknownHandler;  
//{ 569  }
//  Tcl_GetEncodingFromObj = tclStubsPtr^.tcl_GetEncodingFromObj;  
//{ 570  }
//  Tcl_GetEncodingSearchPath = tclStubsPtr^.tcl_GetEncodingSearchPath;  
//{ 571  }
//  Tcl_SetEncodingSearchPath = tclStubsPtr^.tcl_SetEncodingSearchPath;  
//{ 572  }
//  Tcl_GetEncodingNameFromEnvironment = tclStubsPtr^.tcl_GetEncodingNameFromEnvironment;  
//{ 573  }
//  Tcl_PkgRequireProc = tclStubsPtr^.tcl_PkgRequireProc;  
//{ 574  }
//  Tcl_AppendObjToErrorInfo = tclStubsPtr^.tcl_AppendObjToErrorInfo;  
//{ 575  }
//  Tcl_AppendLimitedToObj = tclStubsPtr^.tcl_AppendLimitedToObj;  
//{ 576  }
//  Tcl_Format = tclStubsPtr^.tcl_Format;  
//{ 577  }
//  Tcl_AppendFormatToObj = tclStubsPtr^.tcl_AppendFormatToObj;  
//{ 578  }
//  Tcl_ObjPrintf = tclStubsPtr^.tcl_ObjPrintf;  
//{ 579  }
//  Tcl_AppendPrintfToObj = tclStubsPtr^.tcl_AppendPrintfToObj;  
//{ 580  }
//  Tcl_CancelEval = tclStubsPtr^.tcl_CancelEval;  
//{ 581  }
//  Tcl_Canceled = tclStubsPtr^.tcl_Canceled;  
//{ 582  }
//  Tcl_CreatePipe = tclStubsPtr^.tcl_CreatePipe;  
//{ 583  }
//  Tcl_NRCreateCommand = tclStubsPtr^.tcl_NRCreateCommand;  
//{ 584  }
//  Tcl_NREvalObj = tclStubsPtr^.tcl_NREvalObj;  
//{ 585  }
//  Tcl_NREvalObjv = tclStubsPtr^.tcl_NREvalObjv;  
//{ 586  }
//  Tcl_NRCmdSwap = tclStubsPtr^.tcl_NRCmdSwap;  
//{ 587  }
//  Tcl_NRAddCallback = tclStubsPtr^.tcl_NRAddCallback;  
//{ 588  }
//  Tcl_NRCallObjProc = tclStubsPtr^.tcl_NRCallObjProc;  
//{ 589  }
//  Tcl_GetFSDeviceFromStat = tclStubsPtr^.tcl_GetFSDeviceFromStat;  
//{ 590  }
//  Tcl_GetFSInodeFromStat = tclStubsPtr^.tcl_GetFSInodeFromStat;  
//{ 591  }
//  Tcl_GetModeFromStat = tclStubsPtr^.tcl_GetModeFromStat;  
//{ 592  }
//  Tcl_GetLinkCountFromStat = tclStubsPtr^.tcl_GetLinkCountFromStat;  
//{ 593  }
//  Tcl_GetUserIdFromStat = tclStubsPtr^.tcl_GetUserIdFromStat;  
//{ 594  }
//  Tcl_GetGroupIdFromStat = tclStubsPtr^.tcl_GetGroupIdFromStat;  
//{ 595  }
//  Tcl_GetDeviceTypeFromStat = tclStubsPtr^.tcl_GetDeviceTypeFromStat;  
//{ 596  }
//  Tcl_GetAccessTimeFromStat = tclStubsPtr^.tcl_GetAccessTimeFromStat;  
//{ 597  }
//  Tcl_GetModificationTimeFromStat = tclStubsPtr^.tcl_GetModificationTimeFromStat;  
//{ 598  }
//  Tcl_GetChangeTimeFromStat = tclStubsPtr^.tcl_GetChangeTimeFromStat;  
//{ 599  }
//  Tcl_GetSizeFromStat = tclStubsPtr^.tcl_GetSizeFromStat;  
//{ 600  }
//  Tcl_GetBlocksFromStat = tclStubsPtr^.tcl_GetBlocksFromStat;  
//{ 601  }
//  Tcl_GetBlockSizeFromStat = tclStubsPtr^.tcl_GetBlockSizeFromStat;  
//{ 602  }
//  Tcl_SetEnsembleParameterList = tclStubsPtr^.tcl_SetEnsembleParameterList;  
//{ 603  }
//  Tcl_GetEnsembleParameterList = tclStubsPtr^.tcl_GetEnsembleParameterList;  
//{ 604  }
//  Tcl_ParseArgsObjv = tclStubsPtr^.tcl_ParseArgsObjv;  
//{ 605  }
//  Tcl_GetErrorLine = tclStubsPtr^.tcl_GetErrorLine;  
//{ 606  }
//  Tcl_SetErrorLine = tclStubsPtr^.tcl_SetErrorLine;  
//{ 607  }
//  Tcl_TransferResult = tclStubsPtr^.tcl_TransferResult;  
//{ 608  }
//  Tcl_InterpActive = tclStubsPtr^.tcl_InterpActive;  
//{ 609  }
//  Tcl_BackgroundException = tclStubsPtr^.tcl_BackgroundException;  
//{ 610  }
//  Tcl_ZlibDeflate = tclStubsPtr^.tcl_ZlibDeflate;  
//{ 611  }
//  Tcl_ZlibInflate = tclStubsPtr^.tcl_ZlibInflate;  
//{ 612  }
//  Tcl_ZlibCRC32 = tclStubsPtr^.tcl_ZlibCRC32;  
//{ 613  }
//  Tcl_ZlibAdler32 = tclStubsPtr^.tcl_ZlibAdler32;  
//{ 614  }
//  Tcl_ZlibStreamInit = tclStubsPtr^.tcl_ZlibStreamInit;  
//{ 615  }
//  Tcl_ZlibStreamGetCommandName = tclStubsPtr^.tcl_ZlibStreamGetCommandName;  
//{ 616  }
//  Tcl_ZlibStreamEof = tclStubsPtr^.tcl_ZlibStreamEof;  
//{ 617  }
//  Tcl_ZlibStreamChecksum = tclStubsPtr^.tcl_ZlibStreamChecksum;  
//{ 618  }
//  Tcl_ZlibStreamPut = tclStubsPtr^.tcl_ZlibStreamPut;  
//{ 619  }
//  Tcl_ZlibStreamGet = tclStubsPtr^.tcl_ZlibStreamGet;  
//{ 620  }
//  Tcl_ZlibStreamClose = tclStubsPtr^.tcl_ZlibStreamClose;  
//{ 621  }
//  Tcl_ZlibStreamReset = tclStubsPtr^.tcl_ZlibStreamReset;  
//{ 622  }
//  Tcl_SetStartupScript = tclStubsPtr^.tcl_SetStartupScript;  
//{ 623  }
//  Tcl_GetStartupScript = tclStubsPtr^.tcl_GetStartupScript;  
//{ 624  }
//  Tcl_CloseEx = tclStubsPtr^.tcl_CloseEx;  
//{ 625  }
//  Tcl_NRExprObj = tclStubsPtr^.tcl_NRExprObj;  
//{ 626  }
//  Tcl_NRSubstObj = tclStubsPtr^.tcl_NRSubstObj;  
//{ 627  }
//  Tcl_LoadFile = tclStubsPtr^.tcl_LoadFile;  
//{ 628  }
//  Tcl_FindSymbol = tclStubsPtr^.tcl_FindSymbol;  
//{ 629  }
//  Tcl_FSUnloadFile = tclStubsPtr^.tcl_FSUnloadFile;  
//{ 630  }
//  Tcl_ZlibStreamSetCompressionDictionary = tclStubsPtr^.tcl_ZlibStreamSetCompressionDictionary;  
//{ Slot 631 is reserved  }
//{ Slot 632 is reserved  }
//{ Slot 633 is reserved  }
//{ Slot 634 is reserved  }
//{ Slot 635 is reserved  }
//{ Slot 636 is reserved  }
//{ Slot 637 is reserved  }
//{ Slot 638 is reserved  }
//{ Slot 639 is reserved  }
//{ Slot 640 is reserved  }
//{ Slot 641 is reserved  }
//{ Slot 642 is reserved  }
//{ Slot 643 is reserved  }
//{ Slot 644 is reserved  }
//{ Slot 645 is reserved  }
//{ Slot 646 is reserved  }
//{ Slot 647 is reserved  }
//{ Slot 648 is reserved  }
//{ Slot 649 is reserved  }
//{ Slot 650 is reserved  }
//{ Slot 651 is reserved  }
//{ Slot 652 is reserved  }
//{ Slot 653 is reserved  }
//{ Slot 654 is reserved  }
//{ Slot 655 is reserved  }
//{ Slot 656 is reserved  }
//{ Slot 657 is reserved  }
//{ Slot 658 is reserved  }
//{ Slot 659 is reserved  }
//{ Slot 660 is reserved  }
//{ Slot 661 is reserved  }
//{ Slot 662 is reserved  }
//{ Slot 663 is reserved  }
//{ Slot 664 is reserved  }
//{ Slot 665 is reserved  }
//{ Slot 666 is reserved  }
//{ Slot 667 is reserved  }
//{ Slot 668 is reserved  }
//{ Slot 669 is reserved  }
//{ Slot 670 is reserved  }
//{ Slot 671 is reserved  }
//{ Slot 672 is reserved  }
//{ Slot 673 is reserved  }
//{ Slot 674 is reserved  }
//{ Slot 675 is reserved  }
//{ Slot 676 is reserved  }
//{ Slot 677 is reserved  }
//{ Slot 678 is reserved  }
//{ Slot 679 is reserved  }
//{ Slot 680 is reserved  }
//{ Slot 681 is reserved  }
//{ Slot 682 is reserved  }
//{ Slot 683 is reserved  }
//{ Slot 684 is reserved  }
//{ Slot 685 is reserved  }
//{ Slot 686 is reserved  }
//{ Slot 687 is reserved  }
//{ 688  }
//  TclUnusedStubEntry = tclStubsPtr^.tclUnusedStubEntry;  
//{$endif}
//{ defined(USE_TCL_STUBS)  }
//{ !END!: Do not edit above this line.  }
//{$undef TclUnusedStubEntry}
//{$if defined(USE_TCL_STUBS)}
//{$undef Tcl_CreateInterp}
//{$undef Tcl_FindExecutable}
//{$undef Tcl_GetStringResult}
//{$undef Tcl_Init}
//{$undef Tcl_SetPanicProc}
//{$undef Tcl_SetVar}
//{$undef Tcl_ObjSetVar2}
//{$undef Tcl_StaticPackage}
//{ was #define dname(params) para_def_expr }
//{ return type might be wrong }   
//
//function Tcl_CreateInterp : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_GetStringResult(interp : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_Init(interp : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_SetPanicProc(proc : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_SetVar(interp,varName,newValue,flags : longint) : longint;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_ObjSetVar2(interp,part1,part2,newValue,flags : longint) : longint;
//
//{$ifndef __cplusplus}
//{$endif}
//{$endif}
//{$if defined(_WIN32) && defined(UNICODE)}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//
//function Tcl_FindExecutable(arg : longint) : TTcl_FindExecutable;
//
//const
//  Tcl_MainEx = Tcl_MainExW;  
//
//procedure Tcl_MainExW(argc:longint; argv:PPwchar_t; appInitProc:PTcl_AppInitProc; interp:PTcl_Interp);cdecl;external libtclstub8_6;
//{$endif}
//{$undef TCL_STORAGE_CLASS}
//
//const
//  TCL_STORAGE_CLASS = DLLIMPORT;  
//{$undef Tcl_SeekOld}
//{$undef Tcl_TellOld}
//{$undef Tcl_PkgPresent}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//
//function Tcl_PkgPresent(interp,name,version,exact : longint) : longint;
//
//{$undef Tcl_PkgProvide}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_PkgProvide(interp,name,version : longint) : longint;
//
//{$undef Tcl_PkgRequire}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_PkgRequire(interp,name,version,exact : longint) : longint;
//
//{$undef Tcl_GetIndexFromObj}
//{#define Tcl_GetIndexFromObj(interp, objPtr, tablePtr, msg, flags, indexPtr) \ }
//{	Tcl_GetIndexFromObjStruct(interp, objPtr, tablePtr, \ }
//{	sizeof(char *), msg, flags, indexPtr) }
//{$undef Tcl_NewBooleanObj}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_NewBooleanObj(intValue : longint) : longint;
//
//{$undef Tcl_DbNewBooleanObj}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_DbNewBooleanObj(intValue,file,line : longint) : longint;
//
//{$undef Tcl_SetBooleanObj}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_SetBooleanObj(objPtr,intValue : longint) : longint;
//
//{$undef Tcl_SetVar}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_SetVar(interp,varName,newValue,flags : longint) : longint;
//
//{$undef Tcl_UnsetVar}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_UnsetVar(interp,varName,flags : longint) : longint;
//
//{$undef Tcl_GetVar}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_GetVar(interp,varName,flags : longint) : longint;
//
//{$undef Tcl_TraceVar}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_TraceVar(interp,varName,flags,proc,clientData : longint) : longint;
//
//{$undef Tcl_UntraceVar}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_UntraceVar(interp,varName,flags,proc,clientData : longint) : longint;
//
//{$undef Tcl_VarTraceInfo}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_VarTraceInfo(interp,varName,flags,proc,prevClientData : longint) : longint;
//
//{$undef Tcl_UpVar}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_UpVar(interp,frameName,varName,localName,flags : longint) : longint;
//
//{$if defined(USE_TCL_STUBS)}
//{$if defined(_WIN32) && defined(_WIN64)}
//{$undef Tcl_GetTime}
//{ Handle Win64 tk.dll being loaded in Cygwin64.  }
//{$if defined(__CYGWIN__) && defined(TCL_WIDE_INT_IS_LONG)}
//{ On Cygwin64, long is 64-bit while on Win64 long is 32-bit. Therefore
// * we have to make sure that all stub entries on Cygwin64 follow the
// * Win64 signature. Cygwin64 stubbed extensions cannot use those stub
// * entries any more, they should use the 64-bit alternatives where
// * possible. Tcl 9 must find a better solution, but that cannot be done
// * without introducing a binary incompatibility.
//  }
//{ ????????? }
//{	static inline int TclExprLong(Tcl_Interp *interp, const char *string, long *ptr) }
//{	    int intValue; }
//{	    int result = tclStubsPtr->tcl_ExprLong(interp, string, (long *)&intValue); }
//{	    if (result == TCL_OK) *ptr = (long)intValue; }
//{	    return result; }
//{	 }
//{	static inline int TclExprLongObj(Tcl_Interp *interp, Tcl_Obj *obj, long *ptr) }
//{	    int intValue; }
//{	    int result = tclStubsPtr->tcl_ExprLongObj(interp, obj, (long *)&intValue); }
//{	    if (result == TCL_OK) *ptr = (long)intValue; }
//{	    return result; }
//{	 }
//{
// * Deprecated Tcl procedures:
//  }
//{$undef Tcl_EvalObj}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//
//function Tcl_EvalObj(interp,objPtr : longint) : longint;
//
//{$undef Tcl_GlobalEvalObj}
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_GlobalEvalObj(interp,objPtr : longint) : longint;
//
//const
//  Tcl_CreateChild = Tcl_CreateSlave;  
//  Tcl_GetChild = Tcl_GetSlave;  
//  Tcl_GetParent = Tcl_GetMaster;  
//{$endif}
//{ _TCLDECLS  }

// === Konventiert am: 15-4-25 13:25:58 ===


implementation


//{ was #define dname(params) para_def_expr }
//{ return type might be wrong }   
//function Tcl_CreateInterp : longint;
//begin
//  Tcl_CreateInterp:=tclStubsPtr^.(tcl_CreateInterp);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_GetStringResult(interp : longint) : longint;
//begin
//  Tcl_GetStringResult:=tclStubsPtr^.(tcl_GetStringResult(interp));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_Init(interp : longint) : longint;
//begin
//  Tcl_Init:=tclStubsPtr^.(tcl_Init(interp));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_SetPanicProc(proc : longint) : longint;
//begin
//  Tcl_SetPanicProc:=tclStubsPtr^.(tcl_SetPanicProc(proc));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_SetVar(interp,varName,newValue,flags : longint) : longint;
//begin
//  Tcl_SetVar:=tclStubsPtr^.(tcl_SetVar(interp,varName,newValue,flags));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_ObjSetVar2(interp,part1,part2,newValue,flags : longint) : longint;
//begin
//  Tcl_ObjSetVar2:=tclStubsPtr^.(tcl_ObjSetVar2(interp,part1,part2,newValue,flags));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//function Tcl_FindExecutable(arg : longint) : TTcl_FindExecutable;
//begin
//  Tcl_FindExecutable:=TTcl_FindExecutable(Pchar(arg));
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_PkgPresent(interp,name,version,exact : longint) : longint;
//begin
//  Tcl_PkgPresent:=Tcl_PkgPresentEx(interp,name,version,exact,NULL);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_PkgProvide(interp,name,version : longint) : longint;
//begin
//  Tcl_PkgProvide:=Tcl_PkgProvideEx(interp,name,version,NULL);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_PkgRequire(interp,name,version,exact : longint) : longint;
//begin
//  Tcl_PkgRequire:=Tcl_PkgRequireEx(interp,name,version,exact,NULL);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_NewBooleanObj(intValue : longint) : longint;
//begin
//  Tcl_NewBooleanObj:=Tcl_NewIntObj(intValue<>0);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_DbNewBooleanObj(intValue,file,line : longint) : longint;
//begin
//  Tcl_DbNewBooleanObj:=Tcl_DbNewLongObj(intValue<>0,file,line);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_SetBooleanObj(objPtr,intValue : longint) : longint;
//begin
//  Tcl_SetBooleanObj:=Tcl_SetIntObj(objPtr,intValue<>0);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_SetVar(interp,varName,newValue,flags : longint) : longint;
//begin
//  Tcl_SetVar:=Tcl_SetVar2(interp,varName,NULL,newValue,flags);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_UnsetVar(interp,varName,flags : longint) : longint;
//begin
//  Tcl_UnsetVar:=Tcl_UnsetVar2(interp,varName,NULL,flags);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_GetVar(interp,varName,flags : longint) : longint;
//begin
//  Tcl_GetVar:=Tcl_GetVar2(interp,varName,NULL,flags);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_TraceVar(interp,varName,flags,proc,clientData : longint) : longint;
//begin
//  Tcl_TraceVar:=Tcl_TraceVar2(interp,varName,NULL,flags,proc,clientData);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_UntraceVar(interp,varName,flags,proc,clientData : longint) : longint;
//begin
//  Tcl_UntraceVar:=Tcl_UntraceVar2(interp,varName,NULL,flags,proc,clientData);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_VarTraceInfo(interp,varName,flags,proc,prevClientData : longint) : longint;
//begin
//  Tcl_VarTraceInfo:=Tcl_VarTraceInfo2(interp,varName,NULL,flags,proc,prevClientData);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_UpVar(interp,frameName,varName,localName,flags : longint) : longint;
//begin
//  Tcl_UpVar:=Tcl_UpVar2(interp,frameName,varName,NULL,localName,flags);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_EvalObj(interp,objPtr : longint) : longint;
//begin
//  Tcl_EvalObj:=Tcl_EvalObjEx(interp,objPtr,0);
//end;
//
//{ was #define dname(params) para_def_expr }
//{ argument types are unknown }
//{ return type might be wrong }   
//function Tcl_GlobalEvalObj(interp,objPtr : longint) : longint;
//begin
//  Tcl_GlobalEvalObj:=Tcl_EvalObjEx(interp,objPtr,TCL_EVAL_GLOBAL);
//end;
//
//
end.
