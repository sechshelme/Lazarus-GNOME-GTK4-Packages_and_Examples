unit fp_newt;

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
  libnewt = 'newt.dll';
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
  TnewtComponent = record     // typedef struct newtComponent_struct * newtComponent;
  end;
  PnewtComponent = ^TnewtComponent;
  PPnewtComponent = ^PnewtComponent;

var
  newtDefaultColorPalette: TnewtColors; cvar;external libnewt;

type
  TnewtCallback = procedure(para1: PnewtComponent; para2: pointer); cdecl;
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

function newtCompactButton(left: longint; top: longint; Text: pchar): PnewtComponent; cdecl; external libnewt;

function newtButton(left: longint; top: longint; Text: pchar): PnewtComponent; cdecl; external libnewt;

function newtCheckbox(left: longint; top: longint; Text: pchar; defValue: char; seq: pchar;  Result: pchar): PnewtComponent; cdecl; external libnewt;
function newtCheckboxGetValue(co: PnewtComponent): char; cdecl; external libnewt;
procedure newtCheckboxSetValue(co: PnewtComponent; Value: char); cdecl; external libnewt;
procedure newtCheckboxSetFlags(co: PnewtComponent; flags: longint; sense: TnewtFlagsSense); cdecl; external libnewt;

function newtRadiobutton(left: longint; top: longint; Text: pchar; isDefault: longint; prevButton: PnewtComponent): PnewtComponent; cdecl; external libnewt;
function newtRadioGetCurrent(setMember: PnewtComponent): PnewtComponent; cdecl; external libnewt;
procedure newtRadioSetCurrent(setMember: PnewtComponent); cdecl; external libnewt;

procedure newtGetScreenSize(cols: Plongint; rows: Plongint); cdecl; external libnewt;

function newtLabel(left: longint; top: longint; Text: pchar): PnewtComponent; cdecl; external libnewt;
procedure newtLabelSetText(co: PnewtComponent; Text: pchar); cdecl; external libnewt;
procedure newtLabelSetColors(co: PnewtComponent; colorset: longint); cdecl; external libnewt;

function newtVerticalScrollbar(left: longint; top: longint; Height: longint; normalColorset: longint; thumbColorset: longint): PnewtComponent; cdecl; external libnewt;
procedure newtScrollbarSet(co: PnewtComponent; where: longint; total: longint); cdecl; external libnewt;
procedure newtScrollbarSetColors(co: PnewtComponent; normal: longint; thumb: longint); cdecl; external libnewt;

function newtListbox(left: longint; top: longint; Height: longint; flags: longint): PnewtComponent; cdecl; external libnewt;
function newtListboxGetCurrent(co: PnewtComponent): pointer; cdecl; external libnewt;
procedure newtListboxSetCurrent(co: PnewtComponent; num: longint); cdecl; external libnewt;
procedure newtListboxSetCurrentByKey(co: PnewtComponent; key: pointer); cdecl; external libnewt;
procedure newtListboxSetEntry(co: PnewtComponent; num: longint; Text: pchar); cdecl; external libnewt;
procedure newtListboxSetWidth(co: PnewtComponent; Width: longint); cdecl; external libnewt;
procedure newtListboxSetData(co: PnewtComponent; num: longint; Data: pointer); cdecl; external libnewt;
function newtListboxAppendEntry(co: PnewtComponent; Text: pchar; Data: pointer): longint; cdecl; external libnewt;
function newtListboxInsertEntry(co: PnewtComponent; Text: pchar; Data: pointer; key: pointer): longint; cdecl; external libnewt;
function newtListboxDeleteEntry(co: PnewtComponent; Data: pointer): longint; cdecl; external libnewt;
procedure newtListboxClear(co: PnewtComponent); cdecl; external libnewt;
procedure newtListboxGetEntry(co: PnewtComponent; num: longint; Text: PPchar; Data: Ppointer); cdecl; external libnewt;
function newtListboxGetSelection(co: PnewtComponent; numitems: Plongint): PPointer; cdecl; external libnewt;
procedure newtListboxClearSelection(co: PnewtComponent); cdecl; external libnewt;
procedure newtListboxSelectItem(co: PnewtComponent; key: pointer; sense: TnewtFlagsSense); cdecl; external libnewt;
function newtListboxItemCount(co: PnewtComponent): longint; cdecl; external libnewt;

function newtCheckboxTree(left: longint; top: longint; Height: longint; flags: longint): PnewtComponent; cdecl; external libnewt;
function newtCheckboxTreeMulti(left: longint; top: longint; Height: longint; seq: pchar; flags: longint): PnewtComponent; cdecl; external libnewt;
function newtCheckboxTreeGetSelection(co: PnewtComponent; numitems: Plongint): PPointer; cdecl; external libnewt;
function newtCheckboxTreeGetCurrent(co: PnewtComponent): pointer; cdecl; external libnewt;
procedure newtCheckboxTreeSetCurrent(co: PnewtComponent; item: pointer); cdecl; external libnewt;
function newtCheckboxTreeGetMultiSelection(co: PnewtComponent; numitems: Plongint; seqnum: char): PPointer; cdecl; external libnewt;
function newtCheckboxTreeAddItem(co: PnewtComponent; Text: pchar; Data: pointer; flags: longint; index: longint): longint; cdecl; varargs; external libnewt;
function newtCheckboxTreeAddArray(co: PnewtComponent; Text: pchar; Data: pointer; flags: longint; indexes: Plongint): longint; cdecl; external libnewt;
function newtCheckboxTreeFindItem(co: PnewtComponent; Data: pointer): Plongint; cdecl; external libnewt;
procedure newtCheckboxTreeSetEntry(co: PnewtComponent; Data: pointer; Text: pchar); cdecl; external libnewt;
procedure newtCheckboxTreeSetWidth(co: PnewtComponent; Width: longint); cdecl; external libnewt;
function newtCheckboxTreeGetEntryValue(co: PnewtComponent; Data: pointer): char; cdecl; external libnewt;
procedure newtCheckboxTreeSetEntryValue(co: PnewtComponent; Data: pointer; Value: char); cdecl; external libnewt;

function newtTextboxReflowed(left: longint; top: longint; Text: pchar; Width: longint; flexDown: longint;  flexUp: longint; flags: longint): PnewtComponent; cdecl; external libnewt;
function newtTextbox(left: longint; top: longint; Width: longint; Height: longint; flags: longint): PnewtComponent; cdecl; external libnewt;
procedure newtTextboxSetText(co: PnewtComponent; Text: pchar); cdecl; external libnewt;
procedure newtTextboxSetHeight(co: PnewtComponent; Height: longint); cdecl; external libnewt;
function newtTextboxGetNumLines(co: PnewtComponent): longint; cdecl; external libnewt;
procedure newtTextboxSetColors(co: PnewtComponent; normal: longint; active: longint); cdecl; external libnewt;

function newtReflowText(Text: pchar; Width: longint; flexDown: longint; flexUp: longint; actualWidth: Plongint;  actualHeight: Plongint): pchar; cdecl; external libnewt;

const
  NEWT_EXIT_HOTKEY = 0;
  NEWT_EXIT_COMPONENT = 1;
  NEWT_EXIT_FDREADY = 2;
  NEWT_EXIT_TIMER = 3;
  NEWT_EXIT_ERROR = 4;

type
  TnewtExitStruct = record
    reason: LongInt;
    u: record
      case longint of
        0: (watch: longint);
        1: (key: longint);
        2: (co: PnewtComponent);
      end;
  end;
  PnewtExitStruct = ^TnewtExitStruct;

function newtForm(vertBar: PnewtComponent; helpTag: pointer; flags: longint): PnewtComponent; cdecl; external libnewt;
procedure newtFormSetTimer(form: PnewtComponent; millisecs: longint); cdecl; external libnewt;
procedure newtFormWatchFd(form: PnewtComponent; fd: longint; fdFlags: longint); cdecl; external libnewt;
procedure newtFormSetSize(co: PnewtComponent); cdecl; external libnewt;
function newtFormGetCurrent(co: PnewtComponent): PnewtComponent; cdecl; external libnewt;
procedure newtFormSetBackground(co: PnewtComponent; color: longint); cdecl; external libnewt;
procedure newtFormSetCurrent(co: PnewtComponent; subco: PnewtComponent); cdecl; external libnewt;
procedure newtFormAddComponent(form: PnewtComponent; co: PnewtComponent); cdecl; external libnewt;
procedure newtFormAddComponents(form: PnewtComponent); cdecl; varargs; external libnewt;
procedure newtFormSetHeight(co: PnewtComponent; Height: longint); cdecl; external libnewt;
procedure newtFormSetWidth(co: PnewtComponent; Width: longint); cdecl; external libnewt;
function newtRunForm(form: PnewtComponent): PnewtComponent; cdecl; external libnewt;
procedure newtFormRun(co: PnewtComponent; es: PnewtExitStruct); cdecl; external libnewt;
procedure newtDrawForm(form: PnewtComponent); cdecl; external libnewt;
procedure newtFormAddHotKey(co: PnewtComponent; key: longint); cdecl; external libnewt;
function newtFormGetScrollPosition(co: PnewtComponent): longint; cdecl; external libnewt;
procedure newtFormSetScrollPosition(co: PnewtComponent; position: longint); cdecl; external libnewt;

type
  TnewtEntryFilter = function(entry: PnewtComponent; Data: pointer; ch: longint; cursor: longint): longint; cdecl;

function newtEntry(left: longint; top: longint; initialValue: pchar; Width: longint; resultPtr: PPchar;
  flags: longint): PnewtComponent; cdecl; external libnewt;
procedure newtEntrySet(co: PnewtComponent; Value: pchar; cursorAtEnd: longint); cdecl; external libnewt;
procedure newtEntrySetFilter(co: PnewtComponent; filter: TnewtEntryFilter; Data: pointer); cdecl; external libnewt;
function newtEntryGetValue(co: PnewtComponent): pchar; cdecl; external libnewt;
procedure newtEntrySetFlags(co: PnewtComponent; flags: longint; sense: TnewtFlagsSense); cdecl; external libnewt;
procedure newtEntrySetColors(co: PnewtComponent; normal: longint; disabled: longint); cdecl; external libnewt;
function newtEntryGetCursorPosition(co: PnewtComponent): longint; cdecl; external libnewt;
procedure newtEntrySetCursorPosition(co: PnewtComponent; position: longint); cdecl; external libnewt;
function newtScale(left: longint; top: longint; Width: longint; fullValue: int64): PnewtComponent; cdecl; external libnewt;
procedure newtScaleSet(co: PnewtComponent; amount: uint64); cdecl; external libnewt;
procedure newtScaleSetColors(co: PnewtComponent; empty: longint; full: longint); cdecl; external libnewt;
procedure newtComponentAddCallback(co: PnewtComponent; f: TnewtCallback; Data: pointer); cdecl; external libnewt;
procedure newtComponentTakesFocus(co: PnewtComponent; val: longint); cdecl; external libnewt;
procedure newtComponentGetPosition(co: PnewtComponent; left: Plongint; top: Plongint); cdecl; external libnewt;
procedure newtComponentGetSize(co: PnewtComponent; Width: Plongint; Height: Plongint); cdecl; external libnewt;
procedure newtComponentAddDestroyCallback(co: PnewtComponent; f: TnewtCallback; Data: pointer); cdecl; external libnewt;
procedure newtFormDestroy(form: PnewtComponent); cdecl; external libnewt;
procedure newtComponentDestroy(co: PnewtComponent); cdecl; external libnewt;

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
function newtGridBasicWindow(Text: PnewtComponent; middle: TnewtGrid; Buttons: TnewtGrid): TnewtGrid; cdecl; external libnewt;
function newtGridSimpleWindow(Text: PnewtComponent; middle: PnewtComponent; Buttons: TnewtGrid): TnewtGrid; cdecl; external libnewt;
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
procedure newtGridAddComponentsToForm(grid: TnewtGrid; form: PnewtComponent; recurse: longint); cdecl; external libnewt;

function newtButtonBarv(button1: pchar; b1comp: PPnewtComponent; args: Tva_list): TnewtGrid; cdecl; external libnewt;
function newtButtonBar(button1: pchar; b1comp: PPnewtComponent): TnewtGrid; cdecl; varargs; external libnewt;

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
