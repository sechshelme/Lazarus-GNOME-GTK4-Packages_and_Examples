unit tk;

interface

uses
  x, xlib,
  ctypes, tcl, tk_tcl_common;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  TK_MAJOR_VERSION = 8;  
  TK_MINOR_VERSION = 6;  
  TK_RELEASE_LEVEL = TCL_FINAL_RELEASE;  
  TK_RELEASE_SERIAL = 14;  
  TK_VERSION = '8.6';  
  TK_PATCH_LEVEL = '8.6.14';  
type
  PTk_BindingTable = ^TTk_BindingTable;
  TTk_BindingTable = record end;

  PTk_Canvas = ^TTk_Canvas;
  TTk_Canvas =  record end;

  PTk_Cursor = ^TTk_Cursor;
  TTk_Cursor =  record end;

  PTk_ErrorHandler = ^TTk_ErrorHandler;
  TTk_ErrorHandler =  record end;

  PTk_Font = ^TTk_Font;
  TTk_Font =  record end;

  PTk_Image = ^TTk_Image;
  TTk_Image =  record end;

  PTk_ImageMaster = ^TTk_ImageMaster;
  TTk_ImageMaster =  record end;

  PTk_OptionTable = ^TTk_OptionTable;
  TTk_OptionTable =  record end;

  PTk_PostscriptInfo = ^TTk_PostscriptInfo;
  TTk_PostscriptInfo =  record end;

  PTk_TextLayout = ^TTk_TextLayout;
  TTk_TextLayout =  record end;

  PTk_Window = ^TTk_Window;
  TTk_Window =  record end;

  PTk_3DBorder = ^TTk_3DBorder;
  TTk_3DBorder =  record end;

  PTk_Style = ^TTk_Style;
  TTk_Style =  record end;

  PTk_StyleEngine = ^TTk_StyleEngine;
  TTk_StyleEngine =  record end;

  PTk_StyledElement = ^TTk_StyledElement;
  TTk_StyledElement =  record end;

  PTk_Uid = ^TTk_Uid;
  TTk_Uid = Pchar;

type
  TTk_ImageModel = TTk_ImageMaster;

  PTk_OptionType = ^TTk_OptionType;
  TTk_OptionType =  Longint;
  Const
    TK_OPTION_BOOLEAN = 0;
    TK_OPTION_INT = 1;
    TK_OPTION_DOUBLE = 2;
    TK_OPTION_STRING = 3;
    TK_OPTION_STRING_TABLE = 4;
    TK_OPTION_COLOR = 5;
    TK_OPTION_FONT = 6;
    TK_OPTION_BITMAP = 7;
    TK_OPTION_BORDER = 8;
    TK_OPTION_RELIEF = 9;
    TK_OPTION_CURSOR = 10;
    TK_OPTION_JUSTIFY = 11;
    TK_OPTION_ANCHOR = 12;
    TK_OPTION_SYNONYM = 13;
    TK_OPTION_PIXELS = 14;
    TK_OPTION_WINDOW = 15;
    TK_OPTION_END = 16;
    TK_OPTION_CUSTOM = 17;
    TK_OPTION_STYLE = 18;
type
  TTk_OptionSpec = record
      _type : TTk_OptionType;
      optionName : Pchar;
      dbName : Pchar;
      dbClass : Pchar;
      defValue : Pchar;
      objOffset : longint;
      internalOffset : longint;
      flags : longint;
      clientData : pointer;
      typeMask : longint;
    end;
  PTk_OptionSpec = ^TTk_OptionSpec;

const
  TK_OPTION_NULL_OK = 1 shl 0;  
  TK_OPTION_DONT_SET_DEFAULT = 1 shl 3;  
type
    TTk_CustomOptionSetProc = function (clientData:TClientData; interp:PTcl_Interp; tkwin:TTk_Window; value:PPTcl_Obj; widgRec:Pchar;                 offset:longint; saveInternalPtr:Pchar; flags:longint):longint;cdecl;
    PTk_CustomOptionSetProc=^TTk_CustomOptionSetProc;
    TTk_CustomOptionGetProc = function (clientData:TClientData; tkwin:TTk_Window; widgRec:Pchar; offset:longint):PTcl_Obj;cdecl;
    PTk_CustomOptionGetProc = ^TTk_CustomOptionGetProc;
    TTk_CustomOptionRestoreProc = procedure (clientData:TClientData; tkwin:TTk_Window; internalPtr:Pchar; saveInternalPtr:Pchar);cdecl;
    PTk_CustomOptionRestoreProc=^TTk_CustomOptionRestoreProc;
    TTk_CustomOptionFreeProc = procedure (clientData:TClientData; tkwin:TTk_Window; internalPtr:Pchar);cdecl;
    PTk_CustomOptionFreeProc=^TTk_CustomOptionFreeProc;

  PTk_ObjCustomOption = ^TTk_ObjCustomOption;
  TTk_ObjCustomOption = record
      name : Pchar;
      setProc : PTk_CustomOptionSetProc;
      getProc : PTk_CustomOptionGetProc;
      restoreProc : PTk_CustomOptionRestoreProc;
      freeProc : PTk_CustomOptionFreeProc;
      clientData : TClientData;
    end;

type
  PTk_SavedOption = ^TTk_SavedOption;
  TTk_SavedOption = record
      optionPtr : PTkOption;
      valuePtr : PTcl_Obj;
      internalForm : double;
    end;
const
  TK_NUM_SAVED_OPTIONS = 20;  
type
  PTk_SavedOptions = ^TTk_SavedOptions;
  TTk_SavedOptions = record
      recordPtr : Pchar;
      tkwin : TTk_Window;
      numItems : longint;
      items : array[0..(TK_NUM_SAVED_OPTIONS)-1] of TTk_SavedOption;
      nextPtr : PTk_SavedOptions;
    end;
type
    TTk_OptionParseProc = function (clientData:TClientData; interp:PTcl_Interp; tkwin:TTk_Window; value:Pchar; widgRec:Pchar;                 offset:longint):longint;cdecl;
    PTk_OptionParseProc=^TTk_OptionParseProc;
    TTk_OptionPrintProc = function (clientData:TClientData; tkwin:TTk_Window; widgRec:Pchar; offset:longint; freeProcPtr:PPTcl_FreeProc):Pchar;cdecl;
    PTk_OptionPrintProc = ^TTk_OptionPrintProc;

  PTk_CustomOption = ^TTk_CustomOption;
  TTk_CustomOption = record
      parseProc : PTk_OptionParseProc;
      printProc : PTk_OptionPrintProc;
      clientData : TClientData;
    end;

  PTk_ConfigSpec = ^TTk_ConfigSpec;
  TTk_ConfigSpec = record
      _type : longint;
      argvName : Pchar;
      dbName : TTk_Uid;
      dbClass : TTk_Uid;
      defValue : TTk_Uid;
      offset : longint;
      specFlags : longint;
      customPtr : PTk_CustomOption;
    end;

  PTk_ConfigTypes = ^TTk_ConfigTypes;
  TTk_ConfigTypes =  Longint;
  Const
    TK_CONFIG_BOOLEAN = 0;
    TK_CONFIG_INT = 1;
    TK_CONFIG_DOUBLE = 2;
    TK_CONFIG_STRING = 3;
    TK_CONFIG_UID = 4;
    TK_CONFIG_COLOR = 5;
    TK_CONFIG_FONT = 6;
    TK_CONFIG_BITMAP = 7;
    TK_CONFIG_BORDER = 8;
    TK_CONFIG_RELIEF = 9;
    TK_CONFIG_CURSOR = 10;
    TK_CONFIG_ACTIVE_CURSOR = 11;
    TK_CONFIG_JUSTIFY = 12;
    TK_CONFIG_ANCHOR = 13;
    TK_CONFIG_SYNONYM = 14;
    TK_CONFIG_CAP_STYLE = 15;
    TK_CONFIG_JOIN_STYLE = 16;
    TK_CONFIG_PIXELS = 17;
    TK_CONFIG_MM = 18;
    TK_CONFIG_WINDOW = 19;
    TK_CONFIG_CUSTOM = 20;
    TK_CONFIG_END = 21;
const
  TK_CONFIG_ARGV_ONLY = 1;
  TK_CONFIG_OBJS = $80;  
  TK_CONFIG_NULL_OK = 1 shl 0;
  TK_CONFIG_COLOR_ONLY = 1 shl 1;  
  TK_CONFIG_MONO_ONLY = 1 shl 2;  
  TK_CONFIG_DONT_SET_DEFAULT = 1 shl 3;  
  TK_CONFIG_OPTION_SPECIFIED = 1 shl 4;  
  TK_CONFIG_USER_BIT = $100;  
type
  PTk_ArgvInfo = ^TTk_ArgvInfo;
  TTk_ArgvInfo = record
      key : Pchar;
      _type : longint;
      src : Pchar;
      dst : Pchar;
      help : Pchar;
    end;

const
  TK_ARGV_CONSTANT = 15;  
  TK_ARGV_INT = 16;  
  TK_ARGV_STRING = 17;  
  TK_ARGV_UID = 18;  
  TK_ARGV_REST = 19;  
  TK_ARGV_FLOAT = 20;  
  TK_ARGV_FUNC = 21;  
  TK_ARGV_GENFUNC = 22;  
  TK_ARGV_HELP = 23;  
  TK_ARGV_CONST_OPTION = 24;  
  TK_ARGV_OPTION_VALUE = 25;  
  TK_ARGV_OPTION_NAME_VALUE = 26;  
  TK_ARGV_END = 27;  
  TK_ARGV_NO_DEFAULTS = $1;
  TK_ARGV_NO_LEFTOVERS = $2;  
  TK_ARGV_NO_ABBREV = $4;  
  TK_ARGV_DONT_SKIP_FIRST_ARG = $8;  
type
  PTk_RestrictAction = ^TTk_RestrictAction;
  TTk_RestrictAction =  Longint;
  Const
    TK_DEFER_EVENT = 0;
    TK_PROCESS_EVENT = 1;
    TK_DISCARD_EVENT = 2;
const
  TK_WIDGET_DEFAULT_PRIO = 20;
  TK_STARTUP_FILE_PRIO = 40;  
  TK_USER_DEFAULT_PRIO = 60;  
  TK_INTERACTIVE_PRIO = 80;  
  TK_MAX_PRIO = 100;  
  TK_RELIEF_NULL = -(1);
  TK_RELIEF_FLAT = 0;  
  TK_RELIEF_GROOVE = 1;  
  TK_RELIEF_RAISED = 2;  
  TK_RELIEF_RIDGE = 3;  
  TK_RELIEF_SOLID = 4;  
  TK_RELIEF_SUNKEN = 5;  
  TK_3D_FLAT_GC = 1;
  TK_3D_LIGHT_GC = 2;  
  TK_3D_DARK_GC = 3;  
  TK_NOTIFY_SHARE = 20;
type
  PTk_Anchor = ^TTk_Anchor;
  TTk_Anchor =  Longint;
  Const
    TK_ANCHOR_N = 0;
    TK_ANCHOR_NE = 1;
    TK_ANCHOR_E = 2;
    TK_ANCHOR_SE = 3;
    TK_ANCHOR_S = 4;
    TK_ANCHOR_SW = 5;
    TK_ANCHOR_W = 6;
    TK_ANCHOR_NW = 7;
    TK_ANCHOR_CENTER = 8;
type
  PTk_Justify = ^TTk_Justify;
  TTk_Justify =  Longint;
  Const
    TK_JUSTIFY_LEFT = 0;
    TK_JUSTIFY_RIGHT = 1;
    TK_JUSTIFY_CENTER = 2;
type
  PTk_FontMetrics = ^TTk_FontMetrics;
  TTk_FontMetrics = record
      ascent : longint;
      descent : longint;
      linespace : longint;
    end;

const
  TK_WHOLE_WORDS = 1;  
  TK_AT_LEAST_ONE = 2;  
  TK_PARTIAL_OK = 4;  
  TK_IGNORE_TABS = 8;
  TK_IGNORE_NEWLINES = 16;
type
    TTk_ClassCreateProc = function (tkwin:TTk_Window; parent:TWindow; instanceData:TClientData):TWindow;cdecl;
    PTk_ClassCreateProc=^TTk_ClassCreateProc;
    TTk_ClassWorldChangedProc = procedure (instanceData:TClientData);cdecl;
    PTk_ClassWorldChangedProc=^TTk_ClassWorldChangedProc;
    TTk_ClassModalProc = procedure (tkwin:TTk_Window; eventPtr:PXEvent);cdecl;
    PTk_ClassModalProc=^TTk_ClassModalProc;

  PTk_ClassProcs = ^TTk_ClassProcs;
  TTk_ClassProcs = record
      size : dword;
      worldChangedProc : PTk_ClassWorldChangedProc;
      createProc : PTk_ClassCreateProc;
      modalProc : PTk_ClassModalProc;
    end;

type
TTk_GeomRequestProc = procedure (clientData:TClientData; tkwin:TTk_Window);cdecl;
PTk_GeomRequestProc=^TTk_GeomRequestProc;
TTk_GeomLostContentProc = procedure (clientData:TClientData; tkwin:TTk_Window);cdecl;
PTk_GeomLostContentProc=^TTk_GeomLostContentProc;

  PTk_GeomMgr = ^TTk_GeomMgr;
  TTk_GeomMgr = record
      name : Pchar;
      requestProc : PTk_GeomRequestProc;
      lostSlaveProc : PTk_GeomLostContentProc;
    end;

  TTk_GeomLostSlaveProc=  TTk_GeomLostContentProc ;

const
  TK_SCROLL_MOVETO = 1;  
  TK_SCROLL_PAGES = 2;  
  TK_SCROLL_UNITS = 3;  
  TK_SCROLL_ERROR = 4;  

  VirtualEvent = MappingNotify+1;
  ActivateNotify = MappingNotify+2;  
  DeactivateNotify = MappingNotify+3;  
  MouseWheelEvent = MappingNotify+4;  
  TK_LASTEVENT = MappingNotify+5;  
  MouseWheelMask = 1 shl 28;  
  ActivateMask = 1 shl 29;  
  VirtualEventMask = 1 shl 30;  
type
  PXVirtualEvent = ^TXVirtualEvent;
  TXVirtualEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      event : TWindow;
      root : TWindow;
      subwindow : TWindow;
      time : TTime;
      x : longint;
      y : longint;
      x_root : longint;
      y_root : longint;
      state : dword;
      name : TTk_Uid;
      same_screen : TBool;
      user_data : PTcl_Obj;
    end;

  PXActivateDeactivateEvent = ^TXActivateDeactivateEvent;
  TXActivateDeactivateEvent = record
      _type : longint;
      serial : dword;
      send_event : TBool;
      display : PDisplay;
      window : TWindow;
    end;

  PXActivateEvent = ^TXActivateEvent;
  TXActivateEvent = TXActivateDeactivateEvent;

  PXDeactivateEvent = ^TXDeactivateEvent;
  TXDeactivateEvent = TXActivateDeactivateEvent;

type
  PTk_FakeWin = ^TTk_FakeWin;
  TTk_FakeWin = record
      display : PDisplay;
      dummy1 : Pchar;
      screenNum : longint;
      visual : PVisual;
      depth : longint;
      window : TWindow;
      dummy2 : Pchar;
      dummy3 : Pchar;
      parentPtr : TTk_Window;
      dummy4 : Pchar;
      dummy5 : Pchar;
      pathName : Pchar;
      nameUid : TTk_Uid;
      classUid : TTk_Uid;
      changes : TXWindowChanges;
      dummy6 : dword;
      atts : TXSetWindowAttributes;
      dummy7 : dword;
      flags : dword;
      dummy8 : Pchar;
      dummy9 : TXIC;
      dummy10 : PClientData;
      dummy11 : longint;
      dummy12 : longint;
      dummy13 : Pchar;
      dummy14 : Pchar;
      dummy15 : TClientData;
      reqWidth : longint;
      reqHeight : longint;
      internalBorderLeft : longint;
      dummy16 : Pchar;
      dummy17 : Pchar;
      dummy18 : TClientData;
      dummy19 : Pchar;
      internalBorderRight : longint;
      internalBorderTop : longint;
      internalBorderBottom : longint;
      minReqWidth : longint;
      minReqHeight : longint;
      dummy20 : longint;
      dummy21 : Pchar;
      dummy22 : TTk_Window;
    end;

const
  TK_MAPPED = 1;  
  TK_TOP_LEVEL = 2;  
  TK_ALREADY_DEAD = 4;  
  TK_NEED_CONFIG_NOTIFY = 8;  
  TK_GRAB_FLAG = $10;  
  TK_CHECKED_IC = $20;  
  TK_DONT_DESTROY_WINDOW = $40;  
  TK_WM_COLORMAP_WINDOW = $80;  
  TK_EMBEDDED = $100;  
  TK_CONTAINER = $200;  
  TK_BOTH_HALVES = $400;  
  TK_WRAPPER = $1000;  
  TK_REPARENTED = $2000;  
  TK_ANONYMOUS_WINDOW = $4000;  
  TK_HAS_WRAPPER = $8000;  
  TK_WIN_MANAGED = $10000;  
  TK_TOP_HIERARCHY = $20000;  
  TK_PROP_PROPCHANGE = $40000;  
  TK_WM_MANAGEABLE = $80000;  
  TK_CAN_INPUT_TEXT = $100000;  
type
  PTk_State = ^TTk_State;
  TTk_State =  Longint;
  Const
    TK_STATE_NULL = -(1);
    TK_STATE_ACTIVE = (-(1))+1;
    TK_STATE_DISABLED = (-(1))+2;
    TK_STATE_NORMAL = (-(1))+3;
    TK_STATE_HIDDEN = (-(1))+4;

type
  PTk_SmoothMethod = ^TTk_SmoothMethod;
  TTk_SmoothMethod = record
      name : Pchar;
      coordProc : function (canvas:TTk_Canvas; pointPtr:Pdouble; numPoints:longint; numSteps:longint; xPoints:PXPoint; 
                   dblPoints:Pdouble):longint;cdecl;
      postscriptProc : procedure (interp:PTcl_Interp; canvas:TTk_Canvas; coordPtr:Pdouble; numPoints:longint; numSteps:longint);cdecl;
    end;

const
  TK_TAG_SPACE = 3;  
type
  PTk_Item = ^TTk_Item;
  TTk_Item = record
      id : longint;
      nextPtr : PTk_Item;
      staticTagSpace : array[0..(TK_TAG_SPACE)-1] of TTk_Uid;
      tagPtr : PTk_Uid;
      tagSpace : longint;
      numTags : longint;
      typePtr : PTk_ItemType;
      x1 : longint;
      y1 : longint;
      x2 : longint;
      y2 : longint;
      prevPtr : PTk_Item;
      state : TTk_State;
      reserved1 : Pchar;
      redraw_flags : longint;
    end;

const
  TK_ITEM_STATE_DEPENDANT = 1;  
  TK_ITEM_DONT_REDRAW = 2;  
type
    TTk_ItemCreateProc = function (interp:PTcl_Interp; canvas:TTk_Canvas; itemPtr:PTk_Item; objc:longint; objv:PPTcl_Obj):longint;cdecl;
    PTk_ItemCreateProc=^TTk_ItemCreateProc;
    TTk_ItemConfigureProc = function (interp:PTcl_Interp; canvas:TTk_Canvas; itemPtr:PTk_Item; objc:longint; objv:PPTcl_Obj;                 flags:longint):longint;cdecl;
    PTk_ItemConfigureProc=^TTk_ItemConfigureProc;
    TTk_ItemCoordProc = function (interp:PTcl_Interp; canvas:TTk_Canvas; itemPtr:PTk_Item; objc:longint; objv:PPTcl_Obj):longint;cdecl;
    PTk_ItemCoordProc=^TTk_ItemCoordProc;
    TTk_ItemDeleteProc = procedure (canvas:TTk_Canvas; itemPtr:PTk_Item; display:PDisplay);cdecl;
    PTk_ItemDeleteProc=^TTk_ItemDeleteProc;
    TTk_ItemDisplayProc = procedure (canvas:TTk_Canvas; itemPtr:PTk_Item; display:PDisplay; dst:TDrawable; x:longint;                  y:longint; width:longint; height:longint);cdecl;
    PTk_ItemDisplayProc=^TTk_ItemDisplayProc;
    TTk_ItemPointProc = function (canvas:TTk_Canvas; itemPtr:PTk_Item; pointPtr:Pdouble):Tdouble;cdecl;
    PTk_ItemPointProc=^TTk_ItemPointProc;
    TTk_ItemAreaProc = function (canvas:TTk_Canvas; itemPtr:PTk_Item; rectPtr:Pdouble):longint;cdecl;
    PTk_ItemAreaProc=^TTk_ItemAreaProc;
    TTk_ItemPostscriptProc = function (interp:PTcl_Interp; canvas:TTk_Canvas; itemPtr:PTk_Item; prepass:longint):longint;cdecl;
    PTk_ItemPostscriptProc=^TTk_ItemPostscriptProc;
    TTk_ItemScaleProc = procedure (canvas:TTk_Canvas; itemPtr:PTk_Item; originX:Tdouble; originY:Tdouble; scaleX:Tdouble;                  scaleY:Tdouble);cdecl;
    PTk_ItemScaleProc=^TTk_ItemScaleProc;
    TTk_ItemTranslateProc = procedure (canvas:TTk_Canvas; itemPtr:PTk_Item; deltaX:Tdouble; deltaY:Tdouble);cdecl;
    PTk_ItemTranslateProc=^TTk_ItemTranslateProc;
    TTk_ItemIndexProc = function (interp:PTcl_Interp; canvas:TTk_Canvas; itemPtr:PTk_Item; indexString:PTcl_Obj; indexPtr:Plongint):longint;cdecl;
    PTk_ItemIndexProc=^TTk_ItemIndexProc;
    TTk_ItemCursorProc = procedure (canvas:TTk_Canvas; itemPtr:PTk_Item; index:longint);cdecl;
    PTk_ItemCursorProc=^TTk_ItemCursorProc;
    TTk_ItemSelectionProc = function (canvas:TTk_Canvas; itemPtr:PTk_Item; offset:longint; buffer:Pchar; maxBytes:longint):longint;cdecl;
    PTk_ItemSelectionProc=^TTk_ItemSelectionProc;
    TTk_ItemInsertProc = procedure (canvas:TTk_Canvas; itemPtr:PTk_Item; beforeThis:longint; _string:PTcl_Obj);cdecl;
    PTk_ItemInsertProc=^tTk_ItemInsertProc;
    TTk_ItemDCharsProc = procedure (canvas:TTk_Canvas; itemPtr:PTk_Item; first:longint; last:longint);cdecl;
    PTk_ItemDCharsProc=^TTk_ItemDCharsProc;

type
  TTk_ItemType = record
      name : Pchar;
      itemSize : longint;
      createProc : PTk_ItemCreateProc;
      configSpecs : PTk_ConfigSpec;
      configProc : PTk_ItemConfigureProc;
      coordProc : PTk_ItemCoordProc;
      deleteProc : PTk_ItemDeleteProc;
      displayProc : PTk_ItemDisplayProc;
      alwaysRedraw : longint;
      pointProc : PTk_ItemPointProc;
      areaProc : PTk_ItemAreaProc;
      postscriptProc : PTk_ItemPostscriptProc;
      scaleProc : PTk_ItemScaleProc;
      translateProc : PTk_ItemTranslateProc;
      indexProc : PTk_ItemIndexProc;
      icursorProc : PTk_ItemCursorProc;
      selectionProc : PTk_ItemSelectionProc;
      insertProc : PTk_ItemInsertProc;
      dCharsProc : PTk_ItemDCharsProc;
      nextPtr : PTk_ItemType;
      reserved1 : Pchar;
      reserved2 : longint;
      reserved3 : Pchar;
      reserved4 : Pchar;
    end;
  PTk_ItemType = ^TTk_ItemType;

const
  TK_MOVABLE_POINTS = 2;  
type
  TTk_CanvasTextInfo = record
      selBorder : TTk_3DBorder;
      selBorderWidth : longint;
      selFgColorPtr : PXColor;
      selItemPtr : PTk_Item;
      selectFirst : longint;
      selectLast : longint;
      anchorItemPtr : PTk_Item;
      selectAnchor : longint;
      insertBorder : TTk_3DBorder;
      insertWidth : longint;
      insertBorderWidth : longint;
      focusItemPtr : PTk_Item;
      gotFocus : longint;
      cursorOn : longint;
    end;
  PTk_CanvasTextInfo = ^TTk_CanvasTextInfo;

  PTk_Dash = ^TTk_Dash;
  TTk_Dash = record
      number : longint;
      pattern : record
          case longint of
            0 : ( pt : Pchar );
          end;
    end;

  PTk_TSOffset = ^TTk_TSOffset;
  TTk_TSOffset = record
      flags : longint;
      xoffset : longint;
      yoffset : longint;
    end;

const
  TK_OFFSET_INDEX = 1;  
  TK_OFFSET_RELATIVE = 2;  
  TK_OFFSET_LEFT = 4;  
  TK_OFFSET_CENTER = 8;  
  TK_OFFSET_RIGHT = 16;  
  TK_OFFSET_TOP = 32;  
  TK_OFFSET_MIDDLE = 64;  
  TK_OFFSET_BOTTOM = 128;  
type
  TTk_Outline = record
      gc : TGC;
      width : double;
      activeWidth : double;
      disabledWidth : double;
      offset : longint;
      dash : TTk_Dash;
      activeDash : TTk_Dash;
      disabledDash : TTk_Dash;
      reserved1 : pointer;
      reserved2 : pointer;
      reserved3 : pointer;
      tsoffset : TTk_TSOffset;
      color : PXColor;
      activeColor : PXColor;
      disabledColor : PXColor;
      stipple : TPixmap;
      activeStipple : TPixmap;
      disabledStipple : TPixmap;
    end;
  PTk_Outline = ^TTk_Outline;

type
PTk_ImageType = ^TTk_ImageType;

TTk_ImageCreateProc = function (interp:PTcl_Interp; name:Pchar; objc:longint; objv:PPTcl_Obj; typePtr:PTk_ImageType;             model:TTk_ImageMaster; clientDataPtr:PClientData):longint;cdecl;
PTk_ImageCreateProc=^TTk_ImageCreateProc;
TTk_ImageGetProc = function (tkwin:TTk_Window; clientData:TClientData):TClientData;cdecl;
PTk_ImageGetProc=^TTk_ImageGetProc;
TTk_ImageDisplayProc = procedure (clientData:TClientData; display:PDisplay; drawable:TDrawable; imageX:longint; imageY:longint;              width:longint; height:longint; drawableX:longint; drawableY:longint);cdecl;
PTk_ImageDisplayProc=^TTk_ImageDisplayProc;
TTk_ImageFreeProc = procedure (clientData:TClientData; display:PDisplay);cdecl;
PTk_ImageFreeProc=^TTk_ImageFreeProc;
TTk_ImageDeleteProc = procedure (clientData:TClientData);cdecl;
PTk_ImageDeleteProc=^TTk_ImageDeleteProc;
TTk_ImageChangedProc = procedure (clientData:TClientData; x:longint; y:longint; width:longint; height:longint;              imageWidth:longint; imageHeight:longint);cdecl;
PTk_ImageChangedProc=^TTk_ImageChangedProc;
TTk_ImagePostscriptProc = function (clientData:TClientData; interp:PTcl_Interp; tkwin:TTk_Window; psinfo:TTk_PostscriptInfo; x:longint;             y:longint; width:longint; height:longint; prepass:longint):longint;cdecl;
PTk_ImagePostscriptProc=^TTk_ImagePostscriptProc;

  TTk_ImageType = record
      name : Pchar;
      createProc : PTk_ImageCreateProc;
      getProc : PTk_ImageGetProc;
      displayProc : PTk_ImageDisplayProc;
      freeProc : PTk_ImageFreeProc;
      deleteProc : PTk_ImageDeleteProc;
      postscriptProc : PTk_ImagePostscriptProc;
      nextPtr : PTk_ImageType;
      reserved : Pchar;
    end;

  PTk_PhotoHandle = ^TTk_PhotoHandle;
  TTk_PhotoHandle = pointer;

  TTk_PhotoImageBlock = record
      pixelPtr : Pbyte;
      width : longint;
      height : longint;
      pitch : longint;
      pixelSize : longint;
      offset : array[0..3] of longint;
    end;
  PTk_PhotoImageBlock = ^TTk_PhotoImageBlock;

const
  TK_PHOTO_COMPOSITE_OVERLAY = 0;  
  TK_PHOTO_COMPOSITE_SET = 1;

type
  TTk_ImageFileMatchProc = function (chan:TTcl_Channel; fileName:Pchar; format:PTcl_Obj; widthPtr:Plongint; heightPtr:Plongint;
               interp:PTcl_Interp):longint;cdecl;
  TTk_ImageStringMatchProc = function (dataObj:PTcl_Obj; format:PTcl_Obj; widthPtr:Plongint; heightPtr:Plongint; interp:PTcl_Interp):longint;cdecl;
  TTk_ImageFileReadProc = function (interp:PTcl_Interp; chan:TTcl_Channel; fileName:Pchar; format:PTcl_Obj; imageHandle:TTk_PhotoHandle;
               destX:longint; destY:longint; width:longint; height:longint; srcX:longint;
               srcY:longint):longint;cdecl;
  TTk_ImageStringReadProc = function (interp:PTcl_Interp; dataObj:PTcl_Obj; format:PTcl_Obj; imageHandle:TTk_PhotoHandle; destX:longint;
               destY:longint; width:longint; height:longint; srcX:longint; srcY:longint):longint;cdecl;
  TTk_ImageFileWriteProc = function (interp:PTcl_Interp; fileName:Pchar; format:PTcl_Obj; blockPtr:PTk_PhotoImageBlock):longint;cdecl;
  TTk_ImageStringWriteProc = function (interp:PTcl_Interp; format:PTcl_Obj; blockPtr:PTk_PhotoImageBlock):longint;cdecl;

type
  TTk_PhotoImageFormat = record
      name : Pchar;
      fileMatchProc : PTk_ImageFileMatchProc;
      stringMatchProc : PTk_ImageStringMatchProc;
      fileReadProc : PTk_ImageFileReadProc;
      stringReadProc : PTk_ImageStringReadProc;
      fileWriteProc : PTk_ImageFileWriteProc;
      stringWriteProc : PTk_ImageStringWriteProc;
      nextPtr : PTk_PhotoImageFormat;
      PTk_PhotoImageFormat = ^TTk_PhotoImageFormat;
    end;

const
  TK_STYLE_VERSION_1 = $1;  
  TK_STYLE_VERSION = TK_STYLE_VERSION_1;

type
    TTk_GetElementSizeProc = procedure (clientData:TClientData; recordPtr:Pchar; optionsPtr:PPTk_OptionSpec; tkwin:TTk_Window; width:longint;
                  height:longint; inner:longint; widthPtr:Plongint; heightPtr:Plongint);cdecl;
    TTk_GetElementBoxProc = procedure (clientData:TClientData; recordPtr:Pchar; optionsPtr:PPTk_OptionSpec; tkwin:TTk_Window; x:longint;
                  y:longint; width:longint; height:longint; inner:longint; xPtr:Plongint;
                  yPtr:Plongint; widthPtr:Plongint; heightPtr:Plongint);cdecl;
    TTk_GetElementBorderWidthProc = function (clientData:TClientData; recordPtr:Pchar; optionsPtr:PPTk_OptionSpec; tkwin:TTk_Window):longint;cdecl;
    TTk_DrawElementProc = procedure (clientData:TClientData; recordPtr:Pchar; optionsPtr:PPTk_OptionSpec; tkwin:TTk_Window; d:TDrawable;
                  x:longint; y:longint; width:longint; height:longint; state:longint);cdecl;


type
  TTk_ElementOptionSpec = record
      name : Pchar;
      _type : TTk_OptionType;
    end;
  PTk_ElementOptionSpec = ^TTk_ElementOptionSpec;

  PTk_ElementSpec = ^TTk_ElementSpec;
  TTk_ElementSpec = record
      version : longint;
      name : Pchar;
      options : PTk_ElementOptionSpec;
      getSize : PTk_GetElementSizeProc;
      getBox : PTk_GetElementBoxProc;
      getBorderWidth : PTk_GetElementBorderWidthProc;
      draw : PTk_DrawElementProc;
    end;

const
  TK_ELEMENT_STATE_ACTIVE = 1 shl 0;  
  TK_ELEMENT_STATE_DISABLED = 1 shl 1;  
  TK_ELEMENT_STATE_FOCUS = 1 shl 2;  
  TK_ELEMENT_STATE_PRESSED = 1 shl 3;  

  TK_READABLE = TCL_READABLE;
  TK_WRITABLE = TCL_WRITABLE;  
  TK_EXCEPTION = TCL_EXCEPTION;  
  TK_DONT_WAIT = TCL_DONT_WAIT;  
  TK_X_EVENTS = TCL_WINDOW_EVENTS;  
  TK_WINDOW_EVENTS = TCL_WINDOW_EVENTS;  
  TK_FILE_EVENTS = TCL_FILE_EVENTS;  
  TK_TIMER_EVENTS = TCL_TIMER_EVENTS;  
  TK_IDLE_EVENTS = TCL_IDLE_EVENTS;  
  TK_ALL_EVENTS = TCL_ALL_EVENTS;  
  Tk_IdleProc = Tcl_IdleProc;  
  Tk_FileProc = Tcl_FileProc;  
  Tk_TimerProc = Tcl_TimerProc;  
  Tk_TimerToken = Tcl_TimerToken;  
  Tk_BackgroundError = Tcl_BackgroundError;  
  Tk_CancelIdleCall = Tcl_CancelIdleCall;  
  Tk_CreateFileHandler = Tcl_CreateFileHandler;  
  Tk_CreateTimerHandler = Tcl_CreateTimerHandler;  
  Tk_DeleteFileHandler = Tcl_DeleteFileHandler;  
  Tk_DeleteTimerHandler = Tcl_DeleteTimerHandler;  
  Tk_DoOneEvent = Tcl_DoOneEvent;  
  Tk_DoWhenIdle = Tcl_DoWhenIdle;  
  Tk_Sleep = Tcl_Sleep;  
{ Additional stuff that has moved to Tcl:  }
  Tk_EventuallyFree = Tcl_EventuallyFree;  
  Tk_FreeProc = Tcl_FreeProc;  
  Tk_Preserve = Tcl_Preserve;  
  Tk_Release = Tcl_Release;  

function Tk_InitStubs(interp:PTcl_Interp; version:Pchar; exact:longint):Pchar;cdecl;external libtk8_6;
function Tk_PkgInitStubsCheck(interp:PTcl_Interp; version:Pchar; exact:longint):Pchar;cdecl;external libtk8_6;

type
TTk_ErrorProc = function (clientData:TClientData; errEventPtr:PXErrorEvent):longint;cdecl;
TTk_EventProc = procedure (clientData:TClientData; eventPtr:PXEvent);cdecl;
TTk_GenericProc = function (clientData:TClientData; eventPtr:PXEvent):longint;cdecl;
TTk_ClientMessageProc = function (tkwin:TTk_Window; eventPtr:PXEvent):longint;cdecl;
TTk_GetSelProc = function (clientData:TClientData; interp:PTcl_Interp; portion:Pchar):longint;cdecl;
TTk_LostSelProc = procedure (clientData:TClientData);cdecl;
TTk_RestrictProc = function (clientData:TClientData; eventPtr:PXEvent):TTk_RestrictAction;cdecl;
TTk_SelectionProc = function (clientData:TClientData; offset:longint; buffer:Pchar; maxBytes:longint):longint;cdecl;


const
  Tk_CreateImageType = Tk_CreateOldImageType;  
{$undef Tk_CreatePhotoImageFormat}
  Tk_CreatePhotoImageFormat = Tk_CreateOldPhotoImageFormat;  
{$endif}
{ USE_OLD_IMAGE  }
{
 *----------------------------------------------------------------------
 *
 * Allow users to say that they don't want to alter their source to add extra
 * arguments to Tk_PhotoPutBlock() et al; DO NOT DEFINE THIS WHEN BUILDING TK.
 *
 * This goes after the inclusion of the stubbed-decls so that the declarations
 * of what is actually there can be correct.
  }
{$ifdef USE_COMPOSITELESS_PHOTO_PUT_BLOCK}
{$ifdef Tk_PhotoPutBlock}
{$undef Tk_PhotoPutBlock}
{$endif}

const
  Tk_PhotoPutBlock = Tk_PhotoPutBlock_NoComposite;  
{$ifdef Tk_PhotoPutZoomedBlock}
{$undef Tk_PhotoPutZoomedBlock}
{$endif}

const
  Tk_PhotoPutZoomedBlock = Tk_PhotoPutZoomedBlock_NoComposite;  
{$define USE_PANIC_ON_PHOTO_ALLOC_FAILURE}
{$else}
{ !USE_COMPOSITELESS_PHOTO_PUT_BLOCK  }
{$ifdef USE_PANIC_ON_PHOTO_ALLOC_FAILURE}
{$ifdef Tk_PhotoPutBlock}
{$undef Tk_PhotoPutBlock}
{$endif}

const
  Tk_PhotoPutBlock = Tk_PhotoPutBlock_Panic;  
{$ifdef Tk_PhotoPutZoomedBlock}
{$undef Tk_PhotoPutZoomedBlock}
{$endif}

const
  Tk_PhotoPutZoomedBlock = Tk_PhotoPutZoomedBlock_Panic;  
{$endif}
{ USE_PANIC_ON_PHOTO_ALLOC_FAILURE  }
{$endif}
{ USE_COMPOSITELESS_PHOTO_PUT_BLOCK  }
{$ifdef USE_PANIC_ON_PHOTO_ALLOC_FAILURE}
{$ifdef Tk_PhotoExpand}
{$undef Tk_PhotoExpand}
{$endif}

const
  Tk_PhotoExpand = Tk_PhotoExpand_Panic;  
{$ifdef Tk_PhotoSetSize}
{$undef Tk_PhotoSetSize}
{$endif}

const
  Tk_PhotoSetSize = Tk_PhotoSetSize_Panic;  
{$endif}
{ USE_PANIC_ON_PHOTO_ALLOC_FAILURE  }
{$undef TCL_STORAGE_CLASS}

const
  TCL_STORAGE_CLASS = DLLIMPORT;  
{$endif}
{ RC_INVOKED  }
{
 * end block for C++
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ _TK  }
{
 * Local Variables:
 * mode: c
 * c-basic-offset: 4
 * fill-column: 78
 * End:
  }

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }

  function Tk_InitStubs(interp,version,exact : longint) : longint;


  function Tk_Offset(_type,field : longint) : longint;
  function offsetof(_type,field : longint) : Tsize_t;




  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }

  function Tk_GetClassProc(procs,which : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }

  function Tk_Display(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_ScreenNumber(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Screen(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Depth(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Visual(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_WindowId(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_PathName(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Name(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Class(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_X(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Y(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Width(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Height(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Changes(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Attributes(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_IsEmbedded(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_IsContainer(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_IsMapped(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_IsTopLevel(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_HasWrapper(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_WinManaged(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_TopWinHierarchy(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_IsManageable(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_ReqWidth(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_ReqHeight(tkwin : longint) : longint;

  { Tk_InternalBorderWidth is deprecated  }
  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_InternalBorderWidth(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_InternalBorderLeft(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_InternalBorderRight(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_InternalBorderTop(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_InternalBorderBottom(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_MinReqWidth(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_MinReqHeight(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Parent(tkwin : longint) : longint;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }
  function Tk_Colormap(tkwin : longint) : longint;


// === Konventiert am: 15-4-25 13:26:46 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function Tk_Offset(_type,field : longint) : longint;
begin
  Tk_Offset:=longint(offsetof(_type,field));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function offsetof(_type,field : longint) : Tsize_t;
begin
  offsetof:=Tsize_t(Pchar(@((Ptype(0))^.field)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_GetClassProc(procs,which : longint) : longint;
var
   if_local1, if_local2 : longint;
(* result types are not known *)
begin
  if (procs^.size)<=(Tk_Offset(Tk_ClassProcs,which)) then
    if_local1:=NULL
  else
    if_local1:=procs^.which;
  if procs=NULL then
    if_local2:=NULL
  else
    if_local2:=if_local1;
  Tk_GetClassProc:=if_local2;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Display(tkwin : longint) : longint;
begin
  Tk_Display:=(PTk_FakeWin(tkwin))^.display;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_ScreenNumber(tkwin : longint) : longint;
begin
  Tk_ScreenNumber:=(PTk_FakeWin(tkwin))^.screenNum;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Screen(tkwin : longint) : longint;
begin
  Tk_Screen:=ScreenOfDisplay(Tk_Display(tkwin),Tk_ScreenNumber(tkwin));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Depth(tkwin : longint) : longint;
begin
  Tk_Depth:=(PTk_FakeWin(tkwin))^.depth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Visual(tkwin : longint) : longint;
begin
  Tk_Visual:=(PTk_FakeWin(tkwin))^.visual;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_WindowId(tkwin : longint) : longint;
begin
  Tk_WindowId:=(PTk_FakeWin(tkwin))^.window;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_PathName(tkwin : longint) : longint;
begin
  Tk_PathName:=(PTk_FakeWin(tkwin))^.pathName;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Name(tkwin : longint) : longint;
begin
  Tk_Name:=(PTk_FakeWin(tkwin))^.nameUid;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Class(tkwin : longint) : longint;
begin
  Tk_Class:=(PTk_FakeWin(tkwin))^.classUid;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_X(tkwin : longint) : longint;
begin
  Tk_X:=(PTk_FakeWin(tkwin))^.(changes.x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Y(tkwin : longint) : longint;
begin
  Tk_Y:=(PTk_FakeWin(tkwin))^.(changes.y);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Width(tkwin : longint) : longint;
begin
  Tk_Width:=(PTk_FakeWin(tkwin))^.(changes.width);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Height(tkwin : longint) : longint;
begin
  Tk_Height:=(PTk_FakeWin(tkwin))^.(changes.height);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Changes(tkwin : longint) : longint;
begin
  Tk_Changes:=@((PTk_FakeWin(tkwin))^.changes);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Attributes(tkwin : longint) : longint;
begin
  Tk_Attributes:=@((PTk_FakeWin(tkwin))^.atts);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_IsEmbedded(tkwin : longint) : longint;
begin
  Tk_IsEmbedded:=((PTk_FakeWin(tkwin))^.flags) and TK_EMBEDDED;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_IsContainer(tkwin : longint) : longint;
begin
  Tk_IsContainer:=((PTk_FakeWin(tkwin))^.flags) and TK_CONTAINER;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_IsMapped(tkwin : longint) : longint;
begin
  Tk_IsMapped:=((PTk_FakeWin(tkwin))^.flags) and TK_MAPPED;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_IsTopLevel(tkwin : longint) : longint;
begin
  Tk_IsTopLevel:=((PTk_FakeWin(tkwin))^.flags) and TK_TOP_LEVEL;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_HasWrapper(tkwin : longint) : longint;
begin
  Tk_HasWrapper:=((PTk_FakeWin(tkwin))^.flags) and TK_HAS_WRAPPER;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_WinManaged(tkwin : longint) : longint;
begin
  Tk_WinManaged:=((PTk_FakeWin(tkwin))^.flags) and TK_WIN_MANAGED;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_TopWinHierarchy(tkwin : longint) : longint;
begin
  Tk_TopWinHierarchy:=((PTk_FakeWin(tkwin))^.flags) and TK_TOP_HIERARCHY;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_IsManageable(tkwin : longint) : longint;
begin
  Tk_IsManageable:=((PTk_FakeWin(tkwin))^.flags) and TK_WM_MANAGEABLE;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_ReqWidth(tkwin : longint) : longint;
begin
  Tk_ReqWidth:=(PTk_FakeWin(tkwin))^.reqWidth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_ReqHeight(tkwin : longint) : longint;
begin
  Tk_ReqHeight:=(PTk_FakeWin(tkwin))^.reqHeight;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_InternalBorderWidth(tkwin : longint) : longint;
begin
  Tk_InternalBorderWidth:=(PTk_FakeWin(tkwin))^.internalBorderLeft;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_InternalBorderLeft(tkwin : longint) : longint;
begin
  Tk_InternalBorderLeft:=(PTk_FakeWin(tkwin))^.internalBorderLeft;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_InternalBorderRight(tkwin : longint) : longint;
begin
  Tk_InternalBorderRight:=(PTk_FakeWin(tkwin))^.internalBorderRight;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_InternalBorderTop(tkwin : longint) : longint;
begin
  Tk_InternalBorderTop:=(PTk_FakeWin(tkwin))^.internalBorderTop;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_InternalBorderBottom(tkwin : longint) : longint;
begin
  Tk_InternalBorderBottom:=(PTk_FakeWin(tkwin))^.internalBorderBottom;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_MinReqWidth(tkwin : longint) : longint;
begin
  Tk_MinReqWidth:=(PTk_FakeWin(tkwin))^.minReqWidth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_MinReqHeight(tkwin : longint) : longint;
begin
  Tk_MinReqHeight:=(PTk_FakeWin(tkwin))^.minReqHeight;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Parent(tkwin : longint) : longint;
begin
  Tk_Parent:=(PTk_FakeWin(tkwin))^.parentPtr;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_Colormap(tkwin : longint) : longint;
begin
  Tk_Colormap:=(PTk_FakeWin(tkwin))^.(atts.colormap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function Tk_InitStubs(interp,version,exact : longint) : longint;
begin
  Tk_InitStubs:=Tk_PkgInitStubsCheck(interp,version,exact);
end;


end.
