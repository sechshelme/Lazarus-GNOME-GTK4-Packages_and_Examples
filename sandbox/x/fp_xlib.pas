unit fp_xlib;

interface

uses
  fp_x11, fp_x;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  XlibSpecificationRelease = 6;  

function _Xmblen(str:Pchar; len:longint):longint;cdecl;external libx;
const
  X_HAVE_UTF8_STRING = 1;  
type
  PXPointer = ^TXPointer;
  TXPointer = Pchar;

  TStatus = longint;
const
  QueuedAlready = 0;
  QueuedAfterReading = 1;  
  QueuedAfterFlush = 2;  

function ConnectionNumber(dpy : longint) : longint;
function RootWindow(dpy,scr : longint) : longint;
function DefaultScreen(dpy : longint) : longint;
function DefaultRootWindow(dpy : longint) : longint;
function DefaultVisual(dpy,scr : longint) : longint;
function DefaultGC(dpy,scr : longint) : longint;
function BlackPixel(dpy,scr : longint) : longint;
function WhitePixel(dpy,scr : longint) : longint;
function AllPlanes : dword;
function QLength(dpy : longint) : longint;
function DisplayWidth(dpy,scr : longint) : longint;
function DisplayHeight(dpy,scr : longint) : longint;
function DisplayWidthMM(dpy,scr : longint) : longint;
function DisplayHeightMM(dpy,scr : longint) : longint;
function DisplayPlanes(dpy,scr : longint) : longint;
function DisplayCells(dpy,scr : longint) : longint;
function ScreenCount(dpy : longint) : longint;
function ServerVendor(dpy : longint) : longint;
function ProtocolVersion(dpy : longint) : longint;
function ProtocolRevision(dpy : longint) : longint;
function VendorRelease(dpy : longint) : longint;
function DisplayString(dpy : longint) : longint;
function DefaultDepth(dpy,scr : longint) : longint;
function DefaultColormap(dpy,scr : longint) : longint;
function BitmapUnit(dpy : longint) : longint;
function BitmapBitOrder(dpy : longint) : longint;
function BitmapPad(dpy : longint) : longint;
function ImageByteOrder(dpy : longint) : longint;
function NextRequest(dpy : longint) : longint;
function LastKnownRequestProcessed(dpy : longint) : longint;

function ScreenOfDisplay(dpy,scr : longint) : longint;
function DefaultScreenOfDisplay(dpy : longint) : longint;
function DisplayOfScreen(s : longint) : longint;
function RootWindowOfScreen(s : longint) : longint;
function BlackPixelOfScreen(s : longint) : longint;
function WhitePixelOfScreen(s : longint) : longint;
function DefaultColormapOfScreen(s : longint) : longint;
function DefaultDepthOfScreen(s : longint) : longint;
function DefaultGCOfScreen(s : longint) : longint;
function DefaultVisualOfScreen(s : longint) : longint;
function WidthOfScreen(s : longint) : longint;
function HeightOfScreen(s : longint) : longint;
function WidthMMOfScreen(s : longint) : longint;
function HeightMMOfScreen(s : longint) : longint;
function PlanesOfScreen(s : longint) : longint;
function CellsOfScreen(s : longint) : longint;
function MinCmapsOfScreen(s : longint) : longint;
function MaxCmapsOfScreen(s : longint) : longint;
function DoesSaveUnders(s : longint) : longint;
function DoesBackingStore(s : longint) : longint;
function EventMaskOfScreen(s : longint) : longint;

type
  PPXExtData = ^PXExtData;
  PXExtData = ^TXExtData;
  TXExtData = record
      number : longint;
      next : PXExtData;
      free_private : function (extension:PXExtData):longint;cdecl;
      private_data : TXPointer;
    end;

  TXExtCodes = record
      extension : longint;
      major_opcode : longint;
      first_event : longint;
      first_error : longint;
    end;
  PXExtCodes = ^TXExtCodes;

  TXPixmapFormatValues = record
      depth : longint;
      bits_per_pixel : longint;
      scanline_pad : longint;
    end;
  PXPixmapFormatValues = ^TXPixmapFormatValues;

  TXGCValues = record
      _function : longint;
      plane_mask : dword;
      foreground : dword;
      background : dword;
      line_width : longint;
      line_style : longint;
      cap_style : longint;
      join_style : longint;
      fill_style : longint;
      fill_rule : longint;
      arc_mode : longint;
      tile : TPixmap;
      stipple : TPixmap;
      ts_x_origin : longint;
      ts_y_origin : longint;
      font : TFont;
      subwindow_mode : longint;
      graphics_exposures : Boolean;
      clip_x_origin : longint;
      clip_y_origin : longint;
      clip_mask : TPixmap;
      dash_offset : longint;
      dashes : char;
    end;
  PXGCValues = ^TXGCValues;

type
  PXGC = type Pointer;

  TGC = PXGC;
  PGC = ^TGC;

  TVisual = record
      ext_data : PXExtData;
      visualid : TVisualID;
      _class : longint;
      red_mask : dword;
      green_mask : dword;
      blue_mask : dword;
      bits_per_rgb : longint;
      map_entries : longint;
    end;
  PVisual = ^TVisual;

  TDepth = record
      depth : longint;
      nvisuals : longint;
      visuals : PVisual;
    end;
  PDepth = ^TDepth;

  PXDisplay = type Pointer;

  TScreen = record
      ext_data : PXExtData;
      display : PXDisplay;
      root : TWindow;
      width : longint;
      height : longint;
      mwidth : longint;
      mheight : longint;
      ndepths : longint;
      depths : PDepth;
      root_depth : longint;
      root_visual : PVisual;
      default_gc : TGC;
      cmap : TColormap;
      white_pixel : dword;
      black_pixel : dword;
      max_maps : longint;
      min_maps : longint;
      backing_store : longint;
      save_unders : Boolean;
      root_input_mask : longint;
    end;
  PScreen = ^TScreen;

  TScreenFormat = record
      ext_data : PXExtData;
      depth : longint;
      bits_per_pixel : longint;
      scanline_pad : longint;
    end;
  PScreenFormat = ^TScreenFormat;

  TXSetWindowAttributes = record
      background_pixmap : TPixmap;
      background_pixel : dword;
      border_pixmap : TPixmap;
      border_pixel : dword;
      bit_gravity : longint;
      win_gravity : longint;
      backing_store : longint;
      backing_planes : dword;
      backing_pixel : dword;
      save_under : Boolean;
      event_mask : longint;
      do_not_propagate_mask : longint;
      override_redirect :Boolean;
      colormap : TColormap;
      cursor : TCursor;
    end;
  PXSetWindowAttributes = ^TXSetWindowAttributes;

  TXWindowAttributes = record
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      border_width : longint;
      depth : longint;
      visual : PVisual;
      root : TWindow;
      _class : longint;
      bit_gravity : longint;
      win_gravity : longint;
      backing_store : longint;
      backing_planes : dword;
      backing_pixel : dword;
      save_under : Boolean;
      colormap : TColormap;
      map_installed : Boolean;
      map_state : longint;
      all_event_masks : longint;
      your_event_mask : longint;
      do_not_propagate_mask : longint;
      override_redirect : Boolean;
      screen : PScreen;
    end;
  PXWindowAttributes = ^TXWindowAttributes;

  TXHostAddress = record
      family : longint;
      length : longint;
      address : Pchar;
    end;
  PXHostAddress = ^TXHostAddress;

  TXServerInterpretedAddress = record
      typelength : longint;
      valuelength : longint;
      _type : Pchar;
      value : Pchar;
    end;
  PXServerInterpretedAddress = ^TXServerInterpretedAddress;

  PXImage = ^TXImage;
  TXImage = record
      width : longint;
      height : longint;
      xoffset : longint;
      format : longint;
      data : Pchar;
      byte_order : longint;
      bitmap_unit : longint;
      bitmap_bit_order : longint;
      bitmap_pad : longint;
      depth : longint;
      bytes_per_line : longint;
      bits_per_pixel : longint;
      red_mask : dword;
      green_mask : dword;
      blue_mask : dword;
      obdata : TXPointer;
      f : record
          create_image : function (para1:PXDisplay; para2:PVisual; para3:dword; para4:longint; para5:longint; 
                       para6:Pchar; para7:dword; para8:dword; para9:longint; para10:longint):PXImage;cdecl;
          destroy_image : function (para1:PXImage):longint;cdecl;
          get_pixel : function (para1:PXImage; para2:longint; para3:longint):dword;cdecl;
          put_pixel : function (para1:PXImage; para2:longint; para3:longint; para4:dword):longint;cdecl;
          sub_image : function (para1:PXImage; para2:longint; para3:longint; para4:dword; para5:dword):PXImage;cdecl;
          add_pixel : function (para1:PXImage; para2:longint):longint;cdecl;
        end;
    end;

  TXWindowChanges = record
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      border_width : longint;
      sibling : TWindow;
      stack_mode : longint;
    end;
  PXWindowChanges = ^TXWindowChanges;

  TXColor = record
      pixel : dword;
      red : word;
      green : word;
      blue : word;
      flags : char;
      pad : char;
    end;
  PXColor = ^TXColor;

  TXSegment = record
      x1 : smallint;
      y1 : smallint;
      x2 : smallint;
      y2 : smallint;
    end;
  PXSegment = ^TXSegment;

  TXPoint = record
      x : smallint;
      y : smallint;
    end;
  PXPoint = ^TXPoint;

  TXRectangle = record
      x : smallint;
      y : smallint;
      width : word;
      height : word;
    end;
  PXRectangle = ^TXRectangle;

  TXArc = record
      x : smallint;
      y : smallint;
      width : word;
      height : word;
      angle1 : smallint;
      angle2 : smallint;
    end;
  PXArc = ^TXArc;

  TXKeyboardControl = record
      key_click_percent : longint;
      bell_percent : longint;
      bell_pitch : longint;
      bell_duration : longint;
      led : longint;
      led_mode : longint;
      key : longint;
      auto_repeat_mode : longint;
    end;
  PXKeyboardControl = ^TXKeyboardControl;

  TXKeyboardState = record
      key_click_percent : longint;
      bell_percent : longint;
      bell_pitch : dword;
      bell_duration : dword;
      led_mask : dword;
      global_auto_repeat : longint;
      auto_repeats : array[0..31] of char;
    end;
  PXKeyboardState = ^TXKeyboardState;

  TXTimeCoord = record
      time : TTime;
      x : smallint;
      y : smallint;
    end;
  PXTimeCoord = ^TXTimeCoord;

  TXModifierKeymap = record
      max_keypermod : longint;
      modifiermap : PKeyCode;
    end;
  PXModifierKeymap = ^TXModifierKeymap;

type
  PXPrivate = type Pointer;
  PXrmHashBucketRec = type Pointer;

type
  PDisplay = type Pointer;

  TXPrivDisplay = PXDisplay;
  PXPrivDisplay = ^TXPrivDisplay;
type
  TXKeyEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      root : TWindow;
      subwindow : TWindow;
      time : TTime;
      x : longint;
      y : longint;
      x_root : longint;
      y_root : longint;
      state : dword;
      keycode : dword;
      same_screen : Boolean;
    end;
  PXKeyEvent = ^TXKeyEvent;

  PXKeyPressedEvent = ^TXKeyPressedEvent;
  TXKeyPressedEvent = TXKeyEvent;

  PXKeyReleasedEvent = ^TXKeyReleasedEvent;
  TXKeyReleasedEvent = TXKeyEvent;

  TXButtonEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      root : TWindow;
      subwindow : TWindow;
      time : TTime;
      x : longint;
      y : longint;
      x_root : longint;
      y_root : longint;
      state : dword;
      button : dword;
      same_screen : Boolean;
    end;
  PXButtonEvent = ^TXButtonEvent;

  PXButtonPressedEvent = ^TXButtonPressedEvent;
  TXButtonPressedEvent = TXButtonEvent;

  PXButtonReleasedEvent = ^TXButtonReleasedEvent;
  TXButtonReleasedEvent = TXButtonEvent;

  TXMotionEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      root : TWindow;
      subwindow : TWindow;
      time : TTime;
      x : longint;
      y : longint;
      x_root : longint;
      y_root : longint;
      state : dword;
      is_hint : char;
      same_screen : Boolean;
    end;
  PXMotionEvent = ^TXMotionEvent;

  PXPointerMovedEvent = ^TXPointerMovedEvent;
  TXPointerMovedEvent = TXMotionEvent;

  TXCrossingEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      root : TWindow;
      subwindow : TWindow;
      time : TTime;
      x : longint;
      y : longint;
      x_root : longint;
      y_root : longint;
      mode : longint;
      detail : longint;
      same_screen : Boolean;
      focus : Boolean;
      state : dword;
    end;
  PXCrossingEvent = ^TXCrossingEvent;

  PXEnterWindowEvent = ^TXEnterWindowEvent;
  TXEnterWindowEvent = TXCrossingEvent;

  PXLeaveWindowEvent = ^TXLeaveWindowEvent;
  TXLeaveWindowEvent = TXCrossingEvent;

  TXFocusChangeEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      mode : longint;
      detail : longint;
    end;
  PXFocusChangeEvent = ^TXFocusChangeEvent;

  PXFocusInEvent = ^TXFocusInEvent;
  TXFocusInEvent = TXFocusChangeEvent;

  PXFocusOutEvent = ^TXFocusOutEvent;
  TXFocusOutEvent = TXFocusChangeEvent;

  TXKeymapEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      key_vector : array[0..31] of char;
    end;
  PXKeymapEvent = ^TXKeymapEvent;

  TXExposeEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      count : longint;
    end;
  PXExposeEvent = ^TXExposeEvent;

  TXGraphicsExposeEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      drawable : TDrawable;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      count : longint;
      major_code : longint;
      minor_code : longint;
    end;
  PXGraphicsExposeEvent = ^TXGraphicsExposeEvent;

  TXNoExposeEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      drawable : TDrawable;
      major_code : longint;
      minor_code : longint;
    end;
  PXNoExposeEvent = ^TXNoExposeEvent;

  TXVisibilityEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      state : longint;
    end;
  PXVisibilityEvent = ^TXVisibilityEvent;

  TXCreateWindowEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      parent : TWindow;
      window : TWindow;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      border_width : longint;
      override_redirect : Boolean;
    end;
  PXCreateWindowEvent = ^TXCreateWindowEvent;

  TXDestroyWindowEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
    end;
  PXDestroyWindowEvent = ^TXDestroyWindowEvent;

  TXUnmapEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      from_configure : Boolean;
    end;
  PXUnmapEvent = ^TXUnmapEvent;

  TXMapEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      override_redirect : Boolean;
    end;
  PXMapEvent = ^TXMapEvent;

  TXMapRequestEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      parent : TWindow;
      window : TWindow;
    end;
  PXMapRequestEvent = ^TXMapRequestEvent;

  TXReparentEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      parent : TWindow;
      x : longint;
      y : longint;
      override_redirect : Boolean;
    end;
  PXReparentEvent = ^TXReparentEvent;

  TXConfigureEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      border_width : longint;
      above : TWindow;
      override_redirect : Boolean;
    end;
  PXConfigureEvent = ^TXConfigureEvent;

  TXGravityEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      x : longint;
      y : longint;
    end;
  PXGravityEvent = ^TXGravityEvent;

  TXResizeRequestEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      width : longint;
      height : longint;
    end;
  PXResizeRequestEvent = ^TXResizeRequestEvent;

  TXConfigureRequestEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      parent : TWindow;
      window : TWindow;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      border_width : longint;
      above : TWindow;
      detail : longint;
      value_mask : dword;
    end;
  PXConfigureRequestEvent = ^TXConfigureRequestEvent;

  TXCirculateEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      event : TWindow;
      window : TWindow;
      place : longint;
    end;
  PXCirculateEvent = ^TXCirculateEvent;

  TXCirculateRequestEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      parent : TWindow;
      window : TWindow;
      place : longint;
    end;
  PXCirculateRequestEvent = ^TXCirculateRequestEvent;

  TXPropertyEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      atom : TAtom;
      time : TTime;
      state : longint;
    end;
  PXPropertyEvent = ^TXPropertyEvent;

  TXSelectionClearEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      selection : TAtom;
      time : TTime;
    end;
  PXSelectionClearEvent = ^TXSelectionClearEvent;

  TXSelectionRequestEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      owner : TWindow;
      requestor : TWindow;
      selection : TAtom;
      target : TAtom;
      _property : TAtom;
      time : TTime;
    end;
  PXSelectionRequestEvent = ^TXSelectionRequestEvent;

  TXSelectionEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      requestor : TWindow;
      selection : TAtom;
      target : TAtom;
      _property : TAtom;
      time : TTime;
    end;
  PXSelectionEvent = ^TXSelectionEvent;

  TXColormapEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      colormap : TColormap;
      _new : Boolean;
      state : longint;
    end;
  PXColormapEvent = ^TXColormapEvent;

  TXClientMessageEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      message_type : TAtom;
      format : longint;
      data : record
          case longint of
            0 : ( b : array[0..19] of char );
            1 : ( s : array[0..9] of smallint );
            2 : ( l : array[0..4] of longint );
          end;
    end;
  PXClientMessageEvent = ^TXClientMessageEvent;

  TXMappingEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
      request : longint;
      first_keycode : longint;
      count : longint;
    end;
  PXMappingEvent = ^TXMappingEvent;

  TXErrorEvent = record
      _type : longint;
      display : PDisplay;
      resourceid : TXID;
      serial : dword;
      error_code : byte;
      request_code : byte;
      minor_code : byte;
    end;
  PXErrorEvent = ^TXErrorEvent;

  TXAnyEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      window : TWindow;
    end;
  PXAnyEvent = ^TXAnyEvent;

  TXGenericEvent = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      extension : longint;
      evtype : longint;
    end;
  PXGenericEvent = ^TXGenericEvent;

  TXGenericEventCookie = record
      _type : longint;
      serial : dword;
      send_event : Boolean;
      display : PDisplay;
      extension : longint;
      evtype : longint;
      cookie : dword;
      data : pointer;
    end;
  PXGenericEventCookie = ^TXGenericEventCookie;

  TXEvent = record
      case longint of
        0 : ( _type : longint );
        1 : ( xany : TXAnyEvent );
        2 : ( xkey : TXKeyEvent );
        3 : ( xbutton : TXButtonEvent );
        4 : ( xmotion : TXMotionEvent );
        5 : ( xcrossing : TXCrossingEvent );
        6 : ( xfocus : TXFocusChangeEvent );
        7 : ( xexpose : TXExposeEvent );
        8 : ( xgraphicsexpose : TXGraphicsExposeEvent );
        9 : ( xnoexpose : TXNoExposeEvent );
        10 : ( xvisibility : TXVisibilityEvent );
        11 : ( xcreatewindow : TXCreateWindowEvent );
        12 : ( xdestroywindow : TXDestroyWindowEvent );
        13 : ( xunmap : TXUnmapEvent );
        14 : ( xmap : TXMapEvent );
        15 : ( xmaprequest : TXMapRequestEvent );
        16 : ( xreparent : TXReparentEvent );
        17 : ( xconfigure : TXConfigureEvent );
        18 : ( xgravity : TXGravityEvent );
        19 : ( xresizerequest : TXResizeRequestEvent );
        20 : ( xconfigurerequest : TXConfigureRequestEvent );
        21 : ( xcirculate : TXCirculateEvent );
        22 : ( xcirculaterequest : TXCirculateRequestEvent );
        23 : ( xproperty : TXPropertyEvent );
        24 : ( xselectionclear : TXSelectionClearEvent );
        25 : ( xselectionrequest : TXSelectionRequestEvent );
        26 : ( xselection : TXSelectionEvent );
        27 : ( xcolormap : TXColormapEvent );
        28 : ( xclient : TXClientMessageEvent );
        29 : ( xmapping : TXMappingEvent );
        30 : ( xerror : TXErrorEvent );
        31 : ( xkeymap : TXKeymapEvent );
        32 : ( xgeneric : TXGenericEvent );
        33 : ( xcookie : TXGenericEventCookie );
        34 : ( pad : array[0..23] of longint );
      end;
  PXEvent = ^TXEvent;

  function XAllocID(dpy : longint) : longint;
type
  TXCharStruct = record
      lbearing : smallint;
      rbearing : smallint;
      width : smallint;
      ascent : smallint;
      descent : smallint;
      attributes : word;
    end;
  PXCharStruct = ^TXCharStruct;

  TXFontProp = record
      name : TAtom;
      card32 : dword;
    end;
  PXFontProp = ^TXFontProp;

  TXFontStruct = record
      ext_data : PXExtData;
      fid : TFont;
      direction : dword;
      min_char_or_byte2 : dword;
      max_char_or_byte2 : dword;
      min_byte1 : dword;
      max_byte1 : dword;
      all_chars_exist : Boolean;
      default_char : dword;
      n_properties : longint;
      properties : PXFontProp;
      min_bounds : TXCharStruct;
      max_bounds : TXCharStruct;
      per_char : PXCharStruct;
      ascent : longint;
      descent : longint;
    end;
  PXFontStruct = ^TXFontStruct;
  PPXFontStruct = ^PXFontStruct;

  TXTextItem = record
      chars : Pchar;
      nchars : longint;
      delta : longint;
      font : TFont;
    end;
  PXTextItem = ^TXTextItem;

  TXChar2b = record
      byte1 : byte;
      byte2 : byte;
    end;
  PXChar2b = ^TXChar2b;

  TXTextItem16 = record
      chars : PXChar2b;
      nchars : longint;
      delta : longint;
      font : TFont;
    end;
  PXTextItem16 = ^TXTextItem16;

  TXEDataObject = record
      case longint of
        0 : ( display : PDisplay );
        1 : ( gc : TGC );
        2 : ( visual : PVisual );
        3 : ( screen : PScreen );
        4 : ( pixmap_format : PScreenFormat );
        5 : ( font : PXFontStruct );
      end;
  PXEDataObject = ^TXEDataObject;

  TXFontSetExtents = record
      max_ink_extent : TXRectangle;
      max_logical_extent : TXRectangle;
    end;
  PXFontSetExtents = ^TXFontSetExtents;

  PXOM = type Pointer;
  PXOC = type Pointer;

  TXFontSet = PXOC;
  PXFontSet = ^TXFontSet;

  TXmbTextItem = record
      chars : Pchar;
      nchars : longint;
      delta : longint;
      font_set : TXFontSet;
    end;
  PXmbTextItem = ^TXmbTextItem;

  TXwcTextItem = record
      chars : Pwchar_t;
      nchars : longint;
      delta : longint;
      font_set : TXFontSet;
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
      charset_count : longint;
      charset_list : ^Pchar;
    end;
  PXOMCharSetList = ^TXOMCharSetList;
type
  PXOrientation = ^TXOrientation;
  TXOrientation =  Longint;
  Const
    XOMOrientation_LTR_TTB = 0;
    XOMOrientation_RTL_TTB = 1;
    XOMOrientation_TTB_LTR = 2;
    XOMOrientation_TTB_RTL = 3;
    XOMOrientation_Context = 4;
type
  TXOMOrientation = record
      num_orientation : longint;
      orientation : PXOrientation;
    end;
  PXOMOrientation = ^TXOMOrientation;

  TXOMFontInfo = record
      num_font : longint;
      font_struct_list : ^PXFontStruct;
      font_name_list : ^Pchar;
    end;
  PXOMFontInfo = ^TXOMFontInfo;

  TXIM = type Pointer;
  TXIC = type Pointer;

 TXIMProc = procedure (para1:TXIM; para2:TXPointer; para3:TXPointer);cdecl;
  TXICProc = function (para1:TXIC; para2:TXPointer; para3:TXPointer):Boolean;cdecl;
  TXIDProc = procedure (para1:PDisplay; para2:TXPointer; para3:TXPointer);cdecl;

  PXIMStyle = ^TXIMStyle;
  TXIMStyle = dword;

  TXIMStyles = record
      count_styles : word;
      supported_styles : PXIMStyle;
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
      client_data : TXPointer;
      callback : TXIMProc;
    end;
  PXIMCallback = ^TXIMCallback;

  TXICCallback = record
      client_data : TXPointer;
      callback : TXICProc;
    end;
  PXICCallback = ^TXICCallback;

  PXIMFeedback = ^TXIMFeedback;
  TXIMFeedback = dword;

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
      length : word;
      feedback : PXIMFeedback;
      encoding_is_wchar : Boolean;
      _string : record
          case longint of
            0 : ( multi_byte : Pchar );
            1 : ( wide_char : Pwchar_t );
          end;
    end;
  PXIMText = ^TXIMText;

  PXIMPreeditState = ^TXIMPreeditState;
  TXIMPreeditState = dword;

const
  XIMPreeditUnKnown = 0;  
  XIMPreeditEnable = 1;  
  XIMPreeditDisable = 1 shl 1;  
type
  TXIMPreeditStateNotifyCallbackStruct = record
      state : TXIMPreeditState;
    end;
  PXIMPreeditStateNotifyCallbackStruct = ^TXIMPreeditStateNotifyCallbackStruct;

  PXIMResetState = ^TXIMResetState;
  TXIMResetState = dword;

const
  XIMInitialState = 1;  
  XIMPreserveState = 1 shl 1;  
type
  PXIMStringConversionFeedback = ^TXIMStringConversionFeedback;
  TXIMStringConversionFeedback = dword;

const
  XIMStringConversionLeftEdge = $00000001;  
  XIMStringConversionRightEdge = $00000002;  
  XIMStringConversionTopEdge = $00000004;  
  XIMStringConversionBottomEdge = $00000008;  
  XIMStringConversionConcealed = $00000010;  
  XIMStringConversionWrapped = $00000020;  
type
  TXIMStringConversionText = record
      length : word;
      feedback : PXIMStringConversionFeedback;
      encoding_is_wchar : Boolean;
      _string : record
          case longint of
            0 : ( mbs : Pchar );
            1 : ( wcs : Pwchar_t );
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
  TXIMCaretDirection =  Longint;
  Const
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
      position : TXIMStringConversionPosition;
      direction : TXIMCaretDirection;
      operation : TXIMStringConversionOperation;
      factor : word;
      text : PXIMStringConversionText;
    end;
  PXIMStringConversionCallbackStruct = ^TXIMStringConversionCallbackStruct;

  TXIMPreeditDrawCallbackStruct = record
      caret : longint;
      chg_first : longint;
      chg_length : longint;
      text : PXIMText;
    end;
  PXIMPreeditDrawCallbackStruct = ^TXIMPreeditDrawCallbackStruct;
type
  PXIMCaretStyle = ^TXIMCaretStyle;
  TXIMCaretStyle =  Longint;
  Const
    XIMIsInvisible = 0;
    XIMIsPrimary = 1;
    XIMIsSecondary = 2;
type
  TXIMPreeditCaretCallbackStruct = record
      position : longint;
      direction : TXIMCaretDirection;
      style : TXIMCaretStyle;
    end;
  PXIMPreeditCaretCallbackStruct = ^TXIMPreeditCaretCallbackStruct;
type
  PXIMStatusDataType = ^TXIMStatusDataType;
  TXIMStatusDataType =  Longint;
  Const
    XIMTextType = 0;
    XIMBitmapType = 1;

type
  TXIMStatusDrawCallbackStruct = record
      _type : TXIMStatusDataType;
      data : record
          case longint of
            0 : ( text : PXIMText );
            1 : ( bitmap : TPixmap );
          end;
    end;
  PXIMStatusDrawCallbackStruct = ^TXIMStatusDrawCallbackStruct;

  TXIMHotKeyTrigger = record
      keysym : TKeySym;
      modifier : longint;
      modifier_mask : longint;
    end;
  PXIMHotKeyTrigger = ^TXIMHotKeyTrigger;

  TXIMHotKeyTriggers = record
      num_hot_key : longint;
      key : PXIMHotKeyTrigger;
    end;
  PXIMHotKeyTriggers = ^TXIMHotKeyTriggers;

  PXIMHotKeyState = ^TXIMHotKeyState;
  TXIMHotKeyState = dword;

const
  XIMHotKeyStateON = $0001;  
  XIMHotKeyStateOFF = $0002;  
type
  PXIMValuesList = ^TXIMValuesList;
  TXIMValuesList = record
      count_values : word;
      supported_values : ^Pchar;
    end;
  var
    _Xdebug : longint;cvar;external libx;

function XLoadQueryFont(para1:PDisplay; para2:Pchar):PXFontStruct;cdecl;external libx;
function XQueryFont(para1:PDisplay; para2:TXID):PXFontStruct;cdecl;external libx;
function XGetMotionEvents(para1:PDisplay; para2:TWindow; para3:TTime; para4:TTime; para5:Plongint):PXTimeCoord;cdecl;external libx;
function XDeleteModifiermapEntry(para1:PXModifierKeymap; para2:TKeyCode; para3:longint):PXModifierKeymap;cdecl;external libx;
function XGetModifierMapping(para1:PDisplay):PXModifierKeymap;cdecl;external libx;
function XInsertModifiermapEntry(para1:PXModifierKeymap; para2:TKeyCode; para3:longint):PXModifierKeymap;cdecl;external libx;
function XNewModifiermap(para1:longint):PXModifierKeymap;cdecl;external libx;
function XCreateImage(para1:PDisplay; para2:PVisual; para3:dword; para4:longint; para5:longint;
           para6:Pchar; para7:dword; para8:dword; para9:longint; para10:longint):PXImage;cdecl;external libx;
function XInitImage(para1:PXImage):TStatus;cdecl;external libx;
function XGetImage(para1:PDisplay; para2:TDrawable; para3:longint; para4:longint; para5:dword;
           para6:dword; para7:dword; para8:longint):PXImage;cdecl;external libx;
function XGetSubImage(para1:PDisplay; para2:TDrawable; para3:longint; para4:longint; para5:dword;
           para6:dword; para7:dword; para8:longint; para9:PXImage; para10:longint; 
           para11:longint):PXImage;cdecl;external libx;
function XOpenDisplay(para1:Pchar):PDisplay;cdecl;external libx;
procedure XrmInitialize;cdecl;external libx;
function XFetchBytes(para1:PDisplay; para2:Plongint):Pchar;cdecl;external libx;
function XFetchBuffer(para1:PDisplay; para2:Plongint; para3:longint):Pchar;cdecl;external libx;
function XGetAtomName(para1:PDisplay; para2:TAtom):Pchar;cdecl;external libx;
function XGetAtomNames(para1:PDisplay; para2:PAtom; para3:longint; para4:PPchar):TStatus;cdecl;external libx;
function XGetDefault(para1:PDisplay; para2:Pchar; para3:Pchar):Pchar;cdecl;external libx;
function XDisplayName(para1:Pchar):Pchar;cdecl;external libx;
function XKeysymToString(para1:TKeySym):Pchar;cdecl;external libx;

type
    Tfuncdisp    = function(display:PDisplay):Integer;cdecl;

function XSynchronize(para1:PDisplay; para2:Boolean):Tfuncdisp;cdecl;external libx;
function XSetAfterFunction(para1:PDisplay; para2:Tfuncdisp):Tfuncdisp;cdecl;external libx;

function XInternAtom(para1:PDisplay; para2:Pchar; para3:Boolean):TAtom;cdecl;external libx;
function XInternAtoms(para1:PDisplay; para2:PPchar; para3:longint; para4:Boolean; para5:PAtom):TStatus;cdecl;external libx;
function XCopyColormapAndFree(para1:PDisplay; para2:TColormap):TColormap;cdecl;external libx;
function XCreateColormap(para1:PDisplay; para2:TWindow; para3:PVisual; para4:longint):TColormap;cdecl;external libx;
function XCreatePixmapCursor(para1:PDisplay; para2:TPixmap; para3:TPixmap; para4:PXColor; para5:PXColor;
           para6:dword; para7:dword):TCursor;cdecl;external libx;
function XCreateGlyphCursor(para1:PDisplay; para2:TFont; para3:TFont; para4:dword; para5:dword;
           para6:PXColor; para7:PXColor):TCursor;cdecl;external libx;
function XCreateFontCursor(para1:PDisplay; para2:dword):TCursor;cdecl;external libx;
function XLoadFont(para1:PDisplay; para2:Pchar):TFont;cdecl;external libx;
function XCreateGC(para1:PDisplay; para2:TDrawable; para3:dword; para4:PXGCValues):TGC;cdecl;external libx;
function XGContextFromGC(para1:TGC):TGContext;cdecl;external libx;
procedure XFlushGC(para1:PDisplay; para2:TGC);cdecl;external libx;
function XCreatePixmap(para1:PDisplay; para2:TDrawable; para3:dword; para4:dword; para5:dword):TPixmap;cdecl;external libx;
function XCreateBitmapFromData(para1:PDisplay; para2:TDrawable; para3:Pchar; para4:dword; para5:dword):TPixmap;cdecl;external libx;
function XCreatePixmapFromBitmapData(para1:PDisplay; para2:TDrawable; para3:Pchar; para4:dword; para5:dword;
           para6:dword; para7:dword; para8:dword):TPixmap;cdecl;external libx;
function XCreateSimpleWindow(para1:PDisplay; para2:TWindow; para3:longint; para4:longint; para5:dword;
           para6:dword; para7:dword; para8:dword; para9:dword):TWindow;cdecl;external libx;
function XGetSelectionOwner(para1:PDisplay; para2:TAtom):TWindow;cdecl;external libx;
function XCreateWindow(para1:PDisplay; para2:TWindow; para3:longint; para4:longint; para5:dword;
           para6:dword; para7:dword; para8:longint; para9:dword; para10:PVisual; 
           para11:dword; para12:PXSetWindowAttributes):TWindow;cdecl;external libx;
function XListInstalledColormaps(para1:PDisplay; para2:TWindow; para3:Plongint):PColormap;cdecl;external libx;
function XListFonts(para1:PDisplay; para2:Pchar; para3:longint; para4:Plongint):PPchar;cdecl;external libx;
function XListFontsWithInfo(para1:PDisplay; para2:Pchar; para3:longint; para4:Plongint; para5:PPXFontStruct):PPchar;cdecl;external libx;
function XGetFontPath(para1:PDisplay; para2:Plongint):PPchar;cdecl;external libx;
function XListExtensions(para1:PDisplay; para2:Plongint):PPchar;cdecl;external libx;
function XListProperties(para1:PDisplay; para2:TWindow; para3:Plongint):PAtom;cdecl;external libx;
function XListHosts(para1:PDisplay; para2:Plongint; para3:PBoolean):PXHostAddress;cdecl;external libx;
function XKeycodeToKeysym(para1:PDisplay; para2:TKeyCode; para3:longint):TKeySym;cdecl;external libx;
function XLookupKeysym(para1:PXKeyEvent; para2:longint):TKeySym;cdecl;external libx;
function XGetKeyboardMapping(para1:PDisplay; para2:TKeyCode; para3:longint; para4:Plongint):PKeySym;cdecl;external libx;
function XStringToKeysym(para1:Pchar):TKeySym;cdecl;external libx;
function XMaxRequestSize(para1:PDisplay):longint;cdecl;external libx;
function XExtendedMaxRequestSize(para1:PDisplay):longint;cdecl;external libx;
function XResourceManagerString(para1:PDisplay):Pchar;cdecl;external libx;
function XScreenResourceString(para1:PScreen):Pchar;cdecl;external libx;
function XDisplayMotionBufferSize(para1:PDisplay):dword;cdecl;external libx;
function XVisualIDFromVisual(para1:PVisual):TVisualID;cdecl;external libx;
function XInitThreads:TStatus;cdecl;external libx;
function XFreeThreads:TStatus;cdecl;external libx;
procedure XLockDisplay(para1:PDisplay);cdecl;external libx;
procedure XUnlockDisplay(para1:PDisplay);cdecl;external libx;
function XInitExtension(para1:PDisplay; para2:Pchar):PXExtCodes;cdecl;external libx;
function XAddExtension(para1:PDisplay):PXExtCodes;cdecl;external libx;
function XFindOnExtensionList(para1:PPXExtData; para2:longint):PXExtData;cdecl;external libx;
function XEHeadOfExtensionList(para1:TXEDataObject):PPXExtData;cdecl;external libx;
function XRootWindow(para1:PDisplay; para2:longint):TWindow;cdecl;external libx;
function XDefaultRootWindow(para1:PDisplay):TWindow;cdecl;external libx;
function XRootWindowOfScreen(para1:PScreen):TWindow;cdecl;external libx;
function XDefaultVisual(para1:PDisplay; para2:longint):PVisual;cdecl;external libx;
function XDefaultVisualOfScreen(para1:PScreen):PVisual;cdecl;external libx;
function XDefaultGC(para1:PDisplay; para2:longint):TGC;cdecl;external libx;
function XDefaultGCOfScreen(para1:PScreen):TGC;cdecl;external libx;
function XBlackPixel(para1:PDisplay; para2:longint):dword;cdecl;external libx;
function XWhitePixel(para1:PDisplay; para2:longint):dword;cdecl;external libx;
function XAllPlanes:dword;cdecl;external libx;
function XBlackPixelOfScreen(para1:PScreen):dword;cdecl;external libx;
function XWhitePixelOfScreen(para1:PScreen):dword;cdecl;external libx;
function XNextRequest(para1:PDisplay):dword;cdecl;external libx;
function XLastKnownRequestProcessed(para1:PDisplay):dword;cdecl;external libx;
function XServerVendor(para1:PDisplay):Pchar;cdecl;external libx;
function XDisplayString(para1:PDisplay):Pchar;cdecl;external libx;
function XDefaultColormap(para1:PDisplay; para2:longint):TColormap;cdecl;external libx;
function XDefaultColormapOfScreen(para1:PScreen):TColormap;cdecl;external libx;
function XDisplayOfScreen(para1:PScreen):PDisplay;cdecl;external libx;
function XScreenOfDisplay(para1:PDisplay; para2:longint):PScreen;cdecl;external libx;
function XDefaultScreenOfDisplay(para1:PDisplay):PScreen;cdecl;external libx;
function XEventMaskOfScreen(para1:PScreen):longint;cdecl;external libx;
function XScreenNumberOfScreen(para1:PScreen):longint;cdecl;external libx;
type
  TXErrorHandler = function (para1:PDisplay; para2:PXErrorEvent):longint;cdecl;

function XSetErrorHandler(para1:TXErrorHandler):TXErrorHandler;cdecl;external libx;
type
  TXIOErrorHandler = function (para1:PDisplay):longint;cdecl;

function XSetIOErrorHandler(para1:TXIOErrorHandler):TXIOErrorHandler;cdecl;external libx;
type
  TXIOErrorExitHandler = procedure (para1:PDisplay; para2:pointer);cdecl;

procedure XSetIOErrorExitHandler(para1:PDisplay; para2:TXIOErrorExitHandler; para3:pointer);cdecl;external libx;
function XListPixmapFormats(para1:PDisplay; para2:Plongint):PXPixmapFormatValues;cdecl;external libx;
function XListDepths(para1:PDisplay; para2:longint; para3:Plongint):Plongint;cdecl;external libx;
function XReconfigureWMWindow(para1:PDisplay; para2:TWindow; para3:longint; para4:dword; para5:PXWindowChanges):TStatus;cdecl;external libx;
function XGetWMProtocols(para1:PDisplay; para2:TWindow; para3:PPAtom; para4:Plongint):TStatus;cdecl;external libx;
function XSetWMProtocols(para1:PDisplay; para2:TWindow; para3:PAtom; para4:longint):TStatus;cdecl;external libx;
function XIconifyWindow(para1:PDisplay; para2:TWindow; para3:longint):TStatus;cdecl;external libx;
function XWithdrawWindow(para1:PDisplay; para2:TWindow; para3:longint):TStatus;cdecl;external libx;
function XGetCommand(para1:PDisplay; para2:TWindow; para3:PPPchar; para4:Plongint):TStatus;cdecl;external libx;
function XGetWMColormapWindows(para1:PDisplay; para2:TWindow; para3:PPWindow; para4:Plongint):TStatus;cdecl;external libx;
function XSetWMColormapWindows(para1:PDisplay; para2:TWindow; para3:PWindow; para4:longint):TStatus;cdecl;external libx;
procedure XFreeStringList(para1:PPchar);cdecl;external libx;
function XSetTransientForHint(para1:PDisplay; para2:TWindow; para3:TWindow):longint;cdecl;external libx;
function XActivateScreenSaver(para1:PDisplay):longint;cdecl;external libx;
function XAddHost(para1:PDisplay; para2:PXHostAddress):longint;cdecl;external libx;
function XAddHosts(para1:PDisplay; para2:PXHostAddress; para3:longint):longint;cdecl;external libx;
function XAddToExtensionList(para1:PPXExtData; para2:PXExtData):longint;cdecl;external libx;
function XAddToSaveSet(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
function XAllocColor(para1:PDisplay; para2:TColormap; para3:PXColor):TStatus;cdecl;external libx;
function XAllocColorCells(para1:PDisplay; para2:TColormap; para3:Boolean; para4:Pdword; para5:dword;
           para6:Pdword; para7:dword):TStatus;cdecl;external libx;
function XAllocColorPlanes(para1:PDisplay; para2:TColormap; para3:Boolean; para4:Pdword; para5:longint;
           para6:longint; para7:longint; para8:longint; para9:Pdword; para10:Pdword; 
           para11:Pdword):TStatus;cdecl;external libx;
function XAllocNamedColor(para1:PDisplay; para2:TColormap; para3:Pchar; para4:PXColor; para5:PXColor):TStatus;cdecl;external libx;
function XAllowEvents(para1:PDisplay; para2:longint; para3:TTime):longint;cdecl;external libx;
function XAutoRepeatOff(para1:PDisplay):longint;cdecl;external libx;
function XAutoRepeatOn(para1:PDisplay):longint;cdecl;external libx;
function XBell(para1:PDisplay; para2:longint):longint;cdecl;external libx;
function XBitmapBitOrder(para1:PDisplay):longint;cdecl;external libx;
function XBitmapPad(para1:PDisplay):longint;cdecl;external libx;
function XBitmapUnit(para1:PDisplay):longint;cdecl;external libx;
function XCellsOfScreen(para1:PScreen):longint;cdecl;external libx;
function XChangeActivePointerGrab(para1:PDisplay; para2:dword; para3:TCursor; para4:TTime):longint;cdecl;external libx;
function XChangeGC(para1:PDisplay; para2:TGC; para3:dword; para4:PXGCValues):longint;cdecl;external libx;
function XChangeKeyboardControl(para1:PDisplay; para2:dword; para3:PXKeyboardControl):longint;cdecl;external libx;
function XChangeKeyboardMapping(para1:PDisplay; para2:longint; para3:longint; para4:PKeySym; para5:longint):longint;cdecl;external libx;
function XChangePointerControl(para1:PDisplay; para2:Boolean; para3:Boolean; para4:longint; para5:longint;
           para6:longint):longint;cdecl;external libx;
function XChangeProperty(para1:PDisplay; para2:TWindow; para3:TAtom; para4:TAtom; para5:longint;
           para6:longint; para7:Pbyte; para8:longint):longint;cdecl;external libx;
function XChangeSaveSet(para1:PDisplay; para2:TWindow; para3:longint):longint;cdecl;external libx;
function XChangeWindowAttributes(para1:PDisplay; para2:TWindow; para3:dword; para4:PXSetWindowAttributes):longint;cdecl;external libx;
type
  TXEventPredicate = function(dpy: PDisplay; event: PXEvent; arg: Pointer): Boolean; cdecl;

function XCheckIfEvent(  dpy: PDisplay;  event_return: PXEvent;  predicate: TXEventPredicate;  arg: Pointer): Boolean; cdecl; external libx;
function XCheckMaskEvent(para1:PDisplay; para2:longint; para3:PXEvent):Boolean;cdecl;external libx;
function XCheckTypedEvent(para1:PDisplay; para2:longint; para3:PXEvent):Boolean;cdecl;external libx;
function XCheckTypedWindowEvent(para1:PDisplay; para2:TWindow; para3:longint; para4:PXEvent):Boolean;cdecl;external libx;
function XCheckWindowEvent(para1:PDisplay; para2:TWindow; para3:longint; para4:PXEvent):Boolean;cdecl;external libx;
function XCirculateSubwindows(para1:PDisplay; para2:TWindow; para3:longint):longint;cdecl;external libx;
function XCirculateSubwindowsDown(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
function XCirculateSubwindowsUp(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
function XClearArea(para1:PDisplay; para2:TWindow; para3:longint; para4:longint; para5:dword;
           para6:dword; para7:Boolean):longint;cdecl;external libx;
function XClearWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
function XCloseDisplay(para1:PDisplay):longint;cdecl;external libx;
function XConfigureWindow(para1:PDisplay; para2:TWindow; para3:dword; para4:PXWindowChanges):longint;cdecl;external libx;
function XConnectionNumber(para1:PDisplay):longint;cdecl;external libx;
function XConvertSelection(para1:PDisplay; para2:TAtom; para3:TAtom; para4:TAtom; para5:TWindow;
           para6:TTime):longint;cdecl;external libx;
function XCopyArea(para1:PDisplay; para2:TDrawable; para3:TDrawable; para4:TGC; para5:longint;
           para6:longint; para7:dword; para8:dword; para9:longint; para10:longint):longint;cdecl;external libx;
function XCopyGC(para1:PDisplay; para2:TGC; para3:dword; para4:TGC):longint;cdecl;external libx;
function XCopyPlane(para1:PDisplay; para2:TDrawable; para3:TDrawable; para4:TGC; para5:longint;
           para6:longint; para7:dword; para8:dword; para9:longint; para10:longint; 
           para11:dword):longint;cdecl;external libx;
function XDefaultDepth(para1:PDisplay; para2:longint):longint;cdecl;external libx;
function XDefaultDepthOfScreen(para1:PScreen):longint;cdecl;external libx;
function XDefaultScreen(para1:PDisplay):longint;cdecl;external libx;
function XDefineCursor(para1:PDisplay; para2:TWindow; para3:TCursor):longint;cdecl;external libx;
function XDeleteProperty(para1:PDisplay; para2:TWindow; para3:TAtom):longint;cdecl;external libx;
function XDestroyWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
function XDestroySubwindows(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
function XDoesBackingStore(para1:PScreen):longint;cdecl;external libx;
function XDoesSaveUnders(para1:PScreen):Boolean;cdecl;external libx;
function XDisableAccessControl(para1:PDisplay):longint;cdecl;external libx;
function XDisplayCells(para1:PDisplay; para2:longint):longint;cdecl;external libx;
function XDisplayHeight(para1:PDisplay; para2:longint):longint;cdecl;external libx;
function XDisplayHeightMM(para1:PDisplay; para2:longint):longint;cdecl;external libx;
function XDisplayKeycodes(para1:PDisplay; para2:Plongint; para3:Plongint):longint;cdecl;external libx;
function XDisplayPlanes(para1:PDisplay; para2:longint):longint;cdecl;external libx;
function XDisplayWidth(para1:PDisplay; para2:longint):longint;cdecl;external libx;
function XDisplayWidthMM(para1:PDisplay; para2:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ width  }{ height  }{ angle1  }{ angle2  }
function XDrawArc(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:dword; para7:dword; para8:longint; para9:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ arcs  }{ narcs  }
function XDrawArcs(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXArc; para5:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ string  }{ length  }
function XDrawImageString(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:Pchar; para7:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ string  }{ length  }
function XDrawImageString16(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:PXChar2b; para7:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x1  }{ y1  }{ x2  }{ y2  }
function XDrawLine(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:longint; para7:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ points  }{ npoints  }{ mode  }
function XDrawLines(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXPoint; para5:longint; 
           para6:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }
function XDrawPoint(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ points  }{ npoints  }{ mode  }
function XDrawPoints(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXPoint; para5:longint; 
           para6:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ width  }{ height  }
function XDrawRectangle(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:dword; para7:dword):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ rectangles  }{ nrectangles  }
function XDrawRectangles(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXRectangle; para5:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ segments  }{ nsegments  }
function XDrawSegments(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXSegment; para5:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ string  }{ length  }
function XDrawString(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:Pchar; para7:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ string  }{ length  }
function XDrawString16(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:PXChar2b; para7:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ items  }{ nitems  }
function XDrawText(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:PXTextItem; para7:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ items  }{ nitems  }
function XDrawText16(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:PXTextItem16; para7:longint):longint;cdecl;external libx;
{ display  }
function XEnableAccessControl(para1:PDisplay):longint;cdecl;external libx;
{ display  }{ mode  }
function XEventsQueued(para1:PDisplay; para2:longint):longint;cdecl;external libx;
{ display  }{ w  }{ window_name_return  }
function XFetchName(para1:PDisplay; para2:TWindow; para3:PPchar):TStatus;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ width  }{ height  }{ angle1  }{ angle2  }
function XFillArc(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:dword; para7:dword; para8:longint; para9:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ arcs  }{ narcs  }
function XFillArcs(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXArc; para5:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ points  }{ npoints  }{ shape  }{ mode  }
function XFillPolygon(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXPoint; para5:longint; 
           para6:longint; para7:longint):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ width  }{ height  }
function XFillRectangle(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
           para6:dword; para7:dword):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ rectangles  }{ nrectangles  }
function XFillRectangles(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXRectangle; para5:longint):longint;cdecl;external libx;
{ display  }
function XFlush(para1:PDisplay):longint;cdecl;external libx;
{ display  }{ mode  }
function XForceScreenSaver(para1:PDisplay; para2:longint):longint;cdecl;external libx;
{ data  }
function XFree(para1:pointer):longint;cdecl;external libx;
{ display  }{ colormap  }
function XFreeColormap(para1:PDisplay; para2:TColormap):longint;cdecl;external libx;
{ display  }{ colormap  }{ pixels  }{ npixels  }{ planes  }
function XFreeColors(para1:PDisplay; para2:TColormap; para3:Pdword; para4:longint; para5:dword):longint;cdecl;external libx;
{ display  }{ cursor  }
function XFreeCursor(para1:PDisplay; para2:TCursor):longint;cdecl;external libx;
{ list  }
function XFreeExtensionList(para1:PPchar):longint;cdecl;external libx;
{ display  }{ font_struct  }
function XFreeFont(para1:PDisplay; para2:PXFontStruct):longint;cdecl;external libx;
{ names  }{ free_info  }{ actual_count  }
function XFreeFontInfo(para1:PPchar; para2:PXFontStruct; para3:longint):longint;cdecl;external libx;
{ list  }
function XFreeFontNames(para1:PPchar):longint;cdecl;external libx;
{ list  }
function XFreeFontPath(para1:PPchar):longint;cdecl;external libx;
{ display  }{ gc  }
function XFreeGC(para1:PDisplay; para2:TGC):longint;cdecl;external libx;
{ modmap  }
function XFreeModifiermap(para1:PXModifierKeymap):longint;cdecl;external libx;
{ display  }{ pixmap  }
function XFreePixmap(para1:PDisplay; para2:TPixmap):longint;cdecl;external libx;
{ display  }{ screen  }{ position  }{ default_position  }{ bwidth  }{ fwidth  }{ fheight  }{ xadder  }{ yadder  }{ x_return  }{ y_return  }{ width_return  }{ height_return  }
function XGeometry(para1:PDisplay; para2:longint; para3:Pchar; para4:Pchar; para5:dword; 
           para6:dword; para7:dword; para8:longint; para9:longint; para10:Plongint; 
           para11:Plongint; para12:Plongint; para13:Plongint):longint;cdecl;external libx;
{ display  }{ name  }{ message  }{ default_string  }{ buffer_return  }{ length  }
function XGetErrorDatabaseText(para1:PDisplay; para2:Pchar; para3:Pchar; para4:Pchar; para5:Pchar; 
           para6:longint):longint;cdecl;external libx;
{ display  }{ code  }{ buffer_return  }{ length  }
function XGetErrorText(para1:PDisplay; para2:longint; para3:Pchar; para4:longint):longint;cdecl;external libx;
{ font_struct  }{ atom  }{ value_return  }
function XGetFontProperty(para1:PXFontStruct; para2:TAtom; para3:Pdword):Boolean;cdecl;external libx;
{ display  }{ gc  }{ valuemask  }{ values_return  }
function XGetGCValues(para1:PDisplay; para2:TGC; para3:dword; para4:PXGCValues):TStatus;cdecl;external libx;
{ display  }{ d  }{ root_return  }{ x_return  }{ y_return  }{ width_return  }{ height_return  }{ border_width_return  }{ depth_return  }
function XGetGeometry(para1:PDisplay; para2:TDrawable; para3:PWindow; para4:Plongint; para5:Plongint; 
           para6:Pdword; para7:Pdword; para8:Pdword; para9:Pdword):TStatus;cdecl;external libx;
{ display  }{ w  }{ icon_name_return  }
function XGetIconName(para1:PDisplay; para2:TWindow; para3:PPchar):TStatus;cdecl;external libx;
{ display  }{ focus_return  }{ revert_to_return  }
function XGetInputFocus(para1:PDisplay; para2:PWindow; para3:Plongint):longint;cdecl;external libx;
{ display  }{ values_return  }
function XGetKeyboardControl(para1:PDisplay; para2:PXKeyboardState):longint;cdecl;external libx;
{ display  }{ accel_numerator_return  }{ accel_denominator_return  }{ threshold_return  }
function XGetPointerControl(para1:PDisplay; para2:Plongint; para3:Plongint; para4:Plongint):longint;cdecl;external libx;
{ display  }{ map_return  }{ nmap  }
function XGetPointerMapping(para1:PDisplay; para2:Pbyte; para3:longint):longint;cdecl;external libx;
{ display  }{ timeout_return  }{ interval_return  }{ prefer_blanking_return  }{ allow_exposures_return  }
function XGetScreenSaver(para1:PDisplay; para2:Plongint; para3:Plongint; para4:Plongint; para5:Plongint):longint;cdecl;external libx;
{ display  }{ w  }{ prop_window_return  }
function XGetTransientForHint(para1:PDisplay; para2:TWindow; para3:PWindow):TStatus;cdecl;external libx;
{ display  }{ w  }{ property  }{ long_offset  }{ long_length  }{ delete  }{ req_type  }{ actual_type_return  }{ actual_format_return  }{ nitems_return  }{ bytes_after_return  }{ prop_return  }
function XGetWindowProperty(para1:PDisplay; para2:TWindow; para3:TAtom; para4:longint; para5:longint; 
           para6:Boolean; para7:TAtom; para8:PAtom; para9:Plongint; para10:Pdword; 
           para11:Pdword; para12:PPbyte):longint;cdecl;external libx;
{ display  }{ w  }{ window_attributes_return  }
function XGetWindowAttributes(para1:PDisplay; para2:TWindow; para3:PXWindowAttributes):TStatus;cdecl;external libx;
{ display  }{ button  }{ modifiers  }{ grab_window  }{ owner_events  }{ event_mask  }{ pointer_mode  }{ keyboard_mode  }{ confine_to  }{ cursor  }
function XGrabButton(para1:PDisplay; para2:dword; para3:dword; para4:TWindow; para5:Boolean; 
           para6:dword; para7:longint; para8:longint; para9:TWindow; para10:TCursor):longint;cdecl;external libx;
{ display  }{ keycode  }{ modifiers  }{ grab_window  }{ owner_events  }{ pointer_mode  }{ keyboard_mode  }
function XGrabKey(para1:PDisplay; para2:longint; para3:dword; para4:TWindow; para5:Boolean; 
           para6:longint; para7:longint):longint;cdecl;external libx;
{ display  }{ grab_window  }{ owner_events  }{ pointer_mode  }{ keyboard_mode  }{ time  }
function XGrabKeyboard(para1:PDisplay; para2:TWindow; para3:Boolean; para4:longint; para5:longint; 
           para6:TTime):longint;cdecl;external libx;
{ display  }{ grab_window  }{ owner_events  }{ event_mask  }{ pointer_mode  }{ keyboard_mode  }{ confine_to  }{ cursor  }{ time  }
function XGrabPointer(para1:PDisplay; para2:TWindow; para3:Boolean; para4:dword; para5:longint; 
           para6:longint; para7:TWindow; para8:TCursor; para9:TTime):longint;cdecl;external libx;
{ display  }
function XGrabServer(para1:PDisplay):longint;cdecl;external libx;
{ screen  }
function XHeightMMOfScreen(para1:PScreen):longint;cdecl;external libx;
{ screen  }
function XHeightOfScreen(para1:PScreen):longint;cdecl;external libx;
{ display  }{ event_return  }{ display  }{ event  }{ arg  }
{ predicate  }{ arg  }
function XIfEvent(para1:PDisplay; para2:PXEvent; para3:function (para1:PDisplay; para2:PXEvent; para3:TXPointer):Boolean; para4:TXPointer):longint;cdecl;external libx;
{ display  }
function XImageByteOrder(para1:PDisplay):longint;cdecl;external libx;
{ display  }{ colormap  }
function XInstallColormap(para1:PDisplay; para2:TColormap):longint;cdecl;external libx;
{ display  }{ keysym  }
function XKeysymToKeycode(para1:PDisplay; para2:TKeySym):TKeyCode;cdecl;external libx;
{ display  }{ resource  }
function XKillClient(para1:PDisplay; para2:TXID):longint;cdecl;external libx;
{ display  }{ colormap  }{ color_name  }{ exact_def_return  }{ screen_def_return  }
function XLookupColor(para1:PDisplay; para2:TColormap; para3:Pchar; para4:PXColor; para5:PXColor):TStatus;cdecl;external libx;
{ display  }{ w  }
function XLowerWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
{ display  }{ w  }
function XMapRaised(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
{ display  }{ w  }
function XMapSubwindows(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
{ display  }{ w  }
function XMapWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
{ display  }{ event_mask  }{ event_return  }
function XMaskEvent(para1:PDisplay; para2:longint; para3:PXEvent):longint;cdecl;external libx;
{ screen  }
function XMaxCmapsOfScreen(para1:PScreen):longint;cdecl;external libx;
{ screen  }
function XMinCmapsOfScreen(para1:PScreen):longint;cdecl;external libx;
{ display  }{ w  }{ x  }{ y  }{ width  }{ height  }
function XMoveResizeWindow(para1:PDisplay; para2:TWindow; para3:longint; para4:longint; para5:dword; 
           para6:dword):longint;cdecl;external libx;
{ display  }{ w  }{ x  }{ y  }
function XMoveWindow(para1:PDisplay; para2:TWindow; para3:longint; para4:longint):longint;cdecl;external libx;
{ display  }{ event_return  }
function XNextEvent(para1:PDisplay; para2:PXEvent):longint;cdecl;external libx;
{ display  }
function XNoOp(para1:PDisplay):longint;cdecl;external libx;
{ display  }{ colormap  }{ spec  }{ exact_def_return  }
function XParseColor(para1:PDisplay; para2:TColormap; para3:Pchar; para4:PXColor):TStatus;cdecl;external libx;
{ parsestring  }{ x_return  }{ y_return  }{ width_return  }{ height_return  }
function XParseGeometry(para1:Pchar; para2:Plongint; para3:Plongint; para4:Pdword; para5:Pdword):longint;cdecl;external libx;
{ display  }{ event_return  }
function XPeekEvent(para1:PDisplay; para2:PXEvent):longint;cdecl;external libx;
{ display  }{ event_return  }{ display  }{ event  }{ arg  }
{ predicate  }{ arg  }
function XPeekIfEvent(para1:PDisplay; para2:PXEvent; para3:function (para1:PDisplay; para2:PXEvent; para3:TXPointer):Boolean; para4:TXPointer):longint;cdecl;external libx;
{ display  }
function XPending(para1:PDisplay):longint;cdecl;external libx;
{ screen  }
function XPlanesOfScreen(para1:PScreen):longint;cdecl;external libx;
{ display  }
function XProtocolRevision(para1:PDisplay):longint;cdecl;external libx;
{ display  }
function XProtocolVersion(para1:PDisplay):longint;cdecl;external libx;
{ display  }{ event  }
function XPutBackEvent(para1:PDisplay; para2:PXEvent):longint;cdecl;external libx;
{ display  }{ d  }{ gc  }{ image  }{ src_x  }{ src_y  }{ dest_x  }{ dest_y  }{ width  }{ height  }
function XPutImage(para1:PDisplay; para2:TDrawable; para3:TGC; para4:PXImage; para5:longint; 
           para6:longint; para7:longint; para8:longint; para9:dword; para10:dword):longint;cdecl;external libx;
{ display  }
function XQLength(para1:PDisplay):longint;cdecl;external libx;
{ display  }{ d  }{ width  }{ height  }{ width_return  }{ height_return  }
function XQueryBestCursor(para1:PDisplay; para2:TDrawable; para3:dword; para4:dword; para5:Pdword; 
           para6:Pdword):TStatus;cdecl;external libx;
{ display  }{ class  }{ which_screen  }{ width  }{ height  }{ width_return  }{ height_return  }
function XQueryBestSize(para1:PDisplay; para2:longint; para3:TDrawable; para4:dword; para5:dword; 
           para6:Pdword; para7:Pdword):TStatus;cdecl;external libx;
{ display  }{ which_screen  }{ width  }{ height  }{ width_return  }{ height_return  }
function XQueryBestStipple(para1:PDisplay; para2:TDrawable; para3:dword; para4:dword; para5:Pdword; 
           para6:Pdword):TStatus;cdecl;external libx;
{ display  }{ which_screen  }{ width  }{ height  }{ width_return  }{ height_return  }
function XQueryBestTile(para1:PDisplay; para2:TDrawable; para3:dword; para4:dword; para5:Pdword; 
           para6:Pdword):TStatus;cdecl;external libx;
{ display  }{ colormap  }{ def_in_out  }
function XQueryColor(para1:PDisplay; para2:TColormap; para3:PXColor):longint;cdecl;external libx;
{ display  }{ colormap  }{ defs_in_out  }{ ncolors  }
function XQueryColors(para1:PDisplay; para2:TColormap; para3:PXColor; para4:longint):longint;cdecl;external libx;
{ display  }{ name  }{ major_opcode_return  }{ first_event_return  }{ first_error_return  }
function XQueryExtension(para1:PDisplay; para2:Pchar; para3:Plongint; para4:Plongint; para5:Plongint):Boolean;cdecl;external libx;
{ display  }{ keys_return  }
function XQueryKeymap(para1:PDisplay; para2:array[0..31] of char):longint;cdecl;external libx;
{ display  }{ w  }{ root_return  }{ child_return  }{ root_x_return  }{ root_y_return  }{ win_x_return  }{ win_y_return  }{ mask_return  }
function XQueryPointer(para1:PDisplay; para2:TWindow; para3:PWindow; para4:PWindow; para5:Plongint; 
           para6:Plongint; para7:Plongint; para8:Plongint; para9:Pdword):Boolean;cdecl;external libx;
{ display  }{ font_ID  }{ string  }{ nchars  }{ direction_return  }{ font_ascent_return  }{ font_descent_return  }{ overall_return  }
function XQueryTextExtents(para1:PDisplay; para2:TXID; para3:Pchar; para4:longint; para5:Plongint; 
           para6:Plongint; para7:Plongint; para8:PXCharStruct):longint;cdecl;external libx;
{ display  }{ font_ID  }{ string  }{ nchars  }{ direction_return  }{ font_ascent_return  }{ font_descent_return  }{ overall_return  }
function XQueryTextExtents16(para1:PDisplay; para2:TXID; para3:PXChar2b; para4:longint; para5:Plongint; 
           para6:Plongint; para7:Plongint; para8:PXCharStruct):longint;cdecl;external libx;
{ display  }{ w  }{ root_return  }{ parent_return  }{ children_return  }{ nchildren_return  }
function XQueryTree(para1:PDisplay; para2:TWindow; para3:PWindow; para4:PWindow; para5:PPWindow; 
           para6:Pdword):TStatus;cdecl;external libx;
{ display  }{ w  }
function XRaiseWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
{ display  }{ d  }{ filename  }{ width_return  }{ height_return  }{ bitmap_return  }{ x_hot_return  }{ y_hot_return  }
function XReadBitmapFile(para1:PDisplay; para2:TDrawable; para3:Pchar; para4:Pdword; para5:Pdword; 
           para6:PPixmap; para7:Plongint; para8:Plongint):longint;cdecl;external libx;
{ filename  }{ width_return  }{ height_return  }{ data_return  }{ x_hot_return  }{ y_hot_return  }
function XReadBitmapFileData(para1:Pchar; para2:Pdword; para3:Pdword; para4:PPbyte; para5:Plongint; 
           para6:Plongint):longint;cdecl;external libx;
{ display  }{ keysym  }{ list  }{ mod_count  }{ string  }{ bytes_string  }
function XRebindKeysym(para1:PDisplay; para2:TKeySym; para3:PKeySym; para4:longint; para5:Pbyte; 
           para6:longint):longint;cdecl;external libx;
{ display  }{ cursor  }{ foreground_color  }{ background_color  }
function XRecolorCursor(para1:PDisplay; para2:TCursor; para3:PXColor; para4:PXColor):longint;cdecl;external libx;
{ event_map  }
function XRefreshKeyboardMapping(para1:PXMappingEvent):longint;cdecl;external libx;
{ display  }{ w  }
function XRemoveFromSaveSet(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
{ display  }{ host  }
function XRemoveHost(para1:PDisplay; para2:PXHostAddress):longint;cdecl;external libx;
{ display  }{ hosts  }{ num_hosts  }
function XRemoveHosts(para1:PDisplay; para2:PXHostAddress; para3:longint):longint;cdecl;external libx;
{ display  }{ w  }{ parent  }{ x  }{ y  }
function XReparentWindow(para1:PDisplay; para2:TWindow; para3:TWindow; para4:longint; para5:longint):longint;cdecl;external libx;
{ display  }
function XResetScreenSaver(para1:PDisplay):longint;cdecl;external libx;
{ display  }{ w  }{ width  }{ height  }
function XResizeWindow(para1:PDisplay; para2:TWindow; para3:dword; para4:dword):longint;cdecl;external libx;
{ display  }{ windows  }{ nwindows  }
function XRestackWindows(para1:PDisplay; para2:PWindow; para3:longint):longint;cdecl;external libx;
{ display  }{ rotate  }
function XRotateBuffers(para1:PDisplay; para2:longint):longint;cdecl;external libx;
{ display  }{ w  }{ properties  }{ num_prop  }{ npositions  }
function XRotateWindowProperties(para1:PDisplay; para2:TWindow; para3:PAtom; para4:longint; para5:longint):longint;cdecl;external libx;
{ display  }
function XScreenCount(para1:PDisplay):longint;cdecl;external libx;
{ display  }{ w  }{ event_mask  }
function XSelectInput(para1:PDisplay; para2:TWindow; para3:longint):longint;cdecl;external libx;
{ display  }{ w  }{ propagate  }{ event_mask  }{ event_send  }
function XSendEvent(para1:PDisplay; para2:TWindow; para3:Boolean; para4:longint; para5:PXEvent):TStatus;cdecl;external libx;
{ display  }{ mode  }
function XSetAccessControl(para1:PDisplay; para2:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ arc_mode  }
function XSetArcMode(para1:PDisplay; para2:TGC; para3:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ background  }
function XSetBackground(para1:PDisplay; para2:TGC; para3:dword):longint;cdecl;external libx;
{ display  }{ gc  }{ pixmap  }
function XSetClipMask(para1:PDisplay; para2:TGC; para3:TPixmap):longint;cdecl;external libx;
{ display  }{ gc  }{ clip_x_origin  }{ clip_y_origin  }
function XSetClipOrigin(para1:PDisplay; para2:TGC; para3:longint; para4:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ clip_x_origin  }{ clip_y_origin  }{ rectangles  }{ n  }{ ordering  }
function XSetClipRectangles(para1:PDisplay; para2:TGC; para3:longint; para4:longint; para5:PXRectangle; 
           para6:longint; para7:longint):longint;cdecl;external libx;
{ display  }{ close_mode  }
function XSetCloseDownMode(para1:PDisplay; para2:longint):longint;cdecl;external libx;
{ display  }{ w  }{ argv  }{ argc  }
function XSetCommand(para1:PDisplay; para2:TWindow; para3:PPchar; para4:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ dash_offset  }{ dash_list  }{ n  }
function XSetDashes(para1:PDisplay; para2:TGC; para3:longint; para4:Pchar; para5:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ fill_rule  }
function XSetFillRule(para1:PDisplay; para2:TGC; para3:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ fill_style  }
function XSetFillStyle(para1:PDisplay; para2:TGC; para3:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ font  }
function XSetFont(para1:PDisplay; para2:TGC; para3:TFont):longint;cdecl;external libx;
{ display  }{ directories  }{ ndirs  }
function XSetFontPath(para1:PDisplay; para2:PPchar; para3:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ foreground  }
function XSetForeground(para1:PDisplay; para2:TGC; para3:dword):longint;cdecl;external libx;
{ display  }{ gc  }{ function  }
function XSetFunction(para1:PDisplay; para2:TGC; para3:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ graphics_exposures  }
function XSetGraphicsExposures(para1:PDisplay; para2:TGC; para3:Boolean):longint;cdecl;external libx;
{ display  }{ w  }{ icon_name  }
function XSetIconName(para1:PDisplay; para2:TWindow; para3:Pchar):longint;cdecl;external libx;
{ display  }{ focus  }{ revert_to  }{ time  }
function XSetInputFocus(para1:PDisplay; para2:TWindow; para3:longint; para4:TTime):longint;cdecl;external libx;
{ display  }{ gc  }{ line_width  }{ line_style  }{ cap_style  }{ join_style  }
function XSetLineAttributes(para1:PDisplay; para2:TGC; para3:dword; para4:longint; para5:longint; 
           para6:longint):longint;cdecl;external libx;
{ display  }{ modmap  }
function XSetModifierMapping(para1:PDisplay; para2:PXModifierKeymap):longint;cdecl;external libx;
{ display  }{ gc  }{ plane_mask  }
function XSetPlaneMask(para1:PDisplay; para2:TGC; para3:dword):longint;cdecl;external libx;
{ display  }{ map  }{ nmap  }
function XSetPointerMapping(para1:PDisplay; para2:Pbyte; para3:longint):longint;cdecl;external libx;
{ display  }{ timeout  }{ interval  }{ prefer_blanking  }{ allow_exposures  }
function XSetScreenSaver(para1:PDisplay; para2:longint; para3:longint; para4:longint; para5:longint):longint;cdecl;external libx;
{ display  }{ selection  }{ owner  }{ time  }
function XSetSelectionOwner(para1:PDisplay; para2:TAtom; para3:TWindow; para4:TTime):longint;cdecl;external libx;
{ display  }{ gc  }{ foreground  }{ background  }{ function  }{ plane_mask  }
function XSetState(para1:PDisplay; para2:TGC; para3:dword; para4:dword; para5:longint; 
           para6:dword):longint;cdecl;external libx;
{ display  }{ gc  }{ stipple  }
function XSetStipple(para1:PDisplay; para2:TGC; para3:TPixmap):longint;cdecl;external libx;
{ display  }{ gc  }{ subwindow_mode  }
function XSetSubwindowMode(para1:PDisplay; para2:TGC; para3:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ ts_x_origin  }{ ts_y_origin  }
function XSetTSOrigin(para1:PDisplay; para2:TGC; para3:longint; para4:longint):longint;cdecl;external libx;
{ display  }{ gc  }{ tile  }
function XSetTile(para1:PDisplay; para2:TGC; para3:TPixmap):longint;cdecl;external libx;
{ display  }{ w  }{ background_pixel  }
function XSetWindowBackground(para1:PDisplay; para2:TWindow; para3:dword):longint;cdecl;external libx;
{ display  }{ w  }{ background_pixmap  }
function XSetWindowBackgroundPixmap(para1:PDisplay; para2:TWindow; para3:TPixmap):longint;cdecl;external libx;
{ display  }{ w  }{ border_pixel  }
function XSetWindowBorder(para1:PDisplay; para2:TWindow; para3:dword):longint;cdecl;external libx;
{ display  }{ w  }{ border_pixmap  }
function XSetWindowBorderPixmap(para1:PDisplay; para2:TWindow; para3:TPixmap):longint;cdecl;external libx;
{ display  }{ w  }{ width  }
function XSetWindowBorderWidth(para1:PDisplay; para2:TWindow; para3:dword):longint;cdecl;external libx;
{ display  }{ w  }{ colormap  }
function XSetWindowColormap(para1:PDisplay; para2:TWindow; para3:TColormap):longint;cdecl;external libx;
{ display  }{ bytes  }{ nbytes  }{ buffer  }
function XStoreBuffer(para1:PDisplay; para2:Pchar; para3:longint; para4:longint):longint;cdecl;external libx;
{ display  }{ bytes  }{ nbytes  }
function XStoreBytes(para1:PDisplay; para2:Pchar; para3:longint):longint;cdecl;external libx;
{ display  }{ colormap  }{ color  }
function XStoreColor(para1:PDisplay; para2:TColormap; para3:PXColor):longint;cdecl;external libx;
{ display  }{ colormap  }{ color  }{ ncolors  }
function XStoreColors(para1:PDisplay; para2:TColormap; para3:PXColor; para4:longint):longint;cdecl;external libx;
{ display  }{ w  }{ window_name  }
function XStoreName(para1:PDisplay; para2:TWindow; para3:Pchar):longint;cdecl;external libx;
{ display  }{ colormap  }{ color  }{ pixel  }{ flags  }
function XStoreNamedColor(para1:PDisplay; para2:TColormap; para3:Pchar; para4:dword; para5:longint):longint;cdecl;external libx;
{ display  }{ discard  }
function XSync(para1:PDisplay; para2:Boolean):longint;cdecl;external libx;
{ font_struct  }{ string  }{ nchars  }{ direction_return  }{ font_ascent_return  }{ font_descent_return  }{ overall_return  }
function XTextExtents(para1:PXFontStruct; para2:Pchar; para3:longint; para4:Plongint; para5:Plongint; 
           para6:Plongint; para7:PXCharStruct):longint;cdecl;external libx;
{ font_struct  }{ string  }{ nchars  }{ direction_return  }{ font_ascent_return  }{ font_descent_return  }{ overall_return  }
function XTextExtents16(para1:PXFontStruct; para2:PXChar2b; para3:longint; para4:Plongint; para5:Plongint; 
           para6:Plongint; para7:PXCharStruct):longint;cdecl;external libx;
{ font_struct  }{ string  }{ count  }
function XTextWidth(para1:PXFontStruct; para2:Pchar; para3:longint):longint;cdecl;external libx;
{ font_struct  }{ string  }{ count  }
function XTextWidth16(para1:PXFontStruct; para2:PXChar2b; para3:longint):longint;cdecl;external libx;
{ display  }{ src_w  }{ dest_w  }{ src_x  }{ src_y  }{ dest_x_return  }{ dest_y_return  }{ child_return  }
function XTranslateCoordinates(para1:PDisplay; para2:TWindow; para3:TWindow; para4:longint; para5:longint; 
           para6:Plongint; para7:Plongint; para8:PWindow):Boolean;cdecl;external libx;
{ display  }{ w  }
function XUndefineCursor(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
{ display  }{ button  }{ modifiers  }{ grab_window  }
function XUngrabButton(para1:PDisplay; para2:dword; para3:dword; para4:TWindow):longint;cdecl;external libx;
{ display  }{ keycode  }{ modifiers  }{ grab_window  }
function XUngrabKey(para1:PDisplay; para2:longint; para3:dword; para4:TWindow):longint;cdecl;external libx;
{ display  }{ time  }
function XUngrabKeyboard(para1:PDisplay; para2:TTime):longint;cdecl;external libx;
{ display  }{ time  }
function XUngrabPointer(para1:PDisplay; para2:TTime):longint;cdecl;external libx;
{ display  }
function XUngrabServer(para1:PDisplay):longint;cdecl;external libx;
{ display  }{ colormap  }
function XUninstallColormap(para1:PDisplay; para2:TColormap):longint;cdecl;external libx;
{ display  }{ font  }
function XUnloadFont(para1:PDisplay; para2:TFont):longint;cdecl;external libx;
{ display  }{ w  }
function XUnmapSubwindows(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
{ display  }{ w  }
function XUnmapWindow(para1:PDisplay; para2:TWindow):longint;cdecl;external libx;
{ display  }
function XVendorRelease(para1:PDisplay):longint;cdecl;external libx;
{ display  }{ src_w  }{ dest_w  }{ src_x  }{ src_y  }{ src_width  }{ src_height  }{ dest_x  }{ dest_y  }
function XWarpPointer(para1:PDisplay; para2:TWindow; para3:TWindow; para4:longint; para5:longint; 
           para6:dword; para7:dword; para8:longint; para9:longint):longint;cdecl;external libx;
{ screen  }
function XWidthMMOfScreen(para1:PScreen):longint;cdecl;external libx;
{ screen  }
function XWidthOfScreen(para1:PScreen):longint;cdecl;external libx;
{ display  }{ w  }{ event_mask  }{ event_return  }
function XWindowEvent(para1:PDisplay; para2:TWindow; para3:longint; para4:PXEvent):longint;cdecl;external libx;
{ display  }{ filename  }{ bitmap  }{ width  }{ height  }{ x_hot  }{ y_hot  }
function XWriteBitmapFile(para1:PDisplay; para2:Pchar; para3:TPixmap; para4:dword; para5:dword; 
           para6:longint; para7:longint):longint;cdecl;external libx;
function XSupportsLocale:Boolean;cdecl;external libx;
{ modifier_list  }
function XSetLocaleModifiers(para1:Pchar):Pchar;cdecl;external libx;
{ display  }{ rdb  }{ res_name  }{ res_class  }
function XOpenOM(para1:PDisplay; para2:PXrmHashBucketRec; para3:Pchar; para4:Pchar):TXOM;cdecl;external libx;
{ om  }
function XCloseOM(para1:TXOM):TStatus;cdecl;external libx;
{ om  }function XSetOMValues(para1:TXOM; args:array of const):Pchar;cdecl;external libx;
function XSetOMValues(para1:TXOM):Pchar;cdecl;external libx;
{ om  }function XGetOMValues(para1:TXOM; args:array of const):Pchar;cdecl;external libx;
function XGetOMValues(para1:TXOM):Pchar;cdecl;external libx;
{ om  }
function XDisplayOfOM(para1:TXOM):PDisplay;cdecl;external libx;
{ om  }
function XLocaleOfOM(para1:TXOM):Pchar;cdecl;external libx;
{ om  }function XCreateOC(para1:TXOM; args:array of const):TXOC;cdecl;external libx;
function XCreateOC(para1:TXOM):TXOC;cdecl;external libx;
{ oc  }
procedure XDestroyOC(para1:TXOC);cdecl;external libx;
{ oc  }
function XOMOfOC(para1:TXOC):TXOM;cdecl;external libx;
{ oc  }function XSetOCValues(para1:TXOC; args:array of const):Pchar;cdecl;external libx;
function XSetOCValues(para1:TXOC):Pchar;cdecl;external libx;
{ oc  }function XGetOCValues(para1:TXOC; args:array of const):Pchar;cdecl;external libx;
function XGetOCValues(para1:TXOC):Pchar;cdecl;external libx;
{ display  }{ base_font_name_list  }{ missing_charset_list  }{ missing_charset_count  }{ def_string  }
function XCreateFontSet(para1:PDisplay; para2:Pchar; para3:PPPchar; para4:Plongint; para5:PPchar):TXFontSet;cdecl;external libx;
{ display  }{ font_set  }
procedure XFreeFontSet(para1:PDisplay; para2:TXFontSet);cdecl;external libx;
{ font_set  }{ font_struct_list  }{ font_name_list  }
function XFontsOfFontSet(para1:TXFontSet; para2:PPPXFontStruct; para3:PPPchar):longint;cdecl;external libx;
{ font_set  }
function XBaseFontNameListOfFontSet(para1:TXFontSet):Pchar;cdecl;external libx;
{ font_set  }
function XLocaleOfFontSet(para1:TXFontSet):Pchar;cdecl;external libx;
{ font_set  }
function XContextDependentDrawing(para1:TXFontSet):Boolean;cdecl;external libx;
{ font_set  }
function XDirectionalDependentDrawing(para1:TXFontSet):Boolean;cdecl;external libx;
{ font_set  }
function XContextualDrawing(para1:TXFontSet):Boolean;cdecl;external libx;
{ font_set  }
function XExtentsOfFontSet(para1:TXFontSet):PXFontSetExtents;cdecl;external libx;
{ font_set  }{ text  }{ bytes_text  }
function XmbTextEscapement(para1:TXFontSet; para2:Pchar; para3:longint):longint;cdecl;external libx;
{ font_set  }{ text  }{ num_wchars  }
function XwcTextEscapement(para1:TXFontSet; para2:Pwchar_t; para3:longint):longint;cdecl;external libx;
{ font_set  }{ text  }{ bytes_text  }
function Xutf8TextEscapement(para1:TXFontSet; para2:Pchar; para3:longint):longint;cdecl;external libx;
{ font_set  }{ text  }{ bytes_text  }{ overall_ink_return  }{ overall_logical_return  }
function XmbTextExtents(para1:TXFontSet; para2:Pchar; para3:longint; para4:PXRectangle; para5:PXRectangle):longint;cdecl;external libx;
{ font_set  }{ text  }{ num_wchars  }{ overall_ink_return  }{ overall_logical_return  }
function XwcTextExtents(para1:TXFontSet; para2:Pwchar_t; para3:longint; para4:PXRectangle; para5:PXRectangle):longint;cdecl;external libx;
{ font_set  }{ text  }{ bytes_text  }{ overall_ink_return  }{ overall_logical_return  }
function Xutf8TextExtents(para1:TXFontSet; para2:Pchar; para3:longint; para4:PXRectangle; para5:PXRectangle):longint;cdecl;external libx;
{ font_set  }{ text  }{ bytes_text  }{ ink_extents_buffer  }{ logical_extents_buffer  }{ buffer_size  }{ num_chars  }{ overall_ink_return  }{ overall_logical_return  }
function XmbTextPerCharExtents(para1:TXFontSet; para2:Pchar; para3:longint; para4:PXRectangle; para5:PXRectangle; 
           para6:longint; para7:Plongint; para8:PXRectangle; para9:PXRectangle):TStatus;cdecl;external libx;
{ font_set  }{ text  }{ num_wchars  }{ ink_extents_buffer  }{ logical_extents_buffer  }{ buffer_size  }{ num_chars  }{ overall_ink_return  }{ overall_logical_return  }
function XwcTextPerCharExtents(para1:TXFontSet; para2:Pwchar_t; para3:longint; para4:PXRectangle; para5:PXRectangle; 
           para6:longint; para7:Plongint; para8:PXRectangle; para9:PXRectangle):TStatus;cdecl;external libx;
{ font_set  }{ text  }{ bytes_text  }{ ink_extents_buffer  }{ logical_extents_buffer  }{ buffer_size  }{ num_chars  }{ overall_ink_return  }{ overall_logical_return  }
function Xutf8TextPerCharExtents(para1:TXFontSet; para2:Pchar; para3:longint; para4:PXRectangle; para5:PXRectangle; 
           para6:longint; para7:Plongint; para8:PXRectangle; para9:PXRectangle):TStatus;cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ text_items  }{ nitems  }
procedure XmbDrawText(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
            para6:PXmbTextItem; para7:longint);cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ text_items  }{ nitems  }
procedure XwcDrawText(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
            para6:PXwcTextItem; para7:longint);cdecl;external libx;
{ display  }{ d  }{ gc  }{ x  }{ y  }{ text_items  }{ nitems  }
procedure Xutf8DrawText(para1:PDisplay; para2:TDrawable; para3:TGC; para4:longint; para5:longint; 
            para6:PXmbTextItem; para7:longint);cdecl;external libx;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ bytes_text  }
procedure XmbDrawString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pchar; para8:longint);cdecl;external libx;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ num_wchars  }
procedure XwcDrawString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pwchar_t; para8:longint);cdecl;external libx;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ bytes_text  }
procedure Xutf8DrawString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pchar; para8:longint);cdecl;external libx;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ bytes_text  }
procedure XmbDrawImageString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pchar; para8:longint);cdecl;external libx;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ num_wchars  }
procedure XwcDrawImageString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pwchar_t; para8:longint);cdecl;external libx;
{ display  }{ d  }{ font_set  }{ gc  }{ x  }{ y  }{ text  }{ bytes_text  }
procedure Xutf8DrawImageString(para1:PDisplay; para2:TDrawable; para3:TXFontSet; para4:TGC; para5:longint; 
            para6:longint; para7:Pchar; para8:longint);cdecl;external libx;
{ dpy  }{ rdb  }{ res_name  }{ res_class  }
function XOpenIM(para1:PDisplay; para2:PXrmHashBucketRec; para3:Pchar; para4:Pchar):TXIM;cdecl;external libx;
{ im  }
function XCloseIM(para1:TXIM):TStatus;cdecl;external libx;
{ im  }function XGetIMValues(para1:TXIM; args:array of const):Pchar;cdecl;external libx;
function XGetIMValues(para1:TXIM):Pchar;cdecl;external libx;
{ im  }function XSetIMValues(para1:TXIM; args:array of const):Pchar;cdecl;external libx;
function XSetIMValues(para1:TXIM):Pchar;cdecl;external libx;
{ im  }
function XDisplayOfIM(para1:TXIM):PDisplay;cdecl;external libx;
{ im }
function XLocaleOfIM(para1:TXIM):Pchar;cdecl;external libx;
{ im  }function XCreateIC(para1:TXIM; args:array of const):TXIC;cdecl;external libx;
function XCreateIC(para1:TXIM):TXIC;cdecl;external libx;
{ ic  }
procedure XDestroyIC(para1:TXIC);cdecl;external libx;
{ ic  }
procedure XSetICFocus(para1:TXIC);cdecl;external libx;
{ ic  }
procedure XUnsetICFocus(para1:TXIC);cdecl;external libx;
{ ic  }
function XwcResetIC(para1:TXIC):Pwchar_t;cdecl;external libx;
{ ic  }
function XmbResetIC(para1:TXIC):Pchar;cdecl;external libx;
{ ic  }
function Xutf8ResetIC(para1:TXIC):Pchar;cdecl;external libx;
{ ic  }function XSetICValues(para1:TXIC; args:array of const):Pchar;cdecl;external libx;
function XSetICValues(para1:TXIC):Pchar;cdecl;external libx;
{ ic  }function XGetICValues(para1:TXIC; args:array of const):Pchar;cdecl;external libx;
function XGetICValues(para1:TXIC):Pchar;cdecl;external libx;
{ ic  }
function XIMOfIC(para1:TXIC):TXIM;cdecl;external libx;
{ event  }{ window  }
function XFilterEvent(para1:PXEvent; para2:TWindow):Boolean;cdecl;external libx;
{ ic  }{ event  }{ buffer_return  }{ bytes_buffer  }{ keysym_return  }{ status_return  }
function XmbLookupString(para1:TXIC; para2:PXKeyPressedEvent; para3:Pchar; para4:longint; para5:PKeySym; 
           para6:PStatus):longint;cdecl;external libx;
{ ic  }{ event  }{ buffer_return  }{ wchars_buffer  }{ keysym_return  }{ status_return  }
function XwcLookupString(para1:TXIC; para2:PXKeyPressedEvent; para3:Pwchar_t; para4:longint; para5:PKeySym; 
           para6:PStatus):longint;cdecl;external libx;
{ ic  }{ event  }{ buffer_return  }{ bytes_buffer  }{ keysym_return  }{ status_return  }
function Xutf8LookupString(para1:TXIC; para2:PXKeyPressedEvent; para3:Pchar; para4:longint; para5:PKeySym; 
           para6:PStatus):longint;cdecl;external libx;
{unused }function XVaCreateNestedList(para1:longint; args:array of const):TXVaNestedList;cdecl;external libx;
function XVaCreateNestedList(para1:longint):TXVaNestedList;cdecl;external libx;
{ internal connections for IMs  }
{ dpy  }{ rdb  }{ res_name  }{ res_class  }{ callback  }{ client_data  }
function XRegisterIMInstantiateCallback(para1:PDisplay; para2:PXrmHashBucketRec; para3:Pchar; para4:Pchar; para5:TXIDProc; 
           para6:TXPointer):Boolean;cdecl;external libx;
{ dpy  }{ rdb  }{ res_name  }{ res_class  }{ callback  }{ client_data  }
function XUnregisterIMInstantiateCallback(para1:PDisplay; para2:PXrmHashBucketRec; para3:Pchar; para4:Pchar; para5:TXIDProc; 
           para6:TXPointer):Boolean;cdecl;external libx;
{ dpy  }{ client_data  }{ fd  }{ opening  }{ open or close flag  }
{ watch_data  }{ open sets, close uses  }
type

  TXConnectionWatchProc = procedure (para1:PDisplay; para2:TXPointer; para3:longint; para4:Boolean; para5:PXPointer);cdecl;
{ dpy  }{ fd_return  }{ count_return  }

function XInternalConnectionNumbers(para1:PDisplay; para2:PPlongint; para3:Plongint):TStatus;cdecl;external libx;
{ dpy  }{ fd  }
procedure XProcessInternalConnection(para1:PDisplay; para2:longint);cdecl;external libx;
{ dpy  }{ callback  }{ client_data  }
function XAddConnectionWatch(para1:PDisplay; para2:TXConnectionWatchProc; para3:TXPointer):TStatus;cdecl;external libx;
{ dpy  }{ callback  }{ client_data  }
procedure XRemoveConnectionWatch(para1:PDisplay; para2:TXConnectionWatchProc; para3:TXPointer);cdecl;external libx;
{ name  }{ namelen  }{ data  }{ datalen  }
procedure XSetAuthorization(para1:Pchar; para2:longint; para3:Pchar; para4:longint);cdecl;external libx;
{ wstr  }{ str  }{ len  }
function _Xmbtowc(para1:Pwchar_t; para2:Pchar; para3:longint):longint;cdecl;external libx;
{ str  }{ wc  }
function _Xwctomb(para1:Pchar; para2:Twchar_t):longint;cdecl;external libx;
{ dpy  }{ cookie }
function XGetEventData(para1:PDisplay; para2:PXGenericEventCookie):Boolean;cdecl;external libx;
{ dpy  }{ cookie }
procedure XFreeEventData(para1:PDisplay; para2:PXGenericEventCookie);cdecl;external libx;
{$ifdef __clang__}
(** unsupported pragma#pragma clang diagnostic pop*)
{$endif}
{$endif}
{ _X11_XLIB_H_  }

// === Konventiert am: 9-12-25 15:57:05 ===


implementation

function ConnectionNumber(dpy : longint) : longint;
begin
  ConnectionNumber:=(TXPrivDisplay(dpy))^.fd;
end;
function RootWindow(dpy,scr : longint) : longint;
begin
  RootWindow:=(ScreenOfDisplay(dpy,scr))^.root;
end;
function DefaultScreen(dpy : longint) : longint;
begin
  DefaultScreen:=(TXPrivDisplay(dpy))^.default_screen;
end;
function DefaultRootWindow(dpy : longint) : longint;
begin
  DefaultRootWindow:=(ScreenOfDisplay(dpy,DefaultScreen(dpy)))^.root;
end;
function DefaultVisual(dpy,scr : longint) : longint;
begin
  DefaultVisual:=(ScreenOfDisplay(dpy,scr))^.root_visual;
end;
function DefaultGC(dpy,scr : longint) : longint;
begin
  DefaultGC:=(ScreenOfDisplay(dpy,scr))^.default_gc;
end;
function BlackPixel(dpy,scr : longint) : longint;
begin
  BlackPixel:=(ScreenOfDisplay(dpy,scr))^.black_pixel;
end;
function WhitePixel(dpy,scr : longint) : longint;
begin
  WhitePixel:=(ScreenOfDisplay(dpy,scr))^.white_pixel;
end;

{ was #define dname def_expr }
function AllPlanes : dword;
  begin
    AllPlanes:=dword( not (0));
  end;
function QLength(dpy : longint) : longint;
begin
  QLength:=(TXPrivDisplay(dpy))^.qlen;
end;
function DisplayWidth(dpy,scr : longint) : longint;
begin
  DisplayWidth:=(ScreenOfDisplay(dpy,scr))^.width;
end;
function DisplayHeight(dpy,scr : longint) : longint;
begin
  DisplayHeight:=(ScreenOfDisplay(dpy,scr))^.height;
end;
function DisplayWidthMM(dpy,scr : longint) : longint;
begin
  DisplayWidthMM:=(ScreenOfDisplay(dpy,scr))^.mwidth;
end;
function DisplayHeightMM(dpy,scr : longint) : longint;
begin
  DisplayHeightMM:=(ScreenOfDisplay(dpy,scr))^.mheight;
end;
function DisplayPlanes(dpy,scr : longint) : longint;
begin
  DisplayPlanes:=(ScreenOfDisplay(dpy,scr))^.root_depth;
end;
function DisplayCells(dpy,scr : longint) : longint;
begin
  DisplayCells:=(DefaultVisual(dpy,scr))^.map_entries;
end;
function ScreenCount(dpy : longint) : longint;
begin
  ScreenCount:=(TXPrivDisplay(dpy))^.nscreens;
end;
function ServerVendor(dpy : longint) : longint;
begin
  ServerVendor:=(TXPrivDisplay(dpy))^.vendor;
end;
function ProtocolVersion(dpy : longint) : longint;
begin
  ProtocolVersion:=(TXPrivDisplay(dpy))^.proto_major_version;
end;
function ProtocolRevision(dpy : longint) : longint;
begin
  ProtocolRevision:=(TXPrivDisplay(dpy))^.proto_minor_version;
end;
function VendorRelease(dpy : longint) : longint;
begin
  VendorRelease:=(TXPrivDisplay(dpy))^.release;
end;
function DisplayString(dpy : longint) : longint;
begin
  DisplayString:=(TXPrivDisplay(dpy))^.display_name;
end;
function DefaultDepth(dpy,scr : longint) : longint;
begin
  DefaultDepth:=(ScreenOfDisplay(dpy,scr))^.root_depth;
end;
function DefaultColormap(dpy,scr : longint) : longint;
begin
  DefaultColormap:=(ScreenOfDisplay(dpy,scr))^.cmap;
end;
function BitmapUnit(dpy : longint) : longint;
begin
  BitmapUnit:=(TXPrivDisplay(dpy))^.bitmap_unit;
end;
function BitmapBitOrder(dpy : longint) : longint;
begin
  BitmapBitOrder:=(TXPrivDisplay(dpy))^.bitmap_bit_order;
end;
function BitmapPad(dpy : longint) : longint;
begin
  BitmapPad:=(TXPrivDisplay(dpy))^.bitmap_pad;
end;
function ImageByteOrder(dpy : longint) : longint;
begin
  ImageByteOrder:=(TXPrivDisplay(dpy))^.byte_order;
end;
function NextRequest(dpy : longint) : longint;
begin
  NextRequest:=((TXPrivDisplay(dpy))^.request)+1;
end;
function LastKnownRequestProcessed(dpy : longint) : longint;
begin
  LastKnownRequestProcessed:=(TXPrivDisplay(dpy))^.last_request_read;
end;
function ScreenOfDisplay(dpy,scr : longint) : longint;
begin
  ScreenOfDisplay:=@((TXPrivDisplay(dpy))^.(screens[scr]));
end;
function DefaultScreenOfDisplay(dpy : longint) : longint;
begin
  DefaultScreenOfDisplay:=ScreenOfDisplay(dpy,DefaultScreen(dpy));
end;
function DisplayOfScreen(s : longint) : longint;
begin
  DisplayOfScreen:=s^.display;
end;
function RootWindowOfScreen(s : longint) : longint;
begin
  RootWindowOfScreen:=s^.root;
end;
function BlackPixelOfScreen(s : longint) : longint;
begin
  BlackPixelOfScreen:=s^.black_pixel;
end;
function WhitePixelOfScreen(s : longint) : longint;
begin
  WhitePixelOfScreen:=s^.white_pixel;
end;
function DefaultColormapOfScreen(s : longint) : longint;
begin
  DefaultColormapOfScreen:=s^.cmap;
end;
function DefaultDepthOfScreen(s : longint) : longint;
begin
  DefaultDepthOfScreen:=s^.root_depth;
end;
function DefaultGCOfScreen(s : longint) : longint;
begin
  DefaultGCOfScreen:=s^.default_gc;
end;
function DefaultVisualOfScreen(s : longint) : longint;
begin
  DefaultVisualOfScreen:=s^.root_visual;
end;
function WidthOfScreen(s : longint) : longint;
begin
  WidthOfScreen:=s^.width;
end;
function HeightOfScreen(s : longint) : longint;
begin
  HeightOfScreen:=s^.height;
end;
function WidthMMOfScreen(s : longint) : longint;
begin
  WidthMMOfScreen:=s^.mwidth;
end;
function HeightMMOfScreen(s : longint) : longint;
begin
  HeightMMOfScreen:=s^.mheight;
end;
function PlanesOfScreen(s : longint) : longint;
begin
  PlanesOfScreen:=s^.root_depth;
end;
function CellsOfScreen(s : longint) : longint;
begin
  CellsOfScreen:=(DefaultVisualOfScreen(s))^.map_entries;
end;
function MinCmapsOfScreen(s : longint) : longint;
begin
  MinCmapsOfScreen:=s^.min_maps;
end;
function MaxCmapsOfScreen(s : longint) : longint;
begin
  MaxCmapsOfScreen:=s^.max_maps;
end;
function DoesSaveUnders(s : longint) : longint;
begin
  DoesSaveUnders:=s^.save_unders;
end;
function DoesBackingStore(s : longint) : longint;
begin
  DoesBackingStore:=s^.backing_store;
end;
function EventMaskOfScreen(s : longint) : longint;
begin
  EventMaskOfScreen:=s^.root_input_mask;
end;
function XAllocID(dpy : longint) : longint;
begin
  XAllocID:=(TXPrivDisplay(dpy))^.resource_alloc(dpy);
end;


end.
