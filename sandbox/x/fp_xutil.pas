unit fp_xutil;

interface

uses
  fp_x11;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



const
  NoValue = $0000;  
  XValue = $0001;  
  YValue = $0002;  
  WidthValue = $0004;  
  HeightValue = $0008;  
  AllValues = $000F;  
  XNegative = $0010;  
  YNegative = $0020;  
{
 * new version containing base_width, base_height, and win_gravity fields;
 * used with WM_NORMAL_HINTS.
  }
{ marks which fields in this structure are defined  }
{ obsolete for new window mgrs, but clients  }
{ should set so old wm's don't mess up  }
{ numerator  }
{ denominator  }
{ added by ICCCM version 1  }
{ added by ICCCM version 1  }
type
  PXSizeHints = ^TXSizeHints;
  TXSizeHints = record
      flags : longint;
      x : longint;
      y : longint;
      width : longint;
      height : longint;
      min_width : longint;
      min_height : longint;
      max_width : longint;
      max_height : longint;
      width_inc : longint;
      height_inc : longint;
      min_aspect : record
          x : longint;
          y : longint;
        end;
      max_aspect : record
          x : longint;
          y : longint;
        end;
      base_width : longint;
      base_height : longint;
      win_gravity : longint;
    end;
{
 * The next block of definitions are for window manager properties that
 * clients and applications use for communication.
  }
{ flags argument in size hints  }
{ user specified x, y  }

const
  USPosition = 1 shl 0;  
{ user specified width, height  }
  USSize = 1 shl 1;  
{ program specified position  }
  PPosition = 1 shl 2;  
{ program specified size  }
  PSize = 1 shl 3;  
{ program specified minimum size  }
  PMinSize = 1 shl 4;  
{ program specified maximum size  }
  PMaxSize = 1 shl 5;  
{ program specified resize increments  }
  PResizeInc = 1 shl 6;  
{ program specified min and max aspect ratios  }
  PAspect = 1 shl 7;  
{ program specified base for incrementing  }
  PBaseSize = 1 shl 8;  
{ program specified window gravity  }
  PWinGravity = 1 shl 9;  
{ obsolete  }
  PAllHints = ((((PPosition or PSize) or PMinSize) or PMaxSize) or PResizeInc) or PAspect;  
{ marks which fields in this structure are defined  }
{ does this application rely on the window manager to
			get keyboard input?  }
{ see below  }
{ pixmap to be used as icon  }
{ window to be used as icon  }
{ initial position of icon  }
{ icon mask bitmap  }
{ id of related window group  }
{ this structure may be extended in the future  }
type
  PXWMHints = ^TXWMHints;
  TXWMHints = record
      flags : longint;
      input : TBool;
      initial_state : longint;
      icon_pixmap : TPixmap;
      icon_window : TWindow;
      icon_x : longint;
      icon_y : longint;
      icon_mask : TPixmap;
      window_group : TXID;
    end;
{ definition for flags of XWMHints  }

const
  InputHint = 1 shl 0;  
  StateHint = 1 shl 1;  
  IconPixmapHint = 1 shl 2;  
  IconWindowHint = 1 shl 3;  
  IconPositionHint = 1 shl 4;  
  IconMaskHint = 1 shl 5;  
  WindowGroupHint = 1 shl 6;  
  AllHints = (((((InputHint or StateHint) or IconPixmapHint) or IconWindowHint) or IconPositionHint) or IconMaskHint) or WindowGroupHint;  
  XUrgencyHint = 1 shl 8;  
{ definitions for initial window state  }
{ for windows that are not mapped  }
  WithdrawnState = 0;  
{ most applications want to start this way  }
  NormalState = 1;  
{ application wants to start as an icon  }
  IconicState = 3;  
{
 * Obsolete states no longer defined by ICCCM
  }
{ don't know or care  }
  DontCareState = 0;  
{ application wants to start zoomed  }
  ZoomState = 2;  
{ application believes it is seldom used;  }
  InactiveState = 4;  
{ some wm's may put it on inactive menu  }
{
 * new structure for manipulating TEXT properties; used with WM_NAME,
 * WM_ICON_NAME, WM_CLIENT_MACHINE, and WM_COMMAND.
  }
{ same as Property routines  }
{ prop type  }
{ prop data format: 8, 16, or 32  }
{ number of data items in value  }
type
  PXTextProperty = ^TXTextProperty;
  TXTextProperty = record
      value : Pbyte;
      encoding : TAtom;
      format : longint;
      nitems : dword;
    end;

const
  XNoMemory = -(1);  
  XLocaleNotSupported = -(2);  
  XConverterNotFound = -(3);  
{ STRING  }
{ COMPOUND_TEXT  }
{ text in owner's encoding (current locale) }
{ STRING, else COMPOUND_TEXT  }
{ The following is an XFree86 extension, introduced in November 2000  }
{ UTF8_STRING  }
type
  PXICCEncodingStyle = ^TXICCEncodingStyle;
  TXICCEncodingStyle =  Longint;
  Const
    XStringStyle = 0;
    XCompoundTextStyle = 1;
    XTextStyle = 2;
    XStdICCTextStyle = 3;
    XUTF8StringStyle = 4;
;
type
  PXIconSize = ^TXIconSize;
  TXIconSize = record
      min_width : longint;
      min_height : longint;
      max_width : longint;
      max_height : longint;
      width_inc : longint;
      height_inc : longint;
    end;

  PXClassHint = ^TXClassHint;
  TXClassHint = record
      res_name : Pchar;
      res_class : Pchar;
    end;
{$ifdef XUTIL_DEFINE_FUNCTIONS}

function XDestroyImage(ximage:PXImage):longint;cdecl;external libx;
function XGetPixel(ximage:PXImage; x:longint; y:longint):dword;cdecl;external libx;
function XPutPixel(ximage:PXImage; x:longint; y:longint; pixel:dword):longint;cdecl;external libx;
function XSubImage(ximage:PXImage; x:longint; y:longint; width:dword; height:dword):PXImage;cdecl;external libx;
function XAddPixel(ximage:PXImage; value:longint):longint;cdecl;external libx;
{$else}
{
 * These macros are used to give some sugar to the image routines so that
 * naive people are more comfortable with them.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function XDestroyImage(ximage : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XGetPixel(ximage,x,y : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XPutPixel(ximage,x,y,pixel : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XSubImage(ximage,x,y,width,height : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XAddPixel(ximage,value : longint) : longint;

{$endif}
{
 * Compose sequence status structure, used in calling XLookupString.
  }
{ state table pointer  }
{ match state  }
type
  PXComposeStatus = ^TXComposeStatus;
  TXComposeStatus = record
      compose_ptr : TXPointer;
      chars_matched : longint;
    end;
{
 * Keysym macros, used on Keysyms to test for classes of symbols
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IsKeypadKey(keysym : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsPrivateKeypadKey(keysym : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsCursorKey(keysym : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsPFKey(keysym : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsFunctionKey(keysym : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsMiscFunctionKey(keysym : longint) : longint;

{ xxxxxxxxxxxxxxx
#ifdef XK_XKB_KEYS
#define IsModifierKey(keysym) \
  ((((KeySym)(keysym) >= XK_Shift_L) && ((KeySym)(keysym) <= XK_Hyper_R)) \
   || (((KeySym)(keysym) >= XK_ISO_Lock) && \
       ((KeySym)(keysym) <= XK_ISO_Level5_Lock)) \
   || ((KeySym)(keysym) == XK_Mode_switch) \
   || ((KeySym)(keysym) == XK_Num_Lock))
#else
#define IsModifierKey(keysym) \
  ((((KeySym)(keysym) >= XK_Shift_L) && ((KeySym)(keysym) <= XK_Hyper_R)) \
   || ((KeySym)(keysym) == XK_Mode_switch) \
   || ((KeySym)(keysym) == XK_Num_Lock))
#endif
 }
{
 * opaque reference to Region data type
  }
type
  PRegion = ^TRegion;
  TRegion = PXRegion;
{ Return values from XRectInRegion()  }

const
  RectangleOut = 0;  
  RectangleIn = 1;  
  RectanglePart = 2;  
{
 * Information used by the visual utility routines to find desired visual
 * type from the many visuals a display may support.
  }
{$if defined(__cplusplus) || defined(c_plusplus)}
{ C++  }
{$else}
{$endif}
type
  PXVisualInfo = ^TXVisualInfo;
  TXVisualInfo = record
      visual : PVisual;
      visualid : TVisualID;
      screen : longint;
      depth : longint;
      c_class : longint;
      _class : longint;
      red_mask : dword;
      green_mask : dword;
      blue_mask : dword;
      colormap_size : longint;
      bits_per_rgb : longint;
    end;

const
  VisualNoMask = $0;  
  VisualIDMask = $1;  
  VisualScreenMask = $2;  
  VisualDepthMask = $4;  
  VisualClassMask = $8;  
  VisualRedMaskMask = $10;  
  VisualGreenMaskMask = $20;  
  VisualBlueMaskMask = $40;  
  VisualColormapSizeMask = $80;  
  VisualBitsPerRGBMask = $100;  
  VisualAllMask = $1FF;  
{
 * This defines a window manager property that clients may use to
 * share standard color maps of type RGB_COLOR_MAP:
  }
{ added by ICCCM version 1  }
{ added by ICCCM version 1  }
type
  PXStandardColormap = ^TXStandardColormap;
  TXStandardColormap = record
      colormap : TColormap;
      red_max : dword;
      red_mult : dword;
      green_max : dword;
      green_mult : dword;
      blue_max : dword;
      blue_mult : dword;
      base_pixel : dword;
      visualid : TVisualID;
      killid : TXID;
    end;
{ for killid field above  }

{ was #define dname def_expr }
function ReleaseByFreeingColormap : TXID;  

{
 * return codes for XReadBitmapFile and XWriteBitmapFile
  }
const
  BitmapSuccess = 0;  
  BitmapOpenFailed = 1;  
  BitmapFileInvalid = 2;  
  BitmapNoMemory = 3;  
{***************************************************************
 *
 * Context Management
 *
 *************************************************************** }
{ Associative lookup table return codes  }
{ No error.  }
  XCSUCCESS = 0;  
{ Out of memory  }
  XCNOMEM = 1;  
{ No entry in table  }
  XCNOENT = 2;  
type
  PXContext = ^TXContext;
  TXContext = longint;
{ was #define dname(params) para_def_expr }

function XUniqueContext : TXContext;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function XStringToContext(_string : longint) : TXContext;

{ The following declarations are alphabetized.  }
function XAllocClassHint:PXClassHint;cdecl;external libx;
function XAllocIconSize:PXIconSize;cdecl;external libx;
function XAllocSizeHints:PXSizeHints;cdecl;external libx;
function XAllocStandardColormap:PXStandardColormap;cdecl;external libx;
function XAllocWMHints:PXWMHints;cdecl;external libx;
{ r  }{ rect_return  }
function XClipBox(para1:TRegion; para2:PXRectangle):longint;cdecl;external libx;
function XCreateRegion:TRegion;cdecl;external libx;
function XDefaultString:Pchar;cdecl;external libx;
{ display  }{ rid  }{ context  }
function XDeleteContext(para1:PDisplay; para2:TXID; para3:TXContext):longint;cdecl;external libx;
{ r  }
function XDestroyRegion(para1:TRegion):longint;cdecl;external libx;
{ r  }
function XEmptyRegion(para1:TRegion):TBool;cdecl;external libx;
{ r1  }{ r2  }
function XEqualRegion(para1:TRegion; para2:TRegion):TBool;cdecl;external libx;
{ display  }{ rid  }{ context  }{ data_return  }
function XFindContext(para1:PDisplay; para2:TXID; para3:TXContext; para4:PXPointer):longint;cdecl;external libx;
{ display  }{ w  }{ class_hints_return  }
function XGetClassHint(para1:PDisplay; para2:TWindow; para3:PXClassHint):TStatus;cdecl;external libx;
{ display  }{ w  }{ size_list_return  }{ count_return  }
function XGetIconSizes(para1:PDisplay; para2:TWindow; para3:PPXIconSize; para4:Plongint):TStatus;cdecl;external libx;
{ display  }{ w  }{ hints_return  }
function XGetNormalHints(para1:PDisplay; para2:TWindow; para3:PXSizeHints):TStatus;cdecl;external libx;
{ display  }{ w  }{ stdcmap_return  }{ count_return  }{ property  }
function XGetRGBColormaps(para1:PDisplay; para2:TWindow; para3:PPXStandardColormap; para4:Plongint; para5:TAtom):TStatus;cdecl;external libx;
{ display  }{ w  }{ hints_return  }{ property  }
function XGetSizeHints(para1:PDisplay; para2:TWindow; para3:PXSizeHints; para4:TAtom):TStatus;cdecl;external libx;
{ display  }{ w  }{ colormap_return  }{ property  }
function XGetStandardColormap(para1:PDisplay; para2:TWindow; para3:PXStandardColormap; para4:TAtom):TStatus;cdecl;external libx;
{ display  }{ window  }{ text_prop_return  }{ property  }
function XGetTextProperty(para1:PDisplay; para2:TWindow; para3:PXTextProperty; para4:TAtom):TStatus;cdecl;external libx;
{ display  }{ vinfo_mask  }{ vinfo_template  }{ nitems_return  }
function XGetVisualInfo(para1:PDisplay; para2:longint; para3:PXVisualInfo; para4:Plongint):PXVisualInfo;cdecl;external libx;
{ display  }{ w  }{ text_prop_return  }
function XGetWMClientMachine(para1:PDisplay; para2:TWindow; para3:PXTextProperty):TStatus;cdecl;external libx;
{ display  }{ w  }
function XGetWMHints(para1:PDisplay; para2:TWindow):PXWMHints;cdecl;external libx;
{ display  }{ w  }{ text_prop_return  }
function XGetWMIconName(para1:PDisplay; para2:TWindow; para3:PXTextProperty):TStatus;cdecl;external libx;
{ display  }{ w  }{ text_prop_return  }
function XGetWMName(para1:PDisplay; para2:TWindow; para3:PXTextProperty):TStatus;cdecl;external libx;
{ display  }{ w  }{ hints_return  }{ supplied_return  }
function XGetWMNormalHints(para1:PDisplay; para2:TWindow; para3:PXSizeHints; para4:Plongint):TStatus;cdecl;external libx;
{ display  }{ w  }{ hints_return  }{ supplied_return  }{ property  }
function XGetWMSizeHints(para1:PDisplay; para2:TWindow; para3:PXSizeHints; para4:Plongint; para5:TAtom):TStatus;cdecl;external libx;
{ display  }{ w  }{ zhints_return  }
function XGetZoomHints(para1:PDisplay; para2:TWindow; para3:PXSizeHints):TStatus;cdecl;external libx;
{ sra  }{ srb  }{ dr_return  }
function XIntersectRegion(para1:TRegion; para2:TRegion; para3:TRegion):longint;cdecl;external libx;
{ sym  }{ lower  }{ upper  }
procedure XConvertCase(para1:TKeySym; para2:PKeySym; para3:PKeySym);cdecl;external libx;
{ event_struct  }{ buffer_return  }{ bytes_buffer  }{ keysym_return  }{ status_in_out  }
function XLookupString(para1:PXKeyEvent; para2:Pchar; para3:longint; para4:PKeySym; para5:PXComposeStatus):longint;cdecl;external libx;
{ display  }{ screen  }{ depth  }{ class  }{ vinfo_return  }
function XMatchVisualInfo(para1:PDisplay; para2:longint; para3:longint; para4:longint; para5:PXVisualInfo):TStatus;cdecl;external libx;
{ r  }{ dx  }{ dy  }
function XOffsetRegion(para1:TRegion; para2:longint; para3:longint):longint;cdecl;external libx;
{ r  }{ x  }{ y  }
function XPointInRegion(para1:TRegion; para2:longint; para3:longint):TBool;cdecl;external libx;
{ points  }{ n  }{ fill_rule  }
function XPolygonRegion(para1:PXPoint; para2:longint; para3:longint):TRegion;cdecl;external libx;
{ r  }{ x  }{ y  }{ width  }{ height  }
function XRectInRegion(para1:TRegion; para2:longint; para3:longint; para4:dword; para5:dword):longint;cdecl;external libx;
{ display  }{ rid  }{ context  }(* Const before type ignored *)
{ data  }
function XSaveContext(para1:PDisplay; para2:TXID; para3:TXContext; para4:Pchar):longint;cdecl;external libx;
{ display  }{ w  }{ class_hints  }
function XSetClassHint(para1:PDisplay; para2:TWindow; para3:PXClassHint):longint;cdecl;external libx;
{ display  }{ w  }{ size_list  }{ count  }
function XSetIconSizes(para1:PDisplay; para2:TWindow; para3:PXIconSize; para4:longint):longint;cdecl;external libx;
{ display  }{ w  }{ hints  }
function XSetNormalHints(para1:PDisplay; para2:TWindow; para3:PXSizeHints):longint;cdecl;external libx;
{ display  }{ w  }{ stdcmaps  }{ count  }{ property  }
procedure XSetRGBColormaps(para1:PDisplay; para2:TWindow; para3:PXStandardColormap; para4:longint; para5:TAtom);cdecl;external libx;
{ display  }{ w  }{ hints  }{ property  }
function XSetSizeHints(para1:PDisplay; para2:TWindow; para3:PXSizeHints; para4:TAtom):longint;cdecl;external libx;
{ display  }{ w  }(* Const before type ignored *)
{ window_name  }(* Const before type ignored *)
{ icon_name  }{ icon_pixmap  }{ argv  }{ argc  }{ hints  }
function XSetStandardProperties(para1:PDisplay; para2:TWindow; para3:Pchar; para4:Pchar; para5:TPixmap; 
           para6:PPchar; para7:longint; para8:PXSizeHints):longint;cdecl;external libx;
{ display  }{ w  }{ text_prop  }{ property  }
procedure XSetTextProperty(para1:PDisplay; para2:TWindow; para3:PXTextProperty; para4:TAtom);cdecl;external libx;
{ display  }{ w  }{ text_prop  }
procedure XSetWMClientMachine(para1:PDisplay; para2:TWindow; para3:PXTextProperty);cdecl;external libx;
{ display  }{ w  }{ wm_hints  }
function XSetWMHints(para1:PDisplay; para2:TWindow; para3:PXWMHints):longint;cdecl;external libx;
{ display  }{ w  }{ text_prop  }
procedure XSetWMIconName(para1:PDisplay; para2:TWindow; para3:PXTextProperty);cdecl;external libx;
{ display  }{ w  }{ text_prop  }
procedure XSetWMName(para1:PDisplay; para2:TWindow; para3:PXTextProperty);cdecl;external libx;
{ display  }{ w  }{ hints  }
procedure XSetWMNormalHints(para1:PDisplay; para2:TWindow; para3:PXSizeHints);cdecl;external libx;
{ display  }{ w  }{ window_name  }{ icon_name  }{ argv  }{ argc  }{ normal_hints  }{ wm_hints  }{ class_hints  }
procedure XSetWMProperties(para1:PDisplay; para2:TWindow; para3:PXTextProperty; para4:PXTextProperty; para5:PPchar; 
            para6:longint; para7:PXSizeHints; para8:PXWMHints; para9:PXClassHint);cdecl;external libx;
{ display  }{ w  }(* Const before type ignored *)
{ window_name  }(* Const before type ignored *)
{ icon_name  }{ argv  }{ argc  }{ normal_hints  }{ wm_hints  }{ class_hints  }
procedure XmbSetWMProperties(para1:PDisplay; para2:TWindow; para3:Pchar; para4:Pchar; para5:PPchar; 
            para6:longint; para7:PXSizeHints; para8:PXWMHints; para9:PXClassHint);cdecl;external libx;
{ display  }{ w  }(* Const before type ignored *)
{ window_name  }(* Const before type ignored *)
{ icon_name  }{ argv  }{ argc  }{ normal_hints  }{ wm_hints  }{ class_hints  }
procedure Xutf8SetWMProperties(para1:PDisplay; para2:TWindow; para3:Pchar; para4:Pchar; para5:PPchar; 
            para6:longint; para7:PXSizeHints; para8:PXWMHints; para9:PXClassHint);cdecl;external libx;
{ display  }{ w  }{ hints  }{ property  }
procedure XSetWMSizeHints(para1:PDisplay; para2:TWindow; para3:PXSizeHints; para4:TAtom);cdecl;external libx;
{ display  }{ gc  }{ r  }
function XSetRegion(para1:PDisplay; para2:TGC; para3:TRegion):longint;cdecl;external libx;
{ display  }{ w  }{ colormap  }{ property  }
procedure XSetStandardColormap(para1:PDisplay; para2:TWindow; para3:PXStandardColormap; para4:TAtom);cdecl;external libx;
{ display  }{ w  }{ zhints  }
function XSetZoomHints(para1:PDisplay; para2:TWindow; para3:PXSizeHints):longint;cdecl;external libx;
{ r  }{ dx  }{ dy  }
function XShrinkRegion(para1:TRegion; para2:longint; para3:longint):longint;cdecl;external libx;
{ list  }{ count  }{ text_prop_return  }
function XStringListToTextProperty(para1:PPchar; para2:longint; para3:PXTextProperty):TStatus;cdecl;external libx;
{ sra  }{ srb  }{ dr_return  }
function XSubtractRegion(para1:TRegion; para2:TRegion; para3:TRegion):longint;cdecl;external libx;
function XmbTextListToTextProperty(display:PDisplay; list:PPchar; count:longint; style:TXICCEncodingStyle; text_prop_return:PXTextProperty):longint;cdecl;external libx;
function XwcTextListToTextProperty(display:PDisplay; list:PPwchar_t; count:longint; style:TXICCEncodingStyle; text_prop_return:PXTextProperty):longint;cdecl;external libx;
function Xutf8TextListToTextProperty(display:PDisplay; list:PPchar; count:longint; style:TXICCEncodingStyle; text_prop_return:PXTextProperty):longint;cdecl;external libx;
procedure XwcFreeStringList(list:PPwchar_t);cdecl;external libx;
{ text_prop  }{ list_return  }{ count_return  }
function XTextPropertyToStringList(para1:PXTextProperty; para2:PPPchar; para3:Plongint):TStatus;cdecl;external libx;
function XmbTextPropertyToTextList(display:PDisplay; text_prop:PXTextProperty; list_return:PPPchar; count_return:Plongint):longint;cdecl;external libx;
function XwcTextPropertyToTextList(display:PDisplay; text_prop:PXTextProperty; list_return:PPPwchar_t; count_return:Plongint):longint;cdecl;external libx;
function Xutf8TextPropertyToTextList(display:PDisplay; text_prop:PXTextProperty; list_return:PPPchar; count_return:Plongint):longint;cdecl;external libx;
{ rectangle  }{ src_region  }{ dest_region_return  }
function XUnionRectWithRegion(para1:PXRectangle; para2:TRegion; para3:TRegion):longint;cdecl;external libx;
{ sra  }{ srb  }{ dr_return  }
function XUnionRegion(para1:TRegion; para2:TRegion; para3:TRegion):longint;cdecl;external libx;
{ display  }{ screen_number  }(* Const before type ignored *)
{ user_geometry  }(* Const before type ignored *)
{ default_geometry  }{ border_width  }{ hints  }{ x_return  }{ y_return  }{ width_return  }{ height_return  }{ gravity_return  }
function XWMGeometry(para1:PDisplay; para2:longint; para3:Pchar; para4:Pchar; para5:dword; 
           para6:PXSizeHints; para7:Plongint; para8:Plongint; para9:Plongint; para10:Plongint; 
           para11:Plongint):longint;cdecl;external libx;
{ sra  }{ srb  }{ dr_return  }
function XXorRegion(para1:TRegion; para2:TRegion; para3:TRegion):longint;cdecl;external libx;
{$ifdef __clang__}
(** unsupported pragma#pragma clang diagnostic pop*)
{$endif}
{$endif}
{ _X11_XUTIL_H_  }

// === Konventiert am: 10-12-25 16:02:20 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XDestroyImage(ximage : longint) : longint;
begin
  XDestroyImage:=ximage^.(f.destroy_image)(ximage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XGetPixel(ximage,x,y : longint) : longint;
begin
  XGetPixel:=ximage^.(f.get_pixel)(ximagexy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XPutPixel(ximage,x,y,pixel : longint) : longint;
begin
  XPutPixel:=ximage^.(f.put_pixel)(ximagexypixel);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XSubImage(ximage,x,y,width,height : longint) : longint;
begin
  XSubImage:=ximage^.(f.sub_image)(ximagexywidthheight);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XAddPixel(ximage,value : longint) : longint;
begin
  XAddPixel:=ximage^.(f.add_pixel)(ximagevalue);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsKeypadKey(keysym : longint) : longint;
begin
  IsKeypadKey:=((TKeySym(keysym))>=XK_KP_Space) and (@((TKeySym(keysym))<=XK_KP_Equal));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsPrivateKeypadKey(keysym : longint) : longint;
begin
  IsPrivateKeypadKey:=((TKeySym(keysym))>=$11000000) and (@((TKeySym(keysym))<=$1100FFFF));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsCursorKey(keysym : longint) : longint;
begin
  IsCursorKey:=((TKeySym(keysym))>=XK_Home) and (@((TKeySym(keysym))<XK_Select));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsPFKey(keysym : longint) : longint;
begin
  IsPFKey:=((TKeySym(keysym))>=XK_KP_F1) and (@((TKeySym(keysym))<=XK_KP_F4));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsFunctionKey(keysym : longint) : longint;
begin
  IsFunctionKey:=((TKeySym(keysym))>=XK_F1) and (@((TKeySym(keysym))<=XK_F35));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IsMiscFunctionKey(keysym : longint) : longint;
begin
  IsMiscFunctionKey:=((TKeySym(keysym))>=XK_Select) and (@((TKeySym(keysym))<=XK_Break));
end;

{ was #define dname def_expr }
function ReleaseByFreeingColormap : TXID;
  begin
    ReleaseByFreeingColormap:=TXID(1);
  end;

{ was #define dname(params) para_def_expr }
function XUniqueContext : TXContext;
begin
  XUniqueContext:=TXContext(XrmUniqueQuark);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function XStringToContext(_string : longint) : TXContext;
begin
  XStringToContext:=TXContext(XrmStringToQuark(_string));
end;


end.
