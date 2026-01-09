unit cdk_util;

interface

uses
  ctypes, ncurses, cdk, cdk_config, cdkscreen;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure Beep; cdecl; external libcdk;
procedure alignxy(para1: PWINDOW; para2: Plongint; para3: Plongint; para4: longint; para5: longint); cdecl; external libcdk;
function justifyString(para1: longint; para2: longint; para3: longint): longint; cdecl; external libcdk;
procedure popupLabel(para1: PCDKSCREEN; para2: TCDK_CSTRING2; para3: longint); cdecl; external libcdk;
procedure popupLabelAttrib(para1: PCDKSCREEN; para2: TCDK_CSTRING2; para3: longint; para4: Tchtype); cdecl; external libcdk;
function popupDialog(para1: PCDKSCREEN; para2: TCDK_CSTRING2; para3: longint; para4: TCDK_CSTRING2; para5: longint): longint; cdecl; external libcdk;
function getListIndex(para1: PCDKSCREEN; para2: pchar; para3: TCDK_CSTRING2; para4: longint; para5: Tboolean): longint; cdecl; external libcdk;
function getString(para1: PCDKSCREEN; para2: pchar; para3: pchar; para4: pchar): pchar; cdecl; external libcdk;
function viewFile(para1: PCDKSCREEN; para2: pchar; para3: pchar; para4: TCDK_CSTRING2; para5: longint): longint; cdecl; external libcdk;
function selectFile(para1: PCDKSCREEN; para2: pchar): pchar; cdecl; external libcdk;
function viewInfo(para1: PCDKSCREEN; para2: pchar; para3: TCDK_CSTRING2; para4: longint; para5: TCDK_CSTRING2; para6: longint; para7: Tboolean): longint; cdecl; external libcdk;
procedure sortList(para1: PCDK_CSTRING; para2: longint); cdecl; external libcdk;
function CDKreadFile(para1: pchar; para2: PPPchar): longint; cdecl; external libcdk;
procedure stripWhiteSpace(para1: TEStripType; para2: pchar); cdecl; external libcdk;
function CDKsplitString(para1: pchar; para2: longint): PPChar; cdecl; external libcdk;
function CDKallocStrings(para1: PPPchar; para2: pchar; para3: dword; para4: dword): dword; cdecl; external libcdk;
function CDKcountStrings(para1: TCDK_CSTRING2): dword; cdecl; external libcdk;
procedure CDKfreeStrings(para1: PPchar); cdecl; external libcdk;
procedure CDKfreeChtypes(para1: PPchtype); cdecl; external libcdk;
function intlen(para1: longint): longint; cdecl; external libcdk;
function CDKgetDirectoryContents(para1: pchar; para2: PPPchar): longint; cdecl; external libcdk;
function searchList(para1: TCDK_CSTRING2; para2: longint; para3: pchar): longint; cdecl; external libcdk;
function baseName(para1: pchar): pchar; cdecl; external libcdk;
function dirName(para1: pchar): pchar; cdecl; external libcdk;
procedure freeChar(para1: pchar); cdecl; external libcdk;
procedure freeChtype(para1: Pchtype); cdecl; external libcdk;
procedure freeCharList(para1: PPchar; para2: dword); cdecl; external libcdk;
procedure freeChtypeList(para1: PPchtype; para2: dword); cdecl; external libcdk;
procedure cleanChar(para1: pchar; para2: longint; para3: char); cdecl; external libcdk;
procedure cleanChtype(para1: Pchtype; para2: longint; para3: Tchtype); cdecl; external libcdk;
function chtype2Char(para1: Pchtype): pchar; cdecl; external libcdk;
function chtype2String(para1: Pchtype): pchar; cdecl; external libcdk;
function char2Chtype(para1: pchar; para2: Plongint; para3: Plongint): Pchtype; cdecl; external libcdk;
function cmpStrChstr(para1: pchar; para2: Pchtype): longint; cdecl; external libcdk;
procedure chstrncpy(para1: pchar; para2: Pchtype; para3: longint); cdecl; external libcdk;
function char2DisplayType(para1: pchar): TEDisplayType; cdecl; external libcdk;
function isHiddenDisplayType(para1: TEDisplayType): Tboolean; cdecl; external libcdk;
function filterByDisplayType(para1: TEDisplayType; para2: Tchtype): longint; cdecl; external libcdk;
function copyChtype(para1: Pchtype): Pchtype; cdecl; external libcdk;
function copyChar(para1: pchar): pchar; cdecl; external libcdk;
function copyCharList(para1: PPchar): PPChar; cdecl; external libcdk;
function copyChtypeList(para1: PPchtype): PPchtype; cdecl; external libcdk;
function chlen(para1: Pchtype): longint; cdecl; external libcdk;
function lenCharList(para1: PPchar): longint; cdecl; external libcdk;
function lenChtypeList(para1: PPchtype): longint; cdecl; external libcdk;
function mode2Filetype(para1: Tmode_t): longint; cdecl; external libcdk;
function mode2Char(para1: pchar; para2: Tmode_t): longint; cdecl; external libcdk;
function checkForLink(para1: pchar; para2: pchar): longint; cdecl; external libcdk;
function setWidgetDimension(para1: longint; para2: longint; para3: longint): longint; cdecl; external libcdk;
procedure eraseCursesWindow(para1: PWINDOW); cdecl; external libcdk;
procedure deleteCursesWindow(para1: PWINDOW); cdecl; external libcdk;
procedure moveCursesWindow(para1: PWINDOW; para2: longint; para3: longint); cdecl; external libcdk;
function floorCDK(para1: double): longint; cdecl; external libcdk;
function ceilCDK(para1: double): longint; cdecl; external libcdk;

// === Konventiert am: 30-4-25 18:12:16 ===


implementation



end.
