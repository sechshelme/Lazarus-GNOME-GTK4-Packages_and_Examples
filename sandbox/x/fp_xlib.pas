unit fp_xlib;

interface

uses
  fp_x11, fp_x;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  XlibSpecificationRelease = 6;

function _Xmblen(str: pchar; len: longint): longint; cdecl; external libx;

const
  X_HAVE_UTF8_STRING = 1;

type
  PXPointer = ^TXPointer;
  TXPointer = pchar;

  TStatus = longint;
  PStatus = ^TStatus;

const
  QueuedAlready = 0;
  QueuedAfterReading = 1;
  QueuedAfterFlush = 2;

type
  PPXExtData = ^PXExtData;
  PXExtData = ^TXExtData;

  TXExtData = record
    number: longint;
    next: PXExtData;
    free_private: function(extension: PXExtData): longint; cdecl;
    private_data: TXPointer;
  end;

  TXExtCodes = record
    extension: longint;
    major_opcode: longint;
    first_event: longint;
    first_error: longint;
  end;
  PXExtCodes = ^TXExtCodes;

  TXPixmapFormatValues = record
    depth: longint;
    bits_per_pixel: longint;
    scanline_pad: longint;
  end;
  PXPixmapFormatValues = ^TXPixmapFormatValues;

  TXGCValues = record
    _function: longint;
    plane_mask: Tculong;
    foreground: Tclong;
    background: Tclong;
    line_width: longint;
    line_style: longint;
    cap_style: longint;
    join_style: longint;
    fill_style: longint;
    fill_rule: longint;
    arc_mode: longint;
    tile: TPixmap;
    stipple: TPixmap;
    ts_x_origin: longint;
    ts_y_origin: longint;
    font: TFont;
    subwindow_mode: longint;
    graphics_exposures: boolean;
    clip_x_origin: longint;
    clip_y_origin: longint;
    clip_mask: TPixmap;
    dash_offset: longint;
    dashes: char;
  end;
  PXGCValues = ^TXGCValues;

type
  PXGC = type Pointer;

  TGC = PXGC;
  PGC = ^TGC;

  TVisual = record
    ext_data: PXExtData;
    visualid: TVisualID;
    _class: longint;
    red_mask: Tclong;
    green_mask: Tclong;
    blue_mask: Tclong;
    bits_per_rgb: longint;
    map_entries: longint;
  end;
  PVisual = ^TVisual;

  TDepth = record
    depth: longint;
    nvisuals: longint;
    visuals: PVisual;
  end;
  PDepth = ^TDepth;

  PXDisplay = type Pointer;

  TScreen = record
    ext_data: PXExtData;
    display: PXDisplay;
    root: TWindow;
    width: longint;
    height: longint;
    mwidth: longint;
    mheight: longint;
    ndepths: longint;
    depths: PDepth;
    root_depth: longint;
    root_visual: PVisual;
    default_gc: TGC;
    cmap: TColormap;
    white_pixel: Tculong;
    black_pixel: Tculong;
    max_maps: longint;
    min_maps: longint;
    backing_store: longint;
    save_unders: boolean;
    root_input_mask: Tclong;
  end;
  PScreen = ^TScreen;

  TScreenFormat = record
    ext_data: PXExtData;
    depth: longint;
    bits_per_pixel: longint;
    scanline_pad: longint;
  end;
  PScreenFormat = ^TScreenFormat;

  TXSetWindowAttributes = record
    background_pixmap: TPixmap;
    background_pixel: Tculong;
    border_pixmap: TPixmap;
    border_pixel: Tculong;
    bit_gravity: longint;
    win_gravity: longint;
    backing_store: longint;
    backing_planes: Tculong;
    backing_pixel: Tculong;
    save_under: boolean;
    event_mask: Tclong;
    do_not_propagate_mask: Tclong;
    override_redirect: boolean;
    colormap: TColormap;
    cursor: TCursor;
  end;
  PXSetWindowAttributes = ^TXSetWindowAttributes;

  TXWindowAttributes = record
    x: longint;
    y: longint;
    width: longint;
    height: longint;
    border_width: longint;
    depth: longint;
    visual: PVisual;
    root: TWindow;
    _class: longint;
    bit_gravity: longint;
    win_gravity: longint;
    backing_store: longint;
    backing_planes: Tculong;
    backing_pixel: Tculong;
    save_under: boolean;
    colormap: TColormap;
    map_installed: boolean;
    map_state: longint;
    all_event_masks: Tclong;
    your_event_mask: Tclong;
    do_not_propagate_mask: Tclong;
    override_redirect: boolean;
    screen: PScreen;
  end;
  PXWindowAttributes = ^TXWindowAttributes;

  TXHostAddress = record
    family: longint;
    length: longint;
    address: pchar;
  end;
  PXHostAddress = ^TXHostAddress;

  TXServerInterpretedAddress = record
    typelength: longint;
    valuelength: longint;
    _type: pchar;
    value: pchar;
  end;
  PXServerInterpretedAddress = ^TXServerInterpretedAddress;

  PXImage = ^TXImage;

  TXImage = record
    width: longint;
    height: longint;
    xoffset: longint;
    format: longint;
    data: pchar;
    byte_order: longint;
    bitmap_unit: longint;
    bitmap_bit_order: longint;
    bitmap_pad: longint;
    depth: longint;
    bytes_per_line: longint;
    bits_per_pixel: longint;
    red_mask: Tculong;
    green_mask: Tculong;
    blue_mask: Tculong;
    obdata: TXPointer;
    f: record
      create_image: function(para1: PXDisplay; para2: PVisual; para3: dword; para4: longint; para5: longint;
        para6: pchar; para7: dword; para8: dword; para9: longint; para10: longint): PXImage; cdecl;
      destroy_image: function(para1: PXImage): longint; cdecl;
      get_pixel: function(para1: PXImage; para2: longint; para3: longint): Tculong; cdecl;
      put_pixel: function(para1: PXImage; para2: longint; para3: longint; para4: Tculong): longint; cdecl;
      sub_image: function(para1: PXImage; para2: longint; para3: longint; para4: dword; para5: dword): PXImage; cdecl;
      add_pixel: function(para1: PXImage; para2: Tclong): longint; cdecl;
      end;
  end;

  TXWindowChanges = record
    x: longint;
    y: longint;
    width: longint;
    height: longint;
    border_width: longint;
    sibling: TWindow;
    stack_mode: longint;
  end;
  PXWindowChanges = ^TXWindowChanges;

  TXColor = record
    pixel: Tculong;
    red: word;
    green: word;
    blue: word;
    flags: char;
    pad: char;
  end;
  PXColor = ^TXColor;

  TXSegment = record
    x1: smallint;
    y1: smallint;
    x2: smallint;
    y2: smallint;
  end;
  PXSegment = ^TXSegment;

  TXPoint = record
    x: smallint;
    y: smallint;
  end;
  PXPoint = ^TXPoint;

  TXRectangle = record
    x: smallint;
    y: smallint;
    width: word;
    height: word;
  end;
  PXRectangle = ^TXRectangle;

  TXArc = record
    x: smallint;
    y: smallint;
    width: word;
    height: word;
    angle1: smallint;
    angle2: smallint;
  end;
  PXArc = ^TXArc;

  TXKeyboardControl = record
    key_click_percent: longint;
    bell_percent: longint;
    bell_pitch: longint;
    bell_duration: longint;
    led: longint;
    led_mode: longint;
    key: longint;
    auto_repeat_mode: longint;
  end;
  PXKeyboardControl = ^TXKeyboardControl;

  TXKeyboardState = record
    key_click_percent: longint;
    bell_percent: longint;
    bell_pitch: dword;
    bell_duration: dword;
    led_mask: Tculong;
    global_auto_repeat: longint;
    auto_repeats: array[0..31] of char;
  end;
  PXKeyboardState = ^TXKeyboardState;

  TXTimeCoord = record
    time: TTime;
    x: smallint;
    y: smallint;
  end;
  PXTimeCoord = ^TXTimeCoord;

  TXModifierKeymap = record
    max_keypermod: longint;
    modifiermap: PKeyCode;
  end;
  PXModifierKeymap = ^TXModifierKeymap;

type
  PXPrivate = type Pointer;
  PXrmHashBucketRec = type Pointer;

type
  PDisplay = ^TDisplay;

  TDisplay = record
    ext_data: PXExtData;
    private1: PXPrivate;
    fd: integer;
    private2: integer;
    proto_major_version: integer;
    proto_minor_version: integer;
    vendor: pansichar;
    private3: TXID;
    private4: TXID;
    private5: TXID;
    private6: integer;
    resource_alloc: function(dpy: PDisplay): TXID; cdecl;
    byte_order: integer;
    bitmap_unit: integer;
    bitmap_pad: integer;
    bitmap_bit_order: integer;
    nformats: integer;
    pixmap_format: PScreenFormat;
    private8: integer;
    release: integer;
    private9: PXPrivate;
    private10: PXPrivate;
    qlen: integer;
    last_request_read: Tculong;
    request: Tculong;
    private11: TXPointer;
    private12: TXPointer;
    private13: TXPointer;
    private14: TXPointer;
    max_request_size: cardinal;     (* maximum number 32 bit words in request*)
    db: TXPointer;                   (* struct _XrmHashBucketRec *db; *)
    private15: function(dpy: PDisplay): integer; stdcall;
    display_name: pansichar;        (* "host:display" string used on this connect*)
    default_screen: integer;        (* default screen for operations *)
    nscreens: integer;              (* number of screens on this server*)
    screens: PScreen;               (* pointer to list of screens, hier wird ein Array-Pointer angenommen, z.B. PScreen; oder ^TScreenArray; *)
    motion_buffer: Tculong;        (* size of motion buffer *)
    private16: Tculong;
    min_keycode: integer;           (* minimum defined keycode *)
    max_keycode: integer;           (* maximum defined keycode *)
    private17: TXPointer;
    private18: TXPointer;
    private19: integer;
    xdefaults: pansichar;           (* contents of defaults from server *)
    (* ... hier enden die öffentlich bekannten Felder ... *)
  end;

  TXPrivDisplay = PXDisplay;
  PXPrivDisplay = ^TXPrivDisplay;

type
  TXKeyEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    root: TWindow;
    subwindow: TWindow;
    time: TTime;
    x: longint;
    y: longint;
    x_root: longint;
    y_root: longint;
    state: dword;
    keycode: dword;
    same_screen: boolean;
  end;
  PXKeyEvent = ^TXKeyEvent;

  PXKeyPressedEvent = ^TXKeyPressedEvent;
  TXKeyPressedEvent = TXKeyEvent;

  PXKeyReleasedEvent = ^TXKeyReleasedEvent;
  TXKeyReleasedEvent = TXKeyEvent;

  TXButtonEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    root: TWindow;
    subwindow: TWindow;
    time: TTime;
    x: longint;
    y: longint;
    x_root: longint;
    y_root: longint;
    state: dword;
    button: dword;
    same_screen: boolean;
  end;
  PXButtonEvent = ^TXButtonEvent;

  PXButtonPressedEvent = ^TXButtonPressedEvent;
  TXButtonPressedEvent = TXButtonEvent;

  PXButtonReleasedEvent = ^TXButtonReleasedEvent;
  TXButtonReleasedEvent = TXButtonEvent;

  TXMotionEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    root: TWindow;
    subwindow: TWindow;
    time: TTime;
    x: longint;
    y: longint;
    x_root: longint;
    y_root: longint;
    state: dword;
    is_hint: char;
    same_screen: boolean;
  end;
  PXMotionEvent = ^TXMotionEvent;

  PXPointerMovedEvent = ^TXPointerMovedEvent;
  TXPointerMovedEvent = TXMotionEvent;

  TXCrossingEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    root: TWindow;
    subwindow: TWindow;
    time: TTime;
    x: longint;
    y: longint;
    x_root: longint;
    y_root: longint;
    mode: longint;
    detail: longint;
    same_screen: boolean;
    focus: boolean;
    state: dword;
  end;
  PXCrossingEvent = ^TXCrossingEvent;

  PXEnterWindowEvent = ^TXEnterWindowEvent;
  TXEnterWindowEvent = TXCrossingEvent;

  PXLeaveWindowEvent = ^TXLeaveWindowEvent;
  TXLeaveWindowEvent = TXCrossingEvent;

  TXFocusChangeEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    mode: longint;
    detail: longint;
  end;
  PXFocusChangeEvent = ^TXFocusChangeEvent;

  PXFocusInEvent = ^TXFocusInEvent;
  TXFocusInEvent = TXFocusChangeEvent;

  PXFocusOutEvent = ^TXFocusOutEvent;
  TXFocusOutEvent = TXFocusChangeEvent;

  TXKeymapEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    key_vector: array[0..31] of char;
  end;
  PXKeymapEvent = ^TXKeymapEvent;

  TXExposeEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    x: longint;
    y: longint;
    width: longint;
    height: longint;
    count: longint;
  end;
  PXExposeEvent = ^TXExposeEvent;

  TXGraphicsExposeEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    drawable: TDrawable;
    x: longint;
    y: longint;
    width: longint;
    height: longint;
    count: longint;
    major_code: longint;
    minor_code: longint;
  end;
  PXGraphicsExposeEvent = ^TXGraphicsExposeEvent;

  TXNoExposeEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    drawable: TDrawable;
    major_code: longint;
    minor_code: longint;
  end;
  PXNoExposeEvent = ^TXNoExposeEvent;

  TXVisibilityEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    state: longint;
  end;
  PXVisibilityEvent = ^TXVisibilityEvent;

  TXCreateWindowEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    parent: TWindow;
    window: TWindow;
    x: longint;
    y: longint;
    width: longint;
    height: longint;
    border_width: longint;
    override_redirect: boolean;
  end;
  PXCreateWindowEvent = ^TXCreateWindowEvent;

  TXDestroyWindowEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    event: TWindow;
    window: TWindow;
  end;
  PXDestroyWindowEvent = ^TXDestroyWindowEvent;

  TXUnmapEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    event: TWindow;
    window: TWindow;
    from_configure: boolean;
  end;
  PXUnmapEvent = ^TXUnmapEvent;

  TXMapEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    event: TWindow;
    window: TWindow;
    override_redirect: boolean;
  end;
  PXMapEvent = ^TXMapEvent;

  TXMapRequestEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    parent: TWindow;
    window: TWindow;
  end;
  PXMapRequestEvent = ^TXMapRequestEvent;

  TXReparentEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    event: TWindow;
    window: TWindow;
    parent: TWindow;
    x: longint;
    y: longint;
    override_redirect: boolean;
  end;
  PXReparentEvent = ^TXReparentEvent;

  TXConfigureEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    event: TWindow;
    window: TWindow;
    x: longint;
    y: longint;
    width: longint;
    height: longint;
    border_width: longint;
    above: TWindow;
    override_redirect: boolean;
  end;
  PXConfigureEvent = ^TXConfigureEvent;

  TXGravityEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    event: TWindow;
    window: TWindow;
    x: longint;
    y: longint;
  end;
  PXGravityEvent = ^TXGravityEvent;

  TXResizeRequestEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    width: longint;
    height: longint;
  end;
  PXResizeRequestEvent = ^TXResizeRequestEvent;

  TXConfigureRequestEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    parent: TWindow;
    window: TWindow;
    x: longint;
    y: longint;
    width: longint;
    height: longint;
    border_width: longint;
    above: TWindow;
    detail: longint;
    value_mask: dword;
  end;
  PXConfigureRequestEvent = ^TXConfigureRequestEvent;

  TXCirculateEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    event: TWindow;
    window: TWindow;
    place: longint;
  end;
  PXCirculateEvent = ^TXCirculateEvent;

  TXCirculateRequestEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    parent: TWindow;
    window: TWindow;
    place: longint;
  end;
  PXCirculateRequestEvent = ^TXCirculateRequestEvent;

  TXPropertyEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    atom: TAtom;
    time: TTime;
    state: longint;
  end;
  PXPropertyEvent = ^TXPropertyEvent;

  TXSelectionClearEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    selection: TAtom;
    time: TTime;
  end;
  PXSelectionClearEvent = ^TXSelectionClearEvent;

  TXSelectionRequestEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    owner: TWindow;
    requestor: TWindow;
    selection: TAtom;
    target: TAtom;
    _property: TAtom;
    time: TTime;
  end;
  PXSelectionRequestEvent = ^TXSelectionRequestEvent;

  TXSelectionEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    requestor: TWindow;
    selection: TAtom;
    target: TAtom;
    _property: TAtom;
    time: TTime;
  end;
  PXSelectionEvent = ^TXSelectionEvent;

  TXColormapEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    colormap: TColormap;
    _new: boolean;
    state: longint;
  end;
  PXColormapEvent = ^TXColormapEvent;

  TXClientMessageEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    message_type: TAtom;
    format: longint;
    data: record
      case longint of
        0: (b: array[0..19] of char);
        1: (s: array[0..9] of smallint);
        2: (l: array[0..4] of Tclong);
      end;
  end;
  PXClientMessageEvent = ^TXClientMessageEvent;

  TXMappingEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
    request: longint;
    first_keycode: longint;
    count: longint;
  end;
  PXMappingEvent = ^TXMappingEvent;

  TXErrorEvent = record
    _type: longint;
    display: PDisplay;
    resourceid: TXID;
    serial: dword;
    error_code: byte;
    request_code: byte;
    minor_code: byte;
  end;
  PXErrorEvent = ^TXErrorEvent;

  TXAnyEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    window: TWindow;
  end;
  PXAnyEvent = ^TXAnyEvent;

  TXGenericEvent = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    extension: longint;
    evtype: longint;
  end;
  PXGenericEvent = ^TXGenericEvent;

  TXGenericEventCookie = record
    _type: longint;
    serial: Tculong;
    send_event: boolean;
    display: PDisplay;
    extension: longint;
    evtype: longint;
    cookie: dword;
    data: pointer;
  end;
  PXGenericEventCookie = ^TXGenericEventCookie;

  TXEvent = record
    case longint of
      0: (_type: longint);
      1: (xany: TXAnyEvent);
      2: (xkey: TXKeyEvent);
      3: (xbutton: TXButtonEvent);
      4: (xmotion: TXMotionEvent);
      5: (xcrossing: TXCrossingEvent);
      6: (xfocus: TXFocusChangeEvent);
      7: (xexpose: TXExposeEvent);
      8: (xgraphicsexpose: TXGraphicsExposeEvent);
      9: (xnoexpose: TXNoExposeEvent);
      10: (xvisibility: TXVisibilityEvent);
      11: (xcreatewindow: TXCreateWindowEvent);
      12: (xdestroywindow: TXDestroyWindowEvent);
      13: (xunmap: TXUnmapEvent);
      14: (xmap: TXMapEvent);
      15: (xmaprequest: TXMapRequestEvent);
      16: (xreparent: TXReparentEvent);
      17: (xconfigure: TXConfigureEvent);
      18: (xgravity: TXGravityEvent);
      19: (xresizerequest: TXResizeRequestEvent);
      20: (xconfigurerequest: TXConfigureRequestEvent);
      21: (xcirculate: TXCirculateEvent);
      22: (xcirculaterequest: TXCirculateRequestEvent);
      23: (xproperty: TXPropertyEvent);
      24: (xselectionclear: TXSelectionClearEvent);
      25: (xselectionrequest: TXSelectionRequestEvent);
      26: (xselection: TXSelectionEvent);
      27: (xcolormap: TXColormapEvent);
      28: (xclient: TXClientMessageEvent);
      29: (xmapping: TXMappingEvent);
      30: (xerror: TXErrorEvent);
      31: (xkeymap: TXKeymapEvent);
      32: (xgeneric: TXGenericEvent);
      33: (xcookie: TXGenericEventCookie);
      34: (pad: array[0..23] of Tclong);
  end;
  PXEvent = ^TXEvent;

type
  TXCharStruct = record
    lbearing: smallint;
    rbearing: smallint;
    width: smallint;
    ascent: smallint;
    descent: smallint;
    attributes: word;
  end;
  PXCharStruct = ^TXCharStruct;

  TXFontProp = record
    name: TAtom;
    card32: Tclong;
  end;
  PXFontProp = ^TXFontProp;

  TXFontStruct = record
    ext_data: PXExtData;
    fid: TFont;
    direction: dword;
    min_char_or_byte2: dword;
    max_char_or_byte2: dword;
    min_byte1: dword;
    max_byte1: dword;
    all_chars_exist: boolean;
    default_char: dword;
    n_properties: longint;
    properties: PXFontProp;
    min_bounds: TXCharStruct;
    max_bounds: TXCharStruct;
    per_char: PXCharStruct;
    ascent: longint;
    descent: longint;
  end;
  PXFontStruct = ^TXFontStruct;
  PPXFontStruct = ^PXFontStruct;
  PPPXFontStruct = ^PPXFontStruct;

  TXTextItem = record
    chars: pchar;
    nchars: longint;
    delta: longint;
    font: TFont;
  end;
  PXTextItem = ^TXTextItem;

  TXChar2b = record
    byte1: byte;
    byte2: byte;
  end;
  PXChar2b = ^TXChar2b;

  TXTextItem16 = record
    chars: PXChar2b;
    nchars: longint;
    delta: longint;
    font: TFont;
  end;
  PXTextItem16 = ^TXTextItem16;

  TXEDataObject = record
    case longint of
      0: (display: PDisplay);
      1: (gc: TGC);
      2: (visual: PVisual);
      3: (screen: PScreen);
      4: (pixmap_format: PScreenFormat);
      5: (font: PXFontStruct);
  end;
  PXEDataObject = ^TXEDataObject;

  TXFontSetExtents = record
    max_ink_extent: TXRectangle;
    max_logical_extent: TXRectangle;
  end;
  PXFontSetExtents = ^TXFontSetExtents;

  TXOM = type Pointer;
  PXOM = ^TXOM;
  TXOC = type Pointer;
  PXOC = ^TXOC;

  TXFontSet = PXOC;
  PXFontSet = ^TXFontSet;

  TXmbTextItem = record
    chars: pchar;
    nchars: longint;
    delta: longint;
    font_set: TXFontSet;
  end;
  PXmbTextItem = ^TXmbTextItem;

  TXwcTextItem = record
    chars: Pwchar_t;
    nchars: longint;
    delta: longint;
    font_set: TXFontSet;
  end;
  PXwcTextItem = ^TXwcTextItem;

const
  XNRequiredCharSet = 'requiredCharSet';
  XNQueryOrientation = 'queryOrientation';
  XNBaseFontName = 'baseFontName';
  XNOMAutomatic = 'omAutomatic';
  XNMissingCharSet = 'missingCharSet';
  XNDefaultString = 'defaultString';
  XNOrientation = 'orientation';
  XNDirectionalDependentDrawing = 'directionalDependentDrawing';
  XNContextualDrawing = 'contextualDrawing';
  XNFontInfo = 'fontInfo';

type
  TXOMCharSetList = record
    charset_count: longint;
    charset_list: ^pchar;
  end;
  PXOMCharSetList = ^TXOMCharSetList;

type
  PXOrientation = ^TXOrientation;
  TXOrientation = longint;

const
  XOMOrientation_LTR_TTB = 0;
  XOMOrientation_RTL_TTB = 1;
  XOMOrientation_TTB_LTR = 2;
  XOMOrientation_TTB_RTL = 3;
  XOMOrientation_Context = 4;

type
  TXOMOrientation = record
    num_orientation: longint;
    orientation: PXOrientation;
  end;
  PXOMOrientation = ^TXOMOrientation;

  TXOMFontInfo = record
    num_font: longint;
    font_struct_list: ^PXFontStruct;
    font_name_list: ^pchar;
  end;
  PXOMFontInfo = ^TXOMFontInfo;

  TXIM = type Pointer;
  TXIC = type Pointer;

  TXIMProc = procedure(para1: TXIM; para2: TXPointer; para3: TXPointer); cdecl;
  TXICProc = function(para1: TXIC; para2: TXPointer; para3: TXPointer): boolean; cdecl;
  TXIDProc = procedure(para1: PDisplay; para2: TXPointer; para3: TXPointer); cdecl;

  PXIMStyle = ^TXIMStyle;
  TXIMStyle = Tculong;

  TXIMStyles = record
    count_styles: word;
    supported_styles: PXIMStyle;
  end;
  PXIMStyles = ^TXIMStyles;

const
  XIMPreeditArea = $0001;
  XIMPreeditCallbacks = $0002;
  XIMPreeditPosition = $0004;
  XIMPreeditNothing = $0008;
  XIMPreeditNone = $0010;
  XIMStatusArea = $0100;
  XIMStatusCallbacks = $0200;
  XIMStatusNothing = $0400;
  XIMStatusNone = $0800;
  XNVaNestedList = 'XNVaNestedList';
  XNQueryInputStyle = 'queryInputStyle';
  XNClientWindow = 'clientWindow';
  XNInputStyle = 'inputStyle';
  XNFocusWindow = 'focusWindow';
  XNResourceName = 'resourceName';
  XNResourceClass = 'resourceClass';
  XNGeometryCallback = 'geometryCallback';
  XNDestroyCallback = 'destroyCallback';
  XNFilterEvents = 'filterEvents';
  XNPreeditStartCallback = 'preeditStartCallback';
  XNPreeditDoneCallback = 'preeditDoneCallback';
  XNPreeditDrawCallback = 'preeditDrawCallback';
  XNPreeditCaretCallback = 'preeditCaretCallback';
  XNPreeditStateNotifyCallback = 'preeditStateNotifyCallback';
  XNPreeditAttributes = 'preeditAttributes';
  XNStatusStartCallback = 'statusStartCallback';
  XNStatusDoneCallback = 'statusDoneCallback';
  XNStatusDrawCallback = 'statusDrawCallback';
  XNStatusAttributes = 'statusAttributes';
  XNArea = 'area';
  XNAreaNeeded = 'areaNeeded';
  XNSpotLocation = 'spotLocation';
  XNColormap = 'colorMap';
  XNStdColormap = 'stdColorMap';
  XNForeground = 'foreground';
  XNBackground = 'background';
  XNBackgroundPixmap = 'backgroundPixmap';
  XNFontSet = 'fontSet';
  XNLineSpace = 'lineSpace';
  XNCursor = 'cursor';
  XNQueryIMValuesList = 'queryIMValuesList';
  XNQueryICValuesList = 'queryICValuesList';
  XNVisiblePosition = 'visiblePosition';
  XNR6PreeditCallback = 'r6PreeditCallback';
  XNStringConversionCallback = 'stringConversionCallback';
  XNStringConversion = 'stringConversion';
  XNResetState = 'resetState';
  XNHotKey = 'hotKey';
  XNHotKeyState = 'hotKeyState';
  XNPreeditState = 'preeditState';
  XNSeparatorofNestedList = 'separatorofNestedList';
  XBufferOverflow = -(1);
  XLookupNone = 1;
  XLookupChars = 2;
  XLookupKeySym_ = 3;
  XLookupBoth = 4;

type
  PXVaNestedList = ^TXVaNestedList;
  TXVaNestedList = pointer;

  TXIMCallback = record
    client_data: TXPointer;
    callback: TXIMProc;
  end;
  PXIMCallback = ^TXIMCallback;

  TXICCallback = record
    client_data: TXPointer;
    callback: TXICProc;
  end;
  PXICCallback = ^TXICCallback;

  PXIMFeedback = ^TXIMFeedback;
  TXIMFeedback = Tculong;

const
  XIMReverse = 1;
  XIMUnderline = 1 shl 1;
  XIMHighlight = 1 shl 2;
  XIMPrimary = 1 shl 5;
  XIMSecondary = 1 shl 6;
  XIMTertiary = 1 shl 7;
  XIMVisibleToForward = 1 shl 8;
  XIMVisibleToBackword = 1 shl 9;
  XIMVisibleToCenter = 1 shl 10;

type
  TXIMText = record
    length: word;
    feedback: PXIMFeedback;
    encoding_is_wchar: boolean;
    _string: record
      case longint of
        0: (multi_byte: pchar);
        1: (wide_char: Pwchar_t);
      end;
  end;
  PXIMText = ^TXIMText;

  PXIMPreeditState = ^TXIMPreeditState;
  TXIMPreeditState = Tculong;

const
  XIMPreeditUnKnown = 0;
  XIMPreeditEnable = 1;
  XIMPreeditDisable = 1 shl 1;

type
  TXIMPreeditStateNotifyCallbackStruct = record
    state: TXIMPreeditState;
  end;
  PXIMPreeditStateNotifyCallbackStruct = ^TXIMPreeditStateNotifyCallbackStruct;

  PXIMResetState = ^TXIMResetState;
  TXIMResetState = Tculong;

const
  XIMInitialState = 1;
  XIMPreserveState = 1 shl 1;

type
  PXIMStringConversionFeedback = ^TXIMStringConversionFeedback;
  TXIMStringConversionFeedback = Tculong;

const
  XIMStringConversionLeftEdge = $00000001;
  XIMStringConversionRightEdge = $00000002;
  XIMStringConversionTopEdge = $00000004;
  XIMStringConversionBottomEdge = $00000008;
  XIMStringConversionConcealed = $00000010;
  XIMStringConversionWrapped = $00000020;

type
  TXIMStringConversionText = record
    length: word;
    feedback: PXIMStringConversionFeedback;
    encoding_is_wchar: boolean;
    _string: record
      case longint of
        0: (mbs: pchar);
        1: (wcs: Pwchar_t);
      end;
  end;
  PXIMStringConversionText = ^TXIMStringConversionText;

  PXIMStringConversionPosition = ^TXIMStringConversionPosition;
  TXIMStringConversionPosition = word;

  PXIMStringConversionType = ^TXIMStringConversionType;
  TXIMStringConversionType = word;

const
  XIMStringConversionBuffer = $0001;
  XIMStringConversionLine = $0002;
  XIMStringConversionWord = $0003;
  XIMStringConversionChar = $0004;

type
  PXIMStringConversionOperation = ^TXIMStringConversionOperation;
  TXIMStringConversionOperation = word;

const
  XIMStringConversionSubstitution = $0001;
  XIMStringConversionRetrieval = $0002;

type
  PXIMCaretDirection = ^TXIMCaretDirection;
  TXIMCaretDirection = longint;

const
  XIMForwardChar = 0;
  XIMBackwardChar = 1;
  XIMForwardWord = 2;
  XIMBackwardWord = 3;
  XIMCaretUp = 4;
  XIMCaretDown = 5;
  XIMNextLine = 6;
  XIMPreviousLine = 7;
  XIMLineStart = 8;
  XIMLineEnd = 9;
  XIMAbsolutePosition = 10;
  XIMDontChange = 11;

type
  TXIMStringConversionCallbackStruct = record
    position: TXIMStringConversionPosition;
    direction: TXIMCaretDirection;
    operation: TXIMStringConversionOperation;
    factor: word;
    text: PXIMStringConversionText;
  end;
  PXIMStringConversionCallbackStruct = ^TXIMStringConversionCallbackStruct;

  TXIMPreeditDrawCallbackStruct = record
    caret: longint;
    chg_first: longint;
    chg_length: longint;
    text: PXIMText;
  end;
  PXIMPreeditDrawCallbackStruct = ^TXIMPreeditDrawCallbackStruct;

type
  PXIMCaretStyle = ^TXIMCaretStyle;
  TXIMCaretStyle = longint;

const
  XIMIsInvisible = 0;
  XIMIsPrimary = 1;
  XIMIsSecondary = 2;

type
  TXIMPreeditCaretCallbackStruct = record
    position: longint;
    direction: TXIMCaretDirection;
    style: TXIMCaretStyle;
  end;
  PXIMPreeditCaretCallbackStruct = ^TXIMPreeditCaretCallbackStruct;

type
  PXIMStatusDataType = ^TXIMStatusDataType;
  TXIMStatusDataType = longint;

const
  XIMTextType = 0;
  XIMBitmapType = 1;

type
  TXIMStatusDrawCallbackStruct = record
    _type: TXIMStatusDataType;
    data: record
      case longint of
        0: (text: PXIMText);
        1: (bitmap: TPixmap);
      end;
  end;
  PXIMStatusDrawCallbackStruct = ^TXIMStatusDrawCallbackStruct;

  TXIMHotKeyTrigger = record
    keysym: TKeySym;
    modifier: longint;
    modifier_mask: longint;
  end;
  PXIMHotKeyTrigger = ^TXIMHotKeyTrigger;

  TXIMHotKeyTriggers = record
    num_hot_key: longint;
    key: PXIMHotKeyTrigger;
  end;
  PXIMHotKeyTriggers = ^TXIMHotKeyTriggers;

  PXIMHotKeyState = ^TXIMHotKeyState;
  TXIMHotKeyState = Tculong;

const
  XIMHotKeyStateON = $0001;
  XIMHotKeyStateOFF = $0002;

type
  PXIMValuesList = ^TXIMValuesList;

  TXIMValuesList = record
    count_values: word;
    supported_values: ^pchar;
  end;

var
  _Xdebug: longint; cvar;external libx;

function XLoadQueryFont(para1: PDisplay; para2: pchar): PXFontStruct; cdecl; external libx;
function XQueryFont(para1: PDisplay; para2: TXID): PXFontStruct; cdecl; external libx;
function XGetMotionEvents(para1: PDisplay; para2: TWindow; para3: TTime; para4: TTime; para5: Plongint): PXTimeCoord; cdecl; external libx;
function XDeleteModifiermapEntry(para1: PXModifierKeymap; para2: TKeyCode; para3: longint): PXModifierKeymap; cdecl; external libx;
function XGetModifierMapping(para1: PDisplay): PXModifierKeymap; cdecl; external libx;
function XInsertModifiermapEntry(para1: PXModifierKeymap; para2: TKeyCode; para3: longint): PXModifierKeymap; cdecl; external libx;
function XNewModifiermap(para1: longint): PXModifierKeymap; cdecl; external libx;
function XCreateImage(para1: PDisplay; para2: PVisual; para3: dword; para4: longint; para5: longint;
  para6: pchar; para7: dword; para8: dword; para9: longint; para10: longint): PXImage; cdecl; external libx;
function XInitImage(para1: PXImage): TStatus; cdecl; external libx;
function XGetImage(para1: PDisplay; para2: TDrawable; para3: longint; para4: longint; para5: dword;
  para6: dword; para7: Tculong; para8: longint): PXImage; cdecl; external libx;
function XGetSubImage(para1: PDisplay; para2: TDrawable; para3: longint; para4: longint; para5: dword;
  para6: dword; para7: Tculong; para8: longint; para9: PXImage; para10: longint;
  para11: longint): PXImage; cdecl; external libx;
function XOpenDisplay(para1: pchar): PDisplay; cdecl; external libx;
procedure XrmInitialize; cdecl; external libx;
function XFetchBytes(para1: PDisplay; para2: Plongint): pchar; cdecl; external libx;
function XFetchBuffer(para1: PDisplay; para2: Plongint; para3: longint): pchar; cdecl; external libx;
function XGetAtomName(para1: PDisplay; para2: TAtom): pchar; cdecl; external libx;
function XGetAtomNames(para1: PDisplay; para2: PAtom; para3: longint; para4: PPchar): TStatus; cdecl; external libx;
function XGetDefault(para1: PDisplay; para2: pchar; para3: pchar): pchar; cdecl; external libx;
function XDisplayName(para1: pchar): pchar; cdecl; external libx;
function XKeysymToString(para1: TKeySym): pchar; cdecl; external libx;

type
  Tfuncdisp = function(display: PDisplay): integer; cdecl;

function XSynchronize(para1: PDisplay; para2: boolean): Tfuncdisp; cdecl; external libx;
function XSetAfterFunction(para1: PDisplay; para2: Tfuncdisp): Tfuncdisp; cdecl; external libx;

function XInternAtom(para1: PDisplay; para2: pchar; para3: boolean): TAtom; cdecl; external libx;
function XInternAtoms(para1: PDisplay; para2: PPchar; para3: longint; para4: boolean; para5: PAtom): TStatus; cdecl; external libx;
function XCopyColormapAndFree(para1: PDisplay; para2: TColormap): TColormap; cdecl; external libx;
function XCreateColormap(para1: PDisplay; para2: TWindow; para3: PVisual; para4: longint): TColormap; cdecl; external libx;
function XCreatePixmapCursor(para1: PDisplay; para2: TPixmap; para3: TPixmap; para4: PXColor; para5: PXColor;
  para6: dword; para7: dword): TCursor; cdecl; external libx;
function XCreateGlyphCursor(para1: PDisplay; para2: TFont; para3: TFont; para4: dword; para5: dword;
  para6: PXColor; para7: PXColor): TCursor; cdecl; external libx;
function XCreateFontCursor(para1: PDisplay; para2: dword): TCursor; cdecl; external libx;
function XLoadFont(para1: PDisplay; para2: pchar): TFont; cdecl; external libx;
function XCreateGC(para1: PDisplay; para2: TDrawable; para3: Tculong; para4: PXGCValues): TGC; cdecl; external libx;
function XGContextFromGC(para1: TGC): TGContext; cdecl; external libx;
procedure XFlushGC(para1: PDisplay; para2: TGC); cdecl; external libx;
function XCreatePixmap(para1: PDisplay; para2: TDrawable; para3: dword; para4: dword; para5: dword): TPixmap; cdecl; external libx;
function XCreateBitmapFromData(para1: PDisplay; para2: TDrawable; para3: pchar; para4: dword; para5: dword): TPixmap; cdecl; external libx;
function XCreatePixmapFromBitmapData(para1: PDisplay; para2: TDrawable; para3: pchar; para4: dword; para5: dword;
  para6: dword; para7: Tculong; para8: Tculong): TPixmap; cdecl; external libx;
function XCreateSimpleWindow(para1: PDisplay; para2: TWindow; para3: longint; para4: longint; para5: dword;
  para6: dword; para7: dword; para8: Tculong; para9: Tculong): TWindow; cdecl; external libx;
function XGetSelectionOwner(para1: PDisplay; para2: TAtom): TWindow; cdecl; external libx;
function XCreateWindow(para1: PDisplay; para2: TWindow; para3: longint; para4: longint; para5: dword;
  para6: dword; para7: dword; para8: longint; para9: dword; para10: PVisual;
  para11: Tculong; para12: PXSetWindowAttributes): TWindow; cdecl; external libx;
function XListInstalledColormaps(para1: PDisplay; para2: TWindow; para3: Plongint): PColormap; cdecl; external libx;
function XListFonts(para1: PDisplay; para2: pchar; para3: longint; para4: Plongint): PPchar; cdecl; external libx;
function XListFontsWithInfo(para1: PDisplay; para2: pchar; para3: longint; para4: Plongint; para5: PPXFontStruct): PPchar; cdecl; external libx;
function XGetFontPath(para1: PDisplay; para2: Plongint): PPchar; cdecl; external libx;
function XListExtensions(para1: PDisplay; para2: Plongint): PPchar; cdecl; external libx;
function XListProperties(para1: PDisplay; para2: TWindow; para3: Plongint): PAtom; cdecl; external libx;
function XListHosts(para1: PDisplay; para2: Plongint; para3: PBoolean): PXHostAddress; cdecl; external libx;
function XKeycodeToKeysym(para1: PDisplay; para2: TKeyCode; para3: longint): TKeySym; cdecl; external libx;
function XLookupKeysym(para1: PXKeyEvent; para2: longint): TKeySym; cdecl; external libx;
function XGetKeyboardMapping(para1: PDisplay; para2: TKeyCode; para3: longint; para4: Plongint): PKeySym; cdecl; external libx;
function XStringToKeysym(para1: pchar): TKeySym; cdecl; external libx;
function XMaxRequestSize(para1: PDisplay): Tclong; cdecl; external libx;
function XExtendedMaxRequestSize(para1: PDisplay): Tclong; cdecl; external libx;
function XResourceManagerString(para1: PDisplay): pchar; cdecl; external libx;
function XScreenResourceString(para1: PScreen): pchar; cdecl; external libx;
function XDisplayMotionBufferSize(para1: PDisplay): Tculong; cdecl; external libx;
function XVisualIDFromVisual(para1: PVisual): TVisualID; cdecl; external libx;
function XInitThreads: TStatus; cdecl; external libx;
function XFreeThreads: TStatus; cdecl; external libx;
procedure XLockDisplay(para1: PDisplay); cdecl; external libx;
procedure XUnlockDisplay(para1: PDisplay); cdecl; external libx;
function XInitExtension(para1: PDisplay; para2: pchar): PXExtCodes; cdecl; external libx;
function XAddExtension(para1: PDisplay): PXExtCodes; cdecl; external libx;
function XFindOnExtensionList(para1: PPXExtData; para2: longint): PXExtData; cdecl; external libx;
function XEHeadOfExtensionList(para1: TXEDataObject): PPXExtData; cdecl; external libx;
function XRootWindow(para1: PDisplay; para2: longint): TWindow; cdecl; external libx;
function XDefaultRootWindow(para1: PDisplay): TWindow; cdecl; external libx;
function XRootWindowOfScreen(para1: PScreen): TWindow; cdecl; external libx;
function XDefaultVisual(para1: PDisplay; para2: longint): PVisual; cdecl; external libx;
function XDefaultVisualOfScreen(para1: PScreen): PVisual; cdecl; external libx;
function XDefaultGC(para1: PDisplay; para2: longint): TGC; cdecl; external libx;
function XDefaultGCOfScreen(para1: PScreen): TGC; cdecl; external libx;
function XBlackPixel(para1: PDisplay; para2: longint): Tculong; cdecl; external libx;
function XWhitePixel(para1: PDisplay; para2: longint): Tculong; cdecl; external libx;
function XAllPlanes: Tculong; cdecl; external libx;
function XBlackPixelOfScreen(para1: PScreen): Tculong; cdecl; external libx;
function XWhitePixelOfScreen(para1: PScreen): Tculong; cdecl; external libx;
function XNextRequest(para1: PDisplay): Tculong; cdecl; external libx;
function XLastKnownRequestProcessed(para1: PDisplay): Tculong; cdecl; external libx;
function XServerVendor(para1: PDisplay): pchar; cdecl; external libx;
function XDisplayString(para1: PDisplay): pchar; cdecl; external libx;
function XDefaultColormap(para1: PDisplay; para2: longint): TColormap; cdecl; external libx;
function XDefaultColormapOfScreen(para1: PScreen): TColormap; cdecl; external libx;
function XDisplayOfScreen(para1: PScreen): PDisplay; cdecl; external libx;
function XScreenOfDisplay(para1: PDisplay; para2: longint): PScreen; cdecl; external libx;
function XDefaultScreenOfDisplay(para1: PDisplay): PScreen; cdecl; external libx;
function XEventMaskOfScreen(para1: PScreen): Tclong; cdecl; external libx;
function XScreenNumberOfScreen(para1: PScreen): longint; cdecl; external libx;

type
  TXErrorHandler = function(para1: PDisplay; para2: PXErrorEvent): longint; cdecl;

function XSetErrorHandler(para1: TXErrorHandler): TXErrorHandler; cdecl; external libx;

type
  TXIOErrorHandler = function(para1: PDisplay): longint; cdecl;

function XSetIOErrorHandler(para1: TXIOErrorHandler): TXIOErrorHandler; cdecl; external libx;

type
  TXIOErrorExitHandler = procedure(para1: PDisplay; para2: pointer); cdecl;

procedure XSetIOErrorExitHandler(para1: PDisplay; para2: TXIOErrorExitHandler; para3: pointer); cdecl; external libx;
function XListPixmapFormats(para1: PDisplay; para2: Plongint): PXPixmapFormatValues; cdecl; external libx;
function XListDepths(para1: PDisplay; para2: longint; para3: Plongint): Plongint; cdecl; external libx;
function XReconfigureWMWindow(para1: PDisplay; para2: TWindow; para3: longint; para4: dword; para5: PXWindowChanges): TStatus; cdecl; external libx;
function XGetWMProtocols(para1: PDisplay; para2: TWindow; para3: PPAtom; para4: Plongint): TStatus; cdecl; external libx;
function XSetWMProtocols(para1: PDisplay; para2: TWindow; para3: PAtom; para4: longint): TStatus; cdecl; external libx;
function XIconifyWindow(para1: PDisplay; para2: TWindow; para3: longint): TStatus; cdecl; external libx;
function XWithdrawWindow(para1: PDisplay; para2: TWindow; para3: longint): TStatus; cdecl; external libx;
function XGetCommand(para1: PDisplay; para2: TWindow; para3: PPPchar; para4: Plongint): TStatus; cdecl; external libx;
function XGetWMColormapWindows(para1: PDisplay; para2: TWindow; para3: PPWindow; para4: Plongint): TStatus; cdecl; external libx;
function XSetWMColormapWindows(para1: PDisplay; para2: TWindow; para3: PWindow; para4: longint): TStatus; cdecl; external libx;
procedure XFreeStringList(para1: PPchar); cdecl; external libx;
function XSetTransientForHint(para1: PDisplay; para2: TWindow; para3: TWindow): longint; cdecl; external libx;
function XActivateScreenSaver(para1: PDisplay): longint; cdecl; external libx;
function XAddHost(para1: PDisplay; para2: PXHostAddress): longint; cdecl; external libx;
function XAddHosts(para1: PDisplay; para2: PXHostAddress; para3: longint): longint; cdecl; external libx;
function XAddToExtensionList(para1: PPXExtData; para2: PXExtData): longint; cdecl; external libx;
function XAddToSaveSet(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XAllocColor(para1: PDisplay; para2: TColormap; para3: PXColor): TStatus; cdecl; external libx;
function XAllocColorCells(para1: PDisplay; para2: TColormap; para3: boolean; para4: Pculong; para5: dword;
  para6: Pculong; para7: dword): TStatus; cdecl; external libx;
function XAllocColorPlanes(para1: PDisplay; para2: TColormap; para3: boolean; para4: Pculong; para5: longint;
  para6: longint; para7: longint; para8: longint; para9: Pculong; para10: Pculong;
  para11: Pculong): TStatus; cdecl; external libx;
function XAllocNamedColor(para1: PDisplay; para2: TColormap; para3: pchar; para4: PXColor; para5: PXColor): TStatus; cdecl; external libx;
function XAllowEvents(para1: PDisplay; para2: longint; para3: TTime): longint; cdecl; external libx;
function XAutoRepeatOff(para1: PDisplay): longint; cdecl; external libx;
function XAutoRepeatOn(para1: PDisplay): longint; cdecl; external libx;
function XBell(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XBitmapBitOrder(para1: PDisplay): longint; cdecl; external libx;
function XBitmapPad(para1: PDisplay): longint; cdecl; external libx;
function XBitmapUnit(para1: PDisplay): longint; cdecl; external libx;
function XCellsOfScreen(para1: PScreen): longint; cdecl; external libx;
function XChangeActivePointerGrab(para1: PDisplay; para2: dword; para3: TCursor; para4: TTime): longint; cdecl; external libx;
function XChangeGC(para1: PDisplay; para2: TGC; para3: Tculong; para4: PXGCValues): longint; cdecl; external libx;
function XChangeKeyboardControl(para1: PDisplay; para2: Tculong; para3: PXKeyboardControl): longint; cdecl; external libx;
function XChangeKeyboardMapping(para1: PDisplay; para2: longint; para3: longint; para4: PKeySym; para5: longint): longint; cdecl; external libx;
function XChangePointerControl(para1: PDisplay; para2: boolean; para3: boolean; para4: longint; para5: longint;
  para6: longint): longint; cdecl; external libx;
function XChangeProperty(para1: PDisplay; para2: TWindow; para3: TAtom; para4: TAtom; para5: longint;
  para6: longint; para7: pbyte; para8: longint): longint; cdecl; external libx;
function XChangeSaveSet(para1: PDisplay; para2: TWindow; para3: longint): longint; cdecl; external libx;
function XChangeWindowAttributes(para1: PDisplay; para2: TWindow; para3: Tculong; para4: PXSetWindowAttributes): longint; cdecl; external libx;

type
  TXEventPredicate = function(dpy: PDisplay; event: PXEvent; arg: Pointer): boolean; cdecl;

function XCheckIfEvent(dpy: PDisplay; event_return: PXEvent; predicate: TXEventPredicate; arg: Pointer): boolean; cdecl; external libx;
function XCheckMaskEvent(para1: PDisplay; para2: Tclong; para3: PXEvent): boolean; cdecl; external libx;
function XCheckTypedEvent(para1: PDisplay; para2: longint; para3: PXEvent): boolean; cdecl; external libx;
function XCheckTypedWindowEvent(para1: PDisplay; para2: TWindow; para3: longint; para4: PXEvent): boolean; cdecl; external libx;
function XCheckWindowEvent(para1: PDisplay; para2: TWindow; para3: Tclong; para4: PXEvent): boolean; cdecl; external libx;
function XCirculateSubwindows(para1: PDisplay; para2: TWindow; para3: longint): longint; cdecl; external libx;
function XCirculateSubwindowsDown(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XCirculateSubwindowsUp(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XClearArea(para1: PDisplay; para2: TWindow; para3: longint; para4: longint; para5: dword;
  para6: dword; para7: boolean): longint; cdecl; external libx;
function XClearWindow(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XCloseDisplay(para1: PDisplay): longint; cdecl; external libx;
function XConfigureWindow(para1: PDisplay; para2: TWindow; para3: dword; para4: PXWindowChanges): longint; cdecl; external libx;
function XConnectionNumber(para1: PDisplay): longint; cdecl; external libx;
function XConvertSelection(para1: PDisplay; para2: TAtom; para3: TAtom; para4: TAtom; para5: TWindow;
  para6: TTime): longint; cdecl; external libx;
function XCopyArea(para1: PDisplay; para2: TDrawable; para3: TDrawable; para4: TGC; para5: longint;
  para6: longint; para7: dword; para8: dword; para9: longint; para10: longint): longint; cdecl; external libx;
function XCopyGC(para1: PDisplay; para2: TGC; para3: Tculong; para4: TGC): longint; cdecl; external libx;
function XCopyPlane(para1: PDisplay; para2: TDrawable; para3: TDrawable; para4: TGC; para5: longint;
  para6: longint; para7: dword; para8: dword; para9: longint; para10: longint;
  para11: Tculong): longint; cdecl; external libx;
function XDefaultDepth(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XDefaultDepthOfScreen(para1: PScreen): longint; cdecl; external libx;
function XDefaultScreen(para1: PDisplay): longint; cdecl; external libx;
function XDefineCursor(para1: PDisplay; para2: TWindow; para3: TCursor): longint; cdecl; external libx;
function XDeleteProperty(para1: PDisplay; para2: TWindow; para3: TAtom): longint; cdecl; external libx;
function XDestroyWindow(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XDestroySubwindows(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XDoesBackingStore(para1: PScreen): longint; cdecl; external libx;
function XDoesSaveUnders(para1: PScreen): boolean; cdecl; external libx;
function XDisableAccessControl(para1: PDisplay): longint; cdecl; external libx;
function XDisplayCells(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XDisplayHeight(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XDisplayHeightMM(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XDisplayKeycodes(para1: PDisplay; para2: Plongint; para3: Plongint): longint; cdecl; external libx;
function XDisplayPlanes(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XDisplayWidth(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XDisplayWidthMM(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XDrawArc(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: dword; para7: dword; para8: longint; para9: longint): longint; cdecl; external libx;
function XDrawArcs(para1: PDisplay; para2: TDrawable; para3: TGC; para4: PXArc; para5: longint): longint; cdecl; external libx;
function XDrawImageString(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: pchar; para7: longint): longint; cdecl; external libx;
function XDrawImageString16(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: PXChar2b; para7: longint): longint; cdecl; external libx;
function XDrawLine(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: longint; para7: longint): longint; cdecl; external libx;
function XDrawLines(para1: PDisplay; para2: TDrawable; para3: TGC; para4: PXPoint; para5: longint;
  para6: longint): longint; cdecl; external libx;
function XDrawPoint(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint): longint; cdecl; external libx;
function XDrawPoints(para1: PDisplay; para2: TDrawable; para3: TGC; para4: PXPoint; para5: longint;
  para6: longint): longint; cdecl; external libx;
function XDrawRectangle(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: dword; para7: dword): longint; cdecl; external libx;
function XDrawRectangles(para1: PDisplay; para2: TDrawable; para3: TGC; para4: PXRectangle; para5: longint): longint; cdecl; external libx;
function XDrawSegments(para1: PDisplay; para2: TDrawable; para3: TGC; para4: PXSegment; para5: longint): longint; cdecl; external libx;
function XDrawString(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: pchar; para7: longint): longint; cdecl; external libx;
function XDrawString16(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: PXChar2b; para7: longint): longint; cdecl; external libx;
function XDrawText(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: PXTextItem; para7: longint): longint; cdecl; external libx;
function XDrawText16(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: PXTextItem16; para7: longint): longint; cdecl; external libx;
function XEnableAccessControl(para1: PDisplay): longint; cdecl; external libx;
function XEventsQueued(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XFetchName(para1: PDisplay; para2: TWindow; para3: PPchar): TStatus; cdecl; external libx;
function XFillArc(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: dword; para7: dword; para8: longint; para9: longint): longint; cdecl; external libx;
function XFillArcs(para1: PDisplay; para2: TDrawable; para3: TGC; para4: PXArc; para5: longint): longint; cdecl; external libx;
function XFillPolygon(para1: PDisplay; para2: TDrawable; para3: TGC; para4: PXPoint; para5: longint;
  para6: longint; para7: longint): longint; cdecl; external libx;
function XFillRectangle(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: dword; para7: dword): longint; cdecl; external libx;
function XFillRectangles(para1: PDisplay; para2: TDrawable; para3: TGC; para4: PXRectangle; para5: longint): longint; cdecl; external libx;
function XFlush(para1: PDisplay): longint; cdecl; external libx;
function XForceScreenSaver(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XFree(para1: pointer): longint; cdecl; external libx;
function XFreeColormap(para1: PDisplay; para2: TColormap): longint; cdecl; external libx;
function XFreeColors(para1: PDisplay; para2: TColormap; para3: Pculong; para4: longint; para5: Pculong): longint; cdecl; external libx;
function XFreeCursor(para1: PDisplay; para2: TCursor): longint; cdecl; external libx;
function XFreeExtensionList(para1: PPchar): longint; cdecl; external libx;
function XFreeFont(para1: PDisplay; para2: PXFontStruct): longint; cdecl; external libx;
function XFreeFontInfo(para1: PPchar; para2: PXFontStruct; para3: longint): longint; cdecl; external libx;
function XFreeFontNames(para1: PPchar): longint; cdecl; external libx;
function XFreeFontPath(para1: PPchar): longint; cdecl; external libx;
function XFreeGC(para1: PDisplay; para2: TGC): longint; cdecl; external libx;
function XFreeModifiermap(para1: PXModifierKeymap): longint; cdecl; external libx;
function XFreePixmap(para1: PDisplay; para2: TPixmap): longint; cdecl; external libx;
function XGeometry(para1: PDisplay; para2: longint; para3: pchar; para4: pchar; para5: dword;
  para6: dword; para7: dword; para8: longint; para9: longint; para10: Plongint;
  para11: Plongint; para12: Plongint; para13: Plongint): longint; cdecl; external libx;
function XGetErrorDatabaseText(para1: PDisplay; para2: pchar; para3: pchar; para4: pchar; para5: pchar;
  para6: longint): longint; cdecl; external libx;
function XGetErrorText(para1: PDisplay; para2: longint; para3: pchar; para4: longint): longint; cdecl; external libx;
function XGetFontProperty(para1: PXFontStruct; para2: TAtom; para3: Pculong): boolean; cdecl; external libx;
function XGetGCValues(para1: PDisplay; para2: TGC; para3: Tculong; para4: PXGCValues): TStatus; cdecl; external libx;
function XGetGeometry(para1: PDisplay; para2: TDrawable; para3: PWindow; para4: Plongint; para5: Plongint;
  para6: Pdword; para7: Pdword; para8: Pdword; para9: Pdword): TStatus; cdecl; external libx;
function XGetIconName(para1: PDisplay; para2: TWindow; para3: PPchar): TStatus; cdecl; external libx;
function XGetInputFocus(para1: PDisplay; para2: PWindow; para3: Plongint): longint; cdecl; external libx;
function XGetKeyboardControl(para1: PDisplay; para2: PXKeyboardState): longint; cdecl; external libx;
function XGetPointerControl(para1: PDisplay; para2: Plongint; para3: Plongint; para4: Plongint): longint; cdecl; external libx;
function XGetPointerMapping(para1: PDisplay; para2: pbyte; para3: longint): longint; cdecl; external libx;
function XGetScreenSaver(para1: PDisplay; para2: Plongint; para3: Plongint; para4: Plongint; para5: Plongint): longint; cdecl; external libx;
function XGetTransientForHint(para1: PDisplay; para2: TWindow; para3: PWindow): TStatus; cdecl; external libx;
function XGetWindowProperty(para1: PDisplay; para2: TWindow; para3: TAtom; para4: Tclong; para5: Tclong;
  para6: boolean; para7: TAtom; para8: PAtom; para9: Plongint; para10: Tculong;
  para11: Tculong; para12: PPbyte): longint; cdecl; external libx;
function XGetWindowAttributes(para1: PDisplay; para2: TWindow; para3: PXWindowAttributes): TStatus; cdecl; external libx;
function XGrabButton(para1: PDisplay; para2: dword; para3: dword; para4: TWindow; para5: boolean;
  para6: dword; para7: longint; para8: longint; para9: TWindow; para10: TCursor): longint; cdecl; external libx;
function XGrabKey(para1: PDisplay; para2: longint; para3: dword; para4: TWindow; para5: boolean;
  para6: longint; para7: longint): longint; cdecl; external libx;
function XGrabKeyboard(para1: PDisplay; para2: TWindow; para3: boolean; para4: longint; para5: longint;
  para6: TTime): longint; cdecl; external libx;
function XGrabPointer(para1: PDisplay; para2: TWindow; para3: boolean; para4: dword; para5: longint;
  para6: longint; para7: TWindow; para8: TCursor; para9: TTime): longint; cdecl; external libx;
function XGrabServer(para1: PDisplay): longint; cdecl; external libx;
function XHeightMMOfScreen(para1: PScreen): longint; cdecl; external libx;
function XHeightOfScreen(para1: PScreen): longint; cdecl; external libx;

type
  TXEventPredicate_func = function(dpy: PDisplay; event: PXEvent; arg: Pointer): boolean; cdecl;

function XIfEvent(para1: PDisplay; para2: PXEvent; para3: TXEventPredicate_func; para4: TXPointer): longint; cdecl; external libx;
function XImageByteOrder(para1: PDisplay): longint; cdecl; external libx;
function XInstallColormap(para1: PDisplay; para2: TColormap): longint; cdecl; external libx;
function XKeysymToKeycode(para1: PDisplay; para2: TKeySym): TKeyCode; cdecl; external libx;
function XKillClient(para1: PDisplay; para2: TXID): longint; cdecl; external libx;
function XLookupColor(para1: PDisplay; para2: TColormap; para3: pchar; para4: PXColor; para5: PXColor): TStatus; cdecl; external libx;
function XLowerWindow(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XMapRaised(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XMapSubwindows(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XMapWindow(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XMaskEvent(para1: PDisplay; para2: Tclong; para3: PXEvent): longint; cdecl; external libx;
function XMaxCmapsOfScreen(para1: PScreen): longint; cdecl; external libx;
function XMinCmapsOfScreen(para1: PScreen): longint; cdecl; external libx;
function XMoveResizeWindow(para1: PDisplay; para2: TWindow; para3: longint; para4: longint; para5: dword;
  para6: dword): longint; cdecl; external libx;
function XMoveWindow(para1: PDisplay; para2: TWindow; para3: longint; para4: longint): longint; cdecl; external libx;
function XNextEvent(para1: PDisplay; para2: PXEvent): longint; cdecl; external libx;
function XNoOp(para1: PDisplay): longint; cdecl; external libx;
function XParseColor(para1: PDisplay; para2: TColormap; para3: pchar; para4: PXColor): TStatus; cdecl; external libx;
function XParseGeometry(para1: pchar; para2: Plongint; para3: Plongint; para4: Pdword; para5: Pdword): longint; cdecl; external libx;
function XPeekEvent(para1: PDisplay; para2: PXEvent): longint; cdecl; external libx;
function XPeekIfEvent(para1: PDisplay; para2: PXEvent; para3: TXEventPredicate_func; para4: TXPointer): longint; cdecl; external libx;
function XPending(para1: PDisplay): longint; cdecl; external libx;
function XPlanesOfScreen(para1: PScreen): longint; cdecl; external libx;
function XProtocolRevision(para1: PDisplay): longint; cdecl; external libx;
function XProtocolVersion(para1: PDisplay): longint; cdecl; external libx;
function XPutBackEvent(para1: PDisplay; para2: PXEvent): longint; cdecl; external libx;
function XPutImage(para1: PDisplay; para2: TDrawable; para3: TGC; para4: PXImage; para5: longint;
  para6: longint; para7: longint; para8: longint; para9: dword; para10: dword): longint; cdecl; external libx;
function XQLength(para1: PDisplay): longint; cdecl; external libx;
function XQueryBestCursor(para1: PDisplay; para2: TDrawable; para3: dword; para4: dword; para5: Pdword;
  para6: Pdword): TStatus; cdecl; external libx;
function XQueryBestSize(para1: PDisplay; para2: longint; para3: TDrawable; para4: dword; para5: dword;
  para6: Pdword; para7: Pdword): TStatus; cdecl; external libx;
function XQueryBestStipple(para1: PDisplay; para2: TDrawable; para3: dword; para4: dword; para5: Pdword;
  para6: Pdword): TStatus; cdecl; external libx;
function XQueryBestTile(para1: PDisplay; para2: TDrawable; para3: dword; para4: dword; para5: Pdword;
  para6: Pdword): TStatus; cdecl; external libx;
function XQueryColor(para1: PDisplay; para2: TColormap; para3: PXColor): longint; cdecl; external libx;
function XQueryColors(para1: PDisplay; para2: TColormap; para3: PXColor; para4: longint): longint; cdecl; external libx;
function XQueryExtension(para1: PDisplay; para2: pchar; para3: Plongint; para4: Plongint; para5: Plongint): boolean; cdecl; external libx;
function XQueryKeymap(para1: PDisplay; para2: pchar): longint; cdecl; external libx;
function XQueryPointer(para1: PDisplay; para2: TWindow; para3: PWindow; para4: PWindow; para5: Plongint;
  para6: Plongint; para7: Plongint; para8: Plongint; para9: Pdword): boolean; cdecl; external libx;
function XQueryTextExtents(para1: PDisplay; para2: TXID; para3: pchar; para4: longint; para5: Plongint;
  para6: Plongint; para7: Plongint; para8: PXCharStruct): longint; cdecl; external libx;
function XQueryTextExtents16(para1: PDisplay; para2: TXID; para3: PXChar2b; para4: longint; para5: Plongint;
  para6: Plongint; para7: Plongint; para8: PXCharStruct): longint; cdecl; external libx;
function XQueryTree(para1: PDisplay; para2: TWindow; para3: PWindow; para4: PWindow; para5: PPWindow;
  para6: Pdword): TStatus; cdecl; external libx;
function XRaiseWindow(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XReadBitmapFile(para1: PDisplay; para2: TDrawable; para3: pchar; para4: Pdword; para5: Pdword;
  para6: PPixmap; para7: Plongint; para8: Plongint): longint; cdecl; external libx;
function XReadBitmapFileData(para1: pchar; para2: Pdword; para3: Pdword; para4: PPbyte; para5: Plongint;
  para6: Plongint): longint; cdecl; external libx;
function XRebindKeysym(para1: PDisplay; para2: TKeySym; para3: PKeySym; para4: longint; para5: pbyte;
  para6: longint): longint; cdecl; external libx;
function XRecolorCursor(para1: PDisplay; para2: TCursor; para3: PXColor; para4: PXColor): longint; cdecl; external libx;
function XRefreshKeyboardMapping(para1: PXMappingEvent): longint; cdecl; external libx;
function XRemoveFromSaveSet(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XRemoveHost(para1: PDisplay; para2: PXHostAddress): longint; cdecl; external libx;
function XRemoveHosts(para1: PDisplay; para2: PXHostAddress; para3: longint): longint; cdecl; external libx;
function XReparentWindow(para1: PDisplay; para2: TWindow; para3: TWindow; para4: longint; para5: longint): longint; cdecl; external libx;
function XResetScreenSaver(para1: PDisplay): longint; cdecl; external libx;
function XResizeWindow(para1: PDisplay; para2: TWindow; para3: dword; para4: dword): longint; cdecl; external libx;
function XRestackWindows(para1: PDisplay; para2: PWindow; para3: longint): longint; cdecl; external libx;
function XRotateBuffers(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XRotateWindowProperties(para1: PDisplay; para2: TWindow; para3: PAtom; para4: longint; para5: longint): longint; cdecl; external libx;
function XScreenCount(para1: PDisplay): longint; cdecl; external libx;
function XSelectInput(para1: PDisplay; para2: TWindow; para3: Tclong): longint; cdecl; external libx;
function XSendEvent(para1: PDisplay; para2: TWindow; para3: boolean; para4: Tclong; para5: PXEvent): TStatus; cdecl; external libx;
function XSetAccessControl(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XSetArcMode(para1: PDisplay; para2: TGC; para3: longint): longint; cdecl; external libx;
function XSetBackground(para1: PDisplay; para2: TGC; para3: Tculong): longint; cdecl; external libx;
function XSetClipMask(para1: PDisplay; para2: TGC; para3: TPixmap): longint; cdecl; external libx;
function XSetClipOrigin(para1: PDisplay; para2: TGC; para3: longint; para4: longint): longint; cdecl; external libx;
function XSetClipRectangles(para1: PDisplay; para2: TGC; para3: longint; para4: longint; para5: PXRectangle;
  para6: longint; para7: longint): longint; cdecl; external libx;
function XSetCloseDownMode(para1: PDisplay; para2: longint): longint; cdecl; external libx;
function XSetCommand(para1: PDisplay; para2: TWindow; para3: PPchar; para4: longint): longint; cdecl; external libx;
function XSetDashes(para1: PDisplay; para2: TGC; para3: longint; para4: pchar; para5: longint): longint; cdecl; external libx;
function XSetFillRule(para1: PDisplay; para2: TGC; para3: longint): longint; cdecl; external libx;
function XSetFillStyle(para1: PDisplay; para2: TGC; para3: longint): longint; cdecl; external libx;
function XSetFont(para1: PDisplay; para2: TGC; para3: TFont): longint; cdecl; external libx;
function XSetFontPath(para1: PDisplay; para2: PPchar; para3: longint): longint; cdecl; external libx;
function XSetForeground(para1: PDisplay; para2: TGC; para3: Tculong): longint; cdecl; external libx;
function XSetFunction(para1: PDisplay; para2: TGC; para3: longint): longint; cdecl; external libx;
function XSetGraphicsExposures(para1: PDisplay; para2: TGC; para3: boolean): longint; cdecl; external libx;
function XSetIconName(para1: PDisplay; para2: TWindow; para3: pchar): longint; cdecl; external libx;
function XSetInputFocus(para1: PDisplay; para2: TWindow; para3: longint; para4: TTime): longint; cdecl; external libx;
function XSetLineAttributes(para1: PDisplay; para2: TGC; para3: dword; para4: longint; para5: longint;
  para6: longint): longint; cdecl; external libx;
function XSetModifierMapping(para1: PDisplay; para2: PXModifierKeymap): longint; cdecl; external libx;
function XSetPlaneMask(para1: PDisplay; para2: TGC; para3: Tculong): longint; cdecl; external libx;
function XSetPointerMapping(para1: PDisplay; para2: pbyte; para3: longint): longint; cdecl; external libx;
function XSetScreenSaver(para1: PDisplay; para2: longint; para3: longint; para4: longint; para5: longint): longint; cdecl; external libx;
function XSetSelectionOwner(para1: PDisplay; para2: TAtom; para3: TWindow; para4: TTime): longint; cdecl; external libx;
function XSetState(para1: PDisplay; para2: TGC; para3: Tculong; para4: Tculong; para5: longint;
  para6: Tculong): longint; cdecl; external libx;
function XSetStipple(para1: PDisplay; para2: TGC; para3: TPixmap): longint; cdecl; external libx;
function XSetSubwindowMode(para1: PDisplay; para2: TGC; para3: longint): longint; cdecl; external libx;
function XSetTSOrigin(para1: PDisplay; para2: TGC; para3: longint; para4: longint): longint; cdecl; external libx;
function XSetTile(para1: PDisplay; para2: TGC; para3: TPixmap): longint; cdecl; external libx;
function XSetWindowBackground(para1: PDisplay; para2: TWindow; para3: Tculong): longint; cdecl; external libx;
function XSetWindowBackgroundPixmap(para1: PDisplay; para2: TWindow; para3: TPixmap): longint; cdecl; external libx;
function XSetWindowBorder(para1: PDisplay; para2: TWindow; para3: Tculong): longint; cdecl; external libx;
function XSetWindowBorderPixmap(para1: PDisplay; para2: TWindow; para3: TPixmap): longint; cdecl; external libx;
function XSetWindowBorderWidth(para1: PDisplay; para2: TWindow; para3: dword): longint; cdecl; external libx;
function XSetWindowColormap(para1: PDisplay; para2: TWindow; para3: TColormap): longint; cdecl; external libx;
function XStoreBuffer(para1: PDisplay; para2: pchar; para3: longint; para4: longint): longint; cdecl; external libx;
function XStoreBytes(para1: PDisplay; para2: pchar; para3: longint): longint; cdecl; external libx;
function XStoreColor(para1: PDisplay; para2: TColormap; para3: PXColor): longint; cdecl; external libx;
function XStoreColors(para1: PDisplay; para2: TColormap; para3: PXColor; para4: longint): longint; cdecl; external libx;
function XStoreName(para1: PDisplay; para2: TWindow; para3: pchar): longint; cdecl; external libx;
function XStoreNamedColor(para1: PDisplay; para2: TColormap; para3: pchar; para4: Tculong; para5: longint): longint; cdecl; external libx;
function XSync(para1: PDisplay; para2: boolean): longint; cdecl; external libx;
function XTextExtents(para1: PXFontStruct; para2: pchar; para3: longint; para4: Plongint; para5: Plongint;
  para6: Plongint; para7: PXCharStruct): longint; cdecl; external libx;
function XTextExtents16(para1: PXFontStruct; para2: PXChar2b; para3: longint; para4: Plongint; para5: Plongint;
  para6: Plongint; para7: PXCharStruct): longint; cdecl; external libx;
function XTextWidth(para1: PXFontStruct; para2: pchar; para3: longint): longint; cdecl; external libx;
function XTextWidth16(para1: PXFontStruct; para2: PXChar2b; para3: longint): longint; cdecl; external libx;
function XTranslateCoordinates(para1: PDisplay; para2: TWindow; para3: TWindow; para4: longint; para5: longint;
  para6: Plongint; para7: Plongint; para8: PWindow): boolean; cdecl; external libx;
function XUndefineCursor(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XUngrabButton(para1: PDisplay; para2: dword; para3: dword; para4: TWindow): longint; cdecl; external libx;
function XUngrabKey(para1: PDisplay; para2: longint; para3: dword; para4: TWindow): longint; cdecl; external libx;
function XUngrabKeyboard(para1: PDisplay; para2: TTime): longint; cdecl; external libx;
function XUngrabPointer(para1: PDisplay; para2: TTime): longint; cdecl; external libx;
function XUngrabServer(para1: PDisplay): longint; cdecl; external libx;
function XUninstallColormap(para1: PDisplay; para2: TColormap): longint; cdecl; external libx;
function XUnloadFont(para1: PDisplay; para2: TFont): longint; cdecl; external libx;
function XUnmapSubwindows(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XUnmapWindow(para1: PDisplay; para2: TWindow): longint; cdecl; external libx;
function XVendorRelease(para1: PDisplay): longint; cdecl; external libx;
function XWarpPointer(para1: PDisplay; para2: TWindow; para3: TWindow; para4: longint; para5: longint;
  para6: dword; para7: dword; para8: longint; para9: longint): longint; cdecl; external libx;
function XWidthMMOfScreen(para1: PScreen): longint; cdecl; external libx;
function XWidthOfScreen(para1: PScreen): longint; cdecl; external libx;
function XWindowEvent(para1: PDisplay; para2: TWindow; para3: Tclong; para4: PXEvent): longint; cdecl; external libx;
function XWriteBitmapFile(para1: PDisplay; para2: pchar; para3: TPixmap; para4: dword; para5: dword;
  para6: longint; para7: longint): longint; cdecl; external libx;
function XSupportsLocale: boolean; cdecl; external libx;
function XSetLocaleModifiers(para1: pchar): pchar; cdecl; external libx;
function XOpenOM(para1: PDisplay; para2: PXrmHashBucketRec; para3: pchar; para4: pchar): TXOM; cdecl; external libx;
function XCloseOM(para1: TXOM): TStatus; cdecl; external libx;
function XSetOMValues(para1: TXOM): pchar; cdecl; varargs; external libx;
function XGetOMValues(para1: TXOM): pchar; cdecl; varargs; external libx;
function XDisplayOfOM(para1: TXOM): PDisplay; cdecl; external libx;
function XLocaleOfOM(para1: TXOM): pchar; cdecl; external libx;
function XCreateOC(para1: TXOM): TXOC; cdecl; varargs; external libx;
procedure XDestroyOC(para1: TXOC); cdecl; external libx;
function XOMOfOC(para1: TXOC): TXOM; cdecl; external libx;
function XSetOCValues(para1: TXOC): pchar; cdecl; varargs; external libx;
function XGetOCValues(para1: TXOC): pchar; cdecl; varargs; external libx;
function XCreateFontSet(para1: PDisplay; para2: pchar; para3: PPPchar; para4: Plongint; para5: PPchar): TXFontSet; cdecl; external libx;
procedure XFreeFontSet(para1: PDisplay; para2: TXFontSet); cdecl; external libx;
function XFontsOfFontSet(para1: TXFontSet; para2: PPPXFontStruct; para3: PPPchar): longint; cdecl; external libx;
function XBaseFontNameListOfFontSet(para1: TXFontSet): pchar; cdecl; external libx;
function XLocaleOfFontSet(para1: TXFontSet): pchar; cdecl; external libx;
function XContextDependentDrawing(para1: TXFontSet): boolean; cdecl; external libx;
function XDirectionalDependentDrawing(para1: TXFontSet): boolean; cdecl; external libx;
function XContextualDrawing(para1: TXFontSet): boolean; cdecl; external libx;
function XExtentsOfFontSet(para1: TXFontSet): PXFontSetExtents; cdecl; external libx;
function XmbTextEscapement(para1: TXFontSet; para2: pchar; para3: longint): longint; cdecl; external libx;
function XwcTextEscapement(para1: TXFontSet; para2: Pwchar_t; para3: longint): longint; cdecl; external libx;
function Xutf8TextEscapement(para1: TXFontSet; para2: pchar; para3: longint): longint; cdecl; external libx;
function XmbTextExtents(para1: TXFontSet; para2: pchar; para3: longint; para4: PXRectangle; para5: PXRectangle): longint; cdecl; external libx;
function XwcTextExtents(para1: TXFontSet; para2: Pwchar_t; para3: longint; para4: PXRectangle; para5: PXRectangle): longint; cdecl; external libx;
function Xutf8TextExtents(para1: TXFontSet; para2: pchar; para3: longint; para4: PXRectangle; para5: PXRectangle): longint; cdecl; external libx;
function XmbTextPerCharExtents(para1: TXFontSet; para2: pchar; para3: longint; para4: PXRectangle; para5: PXRectangle;
  para6: longint; para7: Plongint; para8: PXRectangle; para9: PXRectangle): TStatus; cdecl; external libx;
function XwcTextPerCharExtents(para1: TXFontSet; para2: Pwchar_t; para3: longint; para4: PXRectangle; para5: PXRectangle;
  para6: longint; para7: Plongint; para8: PXRectangle; para9: PXRectangle): TStatus; cdecl; external libx;
function Xutf8TextPerCharExtents(para1: TXFontSet; para2: pchar; para3: longint; para4: PXRectangle; para5: PXRectangle;
  para6: longint; para7: Plongint; para8: PXRectangle; para9: PXRectangle): TStatus; cdecl; external libx;
procedure XmbDrawText(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: PXmbTextItem; para7: longint); cdecl; external libx;
procedure XwcDrawText(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: PXwcTextItem; para7: longint); cdecl; external libx;
procedure Xutf8DrawText(para1: PDisplay; para2: TDrawable; para3: TGC; para4: longint; para5: longint;
  para6: PXmbTextItem; para7: longint); cdecl; external libx;
procedure XmbDrawString(para1: PDisplay; para2: TDrawable; para3: TXFontSet; para4: TGC; para5: longint;
  para6: longint; para7: pchar; para8: longint); cdecl; external libx;
procedure XwcDrawString(para1: PDisplay; para2: TDrawable; para3: TXFontSet; para4: TGC; para5: longint;
  para6: longint; para7: Pwchar_t; para8: longint); cdecl; external libx;
procedure Xutf8DrawString(para1: PDisplay; para2: TDrawable; para3: TXFontSet; para4: TGC; para5: longint;
  para6: longint; para7: pchar; para8: longint); cdecl; external libx;
procedure XmbDrawImageString(para1: PDisplay; para2: TDrawable; para3: TXFontSet; para4: TGC; para5: longint;
  para6: longint; para7: pchar; para8: longint); cdecl; external libx;
procedure XwcDrawImageString(para1: PDisplay; para2: TDrawable; para3: TXFontSet; para4: TGC; para5: longint;
  para6: longint; para7: Pwchar_t; para8: longint); cdecl; external libx;
procedure Xutf8DrawImageString(para1: PDisplay; para2: TDrawable; para3: TXFontSet; para4: TGC; para5: longint;
  para6: longint; para7: pchar; para8: longint); cdecl; external libx;
function XOpenIM(para1: PDisplay; para2: PXrmHashBucketRec; para3: pchar; para4: pchar): TXIM; cdecl; external libx;
function XCloseIM(para1: TXIM): TStatus; cdecl; external libx;
function XGetIMValues(para1: TXIM): pchar; cdecl; varargs; external libx;
function XSetIMValues(para1: TXIM): pchar; cdecl; varargs; external libx;
function XDisplayOfIM(para1: TXIM): PDisplay; cdecl; external libx;
function XLocaleOfIM(para1: TXIM): pchar; cdecl; external libx;
function XCreateIC(para1: TXIM): TXIC; cdecl; varargs; external libx;
procedure XDestroyIC(para1: TXIC); cdecl; external libx;
procedure XSetICFocus(para1: TXIC); cdecl; external libx;
procedure XUnsetICFocus(para1: TXIC); cdecl; external libx;
function XwcResetIC(para1: TXIC): Pwchar_t; cdecl; external libx;
function XmbResetIC(para1: TXIC): pchar; cdecl; external libx;
function Xutf8ResetIC(para1: TXIC): pchar; cdecl; external libx;
function XSetICValues(para1: TXIC): pchar; cdecl; varargs; external libx;
function XGetICValues(para1: TXIC): pchar; cdecl; varargs; external libx;
function XIMOfIC(para1: TXIC): TXIM; cdecl; external libx;
function XFilterEvent(para1: PXEvent; para2: TWindow): boolean; cdecl; external libx;
function XmbLookupString(para1: TXIC; para2: PXKeyPressedEvent; para3: pchar; para4: longint; para5: PKeySym;
  para6: PStatus): longint; cdecl; external libx;
function XwcLookupString(para1: TXIC; para2: PXKeyPressedEvent; para3: Pwchar_t; para4: longint; para5: PKeySym;
  para6: PStatus): longint; cdecl; external libx;
function Xutf8LookupString(para1: TXIC; para2: PXKeyPressedEvent; para3: pchar; para4: longint; para5: PKeySym;
  para6: PStatus): longint; cdecl; external libx;
function XVaCreateNestedList(para1: longint): TXVaNestedList; cdecl; varargs; external libx;
function XRegisterIMInstantiateCallback(para1: PDisplay; para2: PXrmHashBucketRec; para3: pchar; para4: pchar; para5: TXIDProc;
  para6: TXPointer): boolean; cdecl; external libx;
function XUnregisterIMInstantiateCallback(para1: PDisplay; para2: PXrmHashBucketRec; para3: pchar; para4: pchar; para5: TXIDProc;
  para6: TXPointer): boolean; cdecl; external libx;

type
  TXConnectionWatchProc = procedure(para1: PDisplay; para2: TXPointer; para3: longint; para4: boolean; para5: PXPointer); cdecl;

function XInternalConnectionNumbers(para1: PDisplay; para2: PPlongint; para3: Plongint): TStatus; cdecl; external libx;
procedure XProcessInternalConnection(para1: PDisplay; para2: longint); cdecl; external libx;
function XAddConnectionWatch(para1: PDisplay; para2: TXConnectionWatchProc; para3: TXPointer): TStatus; cdecl; external libx;
procedure XRemoveConnectionWatch(para1: PDisplay; para2: TXConnectionWatchProc; para3: TXPointer); cdecl; external libx;
procedure XSetAuthorization(para1: pchar; para2: longint; para3: pchar; para4: longint); cdecl; external libx;
function _Xmbtowc(para1: Pwchar_t; para2: pchar; para3: longint): longint; cdecl; external libx;
function _Xwctomb(para1: pchar; para2: Twchar_t): longint; cdecl; external libx;
function XGetEventData(para1: PDisplay; para2: PXGenericEventCookie): boolean; cdecl; external libx;
procedure XFreeEventData(para1: PDisplay; para2: PXGenericEventCookie); cdecl; external libx;

// === Konventiert am: 9-12-25 15:57:05 ===


function ConnectionNumber(dpy: PDisplay): integer;
function QLength(dpy: PDisplay): integer;
function ScreenCount(dpy: PDisplay): integer;
function ServerVendor(dpy: PDisplay): pansichar;
function ProtocolVersion(dpy: PDisplay): integer;
function ProtocolRevision(dpy: PDisplay): integer;
function VendorRelease(dpy: PDisplay): integer;
function DisplayString(dpy: PDisplay): pansichar;
function BitmapUnit(dpy: PDisplay): integer;
function BitmapBitOrder(dpy: PDisplay): integer;
function BitmapPad(dpy: PDisplay): integer;
function ImageByteOrder(dpy: PDisplay): integer;
function NextRequest(dpy: PDisplay): TXID;
function LastKnownRequestProcessed(dpy: PDisplay): TXID;

function DefaultScreen(dpy: PDisplay): integer;
function DefaultRootWindow(dpy: PDisplay): TWindow;
function DefaultColormap(dpy: PDisplay): TColormap;
function DefaultDepth(dpy: PDisplay): integer;

function ScreenOfDisplay(dpy: PDisplay; scr: integer): PScreen;

function RootWindow(dpy: PDisplay; scr: integer): TWindow;
function DefaultVisual(dpy: PDisplay; scr: integer): PVisual;
function DefaultGC(dpy: PDisplay; scr: integer): TGC;
function BlackPixel(dpy: PDisplay; scr: integer): Tculong;
function WhitePixel(dpy: PDisplay; scr: integer): Tculong;
function DisplayWidth(dpy: PDisplay; scr: integer): integer;
function DisplayHeight(dpy: PDisplay; scr: integer): integer;
function DisplayWidthMM(dpy: PDisplay; scr: integer): integer;
function DisplayHeightMM(dpy: PDisplay; scr: integer): integer;
function DisplayPlanes(dpy: PDisplay; scr: integer): integer;
function DisplayCells(dpy: PDisplay; scr: integer): integer;

const
  AllPlanes = cardinal($FFFFFFFF);

function DefaultScreenOfDisplay(dpy: PDisplay): PScreen;
function DisplayOfScreen(s: PScreen): PDisplay;
function RootWindowOfScreen(s: PScreen): TWindow;
function BlackPixelOfScreen(s: PScreen): cardinal;
function WhitePixelOfScreen(s: PScreen): cardinal;
function DefaultColormapOfScreen(s: PScreen): TColormap;
function DefaultDepthOfScreen(s: PScreen): integer;
function DefaultGCOfScreen(s: PScreen): TGC;
function DefaultVisualOfScreen(s: PScreen): PVisual;
function WidthOfScreen(s: PScreen): integer;
function HeightOfScreen(s: PScreen): integer;
function WidthMMOfScreen(s: PScreen): integer;
function HeightMMOfScreen(s: PScreen): integer;
function PlanesOfScreen(s: PScreen): integer;
function CellsOfScreen(s: PScreen): integer;
function MinCmapsOfScreen(s: PScreen): integer;
function MaxCmapsOfScreen(s: PScreen): integer;
function DoesSaveUnders(s: PScreen): boolean;
function DoesBackingStore(s: PScreen): integer;
function EventMaskOfScreen(s: PScreen): cardinal;


implementation

function ConnectionNumber(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.fd;
end;

function QLength(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.qlen;
end;

function ScreenCount(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.nscreens;
end;

function ServerVendor(dpy: PDisplay): pansichar; inline;
begin
  Result := dpy^.vendor;
end;

function ProtocolVersion(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.proto_major_version;
end;

function ProtocolRevision(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.proto_minor_version;
end;

function VendorRelease(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.release;
end;

function DisplayString(dpy: PDisplay): pansichar; inline;
begin
  Result := dpy^.display_name;
end;

function BitmapUnit(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.bitmap_unit;
end;

function BitmapBitOrder(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.bitmap_bit_order;
end;

function BitmapPad(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.bitmap_pad;
end;

function ImageByteOrder(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.byte_order;
end;

function NextRequest(dpy: PDisplay): TXID;
begin
  Result := dpy^.request + 1;
end;

function LastKnownRequestProcessed(dpy: PDisplay): TXID;
begin
  Result := dpy^.last_request_read;
end;

function DefaultScreen(dpy: PDisplay): integer; inline;
begin
  Result := dpy^.default_screen;
end;

function DefaultRootWindow(dpy: PDisplay): TWindow;
begin
  Result := ScreenOfDisplay(dpy, DefaultScreen(dpy))^.root;
end;

function DefaultColormap(dpy: PDisplay): TColormap;
begin
  Result := ScreenOfDisplay(dpy, DefaultScreen(dpy))^.cmap;
end;

function DefaultDepth(dpy: PDisplay): integer; inline;
begin
  Result := ScreenOfDisplay(dpy, DefaultScreen(dpy))^.root_depth;
end;

function ScreenOfDisplay(dpy: PDisplay; scr: integer): PScreen; inline;
begin
  Result := @dpy^.screens[scr];
end;

function RootWindow(dpy: PDisplay; scr: integer): TWindow;
begin
  Result := ScreenOfDisplay(dpy, scr)^.root;
end;

function DefaultVisual(dpy: PDisplay; scr: integer): PVisual; inline;
begin
  Result := ScreenOfDisplay(dpy, scr)^.root_visual;
end;

function DefaultGC(dpy: PDisplay; scr: integer): TGC;
begin
  Result := ScreenOfDisplay(dpy, scr)^.default_gc;
end;

function BlackPixel(dpy: PDisplay; scr: integer): Tculong;
begin
  Result := ScreenOfDisplay(dpy, scr)^.black_pixel;
end;

function WhitePixel(dpy: PDisplay; scr: integer): Tculong;
begin
  Result := ScreenOfDisplay(dpy, scr)^.white_pixel;
end;

function DisplayWidth(dpy: PDisplay; scr: integer): integer; inline;
begin
  Result := ScreenOfDisplay(dpy, scr)^.width;
end;

function DisplayHeight(dpy: PDisplay; scr: integer): integer; inline;
begin
  Result := ScreenOfDisplay(dpy, scr)^.height;
end;

function DisplayWidthMM(dpy: PDisplay; scr: integer): integer; inline;
begin
  Result := ScreenOfDisplay(dpy, scr)^.mwidth;
end;

function DisplayHeightMM(dpy: PDisplay; scr: integer): integer; inline;
begin
  Result := ScreenOfDisplay(dpy, scr)^.mheight;
end;

function DisplayPlanes(dpy: PDisplay; scr: integer): integer; inline;
begin
  Result := ScreenOfDisplay(dpy, scr)^.root_depth;
end;

function DisplayCells(dpy: PDisplay; scr: integer): integer; inline;
begin
  Result := DefaultVisual(dpy, scr)^.map_entries;
end;


function DefaultScreenOfDisplay(dpy: PDisplay): PScreen; inline;
begin
  Result := ScreenOfDisplay(dpy, DefaultScreen(dpy));
end;

function DisplayOfScreen(s: PScreen): PDisplay; inline;
begin
  Result := s^.display;
end;

function RootWindowOfScreen(s: PScreen): TWindow;
begin
  Result := s^.root;
end;

function BlackPixelOfScreen(s: PScreen): cardinal; inline;
begin
  Result := s^.black_pixel;
end;

function WhitePixelOfScreen(s: PScreen): cardinal; inline;
begin
  Result := s^.white_pixel;
end;

function DefaultColormapOfScreen(s: PScreen): TColormap;
begin
  Result := s^.cmap;
end;

function DefaultDepthOfScreen(s: PScreen): integer; inline;
begin
  Result := s^.root_depth;
end;

function DefaultGCOfScreen(s: PScreen): TGC;
begin
  Result := s^.default_gc;
end;

function DefaultVisualOfScreen(s: PScreen): PVisual; inline;
begin
  Result := s^.root_visual;
end;

function WidthOfScreen(s: PScreen): integer; inline;
begin
  Result := s^.width;
end;

function HeightOfScreen(s: PScreen): integer; inline;
begin
  Result := s^.height;
end;

function WidthMMOfScreen(s: PScreen): integer; inline;
begin
  Result := s^.mwidth;
end;

function HeightMMOfScreen(s: PScreen): integer; inline;
begin
  Result := s^.mheight;
end;

function PlanesOfScreen(s: PScreen): integer; inline;
begin
  Result := s^.root_depth;
end;

function CellsOfScreen(s: PScreen): integer; inline;
begin
  Result := DefaultVisualOfScreen(s)^.map_entries;
end;

function MinCmapsOfScreen(s: PScreen): integer; inline;
begin
  Result := s^.min_maps;
end;

function MaxCmapsOfScreen(s: PScreen): integer; inline;
begin
  Result := s^.max_maps;
end;

function DoesSaveUnders(s: PScreen): boolean; inline;
begin
  Result := s^.save_unders;
end;

function DoesBackingStore(s: PScreen): integer; inline;
begin
  Result := s^.backing_store;
end;

function EventMaskOfScreen(s: PScreen): cardinal; inline;
begin
  Result := s^.root_input_mask;
end;

end.
