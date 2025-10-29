{$IFDEF read_interface}

const
  TK_MAJOR_VERSION = 8;
  TK_MINOR_VERSION = 6;
  TK_RELEASE_LEVEL = TCL_FINAL_RELEASE;
  TK_RELEASE_SERIAL = 14;
  TK_VERSION = '8.6';
  TK_PATCH_LEVEL = '8.6.14';

type
  PTk_BindingTable = ^TTk_BindingTable;
  TTk_BindingTable = Pointer;

  PTk_Canvas = ^TTk_Canvas;
  TTk_Canvas = Pointer;

  PTk_Cursor = ^TTk_Cursor;
  TTk_Cursor = Pointer;

  PTk_ErrorHandler = ^TTk_ErrorHandler;
  TTk_ErrorHandler = Pointer;

  PTk_Font = ^TTk_Font;
  TTk_Font = Pointer;

  PTk_Image = ^TTk_Image;
  TTk_Image = Pointer;

  PTk_ImageMaster = ^TTk_ImageMaster;
  TTk_ImageMaster = Pointer;

  PTk_OptionTable = ^TTk_OptionTable;
  TTk_OptionTable = Pointer;

  PTk_PostscriptInfo = ^TTk_PostscriptInfo;
  TTk_PostscriptInfo = Pointer;

  PTk_TextLayout = ^TTk_TextLayout;
  TTk_TextLayout = Pointer;

  PTk_Window = ^TTk_Window;
  TTk_Window = Pointer;

  PTk_3DBorder = ^TTk_3DBorder;
  TTk_3DBorder = Pointer;

  PTk_Style = ^TTk_Style;
  TTk_Style = Pointer;

  PTk_StyleEngine = ^TTk_StyleEngine;
  TTk_StyleEngine = Pointer;

  PTk_StyledElement = ^TTk_StyledElement;
  TTk_StyledElement = Pointer;

  PTk_Uid = ^TTk_Uid;
  TTk_Uid = pchar;

type
  TTk_ImageModel = TTk_ImageMaster;

  PTk_OptionType = ^TTk_OptionType;
  TTk_OptionType = longint;

const
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
    _type: TTk_OptionType;
    optionName: pchar;
    dbName: pchar;
    dbClass: pchar;
    defValue: pchar;
    objOffset: longint;
    internalOffset: longint;
    flags: longint;
    clientData: pointer;
    typeMask: longint;
  end;
  PTk_OptionSpec = ^TTk_OptionSpec;
  PPTk_OptionSpec = ^PTk_OptionSpec;

const
  TK_OPTION_NULL_OK = 1 shl 0;
  TK_OPTION_DONT_SET_DEFAULT = 1 shl 3;

type
  TTk_CustomOptionSetProc = function(clientData: TClientData; interp: PTcl_Interp; tkwin: TTk_Window; Value: PPTcl_Obj; widgRec: pchar; offset: longint; saveInternalPtr: pchar; flags: longint): longint; cdecl;
  TTk_CustomOptionGetProc = function(clientData: TClientData; tkwin: TTk_Window; widgRec: pchar; offset: longint): PTcl_Obj; cdecl;
  TTk_CustomOptionRestoreProc = procedure(clientData: TClientData; tkwin: TTk_Window; internalPtr: pchar; saveInternalPtr: pchar); cdecl;
  TTk_CustomOptionFreeProc = procedure(clientData: TClientData; tkwin: TTk_Window; internalPtr: pchar); cdecl;

  TTk_ObjCustomOption = record
    Name: pchar;
    setProc: TTk_CustomOptionSetProc;
    getProc: TTk_CustomOptionGetProc;
    restoreProc: TTk_CustomOptionRestoreProc;
    freeProc: TTk_CustomOptionFreeProc;
    clientData: TClientData;
  end;
  PTk_ObjCustomOption = ^TTk_ObjCustomOption;

type
  PTk_SavedOption = ^TTk_SavedOption;

  TTk_SavedOption = record
    optionPtr: PTkOption;
    valuePtr: PTcl_Obj;
    internalForm: double;
  end;

const
  TK_NUM_SAVED_OPTIONS = 20;

type
  PTk_SavedOptions = ^TTk_SavedOptions;

  TTk_SavedOptions = record
    recordPtr: pchar;
    tkwin: TTk_Window;
    numItems: longint;
    items: array[0..(TK_NUM_SAVED_OPTIONS) - 1] of TTk_SavedOption;
    nextPtr: PTk_SavedOptions;
  end;

type
  TTk_OptionParseProc = function(clientData: TClientData; interp: PTcl_Interp; tkwin: TTk_Window; Value: pchar; widgRec: pchar; offset: longint): longint; cdecl;
  TTk_OptionPrintProc = function(clientData: TClientData; tkwin: TTk_Window; widgRec: pchar; offset: longint; freeProcPtr: PTcl_FreeProc): pchar; cdecl;

  TTk_CustomOption = record
    parseProc: TTk_OptionParseProc;
    printProc: TTk_OptionPrintProc;
    clientData: TClientData;
  end;
  PTk_CustomOption = ^TTk_CustomOption;

  TTk_ConfigSpec = record
    _type: longint;
    argvName: pchar;
    dbName: TTk_Uid;
    dbClass: TTk_Uid;
    defValue: TTk_Uid;
    offset: longint;
    specFlags: longint;
    customPtr: PTk_CustomOption;
  end;
  PTk_ConfigSpec = ^TTk_ConfigSpec;

type
  PTk_ConfigTypes = ^TTk_ConfigTypes;
  TTk_ConfigTypes = longint;

const
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
  TTk_ArgvInfo = record
    key: pchar;
    _type: longint;
    src: pchar;
    dst: pchar;
    help: pchar;
  end;
  PTk_ArgvInfo = ^TTk_ArgvInfo;

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
  TTk_RestrictAction = longint;

const
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
  TTk_Anchor = longint;

const
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
  TTk_Justify = longint;

const
  TK_JUSTIFY_LEFT = 0;
  TK_JUSTIFY_RIGHT = 1;
  TK_JUSTIFY_CENTER = 2;

type
  PTk_FontMetrics = ^TTk_FontMetrics;

  TTk_FontMetrics = record
    ascent: longint;
    descent: longint;
    linespace: longint;
  end;

const
  TK_WHOLE_WORDS = 1;
  TK_AT_LEAST_ONE = 2;
  TK_PARTIAL_OK = 4;
  TK_IGNORE_TABS = 8;
  TK_IGNORE_NEWLINES = 16;

type
  TTk_ClassCreateProc = function(tkwin: TTk_Window; parent: TWindow; instanceData: TClientData): TWindow; cdecl;
  TTk_ClassWorldChangedProc = procedure(instanceData: TClientData); cdecl;
  TTk_ClassModalProc = procedure(tkwin: TTk_Window; eventPtr: PXEvent); cdecl;

  TTk_ClassProcs = record
    size: dword;
    worldChangedProc: TTk_ClassWorldChangedProc;
    createProc: TTk_ClassCreateProc;
    modalProc: TTk_ClassModalProc;
  end;
  PTk_ClassProcs = ^TTk_ClassProcs;

type
  TTk_GeomRequestProc = procedure(clientData: TClientData; tkwin: TTk_Window); cdecl;
  TTk_GeomLostContentProc = procedure(clientData: TClientData; tkwin: TTk_Window); cdecl;

  TTk_GeomMgr = record
    Name: pchar;
    requestProc: TTk_GeomRequestProc;
    lostSlaveProc: TTk_GeomLostContentProc;
  end;
  PTk_GeomMgr = ^TTk_GeomMgr;

  TTk_GeomLostSlaveProc = TTk_GeomLostContentProc;

const
  TK_SCROLL_MOVETO = 1;
  TK_SCROLL_PAGES = 2;
  TK_SCROLL_UNITS = 3;
  TK_SCROLL_ERROR = 4;

  VirtualEvent = MappingNotify + 1;
  ActivateNotify = MappingNotify + 2;
  DeactivateNotify = MappingNotify + 3;
  MouseWheelEvent = MappingNotify + 4;
  TK_LASTEVENT = MappingNotify + 5;
  MouseWheelMask = 1 shl 28;
  ActivateMask = 1 shl 29;
  VirtualEventMask = 1 shl 30;

type
  TXVirtualEvent = record
    _type: longint;
    serial: Tculong;
    send_event: TBool;
    display: PDisplay;
    event: TWindow;
    root: TWindow;
    subwindow: TWindow;
    time: TTime;
    x: longint;
    y: longint;
    x_root: longint;
    y_root: longint;
    state: dword;
    Name: TTk_Uid;
    same_screen: TBool;
    user_data: PTcl_Obj;
  end;
  PXVirtualEvent = ^TXVirtualEvent;

  TXActivateDeactivateEvent = record
    _type: longint;
    serial: Tculong;
    send_event: TBool;
    display: PDisplay;
    window: TWindow;
  end;
  PXActivateDeactivateEvent = ^TXActivateDeactivateEvent;

  PXActivateEvent = ^TXActivateEvent;
  TXActivateEvent = TXActivateDeactivateEvent;

  PXDeactivateEvent = ^TXDeactivateEvent;
  TXDeactivateEvent = TXActivateDeactivateEvent;

type
  TTk_FakeWin = record
    display: PDisplay;
    dummy1: pchar;
    screenNum: longint;
    visual: PVisual;
    depth: longint;
    window: TWindow;
    dummy2: pchar;
    dummy3: pchar;
    parentPtr: TTk_Window;
    dummy4: pchar;
    dummy5: pchar;
    pathName: pchar;
    nameUid: TTk_Uid;
    classUid: TTk_Uid;
    changes: TXWindowChanges;
    dummy6: dword;
    atts: TXSetWindowAttributes;
    dummy7: Tculong;
    flags: dword;
    dummy8: pchar;
    dummy9: TXIC;
    dummy10: PClientData;
    dummy11: longint;
    dummy12: longint;
    dummy13: pchar;
    dummy14: pchar;
    dummy15: TClientData;
    reqWidth: longint;
    reqHeight: longint;
    internalBorderLeft: longint;
    dummy16: pchar;
    dummy17: pchar;
    dummy18: TClientData;
    dummy19: pchar;
    internalBorderRight: longint;
    internalBorderTop: longint;
    internalBorderBottom: longint;
    minReqWidth: longint;
    minReqHeight: longint;
    dummy20: longint;
    dummy21: pchar;
    dummy22: TTk_Window;
  end;
  PTk_FakeWin = ^TTk_FakeWin;

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
  TTk_State = longint;

const
  TK_STATE_NULL = -(1);
  TK_STATE_ACTIVE = (-(1)) + 1;
  TK_STATE_DISABLED = (-(1)) + 2;
  TK_STATE_NORMAL = (-(1)) + 3;
  TK_STATE_HIDDEN = (-(1)) + 4;

type
  TTk_SmoothMethod = record
    Name: pchar;
    coordProc: function(canvas: TTk_Canvas; pointPtr: Pdouble; numPoints: longint; numSteps: longint; xPoints: PXPoint; dblPoints: Pdouble): longint; cdecl;
    postscriptProc: procedure(interp: PTcl_Interp; canvas: TTk_Canvas; coordPtr: Pdouble; numPoints: longint; numSteps: longint); cdecl;
  end;
  PTk_SmoothMethod = ^TTk_SmoothMethod;

const
  TK_TAG_SPACE = 3;

const
  TK_ITEM_STATE_DEPENDANT = 1;
  TK_ITEM_DONT_REDRAW = 2;

type
  PTk_ItemType = ^TTk_ItemType;
  PTk_Item = ^TTk_Item;

  TTk_Item = record
    id: longint;
    nextPtr: PTk_Item;
    staticTagSpace: array[0..(TK_TAG_SPACE) - 1] of TTk_Uid;
    tagPtr: PTk_Uid;
    tagSpace: longint;
    numTags: longint;
    typePtr: PTk_ItemType;
    x1: longint;
    y1: longint;
    x2: longint;
    y2: longint;
    prevPtr: PTk_Item;
    state: TTk_State;
    reserved1: pchar;
    redraw_flags: longint;
  end;

  TTk_ItemCreateProc = function(interp: PTcl_Interp; canvas: TTk_Canvas; itemPtr: PTk_Item; objc: longint; objv: PPTcl_Obj): longint; cdecl;
  TTk_ItemConfigureProc = function(interp: PTcl_Interp; canvas: TTk_Canvas; itemPtr: PTk_Item; objc: longint; objv: PPTcl_Obj; flags: longint): longint; cdecl;
  TTk_ItemCoordProc = function(interp: PTcl_Interp; canvas: TTk_Canvas; itemPtr: PTk_Item; objc: longint; objv: PPTcl_Obj): longint; cdecl;
  TTk_ItemDeleteProc = procedure(canvas: TTk_Canvas; itemPtr: PTk_Item; display: PDisplay); cdecl;
  TTk_ItemDisplayProc = procedure(canvas: TTk_Canvas; itemPtr: PTk_Item; display: PDisplay; dst: TDrawable; x: longint; y: longint; Width: longint; Height: longint); cdecl;
  TTk_ItemPointProc = function(canvas: TTk_Canvas; itemPtr: PTk_Item; pointPtr: Pdouble): double; cdecl;
  TTk_ItemAreaProc = function(canvas: TTk_Canvas; itemPtr: PTk_Item; rectPtr: double): longint; cdecl;
  TTk_ItemPostscriptProc = function(interp: PTcl_Interp; canvas: TTk_Canvas; itemPtr: PTk_Item; prepass: longint): longint; cdecl;
  TTk_ItemScaleProc = procedure(canvas: TTk_Canvas; itemPtr: PTk_Item; originX: double; originY: double; scaleX: double; scaleY: double); cdecl;
  TTk_ItemTranslateProc = procedure(canvas: TTk_Canvas; itemPtr: PTk_Item; deltaX: double; deltaY: double); cdecl;
  TTk_ItemIndexProc = function(interp: PTcl_Interp; canvas: TTk_Canvas; itemPtr: PTk_Item; indexString: PTcl_Obj; indexPtr: Plongint): longint; cdecl;
  TTk_ItemCursorProc = procedure(canvas: TTk_Canvas; itemPtr: PTk_Item; index: longint); cdecl;
  TTk_ItemSelectionProc = function(canvas: TTk_Canvas; itemPtr: PTk_Item; offset: longint; buffer: pchar; maxBytes: longint): longint; cdecl;
  TTk_ItemInsertProc = procedure(canvas: TTk_Canvas; itemPtr: PTk_Item; beforeThis: longint; _string: PTcl_Obj); cdecl;
  TTk_ItemDCharsProc = procedure(canvas: TTk_Canvas; itemPtr: PTk_Item; First: longint; last: longint); cdecl;

  TTk_ItemType = record
    Name: pchar;
    itemSize: longint;
    createProc: TTk_ItemCreateProc;
    configSpecs: TTk_ConfigSpec;
    configProc: TTk_ItemConfigureProc;
    coordProc: TTk_ItemCoordProc;
    deleteProc: TTk_ItemDeleteProc;
    displayProc: TTk_ItemDisplayProc;
    alwaysRedraw: longint;
    pointProc: TTk_ItemPointProc;
    areaProc: TTk_ItemAreaProc;
    postscriptProc: TTk_ItemPostscriptProc;
    scaleProc: TTk_ItemScaleProc;
    translateProc: TTk_ItemTranslateProc;
    indexProc: TTk_ItemIndexProc;
    icursorProc: TTk_ItemCursorProc;
    selectionProc: TTk_ItemSelectionProc;
    insertProc: TTk_ItemInsertProc;
    dCharsProc: TTk_ItemDCharsProc;
    nextPtr: PTk_ItemType;
    reserved1: pchar;
    reserved2: longint;
    reserved3: pchar;
    reserved4: pchar;
  end;

const
  TK_MOVABLE_POINTS = 2;

type
  TTk_CanvasTextInfo = record
    selBorder: TTk_3DBorder;
    selBorderWidth: longint;
    selFgColorPtr: PXColor;
    selItemPtr: PTk_Item;
    selectFirst: longint;
    selectLast: longint;
    anchorItemPtr: PTk_Item;
    selectAnchor: longint;
    insertBorder: TTk_3DBorder;
    insertWidth: longint;
    insertBorderWidth: longint;
    focusItemPtr: PTk_Item;
    gotFocus: longint;
    cursorOn: longint;
  end;
  PTk_CanvasTextInfo = ^TTk_CanvasTextInfo;

  TTk_Dash = record
    number: longint;
    pattern: record
      case longint of
        0: (pt: pchar);
      end;
  end;
  PTk_Dash = ^TTk_Dash;

  TTk_TSOffset = record
    flags: longint;
    xoffset: longint;
    yoffset: longint;
  end;
  PTk_TSOffset = ^TTk_TSOffset;

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
    gc: TGC;
    Width: double;
    activeWidth: double;
    disabledWidth: double;
    offset: longint;
    dash: TTk_Dash;
    activeDash: TTk_Dash;
    disabledDash: TTk_Dash;
    reserved1: pointer;
    reserved2: pointer;
    reserved3: pointer;
    tsoffset: TTk_TSOffset;
    color: PXColor;
    activeColor: PXColor;
    disabledColor: PXColor;
    stipple: TPixmap;
    activeStipple: TPixmap;
    disabledStipple: TPixmap;
  end;
  PTk_Outline = ^TTk_Outline;

type
  PTk_ImageType = ^TTk_ImageType;
  PPTk_ImageType = ^PTk_ImageType;

  TTk_ImageCreateProc = function(interp: PTcl_Interp; Name: pchar; objc: longint; objv: PPTcl_Obj; typePtr: PTk_ImageType; model: TTk_ImageMaster; clientDataPtr: PClientData): longint; cdecl;
  TTk_ImageGetProc = function(tkwin: TTk_Window; clientData: TClientData): TClientData; cdecl;
  TTk_ImageDisplayProc = procedure(clientData: TClientData; display: PDisplay; drawable: TDrawable; imageX: longint; imageY: longint; Width: longint; Height: longint; drawableX: longint; drawableY: longint); cdecl;
  TTk_ImageFreeProc = procedure(clientData: TClientData; display: PDisplay); cdecl;
  TTk_ImageDeleteProc = procedure(clientData: TClientData); cdecl;
  TTk_ImageChangedProc = procedure(clientData: TClientData; x: longint; y: longint; Width: longint; Height: longint; imageWidth: longint; imageHeight: longint); cdecl;
  TTk_ImagePostscriptProc = function(clientData: TClientData; interp: PTcl_Interp; tkwin: TTk_Window; psinfo: TTk_PostscriptInfo; x: longint; y: longint; Width: longint; Height: longint; prepass: longint): longint; cdecl;

  TTk_ImageType = record
    Name: pchar;
    createProc: TTk_ImageCreateProc;
    getProc: TTk_ImageGetProc;
    displayProc: TTk_ImageDisplayProc;
    freeProc: TTk_ImageFreeProc;
    deleteProc: TTk_ImageDeleteProc;
    postscriptProc: TTk_ImagePostscriptProc;
    nextPtr: PTk_ImageType;
    reserved: pchar;
  end;

  PTk_PhotoHandle = ^TTk_PhotoHandle;
  TTk_PhotoHandle = pointer;

  TTk_PhotoImageBlock = record
    pixelPtr: pbyte;
    Width: longint;
    Height: longint;
    pitch: longint;
    pixelSize: longint;
    offset: array[0..3] of longint;
  end;
  PTk_PhotoImageBlock = ^TTk_PhotoImageBlock;

const
  TK_PHOTO_COMPOSITE_OVERLAY = 0;
  TK_PHOTO_COMPOSITE_SET = 1;

type
  TTk_ImageFileMatchProc = function(chan: TTcl_Channel; fileName: pchar; format: PTcl_Obj; widthPtr: Plongint; heightPtr: Plongint; interp: PTcl_Interp): longint; cdecl;
  TTk_ImageStringMatchProc = function(dataObj: PTcl_Obj; format: PTcl_Obj; widthPtr: Plongint; heightPtr: Plongint; interp: PTcl_Interp): longint; cdecl;
  TTk_ImageFileReadProc = function(interp: PTcl_Interp; chan: TTcl_Channel; fileName: pchar; format: PTcl_Obj; imageHandle: TTk_PhotoHandle; destX: longint; destY: longint; Width: longint; Height: longint; srcX: longint; srcY: longint): longint; cdecl;
  TTk_ImageStringReadProc = function(interp: PTcl_Interp; dataObj: PTcl_Obj; format: PTcl_Obj; imageHandle: TTk_PhotoHandle; destX: longint; destY: longint; Width: longint; Height: longint; srcX: longint; srcY: longint): longint; cdecl;
  TTk_ImageFileWriteProc = function(interp: PTcl_Interp; fileName: pchar; format: PTcl_Obj; blockPtr: PTk_PhotoImageBlock): longint; cdecl;
  TTk_ImageStringWriteProc = function(interp: PTcl_Interp; format: PTcl_Obj; blockPtr: PTk_PhotoImageBlock): longint; cdecl;

type
  PTk_PhotoImageFormat = ^TTk_PhotoImageFormat;

  TTk_PhotoImageFormat = record
    Name: pchar;
    fileMatchProc: TTk_ImageFileMatchProc;
    stringMatchProc: TTk_ImageStringMatchProc;
    fileReadProc: TTk_ImageFileReadProc;
    stringReadProc: TTk_ImageStringReadProc;
    fileWriteProc: TTk_ImageFileWriteProc;
    stringWriteProc: TTk_ImageStringWriteProc;
    nextPtr: PTk_PhotoImageFormat;
  end;

const
  TK_STYLE_VERSION_1 = $1;
  TK_STYLE_VERSION = TK_STYLE_VERSION_1;

type
  TTk_GetElementSizeProc = procedure(clientData: TClientData; recordPtr: pchar; optionsPtr: PPTk_OptionSpec; tkwin: TTk_Window; Width: longint; Height: longint; inner: longint; widthPtr: Plongint; heightPtr: Plongint); cdecl;
  TTk_GetElementBoxProc = procedure(clientData: TClientData; recordPtr: pchar; optionsPtr: PPTk_OptionSpec; tkwin: TTk_Window; x: longint; y: longint; Width: longint; Height: longint; inner: longint; xPtr: Plongint; yPtr: Plongint; widthPtr: Plongint; heightPtr: Plongint); cdecl;
  TTk_GetElementBorderWidthProc = function(clientData: TClientData; recordPtr: pchar; optionsPtr: PPTk_OptionSpec; tkwin: TTk_Window): longint; cdecl;
  TTk_DrawElementProc = procedure(clientData: TClientData; recordPtr: pchar; optionsPtr: PPTk_OptionSpec; tkwin: TTk_Window; d: TDrawable; x: longint; y: longint; Width: longint; Height: longint; state: longint); cdecl;

type
  TTk_ElementOptionSpec = record
    Name: pchar;
    _type: TTk_OptionType;
  end;
  PTk_ElementOptionSpec = ^TTk_ElementOptionSpec;

  PTk_ElementSpec = ^TTk_ElementSpec;

  TTk_ElementSpec = record
    version: longint;
    Name: pchar;
    options: PTk_ElementOptionSpec;
    getSize: TTk_GetElementSizeProc;
    getBox: TTk_GetElementBoxProc;
    getBorderWidth: TTk_GetElementBorderWidthProc;
    draw: TTk_DrawElementProc;
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

type
  TTk_IdleProc = TTcl_IdleProc;
  TTk_FileProc = TTcl_FileProc;
  TTk_TimerProc = TTcl_TimerProc;
  TTk_TimerToken = TTcl_TimerToken;

  //TTk_BackgroundError = TTcl_BackgroundError;
  //TTk_CancelIdleCall = TTcl_CancelIdleCall;
  //TTk_CreateFileHandler = TTcl_CreateFileHandler;
  //TTk_CreateTimerHandler = TTcl_CreateTimerHandler;
  //TTk_DeleteFileHandler = TTcl_DeleteFileHandler;
  //TTk_DeleteTimerHandler = TTcl_DeleteTimerHandler;
  //TTk_DoOneEvent = TTcl_DoOneEvent;
  //TTk_DoWhenIdle = TTcl_DoWhenIdle;
  //TTk_Sleep = TTcl_Sleep;
  //TTk_EventuallyFree = TTcl_EventuallyFree;
  //TTk_FreeProc = TTcl_FreeProc;
  //TTk_Preserve = TTcl_Preserve;
  //TTk_Release = TTcl_Release;

function Tk_InitStubs(interp: PTcl_Interp; version: pchar; exact: longint): pchar; cdecl; external libtk8_6;
function Tk_PkgInitStubsCheck(interp: PTcl_Interp; version: pchar; exact: longint): pchar; cdecl; external libtk8_6;

type
  TTk_ErrorProc = function(clientData: TClientData; errEventPtr: PXErrorEvent): longint; cdecl;
  TTk_EventProc = procedure(clientData: TClientData; eventPtr: PXEvent); cdecl;
  TTk_GenericProc = function(clientData: TClientData; eventPtr: PXEvent): longint; cdecl;
  TTk_ClientMessageProc = function(tkwin: TTk_Window; eventPtr: PXEvent): longint; cdecl;
  TTk_GetSelProc = function(clientData: TClientData; interp: PTcl_Interp; portion: pchar): longint; cdecl;
  TTk_LostSelProc = procedure(clientData: TClientData); cdecl;
  TTk_RestrictProc = function(clientData: TClientData; eventPtr: PXEvent): TTk_RestrictAction; cdecl;
  TTk_SelectionProc = function(clientData: TClientData; offset: longint; buffer: pchar; maxBytes: longint): longint; cdecl;

function Tk_Display(tkwin: TTk_Window): PDisplay;
function Tk_ScreenNumber(tkwin: TTk_Window): longint;
function Tk_Screen(tkwin: TTk_Window): PScreen;
function Tk_Depth(tkwin: TTk_Window): longint;
function Tk_Visual(tkwin: TTk_Window): PVisual;
function Tk_WindowId(tkwin: TTk_Window): longint;
function Tk_PathName(tkwin: TTk_Window): pchar;
function Tk_Name(tkwin: TTk_Window): pchar;
function Tk_Class(tkwin: TTk_Window): pchar;
function Tk_X(tkwin: TTk_Window): longint;
function Tk_Y(tkwin: TTk_Window): longint;
function Tk_Width(tkwin: TTk_Window): longint;
function Tk_Height(tkwin: TTk_Window): longint;
function Tk_Changes(tkwin: TTk_Window): Pointer;
function Tk_Attributes(tkwin: TTk_Window): Pointer;
function Tk_IsEmbedded(tkwin: TTk_Window): longint;
function Tk_IsContainer(tkwin: TTk_Window): longint;
function Tk_IsMapped(tkwin: TTk_Window): longint;
function Tk_IsTopLevel(tkwin: TTk_Window): longint;
function Tk_HasWrapper(tkwin: TTk_Window): longint;
function Tk_WinManaged(tkwin: TTk_Window): longint;
function Tk_TopWinHierarchy(tkwin: TTk_Window): longint;
function Tk_IsManageable(tkwin: TTk_Window): longint;
function Tk_ReqWidth(tkwin: TTk_Window): longint;
function Tk_ReqHeight(tkwin: TTk_Window): longint;
function Tk_InternalBorderWidth(tkwin: TTk_Window): longint;
function Tk_InternalBorderLeft(tkwin: TTk_Window): longint;
function Tk_InternalBorderRight(tkwin: TTk_Window): longint;
function Tk_InternalBorderTop(tkwin: TTk_Window): longint;
function Tk_InternalBorderBottom(tkwin: TTk_Window): longint;
function Tk_MinReqWidth(tkwin: TTk_Window): longint;
function Tk_MinReqHeight(tkwin: TTk_Window): longint;
function Tk_Parent(tkwin: TTk_Window): TTk_Window;
function Tk_Colormap(tkwin: TTk_Window): longint;


// === Konventiert am: 15-4-25 13:26:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



function Tk_Display(tkwin: TTk_Window): PDisplay;
begin
  Tk_Display := (PTk_FakeWin(tkwin))^.display;
end;

function Tk_ScreenNumber(tkwin: TTk_Window): longint;
begin
  Tk_ScreenNumber := (PTk_FakeWin(tkwin))^.screenNum;
end;

function Tk_Screen(tkwin: TTk_Window): PScreen;
begin
  Tk_Screen := ScreenOfDisplay(Tk_Display(tkwin), Tk_ScreenNumber(tkwin));
end;

function Tk_Depth(tkwin: TTk_Window): longint;
begin
  Tk_Depth := (PTk_FakeWin(tkwin))^.depth;
end;

function Tk_Visual(tkwin: TTk_Window): PVisual;
begin
  Tk_Visual := (PTk_FakeWin(tkwin))^.visual;
end;

function Tk_WindowId(tkwin: TTk_Window): longint;
begin
  Tk_WindowId := (PTk_FakeWin(tkwin))^.window;
end;

function Tk_PathName(tkwin: TTk_Window): pchar;
begin
  Tk_PathName := (PTk_FakeWin(tkwin))^.pathName;
end;

function Tk_Name(tkwin: TTk_Window): pchar;
begin
  Tk_Name := (PTk_FakeWin(tkwin))^.nameUid;
end;

function Tk_Class(tkwin: TTk_Window): pchar;
begin
  Tk_Class := (PTk_FakeWin(tkwin))^.classUid;
end;

function Tk_X(tkwin: TTk_Window): longint;
begin
  Tk_X := (PTk_FakeWin(tkwin))^.changes.x;
end;

function Tk_Y(tkwin: TTk_Window): longint;
begin
  Tk_Y := (PTk_FakeWin(tkwin))^.changes.y;
end;

function Tk_Width(tkwin: TTk_Window): longint;
begin
  Tk_Width := (PTk_FakeWin(tkwin))^.changes.Width;
end;

function Tk_Height(tkwin: TTk_Window): longint;
begin
  Tk_Height := (PTk_FakeWin(tkwin))^.changes.Height;
end;

function Tk_Changes(tkwin: TTk_Window): Pointer;
begin
  Tk_Changes := @((PTk_FakeWin(tkwin))^.changes);
end;

function Tk_Attributes(tkwin: TTk_Window): Pointer;
begin
  Tk_Attributes := @((PTk_FakeWin(tkwin))^.atts);
end;

function Tk_IsEmbedded(tkwin: TTk_Window): longint;
begin
  Tk_IsEmbedded := ((PTk_FakeWin(tkwin))^.flags) and TK_EMBEDDED;
end;

function Tk_IsContainer(tkwin: TTk_Window): longint;
begin
  Tk_IsContainer := ((PTk_FakeWin(tkwin))^.flags) and TK_CONTAINER;
end;

function Tk_IsMapped(tkwin: TTk_Window): longint;
begin
  Tk_IsMapped := ((PTk_FakeWin(tkwin))^.flags) and TK_MAPPED;
end;

function Tk_IsTopLevel(tkwin: TTk_Window): longint;
begin
  Tk_IsTopLevel := ((PTk_FakeWin(tkwin))^.flags) and TK_TOP_LEVEL;
end;

function Tk_HasWrapper(tkwin: TTk_Window): longint;
begin
  Tk_HasWrapper := ((PTk_FakeWin(tkwin))^.flags) and TK_HAS_WRAPPER;
end;

function Tk_WinManaged(tkwin: TTk_Window): longint;
begin
  Tk_WinManaged := ((PTk_FakeWin(tkwin))^.flags) and TK_WIN_MANAGED;
end;

function Tk_TopWinHierarchy(tkwin: TTk_Window): longint;
begin
  Tk_TopWinHierarchy := ((PTk_FakeWin(tkwin))^.flags) and TK_TOP_HIERARCHY;
end;

function Tk_IsManageable(tkwin: TTk_Window): longint;
begin
  Tk_IsManageable := ((PTk_FakeWin(tkwin))^.flags) and TK_WM_MANAGEABLE;
end;

function Tk_ReqWidth(tkwin: TTk_Window): longint;
begin
  Tk_ReqWidth := (PTk_FakeWin(tkwin))^.reqWidth;
end;

function Tk_ReqHeight(tkwin: TTk_Window): longint;
begin
  Tk_ReqHeight := (PTk_FakeWin(tkwin))^.reqHeight;
end;

function Tk_InternalBorderWidth(tkwin: TTk_Window): longint;
begin
  Tk_InternalBorderWidth := (PTk_FakeWin(tkwin))^.internalBorderLeft;
end;

function Tk_InternalBorderLeft(tkwin: TTk_Window): longint;
begin
  Tk_InternalBorderLeft := (PTk_FakeWin(tkwin))^.internalBorderLeft;
end;

function Tk_InternalBorderRight(tkwin: TTk_Window): longint;
begin
  Tk_InternalBorderRight := (PTk_FakeWin(tkwin))^.internalBorderRight;
end;

function Tk_InternalBorderTop(tkwin: TTk_Window): longint;
begin
  Tk_InternalBorderTop := (PTk_FakeWin(tkwin))^.internalBorderTop;
end;

function Tk_InternalBorderBottom(tkwin: TTk_Window): longint;
begin
  Tk_InternalBorderBottom := (PTk_FakeWin(tkwin))^.internalBorderBottom;
end;

function Tk_MinReqWidth(tkwin: TTk_Window): longint;
begin
  Tk_MinReqWidth := (PTk_FakeWin(tkwin))^.minReqWidth;
end;

function Tk_MinReqHeight(tkwin: TTk_Window): longint;
begin
  Tk_MinReqHeight := (PTk_FakeWin(tkwin))^.minReqHeight;
end;

function Tk_Parent(tkwin: TTk_Window): TTk_Window;
begin
  Tk_Parent := (PTk_FakeWin(tkwin))^.parentPtr;
end;

function Tk_Colormap(tkwin: TTk_Window): longint;
begin
  Tk_Colormap := (PTk_FakeWin(tkwin))^.atts.colormap;
end;


{$ENDIF read_implementation}
