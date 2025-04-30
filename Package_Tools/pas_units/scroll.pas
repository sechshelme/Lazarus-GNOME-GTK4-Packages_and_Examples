unit scroll;

interface

uses
  ncurses, cdk, cdk_config, cdkscreen;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  NUMBERS = True;
  NONUMBERS = False;

type
  PSScroll = ^TSScroll;
  TSScroll = record
    {   SCROLLER_FIELDS; ?????????????????? }
//    numbers: Tboolean;
//    titlehighlight: Tchtype;
//    listWin: PWINDOW;
  end;

  TCDKSCROLL = TSScroll;
  PCDKSCROLL = ^TCDKSCROLL;

function newCDKScroll(para1: PCDKSCREEN; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: longint; para7: pchar; para8: TCDK_CSTRING2; para9: longint; para10: Tboolean;
  para11: Tchtype; para12: Tboolean; para13: Tboolean): PCDKSCROLL; cdecl; external libcdk;
function activateCDKScroll(para1: PCDKSCROLL; para2: Pchtype): longint; cdecl; external libcdk;

procedure setCDKScroll(para1: PCDKSCROLL; para2: TCDK_CSTRING2; para3: longint; para4: Tboolean; para5: Tchtype;
  para6: Tboolean); cdecl; external libcdk;
procedure setCDKScrollPosition(para1: PCDKSCROLL; para2: longint); cdecl; external libcdk;
function getCDKScrollCurrent(para1: PCDKSCROLL): longint; cdecl; external libcdk;
procedure setCDKScrollCurrent(para1: PCDKSCROLL; para2: longint); cdecl; external libcdk;
function getCDKScrollCurrentTop(para1: PCDKSCROLL): longint; cdecl; external libcdk;
procedure setCDKScrollCurrentTop(para1: PCDKSCROLL; para2: longint); cdecl; external libcdk;
function getCDKScrollCurrentItem(para1: PCDKSCROLL): longint; cdecl; external libcdk;
procedure setCDKScrollCurrentItem(para1: PCDKSCROLL; para2: longint); cdecl; external libcdk;
procedure setCDKScrollItems(para1: PCDKSCROLL; para2: TCDK_CSTRING2; para3: longint; para4: Tboolean); cdecl; external libcdk;
function getCDKScrollItems(para1: PCDKSCROLL; para2: PPchar): longint; cdecl; external libcdk;
procedure setCDKScrollHighlight(para1: PCDKSCROLL; para2: Tchtype); cdecl; external libcdk;
function getCDKScrollHighlight(para1: PCDKSCROLL; para2: Tchtype): Tchtype; cdecl; external libcdk;
procedure setCDKScrollBox(para1: PCDKSCROLL; para2: Tboolean); cdecl; external libcdk;
function getCDKScrollBox(para1: PCDKSCROLL): Tboolean; cdecl; external libcdk;

procedure addCDKScrollItem(para1: PCDKSCROLL; para2: pchar); cdecl; external libcdk;
procedure insertCDKScrollItem(para1: PCDKSCROLL; para2: pchar); cdecl; external libcdk;
procedure deleteCDKScrollItem(para1: PCDKSCROLL; para2: longint); cdecl; external libcdk;


// === Konventiert am: 30-4-25 16:55:41 ===


implementation

end.
