
unit newt;
interface

{
  Automatically converted by H2Pas 1.0.0 from newt.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    newt.h
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
Pchar  = ^char;
Pgrid_s  = ^grid_s;
Plongint  = ^longint;
PnewtColors  = ^newtColors;
PnewtComponent  = ^newtComponent;
PnewtComponent_struct  = ^newtComponent_struct;
PnewtExitStruct  = ^newtExitStruct;
PnewtFlagsSense  = ^newtFlagsSense;
PnewtGrid  = ^newtGrid;
PnewtGridElement  = ^newtGridElement;
PnewtWinEntry  = ^newtWinEntry;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef H_NEWT}
{$define H_NEWT}
{ C++ extern C conditionnal removed }
{$include <stdarg.h>}

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
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function NEWT_COLORSET_CUSTOM(x : longint) : longint;

const
  NEWT_ARG_LAST = -(100000);  
  NEWT_ARG_APPEND = -(1);  
type
  PnewtColors = ^TnewtColors;
  TnewtColors = record
      rootFg : Pchar;
      rootBg : Pchar;
      borderFg : Pchar;
      borderBg : Pchar;
      windowFg : Pchar;
      windowBg : Pchar;
      shadowFg : Pchar;
      shadowBg : Pchar;
      titleFg : Pchar;
      titleBg : Pchar;
      buttonFg : Pchar;
      buttonBg : Pchar;
      actButtonFg : Pchar;
      actButtonBg : Pchar;
      checkboxFg : Pchar;
      checkboxBg : Pchar;
      actCheckboxFg : Pchar;
      actCheckboxBg : Pchar;
      entryFg : Pchar;
      entryBg : Pchar;
      labelFg : Pchar;
      labelBg : Pchar;
      listboxFg : Pchar;
      listboxBg : Pchar;
      actListboxFg : Pchar;
      actListboxBg : Pchar;
      textboxFg : Pchar;
      textboxBg : Pchar;
      actTextboxFg : Pchar;
      actTextboxBg : Pchar;
      helpLineFg : Pchar;
      helpLineBg : Pchar;
      rootTextFg : Pchar;
      rootTextBg : Pchar;
      emptyScale : Pchar;
      fullScale : Pchar;
      disabledEntryFg : Pchar;
      disabledEntryBg : Pchar;
      compactButtonFg : Pchar;
      compactButtonBg : Pchar;
      actSelListboxFg : Pchar;
      actSelListboxBg : Pchar;
      selListboxFg : Pchar;
      selListboxBg : Pchar;
    end;

  TnewtFlagsSense =  Longint;
  Const
    NEWT_FLAGS_SET = 0;
    NEWT_FLAGS_RESET = 1;
    NEWT_FLAGS_TOGGLE = 2;

  NEWT_FLAG_RETURNEXIT = 1 shl 0;  
  NEWT_FLAG_HIDDEN = 1 shl 1;  
  NEWT_FLAG_SCROLL = 1 shl 2;  
  NEWT_FLAG_DISABLED = 1 shl 3;  
{ OBSOLETE #define NEWT_FLAG_NOSCROLL 	(1 << 4)	for listboxes  }
  NEWT_FLAG_BORDER = 1 shl 5;  
  NEWT_FLAG_WRAP = 1 shl 6;  
  NEWT_FLAG_NOF12 = 1 shl 7;  
  NEWT_FLAG_MULTIPLE = 1 shl 8;  
  NEWT_FLAG_SELECTED = 1 shl 9;  
  NEWT_FLAG_CHECKBOX = 1 shl 10;  
{ draw '*'  of chars in entrybox  }
  NEWT_FLAG_PASSWORD = 1 shl 11;  
{ Only applies to listbox for now  }
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
{ Backwards compatibility  }
  NEWT_LISTBOX_RETURNEXIT = NEWT_FLAG_RETURNEXIT;  
  NEWT_ENTRY_SCROLL = NEWT_FLAG_SCROLL;  
  NEWT_ENTRY_HIDDEN = NEWT_FLAG_HIDDEN;  
  NEWT_ENTRY_RETURNEXIT = NEWT_FLAG_RETURNEXIT;  
  NEWT_ENTRY_DISABLED = NEWT_FLAG_DISABLED;  
  NEWT_TEXTBOX_WRAP = NEWT_FLAG_WRAP;  
  NEWT_TEXTBOX_SCROLL = NEWT_FLAG_SCROLL;  
  NEWT_FORM_NOF12 = NEWT_FLAG_NOF12;  
  newtListboxAddEntry = newtListboxAppendEntry;  
type
  PnewtComponent = ^TnewtComponent;
  TnewtComponent = PnewtComponent_struct;
(* Const before type ignored *)
  var
    newtDefaultColorPalette : TnewtColors;cvar;external;
type

  TnewtCallback = procedure (para1:TnewtComponent; para2:pointer);cdecl;

  TnewtSuspendCallback = procedure (data:pointer);cdecl;

function newtInit:longint;cdecl;external;
function newtFinished:longint;cdecl;external;
procedure newtCls;cdecl;external;
procedure newtResizeScreen(redraw:longint);cdecl;external;
procedure newtWaitForKey;cdecl;external;
procedure newtClearKeyBuffer;cdecl;external;
procedure newtDelay(usecs:dword);cdecl;external;
{ top, left are *not* counting the border  }
(* Const before type ignored *)
function newtOpenWindow(left:longint; top:longint; width:dword; height:dword; title:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function newtCenteredWindow(width:dword; height:dword; title:Pchar):longint;cdecl;external;
procedure newtPopWindow;cdecl;external;
procedure newtPopWindowNoRefresh;cdecl;external;
procedure newtSetColors(colors:TnewtColors);cdecl;external;
procedure newtSetColor(colorset:longint; fg:Pchar; bg:Pchar);cdecl;external;
procedure newtRefresh;cdecl;external;
procedure newtSuspend;cdecl;external;
procedure newtSetSuspendCallback(cb:TnewtSuspendCallback; data:pointer);cdecl;external;
procedure newtSetHelpCallback(cb:TnewtCallback);cdecl;external;
function newtResume:longint;cdecl;external;
(* Const before type ignored *)
procedure newtPushHelpLine(text:Pchar);cdecl;external;
procedure newtRedrawHelpLine;cdecl;external;
procedure newtPopHelpLine;cdecl;external;
(* Const before type ignored *)
procedure newtDrawRootText(col:longint; row:longint; text:Pchar);cdecl;external;
procedure newtBell;cdecl;external;
procedure newtCursorOff;cdecl;external;
procedure newtCursorOn;cdecl;external;
{ Components  }
(* Const before type ignored *)
function newtCompactButton(left:longint; top:longint; text:Pchar):TnewtComponent;cdecl;external;
(* Const before type ignored *)
function newtButton(left:longint; top:longint; text:Pchar):TnewtComponent;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function newtCheckbox(left:longint; top:longint; text:Pchar; defValue:char; seq:Pchar; 
           result:Pchar):TnewtComponent;cdecl;external;
function newtCheckboxGetValue(co:TnewtComponent):char;cdecl;external;
procedure newtCheckboxSetValue(co:TnewtComponent; value:char);cdecl;external;
procedure newtCheckboxSetFlags(co:TnewtComponent; flags:longint; sense:TnewtFlagsSense);cdecl;external;
(* Const before type ignored *)
function newtRadiobutton(left:longint; top:longint; text:Pchar; isDefault:longint; prevButton:TnewtComponent):TnewtComponent;cdecl;external;
function newtRadioGetCurrent(setMember:TnewtComponent):TnewtComponent;cdecl;external;
procedure newtRadioSetCurrent(setMember:TnewtComponent);cdecl;external;
procedure newtGetScreenSize(cols:Plongint; rows:Plongint);cdecl;external;
(* Const before type ignored *)
function newtLabel(left:longint; top:longint; text:Pchar):TnewtComponent;cdecl;external;
(* Const before type ignored *)
procedure newtLabelSetText(co:TnewtComponent; text:Pchar);cdecl;external;
procedure newtLabelSetColors(co:TnewtComponent; colorset:longint);cdecl;external;
function newtVerticalScrollbar(left:longint; top:longint; height:longint; normalColorset:longint; thumbColorset:longint):TnewtComponent;cdecl;external;
procedure newtScrollbarSet(co:TnewtComponent; where:longint; total:longint);cdecl;external;
procedure newtScrollbarSetColors(co:TnewtComponent; normal:longint; thumb:longint);cdecl;external;
function newtListbox(left:longint; top:longint; height:longint; flags:longint):TnewtComponent;cdecl;external;
function newtListboxGetCurrent(co:TnewtComponent):pointer;cdecl;external;
procedure newtListboxSetCurrent(co:TnewtComponent; num:longint);cdecl;external;
procedure newtListboxSetCurrentByKey(co:TnewtComponent; key:pointer);cdecl;external;
(* Const before type ignored *)
procedure newtListboxSetEntry(co:TnewtComponent; num:longint; text:Pchar);cdecl;external;
procedure newtListboxSetWidth(co:TnewtComponent; width:longint);cdecl;external;
procedure newtListboxSetData(co:TnewtComponent; num:longint; data:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function newtListboxAppendEntry(co:TnewtComponent; text:Pchar; data:pointer):longint;cdecl;external;
{ Send the key to insert after, or NULL to insert at the top  }
(* Const before type ignored *)
(* Const before type ignored *)
function newtListboxInsertEntry(co:TnewtComponent; text:Pchar; data:pointer; key:pointer):longint;cdecl;external;
function newtListboxDeleteEntry(co:TnewtComponent; data:pointer):longint;cdecl;external;
procedure newtListboxClear(co:TnewtComponent);cdecl;external;
{ removes all entries from listbox  }
procedure newtListboxGetEntry(co:TnewtComponent; num:longint; text:PPchar; data:Ppointer);cdecl;external;
{ Returns an array of data pointers from items, last element is NULL  }
function newtListboxGetSelection(co:TnewtComponent; numitems:Plongint):^pointer;cdecl;external;
procedure newtListboxClearSelection(co:TnewtComponent);cdecl;external;
(* Const before type ignored *)
procedure newtListboxSelectItem(co:TnewtComponent; key:pointer; sense:TnewtFlagsSense);cdecl;external;
{ Returns number of items currently in listbox.  }
function newtListboxItemCount(co:TnewtComponent):longint;cdecl;external;
function newtCheckboxTree(left:longint; top:longint; height:longint; flags:longint):TnewtComponent;cdecl;external;
function newtCheckboxTreeMulti(left:longint; top:longint; height:longint; seq:Pchar; flags:longint):TnewtComponent;cdecl;external;
(* Const before type ignored *)
function newtCheckboxTreeGetSelection(co:TnewtComponent; numitems:Plongint):^pointer;cdecl;external;
(* Const before type ignored *)
function newtCheckboxTreeGetCurrent(co:TnewtComponent):pointer;cdecl;external;
procedure newtCheckboxTreeSetCurrent(co:TnewtComponent; item:pointer);cdecl;external;
(* Const before type ignored *)
function newtCheckboxTreeGetMultiSelection(co:TnewtComponent; numitems:Plongint; seqnum:char):^pointer;cdecl;external;
{ last item is NEWT_ARG_LAST for all of these  }
(* Const before type ignored *)
(* Const before type ignored *)
function newtCheckboxTreeAddItem(co:TnewtComponent; text:Pchar; data:pointer; flags:longint; index:longint; 
           args:array of const):longint;cdecl;external;
function newtCheckboxTreeAddItem(co:TnewtComponent; text:Pchar; data:pointer; flags:longint; index:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function newtCheckboxTreeAddArray(co:TnewtComponent; text:Pchar; data:pointer; flags:longint; indexes:Plongint):longint;cdecl;external;
function newtCheckboxTreeFindItem(co:TnewtComponent; data:pointer):Plongint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure newtCheckboxTreeSetEntry(co:TnewtComponent; data:pointer; text:Pchar);cdecl;external;
procedure newtCheckboxTreeSetWidth(co:TnewtComponent; width:longint);cdecl;external;
(* Const before type ignored *)
function newtCheckboxTreeGetEntryValue(co:TnewtComponent; data:pointer):char;cdecl;external;
(* Const before type ignored *)
procedure newtCheckboxTreeSetEntryValue(co:TnewtComponent; data:pointer; value:char);cdecl;external;
function newtTextboxReflowed(left:longint; top:longint; text:Pchar; width:longint; flexDown:longint; 
           flexUp:longint; flags:longint):TnewtComponent;cdecl;external;
function newtTextbox(left:longint; top:longint; width:longint; height:longint; flags:longint):TnewtComponent;cdecl;external;
(* Const before type ignored *)
procedure newtTextboxSetText(co:TnewtComponent; text:Pchar);cdecl;external;
procedure newtTextboxSetHeight(co:TnewtComponent; height:longint);cdecl;external;
function newtTextboxGetNumLines(co:TnewtComponent):longint;cdecl;external;
procedure newtTextboxSetColors(co:TnewtComponent; normal:longint; active:longint);cdecl;external;
function newtReflowText(text:Pchar; width:longint; flexDown:longint; flexUp:longint; actualWidth:Plongint; 
           actualHeight:Plongint):Pchar;cdecl;external;
type
  PnewtExitStruct = ^TnewtExitStruct;
  TnewtExitStruct = record
      reason :  Longint;
      Const
        NEWT_EXIT_HOTKEY = 0;
        NEWT_EXIT_COMPONENT = 1;
        NEWT_EXIT_FDREADY = 2;
        NEWT_EXIT_TIMER = 3;
        NEWT_EXIT_ERROR = 4;
;cdecl;
      u : record
          case longint of
            0 : ( watch : longint );
            1 : ( key : longint );
            2 : ( co : TnewtComponent );
          end;
    end

function newtForm(vertBar:TnewtComponent; helpTag:pointer; flags:longint):TnewtComponent;cdecl;external;
procedure newtFormSetTimer(form:TnewtComponent; millisecs:longint);cdecl;external;
procedure newtFormWatchFd(form:TnewtComponent; fd:longint; fdFlags:longint);cdecl;external;
procedure newtFormSetSize(co:TnewtComponent);cdecl;external;
function newtFormGetCurrent(co:TnewtComponent):TnewtComponent;cdecl;external;
procedure newtFormSetBackground(co:TnewtComponent; color:longint);cdecl;external;
procedure newtFormSetCurrent(co:TnewtComponent; subco:TnewtComponent);cdecl;external;
procedure newtFormAddComponent(form:TnewtComponent; co:TnewtComponent);cdecl;external;
procedure newtFormAddComponents(form:TnewtComponent; args:array of const);cdecl;external;
procedure newtFormAddComponents(form:TnewtComponent);cdecl;external;
procedure newtFormSetHeight(co:TnewtComponent; height:longint);cdecl;external;
procedure newtFormSetWidth(co:TnewtComponent; width:longint);cdecl;external;
function newtRunForm(form:TnewtComponent):TnewtComponent;cdecl;external;
{ obsolete  }
procedure newtFormRun(co:TnewtComponent; es:PnewtExitStruct);cdecl;external;
procedure newtDrawForm(form:TnewtComponent);cdecl;external;
procedure newtFormAddHotKey(co:TnewtComponent; key:longint);cdecl;external;
function newtFormGetScrollPosition(co:TnewtComponent):longint;cdecl;external;
procedure newtFormSetScrollPosition(co:TnewtComponent; position:longint);cdecl;external;
type

  TnewtEntryFilter = function (entry:TnewtComponent; data:pointer; ch:longint; cursor:longint):longint;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

function newtEntry(left:longint; top:longint; initialValue:Pchar; width:longint; resultPtr:PPchar; 
           flags:longint):TnewtComponent;cdecl;external;
(* Const before type ignored *)
procedure newtEntrySet(co:TnewtComponent; value:Pchar; cursorAtEnd:longint);cdecl;external;
procedure newtEntrySetFilter(co:TnewtComponent; filter:TnewtEntryFilter; data:pointer);cdecl;external;
function newtEntryGetValue(co:TnewtComponent):Pchar;cdecl;external;
procedure newtEntrySetFlags(co:TnewtComponent; flags:longint; sense:TnewtFlagsSense);cdecl;external;
procedure newtEntrySetColors(co:TnewtComponent; normal:longint; disabled:longint);cdecl;external;
function newtEntryGetCursorPosition(co:TnewtComponent):longint;cdecl;external;
procedure newtEntrySetCursorPosition(co:TnewtComponent; position:longint);cdecl;external;
function newtScale(left:longint; top:longint; width:longint; fullValue:int64):TnewtComponent;cdecl;external;
procedure newtScaleSet(co:TnewtComponent; amount:qword);cdecl;external;
procedure newtScaleSetColors(co:TnewtComponent; empty:longint; full:longint);cdecl;external;
procedure newtComponentAddCallback(co:TnewtComponent; f:TnewtCallback; data:pointer);cdecl;external;
procedure newtComponentTakesFocus(co:TnewtComponent; val:longint);cdecl;external;
procedure newtComponentGetPosition(co:TnewtComponent; left:Plongint; top:Plongint);cdecl;external;
procedure newtComponentGetSize(co:TnewtComponent; width:Plongint; height:Plongint);cdecl;external;
{ This callback is called when a component is destroyed.  }
procedure newtComponentAddDestroyCallback(co:TnewtComponent; f:TnewtCallback; data:pointer);cdecl;external;
{ this also destroys all of the components (including other forms) on the 
   form  }
procedure newtFormDestroy(form:TnewtComponent);cdecl;external;
{ NB: You SHOULD NOT call this for components which have been added
 * to a form (ie. almost all components).  They are destroyed along
 * with the form when you call newtFormDestroy.
  }
procedure newtComponentDestroy(co:TnewtComponent);cdecl;external;
{ Key codes  }
const
  NEWT_KEY_TAB = '\t';  
  NEWT_KEY_ENTER = '\r';  
{ ctrl - z }
  NEWT_KEY_SUSPEND = '\032';  
  NEWT_KEY_ESCAPE = '';  
  NEWT_KEY_RETURN = NEWT_KEY_ENTER;  
  NEWT_KEY_EXTRA_BASE = $8000;  
  NEWT_KEY_UP = NEWT_KEY_EXTRA_BASE+1;  
  NEWT_KEY_DOWN = NEWT_KEY_EXTRA_BASE+2;  
  NEWT_KEY_LEFT = NEWT_KEY_EXTRA_BASE+4;  
  NEWT_KEY_RIGHT = NEWT_KEY_EXTRA_BASE+5;  
  NEWT_KEY_BKSPC = NEWT_KEY_EXTRA_BASE+6;  
  NEWT_KEY_DELETE = NEWT_KEY_EXTRA_BASE+7;  
  NEWT_KEY_HOME = NEWT_KEY_EXTRA_BASE+8;  
  NEWT_KEY_END = NEWT_KEY_EXTRA_BASE+9;  
  NEWT_KEY_UNTAB = NEWT_KEY_EXTRA_BASE+10;  
  NEWT_KEY_PGUP = NEWT_KEY_EXTRA_BASE+11;  
  NEWT_KEY_PGDN = NEWT_KEY_EXTRA_BASE+12;  
  NEWT_KEY_INSERT = NEWT_KEY_EXTRA_BASE+13;  
  NEWT_KEY_F1 = NEWT_KEY_EXTRA_BASE+101;  
  NEWT_KEY_F2 = NEWT_KEY_EXTRA_BASE+102;  
  NEWT_KEY_F3 = NEWT_KEY_EXTRA_BASE+103;  
  NEWT_KEY_F4 = NEWT_KEY_EXTRA_BASE+104;  
  NEWT_KEY_F5 = NEWT_KEY_EXTRA_BASE+105;  
  NEWT_KEY_F6 = NEWT_KEY_EXTRA_BASE+106;  
  NEWT_KEY_F7 = NEWT_KEY_EXTRA_BASE+107;  
  NEWT_KEY_F8 = NEWT_KEY_EXTRA_BASE+108;  
  NEWT_KEY_F9 = NEWT_KEY_EXTRA_BASE+109;  
  NEWT_KEY_F10 = NEWT_KEY_EXTRA_BASE+110;  
  NEWT_KEY_F11 = NEWT_KEY_EXTRA_BASE+111;  
  NEWT_KEY_F12 = NEWT_KEY_EXTRA_BASE+112;  
  NEWT_KEY_RESIZE = NEWT_KEY_EXTRA_BASE+113;  
  NEWT_KEY_ERROR = NEWT_KEY_EXTRA_BASE+114;  
  NEWT_ANCHOR_LEFT = 1 shl 0;  
  NEWT_ANCHOR_RIGHT = 1 shl 1;  
  NEWT_ANCHOR_TOP = 1 shl 2;  
  NEWT_ANCHOR_BOTTOM = 1 shl 3;  
  NEWT_GRID_FLAG_GROWX = 1 shl 0;  
  NEWT_GRID_FLAG_GROWY = 1 shl 1;  
type
  PnewtGrid = ^TnewtGrid;
  TnewtGrid = Pgrid_s;
  TnewtGridElement =  Longint;
  Const
    NEWT_GRID_EMPTY = 0;
    NEWT_GRID_COMPONENT = 1;
    NEWT_GRID_SUBGRID = 2;


function newtCreateGrid(cols:longint; rows:longint):TnewtGrid;cdecl;external;
{ TYPE, what, TYPE, what, ..., NULL  }
function newtGridVStacked(_type:TnewtGridElement; what:pointer; args:array of const):TnewtGrid;cdecl;external;
function newtGridVStacked(_type:TnewtGridElement; what:pointer):TnewtGrid;cdecl;external;
function newtGridVCloseStacked(_type:TnewtGridElement; what:pointer; args:array of const):TnewtGrid;cdecl;external;
function newtGridVCloseStacked(_type:TnewtGridElement; what:pointer):TnewtGrid;cdecl;external;
function newtGridHStacked(type1:TnewtGridElement; what1:pointer; args:array of const):TnewtGrid;cdecl;external;
function newtGridHStacked(type1:TnewtGridElement; what1:pointer):TnewtGrid;cdecl;external;
function newtGridHCloseStacked(type1:TnewtGridElement; what1:pointer; args:array of const):TnewtGrid;cdecl;external;
function newtGridHCloseStacked(type1:TnewtGridElement; what1:pointer):TnewtGrid;cdecl;external;
function newtGridBasicWindow(text:TnewtComponent; middle:TnewtGrid; buttons:TnewtGrid):TnewtGrid;cdecl;external;
function newtGridSimpleWindow(text:TnewtComponent; middle:TnewtComponent; buttons:TnewtGrid):TnewtGrid;cdecl;external;
procedure newtGridSetField(grid:TnewtGrid; col:longint; row:longint; _type:TnewtGridElement; val:pointer; 
            padLeft:longint; padTop:longint; padRight:longint; padBottom:longint; anchor:longint; 
            flags:longint);cdecl;external;
procedure newtGridPlace(grid:TnewtGrid; left:longint; top:longint);cdecl;external;
const
  newtGridDestroy = newtGridFree;  

procedure newtGridFree(grid:TnewtGrid; recurse:longint);cdecl;external;
procedure newtGridGetSize(grid:TnewtGrid; width:Plongint; height:Plongint);cdecl;external;
procedure newtGridWrappedWindow(grid:TnewtGrid; title:Pchar);cdecl;external;
procedure newtGridWrappedWindowAt(grid:TnewtGrid; title:Pchar; left:longint; top:longint);cdecl;external;
procedure newtGridAddComponentsToForm(grid:TnewtGrid; form:TnewtComponent; recurse:longint);cdecl;external;
{ convienve  }
function newtButtonBarv(button1:Pchar; b1comp:PnewtComponent; args:Tva_list):TnewtGrid;cdecl;external;
function newtButtonBar(button1:Pchar; b1comp:PnewtComponent; args:array of const):TnewtGrid;cdecl;external;
function newtButtonBar(button1:Pchar; b1comp:PnewtComponent):TnewtGrid;cdecl;external;
{ automatically centered and shrink wrapped  }
procedure newtWinMessage(title:Pchar; buttonText:Pchar; text:Pchar; args:array of const);cdecl;external;
procedure newtWinMessage(title:Pchar; buttonText:Pchar; text:Pchar);cdecl;external;
procedure newtWinMessagev(title:Pchar; buttonText:Pchar; text:Pchar; argv:Tva_list);cdecl;external;
{ having separate calls for these two seems silly, but having two separate
   variable length-arg lists seems like a bad idea as well  }
{ Returns 0 if F12 was pressed, 1 for button1, 2 for button2  }
function newtWinChoice(title:Pchar; button1:Pchar; button2:Pchar; text:Pchar; args:array of const):longint;cdecl;external;
function newtWinChoice(title:Pchar; button1:Pchar; button2:Pchar; text:Pchar):longint;cdecl;external;
{ Returns 0 if F12 was pressed, 1 for button1, 2 for button2, 
   3 for button3  }
function newtWinTernary(title:Pchar; button1:Pchar; button2:Pchar; button3:Pchar; message:Pchar; 
           args:array of const):longint;cdecl;external;
function newtWinTernary(title:Pchar; button1:Pchar; button2:Pchar; button3:Pchar; message:Pchar):longint;cdecl;external;
{ Returns the button number pressed, 0 on F12  }
function newtWinMenu(title:Pchar; text:Pchar; suggestedWidth:longint; flexDown:longint; flexUp:longint; 
           maxListHeight:longint; items:PPchar; listItem:Plongint; button1:Pchar; args:array of const):longint;cdecl;external;
function newtWinMenu(title:Pchar; text:Pchar; suggestedWidth:longint; flexDown:longint; flexUp:longint; 
           maxListHeight:longint; items:PPchar; listItem:Plongint; button1:Pchar):longint;cdecl;external;
{ may be initialized to set default  }
type
  PnewtWinEntry = ^TnewtWinEntry;
  TnewtWinEntry = record
      text : Pchar;
      value : ^Pchar;
      flags : longint;
    end;

{ Returns the button number pressed, 0 on F12. The final values are
   dynamically allocated, and need to be freed.  }

function newtWinEntries(title:Pchar; text:Pchar; suggestedWidth:longint; flexDown:longint; flexUp:longint; 
           dataWidth:longint; items:PnewtWinEntry; button1:Pchar; args:array of const):longint;cdecl;external;
function newtWinEntries(title:Pchar; text:Pchar; suggestedWidth:longint; flexDown:longint; flexUp:longint; 
           dataWidth:longint; items:PnewtWinEntry; button1:Pchar):longint;cdecl;external;
{$endif}
{ H_NEWT  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NEWT_COLORSET_CUSTOM(x : longint) : longint;
begin
  NEWT_COLORSET_CUSTOM:=30+x;
end;


end.
