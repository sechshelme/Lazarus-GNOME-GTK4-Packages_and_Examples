unit fp_nfd;

interface

const
  {$IFDEF Linux}
  libnfd = 'nfd';
  {$ENDIF}

  {$IFDEF Windows}
  libnfd = 'libnfd.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPnfdu8char_t = ^Pnfdu8char_t;
  Pnfdu8char_t = ^Tnfdu8char_t;
  Tnfdu8char_t = char;

  PPnfdnchar_t = ^Pnfdnchar_t;
  Pnfdnchar_t = ^Tnfdnchar_t;
  Tnfdnchar_t = Tnfdu8char_t;

  PPnfdpathset_t = ^Pnfdpathset_t;
  Pnfdpathset_t = ^Tnfdpathset_t;
  Tnfdpathset_t = pointer;

type
  Tnfdpathsetenum_t = record
    ptr: pointer;
  end;
  Pnfdpathsetenum_t = ^Tnfdpathsetenum_t;

type
  Pnfdfiltersize_t = ^Tnfdfiltersize_t;
  Tnfdfiltersize_t = dword;

type
  Pnfdresult_t = ^Tnfdresult_t;
  Tnfdresult_t = longint;

const
  NFD_ERROR = 0;
  NFD_OKAY = 1;
  NFD_CANCEL = 2;

type
  Tnfdu8filteritem_t = record
    name: Pnfdu8char_t;
    spec: Pnfdu8char_t;
  end;
  Pnfdu8filteritem_t = ^Tnfdu8filteritem_t;

  Pnfdnfilteritem_t = ^Tnfdnfilteritem_t;
  Tnfdnfilteritem_t = Tnfdu8filteritem_t;

const
  NFD_WINDOW_HANDLE_TYPE_UNSET = 0;
  NFD_WINDOW_HANDLE_TYPE_WINDOWS = 1;
  NFD_WINDOW_HANDLE_TYPE_COCOA = 2;
  NFD_WINDOW_HANDLE_TYPE_X11 = 3;
  NFD_WINDOW_HANDLE_TYPE_WAYLAND = 4;

type
  Tnfdwindowhandle_t = record
    _type: Tsize_t;
    handle: pointer;
  end;
  Pnfdwindowhandle_t = ^Tnfdwindowhandle_t;

  Pnfdversion_t = ^Tnfdversion_t;
  Tnfdversion_t = Tsize_t;

  Tnfdopendialogu8args_t = record
    filterList: Pnfdu8filteritem_t;
    filterCount: Tnfdfiltersize_t;
    defaultPath: Pnfdu8char_t;
    parentWindow: Tnfdwindowhandle_t;
  end;
  Pnfdopendialogu8args_t = ^Tnfdopendialogu8args_t;

  Pnfdopendialognargs_t = ^Tnfdopendialognargs_t;
  Tnfdopendialognargs_t = Tnfdopendialogu8args_t;

  Tnfdsavedialogu8args_t = record
    filterList: Pnfdu8filteritem_t;
    filterCount: Tnfdfiltersize_t;
    defaultPath: Pnfdu8char_t;
    defaultName: Pnfdu8char_t;
    parentWindow: Tnfdwindowhandle_t;
  end;
  Pnfdsavedialogu8args_t = ^Tnfdsavedialogu8args_t;

  Pnfdsavedialognargs_t = ^Tnfdsavedialognargs_t;
  Tnfdsavedialognargs_t = Tnfdsavedialogu8args_t;

  Tnfdpickfolderu8args_t = record
    defaultPath: Pnfdu8char_t;
    parentWindow: Tnfdwindowhandle_t;
  end;
  Pnfdpickfolderu8args_t = ^Tnfdpickfolderu8args_t;

  Pnfdpickfoldernargs_t = ^Tnfdpickfoldernargs_t;
  Tnfdpickfoldernargs_t = Tnfdpickfolderu8args_t;

const
  NFD_INTERFACE_VERSION = 1;

procedure NFD_FreePathN(filePath: Pnfdnchar_t); cdecl; external libnfd;
procedure NFD_FreePathU8(filePath: Pnfdu8char_t); cdecl; external libnfd;
function NFD_Init: Tnfdresult_t; cdecl; external libnfd;
procedure NFD_Quit; cdecl; external libnfd;

type
  Pwl_display = type Pointer;

function NFD_SetWaylandDisplay(para1: Pwl_display): Tnfdresult_t; cdecl; external libnfd;
function NFD_OpenDialogN(outPath: PPnfdnchar_t; filterList: Pnfdnfilteritem_t; filterCount: Tnfdfiltersize_t; defaultPath: Pnfdnchar_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_OpenDialogU8(outPath: PPnfdu8char_t; filterList: Pnfdu8filteritem_t; filterCount: Tnfdfiltersize_t; defaultPath: Pnfdu8char_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_OpenDialogN_With_Impl(version: Tnfdversion_t; outPath: PPnfdnchar_t; args: Pnfdopendialognargs_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_OpenDialogU8_With_Impl(version: Tnfdversion_t; outPath: PPnfdu8char_t; args: Pnfdopendialogu8args_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_OpenDialogMultipleN(outPaths: PPnfdpathset_t; filterList: Pnfdnfilteritem_t; filterCount: Tnfdfiltersize_t; defaultPath: Pnfdnchar_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_OpenDialogMultipleU8(outPaths: PPnfdpathset_t; filterList: Pnfdu8filteritem_t; filterCount: Tnfdfiltersize_t; defaultPath: Pnfdu8char_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_OpenDialogMultipleN_With_Impl(version: Tnfdversion_t; outPaths: PPnfdpathset_t; args: Pnfdopendialognargs_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_OpenDialogMultipleU8_With_Impl(version: Tnfdversion_t; outPaths: PPnfdpathset_t; args: Pnfdopendialogu8args_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_SaveDialogN(outPath: PPnfdnchar_t; filterList: Pnfdnfilteritem_t; filterCount: Tnfdfiltersize_t; defaultPath: Pnfdnchar_t; defaultName: Pnfdnchar_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_SaveDialogU8(outPath: PPnfdu8char_t; filterList: Pnfdu8filteritem_t; filterCount: Tnfdfiltersize_t; defaultPath: Pnfdu8char_t; defaultName: Pnfdu8char_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_SaveDialogN_With_Impl(version: Tnfdversion_t; outPath: PPnfdnchar_t; args: Pnfdsavedialognargs_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_SaveDialogU8_With_Impl(version: Tnfdversion_t; outPath: PPnfdu8char_t; args: Pnfdsavedialogu8args_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PickFolderN(outPath: PPnfdnchar_t; defaultPath: Pnfdnchar_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PickFolderU8(outPath: PPnfdu8char_t; defaultPath: Pnfdu8char_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PickFolderN_With_Impl(version: Tnfdversion_t; outPath: PPnfdnchar_t; args: Pnfdpickfoldernargs_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PickFolderU8_With_Impl(version: Tnfdversion_t; outPath: PPnfdu8char_t; args: Pnfdpickfolderu8args_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PickFolderMultipleN(outPaths: PPnfdpathset_t; defaultPath: Pnfdnchar_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PickFolderMultipleU8(outPaths: PPnfdpathset_t; defaultPath: Pnfdu8char_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PickFolderMultipleN_With_Impl(version: Tnfdversion_t; outPaths: PPnfdpathset_t; args: Pnfdpickfoldernargs_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PickFolderMultipleU8_With_Impl(version: Tnfdversion_t; outPaths: PPnfdpathset_t; args: Pnfdpickfolderu8args_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_GetError: pchar; cdecl; external libnfd;
procedure NFD_ClearError; cdecl; external libnfd;

type
  {$ifdef Windows}
  Tnfdpathsetsize_t = int32;
  {$else}
  Tnfdpathsetsize_t = int64;
  {$endif}
  Pnfdpathsetsize_t = ^Tnfdpathsetsize_t;

function NFD_PathSet_GetCount(pathSet: Pnfdpathset_t; count: Pnfdpathsetsize_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PathSet_GetPathN(pathSet: Pnfdpathset_t; index: Tnfdpathsetsize_t; outPath: PPnfdnchar_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PathSet_GetPathU8(pathSet: Pnfdpathset_t; index: Tnfdpathsetsize_t; outPath: PPnfdu8char_t): Tnfdresult_t; cdecl; external libnfd;
procedure NFD_PathSet_FreePathN(filePath: Pnfdnchar_t); cdecl; external libnfd;
procedure NFD_PathSet_FreePathU8(filePath: Pnfdu8char_t); cdecl; external libnfd;
function NFD_PathSet_GetEnum(pathSet: Pnfdpathset_t; outEnumerator: Pnfdpathsetenum_t): Tnfdresult_t; cdecl; external libnfd;
procedure NFD_PathSet_FreeEnum(enumerator: Pnfdpathsetenum_t); cdecl; external libnfd;
function NFD_PathSet_EnumNextN(enumerator: Pnfdpathsetenum_t; outPath: PPnfdnchar_t): Tnfdresult_t; cdecl; external libnfd;
function NFD_PathSet_EnumNextU8(enumerator: Pnfdpathsetenum_t; outPath: PPnfdu8char_t): Tnfdresult_t; cdecl; external libnfd;
procedure NFD_PathSet_Free(pathSet: Pnfdpathset_t); cdecl; external libnfd;

type
  Pnfdchar_t = ^Tnfdchar_t;
  Tnfdchar_t = Tnfdu8char_t;

  Pnfdfilteritem_t = ^Tnfdfilteritem_t;
  Tnfdfilteritem_t = Tnfdu8filteritem_t;


  // === Konventiert am: 30-5-26 17:13:57 ===


function NFD_OpenDialogN_With(outPath: PPnfdnchar_t; args: Pnfdopendialognargs_t): Tnfdresult_t; inline;
function NFD_OpenDialogU8_With(outPath: PPnfdu8char_t; args: Pnfdopendialogu8args_t): Tnfdresult_t; inline;
function NFD_OpenDialogMultipleN_With(outPaths: PPnfdpathset_t; args: Pnfdopendialognargs_t): Tnfdresult_t; inline;
function NFD_OpenDialogMultipleU8_With(outPaths: PPnfdpathset_t; args: Pnfdopendialogu8args_t): Tnfdresult_t; inline;
function NFD_SaveDialogN_With(outPath: PPnfdnchar_t; args: Pnfdsavedialognargs_t): Tnfdresult_t; inline;
function NFD_SaveDialogU8_With(outPath: PPnfdu8char_t; args: Pnfdsavedialogu8args_t): Tnfdresult_t; inline;
function NFD_PickFolderN_With(outPath: PPnfdnchar_t; args: Pnfdpickfoldernargs_t): Tnfdresult_t; inline;
function NFD_PickFolderU8_With(outPath: PPnfdu8char_t; args: Pnfdpickfolderu8args_t): Tnfdresult_t; inline;
function NFD_PickFolderMultipleN_With(outPaths: PPnfdpathset_t; args: Pnfdpickfoldernargs_t): Tnfdresult_t; inline;
function NFD_PickFolderMultipleU8_With(outPaths: PPnfdpathset_t; args: Pnfdpickfolderu8args_t): Tnfdresult_t; inline;


implementation

function NFD_OpenDialogN_With(outPath: PPnfdnchar_t; args: Pnfdopendialognargs_t): Tnfdresult_t;
begin
  Result := NFD_OpenDialogN_With_Impl(NFD_INTERFACE_VERSION, outPath, args);
end;

function NFD_OpenDialogU8_With(outPath: PPnfdu8char_t; args: Pnfdopendialogu8args_t): Tnfdresult_t;
begin
  Result := NFD_OpenDialogU8_With_Impl(NFD_INTERFACE_VERSION, outPath, args);
end;

function NFD_OpenDialogMultipleN_With(outPaths: PPnfdpathset_t; args: Pnfdopendialognargs_t): Tnfdresult_t;
begin
  Result := NFD_OpenDialogMultipleN_With_Impl(NFD_INTERFACE_VERSION, outPaths, args);
end;

function NFD_OpenDialogMultipleU8_With(outPaths: PPnfdpathset_t; args: Pnfdopendialogu8args_t): Tnfdresult_t;
begin
  Result := NFD_OpenDialogMultipleU8_With_Impl(NFD_INTERFACE_VERSION, outPaths, args);
end;

function NFD_SaveDialogN_With(outPath: PPnfdnchar_t; args: Pnfdsavedialognargs_t): Tnfdresult_t;
begin
  Result := NFD_SaveDialogN_With_Impl(NFD_INTERFACE_VERSION, outPath, args);
end;

function NFD_SaveDialogU8_With(outPath: PPnfdu8char_t; args: Pnfdsavedialogu8args_t): Tnfdresult_t;
begin
  Result := NFD_SaveDialogU8_With_Impl(NFD_INTERFACE_VERSION, outPath, args);
end;

function NFD_PickFolderN_With(outPath: PPnfdnchar_t; args: Pnfdpickfoldernargs_t): Tnfdresult_t;
begin
  Result := NFD_PickFolderN_With_Impl(NFD_INTERFACE_VERSION, outPath, args);
end;

function NFD_PickFolderU8_With(outPath: PPnfdu8char_t; args: Pnfdpickfolderu8args_t): Tnfdresult_t;
begin
  Result := NFD_PickFolderU8_With_Impl(NFD_INTERFACE_VERSION, outPath, args);
end;

function NFD_PickFolderMultipleN_With(outPaths: PPnfdpathset_t; args: Pnfdpickfoldernargs_t): Tnfdresult_t;
begin
  Result := NFD_PickFolderMultipleN_With_Impl(NFD_INTERFACE_VERSION, outPaths, args);
end;

function NFD_PickFolderMultipleU8_With(outPaths: PPnfdpathset_t; args: Pnfdpickfolderu8args_t): Tnfdresult_t;
begin
  Result := NFD_PickFolderMultipleU8_With_Impl(NFD_INTERFACE_VERSION, outPaths, args);
end;


end.
