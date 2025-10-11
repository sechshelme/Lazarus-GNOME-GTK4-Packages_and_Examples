
unit xcb_ewmh;
interface

{
  Automatically converted by H2Pas 1.0.0 from xcb_ewmh.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xcb_ewmh.h
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
Puint32_t  = ^uint32_t;
Puint64_t  = ^uint64_t;
Pxcb_atom_t  = ^xcb_atom_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_ewmh_client_source_type_t  = ^xcb_ewmh_client_source_type_t;
Pxcb_ewmh_connection_t  = ^xcb_ewmh_connection_t;
Pxcb_ewmh_coordinates_t  = ^xcb_ewmh_coordinates_t;
Pxcb_ewmh_desktop_layout_orientation_t  = ^xcb_ewmh_desktop_layout_orientation_t;
Pxcb_ewmh_desktop_layout_starting_corner_t  = ^xcb_ewmh_desktop_layout_starting_corner_t;
Pxcb_ewmh_geometry_t  = ^xcb_ewmh_geometry_t;
Pxcb_ewmh_get_atoms_reply_t  = ^xcb_ewmh_get_atoms_reply_t;
Pxcb_ewmh_get_desktop_layout_reply_t  = ^xcb_ewmh_get_desktop_layout_reply_t;
Pxcb_ewmh_get_desktop_viewport_reply_t  = ^xcb_ewmh_get_desktop_viewport_reply_t;
Pxcb_ewmh_get_extents_reply_t  = ^xcb_ewmh_get_extents_reply_t;
Pxcb_ewmh_get_utf8_strings_reply_t  = ^xcb_ewmh_get_utf8_strings_reply_t;
Pxcb_ewmh_get_windows_reply_t  = ^xcb_ewmh_get_windows_reply_t;
Pxcb_ewmh_get_wm_fullscreen_monitors_reply_t  = ^xcb_ewmh_get_wm_fullscreen_monitors_reply_t;
Pxcb_ewmh_get_wm_icon_reply_t  = ^xcb_ewmh_get_wm_icon_reply_t;
Pxcb_ewmh_get_workarea_reply_t  = ^xcb_ewmh_get_workarea_reply_t;
Pxcb_ewmh_moveresize_direction_t  = ^xcb_ewmh_moveresize_direction_t;
Pxcb_ewmh_moveresize_window_opt_flags_t  = ^xcb_ewmh_moveresize_window_opt_flags_t;
Pxcb_ewmh_wm_icon_iterator_t  = ^xcb_ewmh_wm_icon_iterator_t;
Pxcb_ewmh_wm_state_action_t  = ^xcb_ewmh_wm_state_action_t;
Pxcb_ewmh_wm_strut_partial_t  = ^xcb_ewmh_wm_strut_partial_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_get_property_reply_t  = ^xcb_get_property_reply_t;
Pxcb_get_selection_owner_reply_t  = ^xcb_get_selection_owner_reply_t;
Pxcb_intern_atom_cookie_t  = ^xcb_intern_atom_cookie_t;
Pxcb_screen_t  = ^xcb_screen_t;
Pxcb_window_t  = ^xcb_window_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __XCB_EWMH_H__}
{$define __XCB_EWMH_H__}
{
 * Copyright (C) 2009-2011 Arnaud Fontaine <arnau@debian.org>
 *
 * Permission  is  hereby  granted,  free  of charge,  to  any  person
 * obtaining  a copy  of  this software  and associated  documentation
 * files   (the  "Software"),   to  deal   in  the   Software  without
 * restriction, including without limitation  the rights to use, copy,
 * modify, merge, publish,  distribute, sublicense, and/or sell copies
 * of  the Software, and  to permit  persons to  whom the  Software is
 * furnished to do so, subject to the following conditions:
 *
 * The  above copyright  notice and  this permission  notice  shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE  IS PROVIDED  "AS IS", WITHOUT  WARRANTY OF  ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT  NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY,   FITNESS    FOR   A   PARTICULAR    PURPOSE   AND
 * NONINFRINGEMENT. IN  NO EVENT SHALL  THE AUTHORS BE LIABLE  FOR ANY
 * CLAIM,  DAMAGES  OR  OTHER  LIABILITY,  WHETHER  IN  AN  ACTION  OF
 * CONTRACT, TORT OR OTHERWISE, ARISING  FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as  contained in  this notice, the  names of the  authors or
 * their institutions shall not be used in advertising or otherwise to
 * promote the  sale, use or  other dealings in this  Software without
 * prior written authorization from the authors.
  }
{*
 * @defgroup xcb__ewmh_t XCB EWMH Functions
 *
 * These functions  allow easy handling  of the protocol  described in
 * the Extended Window Manager  Hints specification. The list of Atoms
 * is stored as an M4 file  (atomlist.m4) where each Atom is stored as
 * a variable defined in the header.
 *
 * Replies of requests generating a  list of pointers (such as list of
 * windows, atoms and UTF-8 strings)  are simply stored as a structure
 * holding  the XCB  reply which  should (usually)  never  be accessed
 * directly and has  to be wipe afterwards. This  structure provides a
 * convenient access to the list given in the reply itself.
 *
 * @
  }
{$include <xcb/xcb.h>}
{$include <stdlib.h>}
{ C++ extern C conditionnal removed }
{*
 * @brief Hold EWMH information specific to a screen
  }
{* The X connection  }
{* The screens on this connection  }
{* _NET_WM_CM_Sn atoms depending on the number of screens  }
{* The EWMH atoms of this connection  }type
  Pxcb_ewmh_connection_t = ^Txcb_ewmh_connection_t;
  Txcb_ewmh_connection_t = record
      connection : Pxcb_connection_t;
      screens : ^Pxcb_screen_t;
      nb_screens : longint;
      _NET_WM_CM_Sn : Pxcb_atom_t;
      _NET_SUPPORTED : Txcb_atom_t;
      _NET_CLIENT_LIST : Txcb_atom_t;
      _NET_CLIENT_LIST_STACKING : Txcb_atom_t;
      _NET_NUMBER_OF_DESKTOPS : Txcb_atom_t;
      _NET_DESKTOP_GEOMETRY : Txcb_atom_t;
      _NET_DESKTOP_VIEWPORT : Txcb_atom_t;
      _NET_CURRENT_DESKTOP : Txcb_atom_t;
      _NET_DESKTOP_NAMES : Txcb_atom_t;
      _NET_ACTIVE_WINDOW : Txcb_atom_t;
      _NET_WORKAREA : Txcb_atom_t;
      _NET_SUPPORTING_WM_CHECK : Txcb_atom_t;
      _NET_VIRTUAL_ROOTS : Txcb_atom_t;
      _NET_DESKTOP_LAYOUT : Txcb_atom_t;
      _NET_SHOWING_DESKTOP : Txcb_atom_t;
      _NET_CLOSE_WINDOW : Txcb_atom_t;
      _NET_MOVERESIZE_WINDOW : Txcb_atom_t;
      _NET_WM_MOVERESIZE : Txcb_atom_t;
      _NET_RESTACK_WINDOW : Txcb_atom_t;
      _NET_REQUEST_FRAME_EXTENTS : Txcb_atom_t;
      _NET_WM_NAME : Txcb_atom_t;
      _NET_WM_VISIBLE_NAME : Txcb_atom_t;
      _NET_WM_ICON_NAME : Txcb_atom_t;
      _NET_WM_VISIBLE_ICON_NAME : Txcb_atom_t;
      _NET_WM_DESKTOP : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE : Txcb_atom_t;
      _NET_WM_STATE : Txcb_atom_t;
      _NET_WM_ALLOWED_ACTIONS : Txcb_atom_t;
      _NET_WM_STRUT : Txcb_atom_t;
      _NET_WM_STRUT_PARTIAL : Txcb_atom_t;
      _NET_WM_ICON_GEOMETRY : Txcb_atom_t;
      _NET_WM_ICON : Txcb_atom_t;
      _NET_WM_PID : Txcb_atom_t;
      _NET_WM_HANDLED_ICONS : Txcb_atom_t;
      _NET_WM_USER_TIME : Txcb_atom_t;
      _NET_WM_USER_TIME_WINDOW : Txcb_atom_t;
      _NET_FRAME_EXTENTS : Txcb_atom_t;
      _NET_WM_PING : Txcb_atom_t;
      _NET_WM_SYNC_REQUEST : Txcb_atom_t;
      _NET_WM_SYNC_REQUEST_COUNTER : Txcb_atom_t;
      _NET_WM_FULLSCREEN_MONITORS : Txcb_atom_t;
      _NET_WM_FULL_PLACEMENT : Txcb_atom_t;
      UTF8_STRING : Txcb_atom_t;
      WM_PROTOCOLS : Txcb_atom_t;
      MANAGER : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_DESKTOP : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_DOCK : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_TOOLBAR : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_MENU : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_UTILITY : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_SPLASH : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_DIALOG : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_DROPDOWN_MENU : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_POPUP_MENU : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_TOOLTIP : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_NOTIFICATION : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_COMBO : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_DND : Txcb_atom_t;
      _NET_WM_WINDOW_TYPE_NORMAL : Txcb_atom_t;
      _NET_WM_STATE_MODAL : Txcb_atom_t;
      _NET_WM_STATE_STICKY : Txcb_atom_t;
      _NET_WM_STATE_MAXIMIZED_VERT : Txcb_atom_t;
      _NET_WM_STATE_MAXIMIZED_HORZ : Txcb_atom_t;
      _NET_WM_STATE_SHADED : Txcb_atom_t;
      _NET_WM_STATE_SKIP_TASKBAR : Txcb_atom_t;
      _NET_WM_STATE_SKIP_PAGER : Txcb_atom_t;
      _NET_WM_STATE_HIDDEN : Txcb_atom_t;
      _NET_WM_STATE_FULLSCREEN : Txcb_atom_t;
      _NET_WM_STATE_ABOVE : Txcb_atom_t;
      _NET_WM_STATE_BELOW : Txcb_atom_t;
      _NET_WM_STATE_DEMANDS_ATTENTION : Txcb_atom_t;
      _NET_WM_ACTION_MOVE : Txcb_atom_t;
      _NET_WM_ACTION_RESIZE : Txcb_atom_t;
      _NET_WM_ACTION_MINIMIZE : Txcb_atom_t;
      _NET_WM_ACTION_SHADE : Txcb_atom_t;
      _NET_WM_ACTION_STICK : Txcb_atom_t;
      _NET_WM_ACTION_MAXIMIZE_HORZ : Txcb_atom_t;
      _NET_WM_ACTION_MAXIMIZE_VERT : Txcb_atom_t;
      _NET_WM_ACTION_FULLSCREEN : Txcb_atom_t;
      _NET_WM_ACTION_CHANGE_DESKTOP : Txcb_atom_t;
      _NET_WM_ACTION_CLOSE : Txcb_atom_t;
      _NET_WM_ACTION_ABOVE : Txcb_atom_t;
      _NET_WM_ACTION_BELOW : Txcb_atom_t;
    end;
{*
 * @brief Hold a GetProperty reply containing a list of Atoms
  }
{* The number of Atoms  }
{* The list of Atoms  }
{* The actual GetProperty reply  }

  Pxcb_ewmh_get_atoms_reply_t = ^Txcb_ewmh_get_atoms_reply_t;
  Txcb_ewmh_get_atoms_reply_t = record
      atoms_len : Tuint32_t;
      atoms : Pxcb_atom_t;
      _reply : Pxcb_get_property_reply_t;
    end;
{*
 * @brief Hold a GetProperty reply containing a list of Windows
  }
{* The number of Windows  }
{* The list of Windows  }
{* The actual GetProperty reply  }

  Pxcb_ewmh_get_windows_reply_t = ^Txcb_ewmh_get_windows_reply_t;
  Txcb_ewmh_get_windows_reply_t = record
      windows_len : Tuint32_t;
      windows : Pxcb_window_t;
      _reply : Pxcb_get_property_reply_t;
    end;
{*
 * @brief Hold a GetProperty reply containg a list of UTF-8 strings
  }
{* The number of UTF-8 strings  }
{* The list of UTF-8 strings  }
{* The actual GetProperty reply  }

  Pxcb_ewmh_get_utf8_strings_reply_t = ^Txcb_ewmh_get_utf8_strings_reply_t;
  Txcb_ewmh_get_utf8_strings_reply_t = record
      strings_len : Tuint32_t;
      strings : Pchar;
      _reply : Pxcb_get_property_reply_t;
    end;
{*
 * @brief Coordinates Property values
  }
{* The x coordinate  }
{* The y coordinate  }

  Pxcb_ewmh_coordinates_t = ^Txcb_ewmh_coordinates_t;
  Txcb_ewmh_coordinates_t = record
      x : Tuint32_t;
      y : Tuint32_t;
    end;
{*
 * @brief Hold reply of _NET_DESKTOP_VIEWPORT GetProperty
  }
{* The number of desktop viewports  }
{* The desktop viewports  }
{* The actual GetProperty reply  }

  Pxcb_ewmh_get_desktop_viewport_reply_t = ^Txcb_ewmh_get_desktop_viewport_reply_t;
  Txcb_ewmh_get_desktop_viewport_reply_t = record
      desktop_viewport_len : Tuint32_t;
      desktop_viewport : Pxcb_ewmh_coordinates_t;
      _reply : Pxcb_get_property_reply_t;
    end;
{*
 * @brief Geometry Property values
  }
{* The x coordinate  }
{* The y coordinate  }
{* The width  }
{* The height  }

  Pxcb_ewmh_geometry_t = ^Txcb_ewmh_geometry_t;
  Txcb_ewmh_geometry_t = record
      x : Tuint32_t;
      y : Tuint32_t;
      width : Tuint32_t;
      height : Tuint32_t;
    end;
{*
 * @brief Hold reply of a _NET_WORKAREA GetProperty
  }
{* The number of desktop workarea  }
{* The list of desktop workarea  }
{* The actual GetProperty reply  }

  Pxcb_ewmh_get_workarea_reply_t = ^Txcb_ewmh_get_workarea_reply_t;
  Txcb_ewmh_get_workarea_reply_t = record
      workarea_len : Tuint32_t;
      workarea : Pxcb_ewmh_geometry_t;
      _reply : Pxcb_get_property_reply_t;
    end;
{*
 * @brief Source indication in requests
  }
{* No source at all (for clients supporting an older version of
      EWMH specification)  }
{* Normal application  }
{* Pagers and other clients that represent direct user actions  }

  Pxcb_ewmh_client_source_type_t = ^Txcb_ewmh_client_source_type_t;
  Txcb_ewmh_client_source_type_t =  Longint;
  Const
    XCB_EWMH_CLIENT_SOURCE_TYPE_NONE = 0;
    XCB_EWMH_CLIENT_SOURCE_TYPE_NORMAL = 1;
    XCB_EWMH_CLIENT_SOURCE_TYPE_OTHER = 2;
;
{*
 * @brief _NET_DESKTOP_LAYOUT orientation
  }
{* Horizontal orientation (desktops laid out in rows)  }
{* Vertical orientation (desktops laid out in columns)  }
type
  Pxcb_ewmh_desktop_layout_orientation_t = ^Txcb_ewmh_desktop_layout_orientation_t;
  Txcb_ewmh_desktop_layout_orientation_t =  Longint;
  Const
    XCB_EWMH_WM_ORIENTATION_HORZ = 0;
    XCB_EWMH_WM_ORIENTATION_VERT = 1;
;
{*
 * @brief _NET_DESKTOP_LAYOUT starting corner
  }
{* Starting corner on the top left  }
{* Starting corner on the top right  }
{* Starting corner on the bottom right  }
{* Starting corner on the bottom left  }
type
  Pxcb_ewmh_desktop_layout_starting_corner_t = ^Txcb_ewmh_desktop_layout_starting_corner_t;
  Txcb_ewmh_desktop_layout_starting_corner_t =  Longint;
  Const
    XCB_EWMH_WM_TOPLEFT = 0;
    XCB_EWMH_WM_TOPRIGHT = 1;
    XCB_EWMH_WM_BOTTOMRIGHT = 2;
    XCB_EWMH_WM_BOTTOMLEFT = 3;
;
{*
 * @brief Hold reply of a _NET_DESKTOP_LAYOUT GetProperty
 * @see xcb_ewmh_desktop_layout_orientation_t
 * @see xcb_ewmh_desktop_layout_starting_corner_t
  }
{* The desktops orientation  }
{* The number of columns  }
{* The number of rows  }
{* The desktops starting corner  }
type
  Pxcb_ewmh_get_desktop_layout_reply_t = ^Txcb_ewmh_get_desktop_layout_reply_t;
  Txcb_ewmh_get_desktop_layout_reply_t = record
      orientation : Tuint32_t;
      columns : Tuint32_t;
      rows : Tuint32_t;
      starting_corner : Tuint32_t;
    end;
{*
 * @brief _NET_WM_MOVERESIZE value when moving via keyboard
 * @see xcb_ewmh_moveresize_direction_t
  }
{* The window x coordinate  }
{* The window y coordinate  }
{* The window width  }
{* The window height  }

  Pxcb_ewmh_moveresize_window_opt_flags_t = ^Txcb_ewmh_moveresize_window_opt_flags_t;
  Txcb_ewmh_moveresize_window_opt_flags_t =  Longint;
  Const
    XCB_EWMH_MOVERESIZE_WINDOW_X = 1 shl 8;
    XCB_EWMH_MOVERESIZE_WINDOW_Y = 1 shl 9;
    XCB_EWMH_MOVERESIZE_WINDOW_WIDTH = 1 shl 10;
    XCB_EWMH_MOVERESIZE_WINDOW_HEIGHT = 1 shl 11;
;
{*
 * @brief _NET_WM_MOVERESIZE window movement or resizing
  }
{* Resizing applied on the top left edge  }
{* Resizing applied on the top edge  }
{* Resizing applied on the top right edge  }
{* Resizing applied on the right edge  }
{* Resizing applied on the bottom right edge  }
{* Resizing applied on the bottom edge  }
{* Resizing applied on the bottom left edge  }
{* Resizing applied on the left edge  }
{ Movement only  }
{ Size via keyboard  }
{ Move via keyboard  }
{ Cancel operation  }
type
  Pxcb_ewmh_moveresize_direction_t = ^Txcb_ewmh_moveresize_direction_t;
  Txcb_ewmh_moveresize_direction_t =  Longint;
  Const
    XCB_EWMH_WM_MOVERESIZE_SIZE_TOPLEFT = 0;
    XCB_EWMH_WM_MOVERESIZE_SIZE_TOP = 1;
    XCB_EWMH_WM_MOVERESIZE_SIZE_TOPRIGHT = 2;
    XCB_EWMH_WM_MOVERESIZE_SIZE_RIGHT = 3;
    XCB_EWMH_WM_MOVERESIZE_SIZE_BOTTOMRIGHT = 4;
    XCB_EWMH_WM_MOVERESIZE_SIZE_BOTTOM = 5;
    XCB_EWMH_WM_MOVERESIZE_SIZE_BOTTOMLEFT = 6;
    XCB_EWMH_WM_MOVERESIZE_SIZE_LEFT = 7;
    XCB_EWMH_WM_MOVERESIZE_MOVE = 8;
    XCB_EWMH_WM_MOVERESIZE_SIZE_KEYBOARD = 9;
    XCB_EWMH_WM_MOVERESIZE_MOVE_KEYBOARD = 10;
    XCB_EWMH_WM_MOVERESIZE_CANCEL = 11;
;
{*
 * @brief Action on the _NET_WM_STATE property
  }
{ Remove/unset property  }
{ Add/set property  }
{ Toggle property   }
type
  Pxcb_ewmh_wm_state_action_t = ^Txcb_ewmh_wm_state_action_t;
  Txcb_ewmh_wm_state_action_t =  Longint;
  Const
    XCB_EWMH_WM_STATE_REMOVE = 0;
    XCB_EWMH_WM_STATE_ADD = 1;
    XCB_EWMH_WM_STATE_TOGGLE = 2;
;
{*
 * @brief Hold reply of _NET_WM_STRUT_PARTIAL GetProperty
  }
{* Reserved space on the left border of the screen  }
{* Reserved space on the right border of the screen  }
{* Reserved space on the top border of the screen  }
{* Reserved space on the bottom border of the screen  }
{* Beginning y coordinate of the left strut  }
{* Ending y coordinate of the left strut  }
{* Beginning y coordinate of the right strut  }
{* Ending y coordinate of the right strut  }
{* Beginning x coordinate of the top strut  }
{* Ending x coordinate of the top strut  }
{* Beginning x coordinate of the bottom strut  }
{* Ending x coordinate of the bottom strut  }
type
  Pxcb_ewmh_wm_strut_partial_t = ^Txcb_ewmh_wm_strut_partial_t;
  Txcb_ewmh_wm_strut_partial_t = record
      left : Tuint32_t;
      right : Tuint32_t;
      top : Tuint32_t;
      bottom : Tuint32_t;
      left_start_y : Tuint32_t;
      left_end_y : Tuint32_t;
      right_start_y : Tuint32_t;
      right_end_y : Tuint32_t;
      top_start_x : Tuint32_t;
      top_end_x : Tuint32_t;
      bottom_start_x : Tuint32_t;
      bottom_end_x : Tuint32_t;
    end;
{*
 * @brief Hold a single icon from reply of _NET_WM_ICON GetProperty
  }
{* Icon width  }
{* Icon height  }
{* Rows, left to right and top to bottom of the CARDINAL ARGB  }
{* Number of icons remaining  }
{* Index of the current icon in the array of icons  }

  Pxcb_ewmh_wm_icon_iterator_t = ^Txcb_ewmh_wm_icon_iterator_t;
  Txcb_ewmh_wm_icon_iterator_t = record
      width : Tuint32_t;
      height : Tuint32_t;
      data : Puint32_t;
      rem : dword;
      index : dword;
    end;
{*
 * @brief Hold reply of _NET_WM_ICON GetProperty
  }
{* Number of icons  }
{* The actual GetProperty reply  }

  Pxcb_ewmh_get_wm_icon_reply_t = ^Txcb_ewmh_get_wm_icon_reply_t;
  Txcb_ewmh_get_wm_icon_reply_t = record
      num_icons : dword;
      _reply : Pxcb_get_property_reply_t;
    end;
{*
 * @brief Hold reply of _NET_REQUEST_FRAME_EXTENTS GetProperty
  }
{* Width of the left border  }
{* Width of the right border  }
{* Width of the top border  }
{* Width of the bottom border  }

  Pxcb_ewmh_get_extents_reply_t = ^Txcb_ewmh_get_extents_reply_t;
  Txcb_ewmh_get_extents_reply_t = record
      left : Tuint32_t;
      right : Tuint32_t;
      top : Tuint32_t;
      bottom : Tuint32_t;
    end;
{*
 * @brief Hold reply of _NET_WM_FULLSCREEN_MONITORS GetProperty
  }
{* Monitor whose top edge defines the top edge of the fullscreen
      window  }
{* Monitor whose bottom edge defines the bottom edge of the
      fullscreen window  }
{* Monitor whose left edge defines the left edge of the fullscreen
      window  }
{* Monitor whose right edge defines the right edge of the
      fullscreen window  }

  Pxcb_ewmh_get_wm_fullscreen_monitors_reply_t = ^Txcb_ewmh_get_wm_fullscreen_monitors_reply_t;
  Txcb_ewmh_get_wm_fullscreen_monitors_reply_t = record
      top : Tuint32_t;
      bottom : Tuint32_t;
      left : Tuint32_t;
      right : Tuint32_t;
    end;
{*
 * @brief Send InternAtom requests for the EWMH atoms and its required atoms
 *
 * @param c The connection to the X server
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The cookies corresponding to EWMH atoms
  }

function xcb_ewmh_init_atoms(c:Pxcb_connection_t; ewmh:Pxcb_ewmh_connection_t):Pxcb_intern_atom_cookie_t;cdecl;external;
{*
 * @brief Process  the replies  to the screen  initialisation requests
 * previously sent
 *
 * @param emwh The information relative to EWMH
 * @param ewmh_cookies The cookies corresponding to EWMH atoms
 * @param e Error if any
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_init_atoms_replies(ewmh:Pxcb_ewmh_connection_t; ewmh_cookies:Pxcb_intern_atom_cookie_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{
static inline void
xcb_ewmh_connection_wipe(xcb_ewmh_connection_t *ewmh)

  free(ewmh->screens);
  free(ewmh->_NET_WM_CM_Sn);

 }
{*
 * @brief Send a SendEvent request containing a ClientMessage event
 *
 * This  function is  called  by all  the xcb_ewmh_request*  functions
 * whose should be used instead of calling directly this function
 *
 * @param c The X connection
 * @param window The window where the action will be applied
 * @param dest The destination window (usually the root window)
 * @param atom The type of the message
 * @param data_len The length of data to be sent
 * @param data The data to be sent
 * @return The cookie associated with the SendEvent request
  }
(* Const before type ignored *)
function xcb_ewmh_send_client_message(c:Pxcb_connection_t; window:Txcb_window_t; dest:Txcb_window_t; atom:Txcb_atom_t; data_len:Tuint32_t; 
           data:Puint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_window_from_reply(window:Pxcb_window_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_window_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; window:Pxcb_window_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_cardinal_from_reply(cardinal:Puint32_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_cardinal_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; cardinal:Puint32_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Get  a list  of atoms from  a given GetProperty  reply whose
 * type is ATOM
 *
 * This  function  is  called  by  all  the  xcb_ewmh_get_*_from_reply
 * functions  whose should  be used  instead of  calling  it directly.
 * Indeed,  The GetProperty request  has been  previously sent  by the
 * corresponding xcb_ewmh_get_*.
 *
 * @param atoms The atoms list
 * @param r The reply to get the atoms list from
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_get_atoms_from_reply(atoms:Pxcb_ewmh_get_atoms_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Get a list of atoms  from the reply of a GetProperty request
 * whose type is ATOM
 *
 * This function  is called by all  the xcb_ewmh_get_*_reply functions
 * whose  should   be  used  instead  of  calling   it  directly.  The
 * GetProperty request  has been previously sent  by the corresponding
 * xcb_ewmh_get_*.
 *
 * @param ewmh The per-screen EWMH specific information
 * @param cookie The GetProperty cookie
 * @param atoms The atoms list
 * @param e The error if any
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_get_atoms_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; atoms:Pxcb_ewmh_get_atoms_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Wipe the Atoms list reply
 *
 * This function must be called to free the memory allocated for atoms
 * when the reply is requested in *_reply functions.
 *
 * @param data The X reply to be freed
  }
procedure xcb_ewmh_get_atoms_reply_wipe(data:Pxcb_ewmh_get_atoms_reply_t);cdecl;external;
{*
 * @brief Get  a list  of atoms from  a given GetProperty  reply whose
 * type is WINDOW
 *
 * This  function  is  called  by  all  the  xcb_ewmh_get_*_from_reply
 * functions  whose should  be used  instead of  calling  it directly.
 * Indeed,  The GetProperty request  has been  previously sent  by the
 * corresponding xcb_ewmh_get_*.
 *
 * @param atoms The atoms list
 * @param r The reply to get the atoms list from
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_get_windows_from_reply(atoms:Pxcb_ewmh_get_windows_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_utf8_strings_from_reply(ewmh:Pxcb_ewmh_connection_t; data:Pxcb_ewmh_get_utf8_strings_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_utf8_strings_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; data:Pxcb_ewmh_get_utf8_strings_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Get a list of atoms  from the reply of a GetProperty request
 * whose type is WINDOW
 *
 * This function  is called by all  the xcb_ewmh_get_*_reply functions
 * whose  should   be  used  instead  of  calling   it  directly.  The
 * GetProperty request  has been previously sent  by the corresponding
 * xcb_ewmh_get_*.
 *
 * @param ewmh The per-screen EWMH specific information
 * @param cookie The GetProperty cookie
 * @param atoms The atoms list
 * @param e The error if any
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_get_windows_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; atoms:Pxcb_ewmh_get_windows_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Wipe the windows list reply
 *
 * This function must  be called to the free  the memory allocated for
 * windows when the reply is requested in '_reply' functions.
 *
 * @param data The X reply to be freed
  }
procedure xcb_ewmh_get_windows_reply_wipe(data:Pxcb_ewmh_get_windows_reply_t);cdecl;external;
{*
 * @brief Wipe the UTF-8 strings list reply
 *
 * This function must  be called to the free  the memory allocated for
 * UTF-8 strings when the reply is requested in '_reply' functions.
 *
 * @param data The X reply to be freed
  }
procedure xcb_ewmh_get_utf8_strings_reply_wipe(data:Pxcb_ewmh_get_utf8_strings_reply_t);cdecl;external;
{*
 * @brief Send a ChangeProperty request for _NET_SUPPORTED
 *
 * _NET_SUPPORTED, ATOM[]/32
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param list_len The number of Atoms supported by the WM
 * @param list The Atoms supported by the WM
 * @return Cookie associated with the ChangeProperty _NET_SUPPORTED request
  }
function xcb_ewmh_set_supported(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_supported
  }
function xcb_ewmh_set_supported_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send  GetProperty request to get  _NET_SUPPORTED root window
 *        property
 *
 * _NET_SUPPORTED, ATOM[]/32
 *
 * This property MUST  be set by the Window  Manager to indicate which
 * hints it supports. For example: considering _NET_WM_STATE both this
 * atom   and   all   supported  states   e.g.    _NET_WM_STATE_MODAL,
 * _NET_WM_STATE_STICKY, would be  listed. This assumes that backwards
 * incompatible changes will  not be made to the  hints (without being
 * renamed).
 *
 * This form can be used only if  the request will cause a reply to be
 * generated. Any returned error will be placed in the event queue.
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_SUPPORTED cookie of the GetProperty request
  }
function xcb_ewmh_get_supported_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_supported_unchecked
  }
function xcb_ewmh_get_supported(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Get the list of supported atoms
 *
 * @param supported The list of atoms contained in the reply
 * @param r GetProperty _NET_SUPPORTED reply
  }
{
static inline uint8_t
xcb_ewmh_get_supported_from_reply(xcb_ewmh_get_atoms_reply_t *supported,
                                  xcb_get_property_reply_t *r)

  return xcb_ewmh_get_atoms_from_reply(supported, r);


static inline uint8_t
xcb_ewmh_get_supported_reply(xcb_ewmh_connection_t *ewmh,
                             xcb_get_property_cookie_t cookie,
                             xcb_ewmh_get_atoms_reply_t *supported,
                             xcb_generic_error_t **e)

  return xcb_ewmh_get_atoms_reply(ewmh, cookie, supported, e);

 }
{*
 * @brief Send a ChangeProperty request for _NET_CLIENT_LIST
 *
 * _NET_CLIENT_LIST, WINDOW[]/32
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param list_len The number of Atoms supported by the WM
 * @param list The Atoms supported by the WM
 * @return Cookie associated with the ChangeProperty _NET_CLIENT_LIST request
  }
function xcb_ewmh_set_client_list(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_client_list
  }
function xcb_ewmh_set_client_list_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send GetProperty request to get _NET_CLIENT_LIST root window
 *        property
 *
 * This  array   contains  all  X   Windows  managed  by   the  Window
 * Manager. _NET_CLIENT_LIST has  initial mapping order, starting with
 * the oldest window.  This property SHOULD be set  and updated by the
 * Window Manager.
 *
 * @param ewmh The information relative to EWMH.
 * @return The _NET_CLIENT_LIST cookie of the GetProperty request.
  }
function xcb_ewmh_get_client_list_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Send GetProperty request to get _NET_CLIENT_LIST root window
 *        property
 *
 * @see xcb_ewmh_get_client_list_unchecked
 * @param ewmh The information relative to EWMH.
 * @return The _NET_CLIENT_LIST cookie of the GetProperty request.
  }
function xcb_ewmh_get_client_list(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief  Get   the  list  of  client  windows   from  a  GetProperty
 * _NET_CLIENT_LIST reply
 *
 * @param clients The list of clients contained in the reply
 * @param r GetProperty _NET_CLIENT_LIST reply
  }
{
static inline uint8_t
xcb_ewmh_get_client_list_from_reply(xcb_ewmh_get_windows_reply_t *clients,
                                    xcb_get_property_reply_t *r)

  return xcb_ewmh_get_windows_from_reply(clients, r);


static inline uint8_t
xcb_ewmh_get_client_list_reply(xcb_ewmh_connection_t *ewmh,
                               xcb_get_property_cookie_t cookie,
                               xcb_ewmh_get_windows_reply_t *clients,
                               xcb_generic_error_t **e)

  return xcb_ewmh_get_windows_reply(ewmh, cookie, clients, e);

 }
{*
 * @brief Send a ChangeProperty request for _NET_CLIENT_LIST_STACKING
 *
 * _NET_CLIENT_LIST_STACKING, WINDOW[]/32
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param list_len The number of Atoms supported by the WM
 * @param list The Atoms supported by the WM
 * @return Cookie associated with the ChangeProperty _NET_CLIENT_LIST_STACKING request
  }
function xcb_ewmh_set_client_list_stacking(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_client_list_stacking
  }
function xcb_ewmh_set_client_list_stacking_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief  Send GetProperty  request to  get _NET_CLIENT_LIST_STACKING
 *        root window property
 *
 * This  array   contains  all  X   Windows  managed  by   the  Window
 * Manager.  _NET_CLIENT_LIST_STACKING   has  initial  mapping  order,
 * starting with the  oldest window.  This property SHOULD  be set and
 * updated by the Window Manager.
 *
 * @param ewmh The information relative to EWMH
 * @return The _NET_CLIENT_LIST_STACKING cookie of the GetProperty request
  }
function xcb_ewmh_get_client_list_stacking_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_client_list_unchecked
  }
function xcb_ewmh_get_client_list_stacking(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief  Get   the  list  of  client  windows   from  a  GetProperty
 * _NET_CLIENT_LIST_STACKING reply
 *
 * @param clients The list of clients contained in the reply
 * @param r GetProperty _NET_CLIENT_LIST_STACKING reply
  }
{
static inline uint8_t
xcb_ewmh_get_client_list_stacking_from_reply(xcb_ewmh_get_windows_reply_t *clients,
                                             xcb_get_property_reply_t *r)

  return xcb_ewmh_get_windows_from_reply(clients, r);


static inline uint8_t
xcb_ewmh_get_client_list_stacking_reply(xcb_ewmh_connection_t *ewmh,
                                        xcb_get_property_cookie_t cookie,
                                        xcb_ewmh_get_windows_reply_t *clients,
                                        xcb_generic_error_t **e)

  return xcb_ewmh_get_windows_reply(ewmh, cookie, clients, e);

 }
{*
 * @brief Send a ChangeProperty request for _NET_NUMBER_OF_DESKTOPS
 *
 * _NET_NUMBER_OF_DESKTOPS? CARDINAL/32
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param number_of_desktops The number of desktops
 * @return Cookie associated with the ChangeProperty _NET_NUMBER_OF_DESKTOPS request
  }
function xcb_ewmh_set_number_of_desktops(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; number_of_desktops:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_number_of_desktops
  }
function xcb_ewmh_set_number_of_desktops_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; number_of_desktops:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send GetProperty request to get _NET_NUMBER_OF_DESKTOPS root
 *        window property
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_NUMBER_OF_DESKTOPS cookie of the GetProperty request.
  }
function xcb_ewmh_get_number_of_desktops_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_number_of_desktops_unchecked
  }
function xcb_ewmh_get_number_of_desktops(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief  Get   the  list  of  client  windows   from  a  GetProperty
 * _NET_NUMBER_OF_DESKTOPS reply
 *
 * @param clients The list of clients contained in the reply
 * @param r GetProperty _NET_NUMBER_OF_DESKTOPS reply
 * @return Return 1 on success, 0 otherwise
  }
{
static inline uint8_t
xcb_ewmh_get_number_of_desktops_from_reply(uint32_t *number_of_desktops,
                                           xcb_get_property_reply_t *r)

  return xcb_ewmh_get_cardinal_from_reply(number_of_desktops, r);


static inline uint8_t
xcb_ewmh_get_number_of_desktops_reply(xcb_ewmh_connection_t *ewmh,
                                      xcb_get_property_cookie_t cookie,
                                      uint32_t *number_of_desktops,
                                      xcb_generic_error_t **e)

  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, number_of_desktops, e);


static inline xcb_void_cookie_t
xcb_ewmh_request_change_number_of_desktops(xcb_ewmh_connection_t *ewmh,
                                           int screen_nbr,
                                           uint32_t new_number_of_desktops)

  return xcb_ewmh_send_client_message(ewmh->connection, XCB_NONE,
                                      ewmh->screens[screen_nbr]->root,
                                      ewmh->_NET_NUMBER_OF_DESKTOPS,
                                      sizeof(new_number_of_desktops),
                                      &new_number_of_desktops);

 }
{*
 * @brief Send a ChangeProperty request for _NET_DESKTOP_GEOMETRY
 *
 * _NET_DESKTOP_GEOMETRY width, height, CARDINAL[2]/32
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param new_width The new desktop width
 * @param new_height The new desktop height
 * @return Cookie associated with the ChangeProperty _NET_DESKTOP_GEOMETRY request
  }
function xcb_ewmh_set_desktop_geometry(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; new_width:Tuint32_t; new_height:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_desktop_geometry
  }
function xcb_ewmh_set_desktop_geometry_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; new_width:Tuint32_t; new_height:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send  GetProperty request to  get _NET_DESKTOP_GEOMETRY root
 *        window property
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_DESKTOP_GEOMETRY cookie of the GetProperty request
  }
function xcb_ewmh_get_desktop_geometry_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_desktop_geometry_unchecked
  }
function xcb_ewmh_get_desktop_geometry(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Send ClientMessage requesting to change the _NET_DESKTOP_GEOMETRY
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param new_width The new desktop width
 * @param new_height The new desktop height
 * @return The SendEvent cookie
  }
function xcb_ewmh_request_change_desktop_geometry(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; new_width:Tuint32_t; new_height:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief    Get   the   desktop    geometry   from    a   GetProperty
 * _NET_DESKTOP_GEOMETRY reply
 *
 * @param width The current desktop width
 * @param height The current desktop height
 * @param r GetProperty _NET_DESKTOP_GEOMETRY reply
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_get_desktop_geometry_from_reply(width:Puint32_t; height:Puint32_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Get reply from the GetProperty _NET_DESKTOP_GEOMETRY cookie
 *
 * The  parameter  e  supplied  to  this  function  must  be  NULL  if
 * xcb_get_desktop_geometry_unchecked() is used.  Otherwise, it stores
 * the error if any.
 *
 * @param ewmh The information relative to EWMH
 * @param cookie The _NET_DESKTOP_GEOMETRY GetProperty request cookie
 * @param width The current desktop width
 * @param width The current desktop height
 * @param The xcb_generic_error_t supplied
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_get_desktop_geometry_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; width:Puint32_t; height:Puint32_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Send a ChangeProperty request for _NET_DESKTOP_VIEWPORT
 *
 * _NET_DESKTOP_VIEWPORT x, y, CARDINAL[][2]/32
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param list_len The number of desktop viewports
 * @param list The desktop viewports
 * @return Cookie associated with the ChangeProperty _NET_DESKTOP_VIEWPORT request
  }
function xcb_ewmh_set_desktop_viewport(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_ewmh_coordinates_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_desktop_viewport
  }
function xcb_ewmh_set_desktop_viewport_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_ewmh_coordinates_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send  GetProperty request to  get _NET_DESKTOP_VIEWPORT root
 *        window property
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_DESKTOP_VIEWPORT cookie of the GetProperty request
  }
function xcb_ewmh_get_desktop_viewport_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_desktop_viewport_unchecked
  }
function xcb_ewmh_get_desktop_viewport(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Send ClientMessage requesting to change the _NET_DESKTOP_VIEWPORT
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param new_x The new x coordinate
 * @param new_y The new y coordinate
 * @return The SendEvent cookie
  }
function xcb_ewmh_request_change_desktop_viewport(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; x:Tuint32_t; y:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief    Get   the   desktop    geometry   from    a   GetProperty
 * _NET_DESKTOP_VIEWPORT reply
 *
 * @param vp The  current desktop viewports
 * @param r GetProperty _NET_DESKTOP_VIEWPORT reply
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_get_desktop_viewport_from_reply(vp:Pxcb_ewmh_get_desktop_viewport_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Get reply from the GetProperty _NET_DESKTOP_VIEWPORT cookie
 *
 * The  parameter  e  supplied  to  this  function  must  be  NULL  if
 * xcb_get_desktop_viewport_unchecked() is used.  Otherwise, it stores
 * the error if any.
 *
 * @param ewmh The information relative to EWMH
 * @param cookie The _NET_DESKTOP_VIEWPORT GetProperty request cookie
 * @param vp The current desktop viewports
 * @param The xcb_generic_error_t supplied
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_get_desktop_viewport_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; vp:Pxcb_ewmh_get_desktop_viewport_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Wipe the desktop viewports list reply
 *
 * This function must be called to free the memory allocated for atoms
 * when the reply  is requested in xcb_ewmh_get_desktop_viewport_reply
 * function.
 *
 * @param r The X reply to be freed
  }
procedure xcb_ewmh_get_desktop_viewport_reply_wipe(r:Pxcb_ewmh_get_desktop_viewport_reply_t);cdecl;external;
{*
 * @brief Send a ChangeProperty request for _NET_CURRENT_DESKTOP
 *
 * _NET_CURRENT_DESKTOP desktop, CARDINAL/32
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param new_current_desktop The new current desktop
 * @return Cookie associated with the ChangeProperty _NET_CURRENT_DESKTOP request
  }
function xcb_ewmh_set_current_desktop(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; new_current_desktop:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_current_desktop
  }
function xcb_ewmh_set_current_desktop_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; new_current_desktop:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief  Send GetProperty request  to get  _NET_CURRENT_DESKTOP root
 *        window property
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_CURRENT_DESKTOP cookie of the GetProperty request
  }
function xcb_ewmh_get_current_desktop_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_current_desktop_unchecked
  }
function xcb_ewmh_get_current_desktop(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Send ClientMessage requesting to change the _NET_CURRENT_DESKTOP
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param new_desktop The new current desktop
 * @param timestamp The request timestamp
 * @return The SendEvent cookie
  }
function xcb_ewmh_request_change_current_desktop(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; new_desktop:Tuint32_t; timestamp:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief    Get   the   desktop    geometry   from    a   GetProperty
 * _NET_CURRENT_DESKTOP reply
 *
 * @param current_desktop The  current desktop
 * @param r GetProperty _NET_CURRENT_DESKTOP reply
 * @return Return 1 on success, 0 otherwise
  }
{
static inline uint8_t
xcb_ewmh_get_current_desktop_from_reply(uint32_t *current_desktop,
                                        xcb_get_property_reply_t *r)

  return xcb_ewmh_get_cardinal_from_reply(current_desktop, r);


static inline uint8_t
xcb_ewmh_get_current_desktop_reply(xcb_ewmh_connection_t *ewmh,
                                   xcb_get_property_cookie_t cookie,
                                   uint32_t *current_desktop,
                                   xcb_generic_error_t **e)

  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, current_desktop, e);

 }
{*
 * @brief Send a ChangeProperty request for _NET_DESKTOP_NAMES
 *
 * _NET_DESKTOP_NAMES, UTF8_STRING[]
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param strings_len The number of desktop names
 * @param strings The desktop names
 * @return Cookie associated with the ChangeProperty _NET_DESKTOP_NAMES request
  }
(* Const before type ignored *)
function xcb_ewmh_set_desktop_names(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; strings_len:Tuint32_t; strings:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_desktop_names
  }
(* Const before type ignored *)
function xcb_ewmh_set_desktop_names_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; strings_len:Tuint32_t; strings:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief  Send  GetProperty request  to  get _NET_DESKTOP_NAMES  root
 *        window property
 *
 * @param ewmh The information relative to EWMH
 * @return The _NET_DESKTOP_NAMES cookie of the GetProperty request
  }
function xcb_ewmh_get_desktop_names_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_desktop_names_unchecked
  }
function xcb_ewmh_get_desktop_names(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief    Get   the   desktop    geometry   from    a   GetProperty
 * _NET_DESKTOP_NAMES reply
 *
 * @param ewmh The information relative to EWMH
 * @param names The desktop names
 * @param r GetProperty _NET_DESKTOP_NAMES reply
 * @return Return 1 on success, 0 otherwise
  }
{
static inline uint8_t
xcb_ewmh_get_desktop_names_from_reply(xcb_ewmh_connection_t *ewmh,
                                      xcb_ewmh_get_utf8_strings_reply_t *names,
                                      xcb_get_property_reply_t *r)

  return xcb_ewmh_get_utf8_strings_from_reply(ewmh, names, r);


static inline uint8_t
xcb_ewmh_get_desktop_names_reply(xcb_ewmh_connection_t *ewmh,
                                 xcb_get_property_cookie_t cookie,
                                 xcb_ewmh_get_utf8_strings_reply_t *names,
                                 xcb_generic_error_t **e)

  return xcb_ewmh_get_utf8_strings_reply(ewmh, cookie, names, e);

 }
{*
 * @brief Send a ChangeProperty request for _NET_ACTIVE_WINDOW
 *
 * _NET_ACTIVE_WINDOW, WINDOW/32
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param new_active_window The window to make active
 * @return Cookie associated with the ChangeProperty _NET_ACTIVE_WINDOW request
  }
function xcb_ewmh_set_active_window(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; new_active_window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_active_window
  }
function xcb_ewmh_set_active_window_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; new_active_window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send ClientMessage requesting to change the _NET_ACTIVE_WINDOW
 *
 * The window ID  of the currently active window or  None if no window
 * has  the focus.  This  is a  read-only property  set by  the Window
 * Manager. If a Client wants to activate another window, it MUST send
 * a  _NET_ACTIVE_WINDOW  client  message  to  the  root  window.  The
 * timestamp is Client's  last user activity timestamp at  the time of
 * the request, and the currently active window is the Client's active
 * toplevel window, if any (the Window Manager may be e.g. more likely
 * to obey  the request  if it will  mean transferring focus  from one
 * active window to another).
 *
 * @see xcb_ewmh_client_source_type_t
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @param window_to_active The window ID to activate
 * @param source_indication The source indication
 * @param timestamp The client's last user activity timestamp
 * @param current_active_window The currently active window or None
  }
function xcb_ewmh_request_change_active_window(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; window_to_activate:Txcb_window_t; source_indication:Txcb_ewmh_client_source_type_t; timestamp:Txcb_timestamp_t; 
           current_active_window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief  Send  GetProperty request  to  get _NET_ACTIVE_WINDOW  root
 *        window property
 *
 * The window ID  of the currently active window or  None if no window
 * has  the focus.  This is  a read-only  property set  by  the Window
 * Manager.  This property  SHOULD be  set and  updated by  the Window
 * Manager.
 *
 * This form can be used only if  the request will cause a reply to be
 * generated. Any returned error will be placed in the event queue.
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_ACTIVE_WINDOW cookie of the GetProperty request
  }
function xcb_ewmh_get_active_window_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief  Send  GetProperty request  to  get _NET_ACTIVE_WINDOW  root
 *        window property
 *
 * @see xcb_ewmh_get_active_window_unchecked
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_ACTIVE_WINDOW cookie of the GetProperty request
  }
function xcb_ewmh_get_active_window(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief  Get   the  list  of  client  windows   from  a  GetProperty
 * _NET_ACTIVE_WINDOW reply
 *
 * @param active_window The current active window
 * @param r GetProperty _NET_ACTIVE_WINDOW_OF_DESKTOPS reply
 * @return Return 1 on success, 0 otherwise
  }
{
static inline uint8_t
xcb_ewmh_get_active_window_from_reply(xcb_window_t *active_window,
                                      xcb_get_property_reply_t *r)

  return xcb_ewmh_get_window_from_reply(active_window, r);


static inline uint8_t
xcb_ewmh_get_active_window_reply(xcb_ewmh_connection_t *ewmh,
                                 xcb_get_property_cookie_t cookie,
                                 xcb_window_t *active_window,
                                 xcb_generic_error_t **e)

  return xcb_ewmh_get_window_reply(ewmh, cookie, active_window, e);

 }
{*
 * @brief Send a ChangeProperty request for _NET_WORKAREA
 *
 * _NET_WORKAREA, x, y, width, height CARDINAL[][4]/32
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param list_len The number of desktops workareas
 * @param list The desktops workareas
 * @return Cookie associated with the ChangeProperty _NET_WORKAREA request
  }
function xcb_ewmh_set_workarea(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_ewmh_geometry_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_workarea
  }
function xcb_ewmh_set_workarea_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_ewmh_geometry_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief  Send  GetProperty request  to  get _NET_WORKAREA  root
 *        window property
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_WORKAREA cookie of the GetProperty request
  }
function xcb_ewmh_get_workarea_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_virtual_roots_unchecked
  }
function xcb_ewmh_get_workarea(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Get  the desktop  geometry from a  GetProperty _NET_WORKAREA
 * reply
 *
 * @param wa The  current workarea
 * @param r GetProperty _NET_WORKAREA reply
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_get_workarea_from_reply(wa:Pxcb_ewmh_get_workarea_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Get reply from the GetProperty _NET_WORKAREA cookie
 *
 * The  parameter  e  supplied  to  this  function  must  be  NULL  if
 * xcb_get_workarea_unchecked()  is used.   Otherwise,  it stores  the
 * error if any.
 *
 * @param ewmh The information relative to EWMH
 * @param cookie The _NET_WORKAREA GetProperty request cookie
 * @param wa The current workareas of desktops
 * @param The xcb_generic_error_t supplied
 * @return Return 1 on success, 0 otherwise
  }
function xcb_ewmh_get_workarea_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; wa:Pxcb_ewmh_get_workarea_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Wipe the workarea list reply
 *
 * This function must be called to free the memory allocated for atoms
 * when   the  reply   is  requested   in  xcb_ewmh_get_workarea_reply
 * function.
 *
 * @param r The X reply to be freed
  }
procedure xcb_ewmh_get_workarea_reply_wipe(r:Pxcb_ewmh_get_workarea_reply_t);cdecl;external;
{*
 * @brief Send a ChangeProperty request for _NET_SUPPORTING_WM_CHECK
 *
 * _NET_SUPPORTING_WM_CHECK, WINDOW/32
 *
 * @param ewmh The per-screen EWMH information
 * @param parent_window The root window or child window created by the WM
 * @param child_window The child window created by the WM
 * @return Cookie associated with the ChangeProperty _NET_SUPPORTING_WM_CHECK request
  }
function xcb_ewmh_set_supporting_wm_check(ewmh:Pxcb_ewmh_connection_t; parent_window:Txcb_window_t; child_window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_supporting_wm_check
  }
function xcb_ewmh_set_supporting_wm_check_checked(ewmh:Pxcb_ewmh_connection_t; parent_window:Txcb_window_t; child_window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief  Send GetProperty  request  to get  _NET_SUPPORTING_WM_CHECK
 *        root window property
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_SUPPORTING_WM_CHECK cookie of the GetProperty request
  }
function xcb_ewmh_get_supporting_wm_check_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_supporting_wm_check_unchecked
  }
function xcb_ewmh_get_supporting_wm_check(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief  Get   the  list  of  client  windows   from  a  GetProperty
 * _NET_SUPPORTING_WM_CHECK reply
 *
 * @param window The child window created by the WM
 * @param r GetProperty _NET_SUPPORTING_WM_CHECK reply
 * @return Return 1 on success, 0 otherwise
  }
{
static inline uint8_t
xcb_ewmh_get_supporting_wm_check_from_reply(xcb_window_t *window,
                                            xcb_get_property_reply_t *r)

  return xcb_ewmh_get_window_from_reply(window, r);


static inline uint8_t
xcb_ewmh_get_supporting_wm_check_reply(xcb_ewmh_connection_t *ewmh,
                                       xcb_get_property_cookie_t cookie,
                                       xcb_window_t *window,
                                       xcb_generic_error_t **e)

  return xcb_ewmh_get_window_reply(ewmh, cookie, window, e);

 }
{*
 * @brief Send a ChangeProperty request for _NET_VIRTUAL_ROOTS
 *
 * _NET_VIRTUAL_ROOTS, WINDOW[]/32
 *
 * @param ewmh The per-screen EWMH information
 * @param screen_nbr The screen number
 * @param list_len The number of virtual root windows
 * @param list The virtual root windows
 * @return Cookie associated with the ChangeProperty _NET_VIRTUAL_ROOTS request
  }
function xcb_ewmh_set_virtual_roots(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_virtual_roots
  }
function xcb_ewmh_set_virtual_roots_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; list_len:Tuint32_t; list:Pxcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief  Send  GetProperty request  to  get _NET_VIRTUAL_ROOTS  root
 *        window property
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_VIRTUAL_ROOTS cookie of the GetProperty request
  }
function xcb_ewmh_get_virtual_roots_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_virtual_roots_unchecked
  }
function xcb_ewmh_get_virtual_roots(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Get  the desktop  geometry from a  GetProperty _NET_WORKAREA
 * reply
 *
 * @param virtual_roots The current virtual root windows
 * @param r GetProperty _NET_VIRTUAL_ROOTS reply
 * @return Return 1 on success, 0 otherwise
  }
{
static inline uint8_t
xcb_ewmh_get_virtual_roots_from_reply(xcb_ewmh_get_windows_reply_t *virtual_roots,
                                      xcb_get_property_reply_t *r)

  return xcb_ewmh_get_windows_from_reply(virtual_roots, r);


static inline uint8_t
xcb_ewmh_get_virtual_roots_reply(xcb_ewmh_connection_t *ewmh,
                                 xcb_get_property_cookie_t cookie,
                                 xcb_ewmh_get_windows_reply_t *virtual_roots,
                                 xcb_generic_error_t **e)

  return xcb_ewmh_get_windows_reply(ewmh, cookie, virtual_roots, e);

 }
function xcb_ewmh_set_desktop_layout(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; orientation:Txcb_ewmh_desktop_layout_orientation_t; columns:Tuint32_t; rows:Tuint32_t; 
           starting_corner:Txcb_ewmh_desktop_layout_starting_corner_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_desktop_layout_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; orientation:Txcb_ewmh_desktop_layout_orientation_t; columns:Tuint32_t; rows:Tuint32_t; 
           starting_corner:Txcb_ewmh_desktop_layout_starting_corner_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief  Send GetProperty  request to  get  _NET_DESKTOP_LAYOUT root
 *        window property
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_DESKTOP_LAYOUT cookie of the GetProperty request
  }
function xcb_ewmh_get_desktop_layout_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_desktop_layout_unchecked
  }
function xcb_ewmh_get_desktop_layout(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_desktop_layout_from_reply(desktop_layouts:Pxcb_ewmh_get_desktop_layout_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_desktop_layout_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; desktop_layouts:Pxcb_ewmh_get_desktop_layout_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
function xcb_ewmh_set_showing_desktop(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; desktop:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_showing_desktop_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; desktop:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_showing_desktop_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_showing_desktop(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_property_cookie_t;cdecl;external;
{
static inline uint8_t
xcb_ewmh_get_showing_desktop_from_reply(uint32_t *desktop,
                                        xcb_get_property_reply_t *r)

  return xcb_ewmh_get_cardinal_from_reply(desktop, r);


static inline uint8_t
xcb_ewmh_get_showing_desktop_reply(xcb_ewmh_connection_t *ewmh,
                                   xcb_get_property_cookie_t cookie,
                                   uint32_t *desktop,
                                   xcb_generic_error_t **e)

  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, desktop, e);


static inline xcb_void_cookie_t
xcb_ewmh_request_change_showing_desktop(xcb_ewmh_connection_t *ewmh,
                                        int screen_nbr,
                                        uint32_t enter)

  return xcb_ewmh_send_client_message(ewmh->connection, XCB_NONE,
                                      ewmh->screens[screen_nbr]->root,
                                      ewmh->_NET_SHOWING_DESKTOP,
                                      sizeof(enter), &enter);

 }
function xcb_ewmh_request_close_window(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; window_to_close:Txcb_window_t; timestamp:Txcb_timestamp_t; source_indication:Txcb_ewmh_client_source_type_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_request_moveresize_window(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; moveresize_window:Txcb_window_t; gravity:Txcb_gravity_t; source_indication:Txcb_ewmh_client_source_type_t; 
           flags:Txcb_ewmh_moveresize_window_opt_flags_t; x:Tuint32_t; y:Tuint32_t; width:Tuint32_t; height:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_request_wm_moveresize(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; moveresize_window:Txcb_window_t; x_root:Tuint32_t; y_root:Tuint32_t; 
           direction:Txcb_ewmh_moveresize_direction_t; button:Txcb_button_index_t; source_indication:Txcb_ewmh_client_source_type_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_request_restack_window(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; window_to_restack:Txcb_window_t; sibling_window:Txcb_window_t; detail:Txcb_stack_mode_t):Txcb_void_cookie_t;cdecl;external;
{
static inline xcb_void_cookie_t
xcb_ewmh_request_frame_extents(xcb_ewmh_connection_t *ewmh,
                               int screen_nbr,
                               xcb_window_t client_window)

  return xcb_ewmh_send_client_message(ewmh->connection, client_window,
                                      ewmh->screens[screen_nbr]->root,
                                      ewmh->_NET_REQUEST_FRAME_EXTENTS, 0, NULL);

 }
(* Const before type ignored *)
function xcb_ewmh_set_wm_name(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; strings_len:Tuint32_t; strings:Pchar):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_ewmh_set_wm_name_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; strings_len:Tuint32_t; strings:Pchar):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_name_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_name(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{
static inline uint8_t
xcb_ewmh_get_wm_name_from_reply(xcb_ewmh_connection_t *ewmh,
                                xcb_ewmh_get_utf8_strings_reply_t *data,
                                xcb_get_property_reply_t *r)

  return xcb_ewmh_get_utf8_strings_from_reply(ewmh, data, r);


static inline uint8_t
xcb_ewmh_get_wm_name_reply(xcb_ewmh_connection_t *ewmh,
                           xcb_get_property_cookie_t cookie,
                           xcb_ewmh_get_utf8_strings_reply_t *data,
                           xcb_generic_error_t **e)

  return xcb_ewmh_get_utf8_strings_reply(ewmh, cookie, data, e);

 }
(* Const before type ignored *)
function xcb_ewmh_set_wm_visible_name(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; strings_len:Tuint32_t; strings:Pchar):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_ewmh_set_wm_visible_name_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; strings_len:Tuint32_t; strings:Pchar):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_visible_name_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_visible_name(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{
static inline uint8_t
xcb_ewmh_get_wm_visible_name_from_reply(xcb_ewmh_connection_t *ewmh,
                                        xcb_ewmh_get_utf8_strings_reply_t *data,
                                        xcb_get_property_reply_t *r)

  return xcb_ewmh_get_utf8_strings_from_reply(ewmh, data, r);


static inline uint8_t
xcb_ewmh_get_wm_visible_name_reply(xcb_ewmh_connection_t *ewmh,
                                   xcb_get_property_cookie_t cookie,
                                   xcb_ewmh_get_utf8_strings_reply_t *data,
                                   xcb_generic_error_t **e)

  return xcb_ewmh_get_utf8_strings_reply(ewmh, cookie, data, e);

 }
(* Const before type ignored *)
function xcb_ewmh_set_wm_icon_name(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; strings_len:Tuint32_t; strings:Pchar):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_ewmh_set_wm_icon_name_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; strings_len:Tuint32_t; strings:Pchar):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_icon_name_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_icon_name(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{
static inline uint8_t
xcb_ewmh_get_wm_icon_name_from_reply(xcb_ewmh_connection_t *ewmh,
                                     xcb_ewmh_get_utf8_strings_reply_t *data,
                                     xcb_get_property_reply_t *r)

  return xcb_ewmh_get_utf8_strings_from_reply(ewmh, data, r);


static inline uint8_t
xcb_ewmh_get_wm_icon_name_reply(xcb_ewmh_connection_t *ewmh,
                                xcb_get_property_cookie_t cookie,
                                xcb_ewmh_get_utf8_strings_reply_t *data,
                                xcb_generic_error_t **e)

  return xcb_ewmh_get_utf8_strings_reply(ewmh, cookie, data, e);

 }
(* Const before type ignored *)
function xcb_ewmh_set_wm_visible_icon_name(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; strings_len:Tuint32_t; strings:Pchar):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_ewmh_set_wm_visible_icon_name_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; strings_len:Tuint32_t; strings:Pchar):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_visible_icon_name_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_visible_icon_name(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{
static inline uint8_t
xcb_ewmh_get_wm_visible_icon_name_from_reply(xcb_ewmh_connection_t *ewmh,
                                             xcb_ewmh_get_utf8_strings_reply_t *data,
                                             xcb_get_property_reply_t *r)

  return xcb_ewmh_get_utf8_strings_from_reply(ewmh, data, r);


static inline uint8_t
xcb_ewmh_get_wm_visible_icon_name_reply(xcb_ewmh_connection_t *ewmh,
                                        xcb_get_property_cookie_t cookie,
                                        xcb_ewmh_get_utf8_strings_reply_t *data,
                                        xcb_generic_error_t **e)

  return xcb_ewmh_get_utf8_strings_reply(ewmh, cookie, data, e);

 }
function xcb_ewmh_set_wm_desktop(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; desktop:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_desktop_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; desktop:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_desktop_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_desktop(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{
static inline uint8_t
xcb_ewmh_get_wm_desktop_from_reply(uint32_t *desktop,
                                   xcb_get_property_reply_t *r)

  return xcb_ewmh_get_cardinal_from_reply(desktop, r);


static inline uint8_t
xcb_ewmh_get_wm_desktop_reply(xcb_ewmh_connection_t *ewmh,
                              xcb_get_property_cookie_t cookie,
                              uint32_t *desktop,
                              xcb_generic_error_t **e)

  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, desktop, e);

 }
function xcb_ewmh_request_change_wm_desktop(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; client_window:Txcb_window_t; new_desktop:Tuint32_t; source_indication:Txcb_ewmh_client_source_type_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_window_type(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; list_len:Tuint32_t; list:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_window_type_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; list_len:Tuint32_t; list:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_window_type_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_window_type(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_window_type_from_reply(wtypes:Pxcb_ewmh_get_atoms_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_wm_window_type_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; name:Pxcb_ewmh_get_atoms_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
function xcb_ewmh_set_wm_state(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; list_len:Tuint32_t; list:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_state_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; list_len:Tuint32_t; list:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_state_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_state(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_state_from_reply(wtypes:Pxcb_ewmh_get_atoms_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_wm_state_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; name:Pxcb_ewmh_get_atoms_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
function xcb_ewmh_request_change_wm_state(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; client_window:Txcb_window_t; action:Txcb_ewmh_wm_state_action_t; first_property:Txcb_atom_t; 
           second_property:Txcb_atom_t; source_indication:Txcb_ewmh_client_source_type_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_allowed_actions(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; list_len:Tuint32_t; list:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_allowed_actions_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; list_len:Tuint32_t; list:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_allowed_actions_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_allowed_actions(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_allowed_actions_from_reply(wtypes:Pxcb_ewmh_get_atoms_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_wm_allowed_actions_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; name:Pxcb_ewmh_get_atoms_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
function xcb_ewmh_set_wm_strut(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; left:Tuint32_t; right:Tuint32_t; top:Tuint32_t; 
           bottom:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_strut_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; left:Tuint32_t; right:Tuint32_t; top:Tuint32_t; 
           bottom:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_strut_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_strut(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_strut_from_reply(struts:Pxcb_ewmh_get_extents_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_wm_strut_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; struts:Pxcb_ewmh_get_extents_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
function xcb_ewmh_set_wm_strut_partial(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; wm_strut:Txcb_ewmh_wm_strut_partial_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_strut_partial_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; wm_strut:Txcb_ewmh_wm_strut_partial_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_strut_partial_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_strut_partial(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_strut_partial_from_reply(struts:Pxcb_ewmh_wm_strut_partial_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_wm_strut_partial_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; struts:Pxcb_ewmh_wm_strut_partial_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
function xcb_ewmh_set_wm_icon_geometry(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; left:Tuint32_t; right:Tuint32_t; top:Tuint32_t; 
           bottom:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_icon_geometry_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; left:Tuint32_t; right:Tuint32_t; top:Tuint32_t; 
           bottom:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_icon_geometry_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_icon_geometry(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_icon_geometry_from_reply(icons:Pxcb_ewmh_geometry_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_wm_icon_geometry_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; icons:Pxcb_ewmh_geometry_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Send ChangeProperty request to set _NET_WM_ICON window
 *        property. The given data is considered to be already
 *        prepared, namely that it is an array such as: WIDTH1,
 *        HEIGHT1, IMG1, WIDTH2, HEIGHT2, IMG2.
 *
 *        If you only want to add or append a single icon, you may
 *        consider using xcb_ewmh_append_wm_icon_checked which is far
 *        easier to use.
 *
 * _NET_WM_ICON CARDINAL[][2+n]/32
 *
 * @param ewmh The information relative to EWMH
 * @param mode ChangeProperty mode (xcb_prop_mode_t)
 * @param window The window to set the property on
 * @param data_len Length of the data
 * @param data The data
  }
{
static inline xcb_void_cookie_t
xcb_ewmh_set_wm_icon_checked(xcb_ewmh_connection_t *ewmh,
                             uint8_t mode,
                             xcb_window_t window,
                             uint32_t data_len, uint32_t *data)

  return xcb_change_property_checked(ewmh->connection, mode,
                                     window, ewmh->_NET_WM_ICON,
                                     XCB_ATOM_CARDINAL, 32, data_len, data);


static inline xcb_void_cookie_t
xcb_ewmh_set_wm_icon(xcb_ewmh_connection_t *ewmh,
                     uint8_t mode,
                     xcb_window_t window,
                     uint32_t data_len, uint32_t *data)

  return xcb_change_property(ewmh->connection, mode, window,
                             ewmh->_NET_WM_ICON, XCB_ATOM_CARDINAL, 32,
                             data_len, data);

 }
function xcb_ewmh_append_wm_icon_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; width:Tuint32_t; height:Tuint32_t; img_len:Tuint32_t; 
           img:Puint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_append_wm_icon(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; width:Tuint32_t; height:Tuint32_t; img_len:Tuint32_t; 
           img:Puint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_icon_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_icon(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_icon_from_reply(wm_icon:Pxcb_ewmh_get_wm_icon_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_wm_icon_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; wm_icon:Pxcb_ewmh_get_wm_icon_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_ewmh_get_wm_icon_iterator(wm_icon:Pxcb_ewmh_get_wm_icon_reply_t):Txcb_ewmh_wm_icon_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_ewmh_get_wm_icon_length(wm_icon:Pxcb_ewmh_get_wm_icon_reply_t):dword;cdecl;external;
procedure xcb_ewmh_get_wm_icon_next(iterator:Pxcb_ewmh_wm_icon_iterator_t);cdecl;external;
procedure xcb_ewmh_get_wm_icon_reply_wipe(wm_icon:Pxcb_ewmh_get_wm_icon_reply_t);cdecl;external;
function xcb_ewmh_set_wm_pid(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; pid:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_pid_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; pid:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_pid_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_pid(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{
static inline uint8_t
xcb_ewmh_get_wm_pid_from_reply(uint32_t *pid,
                               xcb_get_property_reply_t *r)

  return xcb_ewmh_get_cardinal_from_reply(pid, r);


static inline uint8_t
xcb_ewmh_get_wm_pid_reply(xcb_ewmh_connection_t *ewmh,
                          xcb_get_property_cookie_t cookie,
                          uint32_t *pid,
                          xcb_generic_error_t **e)

  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, pid, e);

 }
function xcb_ewmh_set_wm_handled_icons(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; handled_icons:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_handled_icons_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; handled_icons:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_handled_icons_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_handled_icons(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{
static inline uint8_t
xcb_ewmh_get_wm_handled_icons_from_reply(uint32_t *handled_icons,
                                         xcb_get_property_reply_t *r)

  return xcb_ewmh_get_cardinal_from_reply(handled_icons, r);


static inline uint8_t
xcb_ewmh_get_wm_handled_icons_reply(xcb_ewmh_connection_t *ewmh,
                                    xcb_get_property_cookie_t cookie,
                                    uint32_t *handled_icons,
                                    xcb_generic_error_t **e)

  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, handled_icons, e);

 }
function xcb_ewmh_set_wm_user_time(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; xtime:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_user_time_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; pid:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_user_time_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_user_time(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{
static inline uint8_t
xcb_ewmh_get_wm_user_time_from_reply(uint32_t *xtime,
                                     xcb_get_property_reply_t *r)

  return xcb_ewmh_get_cardinal_from_reply(xtime, r);


static inline uint8_t
xcb_ewmh_get_wm_user_time_reply(xcb_ewmh_connection_t *ewmh,
                                xcb_get_property_cookie_t cookie,
                                uint32_t *xtime,
                                xcb_generic_error_t **e)

  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, xtime, e);

 }
function xcb_ewmh_set_wm_user_time_window(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; xtime:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_user_time_window_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; pid:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_user_time_window_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_user_time_window(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{
static inline uint8_t
xcb_ewmh_get_wm_user_time_window_from_reply(uint32_t *xtime,
                                            xcb_get_property_reply_t *r)

  return xcb_ewmh_get_cardinal_from_reply(xtime, r);


static inline uint8_t
xcb_ewmh_get_wm_user_time_window_reply(xcb_ewmh_connection_t *ewmh,
                                       xcb_get_property_cookie_t cookie,
                                       uint32_t *xtime,
                                       xcb_generic_error_t **e)

  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, xtime, e);

 }
function xcb_ewmh_set_frame_extents(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; left:Tuint32_t; right:Tuint32_t; top:Tuint32_t; 
           bottom:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_frame_extents_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; left:Tuint32_t; right:Tuint32_t; top:Tuint32_t; 
           bottom:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_frame_extents_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_frame_extents(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_frame_extents_from_reply(frame_extents:Pxcb_ewmh_get_extents_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_frame_extents_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; frame_extents:Pxcb_ewmh_get_extents_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
function xcb_ewmh_send_wm_ping(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; timestamp:Txcb_timestamp_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_sync_request_counter(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; wm_sync_request_counter_atom:Txcb_atom_t; low:Tuint32_t; high:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_sync_request_counter_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; wm_sync_request_counter_atom:Txcb_atom_t; low:Tuint32_t; high:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_sync_request_counter_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_sync_request_counter(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_sync_request_counter_from_reply(counter:Puint64_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_wm_sync_request_counter_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; counter:Puint64_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
function xcb_ewmh_send_wm_sync_request(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; wm_protocols_atom:Txcb_atom_t; wm_sync_request_atom:Txcb_atom_t; timestamp:Txcb_timestamp_t; 
           counter:Tuint64_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_fullscreen_monitors(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; top:Tuint32_t; bottom:Tuint32_t; left:Tuint32_t; 
           right:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_set_wm_fullscreen_monitors_checked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t; top:Tuint32_t; bottom:Tuint32_t; left:Tuint32_t; 
           right:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_fullscreen_monitors_unchecked(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_fullscreen_monitors(ewmh:Pxcb_ewmh_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_fullscreen_monitors_from_reply(monitors:Pxcb_ewmh_get_wm_fullscreen_monitors_reply_t; r:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
function xcb_ewmh_get_wm_fullscreen_monitors_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_property_cookie_t; monitors:Pxcb_ewmh_get_wm_fullscreen_monitors_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
function xcb_ewmh_request_change_wm_fullscreen_monitors(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; window:Txcb_window_t; top:Tuint32_t; bottom:Tuint32_t; 
           left:Tuint32_t; right:Tuint32_t; source_indication:Txcb_ewmh_client_source_type_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Set _NET_WM_CM_Sn ownership to the given window
 *
 * For  each  screen they  manage,  compositing  manager MUST  acquire
 * ownership of a selection named _NET_WM_CM_Sn, where n is the screen
 * number.
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @param owner The new owner of _NET_WM_CM_Sn selection
 * @param timestamp The client's last user activity timestamp
 * @param selection_data1 Optional data described by ICCCM
 * @param selection_data2 Optional data described by ICCCM
  }
function xcb_ewmh_set_wm_cm_owner(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; owner:Txcb_window_t; timestamp:Txcb_timestamp_t; selection_data1:Tuint32_t; 
           selection_data2:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_set_wm_cm_owner
  }
function xcb_ewmh_set_wm_cm_owner_checked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint; owner:Txcb_window_t; timestamp:Txcb_timestamp_t; selection_data1:Tuint32_t; 
           selection_data2:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief   Send  GetSelectOwner   request   to  get   the  owner   of
 *        _NET_WM_CM_Sn root window property
 *
 * @param ewmh The information relative to EWMH
 * @param screen_nbr The screen number
 * @return The _NET_WM_CM_Sn cookie of the GetSelectionOwner request
  }
function xcb_ewmh_get_wm_cm_owner_unchecked(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_selection_owner_cookie_t;cdecl;external;
{*
 * @see xcb_ewmh_get_wm_cm_owner_unchecked
  }
function xcb_ewmh_get_wm_cm_owner(ewmh:Pxcb_ewmh_connection_t; screen_nbr:longint):Txcb_get_selection_owner_cookie_t;cdecl;external;
function xcb_ewmh_get_wm_cm_owner_from_reply(owner:Pxcb_window_t; r:Pxcb_get_selection_owner_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Get reply from the GetProperty _NET_CLIENT_LIST cookie
 *
 * The  parameter  e  supplied  to  this  function  must  be  NULL  if
 * xcb_get_window_client_list_unchecked()  is   used.   Otherwise,  it
 * stores the error if any.
 *
 * @param ewmh The information relative to EWMH.
 * @param cookie The _NET_WM_CM_Sn GetSelectionOwner request cookie.
 * @param owner The window ID which owns the selection or None.
 * @param The xcb_generic_error_t supplied.
 * @return Return 1 on success, 0 otherwise.
  }
function xcb_ewmh_get_wm_cm_owner_reply(ewmh:Pxcb_ewmh_connection_t; cookie:Txcb_get_selection_owner_cookie_t; owner:Pxcb_window_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{*
 * @
  }
{$endif}
{ __XCB_EWMH_H__  }

implementation


end.
