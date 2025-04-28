unit newt;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  libnewt = 'newt';
  {$ENDIF}

  {$IFDEF mswindows}
  libnewt = 'newt';
  {$ENDIF}

  {$IFDEF darwin}
  libnewt = 'newt.dylib'; // ???
  {$ENDIF}

type
  Tva_list = Pointer;

  // ===============

const
  NEWT_COLORSET_ROOT = 2;
  NEWT_COLORSET_BORDER = 3;
  NEWT_COLORSET_WINDOW = 4;
  NEWT_COLORSET_SHADOW = 5;
  NEWT_COLORSET_TITLE = 6;
  NEWT_COLORSET_BUTTON = 7;
  NEWT_COLORSET_ACTBUTTON = 8;
  NEWT_COLORSET_CHECKBOX = 9;
  NEWT_COLORSET_ACTCHECKBOX = 10;
  NEWT_COLORSET_ENTRY = 11;
  NEWT_COLORSET_LABEL = 12;
  NEWT_COLORSET_LISTBOX = 13;
  NEWT_COLORSET_ACTLISTBOX = 14;
  NEWT_COLORSET_TEXTBOX = 15;
  NEWT_COLORSET_ACTTEXTBOX = 16;
  NEWT_COLORSET_HELPLINE = 17;
  NEWT_COLORSET_ROOTTEXT = 18;
  NEWT_COLORSET_EMPTYSCALE = 19;
  NEWT_COLORSET_FULLSCALE = 20;
  NEWT_COLORSET_DISENTRY = 21;
  NEWT_COLORSET_COMPACTBUTTON = 22;
  NEWT_COLORSET_ACTSELLISTBOX = 23;
  NEWT_COLORSET_SELLISTBOX = 24;

function NEWT_COLORSET_CUSTOM(x: longint): longint;

const
  NEWT_ARG_LAST = -(100000);
  NEWT_ARG_APPEND = -(1);

type
  TnewtColors = record
    rootFg: pchar;
    rootBg: pchar;
    borderFg: pchar;
    borderBg: pchar;
    windowFg: pchar;
    windowBg: pchar;
    shadowFg: pchar;
    shadowBg: pchar;
    titleFg: pchar;
    titleBg: pchar;
    buttonFg: pchar;
    buttonBg: pchar;
    actButtonFg: pchar;
    actButtonBg: pchar;
    checkboxFg: pchar;
    checkboxBg: pchar;
    actCheckboxFg: pchar;
    actCheckboxBg: pchar;
    entryFg: pchar;
    entryBg: pchar;
    labelFg: pchar;
    labelBg: pchar;
    listboxFg: pchar;
    listboxBg: pchar;
    actListboxFg: pchar;
    actListboxBg: pchar;
    textboxFg: pchar;
    textboxBg: pchar;
    actTextboxFg: pchar;
    actTextboxBg: pchar;
    helpLineFg: pchar;
    helpLineBg: pchar;
    rootTextFg: pchar;
    rootTextBg: pchar;
    emptyScale: pchar;
    fullScale: pchar;
    disabledEntryFg: pchar;
    disabledEntryBg: pchar;
    compactButtonFg: pchar;
    compactButtonBg: pchar;
    actSelListboxFg: pchar;
    actSelListboxBg: pchar;
    selListboxFg: pchar;
    selListboxBg: pchar;
  end;
  PnewtColors = ^TnewtColors;

type
  TnewtFlagsSense = longint;

const
  NEWT_FLAGS_SET = 0;
  NEWT_FLAGS_RESET = 1;
  NEWT_FLAGS_TOGGLE = 2;

  NEWT_FLAG_RETURNEXIT = 1 shl 0;
  NEWT_FLAG_HIDDEN = 1 shl 1;
  NEWT_FLAG_SCROLL = 1 shl 2;
  NEWT_FLAG_DISABLED = 1 shl 3;
  NEWT_FLAG_NOSCROLL = 1 shl 4; // /* OBSOLETE #define NEWT_FLAG_NOSCROLL   (1 << 4)  for listboxes */
  NEWT_FLAG_BORDER = 1 shl 5;
  NEWT_FLAG_WRAP = 1 shl 6;
  NEWT_FLAG_NOF12 = 1 shl 7;
  NEWT_FLAG_MULTIPLE = 1 shl 8;
  NEWT_FLAG_SELECTED = 1 shl 9;
  NEWT_FLAG_CHECKBOX = 1 shl 10;
  NEWT_FLAG_PASSWORD = 1 shl 11;
  NEWT_FLAG_SHOWCURSOR = 1 shl 12;
  NEWT_FD_READ = 1 shl 0;
  NEWT_FD_WRITE = 1 shl 1;
  NEWT_FD_EXCEPT = 1 shl 2;
  NEWT_CHECKBOXTREE_UNSELECTABLE = 1 shl 12;
  NEWT_CHECKBOXTREE_HIDE_BOX = 1 shl 13;
  NEWT_CHECKBOXTREE_COLLAPSED = '\0';
  NEWT_CHECKBOXTREE_EXPANDED = '\1';
  NEWT_CHECKBOXTREE_UNSELECTED = ' ';
  NEWT_CHECKBOXTREE_SELECTED = '*';

  NEWT_LISTBOX_RETURNEXIT = NEWT_FLAG_RETURNEXIT;
  NEWT_ENTRY_SCROLL = NEWT_FLAG_SCROLL;
  NEWT_ENTRY_HIDDEN = NEWT_FLAG_HIDDEN;
  NEWT_ENTRY_RETURNEXIT = NEWT_FLAG_RETURNEXIT;
  NEWT_ENTRY_DISABLED = NEWT_FLAG_DISABLED;
  NEWT_TEXTBOX_WRAP = NEWT_FLAG_WRAP;
  NEWT_TEXTBOX_SCROLL = NEWT_FLAG_SCROLL;
  NEWT_FORM_NOF12 = NEWT_FLAG_NOF12;

type
  PnewtComponent = ^TnewtComponent;
  TnewtComponent = record
  end;

var
  newtDefaultColorPalette: TnewtColors; cvar;external libnewt;

type
  TnewtCallback = procedure(para1: TnewtComponent; para2: pointer); cdecl;
  TnewtSuspendCallback = procedure(Data: pointer); cdecl;

function newtInit: longint; cdecl; external libnewt;
function newtFinished: longint; cdecl; external libnewt;
procedure newtCls; cdecl; external libnewt;
procedure newtResizeScreen(redraw: longint); cdecl; external libnewt;
procedure newtWaitForKey; cdecl; external libnewt;
procedure newtClearKeyBuffer; cdecl; external libnewt;
procedure newtDelay(usecs: dword); cdecl; external libnewt;
function newtOpenWindow(left: longint; top: longint; Width: dword; Height: dword; title: pchar): longint; cdecl; external libnewt;
function newtCenteredWindow(Width: dword; Height: dword; title: pchar): longint; cdecl; external libnewt;
procedure newtPopWindow; cdecl; external libnewt;
procedure newtPopWindowNoRefresh; cdecl; external libnewt;
procedure newtSetColors(colors: TnewtColors); cdecl; external libnewt;
procedure newtSetColor(colorset: longint; fg: pchar; bg: pchar); cdecl; external libnewt;
procedure newtRefresh; cdecl; external libnewt;
procedure newtSuspend; cdecl; external libnewt;
procedure newtSetSuspendCallback(cb: TnewtSuspendCallback; Data: pointer); cdecl; external libnewt;
procedure newtSetHelpCallback(cb: TnewtCallback); cdecl; external libnewt;
function newtResume: longint; cdecl; external libnewt;
procedure newtPushHelpLine(Text: pchar); cdecl; external libnewt;
procedure newtRedrawHelpLine; cdecl; external libnewt;
procedure newtPopHelpLine; cdecl; external libnewt;
procedure newtDrawRootText(col: longint; row: longint; Text: pchar); cdecl; external libnewt;
procedure newtBell; cdecl; external libnewt;
procedure newtCursorOff; cdecl; external libnewt;
procedure newtCursorOn; cdecl; external libnewt;
function newtCompactButton(left: longint; top: longint; Text: pchar): TnewtComponent; cdecl; external libnewt;
function newtButton(left: longint; top: longint; Text: pchar): TnewtComponent; cdecl; external libnewt;
function newtCheckbox(left: longint; top: longint; Text: pchar; defValue: char; seq: pchar;
  Result: pchar): TnewtComponent; cdecl; external libnewt;
function newtCheckboxGetValue(co: TnewtComponent): char; cdecl; external libnewt;
procedure newtCheckboxSetValue(co: TnewtComponent; Value: char); cdecl; external libnewt;
procedure newtCheckboxSetFlags(co: TnewtComponent; flags: longint; sense: TnewtFlagsSense); cdecl; external libnewt;
function newtRadiobutton(left: longint; top: longint; Text: pchar; isDefault: longint; prevButton: TnewtComponent): TnewtComponent; cdecl; external libnewt;
function newtRadioGetCurrent(setMember: TnewtComponent): TnewtComponent; cdecl; external libnewt;
procedure newtRadioSetCurrent(setMember: TnewtComponent); cdecl; external libnewt;
procedure newtGetScreenSize(cols: Plongint; rows: Plongint); cdecl; external libnewt;
function newtLabel(left: longint; top: longint; Text: pchar): TnewtComponent; cdecl; external libnewt;
procedure newtLabelSetText(co: TnewtComponent; Text: pchar); cdecl; external libnewt;
procedure newtLabelSetColors(co: TnewtComponent; colorset: longint); cdecl; external libnewt;
function newtVerticalScrollbar(left: longint; top: longint; Height: longint; normalColorset: longint; thumbColorset: longint): TnewtComponent; cdecl; external libnewt;
procedure newtScrollbarSet(co: TnewtComponent; where: longint; total: longint); cdecl; external libnewt;
procedure newtScrollbarSetColors(co: TnewtComponent; normal: longint; thumb: longint); cdecl; external libnewt;
function newtListbox(left: longint; top: longint; Height: longint; flags: longint): TnewtComponent; cdecl; external libnewt;
function newtListboxGetCurrent(co: TnewtComponent): pointer; cdecl; external libnewt;
procedure newtListboxSetCurrent(co: TnewtComponent; num: longint); cdecl; external libnewt;
procedure newtListboxSetCurrentByKey(co: TnewtComponent; key: pointer); cdecl; external libnewt;
procedure newtListboxSetEntry(co: TnewtComponent; num: longint; Text: pchar); cdecl; external libnewt;
procedure newtListboxSetWidth(co: TnewtComponent; Width: longint); cdecl; external libnewt;
procedure newtListboxSetData(co: TnewtComponent; num: longint; Data: pointer); cdecl; external libnewt;
function newtListboxAppendEntry(co: TnewtComponent; Text: pchar; Data: pointer): longint; cdecl; external libnewt;
function newtListboxInsertEntry(co: TnewtComponent; Text: pchar; Data: pointer; key: pointer): longint; cdecl; external libnewt;
function newtListboxDeleteEntry(co: TnewtComponent; Data: pointer): longint; cdecl; external libnewt;
procedure newtListboxClear(co: TnewtComponent); cdecl; external libnewt;
procedure newtListboxGetEntry(co: TnewtComponent; num: longint; Text: PPchar; Data: Ppointer); cdecl; external libnewt;
function newtListboxGetSelection(co: TnewtComponent; numitems: Plongint): PPointer; cdecl; external libnewt;
procedure newtListboxClearSelection(co: TnewtComponent); cdecl; external libnewt;
procedure newtListboxSelectItem(co: TnewtComponent; key: pointer; sense: TnewtFlagsSense); cdecl; external libnewt;
function newtListboxItemCount(co: TnewtComponent): longint; cdecl; external libnewt;
function newtCheckboxTree(left: longint; top: longint; Height: longint; flags: longint): TnewtComponent; cdecl; external libnewt;
function newtCheckboxTreeMulti(left: longint; top: longint; Height: longint; seq: pchar; flags: longint): TnewtComponent; cdecl; external libnewt;
function newtCheckboxTreeGetSelection(co: TnewtComponent; numitems: Plongint): PPointer; cdecl; external libnewt;
function newtCheckboxTreeGetCurrent(co: TnewtComponent): pointer; cdecl; external libnewt;
procedure newtCheckboxTreeSetCurrent(co: TnewtComponent; item: pointer); cdecl; external libnewt;
function newtCheckboxTreeGetMultiSelection(co: TnewtComponent; numitems: Plongint; seqnum: char): PPointer; cdecl; external libnewt;
function newtCheckboxTreeAddItem(co: TnewtComponent; Text: pchar; Data: pointer; flags: longint; index: longint): longint; cdecl; varargs; external libnewt;
function newtCheckboxTreeAddArray(co: TnewtComponent; Text: pchar; Data: pointer; flags: longint; indexes: Plongint): longint; cdecl; external libnewt;
function newtCheckboxTreeFindItem(co: TnewtComponent; Data: pointer): Plongint; cdecl; external libnewt;
procedure newtCheckboxTreeSetEntry(co: TnewtComponent; Data: pointer; Text: pchar); cdecl; external libnewt;
procedure newtCheckboxTreeSetWidth(co: TnewtComponent; Width: longint); cdecl; external libnewt;
function newtCheckboxTreeGetEntryValue(co: TnewtComponent; Data: pointer): char; cdecl; external libnewt;
procedure newtCheckboxTreeSetEntryValue(co: TnewtComponent; Data: pointer; Value: char); cdecl; external libnewt;
function newtTextboxReflowed(left: longint; top: longint; Text: pchar; Width: longint; flexDown: longint;
  flexUp: longint; flags: longint): TnewtComponent; cdecl; external libnewt;
function newtTextbox(left: longint; top: longint; Width: longint; Height: longint; flags: longint): TnewtComponent; cdecl; external libnewt;
procedure newtTextboxSetText(co: TnewtComponent; Text: pchar); cdecl; external libnewt;
procedure newtTextboxSetHeight(co: TnewtComponent; Height: longint); cdecl; external libnewt;
function newtTextboxGetNumLines(co: TnewtComponent): longint; cdecl; external libnewt;
procedure newtTextboxSetColors(co: TnewtComponent; normal: longint; active: longint); cdecl; external libnewt;
function newtReflowText(Text: pchar; Width: longint; flexDown: longint; flexUp: longint; actualWidth: Plongint;
  actualHeight: Plongint): pchar; cdecl; external libnewt;

const
  NEWT_EXIT_HOTKEY = 0;
  NEWT_EXIT_COMPONENT = 1;
  NEWT_EXIT_FDREADY = 2;
  NEWT_EXIT_TIMER = 3;
  NEWT_EXIT_ERROR = 4;

type
  TnewtExitStruct = record
    reason: longint;
    u: record
      case longint of
        0: (watch: longint);
        1: (key: longint);
        2: (co: TnewtComponent);
      end;
  end;
  PnewtExitStruct = ^TnewtExitStruct;

function newtForm(vertBar: TnewtComponent; helpTag: pointer; flags: longint): TnewtComponent; cdecl; external libnewt;
procedure newtFormSetTimer(form: TnewtComponent; millisecs: longint); cdecl; external libnewt;
procedure newtFormWatchFd(form: TnewtComponent; fd: longint; fdFlags: longint); cdecl; external libnewt;
procedure newtFormSetSize(co: TnewtComponent); cdecl; external libnewt;
function newtFormGetCurrent(co: TnewtComponent): TnewtComponent; cdecl; external libnewt;
procedure newtFormSetBackground(co: TnewtComponent; color: longint); cdecl; external libnewt;
procedure newtFormSetCurrent(co: TnewtComponent; subco: TnewtComponent); cdecl; external libnewt;
procedure newtFormAddComponent(form: TnewtComponent; co: TnewtComponent); cdecl; external libnewt;
procedure newtFormAddComponents(form: TnewtComponent); cdecl; varargs; external libnewt;
procedure newtFormSetHeight(co: TnewtComponent; Height: longint); cdecl; external libnewt;
procedure newtFormSetWidth(co: TnewtComponent; Width: longint); cdecl; external libnewt;
function newtRunForm(form: TnewtComponent): TnewtComponent; cdecl; external libnewt;
procedure newtFormRun(co: TnewtComponent; es: PnewtExitStruct); cdecl; external libnewt;
procedure newtDrawForm(form: TnewtComponent); cdecl; external libnewt;
procedure newtFormAddHotKey(co: TnewtComponent; key: longint); cdecl; external libnewt;
function newtFormGetScrollPosition(co: TnewtComponent): longint; cdecl; external libnewt;
procedure newtFormSetScrollPosition(co: TnewtComponent; position: longint); cdecl; external libnewt;

type
  TnewtEntryFilter = function(entry: TnewtComponent; Data: pointer; ch: longint; cursor: longint): longint; cdecl;

function newtEntry(left: longint; top: longint; initialValue: pchar; Width: longint; resultPtr: PPchar;
  flags: longint): TnewtComponent; cdecl; external libnewt;
procedure newtEntrySet(co: TnewtComponent; Value: pchar; cursorAtEnd: longint); cdecl; external libnewt;
procedure newtEntrySetFilter(co: TnewtComponent; filter: TnewtEntryFilter; Data: pointer); cdecl; external libnewt;
function newtEntryGetValue(co: TnewtComponent): pchar; cdecl; external libnewt;
procedure newtEntrySetFlags(co: TnewtComponent; flags: longint; sense: TnewtFlagsSense); cdecl; external libnewt;
procedure newtEntrySetColors(co: TnewtComponent; normal: longint; disabled: longint); cdecl; external libnewt;
function newtEntryGetCursorPosition(co: TnewtComponent): longint; cdecl; external libnewt;
procedure newtEntrySetCursorPosition(co: TnewtComponent; position: longint); cdecl; external libnewt;
function newtScale(left: longint; top: longint; Width: longint; fullValue: int64): TnewtComponent; cdecl; external libnewt;
procedure newtScaleSet(co: TnewtComponent; amount: qword); cdecl; external libnewt;
procedure newtScaleSetColors(co: TnewtComponent; empty: longint; full: longint); cdecl; external libnewt;
procedure newtComponentAddCallback(co: TnewtComponent; f: TnewtCallback; Data: pointer); cdecl; external libnewt;
procedure newtComponentTakesFocus(co: TnewtComponent; val: longint); cdecl; external libnewt;
procedure newtComponentGetPosition(co: TnewtComponent; left: Plongint; top: Plongint); cdecl; external libnewt;
procedure newtComponentGetSize(co: TnewtComponent; Width: Plongint; Height: Plongint); cdecl; external libnewt;
procedure newtComponentAddDestroyCallback(co: TnewtComponent; f: TnewtCallback; Data: pointer); cdecl; external libnewt;
procedure newtFormDestroy(form: TnewtComponent); cdecl; external libnewt;
procedure newtComponentDestroy(co: TnewtComponent); cdecl; external libnewt;

const
  NEWT_KEY_TAB = 9;
  NEWT_KEY_ENTER = 13;
  NEWT_KEY_SUSPEND = 26;
  NEWT_KEY_ESCAPE = 27;
  NEWT_KEY_EXTRA_BASE = $8000;
  NEWT_KEY_UP = NEWT_KEY_EXTRA_BASE + 1;
  NEWT_KEY_DOWN = NEWT_KEY_EXTRA_BASE + 2;
  NEWT_KEY_LEFT = NEWT_KEY_EXTRA_BASE + 4;
  NEWT_KEY_RIGHT = NEWT_KEY_EXTRA_BASE + 5;
  NEWT_KEY_BKSPC = NEWT_KEY_EXTRA_BASE + 6;
  NEWT_KEY_DELETE = NEWT_KEY_EXTRA_BASE + 7;
  NEWT_KEY_HOME = NEWT_KEY_EXTRA_BASE + 8;
  NEWT_KEY_END = NEWT_KEY_EXTRA_BASE + 9;
  NEWT_KEY_UNTAB = NEWT_KEY_EXTRA_BASE + 10;
  NEWT_KEY_PGUP = NEWT_KEY_EXTRA_BASE + 11;
  NEWT_KEY_PGDN = NEWT_KEY_EXTRA_BASE + 12;
  NEWT_KEY_INSERT = NEWT_KEY_EXTRA_BASE + 13;
  NEWT_KEY_F1 = NEWT_KEY_EXTRA_BASE + 101;
  NEWT_KEY_F2 = NEWT_KEY_EXTRA_BASE + 102;
  NEWT_KEY_F3 = NEWT_KEY_EXTRA_BASE + 103;
  NEWT_KEY_F4 = NEWT_KEY_EXTRA_BASE + 104;
  NEWT_KEY_F5 = NEWT_KEY_EXTRA_BASE + 105;
  NEWT_KEY_F6 = NEWT_KEY_EXTRA_BASE + 106;
  NEWT_KEY_F7 = NEWT_KEY_EXTRA_BASE + 107;
  NEWT_KEY_F8 = NEWT_KEY_EXTRA_BASE + 108;
  NEWT_KEY_F9 = NEWT_KEY_EXTRA_BASE + 109;
  NEWT_KEY_F10 = NEWT_KEY_EXTRA_BASE + 110;
  NEWT_KEY_F11 = NEWT_KEY_EXTRA_BASE + 111;
  NEWT_KEY_F12 = NEWT_KEY_EXTRA_BASE + 112;
  NEWT_KEY_RESIZE = NEWT_KEY_EXTRA_BASE + 113;
  NEWT_KEY_ERROR = NEWT_KEY_EXTRA_BASE + 114;

  NEWT_ANCHOR_LEFT = 1 shl 0;
  NEWT_ANCHOR_RIGHT = 1 shl 1;
  NEWT_ANCHOR_TOP = 1 shl 2;
  NEWT_ANCHOR_BOTTOM = 1 shl 3;

  NEWT_GRID_FLAG_GROWX = 1 shl 0;
  NEWT_GRID_FLAG_GROWY = 1 shl 1;

type
  PnewtGrid = ^TnewtGrid;
  TnewtGrid = Pointer; // typedef struct grid_s * newtGrid;
  TnewtGridElement = longint;

const
  NEWT_GRID_EMPTY = 0;
  NEWT_GRID_COMPONENT = 1;
  NEWT_GRID_SUBGRID = 2;

function newtCreateGrid(cols: longint; rows: longint): TnewtGrid; cdecl; external libnewt;
function newtGridVStacked(_type: TnewtGridElement; what: pointer): TnewtGrid; cdecl; varargs; external libnewt;
function newtGridVCloseStacked(_type: TnewtGridElement; what: pointer): TnewtGrid; cdecl; varargs; external libnewt;
function newtGridHStacked(type1: TnewtGridElement; what1: pointer): TnewtGrid; cdecl; varargs; external libnewt;
function newtGridHCloseStacked(type1: TnewtGridElement; what1: pointer): TnewtGrid; cdecl; varargs; external libnewt;
function newtGridBasicWindow(Text: TnewtComponent; middle: TnewtGrid; Buttons: TnewtGrid): TnewtGrid; cdecl; external libnewt;
function newtGridSimpleWindow(Text: TnewtComponent; middle: TnewtComponent; Buttons: TnewtGrid): TnewtGrid; cdecl; external libnewt;
procedure newtGridSetField(grid: TnewtGrid; col: longint; row: longint; _type: TnewtGridElement; val: pointer;
  padLeft: longint; padTop: longint; padRight: longint; padBottom: longint; anchor: longint;
  flags: longint); cdecl; external libnewt;
procedure newtGridPlace(grid: TnewtGrid; left: longint; top: longint); cdecl; external libnewt;
//const
//  newtGridDestroy = newtGridFree;  

procedure newtGridFree(grid: TnewtGrid; recurse: longint); cdecl; external libnewt;
procedure newtGridGetSize(grid: TnewtGrid; Width: Plongint; Height: Plongint); cdecl; external libnewt;
procedure newtGridWrappedWindow(grid: TnewtGrid; title: pchar); cdecl; external libnewt;
procedure newtGridWrappedWindowAt(grid: TnewtGrid; title: pchar; left: longint; top: longint); cdecl; external libnewt;
procedure newtGridAddComponentsToForm(grid: TnewtGrid; form: TnewtComponent; recurse: longint); cdecl; external libnewt;
function newtButtonBarv(button1: pchar; b1comp: PnewtComponent; args: Tva_list): TnewtGrid; cdecl; external libnewt;
function newtButtonBar(button1: pchar; b1comp: PnewtComponent): TnewtGrid; cdecl; varargs; external libnewt;
procedure newtWinMessage(title: pchar; buttonText: pchar; Text: pchar); cdecl; varargs; external libnewt;
procedure newtWinMessagev(title: pchar; buttonText: pchar; Text: pchar; argv: Tva_list); cdecl; external libnewt;
function newtWinChoice(title: pchar; button1: pchar; button2: pchar; Text: pchar): longint; cdecl; varargs; external libnewt;
function newtWinTernary(title: pchar; button1: pchar; button2: pchar; button3: pchar; message: pchar): longint; cdecl; varargs; external libnewt;
function newtWinMenu(title: pchar; Text: pchar; suggestedWidth: longint; flexDown: longint; flexUp: longint;
  maxListHeight: longint; items: PPchar; listItem: Plongint; button1: pchar): longint; cdecl; varargs; external libnewt;

type
  TnewtWinEntry = record
    Text: pchar;
    Value: ^pchar;
    flags: longint;
  end;
  PnewtWinEntry = ^TnewtWinEntry;

function newtWinEntries(title: pchar; Text: pchar; suggestedWidth: longint; flexDown: longint; flexUp: longint;
  dataWidth: longint; items: PnewtWinEntry; button1: pchar): longint; cdecl; varargs; external libnewt;

// === Konventiert am: 28-4-25 17:32:28 ===


implementation


function NEWT_COLORSET_CUSTOM(x: longint): longint;
begin
  NEWT_COLORSET_CUSTOM := 30 + x;
end;


end.
