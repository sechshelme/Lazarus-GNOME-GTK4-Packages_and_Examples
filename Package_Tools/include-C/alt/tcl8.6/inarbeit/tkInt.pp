
unit tkInt;
interface

{
  Automatically converted by H2Pas 1.0.0 from tkInt.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tkInt.h
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
PBusy  = ^Busy;
Pbyte  = ^byte;
Pchar  = ^char;
PClientData  = ^ClientData;
PDisplay  = ^Display;
Pdouble  = ^double;
PElArray  = ^ElArray;
PKeyCode  = ^KeyCode;
Plongint  = ^longint;
PTcl_ExitProc  = ^Tcl_ExitProc;
PTcl_HashEntry  = ^Tcl_HashEntry;
PTcl_HashTable  = ^Tcl_HashTable;
PTcl_Interp  = ^Tcl_Interp;
PTcl_Obj  = ^Tcl_Obj;
PTcl_ObjCmdProc  = ^Tcl_ObjCmdProc;
PTk_ClassProcs  = ^Tk_ClassProcs;
PTk_ErrorProc  = ^Tk_ErrorProc;
PTk_EventProc  = ^Tk_EventProc;
PTk_FakeWin  = ^Tk_FakeWin;
PTk_GeomMgr  = ^Tk_GeomMgr;
PTkBindInfo  = ^TkBindInfo;
PTkBindInfo_  = ^TkBindInfo_;
PTkBusy  = ^TkBusy;
PTkCaret  = ^TkCaret;
PTkClipboardTarget  = ^TkClipboardTarget;
PTkColormap  = ^TkColormap;
PTkCursor  = ^TkCursor;
PTkDisplay  = ^TkDisplay;
PTkDisplayFocusInfo  = ^TkDisplayFocusInfo;
PTkEnsemble  = ^TkEnsemble;
PTkErrorHandler  = ^TkErrorHandler;
PTkEventHandler  = ^TkEventHandler;
PTkFontAttributes  = ^TkFontAttributes;
PTkFontInfo  = ^TkFontInfo;
PTkGrabEvent  = ^TkGrabEvent;
PTkKeyEvent  = ^TkKeyEvent;
PTkMainInfo  = ^TkMainInfo;
PTkpClipMask  = ^TkpClipMask;
PTkpCursor  = ^TkpCursor;
PTkpCursor_  = ^TkpCursor_;
PTkPredefBitmap  = ^TkPredefBitmap;
PTkRegion  = ^TkRegion;
PTkRegion_  = ^TkRegion_;
PTkSelectionInfo  = ^TkSelectionInfo;
PTkSelHandler  = ^TkSelHandler;
PTkStateMap  = ^TkStateMap;
PTkStressedCmap  = ^TkStressedCmap;
PTkToplevelFocusInfo  = ^TkToplevelFocusInfo;
PTkWindow  = ^TkWindow;
PTkWindowEvent  = ^TkWindowEvent;
PTkWindowPrivate  = ^TkWindowPrivate;
PTkWmInfo  = ^TkWmInfo;
PVisual  = ^Visual;
PWindow  = ^Window;
PXColor  = ^XColor;
PXEvent  = ^XEvent;
PXImage  = ^XImage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * tkInt.h --
 *
 *	Declarations for things used internally by the Tk functions but not
 *	exported outside the module.
 *
 * Copyright (c) 1990-1994 The Regents of the University of California.
 * Copyright (c) 1994-1997 Sun Microsystems, Inc.
 * Copyright (c) 1998 by Scriptics Corporation.
 *
 * See the file "license.terms" for information on usage and redistribution of
 * this file, and for a DISCLAIMER OF ALL WARRANTIES.
  }
{$ifndef _TKINT}
{$define _TKINT}
{$ifndef _TKPORT}
{$include "tkPort.h"}
{$endif}

{ was #define dname def_expr }
function TK_OPTION_ENUM_VAR : longint; { return type might be wrong }

{
 * Ensure WORDS_BIGENDIAN is defined correctly:
 * Needs to happen here in addition to configure to work with fat compiles on
 * Darwin (where configure runs only once for multiple architectures).
  }
type

  PTkpCursor = ^TTkpCursor;
  TTkpCursor = PTkpCursor_;

  PTkRegion = ^TTkRegion;
  TTkRegion = PTkRegion_;

  PTkBindInfo = ^TTkBindInfo;
  TTkBindInfo = PTkBindInfo_;

  PTkBusy = ^TTkBusy;
  TTkBusy = PBusy;
{
 * One of the following structures is maintained for each cursor in use in the
 * system. This structure is used by tkCursor.c and the various system-
 * specific cursor files.
  }
{ System specific identifier for cursor.  }
{ Display containing cursor. Needed for
				 * disposal and retrieval of cursors.  }
{ Number of active uses of this cursor (each
				 * active use corresponds to a call to
				 * Tk_AllocPreserveFromObj or Tk_Preserve). If
				 * this count is 0, then this structure is no
				 * longer valid and it isn't present in a hash
				 * table: it is being kept around only because
				 * there are objects referring to it. The
				 * structure is freed when resourceRefCount
				 * and objRefCount are both 0.  }
{ Number of Tcl objects that reference this
				 * structure..  }
{ Second table (other than idTable) used to
				 * index this entry.  }
{ Entry in otherTable for this structure
				 * (needed when deleting).  }
{ Entry in idTable for this structure (needed
				 * when deleting).  }
{ Points to the next TkCursor structure with
				 * the same name. Cursors with the same name
				 * but different displays are chained together
				 * off a single hash table entry.  }

  PTkCursor = ^TTkCursor;
  TTkCursor = record
      cursor : TTk_Cursor;
      display : PDisplay;
      resourceRefCount : longint;
      objRefCount : longint;
      otherTable : PTcl_HashTable;
      hashPtr : PTcl_HashEntry;
      idHashPtr : PTcl_HashEntry;
      nextPtr : PTkCursor;
    end;
{
 * The following structure is kept one-per-TkDisplay to maintain information
 * about the caret (cursor location) on this display. This is used to dictate
 * global focus location (Windows Accessibility guidelines) and to position
 * the IME or XIM over-the-spot window.
  }
{ The window on which we requested caret
				 * placement.  }
{ Relative x coord of the caret.  }
{ Relative y coord of the caret.  }
{ Specified height of the window.  }

  PTkCaret = ^TTkCaret;
  TTkCaret = record
      winPtr : PTkWindow;
      x : longint;
      y : longint;
      height : longint;
    end;
{
 * One of the following structures is maintained for each display containing a
 * window managed by Tk. In part, the structure is used to store thread-
 * specific data, since each thread will have its own TkDisplay structure.
  }
{ Xlib's info about display.  }
{ Next in list of all displays.  }
{ Name of display (with any screen identifier
				 * removed). Malloc-ed.  }
{ Time of last event received for this
				 * display.  }
{
     * Information used primarily by tk3d.c:
      }
{ 0 means borderTable needs initializing.  }
{ Maps from color name to TkBorder
				 * structure.  }
{
     * Information used by tkAtom.c only:
      }
{ 0 means stuff below hasn't been initialized
				 * yet.  }
{ Maps from names to Atom's.  }
{ Maps from Atom's back to names.  }
{
     * Information used primarily by tkBind.c:
      }
{ Non-zero means the variables in this part
				 * of the structure are potentially incorrect
				 * and should be recomputed.  }
{ Has one bit set to indicate the modifier
				 * corresponding to "mode shift". If no such
				 * modifier, than this is zero.  }
{ Has one bit set to indicate the modifier
				 * corresponding to the "Meta" key. If no such
				 * modifier, then this is zero.  }
{ Has one bit set to indicate the modifier
				 * corresponding to the "Meta" key. If no such
				 * modifier, then this is zero.  }
{ Indicates how to interpret lock
				 * modifier.  }
{ Number of entries in modKeyCodes array
				 * below.  }
{ Pointer to an array giving keycodes for all
				 * of the keys that have modifiers associated
				 * with them. Malloc'ed, but may be NULL.  }
{
     * Information used by tkBitmap.c only:
      }
{ 0 means tables above need initializing.  }
{ Used to number bitmaps.  }
{ Maps from name of bitmap to the first
				 * TkBitmap record for that name.  }
{ Maps from bitmap id to the TkBitmap
				 * structure for the bitmap.  }
{ Used by Tk_GetBitmapFromData to map from a
				 * collection of in-core data about a bitmap
				 * to a reference giving an automatically-
				 * generated name for the bitmap.  }
{
     * Information used by tkCanvas.c only:
      }
{
     * Used by tkColor.c only:
      }
{ 0 means color module needs initializing.  }
{ First in list of colormaps that have filled
				 * up, so we have to pick an approximate
				 * color.  }
{ Maps from color name to TkColor structure
				 * for that color.  }
{ Maps from integer RGB values to TkColor
				 * structures.  }
{
     * Used by tkCursor.c only:
      }
{ 0 means cursor module need initializing.  }
{ Maps from a string name to a cursor to the
				 * TkCursor record for the cursor.  }
{ Maps from a collection of in-core data
				 * about a cursor to a TkCursor structure.  }
{ Maps from a cursor id to the TkCursor
				 * structure for the cursor.  }
{ Used to store a cursor id string.  }
{ Font to use for standard cursors. None
				 * means font not loaded yet.  }
{
     * Information used by tkError.c only:
      }
{ First in list of error handlers for this
				 * display. NULL means no handlers exist at
				 * present.  }
{ Counts # of handlers deleted since last
				 * time inactive handlers were garbage-
				 * collected. When this number gets big,
				 * handlers get cleaned up.  }
{
     * Used by tkEvent.c only:
      }
{ Points to a malloc-ed motion event whose
				 * processing has been delayed in the hopes
				 * that another motion event will come along
				 * right away and we can merge the two of them
				 * together. NULL means that there is no
				 * delayed motion event.  }
{
     * Information used by tkFocus.c only:
      }
{ 1 means collect focus debugging
				 * statistics.  }
{ If the focus arrived at a toplevel window
				 * implicitly via an Enter event (rather than
				 * via a FocusIn event), this points to the
				 * toplevel window. Otherwise it is NULL.  }
{ Points to the window on this display that
				 * should be receiving keyboard events. When
				 * multiple applications on the display have
				 * the focus, this will refer to the innermost
				 * window in the innermost application. This
				 * information isn't used on Windows, but it's
				 * needed on the Mac, and also on X11 when XIM
				 * processing is being done.  }
{
     * Information used by tkGC.c only:
      }
{ Maps from a GC's values to a TkGC structure
				 * describing a GC with those values.  }
{ Maps from a GC to a TkGC.  }
{ 0 means the tables below need
				 * initializing.  }
{
     * Information used by tkGeometry.c only:
      }
{ Hash table that maps from a container's
				 * Tk_Window token to a list of windows managed
				 * by that container.  }
{
     * Information used by tkGrid.c, tkPack.c, tkPlace.c, tkPointer.c,
     * and ttkMacOSXTheme.c:
      }
{
     * Information used by tkGet.c only:
      }
{ Stores all Tk_Uid used in a thread.  }
{ 0 means uidTable needs initializing.  }
{
     * Information used by tkGrab.c only:
      }
{ Window in which the pointer is currently
				 * grabbed, or NULL if none.  }
{ Value that grabWinPtr will have once the
				 * grab event queue (below) has been
				 * completely emptied.  }
{ Window in which first mouse button was
				 * pressed while grab was in effect, or NULL
				 * if no such press in effect.  }
{ If no application contains the pointer then
				 * this is NULL. Otherwise it contains the
				 * last window for which we've gotten an Enter
				 * or Leave event from the server (i.e. the
				 * last window known to have contained the
				 * pointer). Doesn't reflect events that were
				 * synthesized in tkGrab.c.  }
{ First in list of enter/leave events
				 * synthesized by grab code. These events must
				 * be processed in order before any other
				 * events are processed. NULL means no such
				 * events.  }
{ Last in list of synthesized events, or NULL
				 * if list is empty.  }
{ Miscellaneous flag values. See definitions
				 * in tkGrab.c.  }
{
     * Information used by tkGrid.c only:
      }
{ 0 means table below needs initializing.  }
{ Maps from Tk_Window tokens to corresponding
				 * Grid structures.  }
{
     * Information used by tkImage.c only:
      }
{ Value used to number image ids.  }
{
     * Information used by tkMacWinMenu.c only:
      }
{
     * Information used by tkPack.c only.
      }
{ 0 means table below needs initializing.  }
{ Maps from Tk_Window tokens to corresponding
				 * Packer structures.  }
{
     * Information used by tkPlace.c only.
      }
{ 0 means tables below need initializing.  }
{ Maps from Tk_Window toke to the Master
				 * structure for the window, if it exists.  }
{ Maps from Tk_Window toke to the Slave
				 * structure for the window, if it exists.  }
{
     * Information used by tkSelect.c and tkClipboard.c only:
      }
{ First in list of selection information
				 * records. Each entry contains information
				 * about the current owner of a particular
				 * selection on this display.  }
{ Atom for MULTIPLE. None means selection
				 * stuff isn't initialized.  }
{ Atom for INCR.  }
{ Atom for TARGETS.  }
{ Atom for TIMESTAMP.  }
{ Atom for TEXT.  }
{ Atom for COMPOUND_TEXT.  }
{ Atom for TK_APPLICATION.  }
{ Atom for TK_WINDOW.  }
{ Atom for CLIPBOARD.  }
{ Atom for UTF8_STRING.  }
{ Atom for ATOM_PAIR.  }
{ Window used for clipboard ownership and to
				 * retrieve selections between processes. NULL
				 * means clipboard info hasn't been
				 * initialized.  }
{ 1 means we currently own the clipboard
				 * selection, 0 means we don't.  }
{ Last application that owned clipboard.  }
{ First in list of clipboard type information
				 * records. Each entry contains information
				 * about the buffers for a given selection
				 * target.  }
{
     * Information used by tkSend.c only:
      }
{ Window used for communication between
				 * interpreters during "send" commands. NULL
				 * means send info hasn't been initialized
				 * yet.  }
{ X's name for comm property.  }
{ X's name for property containing registry
				 * of interpreter names.  }
{ X's name for property used to hold the
				 * application name on each comm window.  }
{
     * Information used by tkUnixWm.c and tkWinWm.c only:
      }
{ Points to first top-level window.  }
{ Points to the foreground window.  }
{
     * Information used by tkVisual.c only:
      }
{ First in list of all non-default colormaps
				 * allocated for this display.  }
{
     * Miscellaneous information:
      }
{$ifdef TK_USE_INPUT_METHODS}
{ Input method for this display.  }
{ Input style selected for this display.  }
{ XFontSet cached for over-the-spot XIM.  }
{$endif}
{ TK_USE_INPUT_METHODS  }
{ Maps from X window ids to TkWindow ptrs.  }
{ Reference count of how many Tk applications
				 * are using this display. Used to clean up
				 * the display when we no longer have any Tk
				 * applications using it.  }
{
     * The following field were all added for Tk8.3
      }
{ Current mouse button state for this
				 * display. NOT USED as of 8.6.10  }
{ Window the button state was set in, added
				 * in Tk 8.4.  }
{ For finding the root window for warping
				 * purposes.  }
{
     * The following field(s) were all added for Tk8.4
      }
{ Various flag values: these are all defined
				 * in below.  }
{ Information about the caret for this
				 * display. This is not a pointer.  }
{ Size of default iconphoto image data.  }
{ Default iconphoto image data, if set.  }
{$ifdef TK_USE_INPUT_METHODS}
{ Used to invalidate XIC  }
{$endif}
{ TK_USE_INPUT_METHODS  }
type
  PTkDisplay = ^TTkDisplay;
  TTkDisplay = record
      display : PDisplay;
      nextPtr : PTkDisplay;
      name : Pchar;
      lastEventTime : TTime;
      borderInit : longint;
      borderTable : TTcl_HashTable;
      atomInit : longint;
      nameTable : TTcl_HashTable;
      atomTable : TTcl_HashTable;
      bindInfoStale : longint;
      modeModMask : dword;
      metaModMask : dword;
      altModMask : dword;
      lockUsage :  Longint;
      Const
        LU_IGNORE = 0;
        LU_CAPS = 1;
        LU_SHIFT = 2;
;
      numModKeyCodes : longint;
      modKeyCodes : PKeyCode;
      bitmapInit : longint;
      bitmapAutoNumber : longint;
      bitmapNameTable : TTcl_HashTable;
      bitmapIdTable : TTcl_HashTable;
      bitmapDataTable : TTcl_HashTable;
      numIdSearches : longint;
      numSlowSearches : longint;
      colorInit : longint;
      stressPtr : PTkStressedCmap;
      colorNameTable : TTcl_HashTable;
      colorValueTable : TTcl_HashTable;
      cursorInit : longint;
      cursorNameTable : TTcl_HashTable;
      cursorDataTable : TTcl_HashTable;
      cursorIdTable : TTcl_HashTable;
      cursorString : array[0..19] of char;
      cursorFont : TFont;
      errorPtr : PTkErrorHandler;
      deleteCount : longint;
      delayedMotionPtr : PTkWindowEvent;
      focusDebug : longint;
      implicitWinPtr : PTkWindow;
      focusPtr : PTkWindow;
      gcValueTable : TTcl_HashTable;
      gcIdTable : TTcl_HashTable;
      gcInit : longint;
      maintainHashTable : TTcl_HashTable;
      geomInit : longint;
      uidTable : TTcl_HashTable;
      uidInit : longint;
      grabWinPtr : PTkWindow;
      eventualGrabWinPtr : PTkWindow;
      buttonWinPtr : PTkWindow;
      serverWinPtr : PTkWindow;
      firstGrabEventPtr : PTkGrabEvent;
      lastGrabEventPtr : PTkGrabEvent;
      grabFlags : longint;
      gridInit : longint;
      gridHashTable : TTcl_HashTable;
      imageId : longint;
      postCommandGeneration : longint;
      packInit : longint;
      packerHashTable : TTcl_HashTable;
      placeInit : longint;
      masterTable : TTcl_HashTable;
      slaveTable : TTcl_HashTable;
      selectionInfoPtr : PTkSelectionInfo;
      multipleAtom : TAtom;
      incrAtom : TAtom;
      targetsAtom : TAtom;
      timestampAtom : TAtom;
      textAtom : TAtom;
      compoundTextAtom : TAtom;
      applicationAtom : TAtom;
      windowAtom : TAtom;
      clipboardAtom : TAtom;
      utf8Atom : TAtom;
      atomPairAtom : TAtom;
      clipWindow : TTk_Window;
      clipboardActive : longint;
      clipboardAppPtr : PTkMainInfo;
      clipTargetPtr : PTkClipboardTarget;
      commTkwin : TTk_Window;
      commProperty : TAtom;
      registryProperty : TAtom;
      appNameProperty : TAtom;
      firstWmPtr : PTkWmInfo;
      foregroundWmPtr : PTkWmInfo;
      cmapPtr : PTkColormap;
      inputMethod : TXIM;
      inputStyle : TXIMStyle;
      inputXfs : TXFontSet;
      winTable : TTcl_HashTable;
      refCount : longint;
      mouseButtonState : longint;
      mouseButtonWindow : TWindow;
      warpWindow : TTk_Window;
      warpMainwin : TTk_Window;
      warpX : longint;
      warpY : longint;
      flags : dword;
      caret : TTkCaret;
      iconDataSize : longint;
      iconDataPtr : Pbyte;
      ximGeneration : longint;
    end;
{
 * Flag values for TkDisplay flags.
 *  TK_DISPLAY_COLLAPSE_MOTION_EVENTS:	(default on)
 *	Indicates that we should collapse motion events on this display
 *  TK_DISPLAY_USE_IM:			(default on, set via tk.tcl)
 *	Whether to use input methods for this display
 *  TK_DISPLAY_WM_TRACING:		(default off)
 *	Whether we should do wm tracing on this display.
 *  TK_DISPLAY_IN_WARP:			(default off)
 *	Indicates that we are in a pointer warp
  }
  TK_DISPLAY_COLLAPSE_MOTION_EVENTS = 1 shl 0;  
  TK_DISPLAY_USE_IM = 1 shl 1;  
  TK_DISPLAY_WM_TRACING = 1 shl 3;  
  TK_DISPLAY_IN_WARP = 1 shl 4;  
  TK_DISPLAY_USE_XKB = 1 shl 5;  
{
 * One of the following structures exists for each error handler created by a
 * call to Tk_CreateErrorHandler. The structure is managed by tkError.c.
  }
{ Display to which handler applies.  }
{ Only errors with serial numbers >= to this
				 * are considered.  }
{ Only errors with serial numbers <= to this
				 * are considered. This field is filled in
				 * when XUnhandle is called. -1 means
				 * XUnhandle hasn't been called yet.  }
{ Consider only errors with this error_code
				 * (-1 means consider all errors).  }
{ Consider only errors with this major
				 * request code (-1 means consider all major
				 * codes).  }
{ Consider only errors with this minor
				 * request code (-1 means consider all minor
				 * codes).  }
{ Function to invoke when a matching error
				 * occurs. NULL means just ignore errors.  }
{ Arbitrary value to pass to errorProc.  }
{ Pointer to next older handler for this
				 * display, or NULL for end of list.  }
type
  PTkErrorHandler = ^TTkErrorHandler;
  TTkErrorHandler = record
      dispPtr : PTkDisplay;
      firstRequest : dword;
      lastRequest : dword;
      error : longint;
      request : longint;
      minorCode : longint;
      errorProc : PTk_ErrorProc;
      clientData : TClientData;
      nextPtr : PTkErrorHandler;
    end;
{
 * One of the following structures exists for each event handler created by
 * calling Tk_CreateEventHandler. This information is used by tkEvent.c only.
  }
{ Events for which to invoke proc.  }
{ Function to invoke when an event in mask
				 * occurs.  }
{ Argument to pass to proc.  }
{ Next in list of handlers associated with
				 * window (NULL means end of list).  }

  PTkEventHandler = ^TTkEventHandler;
  TTkEventHandler = record
      mask : dword;
      proc : PTk_EventProc;
      clientData : TClientData;
      nextPtr : PTkEventHandler;
    end;
{
 * Tk keeps one of the following data structures for each main window (created
 * by a call to TkCreateMainWindow). It stores information that is shared by
 * all of the windows associated with a particular main window.
  }
{ Number of windows whose "mainPtr" fields
				 * point here. When this becomes zero, can
				 * free up the structure (the reference count
				 * is zero because windows can get deleted in
				 * almost any order; the main window isn't
				 * necessarily the last one deleted).  }
{ Pointer to main window.  }
{ Interpreter associated with application.  }
{ Hash table mapping path names to TkWindow
				 * structs for all windows related to this
				 * main window. Managed by tkWindow.c.  }
{ Incremented by window deletions.  }
{ Used in conjunction with "bind" command to
				 * bind events to Tcl commands.  }
{ Information used by tkBind.c on a per
				 * application basis.  }
{ Information used by tkFont.c on a per
				 * application basis.  }
{
     * Information used only by tkFocus.c and tk*Embed.c:
      }
{ First in list of records containing focus
				 * information for each top-level in the
				 * application. Used only by tkFocus.c.  }
{ First in list of records containing focus
				 * information for each display that this
				 * application has ever used. Used only by
				 * tkFocus.c.  }
{ Top level of option hierarchy for this main
				 * window. NULL means uninitialized. Managed
				 * by tkOption.c.  }
{ Maps from image names to Tk_ImageModel
				 * structures. Managed by tkImage.c.  }
{ This is linked to the tk_strictMotif global
				 * variable.  }
{ This is linked to the
				 * ::tk::AlwaysShowSelection variable.  }
{ Next in list of all main windows managed by
				 * this process.  }
{ Information used by [tk busy] command.  }
{ Saved Tcl [update] command, used to restore
				 * Tcl's version of [update] after Tk is shut
				 * down  }
{ Information used by ttk::notebook.  }

  PTkMainInfo = ^TTkMainInfo;
  TTkMainInfo = record
      refCount : longint;
      winPtr : PTkWindow;
      interp : PTcl_Interp;
      nameTable : TTcl_HashTable;
      deletionEpoch : longint;
      bindingTable : TTk_BindingTable;
      bindInfo : TTkBindInfo;
      fontInfoPtr : PTkFontInfo;
      tlFocusPtr : PTkToplevelFocusInfo;
      displayFocusPtr : PTkDisplayFocusInfo;
      optionRootPtr : PElArray;
      imageTable : TTcl_HashTable;
      strictMotif : longint;
      alwaysShowSelection : longint;
      nextPtr : PTkMainInfo;
      busyTable : TTcl_HashTable;
      tclUpdateObjProc : PTcl_ObjCmdProc;
      ttkNbTabsStickBit : dword;
    end;
{
 * Tk keeps the following data structure for each of it's builtin bitmaps.
 * This structure is only used by tkBitmap.c and other platform specific
 * bitmap files.
  }
(* Const before type ignored *)
{ Bits for bitmap.  }
{ Dimensions of bitmap.  }
{ 0 means generic (X style) bitmap, 1 means
    				 * native style bitmap.  }

  PTkPredefBitmap = ^TTkPredefBitmap;
  TTkPredefBitmap = record
      source : pointer;
      width : longint;
      height : longint;
      native : longint;
    end;
{
 * Tk keeps one of the following structures for each window. Some of the
 * information (like size and location) is a shadow of information managed by
 * the X server, and some is special information used here, such as event and
 * geometry management information. This information is (mostly) managed by
 * tkWindow.c. WARNING: the declaration below must be kept consistent with the
 * Tk_FakeWin structure in tk.h. If you change one, be sure to change the
 * other!
  }
{
     * Structural information:
      }
{ Display containing window.  }
{ Tk's information about display for
				 * window.  }
{ Index of screen for window, among all those
				 * for dispPtr.  }
{ Visual to use for window. If not default,
				 * MUST be set before X window is created.  }
{ Number of bits/pixel.  }
{ X's id for window. None means window hasn't
				 * actually been created yet, or it's been
				 * deleted.  }
{ First in list of child windows, or NULL if
				 * no children. List is in stacking order,
				 * lowest window first. }
{ Last in list of child windows (highest in
				 * stacking order), or NULL if no children.  }
{ Pointer to parent window (logical parent,
				 * not necessarily X parent). NULL means
				 * either this is the main window, or the
				 * window's parent has already been deleted.  }
{ Next higher sibling (in stacking order) in
				 * list of children with same parent. NULL
				 * means end of list.  }
{ Information shared by all windows
				 * associated with a particular main window.
				 * NULL means this window is a rogue that is
				 * not associated with any application (at
				 * present, this only happens for the dummy
				 * windows used for "send" communication).  }
{
     * Name and type information for the window:
      }
{ Path name of window (concatenation of all
				 * names between this window and its top-level
				 * ancestor). This is a pointer into an entry
				 * in mainPtr->nameTable. NULL means that the
				 * window hasn't been completely created
				 * yet.  }
{ Name of the window within its parent
				 * (unique within the parent).  }
{ Class of the window. NULL means window
				 * hasn't been given a class yet.  }
{
     * Geometry and other attributes of window. This information may not be
     * updated on the server immediately; stuff that hasn't been reflected in
     * the server yet is called "dirty". At present, information can be dirty
     * only if the window hasn't yet been created.
      }
{ Geometry and other info about window.  }
{ Bits indicate fields of "changes" that are
				 * dirty.  }
{ Current attributes of window.  }
{ Bits indicate fields of "atts" that are
				 * dirty.  }
{ Various flag values: these are all defined
				 * in tk.h (confusing, but they're needed
				 * there for some query macros).  }
{
     * Information kept by the event manager (tkEvent.c):
      }
{ First in list of event handlers declared
				 * for this window, or NULL if none.  }
{$ifdef TK_USE_INPUT_METHODS}
{ XIM input context.  }
{$endif}
{ TK_USE_INPUT_METHODS  }
{
     * Information used for event bindings (see "bind" and "bindtags" commands
     * in tkCmds.c):
      }
{ Points to array of tags used for bindings
				 * on this window. Each tag is a Tk_Uid.
				 * Malloc'ed. NULL means no tags.  }
{ Number of tags at *tagPtr.  }
{
     * Information used by tkOption.c to manage options for the window.
      }
{ -1 means no option information is currently
				 * cached for this window. Otherwise this
				 * gives the level in the option stack at
				 * which info is cached.  }
{
     * Information used by tkSelect.c to manage the selection.
      }
{ First in list of handlers for returning the
				 * selection in various forms.  }
{
     * Information used by tkGeometry.c for geometry management.
      }
(* Const before type ignored *)
{ Information about geometry manager for this
				 * window.  }
{ Argument for geometry manager functions.  }
{ Arguments from last call to
				 * Tk_GeometryRequest, or 0's if
				 * Tk_GeometryRequest hasn't been called.  }
{ Width of internal border of window (0 means
				 * no internal border). Geometry managers
				 * should not normally place children on top
				 * of the border. Fields for the other three
				 * sides are found below.  }
{
     * Information maintained by tkWm.c for window manager communication.
      }
{ For top-level windows (and also for special
				 * Unix menubar and wrapper windows), points
				 * to structure with wm-related info (see
				 * tkWm.c). For other windows, this is
				 * NULL.  }
{
     * Information used by widget classes.
      }
(* Const before type ignored *)
{
     * Platform specific information private to each port.
      }
{
     * More information used by tkGeometry.c for geometry management.
      }
{ The remaining fields of internal border.  }
{ Minimum requested width.  }
{ Minimum requested height.  }
{$ifdef TK_USE_INPUT_METHODS}
{ Used to invalidate XIC  }
{$endif}
{ TK_USE_INPUT_METHODS  }
{ Records the name of the geometry manager.  }
{ The geometry container for this window. The
				 * value is NULL if the window has no container or
				 * if its container is its parent.  }
type
  PTkWindow = ^TTkWindow;
  TTkWindow = record
      display : PDisplay;
      dispPtr : PTkDisplay;
      screenNum : longint;
      visual : PVisual;
      depth : longint;
      window : TWindow;
      childList : PTkWindow;
      lastChildPtr : PTkWindow;
      parentPtr : PTkWindow;
      nextPtr : PTkWindow;
      mainPtr : PTkMainInfo;
      pathName : Pchar;
      nameUid : TTk_Uid;
      classUid : TTk_Uid;
      changes : TXWindowChanges;
      dirtyChanges : dword;
      atts : TXSetWindowAttributes;
      dirtyAtts : dword;
      flags : dword;
      handlerList : PTkEventHandler;
      inputContext : TXIC;
      tagPtr : PClientData;
      numTags : longint;
      optionLevel : longint;
      selHandlerList : PTkSelHandler;
      geomMgrPtr : PTk_GeomMgr;
      geomData : TClientData;
      reqWidth : longint;
      reqHeight : longint;
      internalBorderLeft : longint;
      wmInfoPtr : PTkWmInfo;
      classProcsPtr : PTk_ClassProcs;
      instanceData : TClientData;
      privatePtr : PTkWindowPrivate;
      internalBorderRight : longint;
      internalBorderTop : longint;
      internalBorderBottom : longint;
      minReqWidth : longint;
      minReqHeight : longint;
      ximGeneration : longint;
      geomMgrName : Pchar;
      maintainerPtr : PTkWindow;
    end;
{
 * String tables:
  }
(* Const before type ignored *)
(* Const before declarator ignored *)
  var
    tkStateStrings : ^Pchar;cvar;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
    tkCompoundStrings : ^Pchar;cvar;external;
{
 * Real definition of some events. Note that these events come from outside
 * but have internally generated pieces added to them.
  }
{ The real event from X11.  }
{$ifdef _WIN32}
{ translated characters  }
(*** was #elif ****){$else !defined(MAC_OSX_TK)}
{ A pointer to a string that holds the key's
				 * %A substitution text (before backslash
				 * adding), or NULL if that has not been
				 * computed yet. If non-NULL, this string was
				 * allocated with ckalloc().  }
{ Length of string in charValuePtr when that
				 * is non-NULL.  }
{ Key symbol computed after input methods
				 * have been invoked  }
{$endif}
type
  PTkKeyEvent = ^TTkKeyEvent;
  TTkKeyEvent = record
      keyEvent : TXKeyEvent;
      trans_chars : array[0..(XMaxTransChars)-1] of char;
      nbytes : byte;
      charValuePtr : Pchar;
      charValueLen : longint;
      keysym : TKeySym;
    end;
{
 * Flags passed to TkpMakeMenuWindow's 'transient' argument.
  }
{ Only non-transient case.  }

const
  TK_MAKE_MENU_TEAROFF = 0;  
  TK_MAKE_MENU_POPUP = 1;  
  TK_MAKE_MENU_DROPDOWN = 2;  
{
 * The following structure is used with TkMakeEnsemble to create ensemble
 * commands and optionally to create sub-ensembles.
  }
(* Const before type ignored *)
(* Const before type ignored *)
type
  PTkEnsemble = ^TTkEnsemble;
  TTkEnsemble = record
      name : Pchar;
      proc : PTcl_ObjCmdProc;
      subensemble : PTkEnsemble;
    end;
{
 * The following structure is used as a two way map between integers and
 * strings, usually to map between an internal C representation and the
 * strings used in Tcl.
  }
{ Integer representation of a value.  }
(* Const before type ignored *)
{ String representation of a value.  }

  PTkStateMap = ^TTkStateMap;
  TTkStateMap = record
      numKey : longint;
      strKey : Pchar;
    end;
{
 * This structure is used by the Mac and Window porting layers as the internal
 * representation of a clip_mask in a GC.
  }
{ TKP_CLIP_PIXMAP or TKP_CLIP_REGION.  }

  PTkpClipMask = ^TTkpClipMask;
  TTkpClipMask = record
      _type : longint;
      value : record
          case longint of
            0 : ( pixmap : TPixmap );
            1 : ( region : TTkRegion );
          end;
    end;

const
  TKP_CLIP_PIXMAP = 0;  
  TKP_CLIP_REGION = 1;  
{
 * Return values from TkGrabState:
  }
  TK_GRAB_NONE = 0;  
  TK_GRAB_IN_TREE = 1;  
  TK_GRAB_ANCESTOR = 2;  
  TK_GRAB_EXCLUDED = 3;  
{
 * Additional flag for TkpMeasureCharsInContext. Coordinate with other flags
 * for this routine, but don't make public until TkpMeasureCharsInContext is
 * made public, too.
  }
  TK_ISOLATE_END = 32;  
{
 * The macro below is used to modify a "char" value (e.g. by casting it to an
 * unsigned character) so that it can be used safely with macros such as
 * isspace().
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function UCHAR(c : longint) : byte;

{
 * The following symbol is used in the mode field of FocusIn events generated
 * by an embedded application to request the input focus from its container.
  }
const
  EMBEDDED_APP_WANTS_FOCUS = NotifyNormal+20;  
{
 * The following special modifier mask bits are defined, to indicate logical
 * modifiers such as Meta and Alt that may float among the actual modifier
 * bits.
  }
  META_MASK = AnyModifier shl 1;  
  ALT_MASK = AnyModifier shl 2;  
  EXTENDED_MASK = AnyModifier shl 3;  
{
 * Mask that selects any of the state bits corresponding to buttons, plus
 * masks that select individual buttons' bits:
  }
  ALL_BUTTONS = (((Button1Mask or Button2Mask) or Button3Mask) or Button4Mask) or Button5Mask;  

function TkGetButtonMask(para1:dword):dword;cdecl;external;
{
 * Object types not declared in tkObj.c need to be mentioned here so they can
 * be properly registered with Tcl:
  }
(* Const before type ignored *)
  var
    tkBorderObjType : TTcl_ObjType;cvar;external;
(* Const before type ignored *)
    tkBitmapObjType : TTcl_ObjType;cvar;external;
(* Const before type ignored *)
    tkColorObjType : TTcl_ObjType;cvar;external;
(* Const before type ignored *)
    tkCursorObjType : TTcl_ObjType;cvar;external;
(* Const before type ignored *)
    tkFontObjType : TTcl_ObjType;cvar;external;
(* Const before type ignored *)
    tkStateKeyObjType : TTcl_ObjType;cvar;external;
(* Const before type ignored *)
    tkTextIndexType : TTcl_ObjType;cvar;external;
{
 * Miscellaneous variables shared among Tk modules but not exported to the
 * outside world:
  }
(* Const before type ignored *)
    tkBezierSmoothMethod : TTk_SmoothMethod;cvar;external;
    tkBitmapImageType : TTk_ImageType;cvar;external;
    tkImgFmtGIF : TTk_PhotoImageFormat;cvar;external;
    tkHandleEventProc : procedure (eventPtr:PXEvent);cvar;external;
    tkImgFmtPNG : TTk_PhotoImageFormat;cvar;external;
    tkImgFmtPPM : TTk_PhotoImageFormat;cvar;external;
    tkMainWindowList : PTkMainInfo;cvar;external;
    tkPhotoImageType : TTk_ImageType;cvar;external;
    tkPredefBitmapTable : TTcl_HashTable;cvar;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
    tkWebColors : array[0..19] of Pchar;cvar;external;
{
 * The definition of pi, at least from the perspective of double-precision
 * floats.
  }
{$ifndef PI}
{$ifdef M_PI}

const
  PI = M_PI;  
{$else}

const
  PI = 3.14159265358979323846;  
{$endif}
{$endif}
{
 * Support for Clang Static Analyzer <https://clang-analyzer.llvm.org/>
  }
(* Const before type ignored *)

procedure Tcl_Panic(para1:Pchar; args:array of const);cdecl;external;
procedure Tcl_Panic(para1:Pchar);cdecl;external;
{
 * The following magic value is stored in the "send_event" field of FocusIn
 * and FocusOut events. This allows us to separate "real" events coming from
 * the server from those that we generated.
  }
{ was #define dname def_expr }
function GENERATED_FOCUS_EVENT_MAGIC : TBool;  

{
 * Exported internals.
  }
{$include "tkIntDecls.h"}
{ C++ extern C conditionnal removed }
{
 * Themed widget set init function, and handler called when Tk is destroyed.
  }

function Ttk_Init(interp:PTcl_Interp):longint;cdecl;external;
procedure Ttk_TkDestroyedHandler(interp:PTcl_Interp);cdecl;external;
{
 * Internal functions shared among Tk modules but not exported to the outside
 * world:
  }
(* Const before declarator ignored *)
function Tk_BellObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_BindObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_BindtagsObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_BusyObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_ButtonObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_CanvasObjCmd(clientData:TClientData; interp:PTcl_Interp; argc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_CheckbuttonObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_ClipboardObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_ChooseColorObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_ChooseDirectoryObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_DestroyObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_EntryObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_EventObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_FrameObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_FocusObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_FontObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_GetOpenFileObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_GetSaveFileObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_GrabObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_GridObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_ImageObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_LabelObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_LabelframeObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_ListboxObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_LowerObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_MenuObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_MenubuttonObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_MessageBoxObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_MessageObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_PanedWindowObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_OptionObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_PackObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_PlaceObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_RadiobuttonObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_RaiseObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_ScaleObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_ScrollbarObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_SelectionObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_SendObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_SpinboxObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_TextObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_TkwaitObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_ToplevelObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_UpdateObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_WinfoObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
(* Const before declarator ignored *)
function Tk_WmObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
function Tk_GetDoublePixelsFromObj(interp:PTcl_Interp; tkwin:TTk_Window; objPtr:PTcl_Obj; doublePtr:Pdouble):longint;cdecl;external;
const
  TkSetGeometryContainer = TkSetGeometryMaster;  
(* Const before type ignored *)

function TkSetGeometryContainer(interp:PTcl_Interp; tkwin:TTk_Window; name:Pchar):longint;cdecl;external;
const
  TkFreeGeometryContainer = TkFreeGeometryMaster;  
(* Const before type ignored *)

procedure TkFreeGeometryContainer(tkwin:TTk_Window; name:Pchar);cdecl;external;
procedure TkEventInit;cdecl;external;
procedure TkRegisterObjTypes;cdecl;external;
(* Const before declarator ignored *)
function TkDeadAppObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
function TkCanvasGetCoordObj(interp:PTcl_Interp; canvas:TTk_Canvas; obj:PTcl_Obj; doublePtr:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function TkGetDoublePixels(interp:PTcl_Interp; tkwin:TTk_Window; _string:Pchar; doublePtr:Pdouble):longint;cdecl;external;
function TkPostscriptImage(interp:PTcl_Interp; tkwin:TTk_Window; psInfo:TTk_PostscriptInfo; ximage:PXImage; x:longint; 
           y:longint; width:longint; height:longint):longint;cdecl;external;
procedure TkMapTopFrame(tkwin:TTk_Window);cdecl;external;
function TkpGetBindingXEvent(interp:PTcl_Interp):PXEvent;cdecl;external;
procedure TkCreateExitHandler(proc:PTcl_ExitProc; clientData:pointer);cdecl;external;
procedure TkDeleteExitHandler(proc:PTcl_ExitProc; clientData:TClientData);cdecl;external;
  var
    TkFinalize : TTcl_ExitProc;cvar;external;
    TkFinalizeThread : TTcl_ExitProc;cvar;external;

procedure TkpBuildRegionFromAlphaData(region:TTkRegion; x:dword; y:dword; width:dword; height:dword; 
            dataPtr:Pbyte; pixelStride:dword; lineStride:dword);cdecl;external;
(* Const before type ignored *)
procedure TkAppendPadAmount(bufferObj:PTcl_Obj; buffer:Pchar; pad1:longint; pad2:longint);cdecl;external;
function TkParsePadAmount(interp:PTcl_Interp; tkwin:TTk_Window; objPtr:PTcl_Obj; pad1Ptr:Plongint; pad2Ptr:Plongint):longint;cdecl;external;
procedure TkFocusSplit(winPtr:PTkWindow);cdecl;external;
procedure TkFocusJoin(winPtr:PTkWindow);cdecl;external;
function TkpAlwaysShowSelection(tkwin:TTk_Window):longint;cdecl;external;
(* Const before type ignored *)
procedure TkpDrawCharsInContext(display:PDisplay; drawable:TDrawable; gc:TGC; tkfont:TTk_Font; source:Pchar; 
            numBytes:longint; rangeStart:longint; rangeLength:longint; x:longint; y:longint);cdecl;external;
(* Const before type ignored *)
procedure TkpDrawAngledCharsInContext(display:PDisplay; drawable:TDrawable; gc:TGC; tkfont:TTk_Font; source:Pchar; 
            numBytes:longint; rangeStart:longint; rangeLength:longint; x:Tdouble; y:Tdouble; 
            angle:Tdouble);cdecl;external;
(* Const before type ignored *)
function TkpMeasureCharsInContext(tkfont:TTk_Font; source:Pchar; numBytes:longint; rangeStart:longint; rangeLength:longint; 
           maxLength:longint; flags:longint; lengthPtr:Plongint):longint;cdecl;external;
(* Const before type ignored *)
procedure TkUnderlineCharsInContext(display:PDisplay; drawable:TDrawable; gc:TGC; tkfont:TTk_Font; _string:Pchar; 
            numBytes:longint; x:longint; y:longint; firstByte:longint; lastByte:longint);cdecl;external;
procedure TkpGetFontAttrsForChar(tkwin:TTk_Window; tkfont:TTk_Font; c:longint; faPtr:PTkFontAttributes);cdecl;external;
function TkNewWindowObj(tkwin:TTk_Window):PTcl_Obj;cdecl;external;
procedure TkpShowBusyWindow(busy:TTkBusy);cdecl;external;
procedure TkpHideBusyWindow(busy:TTkBusy);cdecl;external;
procedure TkpMakeTransparentWindowExist(tkwin:TTk_Window; parent:TWindow);cdecl;external;
procedure TkpCreateBusy(winPtr:PTk_FakeWin; tkRef:TTk_Window; parentPtr:PWindow; tkParent:TTk_Window; busy:TTkBusy);cdecl;external;
(* Const before declarator ignored *)
function TkBackgroundEvalObjv(interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj; flags:longint):longint;cdecl;external;
(* Const before type ignored *)
procedure TkSendVirtualEvent(tgtWin:TTk_Window; eventName:Pchar; detail:PTcl_Obj);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TkMakeEnsemble(interp:PTcl_Interp; nsname:Pchar; name:Pchar; clientData:TClientData; map:PTkEnsemble):TTcl_Command;cdecl;external;
function TkInitTkCmd(interp:PTcl_Interp; clientData:TClientData):longint;cdecl;external;
function TkInitFontchooser(interp:PTcl_Interp; clientData:TClientData):longint;cdecl;external;
procedure TkpWarpPointer(dispPtr:PTkDisplay);cdecl;external;
procedure TkpCancelWarp(dispPtr:PTkDisplay);cdecl;external;
function TkListCreateFrame(clientData:TClientData; interp:PTcl_Interp; listObj:PTcl_Obj; toplevel:longint; nameObj:PTcl_Obj):longint;cdecl;external;
{$ifdef _WIN32}
const
  TkParseColor = XParseColor;  
{$else}
(* Const before type ignored *)

function TkParseColor(display:PDisplay; map:TColormap; spec:Pchar; colorPtr:PXColor):TStatus;cdecl;external;
{$endif}
{$ifdef HAVE_XFT}

procedure TkUnixSetXftClipRegion(clipRegion:TTkRegion);cdecl;external;
{$endif}

procedure TkpCopyRegion(dst:TTkRegion; src:TTkRegion);cdecl;external;
{$if !defined(__cplusplus) && !defined(c_plusplus)}

const
  c_class = _class;  
{$endif}
{ Tcl 8.6 has a different definition of Tcl_UniChar than other Tcl versions for TCL_UTF_MAX > 3  }
{$if TCL_UTF_MAX > (3 + (TCL_MAJOR_VERSION == 8 && TCL_MINOR_VERSION == 6))}

const
  TkUtfToUniChar = Tcl_UtfToUniChar;  
  TkUniCharToUtf = Tcl_UniCharToUtf;  
  TkUtfPrev = Tcl_UtfPrev;  
  TkUtfAtIndex = Tcl_UtfAtIndex;  
{$else}
(* Const before type ignored *)

function TkUtfToUniChar(para1:Pchar; para2:Plongint):longint;cdecl;external;
function TkUniCharToUtf(para1:longint; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TkUtfPrev(para1:Pchar; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TkUtfAtIndex(src:Pchar; index:longint):Pchar;cdecl;external;
{$endif}
{
 * Unsupported commands.
  }
(* Const before declarator ignored *)

function TkUnsupported1ObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
{
 * For Tktest.
  }
(* Const before declarator ignored *)
function SquareObjCmd(clientData:TClientData; interp:PTcl_Interp; objc:longint; objv:PPTcl_Obj):longint;cdecl;external;
function TkOldTestInit(interp:PTcl_Interp):longint;cdecl;external;
{$if !(defined(_WIN32) || defined(MAC_OSX_TK))}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function TkplatformtestInit(x : longint) : longint;

{$else}

function TkplatformtestInit(interp:PTcl_Interp):longint;cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
{ _TKINT  }
{
 * Local Variables:
 * mode: c
 * c-basic-offset: 4
 * fill-column: 78
 * End:
  }

implementation

{ was #define dname def_expr }
function TK_OPTION_ENUM_VAR : longint; { return type might be wrong }
  begin
    TK_OPTION_ENUM_VAR:=(longint((sizeof(Tk_OptionType)) and ((sizeof(longint))-1))) shl 6;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function UCHAR(c : longint) : byte;
begin
  UCHAR:=byte(c);
end;

{ was #define dname def_expr }
function GENERATED_FOCUS_EVENT_MAGIC : TBool;
  begin
    GENERATED_FOCUS_EVENT_MAGIC:=TBool($547321ac);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TkplatformtestInit(x : longint) : longint;
begin
  TkplatformtestInit:=TCL_OK;
end;


end.
