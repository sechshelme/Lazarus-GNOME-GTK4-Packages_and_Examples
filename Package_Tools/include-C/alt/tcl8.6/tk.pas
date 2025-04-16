unit tk;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * tk.h --
 *
 *	Declarations for Tk-related things that are visible outside of the Tk
 *	module itself.
 *
 * Copyright (c) 1989-1994 The Regents of the University of California.
 * Copyright (c) 1994 The Australian National University.
 * Copyright (c) 1994-1998 Sun Microsystems, Inc.
 * Copyright (c) 1998-2000 Ajuba Solutions.
 *
 * See the file "license.terms" for information on usage and redistribution of
 * this file, and for a DISCLAIMER OF ALL WARRANTIES.
  }
{$ifndef _TK}
{$define _TK}
{$include <tcl.h>}
{$if (TCL_MAJOR_VERSION != 8) || (TCL_MINOR_VERSION < 6)}
{$error Tk 8.6 must be compiled with tcl.h from Tcl 8.6 or better}
{$endif}
{
 * Utility macros: STRINGIFY takes an argument and wraps it in "" (double
 * quotation marks), JOIN joins two arguments.
  }
{
 * For C++ compilers, use extern "C"
  }
{ C++ extern C conditionnal removed }
{
 * When version numbers change here, you must also go into the following files
 * and update the version numbers:
 *
 * library/tk.tcl	(1 LOC patch)
 * unix/configure.in	(2 LOC Major, 2 LOC minor, 1 LOC patch)
 * win/configure.in	(as above)
 * README		(sections 0 and 1)
 * macosx/Tk-Common.xcconfig (not patchlevel) 1 LOC
 * win/README		(not patchlevel)
 * unix/README		(not patchlevel)
 * unix/tk.spec		(1 LOC patch)
 * win/tcl.m4		(not patchlevel)
 *
 * You may also need to update some of these files when the numbers change for
 * the version of Tcl that this release of Tk is compiled against.
  }

const
  TK_MAJOR_VERSION = 8;  
  TK_MINOR_VERSION = 6;  
  TK_RELEASE_LEVEL = TCL_FINAL_RELEASE;  
  TK_RELEASE_SERIAL = 14;  
  TK_VERSION = '8.6';  
  TK_PATCH_LEVEL = '8.6.14';  
{
 * A special definition used to allow this header file to be included from
 * windows or mac resource files so that they can obtain version information.
 * RC_INVOKED is defined by default by the windows RC tool and manually set
 * for macintosh.
 *
 * Resource compilers don't like all the C stuff, like typedefs and procedure
 * declarations, that occur below, so block them out.
  }
{$ifndef RC_INVOKED}
{
 *----------------------------------------------------------------------
 *
 * Decide whether or not to use input methods.
  }
{$if defined(XNQueryInputStyle) && !defined(_WIN32) && !defined(MAC_OSX_TK)}
{$define TK_USE_INPUT_METHODS}
{$endif}
{
 * Dummy types that are used by clients:
  }

const
  Tk_ImageModel = Tk_ImageMaster;  
type
  PTk_BindingTable = ^TTk_BindingTable;
  TTk_BindingTable = PTk_BindingTable_;

  PTk_Canvas = ^TTk_Canvas;
  TTk_Canvas = PTk_Canvas_;

  PTk_Cursor = ^TTk_Cursor;
  TTk_Cursor = PTk_Cursor_;

  PTk_ErrorHandler = ^TTk_ErrorHandler;
  TTk_ErrorHandler = PTk_ErrorHandler_;

  PTk_Font = ^TTk_Font;
  TTk_Font = PTk_Font_;

  PTk_Image = ^TTk_Image;
  TTk_Image = PTk_Image__;

  PTk_ImageMaster = ^TTk_ImageMaster;
  TTk_ImageMaster = PTk_ImageMaster_;

  PTk_OptionTable = ^TTk_OptionTable;
  TTk_OptionTable = PTk_OptionTable_;

  PTk_PostscriptInfo = ^TTk_PostscriptInfo;
  TTk_PostscriptInfo = PTk_PostscriptInfo_;

  PTk_TextLayout = ^TTk_TextLayout;
  TTk_TextLayout = PTk_TextLayout_;

  PTk_Window = ^TTk_Window;
  TTk_Window = PTk_Window_;

  PTk_3DBorder = ^TTk_3DBorder;
  TTk_3DBorder = PTk_3DBorder_;

  PTk_Style = ^TTk_Style;
  TTk_Style = PTk_Style_;

  PTk_StyleEngine = ^TTk_StyleEngine;
  TTk_StyleEngine = PTk_StyleEngine_;

  PTk_StyledElement = ^TTk_StyledElement;
  TTk_StyledElement = PTk_StyledElement_;
{
 * Additional types exported to clients.
  }

  PTk_Uid = ^TTk_Uid;
  TTk_Uid = Pchar;
{
 *----------------------------------------------------------------------
 *
 * The enum below defines the valid types for Tk configuration options as
 * implemented by Tk_InitOptions, Tk_SetOptions, etc.
  }

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
;
{
 * Structures of the following type are used by widgets to specify their
 * configuration options. Typically each widget has a static array of these
 * structures, where each element of the array describes a single
 * configuration option. The array is passed to Tk_CreateOptionTable.
  }
{ Type of option, such as TK_OPTION_COLOR;
				 * see definitions above. Last option in table
				 * must have type TK_OPTION_END.  }
{ Name used to specify option in Tcl
				 * commands.  }
{ Name for option in option database.  }
{ Class for option in database.  }
{ Default value for option if not specified
				 * in command line, the option database, or
				 * the system.  }
{ Where in record to store a Tcl_Obj * that
				 * holds the value of this option, specified
				 * as an offset in bytes from the start of the
				 * record. Use the Tk_Offset macro to generate
				 * values for this. -1 means don't store the
				 * Tcl_Obj in the record.  }
{ Where in record to store the internal
				 * representation of the value of this option,
				 * such as an int or XColor *. This field is
				 * specified as an offset in bytes from the
				 * start of the record. Use the Tk_Offset
				 * macro to generate values for it. -1 means
				 * don't store the internal representation in
				 * the record.  }
{ Any combination of the values defined
				 * below.  }
{ An alternate place to put option-specific
				 * data. Used for the monochrome default value
				 * for colors, etc.  }
{ An arbitrary bit mask defined by the class
				 * manager; typically bits correspond to
				 * certain kinds of options such as all those
				 * that require a redisplay when they change.
				 * Tk_SetOptions returns the bit-wise OR of
				 * the typeMasks of all options that were
				 * changed.  }
type
  PTk_OptionSpec = ^TTk_OptionSpec;
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
{
 * Flag values for Tk_OptionSpec structures. These flags are shared by
 * Tk_ConfigSpec structures, so be sure to coordinate any changes carefully.
  }

const
  TK_OPTION_NULL_OK = 1 shl 0;  
  TK_OPTION_DONT_SET_DEFAULT = 1 shl 3;  
{
 * The following structure and function types are used by TK_OPTION_CUSTOM
 * options; the structure holds pointers to the functions needed by the Tk
 * option config code to handle a custom option.
  }
type
{ ????????????  Tcl_Obj * }
{ Name of the custom option.  }
{ Function to use to set a record's option
				 * value from a Tcl_Obj  }
{ Function to use to get a Tcl_Obj
				 * representation from an internal
				 * representation of an option.  }
{ Function to use to restore a saved value
				 * for the internal representation.  }
{ Function to use to free the internal
				 * representation of an option.  }
{ Arbitrary one-word value passed to the
				 * handling procs.  }

  PTk_ObjCustomOption = ^TTk_ObjCustomOption;
  TTk_ObjCustomOption = record
      name : Pchar;
      setProc : PTk_CustomOptionSetProc;
      getProc : PTk_CustomOptionGetProc;
      restoreProc : PTk_CustomOptionRestoreProc;
      freeProc : PTk_CustomOptionFreeProc;
      clientData : TClientData;
    end;
{
 * Macro to use to fill in "offset" fields of the Tk_OptionSpec structure.
 * Computes number of bytes from beginning of structure to a given field.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function Tk_Offset(_type,field : longint) : longint;

{ Workaround for platforms missing offsetof(), e.g. VC++ 6.0  }
{$ifndef offsetof}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function offsetof(_type,field : longint) : Tsize_t;

{$endif}
{
 * The following two structures are used for error handling. When config
 * options are being modified, the old values are saved in a Tk_SavedOptions
 * structure. If an error occurs, then the contents of the structure can be
 * used to restore all of the old values. The contents of this structure are
 * for the private use Tk. No-one outside Tk should ever read or write any of
 * the fields of these structures.
  }
{ Points to information that describes the
				 * option.  }
{ The old value of the option, in the form of
				 * a Tcl object; may be NULL if the value was
				 * not saved as an object.  }
{ The old value of the option, in some
				 * internal representation such as an int or
				 * (XColor *). Valid only if the field
				 * optionPtr->specPtr->objOffset is < 0. The
				 * space must be large enough to accommodate a
				 * double, a long, or a pointer; right now it
				 * looks like a double (i.e., 8 bytes) is big
				 * enough. Also, using a double guarantees
				 * that the field is properly aligned for
				 * storing large values.  }
type
  PTk_SavedOption = ^TTk_SavedOption;
  TTk_SavedOption = record
      optionPtr : PTkOption;
      valuePtr : PTcl_Obj;
      internalForm : Tdouble;
    end;
{$ifdef TCL_MEM_DEBUG}

const
  TK_NUM_SAVED_OPTIONS = 2;  
{$else}

const
  TK_NUM_SAVED_OPTIONS = 20;  
{$endif}
{ The data structure in which to restore
				 * configuration options.  }
{ Window associated with recordPtr; needed to
				 * restore certain options.  }
{ The number of valid items in items field.  }
{ Items used to hold old values.  }
{ Points to next structure in list; needed if
				 * too many options changed to hold all the
				 * old values in a single structure. NULL
				 * means no more structures.  }
type
  PTk_SavedOptions = ^TTk_SavedOptions;
  TTk_SavedOptions = record
      recordPtr : Pchar;
      tkwin : TTk_Window;
      numItems : longint;
      items : array[0..(TK_NUM_SAVED_OPTIONS)-1] of TTk_SavedOption;
      nextPtr : PTk_SavedOptions;
    end;
{
 * Structure used to describe application-specific configuration options:
 * indicates procedures to call to parse an option and to return a text string
 * describing an option. THESE ARE DEPRECATED; PLEASE USE THE NEW STRUCTURES
 * LISTED ABOVE.
  }
{
 * This is a temporary flag used while tkObjConfig and new widgets are in
 * development.
  }
{$ifndef __NO_OLD_CONFIG}
type
{ ?????????  char * }
{ Procedure to call to parse an option and
				 * store it in converted form.  }
{ Procedure to return a printable string
				 * describing an existing option.  }
{ Arbitrary one-word value used by option
				 * parser: passed to parseProc and
				 * printProc.  }

  PTk_CustomOption = ^TTk_CustomOption;
  TTk_CustomOption = record
      parseProc : PTk_OptionParseProc;
      printProc : PTk_OptionPrintProc;
      clientData : TClientData;
    end;
{
 * Structure used to specify information for Tk_ConfigureWidget. Each
 * structure gives complete information for one option, including how the
 * option is specified on the command line, where it appears in the option
 * database, etc.
  }
{ Type of option, such as TK_CONFIG_COLOR;
				 * see definitions below. Last option in table
				 * must have type TK_CONFIG_END.  }
{ Switch used to specify option in argv. NULL
				 * means this spec is part of a group.  }
{ Name for option in option database.  }
{ Class for option in database.  }
{ Default value for option if not specified
				 * in command line or database.  }
{ Where in widget record to store value; use
				 * Tk_Offset macro to generate values for
				 * this.  }
{ Any combination of the values defined
				 * below; other bits are used internally by
				 * tkConfig.c.  }
{ If type is TK_CONFIG_CUSTOM then this is a
				 * pointer to info about how to parse and
				 * print the option. Otherwise it is
				 * irrelevant.  }

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
{
 * Type values for Tk_ConfigSpec structures. See the user documentation for
 * details.
  }

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
;
{
 * Possible values for flags argument to Tk_ConfigureWidget:
  }
  TK_CONFIG_ARGV_ONLY = 1;  
  TK_CONFIG_OBJS = $80;  
{
 * Possible flag values for Tk_ConfigSpec structures. Any bits at or above
 * TK_CONFIG_USER_BIT may be used by clients for selecting certain entries.
 * Before changing any values here, coordinate with tkOldConfig.c
 * (internal-use-only flags are defined there).
  }
  TK_CONFIG_NULL_OK = 1 shl 0;  
  TK_CONFIG_COLOR_ONLY = 1 shl 1;  
  TK_CONFIG_MONO_ONLY = 1 shl 2;  
  TK_CONFIG_DONT_SET_DEFAULT = 1 shl 3;  
  TK_CONFIG_OPTION_SPECIFIED = 1 shl 4;  
  TK_CONFIG_USER_BIT = $100;  
{$endif}
{ __NO_OLD_CONFIG  }
{
 * Structure used to specify how to handle argv options.
  }
{ The key string that flags the option in the
				 * argv array.  }
{ Indicates option type; see below.  }
{ Value to be used in setting dst; usage
				 * depends on type.  }
{ Address of value to be modified; usage
				 * depends on type.  }
{ Documentation message describing this
				 * option.  }
type
  PTk_ArgvInfo = ^TTk_ArgvInfo;
  TTk_ArgvInfo = record
      key : Pchar;
      _type : longint;
      src : Pchar;
      dst : Pchar;
      help : Pchar;
    end;
{
 * Legal values for the type field of a Tk_ArgvInfo: see the user
 * documentation for details.
  }

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
{
 * Flag bits for passing to Tk_ParseArgv:
  }
  TK_ARGV_NO_DEFAULTS = $1;  
  TK_ARGV_NO_LEFTOVERS = $2;  
  TK_ARGV_NO_ABBREV = $4;  
  TK_ARGV_DONT_SKIP_FIRST_ARG = $8;  
{
 * Enumerated type for describing actions to be taken in response to a
 * restrictProc established by Tk_RestrictEvents.
  }
type
  PTk_RestrictAction = ^TTk_RestrictAction;
  TTk_RestrictAction =  Longint;
  Const
    TK_DEFER_EVENT = 0;
    TK_PROCESS_EVENT = 1;
    TK_DISCARD_EVENT = 2;
;
{
 * Priority levels to pass to Tk_AddOption:
  }
  TK_WIDGET_DEFAULT_PRIO = 20;  
  TK_STARTUP_FILE_PRIO = 40;  
  TK_USER_DEFAULT_PRIO = 60;  
  TK_INTERACTIVE_PRIO = 80;  
  TK_MAX_PRIO = 100;  
{
 * Relief values returned by Tk_GetRelief:
  }
  TK_RELIEF_NULL = -(1);  
  TK_RELIEF_FLAT = 0;  
  TK_RELIEF_GROOVE = 1;  
  TK_RELIEF_RAISED = 2;  
  TK_RELIEF_RIDGE = 3;  
  TK_RELIEF_SOLID = 4;  
  TK_RELIEF_SUNKEN = 5;  
{
 * "Which" argument values for Tk_3DBorderGC:
  }
  TK_3D_FLAT_GC = 1;  
  TK_3D_LIGHT_GC = 2;  
  TK_3D_DARK_GC = 3;  
{
 * Special EnterNotify/LeaveNotify "mode" for use in events generated by
 * tkShare.c. Pick a high enough value that it's unlikely to conflict with
 * existing values (like NotifyNormal) or any new values defined in the
 * future.
  }
  TK_NOTIFY_SHARE = 20;  
{
 * Enumerated type for describing a point by which to anchor something:
  }
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
;
{
 * Enumerated type for describing a style of justification:
  }
type
  PTk_Justify = ^TTk_Justify;
  TTk_Justify =  Longint;
  Const
    TK_JUSTIFY_LEFT = 0;
    TK_JUSTIFY_RIGHT = 1;
    TK_JUSTIFY_CENTER = 2;
;
{
 * The following structure is used by Tk_GetFontMetrics() to return
 * information about the properties of a Tk_Font.
  }
{ The amount in pixels that the tallest
				 * letter sticks up above the baseline, plus
				 * any extra blank space added by the designer
				 * of the font.  }
{ The largest amount in pixels that any
				 * letter sticks below the baseline, plus any
				 * extra blank space added by the designer of
				 * the font.  }
{ The sum of the ascent and descent. How far
				 * apart two lines of text in the same font
				 * should be placed so that none of the
				 * characters in one line overlap any of the
				 * characters in the other line.  }
type
  PTk_FontMetrics = ^TTk_FontMetrics;
  TTk_FontMetrics = record
      ascent : longint;
      descent : longint;
      linespace : longint;
    end;
{
 * Flags passed to Tk_MeasureChars:
  }

const
  TK_WHOLE_WORDS = 1;  
  TK_AT_LEAST_ONE = 2;  
  TK_PARTIAL_OK = 4;  
{
 * Flags passed to Tk_ComputeTextLayout:
  }
  TK_IGNORE_TABS = 8;  
  TK_IGNORE_NEWLINES = 16;  
{
 * Widget class procedures used to implement platform specific widget
 * behavior.
  }
type
{ Procedure to invoke when the widget needs
				 * to respond in some way to a change in the
				 * world (font changes, etc.)  }
{ Procedure to invoke when the platform-
				 * dependent window needs to be created.  }
{ Procedure to invoke after all bindings on a
				 * widget have been triggered in order to
				 * handle a modal loop.  }

  PTk_ClassProcs = ^TTk_ClassProcs;
  TTk_ClassProcs = record
      size : dword;
      worldChangedProc : PTk_ClassWorldChangedProc;
      createProc : PTk_ClassCreateProc;
      modalProc : PTk_ClassModalProc;
    end;
{
 * Simple accessor for Tk_ClassProcs structure. Checks that the structure is
 * not NULL, then checks the size field and returns either the requested
 * field, if present, or NULL if the structure is too small to have the field
 * (or NULL if the structure is NULL).
 *
 * A more general version of this function may be useful if other
 * size-versioned structure pop up in the future:
 *
 *	#define Tk_GetField(name, who, which) \
 *	    (((who) == NULL) ? NULL :
 *	    (((who)->size <= Tk_Offset(name, which)) ? NULL :(name)->which))
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function Tk_GetClassProc(procs,which : longint) : longint;

{
 * Each geometry manager (the packer, the placer, etc.) is represented by a
 * structure of the following form, which indicates procedures to invoke in
 * the geometry manager to carry out certain functions.
  }
const
  Tk_GeomLostContentProc = Tk_GeomLostSlaveProc;  
type
{ Name of the geometry manager (command used
				 * to invoke it, or name of widget class that
				 * allows embedded widgets).  }
{ Procedure to invoke when a content's
				 * requested geometry changes.  }
{ Procedure to invoke when content is taken
				 * away from one geometry manager by another.
				 * NULL means geometry manager doesn't care
				 * when content lost.  }

  PTk_GeomMgr = ^TTk_GeomMgr;
  TTk_GeomMgr = record
      name : Pchar;
      requestProc : PTk_GeomRequestProc;
      lostSlaveProc : PTk_GeomLostContentProc;
    end;
{
 * Result values returned by Tk_GetScrollInfo:
  }

const
  TK_SCROLL_MOVETO = 1;  
  TK_SCROLL_PAGES = 2;  
  TK_SCROLL_UNITS = 3;  
  TK_SCROLL_ERROR = 4;  
{
 *----------------------------------------------------------------------
 *
 * Extensions to the X event set
 *
 *----------------------------------------------------------------------
  }
  VirtualEvent = MappingNotify+1;  
  ActivateNotify = MappingNotify+2;  
  DeactivateNotify = MappingNotify+3;  
  MouseWheelEvent = MappingNotify+4;  
  TK_LASTEVENT = MappingNotify+5;  
  MouseWheelMask = 1 shl 28;  
  ActivateMask = 1 shl 29;  
  VirtualEventMask = 1 shl 30;  
{
 * A virtual event shares most of its fields with the XKeyEvent and
 * XButtonEvent structures. 99% of the time a virtual event will be an
 * abstraction of a key or button event, so this structure provides the most
 * information to the user. The only difference is the changing of the detail
 * field for a virtual event so that it holds the name of the virtual event
 * being triggered.
 *
 * When using this structure, you should ensure that you zero out all the
 * fields first using memset() or bzero().
  }
{ # of last request processed by server.  }
{ True if this came from a SendEvent
				 * request.  }
{ Display the event was read from.  }
{ Window on which event was requested.  }
{ Root window that the event occurred on.  }
{ Child window.  }
{ Milliseconds.  }
{ Pointer x, y coordinates in event
				 * window.  }
{ Coordinates relative to root.  }
{ Key or button mask  }
{ Name of virtual event.  }
{ Same screen flag.  }
{ Application-specific data reference; Tk
				 * will decrement the reference count *once*
				 * when it has finished processing the
				 * event.  }
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
{ # of last request processed by server.  }
{ True if this came from a SendEvent
				 * request.  }
{ Display the event was read from.  }
{ Window in which event occurred.  }

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
{
 *----------------------------------------------------------------------
 *
 * Macros for querying Tk_Window structures. See the manual entries for
 * documentation.
 *
 *----------------------------------------------------------------------
  }
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

{
 * The structure below is needed by the macros above so that they can access
 * the fields of a Tk_Window. The fields not needed by the macros are declared
 * as "dummyX". The structure has its own type in order to prevent apps from
 * accessing Tk_Window fields except using official macros. WARNING!! The
 * structure definition must be kept consistent with the TkWindow structure in
 * tkInt.h. If you change one, then change the other. See the declaration in
 * tkInt.h for documentation on what the fields are used for internally.
  }
{ dispPtr  }
{ childList  }
{ lastChildPtr  }
{ parentPtr  }
{ nextPtr  }
{ mainPtr  }
{ dirtyChanges  }
{ dirtyAtts  }
{ handlerList  }
{$ifdef TK_USE_INPUT_METHODS}
{ inputContext  }
{$endif}
{ TK_USE_INPUT_METHODS  }
{ tagPtr  }
{ numTags  }
{ optionLevel  }
{ selHandlerList  }
{ geomMgrPtr  }
{ geomData  }
{ wmInfoPtr  }
{ classProcPtr  }
{ instanceData  }
{ privatePtr  }
{$ifdef TK_USE_INPUT_METHODS}
{$endif}
{ TK_USE_INPUT_METHODS  }
{ geomMgrName  }
{ maintainerPtr  }
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
{
 * Flag values for TkWindow (and Tk_FakeWin) structures are:
 *
 * TK_MAPPED:			1 means window is currently mapped,
 *				0 means unmapped.
 * TK_TOP_LEVEL:		1 means this is a top-level widget.
 * TK_ALREADY_DEAD:		1 means the window is in the process of
 *				being destroyed already.
 * TK_NEED_CONFIG_NOTIFY:	1 means that the window has been reconfigured
 *				before it was made to exist. At the time of
 *				making it exist a ConfigureNotify event needs
 *				to be generated.
 * TK_GRAB_FLAG:		Used to manage grabs. See tkGrab.c for details
 * TK_CHECKED_IC:		1 means we've already tried to get an input
 *				context for this window; if the ic field is
 *				NULL it means that there isn't a context for
 *				the field.
 * TK_DONT_DESTROY_WINDOW:	1 means that Tk_DestroyWindow should not
 *				invoke XDestroyWindow to destroy this widget's
 *				X window. The flag is set when the window has
 *				already been destroyed elsewhere (e.g. by
 *				another application) or when it will be
 *				destroyed later (e.g. by destroying its parent)
 * TK_WM_COLORMAP_WINDOW:	1 means that this window has at some time
 *				appeared in the WM_COLORMAP_WINDOWS property
 *				for its toplevel, so we have to remove it from
 *				that property if the window is deleted and the
 *				toplevel isn't.
 * TK_EMBEDDED:			1 means that this window (which must be a
 *				toplevel) is not a free-standing window but
 *				rather is embedded in some other application.
 * TK_CONTAINER:		1 means that this window is a container, and
 *				that some other application (either in this
 *				process or elsewhere) may be embedding itself
 *				inside the window.
 * TK_BOTH_HALVES:		1 means that this window is used for
 *				application embedding (either as container or
 *				embedded application), and both the containing
 *				and embedded halves are associated with
 *				windows in this particular process.
 * TK_WRAPPER:			1 means that this window is the extra wrapper
 *				window created around a toplevel to hold the
 *				menubar under Unix. See tkUnixWm.c for more
 *				information.
 * TK_REPARENTED:		1 means that this window has been reparented
 *				so that as far as the window system is
 *				concerned it isn't a child of its Tk parent.
 *				Initially this is used only for special Unix
 *				menubar windows.
 * TK_ANONYMOUS_WINDOW:		1 means that this window has no name, and is
 *				thus not accessible from Tk.
 * TK_HAS_WRAPPER		1 means that this window has a wrapper window
 * TK_WIN_MANAGED		1 means that this window is a child of the root
 *				window, and is managed by the window manager.
 * TK_TOP_HIERARCHY		1 means this window is at the top of a physical
 *				window hierarchy within this process, i.e. the
 *				window's parent either doesn't exist or is not
 *				owned by this Tk application.
 * TK_PROP_PROPCHANGE		1 means that PropertyNotify events in the
 *				window's children should propagate up to this
 *				window.
 * TK_WM_MANAGEABLE		1 marks a window as capable of being converted
 *				into a toplevel using [wm manage].
 * TK_CAN_INPUT_TEXT            1 means that this window accepts text input.
 *                              Used on macOS to indicate that key events can be
 *                              processed with the NSTextInputClient protocol.
 *                              Not currently accessible through the public API.
  }

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
{
 *----------------------------------------------------------------------
 *
 * Procedure prototypes and structures used for defining new canvas items:
 *
 *----------------------------------------------------------------------
  }
type
  PTk_State = ^TTk_State;
  TTk_State =  Longint;
  Const
    TK_STATE_NULL = -(1);
    TK_STATE_ACTIVE = (-(1))+1;
    TK_STATE_DISABLED = (-(1))+2;
    TK_STATE_NORMAL = (-(1))+3;
    TK_STATE_HIDDEN = (-(1))+4;
;
type
  PTk_SmoothMethod = ^TTk_SmoothMethod;
  TTk_SmoothMethod = record
      name : Pchar;
      coordProc : function (canvas:TTk_Canvas; pointPtr:Pdouble; numPoints:longint; numSteps:longint; xPoints:PXPoint; 
                   dblPoints:Pdouble):longint;cdecl;
      postscriptProc : procedure (interp:PTcl_Interp; canvas:TTk_Canvas; coordPtr:Pdouble; numPoints:longint; numSteps:longint);cdecl;
    end;
{
 * For each item in a canvas widget there exists one record with the following
 * structure. Each actual item is represented by a record with the following
 * stuff at its beginning, plus additional type-specific stuff after that.
  }

const
  TK_TAG_SPACE = 3;  
{ Unique identifier for this item (also
				 * serves as first tag for item).  }
{ Next in display list of all items in this
				 * canvas. Later items in list are drawn on
				 * top of earlier ones.  }
{ Built-in space for limited # of tags.  }
{ Pointer to array of tags. Usually points to
				 * staticTagSpace, but may point to malloc-ed
				 * space if there are lots of tags.  }
{ Total amount of tag space available at
				 * tagPtr.  }
{ Number of tag slots actually used at
				 * *tagPtr.  }
{ Table of procedures that implement this
				 * type of item.  }
{ Bounding box for item, in integer canvas
				 * units. Set by item-specific code and
				 * guaranteed to contain every pixel drawn in
				 * item. Item area includes x1 and y1 but not
				 * x2 and y2.  }
{ Previous in display list of all items in
				 * this canvas. Later items in list are drawn
				 * just below earlier ones.  }
{ State of item.  }
{ reserved for future use  }
{ Some flags used in the canvas  }
{
     *------------------------------------------------------------------
     * Starting here is additional type-specific stuff; see the declarations
     * for individual types to see what is part of each type. The actual space
     * below is determined by the "itemInfoSize" of the type's Tk_ItemType
     * record.
     *------------------------------------------------------------------
      }
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
{
 * Flag bits for canvases (redraw_flags):
 *
 * TK_ITEM_STATE_DEPENDANT -	1 means that object needs to be redrawn if the
 *				canvas state changes.
 * TK_ITEM_DONT_REDRAW - 	1 means that the object redraw is already been
 *				prepared, so the general canvas code doesn't
 *				need to do that any more.
  }

const
  TK_ITEM_STATE_DEPENDANT = 1;  
  TK_ITEM_DONT_REDRAW = 2;  
{
 * Records of the following type are used to describe a type of item (e.g.
 * lines, circles, etc.) that can form part of a canvas widget.
  }
{$ifdef USE_OLD_CANVAS}
type
{$else}
type
{$endif}
{ USE_OLD_CANVAS  }
type
{$ifdef USE_OLD_CANVAS}
{$else}
type
{$endif}
{ USE_OLD_CANVAS  }
type
{$ifdef USE_OLD_CANVAS}
{$else}
type
{$endif}
{ USE_OLD_CANVAS  }
type
{$ifndef __NO_OLD_CONFIG}
{ The name of this type of item, such as
				 * "line".  }
{ Total amount of space needed for item's
				 * record.  }
{ Procedure to create a new item of this
				 * type.  }
{ Pointer to array of configuration specs for
				 * this type. Used for returning configuration
				 * info.  }
{ Procedure to call to change configuration
				 * options.  }
{ Procedure to call to get and set the item's
				 * coordinates.  }
{ Procedure to delete existing item of this
				 * type.  }
{ Procedure to display items of this type.  }
{ Non-zero means displayProc should be called
				 * even when the item has been moved
				 * off-screen.  }
{ Computes distance from item to a given
				 * point.  }
{ Computes whether item is inside, outside,
				 * or overlapping an area.  }
{ Procedure to write a Postscript description
				 * for items of this type.  }
{ Procedure to rescale items of this type.  }
{ Procedure to translate items of this
				 * type.  }
{ Procedure to determine index of indicated
				 * character. NULL if item doesn't support
				 * indexing.  }
{ Procedure to set insert cursor posn to just
				 * before a given position.  }
{ Procedure to return selection (in STRING
				 * format) when it is in this item.  }
{ Procedure to insert something into an
				 * item.  }
{ Procedure to delete characters from an
				 * item.  }
{ Used to link types together into a list.  }
{ Reserved for future extension.  }
{ Carefully compatible with  }
{ Jan Nijtmans dash patch  }
type
  PTk_ItemType = ^TTk_ItemType;
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
{
 * Flag (used in the alwaysRedraw field) to say whether an item supports
 * point-level manipulation like the line and polygon items.
  }

const
  TK_MOVABLE_POINTS = 2;  
{$endif}
{ __NO_OLD_CONFIG  }
{
 * The following structure provides information about the selection and the
 * insertion cursor. It is needed by only a few items, such as those that
 * display text. It is shared by the generic canvas code and the item-specific
 * code, but most of the fields should be written only by the canvas generic
 * code.
  }
{ Border and background for selected
				 * characters. Read-only to items. }
{ Width of border around selection. Read-only
				 * to items.  }
{ Foreground color for selected text.
				 * Read-only to items.  }
{ Pointer to selected item. NULL means
				 * selection isn't in this canvas. Writable by
				 * items.  }
{ Character index of first selected
				 * character. Writable by items.  }
{ Character index of last selected character.
				 * Writable by items.  }
{ Item corresponding to "selectAnchor": not
				 * necessarily selItemPtr. Read-only to
				 * items.  }
{ Character index of fixed end of selection
				 * (i.e. "select to" operation will use this
				 * as one end of the selection). Writable by
				 * items.  }
{ Used to draw vertical bar for insertion
				 * cursor. Read-only to items.  }
{ Total width of insertion cursor. Read-only
				 * to items.  }
{ Width of 3-D border around insert cursor.
				 * Read-only to items.  }
{ Item that currently has the input focus, or
				 * NULL if no such item. Read-only to items.  }
{ Non-zero means that the canvas widget has
				 * the input focus. Read-only to items. }
{ Non-zero means that an insertion cursor
				 * should be displayed in focusItemPtr.
				 * Read-only to items. }
type
  PTk_CanvasTextInfo = ^TTk_CanvasTextInfo;
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
{
 * Structures used for Dashing and Outline.
  }
{ ???????????????? }
{	char array[sizeof(char *)]; }

  PTk_Dash = ^TTk_Dash;
  TTk_Dash = record
      number : longint;
      pattern : record
          case longint of
            0 : ( pt : Pchar );
          end;
    end;
{ ???????????????? }
{ ???????????????? }
{ Flags; see below for possible values  }
{ x offset  }
{ y offset  }

  PTk_TSOffset = ^TTk_TSOffset;
  TTk_TSOffset = record
      flags : longint;
      xoffset : longint;
      yoffset : longint;
    end;
{
 * Bit fields in Tk_TSOffset->flags:
  }

const
  TK_OFFSET_INDEX = 1;  
  TK_OFFSET_RELATIVE = 2;  
  TK_OFFSET_LEFT = 4;  
  TK_OFFSET_CENTER = 8;  
  TK_OFFSET_RIGHT = 16;  
  TK_OFFSET_TOP = 32;  
  TK_OFFSET_MIDDLE = 64;  
  TK_OFFSET_BOTTOM = 128;  
{ Graphics context.  }
{ Width of outline.  }
{ Width of outline.  }
{ Width of outline.  }
{ Dash offset.  }
{ Dash pattern.  }
{ Dash pattern if state is active.  }
{ Dash pattern if state is disabled.  }
{ Reserved for future expansion.  }
{ Stipple offset for outline.  }
{ Outline color.  }
{ Outline color if state is active.  }
{ Outline color if state is disabled.  }
{ Outline Stipple pattern.  }
{ Outline Stipple pattern if state is
				 * active.  }
{ Outline Stipple pattern if state is
				 * disabled.  }
type
  PTk_Outline = ^TTk_Outline;
  TTk_Outline = record
      gc : TGC;
      width : Tdouble;
      activeWidth : Tdouble;
      disabledWidth : Tdouble;
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
{
 *----------------------------------------------------------------------
 *
 * Procedure prototypes and structures used for managing images:
 *
 *----------------------------------------------------------------------
  }
{$ifdef USE_OLD_IMAGE}
{$else}
type
{$endif}
{ USE_OLD_IMAGE  }
type
{
 * The following structure represents a particular type of image (bitmap, xpm
 * image, etc.). It provides information common to all images of that type,
 * such as the type name and a collection of procedures in the image manager
 * that respond to various events. Each image manager is represented by one of
 * these structures.
  }
{ Name of image type.  }
{ Procedure to call to create a new image of
				 * this type.  }
{ Procedure to call the first time
				 * Tk_GetImage is called in a new way (new
				 * visual or screen).  }
{ Call to draw image, in response to
				 * Tk_RedrawImage calls.  }
{ Procedure to call whenever Tk_FreeImage is
				 * called to release an instance of an
				 * image.  }
{ Procedure to call to delete image. It will
				 * not be called until after freeProc has been
				 * called for each instance of the image.  }
{ Procedure to call to produce postscript
				 * output for the image.  }
{ Next in list of all image types currently
				 * known. Filled in by Tk, not by image
				 * manager.  }
{ reserved for future expansion  }
  PTk_ImageType = ^TTk_ImageType;
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

{
 *----------------------------------------------------------------------
 *
 * Additional definitions used to manage images of type "photo".
 *
 *----------------------------------------------------------------------
  }
{
 * The following type is used to identify a particular photo image to be
 * manipulated:
  }

  PTk_PhotoHandle = ^TTk_PhotoHandle;
  TTk_PhotoHandle = pointer;
{
 * The following structure describes a block of pixels in memory:
  }
{ Pointer to the first pixel.  }
{ Width of block, in pixels.  }
{ Height of block, in pixels.  }
{ Address difference between corresponding
				 * pixels in successive lines.  }
{ Address difference between successive
				 * pixels in the same line.  }
{ Address differences between the red, green,
				 * blue and alpha components of the pixel and
				 * the pixel as a whole.  }

  PTk_PhotoImageBlock = ^TTk_PhotoImageBlock;
  TTk_PhotoImageBlock = record
      pixelPtr : Pbyte;
      width : longint;
      height : longint;
      pitch : longint;
      pixelSize : longint;
      offset : array[0..3] of longint;
    end;
{
 * The following values control how blocks are combined into photo images when
 * the alpha component of a pixel is not 255, a.k.a. the compositing rule.
  }

const
  TK_PHOTO_COMPOSITE_OVERLAY = 0;  
  TK_PHOTO_COMPOSITE_SET = 1;  
{
 * Procedure prototypes and structures used in reading and writing photo
 * images:
  }
type
{$ifdef USE_OLD_IMAGE}
{$else}
type
{$endif}
{ USE_OLD_IMAGE  }
{
 * The following structure represents a particular file format for storing
 * images (e.g., PPM, GIF, JPEG, etc.). It provides information to allow image
 * files of that format to be recognized and read into a photo image.
  }
{ Name of image file format  }
{ Procedure to call to determine whether an
				 * image file matches this format.  }
{ Procedure to call to determine whether the
				 * data in a string matches this format.  }
{ Procedure to call to read data from an
				 * image file into a photo image.  }
{ Procedure to call to read data from a
				 * string into a photo image.  }
{ Procedure to call to write data from a
				 * photo image to a file.  }
{ Procedure to call to obtain a string
				 * representation of the data in a photo
				 * image. }
{ Next in list of all photo image formats
				 * currently known. Filled in by Tk, not by
				 * image format handler.  }
type
  PTk_PhotoImageFormat = ^TTk_PhotoImageFormat;
  TTk_PhotoImageFormat = record
      name : Pchar;
      fileMatchProc : PTk_ImageFileMatchProc;
      stringMatchProc : PTk_ImageStringMatchProc;
      fileReadProc : PTk_ImageFileReadProc;
      stringReadProc : PTk_ImageStringReadProc;
      fileWriteProc : PTk_ImageFileWriteProc;
      stringWriteProc : PTk_ImageStringWriteProc;
      nextPtr : PTk_PhotoImageFormat;
    end;

{
 *----------------------------------------------------------------------
 *
 * Procedure prototypes and structures used for managing styles:
 *
 *----------------------------------------------------------------------
  }
{
 * Style support version tag.
  }

const
  TK_STYLE_VERSION_1 = $1;  
  TK_STYLE_VERSION = TK_STYLE_VERSION_1;  
{
 * The following structures and prototypes are used as static templates to
 * declare widget elements.
  }
type
{ Name of the required option.  }
{ Accepted option type. TK_OPTION_END means
				 * any.  }

  PTk_ElementOptionSpec = ^TTk_ElementOptionSpec;
  TTk_ElementOptionSpec = record
      name : Pchar;
      _type : TTk_OptionType;
    end;
{ Version of the style support.  }
{ Name of element.  }
{ List of required options. Last one's name
				 * must be NULL.  }
{ Compute the external (resp. internal) size
				 * of the element from its desired internal
				 * (resp. external) size.  }
{ Compute the inscribed or bounding boxes
				 * within a given area.  }
{ Return the element's internal border width.
				 * Mostly useful for widgets.  }
{ Draw the element in the given bounding
				 * box.  }

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
{
 *----------------------------------------------------------------------
 *
 * The definitions below provide backward compatibility for functions and
 * types related to event handling that used to be in Tk but have moved to
 * Tcl.
 *
 *----------------------------------------------------------------------
  }
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
{$ifndef USE_TK_STUBS}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function Tk_InitStubs(interp,version,exact : longint) : longint;

{$endif}
{ USE_TK_STUBS  }
{
 *----------------------------------------------------------------------
 *
 * Additional procedure types defined by Tk.
 *
 *----------------------------------------------------------------------
  }
type
{
 *----------------------------------------------------------------------
 *
 * Platform independent exported procedures and variables.
 *
 *----------------------------------------------------------------------
  }
{$include "tkDecls.h"}
{$ifdef USE_OLD_IMAGE}
{$undef Tk_CreateImageType}

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
