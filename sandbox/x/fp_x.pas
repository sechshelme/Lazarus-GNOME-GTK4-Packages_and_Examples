unit fp_x;

interface

type
{$IFDEF linux}
Tclong = int64;
Tculong = uint64;
{$ENDIF}

{$IFDEF windows}
Tclong = int32;
Tculong = uint32;
{$ENDIF}


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  X_PROTOCOL = 11;  
  X_PROTOCOL_REVISION = 0;
type
  PXID = ^TXID;
  TXID = Tculong;
type
  PMask = ^TMask;
  TMask = Tculong;
type
  PAtom = ^TAtom;
  TAtom = dword;
{ Also in Xdefs.h  }
{$endif}
type
  PVisualID = ^TVisualID;
  TVisualID = dword;

  PTime = ^TTime;
  TTime = dword;
{$else}
{$include <X11/Xmd.h>}
{$ifndef _XTYPEDEF_XID}
{$define _XTYPEDEF_XID}
type
  PXID = ^TXID;
  TXID = TCARD32;
{$endif}
{$ifndef _XTYPEDEF_MASK}
{$define _XTYPEDEF_MASK}
type
  PMask = ^TMask;
  TMask = TCARD32;
{$endif}
{$ifndef _XTYPEDEF_ATOM}
{$define _XTYPEDEF_ATOM}
type
  PAtom = ^TAtom;
  TAtom = TCARD32;
{$endif}
type
  PVisualID = ^TVisualID;
  TVisualID = TCARD32;

  PTime = ^TTime;
  TTime = TCARD32;
{$endif}
type
  PWindow = ^TWindow;
  TWindow = TXID;

  PDrawable = ^TDrawable;
  TDrawable = TXID;
{$ifndef _XTYPEDEF_FONT}
{$define _XTYPEDEF_FONT}
type
  PFont = ^TFont;
  TFont = TXID;
{$endif}
type
  PPixmap = ^TPixmap;
  TPixmap = TXID;

  PCursor = ^TCursor;
  TCursor = TXID;

  PColormap = ^TColormap;
  TColormap = TXID;

  PGContext = ^TGContext;
  TGContext = TXID;

  PKeySym = ^TKeySym;
  TKeySym = TXID;

  PKeyCode = ^TKeyCode;
  TKeyCode = byte;
{****************************************************************
 * RESERVED RESOURCE AND CONSTANT DEFINITIONS
 **************************************************************** }
{$ifndef None}
{ universal null resource or null atom  }

const
  None = 0;  
{$endif}
{ background pixmap in CreateWindow
				    and ChangeWindowAttributes  }

const
  ParentRelative = 1;  
{ border pixmap in CreateWindow
				       and ChangeWindowAttributes
				   special VisualID and special window
				       class passed to CreateWindow  }
  CopyFromParent = 0;  
{ destination window in SendEvent  }
  PointerWindow = 0;  
{ destination window in SendEvent  }
  InputFocus = 1;  
{ focus window in SetInputFocus  }
  PointerRoot = 1;  
{ special Atom, passed to GetProperty  }
  AnyPropertyType = 0;  
{ special Key Code, passed to GrabKey  }
  AnyKey = 0;  
{ special Button Code, passed to GrabButton  }
  AnyButton = 0;  
{ special Resource ID passed to KillClient  }
  AllTemporary = 0;  
{ special Time  }
  CurrentTime = 0;  
{ special KeySym  }
  NoSymbol = 0;  
{****************************************************************
 * EVENT DEFINITIONS
 **************************************************************** }
{ Input Event Masks. Used as event-mask window attribute and as arguments
   to Grab requests.  Not to be confused with event names.   }
  NoEventMask = 0;  
  KeyPressMask = 1 shl 0;  
  KeyReleaseMask = 1 shl 1;  
  ButtonPressMask = 1 shl 2;  
  ButtonReleaseMask = 1 shl 3;  
  EnterWindowMask = 1 shl 4;  
  LeaveWindowMask = 1 shl 5;  
  PointerMotionMask = 1 shl 6;  
  PointerMotionHintMask = 1 shl 7;  
  Button1MotionMask = 1 shl 8;  
  Button2MotionMask = 1 shl 9;  
  Button3MotionMask = 1 shl 10;  
  Button4MotionMask = 1 shl 11;  
  Button5MotionMask = 1 shl 12;  
  ButtonMotionMask = 1 shl 13;  
  KeymapStateMask = 1 shl 14;  
  ExposureMask = 1 shl 15;  
  VisibilityChangeMask = 1 shl 16;  
  StructureNotifyMask = 1 shl 17;  
  ResizeRedirectMask = 1 shl 18;  
  SubstructureNotifyMask = 1 shl 19;  
  SubstructureRedirectMask = 1 shl 20;  
  FocusChangeMask = 1 shl 21;  
  PropertyChangeMask = 1 shl 22;  
  ColormapChangeMask = 1 shl 23;  
  OwnerGrabButtonMask = 1 shl 24;  
{ Event names.  Used in "type" field in XEvent structures.  Not to be
confused with event masks above.  They start from 2 because 0 and 1
are reserved in the protocol for errors and replies.  }
  KeyPress = 2;  
  KeyRelease = 3;  
  ButtonPress = 4;  
  ButtonRelease = 5;  
  MotionNotify = 6;  
  EnterNotify = 7;  
  LeaveNotify = 8;  
  FocusIn = 9;  
  FocusOut = 10;  
  KeymapNotify = 11;  
  Expose = 12;  
  GraphicsExpose = 13;  
  NoExpose = 14;  
  VisibilityNotify = 15;  
  CreateNotify = 16;  
  DestroyNotify = 17;  
  UnmapNotify = 18;  
  MapNotify = 19;  
  MapRequest = 20;  
  ReparentNotify = 21;  
  ConfigureNotify = 22;  
  ConfigureRequest = 23;  
  GravityNotify = 24;  
  ResizeRequest = 25;  
  CirculateNotify = 26;  
  CirculateRequest = 27;  
  PropertyNotify = 28;  
  SelectionClear = 29;  
  SelectionRequest = 30;  
  SelectionNotify = 31;  
  ColormapNotify = 32;  
  ClientMessage = 33;  
  MappingNotify = 34;  
  GenericEvent = 35;  
{ must be bigger than any event #  }
  LASTEvent = 36;  
{ Key masks. Used as modifiers to GrabButton and GrabKey, results of QueryPointer,
   state in various key-, mouse-, and button-related events.  }
  ShiftMask = 1 shl 0;  
  LockMask = 1 shl 1;  
  ControlMask = 1 shl 2;  
  Mod1Mask = 1 shl 3;  
  Mod2Mask = 1 shl 4;  
  Mod3Mask = 1 shl 5;  
  Mod4Mask = 1 shl 6;  
  Mod5Mask = 1 shl 7;  
{ modifier names.  Used to build a SetModifierMapping request or
   to read a GetModifierMapping request.  These correspond to the
   masks defined above.  }
  ShiftMapIndex = 0;  
  LockMapIndex = 1;  
  ControlMapIndex = 2;  
  Mod1MapIndex = 3;  
  Mod2MapIndex = 4;  
  Mod3MapIndex = 5;  
  Mod4MapIndex = 6;  
  Mod5MapIndex = 7;  
{ button masks.  Used in same manner as Key masks above. Not to be confused
   with button names below.  }
  Button1Mask = 1 shl 8;  
  Button2Mask = 1 shl 9;  
  Button3Mask = 1 shl 10;  
  Button4Mask = 1 shl 11;  
  Button5Mask = 1 shl 12;  
{ used in GrabButton, GrabKey  }
  AnyModifier = 1 shl 15;  
{ button names. Used as arguments to GrabButton and as detail in ButtonPress
   and ButtonRelease events.  Not to be confused with button masks above.
   Note that 0 is already defined above as "AnyButton".   }
  Button1 = 1;  
  Button2 = 2;  
  Button3 = 3;  
  Button4 = 4;  
  Button5 = 5;  
{ Notify modes  }
  NotifyNormal = 0;  
  NotifyGrab = 1;  
  NotifyUngrab = 2;  
  NotifyWhileGrabbed = 3;  
{ for MotionNotify events  }
  NotifyHint = 1;  
{ Notify detail  }
  NotifyAncestor = 0;  
  NotifyVirtual = 1;  
  NotifyInferior = 2;  
  NotifyNonlinear = 3;  
  NotifyNonlinearVirtual = 4;  
  NotifyPointer = 5;  
  NotifyPointerRoot = 6;  
  NotifyDetailNone = 7;  
{ Visibility notify  }
  VisibilityUnobscured = 0;  
  VisibilityPartiallyObscured = 1;  
  VisibilityFullyObscured = 2;  
{ Circulation request  }
  PlaceOnTop = 0;  
  PlaceOnBottom = 1;  
{ protocol families  }
{ IPv4  }
  FamilyInternet = 0;  
  FamilyDECnet = 1;  
  FamilyChaos = 2;  
{ IPv6  }
  FamilyInternet6 = 6;  
{ authentication families not tied to a specific protocol  }
  FamilyServerInterpreted = 5;  
{ Property notification  }
  PropertyNewValue = 0;  
  PropertyDelete = 1;  
{ Color Map notification  }
  ColormapUninstalled = 0;  
  ColormapInstalled = 1;  
{ GrabPointer, GrabButton, GrabKeyboard, GrabKey Modes  }
  GrabModeSync = 0;  
  GrabModeAsync = 1;  
{ GrabPointer, GrabKeyboard reply status  }
  GrabSuccess = 0;  
  AlreadyGrabbed = 1;  
  GrabInvalidTime = 2;  
  GrabNotViewable = 3;  
  GrabFrozen = 4;  
{ AllowEvents modes  }
  AsyncPointer = 0;  
  SyncPointer = 1;  
  ReplayPointer = 2;  
  AsyncKeyboard = 3;  
  SyncKeyboard = 4;  
  ReplayKeyboard = 5;  
  AsyncBoth = 6;  
  SyncBoth = 7;  
{ Used in SetInputFocus, GetInputFocus  }

{ was #define dname def_expr }
function RevertToNone : longint;  

{ was #define dname def_expr }
function RevertToPointerRoot : longint;  

const
  RevertToParent = 2;  
{****************************************************************
 * ERROR CODES
 **************************************************************** }
{ everything's okay  }
  Success = 0;  
{ bad request code  }
  BadRequest = 1;  
{ int parameter out of range  }
  BadValue = 2;  
{ parameter not a Window  }
  BadWindow = 3;  
{ parameter not a Pixmap  }
  BadPixmap = 4;  
{ parameter not an Atom  }
  BadAtom = 5;  
{ parameter not a Cursor  }
  BadCursor = 6;  
{ parameter not a Font  }
  BadFont = 7;  
{ parameter mismatch  }
  BadMatch = 8;  
{ parameter not a Pixmap or Window  }
  BadDrawable = 9;  
{ depending on context:
				 - key/button already grabbed
				 - attempt to free an illegal
				   cmap entry
				- attempt to store into a read-only
				   color map entry.
 				- attempt to modify the access control
				   list from other than the local host.
				 }
  BadAccess = 10;  
{ insufficient resources  }
  BadAlloc = 11;  
{ no such colormap  }
  BadColor = 12;  
{ parameter not a GC  }
  BadGC = 13;  
{ choice not in range or already used  }
  BadIDChoice = 14;  
{ font or color name doesn't exist  }
  BadName = 15;  
{ Request length incorrect  }
  BadLength = 16;  
{ server is defective  }
  BadImplementation = 17;  
  FirstExtensionError = 128;  
  LastExtensionError = 255;  
{****************************************************************
 * WINDOW DEFINITIONS
 **************************************************************** }
{ Window classes used by CreateWindow  }
{ Note that CopyFromParent is already defined as 0 above  }
  InputOutput = 1;  
  InputOnly = 2;  
{ Window attributes for CreateWindow and ChangeWindowAttributes  }
  CWBackPixmap = 1 shl 0;  
  CWBackPixel = 1 shl 1;  
  CWBorderPixmap = 1 shl 2;  
  CWBorderPixel = 1 shl 3;  
  CWBitGravity = 1 shl 4;  
  CWWinGravity = 1 shl 5;  
  CWBackingStore = 1 shl 6;  
  CWBackingPlanes = 1 shl 7;  
  CWBackingPixel = 1 shl 8;  
  CWOverrideRedirect = 1 shl 9;  
  CWSaveUnder = 1 shl 10;  
  CWEventMask = 1 shl 11;  
  CWDontPropagate = 1 shl 12;  
  CWColormap = 1 shl 13;  
  CWCursor = 1 shl 14;  
{ ConfigureWindow structure  }
  CWX = 1 shl 0;  
  CWY = 1 shl 1;  
  CWWidth = 1 shl 2;  
  CWHeight = 1 shl 3;  
  CWBorderWidth = 1 shl 4;  
  CWSibling = 1 shl 5;  
  CWStackMode = 1 shl 6;  
{ Bit Gravity  }
  ForgetGravity = 0;  
  NorthWestGravity = 1;  
  NorthGravity = 2;  
  NorthEastGravity = 3;  
  WestGravity = 4;  
  CenterGravity = 5;  
  EastGravity = 6;  
  SouthWestGravity = 7;  
  SouthGravity = 8;  
  SouthEastGravity = 9;  
  StaticGravity = 10;  
{ Window gravity + bit gravity above  }
  UnmapGravity = 0;  
{ Used in CreateWindow for backing-store hint  }
  NotUseful = 0;  
  WhenMapped = 1;  
  Always = 2;  
{ Used in GetWindowAttributes reply  }
  IsUnmapped = 0;  
  IsUnviewable = 1;  
  IsViewable = 2;  
{ Used in ChangeSaveSet  }
  SetModeInsert = 0;  
  SetModeDelete = 1;  
{ Used in ChangeCloseDownMode  }
  DestroyAll = 0;  
  RetainPermanent = 1;  
  RetainTemporary = 2;  
{ Window stacking method (in configureWindow)  }
  Above = 0;  
  Below = 1;  
  TopIf = 2;  
  BottomIf = 3;  
  Opposite = 4;  
{ Circulation direction  }
  RaiseLowest = 0;  
  LowerHighest = 1;  
{ Property modes  }
  PropModeReplace = 0;  
  PropModePrepend = 1;  
  PropModeAppend = 2;  
{****************************************************************
 * GRAPHICS DEFINITIONS
 **************************************************************** }
{ graphics functions, as in GC.alu  }
{ 0  }
  GXclear = $0;  
{ src AND dst  }
  GXand = $1;  
{ src AND NOT dst  }
  GXandReverse = $2;  
{ src  }
  GXcopy = $3;  
{ NOT src AND dst  }
  GXandInverted = $4;  
{ dst  }
  GXnoop = $5;  
{ src XOR dst  }
  GXxor = $6;  
{ src OR dst  }
  GXor = $7;  
{ NOT src AND NOT dst  }
  GXnor = $8;  
{ NOT src XOR dst  }
  GXequiv = $9;  
{ NOT dst  }
  GXinvert = $a;  
{ src OR NOT dst  }
  GXorReverse = $b;  
{ NOT src  }
  GXcopyInverted = $c;  
{ NOT src OR dst  }
  GXorInverted = $d;  
{ NOT src OR NOT dst  }
  GXnand = $e;  
{ 1  }
  GXset = $f;  
{ LineStyle  }
  LineSolid = 0;  
  LineOnOffDash = 1;  
  LineDoubleDash = 2;  
{ capStyle  }
  CapNotLast = 0;  
  CapButt = 1;  
  CapRound = 2;  
  CapProjecting = 3;  
{ joinStyle  }
  JoinMiter = 0;  
  JoinRound = 1;  
  JoinBevel = 2;  
{ fillStyle  }
  FillSolid = 0;  
  FillTiled = 1;  
  FillStippled = 2;  
  FillOpaqueStippled = 3;  
{ fillRule  }
  EvenOddRule = 0;  
  WindingRule = 1;  
{ subwindow mode  }
  ClipByChildren = 0;  
  IncludeInferiors = 1;  
{ SetClipRectangles ordering  }
  Unsorted = 0;  
  YSorted = 1;  
  YXSorted = 2;  
  YXBanded = 3;  
{ CoordinateMode for drawing routines  }
{ relative to the origin  }
  CoordModeOrigin = 0;  
{ relative to previous point  }
  CoordModePrevious = 1;  
{ Polygon shapes  }
{ paths may intersect  }
  Complex = 0;  
{ no paths intersect, but not convex  }
  Nonconvex = 1;  
{ wholly convex  }
  Convex = 2;  
{ Arc modes for PolyFillArc  }
{ join endpoints of arc  }
  ArcChord = 0;  
{ join endpoints to center of arc  }
  ArcPieSlice = 1;  
{ GC components: masks used in CreateGC, CopyGC, ChangeGC, OR'ed into
   GC.stateChanges  }
  GCFunction = 1 shl 0;  
  GCPlaneMask = 1 shl 1;  
  GCForeground = 1 shl 2;  
  GCBackground = 1 shl 3;  
  GCLineWidth = 1 shl 4;  
  GCLineStyle = 1 shl 5;  
  GCCapStyle = 1 shl 6;  
  GCJoinStyle = 1 shl 7;  
  GCFillStyle = 1 shl 8;  
  GCFillRule = 1 shl 9;  
  GCTile = 1 shl 10;  
  GCStipple = 1 shl 11;  
  GCTileStipXOrigin = 1 shl 12;  
  GCTileStipYOrigin = 1 shl 13;  
  GCFont = 1 shl 14;  
  GCSubwindowMode = 1 shl 15;  
  GCGraphicsExposures = 1 shl 16;  
  GCClipXOrigin = 1 shl 17;  
  GCClipYOrigin = 1 shl 18;  
  GCClipMask = 1 shl 19;  
  GCDashOffset = 1 shl 20;  
  GCDashList = 1 shl 21;  
  GCArcMode = 1 shl 22;  
  GCLastBit = 22;  
{****************************************************************
 * FONTS
 **************************************************************** }
{ used in QueryFont -- draw direction  }
  FontLeftToRight = 0;  
  FontRightToLeft = 1;  
  FontChange = 255;  
{****************************************************************
 *  IMAGING
 **************************************************************** }
{ ImageFormat -- PutImage, GetImage  }
{ depth 1, XYFormat  }
  XYBitmap = 0;  
{ depth == drawable depth  }
  XYPixmap = 1;  
{ depth == drawable depth  }
  ZPixmap = 2;  
{****************************************************************
 *  COLOR MAP STUFF
 **************************************************************** }
{ For CreateColormap  }
{ create map with no entries  }
  AllocNone = 0;  
{ allocate entire map writeable  }
  AllocAll = 1;  
{ Flags used in StoreNamedColor, StoreColors  }
  DoRed = 1 shl 0;  
  DoGreen = 1 shl 1;  
  DoBlue = 1 shl 2;  
{****************************************************************
 * CURSOR STUFF
 **************************************************************** }
{ QueryBestSize Class  }
{ largest size that can be displayed  }
  CursorShape = 0;  
{ size tiled fastest  }
  TileShape = 1;  
{ size stippled fastest  }
  StippleShape = 2;  
{****************************************************************
 * KEYBOARD/POINTER STUFF
 **************************************************************** }
  AutoRepeatModeOff = 0;  
  AutoRepeatModeOn = 1;  
  AutoRepeatModeDefault = 2;  
  LedModeOff = 0;  
  LedModeOn = 1;  
{ masks for ChangeKeyboardControl  }
  KBKeyClickPercent = 1 shl 0;  
  KBBellPercent = 1 shl 1;  
  KBBellPitch = 1 shl 2;  
  KBBellDuration = 1 shl 3;  
  KBLed = 1 shl 4;  
  KBLedMode = 1 shl 5;  
  KBKey = 1 shl 6;  
  KBAutoRepeatMode = 1 shl 7;  
  MappingSuccess = 0;  
  MappingBusy = 1;  
  MappingFailed = 2;  
  MappingModifier = 0;  
  MappingKeyboard = 1;  
  MappingPointer = 2;  
{****************************************************************
 * SCREEN SAVER STUFF
 **************************************************************** }
  DontPreferBlanking = 0;  
  PreferBlanking = 1;  
  DefaultBlanking = 2;  
  DisableScreenSaver = 0;  
  DisableScreenInterval = 0;  
  DontAllowExposures = 0;  
  AllowExposures = 1;  
  DefaultExposures = 2;  
{ for ForceScreenSaver  }
  ScreenSaverReset = 0;  
  ScreenSaverActive = 1;  
{****************************************************************
 * HOSTS AND CONNECTIONS
 **************************************************************** }
{ for ChangeHosts  }
  HostInsert = 0;  
  HostDelete = 1;  
{ for ChangeAccessControl  }
  EnableAccess = 1;  
  DisableAccess = 0;  
{ Display classes  used in opening the connection
 * Note that the statically allocated ones are even numbered and the
 * dynamically changeable ones are odd numbered  }
  StaticGray = 0;  
  GrayScale = 1;  
  StaticColor = 2;  
  PseudoColor = 3;  
  TrueColor = 4;  
  DirectColor = 5;  
{ Byte order  used in imageByteOrder and bitmapBitOrder  }
  LSBFirst = 0;  
  MSBFirst = 1;  
{$endif}
{ X_H  }

// === Konventiert am: 9-12-25 13:24:29 ===


implementation


{ was #define dname def_expr }
function RevertToNone : longint;
  begin
    RevertToNone:=longint(None);
  end;

{ was #define dname def_expr }
function RevertToPointerRoot : longint;
  begin
    RevertToPointerRoot:=longint(PointerRoot);
  end;


end.
