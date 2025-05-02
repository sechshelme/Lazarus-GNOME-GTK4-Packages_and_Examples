unit tickit;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF Linux}
  libtickit = 'libtickit';
  {$ENDIF}

  {$IFDEF mswindows}
  libtickit = 'tickit.dll'; // ???
  {$ENDIF}

  type Tpid_t=Integer;
    Tuint8_t=UInt8;
    Tsize_t=SizeInt;
    Tbool=Boolean;

    Ttime_t=UInt64;

  type
    TTimeVal = record  // sys/time.h>
      tv_sec: Int64;
      tv_usec: LongInt;
    end;
    PTimeVal = ^TTimeVal;
    Tva_list=Pointer;

// ===================


const
  TICKIT_VERSION_MAJOR_ = 0;  
  TICKIT_VERSION_MINOR_ = 4;  
  TICKIT_VERSION_PATCH_ = 3;  

function tickit_version_major:longint;cdecl;external libtickit;
function tickit_version_minor:longint;cdecl;external libtickit;
function tickit_version_patch:longint;cdecl;external libtickit;

type
  PTickitPen = ^TTickitPen;
  TTickitPen = record end;

  PTickitRectSet = ^TTickitRectSet;
  TTickitRectSet = record end;

  PTickitRenderBuffer = ^TTickitRenderBuffer;
  TTickitRenderBuffer = record end;

  PTickitString = ^TTickitString;
  TTickitString = record end;

  PTickitTerm = ^TTickitTerm;
  TTickitTerm = record end;

  PPTickitWindow = ^PTickitWindow;
  PTickitWindow = ^TTickitWindow;
  TTickitWindow = record end;

  PTickit = ^TTickit;
  TTickit = record end;

  PTickitTermDriver = ^TTickitTermDriver;
  TTickitTermDriver = record end;

  PTickitEventHooks = ^TTickitEventHooks;
  TTickitEventHooks = record end;

type
  TTickitRect = record
      top : longint;
      left : longint;
      lines : longint;
      cols : longint;
    end;
  PTickitRect = ^TTickitRect;

  PTickitBindFlags = ^TTickitBindFlags;
  TTickitBindFlags =  Longint;
  Const
    TICKIT_BIND_FIRST = 1 shl 0;
    TICKIT_BIND_UNBIND = 1 shl 1;
    TICKIT_BIND_DESTROY = 1 shl 2;
    TICKIT_BIND_ONESHOT = 1 shl 3;

type
  PTickitCtl = ^TTickitCtl;
  TTickitCtl =  Longint;
  Const
    TICKIT_CTL_USE_ALTSCREEN = 1;
    TICKIT_N_CTLS = 2;

type
  PTickitCursorShape = ^TTickitCursorShape;
  TTickitCursorShape =  Longint;
  Const
    TICKIT_CURSORSHAPE_BLOCK = 1;
    TICKIT_CURSORSHAPE_UNDER = 2;
    TICKIT_CURSORSHAPE_LEFT_BAR = 3;

type
  PTickitIOCondition = ^TTickitIOCondition;
  TTickitIOCondition =  Longint;
  Const
    TICKIT_IO_IN = 1 shl 0;
    TICKIT_IO_OUT = 1 shl 1;
    TICKIT_IO_HUP = 1 shl 2;
    TICKIT_IO_ERR = 1 shl 3;
    TICKIT_IO_INVAL = 1 shl 4;

type
  PTickitIOWatchInfo = ^TTickitIOWatchInfo;
  TTickitIOWatchInfo = record
      fd : longint;
      cond : TTickitIOCondition;
    end;

  PTickitLineCaps = ^TTickitLineCaps;
  TTickitLineCaps =  Longint;
  Const
    TICKIT_LINECAP_START = $01;
    TICKIT_LINECAP_END = $02;
    TICKIT_LINECAP_BOTH = $03;

type
  PTickitLineStyle = ^TTickitLineStyle;
  TTickitLineStyle =  Longint;
  Const
    TICKIT_LINE_SINGLE = 1;
    TICKIT_LINE_DOUBLE = 2;
    TICKIT_LINE_THICK = 3;

type
  PTickitMaybeBool = ^TTickitMaybeBool;
  TTickitMaybeBool =  Longint;
  Const
    TICKIT_NO = 0;
    TICKIT_YES = 1;
    TICKIT_MAYBE = -(1);
type
  PTickitPenAttr = ^TTickitPenAttr;
  TTickitPenAttr =  Longint;
  Const
    TICKIT_PEN_FG = 1;
    TICKIT_PEN_BG = 2;
    TICKIT_PEN_BOLD = 3;
    TICKIT_PEN_UNDER = 4;
    TICKIT_PEN_ITALIC = 5;
    TICKIT_PEN_REVERSE = 6;
    TICKIT_PEN_STRIKE = 7;
    TICKIT_PEN_ALTFONT = 8;
    TICKIT_PEN_BLINK = 9;
    TICKIT_N_PEN_ATTRS = 10;

type
  TTickitProcessWatchInfo = record
      pid : Tpid_t;
      wstatus : longint;
    end;
  PTickitProcessWatchInfo = ^TTickitProcessWatchInfo;
  Const
    TICKIT_PEN_FG_DESC = $100+TICKIT_PEN_FG;
    TICKIT_PEN_BG_DESC = $100+TICKIT_PEN_BG;

type
  PTickitPenUnderline = ^TTickitPenUnderline;
  TTickitPenUnderline =  Longint;
  Const
    TICKIT_PEN_UNDER_NONE = 0;
    TICKIT_PEN_UNDER_SINGLE = 1;
    TICKIT_PEN_UNDER_DOUBLE = 2;
    TICKIT_PEN_UNDER_WAVY = 3;
    TICKIT_N_PEN_UNDERS = 4;

type
  PTickitRunFlags = ^TTickitRunFlags;
  TTickitRunFlags =  Longint;
  Const
    TICKIT_RUN_DEFAULT = 0;
    TICKIT_RUN_ONCE = 1 shl 0;
    TICKIT_RUN_NOHANG = 1 shl 1;
    TICKIT_RUN_NOSETUP = 1 shl 2;
type
  PTickitTermCtl = ^TTickitTermCtl;
  TTickitTermCtl =  Longint;
  Const
    TICKIT_TERMCTL_ALTSCREEN = 1;
    TICKIT_TERMCTL_CURSORVIS = 2;
    TICKIT_TERMCTL_MOUSE = 3;
    TICKIT_TERMCTL_CURSORBLINK = 4;
    TICKIT_TERMCTL_CURSORSHAPE = 5;
    TICKIT_TERMCTL_ICON_TEXT = 6;
    TICKIT_TERMCTL_TITLE_TEXT = 7;
    TICKIT_TERMCTL_ICONTITLE_TEXT = 8;
    TICKIT_TERMCTL_KEYPAD_APP = 9;
    TICKIT_TERMCTL_COLORS = 10;
    TICKIT_N_TERMCTLS = 11;

type
  PTickitTermMouseMode = ^TTickitTermMouseMode;
  TTickitTermMouseMode =  Longint;
  Const
    TICKIT_TERM_MOUSEMODE_OFF = 0;
    TICKIT_TERM_MOUSEMODE_CLICK = 1;
    TICKIT_TERM_MOUSEMODE_DRAG = 2;
    TICKIT_TERM_MOUSEMODE_MOVE = 3;
type
  PTickitType = ^TTickitType;
  TTickitType =  Longint;
  Const
    TICKIT_TYPE_NONE = 0;
    TICKIT_TYPE_BOOL = 1;
    TICKIT_TYPE_INT = 2;
    TICKIT_TYPE_STR = 3;
    TICKIT_TYPE_COLOUR = 4;

type
  PTickitWindowCtl = ^TTickitWindowCtl;
  TTickitWindowCtl =  Longint;
  Const
    TICKIT_WINCTL_STEAL_INPUT = 1;
    TICKIT_WINCTL_FOCUS_CHILD_NOTIFY = 2;
    TICKIT_WINCTL_CURSORVIS = 3;
    TICKIT_WINCTL_CURSORBLINK = 4;
    TICKIT_WINCTL_CURSORSHAPE = 5;
    TICKIT_N_WINCTLS = 6;
type
  PTickitWindowFlags = ^TTickitWindowFlags;
  TTickitWindowFlags =  Longint;
  Const
    TICKIT_WINDOW_HIDDEN = 1 shl 0;
    TICKIT_WINDOW_LOWEST = 1 shl 1;
    TICKIT_WINDOW_ROOT_PARENT = 1 shl 2;
    TICKIT_WINDOW_STEAL_INPUT = 1 shl 3;
    TICKIT_WINDOW_POPUP = TICKIT_WINDOW_ROOT_PARENT or TICKIT_WINDOW_STEAL_INPUT;
  Const
    TICKIT_MOD_SHIFT = $01;
    TICKIT_MOD_ALT = $02;
    TICKIT_MOD_CTRL = $04;

type
  PTickitPenAttrType = ^TTickitPenAttrType;
  TTickitPenAttrType =  Longint;
  Const
    TICKIT_PENTYPE_BOOL = TICKIT_TYPE_BOOL;
    TICKIT_PENTYPE_INT = TICKIT_TYPE_INT;
    TICKIT_PENTYPE_COLOUR = TICKIT_TYPE_COLOUR;
type
  TTickitStringPos = record
      bytes : Tsize_t;
      codepoints : longint;
      graphemes : longint;
      columns : longint;
    end;
  PTickitStringPos = ^TTickitStringPos;

  PTickitEventFlags = ^TTickitEventFlags;
  TTickitEventFlags =  Longint;
  Const
    TICKIT_EV_FIRE = 1 shl 0;
    TICKIT_EV_UNBIND = 1 shl 1;
    TICKIT_EV_DESTROY = 1 shl 2;

type
  TTickitResizeEventInfo = record
      lines : longint;
      cols : longint;
    end;
  PTickitResizeEventInfo = ^TTickitResizeEventInfo;

  PTickitKeyEventType = ^TTickitKeyEventType;
  TTickitKeyEventType =  Longint;
  Const
    TICKIT_KEYEV_KEY = 1;
    TICKIT_KEYEV_TEXT = 2;

type
  TTickitKeyEventInfo = record
      _type : TTickitKeyEventType;
      mod_ : longint;
      str : Pchar;
    end;
  PTickitKeyEventInfo = ^TTickitKeyEventInfo;

  PTickitMouseEventType = ^TTickitMouseEventType;
  TTickitMouseEventType =  Longint;
  Const
    TICKIT_MOUSEEV_PRESS = 1;
    TICKIT_MOUSEEV_DRAG = 2;
    TICKIT_MOUSEEV_RELEASE = 3;
    TICKIT_MOUSEEV_WHEEL = 4;
    TICKIT_MOUSEEV_DRAG_START = $101;
    TICKIT_MOUSEEV_DRAG_OUTSIDE = 258;
    TICKIT_MOUSEEV_DRAG_DROP = 259;
    TICKIT_MOUSEEV_DRAG_STOP = 260;
  Const
    TICKIT_MOUSEWHEEL_UP = 1;
    TICKIT_MOUSEWHEEL_DOWN = 2;

type
  TTickitMouseEventInfo = record
      _type : TTickitMouseEventType;
      button : longint;
      mod_ : longint;
      line : longint;
      col : longint;
    end;
  PTickitMouseEventInfo = ^TTickitMouseEventInfo;

  TTickitGeomchangeEventInfo = record
      rect : TTickitRect;
      oldrect : TTickitRect;
    end;
  PTickitGeomchangeEventInfo = ^TTickitGeomchangeEventInfo;

  TTickitExposeEventInfo = record
      rect : TTickitRect;
      rb : PTickitRenderBuffer;
    end;
  PTickitExposeEventInfo = ^TTickitExposeEventInfo;

  PTickitFocusEventType = ^TTickitFocusEventType;
  TTickitFocusEventType =  Longint;
  Const
    TICKIT_FOCUSEV_IN = 1;
    TICKIT_FOCUSEV_OUT = 2;

type
  TTickitFocusEventInfo = record
      _type : TTickitFocusEventType;
      win : PTickitWindow;
    end;
  PTickitFocusEventInfo = ^TTickitFocusEventInfo;

function tickit_pen_new:PTickitPen;cdecl;external libtickit;
function tickit_pen_new_attrs(attr:TTickitPenAttr; args:array of const):PTickitPen;cdecl;external libtickit;
function tickit_pen_new_attrs(attr:TTickitPenAttr):PTickitPen;cdecl;external libtickit;
function tickit_pen_clone(orig:PTickitPen):PTickitPen;cdecl;external libtickit;
function tickit_pen_ref(pen:PTickitPen):PTickitPen;cdecl;external libtickit;
procedure tickit_pen_unref(pen:PTickitPen);cdecl;external libtickit;
function tickit_pen_has_attr(pen:PTickitPen; attr:TTickitPenAttr):Tbool;cdecl;external libtickit;
function tickit_pen_is_nonempty(pen:PTickitPen):Tbool;cdecl;external libtickit;
function tickit_pen_nondefault_attr(pen:PTickitPen; attr:TTickitPenAttr):Tbool;cdecl;external libtickit;
function tickit_pen_is_nondefault(pen:PTickitPen):Tbool;cdecl;external libtickit;
function tickit_pen_get_bool_attr(pen:PTickitPen; attr:TTickitPenAttr):Tbool;cdecl;external libtickit;
procedure tickit_pen_set_bool_attr(pen:PTickitPen; attr:TTickitPenAttr; val:Tbool);cdecl;external libtickit;
function tickit_pen_get_int_attr(pen:PTickitPen; attr:TTickitPenAttr):longint;cdecl;external libtickit;
procedure tickit_pen_set_int_attr(pen:PTickitPen; attr:TTickitPenAttr; val:longint);cdecl;external libtickit;
function tickit_pen_get_colour_attr(pen:PTickitPen; attr:TTickitPenAttr):longint;cdecl;external libtickit;
procedure tickit_pen_set_colour_attr(pen:PTickitPen; attr:TTickitPenAttr; value:longint);cdecl;external libtickit;
type
  TTickitPenRGB8 = record
      r : Tuint8_t;
      g : Tuint8_t;
      b : Tuint8_t;
    end;
  PTickitPenRGB8 = ^TTickitPenRGB8;

function tickit_pen_has_colour_attr_rgb8(pen:PTickitPen; attr:TTickitPenAttr):Tbool;cdecl;external libtickit;
function tickit_pen_get_colour_attr_rgb8(pen:PTickitPen; attr:TTickitPenAttr):TTickitPenRGB8;cdecl;external libtickit;
procedure tickit_pen_set_colour_attr_rgb8(pen:PTickitPen; attr:TTickitPenAttr; value:TTickitPenRGB8);cdecl;external libtickit;
function tickit_pen_set_colour_attr_desc(pen:PTickitPen; attr:TTickitPenAttr; value:Pchar):Tbool;cdecl;external libtickit;
procedure tickit_pen_clear_attr(pen:PTickitPen; attr:TTickitPenAttr);cdecl;external libtickit;
procedure tickit_pen_clear(pen:PTickitPen);cdecl;external libtickit;
function tickit_pen_equiv_attr(a:PTickitPen; b:PTickitPen; attr:TTickitPenAttr):Tbool;cdecl;external libtickit;
function tickit_pen_equiv(a:PTickitPen; b:PTickitPen):Tbool;cdecl;external libtickit;
procedure tickit_pen_copy_attr(dst:PTickitPen; src:PTickitPen; attr:TTickitPenAttr);cdecl;external libtickit;
procedure tickit_pen_copy(dst:PTickitPen; src:PTickitPen; overwrite:Tbool);cdecl;external libtickit;
type
  TTickitPenEventFn = function (tt:PTickitPen; flags:TTickitEventFlags; info:pointer; user:pointer):longint;cdecl;

  PTickitPenEvent = ^TTickitPenEvent;
  TTickitPenEvent =  Longint;
  Const
    TICKIT_PEN_ON_DESTROY = 0;
    TICKIT_PEN_ON_CHANGE = 1;

function tickit_pen_bind_event(tt:PTickitPen; ev:TTickitPenEvent; flags:TTickitBindFlags; fn:TTickitPenEventFn; user:pointer):longint;cdecl;external libtickit;
procedure tickit_pen_unbind_event_id(tt:PTickitPen; id:longint);cdecl;external libtickit;
function tickit_pen_attrname(attr:TTickitPenAttr):Pchar;cdecl;external libtickit; deprecated;
function tickit_pen_lookup_attr(name:Pchar):TTickitPenAttr;cdecl;external libtickit;deprecated;
function tickit_pen_attrtype(attr:TTickitPenAttr):TTickitPenAttrType;cdecl;external libtickit;deprecated;
function tickit_penattr_name(attr:TTickitPenAttr):Pchar;cdecl;external libtickit;
function tickit_penattr_lookup(name:Pchar):TTickitPenAttr;cdecl;external libtickit;
function tickit_penattr_type(attr:TTickitPenAttr):TTickitPenAttrType;cdecl;external libtickit;
procedure tickit_rect_init_sized(rect:PTickitRect; top:longint; left:longint; lines:longint; cols:longint);cdecl;external libtickit;
procedure tickit_rect_init_bounded(rect:PTickitRect; top:longint; left:longint; bottom:longint; right:longint);cdecl;external libtickit;
procedure tickit_rect_translate(rect:PTickitRect; downward:longint; rightward:longint);cdecl;external libtickit;
function tickit_rect_intersect(dst:PTickitRect; a:PTickitRect; b:PTickitRect):Tbool;cdecl;external libtickit;
function tickit_rect_intersects(a:PTickitRect; b:PTickitRect):Tbool;cdecl;external libtickit;
function tickit_rect_contains(large:PTickitRect; small:PTickitRect):Tbool;cdecl;external libtickit;

type
  TretRect3Arr=array[0..2] of TTickitRect;
  TretRect4Arr=array[0..3] of TTickitRect;

function tickit_rect_add(ret:TretRect3Arr; a:PTickitRect; b:PTickitRect):longint;cdecl;external libtickit;
function tickit_rect_subtract(ret:TretRect4Arr; orig:PTickitRect; hole:PTickitRect):longint;cdecl;external libtickit;
function tickit_rectset_new:PTickitRectSet;cdecl;external libtickit;
procedure tickit_rectset_destroy(trs:PTickitRectSet);cdecl;external libtickit;
procedure tickit_rectset_clear(trs:PTickitRectSet);cdecl;external libtickit;
function tickit_rectset_rects(trs:PTickitRectSet):Tsize_t;cdecl;external libtickit;
function tickit_rectset_get_rect(trs:PTickitRectSet; i:Tsize_t; rects:PTickitRect):Tsize_t;cdecl;external libtickit;
function tickit_rectset_get_rects(trs:PTickitRectSet; rects:PTickitRect; n:Tsize_t):Tsize_t;cdecl;external libtickit;
procedure tickit_rectset_add(trs:PTickitRectSet; rect:PTickitRect);cdecl;external libtickit;
procedure tickit_rectset_subtract(trs:PTickitRectSet; rect:PTickitRect);cdecl;external libtickit;
procedure tickit_rectset_translate(trs:PTickitRectSet; downward:longint; rightward:longint);cdecl;external libtickit;
function tickit_rectset_intersects(trs:PTickitRectSet; rect:PTickitRect):Tbool;cdecl;external libtickit;
function tickit_rectset_contains(trs:PTickitRectSet; rect:PTickitRect):Tbool;cdecl;external libtickit;
function tickit_string_new(str:Pchar; len:Tsize_t):PTickitString;cdecl;external libtickit;
function tickit_string_ref(s:PTickitString):PTickitString;cdecl;external libtickit;
procedure tickit_string_unref(s:PTickitString);cdecl;external libtickit;
function tickit_string_get(s:PTickitString):Pchar;cdecl;external libtickit;
function tickit_string_len(s:PTickitString):Tsize_t;cdecl;external libtickit;
function tickit_term_new:PTickitTerm;cdecl;external libtickit;
function tickit_term_new_for_termtype(termtype:Pchar):PTickitTerm;cdecl;external libtickit;
procedure tickit_term_destroy(tt:PTickitTerm);cdecl;external libtickit;
Const
  TICKIT_NO_OPEN = 0;
  TICKIT_OPEN_FDS = 1;
  TICKIT_OPEN_STDIO = 2;
  TICKIT_OPEN_STDTTY = 3;
type
  TTickitTerminfoHook = record
    getstr: function(const name, value: PAnsiChar; data: Pointer): PAnsiChar; cdecl;
    data: Pointer;
  end;
  PTickitTerminfoHook = ^TTickitTerminfoHook;

  TTickitTermOutputFunc = procedure (tt:PTickitTerm; bytes:Pchar; len:Tsize_t; user:pointer);cdecl;
  TTickitTermBuilder = record
      termtype : Pchar;
      open :  Longint; // enum
      input_fd : longint;
      output_fd : longint;
      output_func : TTickitTermOutputFunc;
      output_func_user : pointer;
      output_buffersize : Tsize_t;
      driver : PTickitTermDriver;
      ti_hook : PTickitTerminfoHook
    end;
    PTickitTermBuilder = ^TTickitTermBuilder;

function tickit_term_build(builder:PTickitTermBuilder):PTickitTerm;cdecl;external libtickit;
procedure tickit_term_teardown(tt:PTickitTerm);cdecl;external libtickit;
function tickit_term_ref(tt:PTickitTerm):PTickitTerm;cdecl;external libtickit;
procedure tickit_term_unref(tt:PTickitTerm);cdecl;external libtickit;
function tickit_term_open_stdio:PTickitTerm;cdecl;external libtickit;
function tickit_term_get_termtype(tt:PTickitTerm):Pchar;cdecl;external libtickit;
function tickit_term_get_drivername(tt:PTickitTerm):Pchar;cdecl;external libtickit;
function tickit_term_get_driverctl_range(tt:PTickitTerm):longint;cdecl;external libtickit;
procedure tickit_term_set_output_fd(tt:PTickitTerm; fd:longint);cdecl;external libtickit;
function tickit_term_get_output_fd(tt:PTickitTerm):longint;cdecl;external libtickit;
procedure tickit_term_set_output_func(tt:PTickitTerm; fn:TTickitTermOutputFunc; user:pointer);cdecl;external libtickit;
procedure tickit_term_set_output_buffer(tt:PTickitTerm; len:Tsize_t);cdecl;external libtickit;
procedure tickit_term_await_started_msec(tt:PTickitTerm; msec:longint);cdecl;external libtickit;
procedure tickit_term_await_started_tv(tt:PTickitTerm; timeout:Ptimeval);cdecl;external libtickit;
procedure tickit_term_flush(tt:PTickitTerm);cdecl;external libtickit;
procedure tickit_term_pause(tt:PTickitTerm);cdecl;external libtickit;
procedure tickit_term_resume(tt:PTickitTerm);cdecl;external libtickit;
procedure tickit_term_set_input_fd(tt:PTickitTerm; fd:longint);cdecl;external libtickit;
function tickit_term_get_input_fd(tt:PTickitTerm):longint;cdecl;external libtickit;
function tickit_term_get_utf8(tt:PTickitTerm):TTickitMaybeBool;cdecl;external libtickit;
procedure tickit_term_set_utf8(tt:PTickitTerm; utf8:Tbool);cdecl;external libtickit;
procedure tickit_term_input_push_bytes(tt:PTickitTerm; bytes:Pchar; len:Tsize_t);cdecl;external libtickit;
procedure tickit_term_input_readable(tt:PTickitTerm);cdecl;external libtickit;
function tickit_term_input_check_timeout_msec(tt:PTickitTerm):longint;cdecl;external libtickit;
procedure tickit_term_input_wait_msec(tt:PTickitTerm; msec:longint);cdecl;external libtickit;
procedure tickit_term_input_wait_tv(tt:PTickitTerm; timeout:Ptimeval);cdecl;external libtickit;
procedure tickit_term_get_size(tt:PTickitTerm; lines:Plongint; cols:Plongint);cdecl;external libtickit;
procedure tickit_term_set_size(tt:PTickitTerm; lines:longint; cols:longint);cdecl;external libtickit;
procedure tickit_term_refresh_size(tt:PTickitTerm);cdecl;external libtickit;
procedure tickit_term_observe_sigwinch(tt:PTickitTerm; observe:Tbool);cdecl;external libtickit;
type
  TTickitTermEventFn = function (tt:PTickitTerm; flags:TTickitEventFlags; info:pointer; user:pointer):longint;cdecl;

  PTickitTermEvent = ^TTickitTermEvent;
  TTickitTermEvent =  Longint;
  Const
    TICKIT_TERM_ON_DESTROY = 0;
    TICKIT_TERM_ON_RESIZE = 1;
    TICKIT_TERM_ON_KEY = 2;
    TICKIT_TERM_ON_MOUSE = 3;

function tickit_term_bind_event(tt:PTickitTerm; ev:TTickitTermEvent; flags:TTickitBindFlags; fn:TTickitTermEventFn; user:pointer):longint;cdecl;external libtickit;
procedure tickit_term_unbind_event_id(tt:PTickitTerm; id:longint);cdecl;external libtickit;
procedure tickit_term_print(tt:PTickitTerm; str:Pchar);cdecl;external libtickit;
procedure tickit_term_printn(tt:PTickitTerm; str:Pchar; len:Tsize_t);cdecl;external libtickit;
procedure tickit_term_printf(tt:PTickitTerm; fmt:Pchar; args:array of const);cdecl;external libtickit;
procedure tickit_term_printf(tt:PTickitTerm; fmt:Pchar);cdecl;external libtickit;
procedure tickit_term_vprintf(tt:PTickitTerm; fmt:Pchar; args:Tva_list);cdecl;external libtickit;
function tickit_term_goto(tt:PTickitTerm; line:longint; col:longint):Tbool;cdecl;external libtickit;
procedure tickit_term_move(tt:PTickitTerm; downward:longint; rightward:longint);cdecl;external libtickit;
function tickit_term_scrollrect(tt:PTickitTerm; rect:TTickitRect; downward:longint; rightward:longint):Tbool;cdecl;external libtickit;
procedure tickit_term_chpen(tt:PTickitTerm; pen:PTickitPen);cdecl;external libtickit;
procedure tickit_term_setpen(tt:PTickitTerm; pen:PTickitPen);cdecl;external libtickit;
procedure tickit_term_clear(tt:PTickitTerm);cdecl;external libtickit;
procedure tickit_term_erasech(tt:PTickitTerm; count:longint; moveend:TTickitMaybeBool);cdecl;external libtickit;
function tickit_term_getctl_int(tt:PTickitTerm; ctl:TTickitTermCtl; value:Plongint):Tbool;cdecl;external libtickit;
function tickit_term_setctl_int(tt:PTickitTerm; ctl:TTickitTermCtl; value:longint):Tbool;cdecl;external libtickit;
function tickit_term_setctl_str(tt:PTickitTerm; ctl:TTickitTermCtl; value:Pchar):Tbool;cdecl;external libtickit;
procedure tickit_term_emit_key(tt:PTickitTerm; info:PTickitKeyEventInfo);cdecl;external libtickit;
procedure tickit_term_emit_mouse(tt:PTickitTerm; info:PTickitMouseEventInfo);cdecl;external libtickit;
function tickit_termctl_name(ctl:TTickitTermCtl):Pchar;cdecl;external libtickit;
function tickit_termctl_lookup(name:Pchar):TTickitTermCtl;cdecl;external libtickit;
function tickit_termctl_type(ctl:TTickitTermCtl):TTickitType;cdecl;external libtickit;
function tickit_term_ctlname(ctl:TTickitTermCtl):Pchar;cdecl;external libtickit;   deprecated;
function tickit_term_lookup_ctl(name:Pchar):TTickitTermCtl;cdecl;external libtickit;          deprecated;
function tickit_term_ctltype(ctl:TTickitTermCtl):TTickitType;cdecl;external libtickit;                   deprecated;
function tickit_utf8_seqlen(codepoint:longint):longint;cdecl;external libtickit;
function tickit_utf8_put(str:Pchar; len:Tsize_t; codepoint:longint):Tsize_t;cdecl;external libtickit;
function tickit_utf8_count(str:Pchar; pos:PTickitStringPos; limit:PTickitStringPos):Tsize_t;cdecl;external libtickit;
function tickit_utf8_countmore(str:Pchar; pos:PTickitStringPos; limit:PTickitStringPos):Tsize_t;cdecl;external libtickit;
function tickit_utf8_ncount(str:Pchar; len:Tsize_t; pos:PTickitStringPos; limit:PTickitStringPos):Tsize_t;cdecl;external libtickit;
function tickit_utf8_ncountmore(str:Pchar; len:Tsize_t; pos:PTickitStringPos; limit:PTickitStringPos):Tsize_t;cdecl;external libtickit;
function tickit_utf8_mbswidth(str:Pchar):longint;cdecl;external libtickit;
function tickit_utf8_byte2col(str:Pchar; byte:Tsize_t):longint;cdecl;external libtickit;
function tickit_utf8_col2byte(str:Pchar; col:longint):Tsize_t;cdecl;external libtickit;
{ TickitRenderBuffer  }
function tickit_renderbuffer_new(lines:longint; cols:longint):PTickitRenderBuffer;cdecl;external libtickit;
procedure tickit_renderbuffer_destroy(rb:PTickitRenderBuffer);cdecl;external libtickit;
function tickit_renderbuffer_ref(rb:PTickitRenderBuffer):PTickitRenderBuffer;cdecl;external libtickit;
procedure tickit_renderbuffer_unref(rb:PTickitRenderBuffer);cdecl;external libtickit;
procedure tickit_renderbuffer_get_size(rb:PTickitRenderBuffer; lines:Plongint; cols:Plongint);cdecl;external libtickit;
procedure tickit_renderbuffer_translate(rb:PTickitRenderBuffer; downward:longint; rightward:longint);cdecl;external libtickit;
procedure tickit_renderbuffer_clip(rb:PTickitRenderBuffer; rect:PTickitRect);cdecl;external libtickit;
procedure tickit_renderbuffer_mask(rb:PTickitRenderBuffer; mask:PTickitRect);cdecl;external libtickit;
function tickit_renderbuffer_has_cursorpos(rb:PTickitRenderBuffer):Tbool;cdecl;external libtickit;
procedure tickit_renderbuffer_get_cursorpos(rb:PTickitRenderBuffer; line:Plongint; col:Plongint);cdecl;external libtickit;
procedure tickit_renderbuffer_goto(rb:PTickitRenderBuffer; line:longint; col:longint);cdecl;external libtickit;
procedure tickit_renderbuffer_ungoto(rb:PTickitRenderBuffer);cdecl;external libtickit;
procedure tickit_renderbuffer_setpen(rb:PTickitRenderBuffer; pen:PTickitPen);cdecl;external libtickit;
procedure tickit_renderbuffer_reset(rb:PTickitRenderBuffer);cdecl;external libtickit;
procedure tickit_renderbuffer_save(rb:PTickitRenderBuffer);cdecl;external libtickit;
procedure tickit_renderbuffer_savepen(rb:PTickitRenderBuffer);cdecl;external libtickit;
procedure tickit_renderbuffer_restore(rb:PTickitRenderBuffer);cdecl;external libtickit;
procedure tickit_renderbuffer_skip_at(rb:PTickitRenderBuffer; line:longint; col:longint; cols:longint);cdecl;external libtickit;
procedure tickit_renderbuffer_skip(rb:PTickitRenderBuffer; cols:longint);cdecl;external libtickit;
procedure tickit_renderbuffer_skip_to(rb:PTickitRenderBuffer; col:longint);cdecl;external libtickit;
procedure tickit_renderbuffer_skiprect(rb:PTickitRenderBuffer; rect:PTickitRect);cdecl;external libtickit;
function tickit_renderbuffer_text_at(rb:PTickitRenderBuffer; line:longint; col:longint; text:Pchar):longint;cdecl;external libtickit;
function tickit_renderbuffer_textn_at(rb:PTickitRenderBuffer; line:longint; col:longint; text:Pchar; len:Tsize_t):longint;cdecl;external libtickit;
function tickit_renderbuffer_text(rb:PTickitRenderBuffer; text:Pchar):longint;cdecl;external libtickit;
function tickit_renderbuffer_textn(rb:PTickitRenderBuffer; text:Pchar; len:Tsize_t):longint;cdecl;external libtickit;
function tickit_renderbuffer_textf_at(rb:PTickitRenderBuffer; line:longint; col:longint; fmt:Pchar; args:array of const):longint;cdecl;external libtickit;
function tickit_renderbuffer_textf_at(rb:PTickitRenderBuffer; line:longint; col:longint; fmt:Pchar):longint;cdecl;external libtickit;
function tickit_renderbuffer_vtextf_at(rb:PTickitRenderBuffer; line:longint; col:longint; fmt:Pchar; args:Tva_list):longint;cdecl;external libtickit;
function tickit_renderbuffer_textf(rb:PTickitRenderBuffer; fmt:Pchar; args:array of const):longint;cdecl;external libtickit;
function tickit_renderbuffer_textf(rb:PTickitRenderBuffer; fmt:Pchar):longint;cdecl;external libtickit;
function tickit_renderbuffer_vtextf(rb:PTickitRenderBuffer; fmt:Pchar; args:Tva_list):longint;cdecl;external libtickit;
procedure tickit_renderbuffer_erase_at(rb:PTickitRenderBuffer; line:longint; col:longint; cols:longint);cdecl;external libtickit;
procedure tickit_renderbuffer_erase(rb:PTickitRenderBuffer; cols:longint);cdecl;external libtickit;
procedure tickit_renderbuffer_erase_to(rb:PTickitRenderBuffer; col:longint);cdecl;external libtickit;
procedure tickit_renderbuffer_eraserect(rb:PTickitRenderBuffer; rect:PTickitRect);cdecl;external libtickit;
procedure tickit_renderbuffer_clear(rb:PTickitRenderBuffer);cdecl;external libtickit;
procedure tickit_renderbuffer_char_at(rb:PTickitRenderBuffer; line:longint; col:longint; codepoint:longint);cdecl;external libtickit;
procedure tickit_renderbuffer_char(rb:PTickitRenderBuffer; codepoint:longint);cdecl;external libtickit;
procedure tickit_renderbuffer_hline_at(rb:PTickitRenderBuffer; line:longint; startcol:longint; endcol:longint; style:TTickitLineStyle; 
            caps:TTickitLineCaps);cdecl;external libtickit;
procedure tickit_renderbuffer_vline_at(rb:PTickitRenderBuffer; startline:longint; endline:longint; col:longint; style:TTickitLineStyle; 
            caps:TTickitLineCaps);cdecl;external libtickit;
procedure tickit_renderbuffer_copyrect(rb:PTickitRenderBuffer; dest:PTickitRect; src:PTickitRect);cdecl;external libtickit;
procedure tickit_renderbuffer_moverect(rb:PTickitRenderBuffer; dest:PTickitRect; src:PTickitRect);cdecl;external libtickit;
procedure tickit_renderbuffer_flush_to_term(rb:PTickitRenderBuffer; tt:PTickitTerm);cdecl;external libtickit;
procedure tickit_renderbuffer_blit(dst:PTickitRenderBuffer; src:PTickitRenderBuffer);cdecl;external libtickit;
{ This API is still somewhat experimental }
type
  PTickitRenderBufferLineMask = ^TTickitRenderBufferLineMask;
  TTickitRenderBufferLineMask = record
      north : char;
      south : char;
      east : char;
      west : char;
    end;

function tickit_renderbuffer_get_cell_active(rb:PTickitRenderBuffer; line:longint; col:longint):longint;cdecl;external libtickit;
function tickit_renderbuffer_get_cell_text(rb:PTickitRenderBuffer; line:longint; col:longint; buffer:Pchar; len:Tsize_t):Tsize_t;cdecl;external libtickit;
function tickit_renderbuffer_get_cell_linemask(rb:PTickitRenderBuffer; line:longint; col:longint):TTickitRenderBufferLineMask;cdecl;external libtickit;
{ returns a direct pointer - do not free or modify }
function tickit_renderbuffer_get_cell_pen(rb:PTickitRenderBuffer; line:longint; col:longint):PTickitPen;cdecl;external libtickit;
type
  PTickitRenderBufferSpanInfo = ^TTickitRenderBufferSpanInfo;
  TTickitRenderBufferSpanInfo = record
      is_active : Tbool;
      n_columns : longint;
      text : Pchar;
      len : Tsize_t;
      pen : PTickitPen;
    end;

{ returns the text length or -1 on error }

function tickit_renderbuffer_get_span(rb:PTickitRenderBuffer; line:longint; startcol:longint; info:PTickitRenderBufferSpanInfo; buffer:Pchar; 
           len:Tsize_t):Tsize_t;cdecl;external libtickit;
{ Window  }
function tickit_window_new_root(term:PTickitTerm):PTickitWindow;cdecl;external libtickit;
function tickit_window_new(parent:PTickitWindow; rect:TTickitRect; flags:TTickitWindowFlags):PTickitWindow;cdecl;external libtickit;
function tickit_window_parent(win:PTickitWindow):PTickitWindow;cdecl;external libtickit;
function tickit_window_root(win:PTickitWindow):PTickitWindow;cdecl;external libtickit;
function tickit_window_children(win:PTickitWindow):Tsize_t;cdecl;external libtickit;
function tickit_window_get_children(win:PTickitWindow; children:PPTickitWindow; n:Tsize_t):Tsize_t;cdecl;external libtickit;
function tickit_window_get_term(win:PTickitWindow):PTickitTerm;cdecl;external libtickit;
procedure tickit_window_close(win:PTickitWindow);cdecl;external libtickit;
procedure tickit_window_destroy(win:PTickitWindow);cdecl;external libtickit;
function tickit_window_ref(win:PTickitWindow):PTickitWindow;cdecl;external libtickit;
procedure tickit_window_unref(win:PTickitWindow);cdecl;external libtickit;
type
  TTickitWindowEventFn = function (win:PTickitWindow; flags:TTickitEventFlags; info:pointer; user:pointer):longint;cdecl;

  PTickitWindowEvent = ^TTickitWindowEvent;
  TTickitWindowEvent =  Longint;
  Const
    TICKIT_WINDOW_ON_DESTROY = 0;
    TICKIT_WINDOW_ON_GEOMCHANGE = 1;
    TICKIT_WINDOW_ON_EXPOSE = 2;
    TICKIT_WINDOW_ON_FOCUS = 3;
    TICKIT_WINDOW_ON_KEY = 4;
    TICKIT_WINDOW_ON_MOUSE = 5;

function tickit_window_bind_event(win:PTickitWindow; ev:TTickitWindowEvent; flags:TTickitBindFlags; fn:TTickitWindowEventFn; user:pointer):longint;cdecl;external libtickit;
procedure tickit_window_unbind_event_id(win:PTickitWindow; id:longint);cdecl;external libtickit;
procedure tickit_window_raise(win:PTickitWindow);cdecl;external libtickit;
procedure tickit_window_raise_to_front(win:PTickitWindow);cdecl;external libtickit;
procedure tickit_window_lower(win:PTickitWindow);cdecl;external libtickit;
procedure tickit_window_lower_to_back(win:PTickitWindow);cdecl;external libtickit;
procedure tickit_window_show(win:PTickitWindow);cdecl;external libtickit;
procedure tickit_window_hide(win:PTickitWindow);cdecl;external libtickit;
function tickit_window_is_visible(win:PTickitWindow):Tbool;cdecl;external libtickit;
function tickit_window_get_geometry(win:PTickitWindow):TTickitRect;cdecl;external libtickit;
function tickit_window_get_abs_geometry(win:PTickitWindow):TTickitRect;cdecl;external libtickit;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function tickit_window_top(win : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function tickit_window_left(win : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function tickit_window_lines(win : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function tickit_window_cols(win : longint) : longint;

function tickit_window_bottom(win:PTickitWindow):longint;cdecl;external libtickit;
function tickit_window_right(win:PTickitWindow):longint;cdecl;external libtickit;
procedure tickit_window_resize(win:PTickitWindow; lines:longint; cols:longint);cdecl;external libtickit;
procedure tickit_window_reposition(win:PTickitWindow; top:longint; left:longint);cdecl;external libtickit;
procedure tickit_window_set_geometry(win:PTickitWindow; rect:TTickitRect);cdecl;external libtickit;
function tickit_window_get_pen(win:PTickitWindow):PTickitPen;cdecl;external libtickit;
procedure tickit_window_set_pen(win:PTickitWindow; pen:PTickitPen);cdecl;external libtickit;
procedure tickit_window_expose(win:PTickitWindow; exposed:PTickitRect);cdecl;external libtickit;
procedure tickit_window_flush(win:PTickitWindow);cdecl;external libtickit;
function tickit_window_scrollrect(win:PTickitWindow; rect:PTickitRect; downward:longint; rightward:longint; pen:PTickitPen):Tbool;cdecl;external libtickit;
function tickit_window_scroll(win:PTickitWindow; downward:longint; rightward:longint):Tbool;cdecl;external libtickit;
function tickit_window_scroll_with_children(win:PTickitWindow; downward:longint; rightward:longint):Tbool;cdecl;external libtickit;
procedure tickit_window_set_cursor_position(win:PTickitWindow; line:longint; col:longint);cdecl;external libtickit;
procedure tickit_window_set_cursor_visible(win:PTickitWindow; visible:Tbool);cdecl;external libtickit;
procedure tickit_window_set_cursor_shape(win:PTickitWindow; shape:TTickitCursorShape);cdecl;external libtickit;
procedure tickit_window_take_focus(win:PTickitWindow);cdecl;external libtickit;
function tickit_window_is_focused(win:PTickitWindow):Tbool;cdecl;external libtickit;
procedure tickit_window_set_focus_child_notify(win:PTickitWindow; notify:Tbool);cdecl;external libtickit;
function tickit_window_getctl_int(win:PTickitWindow; ctl:TTickitWindowCtl; value:Plongint):Tbool;cdecl;external libtickit;
function tickit_window_setctl_int(win:PTickitWindow; ctl:TTickitWindowCtl; value:longint):Tbool;cdecl;external libtickit;
function tickit_window_is_steal_input(win:PTickitWindow):Tbool;cdecl;external libtickit;
procedure tickit_window_set_steal_input(win:PTickitWindow; steal:Tbool);cdecl;external libtickit;
function tickit_windowctl_name(ctl:TTickitWindowCtl):Pchar;cdecl;external libtickit;
function tickit_windowctl_lookup(name:Pchar):TTickitWindowCtl;cdecl;external libtickit;
function tickit_windowctl_type(ctl:TTickitWindowCtl):TTickitType;cdecl;external libtickit;
function tickit_window_ctlname(ctl:TTickitWindowCtl):Pchar;cdecl;external libtickit;deprecated;
function tickit_window_lookup_ctl(name:Pchar):TTickitWindowCtl;cdecl;external libtickit;       deprecated;
function tickit_window_ctltype(ctl:TTickitWindowCtl):TTickitType;cdecl;external libtickit;                deprecated;
type
  TTickitCallbackFn = function (t:PTickit; flags:TTickitEventFlags; info:pointer; user:pointer):longint;cdecl;

function tickit_new_for_term(tt:PTickitTerm):PTickit;cdecl;external libtickit;
function tickit_new_stdio:PTickit;cdecl;external libtickit;
function tickit_new_stdtty:PTickit;cdecl;external libtickit;
function tickit_ref(t:PTickit):PTickit;cdecl;external libtickit;
procedure tickit_unref(t:PTickit);cdecl;external libtickit;
type
  TTickitBuilder = record
      tt : PTickitTerm;
      term_builder : TTickitTermBuilder;
      evhooks : PTickitEventHooks;
      evinitdata : pointer;
    end;
  PTickitBuilder = ^TTickitBuilder;

function tickit_build(builder:PTickitBuilder):PTickit;cdecl;external libtickit;
function tickit_get_term(t:PTickit):PTickitTerm;cdecl;external libtickit;
function tickit_get_rootwin(t:PTickit):PTickitWindow;cdecl;external libtickit;
procedure tickit_run(t:PTickit);cdecl;external libtickit;
procedure tickit_stop(t:PTickit);cdecl;external libtickit;
procedure tickit_tick(t:PTickit; flags:TTickitRunFlags);cdecl;external libtickit;
function tickit_getctl_int(tt:PTickit; ctl:TTickitCtl; value:Plongint):Tbool;cdecl;external libtickit;
function tickit_setctl_int(tt:PTickit; ctl:TTickitCtl; value:longint):Tbool;cdecl;external libtickit;
function tickit_ctl_name(ctl:TTickitCtl):Pchar;cdecl;external libtickit;
function tickit_ctl_lookup(name:Pchar):TTickitCtl;cdecl;external libtickit;
function tickit_ctl_type(ctl:TTickitCtl):TTickitType;cdecl;external libtickit;
function tickit_ctlname(ctl:TTickitCtl):Pchar;cdecl;external libtickit;       deprecated;
function tickit_lookup_ctl(name:Pchar):TTickitCtl;cdecl;external libtickit;              deprecated;
function tickit_ctltype(ctl:TTickitCtl):TTickitType;cdecl;external libtickit;                       deprecated;
function tickit_watch_io(t:PTickit; fd:longint; cond:TTickitIOCondition; flags:TTickitBindFlags; fn:TTickitCallbackFn;
           user:pointer):pointer;cdecl;external libtickit;
function tickit_watch_io_read(t:PTickit; fd:longint; flags:TTickitBindFlags; fn:TTickitCallbackFn; user:pointer):pointer;cdecl;external libtickit;
function tickit_watch_timer_after_msec(t:PTickit; msec:longint; flags:TTickitBindFlags; fn:TTickitCallbackFn; user:pointer):pointer;cdecl;external libtickit;
function tickit_watch_timer_after_tv(t:PTickit; after:Ptimeval; flags:TTickitBindFlags; fn:TTickitCallbackFn; user:pointer):pointer;cdecl;external libtickit;
function tickit_watch_timer_at_epoch(t:PTickit; at:Ttime_t; flags:TTickitBindFlags; fn:TTickitCallbackFn; user:pointer):pointer;cdecl;external libtickit;
function tickit_watch_timer_at_tv(t:PTickit; at:Ptimeval; flags:TTickitBindFlags; fn:TTickitCallbackFn; user:pointer):pointer;cdecl;external libtickit;
function tickit_watch_later(t:PTickit; flags:TTickitBindFlags; fn:TTickitCallbackFn; user:pointer):pointer;cdecl;external libtickit;
function tickit_watch_signal(t:PTickit; signum:longint; flags:TTickitBindFlags; fn:TTickitCallbackFn; user:pointer):pointer;cdecl;external libtickit;
function tickit_watch_process(t:PTickit; pid:Tpid_t; flags:TTickitBindFlags; fn:TTickitCallbackFn; user:pointer):pointer;cdecl;external libtickit;
procedure tickit_watch_cancel(t:PTickit; watch:pointer);cdecl;external libtickit;
{ Debug support  }
procedure tickit_debug_init;cdecl;external libtickit;
  var
    tickit_debug_enabled : Tbool;cvar;external libtickit;

procedure tickit_debug_logf(flag:Pchar; fmt:Pchar; args:array of const);cdecl;external libtickit;
procedure tickit_debug_logf(flag:Pchar; fmt:Pchar);cdecl;external libtickit;
procedure tickit_debug_vlogf(flag:Pchar; fmt:Pchar; args:Tva_list);cdecl;external libtickit;
procedure tickit_debug_set_func(func:procedure (str:Pchar; data:pointer); data:pointer);cdecl;external libtickit;
procedure tickit_debug_set_fh(fh:PFILE);cdecl;external libtickit;
function tickit_debug_open(path:Pchar):Tbool;cdecl;external libtickit;
{$endif}
{ C++ end of extern C conditionnal removed }

{ xxxxxxxxxxxx }
{static inline int tickit_rect_bottom(const TickitRect *rect) }
{ return rect->top + rect->lines;  }
{static inline int tickit_rect_right (const TickitRect *rect) }
{ return rect->left + rect->cols;  }


{
static inline void tickit_stringpos_zero(TickitStringPos *pos)
  pos->bytes = pos->codepoints = pos->graphemes = pos->columns = 0;


#define INIT_TICKIT_STRINGPOS_LIMIT_NONE  .bytes = -1, .codepoints = -1, .graphemes = -1, .columns = -1
static inline void tickit_stringpos_limit_none(TickitStringPos *pos)

  pos->bytes = pos->codepoints = pos->graphemes = pos->columns = -1;


#define INIT_TICKIT_STRINGPOS_LIMIT_BYTES(v)  .bytes = (v), .codepoints = -1, .graphemes = -1, .columns = -1
static inline void tickit_stringpos_limit_bytes(TickitStringPos *pos, size_t bytes)
  pos->codepoints = pos->graphemes = pos->columns = -1;
  pos->bytes = bytes;


#define INIT_TICKIT_STRINGPOS_LIMIT_CODEPOINTS(v)  .bytes = -1, .codepoints = (v), .graphemes = -1, .columns = -1
static inline void tickit_stringpos_limit_codepoints(TickitStringPos *pos, int codepoints)
  pos->bytes = pos->graphemes = pos->columns = -1;
  pos->codepoints = codepoints;


#define INIT_TICKIT_STRINGPOS_LIMIT_GRAPHEMES(v)  .bytes = -1, .codepoints = -1, .graphemes = (v), .columns = -1
static inline void tickit_stringpos_limit_graphemes(TickitStringPos *pos, int graphemes)
  pos->bytes = pos->codepoints = pos->columns = -1;
  pos->graphemes = graphemes;


#define INIT_TICKIT_STRINGPOS_LIMIT_COLUMNS(v)  .bytes = -1, .codepoints = -1, .graphemes = -1, .columns = (v)
static inline void tickit_stringpos_limit_columns(TickitStringPos *pos, int columns)
  pos->bytes = pos->codepoints = pos->graphemes = -1;
  pos->columns = columns;

 }



// === Konventiert am: 2-5-25 13:40:41 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function tickit_window_top(win : longint) : longint;
begin
  tickit_window_top:=(tickit_window_get_geometry(win)).top;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function tickit_window_left(win : longint) : longint;
begin
  tickit_window_left:=(tickit_window_get_geometry(win)).left;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function tickit_window_lines(win : longint) : longint;
begin
  tickit_window_lines:=(tickit_window_get_geometry(win)).lines;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function tickit_window_cols(win : longint) : longint;
begin
  tickit_window_cols:=(tickit_window_get_geometry(win)).cols;
end;


end.
