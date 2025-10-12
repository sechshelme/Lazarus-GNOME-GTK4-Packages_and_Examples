
unit xcb_icccm;
interface

{
  Automatically converted by H2Pas 1.0.0 from xcb_icccm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xcb_icccm.h
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
Pxcb_atom_t  = ^xcb_atom_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_get_property_reply_t  = ^xcb_get_property_reply_t;
Pxcb_icccm_get_text_property_reply_t  = ^xcb_icccm_get_text_property_reply_t;
Pxcb_icccm_get_wm_class_reply_t  = ^xcb_icccm_get_wm_class_reply_t;
Pxcb_icccm_get_wm_colormap_windows_reply_t  = ^xcb_icccm_get_wm_colormap_windows_reply_t;
Pxcb_icccm_get_wm_protocols_reply_t  = ^xcb_icccm_get_wm_protocols_reply_t;
Pxcb_icccm_size_hints_flags_t  = ^xcb_icccm_size_hints_flags_t;
Pxcb_icccm_wm_hints_t  = ^xcb_icccm_wm_hints_t;
Pxcb_icccm_wm_state_t  = ^xcb_icccm_wm_state_t;
Pxcb_icccm_wm_t  = ^xcb_icccm_wm_t;
Pxcb_size_hints_t  = ^xcb_size_hints_t;
Pxcb_window_t  = ^xcb_window_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __XCB_ICCCM_H__}
{$define __XCB_ICCCM_H__}
{
 * Copyright (C) 2008 Arnaud Fontaine <arnau@debian.org>
 * Copyright (C) 2007-2008 Vincent Torri <vtorri@univ-evry.fr>
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 * CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the names of the authors or
 * their institutions shall not be used in advertising or otherwise to
 * promote the sale, use or other dealings in this Software without
 * prior written authorization from the authors.
  }
{*
 * @defgroup xcb__icccm_t XCB ICCCM Functions
 *
 * These functions allow easy handling of the protocol described in the
 * Inter-Client Communication Conventions Manual.
 *
 * @
  }
{$include <xcb/xcb.h>}
{ C++ extern C conditionnal removed }
{*
 * @brief TextProperty reply structure.
  }
{* Store reply to avoid memory allocation, should normally not be
    used directly  }
{* Encoding used  }
{* Length of the name field above  }
{* Property value  }
{* Format, may be 8, 16 or 32  }
type
  Pxcb_icccm_get_text_property_reply_t = ^Txcb_icccm_get_text_property_reply_t;
  Txcb_icccm_get_text_property_reply_t = record
      _reply : Pxcb_get_property_reply_t;
      encoding : Txcb_atom_t;
      name_len : Tuint32_t;
      name : Pchar;
      format : Tuint8_t;
    end;
{*
 * @brief Deliver a GetProperty request to the X server.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @param property Property atom to get.
 * @return The request cookie.
 *
 * Allow to get a window property, in most case you might want to use
 * above functions to get an ICCCM property for a given window.
  }

function xcb_icccm_get_text_property(c:Pxcb_connection_t; window:Txcb_window_t; _property:Txcb_atom_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_text_property()
  }
function xcb_icccm_get_text_property_unchecked(c:Pxcb_connection_t; window:Txcb_window_t; _property:Txcb_atom_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill given structure with the property value of a window.
 * @param c The connection to the X server.
 * @param cookie TextProperty request cookie.
 * @param prop TextProperty reply which is to be filled.
 * @param e Error if any.
 * @return Return 1 on success, 0 otherwise.
 *
 * If the function return 0 (failure), the content of prop is unmodified and
 * therefore the structure must not be wiped.
 *
 * The parameter e supplied to this function must be NULL if
 * xcb_icccm_get_text_property_unchecked() is used.  Otherwise, it stores
 * the error if any.  prop structure members should be freed by
 * xcb_icccm_get_text_property_reply_wipe().
  }
function xcb_icccm_get_text_property_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; prop:Pxcb_icccm_get_text_property_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Wipe prop structure members previously allocated by
 *        xcb_icccm_get_text_property_reply().
 * @param prop prop structure whose members is going to be freed.
  }
procedure xcb_icccm_get_text_property_reply_wipe(prop:Pxcb_icccm_get_text_property_reply_t);cdecl;external;
{ WM_NAME  }
{*
 * @brief Deliver a SetProperty request to set WM_NAME property value.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @param encoding Encoding used for the data passed in the name parameter, the set property will also have this encoding as its type.
 * @param format Encoding format.
 * @param name_len Length of name value to set.
 * @param name Name value to set.
  }
(* Const before type ignored *)
function xcb_icccm_set_wm_name_checked(c:Pxcb_connection_t; window:Txcb_window_t; encoding:Txcb_atom_t; format:Tuint8_t; name_len:Tuint32_t; 
           name:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_set_wm_name_checked()
  }
(* Const before type ignored *)
function xcb_icccm_set_wm_name(c:Pxcb_connection_t; window:Txcb_window_t; encoding:Txcb_atom_t; format:Tuint8_t; name_len:Tuint32_t; 
           name:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Deliver a GetProperty request to the X server for WM_NAME.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @return The request cookie.
  }
function xcb_icccm_get_wm_name(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_wm_name()
  }
function xcb_icccm_get_wm_name_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill given structure with the WM_NAME property of a window.
 * @param c The connection to the X server.
 * @param cookie Request cookie.
 * @param prop WM_NAME property value.
 * @param e Error if any.
 * @see xcb_icccm_get_text_property_reply()
 * @return Return 1 on success, 0 otherwise.
  }
function xcb_icccm_get_wm_name_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; prop:Pxcb_icccm_get_text_property_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{ WM_ICON_NAME  }
{*
 * @brief Deliver a SetProperty request to set WM_ICON_NAME property value.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @param encoding Encoding used for the data passed in the name parameter, the set property will also have this encoding as its type.
 * @param format Encoding format.
 * @param name_len Length of name value to set.
 * @param name Name value to set.
  }
(* Const before type ignored *)
function xcb_icccm_set_wm_icon_name_checked(c:Pxcb_connection_t; window:Txcb_window_t; encoding:Txcb_atom_t; format:Tuint8_t; name_len:Tuint32_t; 
           name:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_set_wm_icon_name_checked()
  }
(* Const before type ignored *)
function xcb_icccm_set_wm_icon_name(c:Pxcb_connection_t; window:Txcb_window_t; encoding:Txcb_atom_t; format:Tuint8_t; name_len:Tuint32_t; 
           name:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send request to get WM_ICON_NAME property of a window.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @return The request cookie.
  }
function xcb_icccm_get_wm_icon_name(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_wm_icon_name()
  }
function xcb_icccm_get_wm_icon_name_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill given structure with the WM_ICON_NAME property of a window.
 * @param c The connection to the X server.
 * @param cookie Request cookie.
 * @param prop WM_ICON_NAME property value.
 * @param e Error if any.
 * @see xcb_icccm_get_text_property_reply()
 * @return Return 1 on success, 0 otherwise.
  }
function xcb_icccm_get_wm_icon_name_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; prop:Pxcb_icccm_get_text_property_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{ WM_COLORMAP_WINDOWS  }
{*
 * @brief Deliver a ChangeProperty request to set WM_COLORMAP_WINDOWS property value.
 * @param c The connection to the X server.
 * @param wm_colormap_windows The WM_COLORMAP_WINDOWS atom
 * @param window Window X identifier.
 * @param list_len Windows list len.
 * @param list Windows list.
 * @return The request cookie.
  }
(* Const before type ignored *)
function xcb_icccm_set_wm_colormap_windows_checked(c:Pxcb_connection_t; window:Txcb_window_t; wm_colormap_windows_atom:Txcb_atom_t; list_len:Tuint32_t; list:Pxcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_set_wm_colormap_windows_checked()
  }
(* Const before type ignored *)
function xcb_icccm_set_wm_colormap_windows(c:Pxcb_connection_t; window:Txcb_window_t; wm_colormap_windows_atom:Txcb_atom_t; list_len:Tuint32_t; list:Pxcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief WM_COLORMAP_WINDOWS structure.
  }
{* Length of the windows list  }
{* Windows list  }
{* Store reply to avoid memory allocation, should normally not be
    used directly  }
type
  Pxcb_icccm_get_wm_colormap_windows_reply_t = ^Txcb_icccm_get_wm_colormap_windows_reply_t;
  Txcb_icccm_get_wm_colormap_windows_reply_t = record
      windows_len : Tuint32_t;
      windows : Pxcb_window_t;
      _reply : Pxcb_get_property_reply_t;
    end;
{*
 * @brief Send request to get WM_COLORMAP_WINDOWS property of a given window.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @return The request cookie.
  }

function xcb_icccm_get_wm_colormap_windows(c:Pxcb_connection_t; window:Txcb_window_t; wm_colormap_windows_atom:Txcb_atom_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_wm_colormap_windows()
  }
function xcb_icccm_get_wm_colormap_windows_unchecked(c:Pxcb_connection_t; window:Txcb_window_t; wm_colormap_windows_atom:Txcb_atom_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill the given structure with the WM_COLORMAP_WINDOWS property of a window.
 * @param reply The reply of the GetProperty request.
 * @param colormap_windows WM_COLORMAP property value.
 * @return Return 1 on success, 0 otherwise.
 *
 * protocols structure members should be freed by
 * xcb_icccm_get_wm_protocols_reply_wipe().
  }
function xcb_icccm_get_wm_colormap_windows_from_reply(reply:Pxcb_get_property_reply_t; colormap_windows:Pxcb_icccm_get_wm_colormap_windows_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Fill the given structure with the WM_COLORMAP_WINDOWS property of a window.
 * @param c The connection to the X server.
 * @param cookie Request cookie.
 * @param protocols WM_COLORMAP_WINDOWS property value.
 * @param e Error if any.
 * @return Return 1 on success, 0 otherwise.
 *
 * The parameter e supplied to this function must be NULL if
 * xcb_icccm_get_wm_colormap_windows_unchecked() is used.  Otherwise, it
 * stores the error if any. protocols structure members should be
 * freed by xcb_icccm_get_wm_colormap_windows_reply_wipe().
  }
function xcb_icccm_get_wm_colormap_windows_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; windows:Pxcb_icccm_get_wm_colormap_windows_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Wipe protocols structure members previously allocated by
 *        xcb_icccm_get_wm_colormap_windows_reply().
 * @param windows windows structure whose members is going to be freed.
  }
procedure xcb_icccm_get_wm_colormap_windows_reply_wipe(windows:Pxcb_icccm_get_wm_colormap_windows_reply_t);cdecl;external;
{ WM_CLIENT_MACHINE  }
{*
 * @brief Deliver a SetProperty request to set WM_CLIENT_MACHINE property value.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @param encoding Encoding used for the data passed in the name parameter, the set property will also have this encoding as its type.
 * @param format Encoding format.
 * @param name_len Length of name value to set.
 * @param name Name value to set.
  }
(* Const before type ignored *)
function xcb_icccm_set_wm_client_machine_checked(c:Pxcb_connection_t; window:Txcb_window_t; encoding:Txcb_atom_t; format:Tuint8_t; name_len:Tuint32_t; 
           name:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_set_wm_client_machine_checked()
  }
(* Const before type ignored *)
function xcb_icccm_set_wm_client_machine(c:Pxcb_connection_t; window:Txcb_window_t; encoding:Txcb_atom_t; format:Tuint8_t; name_len:Tuint32_t; 
           name:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send request to get WM_CLIENT_MACHINE property of a window.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @return The request cookie.
  }
function xcb_icccm_get_wm_client_machine(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_wm_client_machine()
  }
function xcb_icccm_get_wm_client_machine_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill given structure with the WM_CLIENT_MACHINE property of a window.
 * @param c The connection to the X server.
 * @param cookie Request cookie.
 * @param prop WM_CLIENT_MACHINE property value.
 * @param e Error if any.
 * @see xcb_icccm_get_text_property_reply()
 * @return Return 1 on success, 0 otherwise.
  }
function xcb_icccm_get_wm_client_machine_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; prop:Pxcb_icccm_get_text_property_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{ WM_CLASS  }
{*
 * @brief WM_CLASS hint structure
  }
{*
 * @brief Deliver a SetProperty request to set WM_CLASS property value.
 *
 * WM_CLASS string is a concatenation of the instance and class name
 * strings respectively (including null character).
 *
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @param class_len Length of WM_CLASS string.
 * @param class_name WM_CLASS string.
 * @return The request cookie.
  }
(* Const before type ignored *)
function xcb_icccm_set_wm_class_checked(c:Pxcb_connection_t; window:Txcb_window_t; class_len:Tuint32_t; class_name:Pchar):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_set_wm_class_checked()
  }
(* Const before type ignored *)
function xcb_icccm_set_wm_class(c:Pxcb_connection_t; window:Txcb_window_t; class_len:Tuint32_t; class_name:Pchar):Txcb_void_cookie_t;cdecl;external;
{* Instance name  }
{* Class of application  }
{* Store reply to avoid memory allocation, should normally not be
    used directly  }
type
  Pxcb_icccm_get_wm_class_reply_t = ^Txcb_icccm_get_wm_class_reply_t;
  Txcb_icccm_get_wm_class_reply_t = record
      instance_name : Pchar;
      class_name : Pchar;
      _reply : Pxcb_get_property_reply_t;
    end;
{*
 * @brief Deliver a GetProperty request to the X server for WM_CLASS.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @return The request cookie.
  }

function xcb_icccm_get_wm_class(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_wm_class()
  }
function xcb_icccm_get_wm_class_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill give structure with the WM_CLASS property of a window.
 * @param prop The property structure to fill.
 * @param reply The property request reply.
 * @return Return 1 on success, 0 otherwise.
  }
function xcb_icccm_get_wm_class_from_reply(prop:Pxcb_icccm_get_wm_class_reply_t; reply:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Fill given structure with the WM_CLASS property of a window.
 * @param c The connection to the X server.
 * @param cookie Request cookie.
 * @param prop WM_CLASS property value.
 * @param e Error if any.
 * @return Return 1 on success, 0 otherwise.
 *
 * The parameter e supplied to this function must be NULL if
 * xcb_icccm_get_wm_class_unchecked() is used.  Otherwise, it stores the
 * error if any. prop structure members should be freed by
 * xcb_icccm_get_wm_class_reply_wipe().
  }
function xcb_icccm_get_wm_class_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; prop:Pxcb_icccm_get_wm_class_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Wipe prop structure members previously allocated by
 *        xcb_icccm_get_wm_class_reply().
 * @param prop prop structure whose members is going to be freed.
  }
procedure xcb_icccm_get_wm_class_reply_wipe(prop:Pxcb_icccm_get_wm_class_reply_t);cdecl;external;
{ WM_TRANSIENT_FOR  }
{*
 * @brief Deliver a SetProperty request to set WM_TRANSIENT_FOR property value.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @param transient_for_window The WM_TRANSIENT_FOR window X identifier.
 * @return The request cookie.
  }
function xcb_icccm_set_wm_transient_for_checked(c:Pxcb_connection_t; window:Txcb_window_t; transient_for_window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_set_wm_transient_for
  }
function xcb_icccm_set_wm_transient_for(c:Pxcb_connection_t; window:Txcb_window_t; transient_for_window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send request to get WM_TRANSIENT_FOR property of a window.
 * @param c The connection to the X server
 * @param window Window X identifier.
 * @return The request cookie.
  }
function xcb_icccm_get_wm_transient_for(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_wm_transient_for_unchecked()
  }
function xcb_icccm_get_wm_transient_for_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill given window pointer with the WM_TRANSIENT_FOR property of a window.
 * @param prop WM_TRANSIENT_FOR property value.
 * @param reply The get property request reply.
 * @return Return 1 on success, 0 otherwise.
  }
function xcb_icccm_get_wm_transient_for_from_reply(prop:Pxcb_window_t; reply:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Fill given structure with the WM_TRANSIENT_FOR property of a window.
 * @param c The connection to the X server.
 * @param cookie Request cookie.
 * @param prop WM_TRANSIENT_FOR property value.
 * @param e Error if any.
 * @return Return 1 on success, 0 otherwise.
 *
 * The parameter e supplied to this function must be NULL if
 * xcb_icccm_get_wm_transient_for_unchecked() is used.  Otherwise, it stores
 * the error if any.
  }
function xcb_icccm_get_wm_transient_for_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; prop:Pxcb_window_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{ WM_SIZE_HINTS  }
type
  Pxcb_icccm_size_hints_flags_t = ^Txcb_icccm_size_hints_flags_t;
  Txcb_icccm_size_hints_flags_t =  Longint;
  Const
    XCB_ICCCM_SIZE_HINT_US_POSITION = 1 shl 0;
    XCB_ICCCM_SIZE_HINT_US_SIZE = 1 shl 1;
    XCB_ICCCM_SIZE_HINT_P_POSITION = 1 shl 2;
    XCB_ICCCM_SIZE_HINT_P_SIZE = 1 shl 3;
    XCB_ICCCM_SIZE_HINT_P_MIN_SIZE = 1 shl 4;
    XCB_ICCCM_SIZE_HINT_P_MAX_SIZE = 1 shl 5;
    XCB_ICCCM_SIZE_HINT_P_RESIZE_INC = 1 shl 6;
    XCB_ICCCM_SIZE_HINT_P_ASPECT = 1 shl 7;
    XCB_ICCCM_SIZE_HINT_BASE_SIZE = 1 shl 8;
    XCB_ICCCM_SIZE_HINT_P_WIN_GRAVITY = 1 shl 9;
;
{*
 * @brief Size hints structure.
  }
{* User specified flags  }
{* User-specified position  }
{* User-specified size  }
{* Program-specified minimum size  }
{* Program-specified maximum size  }
{* Program-specified resize increments  }
{* Program-specified minimum aspect ratios  }
{* Program-specified maximum aspect ratios  }
{* Program-specified base size  }
{* Program-specified window gravity  }
type
  Pxcb_size_hints_t = ^Txcb_size_hints_t;
  Txcb_size_hints_t = record
      flags : Tuint32_t;
      x : Tint32_t;
      y : Tint32_t;
      width : Tint32_t;
      height : Tint32_t;
      min_width : Tint32_t;
      min_height : Tint32_t;
      max_width : Tint32_t;
      max_height : Tint32_t;
      width_inc : Tint32_t;
      height_inc : Tint32_t;
      min_aspect_num : Tint32_t;
      min_aspect_den : Tint32_t;
      max_aspect_num : Tint32_t;
      max_aspect_den : Tint32_t;
      base_width : Tint32_t;
      base_height : Tint32_t;
      win_gravity : Tuint32_t;
    end;
{* Number of elements in this structure  }

const
  XCB_ICCCM_NUM_WM_SIZE_HINTS_ELEMENTS = 18;  
{*
 * @brief Set size hints to a given position.
 * @param hints SIZE_HINTS structure.
 * @param user_specified Is the size user-specified?
 * @param x The X position.
 * @param y The Y position.
  }

procedure xcb_icccm_size_hints_set_position(hints:Pxcb_size_hints_t; user_specified:longint; x:Tint32_t; y:Tint32_t);cdecl;external;
{*
 * @brief Set size hints to a given size.
 * @param hints SIZE_HINTS structure.
 * @param user_specified is the size user-specified?
 * @param width The width.
 * @param height The height.
  }
procedure xcb_icccm_size_hints_set_size(hints:Pxcb_size_hints_t; user_specified:longint; width:Tint32_t; height:Tint32_t);cdecl;external;
{*
 * @brief Set size hints to a given minimum size.
 * @param hints SIZE_HINTS structure.
 * @param width The minimum width.
 * @param height The minimum height.
  }
procedure xcb_icccm_size_hints_set_min_size(hints:Pxcb_size_hints_t; min_width:Tint32_t; min_height:Tint32_t);cdecl;external;
{*
 * @brief Set size hints to a given maximum size.
 * @param hints SIZE_HINTS structure.
 * @param width The maximum width.
 * @param height The maximum height.
  }
procedure xcb_icccm_size_hints_set_max_size(hints:Pxcb_size_hints_t; max_width:Tint32_t; max_height:Tint32_t);cdecl;external;
{*
 * @brief Set size hints to a given resize increments.
 * @param hints SIZE_HINTS structure.
 * @param width The resize increments width.
 * @param height The resize increments height.
  }
procedure xcb_icccm_size_hints_set_resize_inc(hints:Pxcb_size_hints_t; width_inc:Tint32_t; height_inc:Tint32_t);cdecl;external;
{*
 * @brief Set size hints to a given aspect ratios.
 * @param hints SIZE_HINTS structure.
 * @param min_aspect_num The minimum aspect ratios for the width.
 * @param min_aspect_den The minimum aspect ratios for the height.
 * @param max_aspect_num The maximum aspect ratios for the width.
 * @param max_aspect_den The maximum aspect ratios for the height.
  }
procedure xcb_icccm_size_hints_set_aspect(hints:Pxcb_size_hints_t; min_aspect_num:Tint32_t; min_aspect_den:Tint32_t; max_aspect_num:Tint32_t; max_aspect_den:Tint32_t);cdecl;external;
{*
 * @brief Set size hints to a given base size.
 * @param hints SIZE_HINTS structure.
 * @param base_width Base width.
 * @param base_height Base height.
  }
procedure xcb_icccm_size_hints_set_base_size(hints:Pxcb_size_hints_t; base_width:Tint32_t; base_height:Tint32_t);cdecl;external;
{*
 * @brief Set size hints to a given window gravity.
 * @param hints SIZE_HINTS structure.
 * @param win_gravity Window gravity value.
  }
procedure xcb_icccm_size_hints_set_win_gravity(hints:Pxcb_size_hints_t; win_gravity:Txcb_gravity_t);cdecl;external;
{*
 * @brief Deliver a ChangeProperty request to set a value to a given property.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @param property Property to set value for.
 * @param hints Hints value to set.
  }
function xcb_icccm_set_wm_size_hints_checked(c:Pxcb_connection_t; window:Txcb_window_t; _property:Txcb_atom_t; hints:Pxcb_size_hints_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_set_wm_size_hints_checked()
  }
function xcb_icccm_set_wm_size_hints(c:Pxcb_connection_t; window:Txcb_window_t; _property:Txcb_atom_t; hints:Pxcb_size_hints_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send request to get size hints structure for the named property.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @param property Specify the property name.
 * @return The request cookie.
  }
function xcb_icccm_get_wm_size_hints(c:Pxcb_connection_t; window:Txcb_window_t; _property:Txcb_atom_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_wm_size_hints()
  }
function xcb_icccm_get_wm_size_hints_unchecked(c:Pxcb_connection_t; window:Txcb_window_t; _property:Txcb_atom_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill given structure with the size hints of the named property.
 * @param c The connection to the X server.
 * @param cookie Request cookie.
 * @param hints Size hints structure.
 * @param e Error if any.
 * @return Return 1 on success, 0 otherwise.
 *
 * The parameter e supplied to this function must be NULL if
 * xcb_icccm_get_wm_size_hints_unchecked() is used.  Otherwise, it stores
 * the error if any. The returned pointer should be freed.
  }
function xcb_icccm_get_wm_size_hints_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; hints:Pxcb_size_hints_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{ WM_NORMAL_HINTS  }
{*
 * @brief Deliver a ChangeProperty request to set WM_NORMAL_HINTS property value.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @param hints Hints value to set.
  }
function xcb_icccm_set_wm_normal_hints_checked(c:Pxcb_connection_t; window:Txcb_window_t; hints:Pxcb_size_hints_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_set_wm_normal_hints_checked()
  }
function xcb_icccm_set_wm_normal_hints(c:Pxcb_connection_t; window:Txcb_window_t; hints:Pxcb_size_hints_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send request to get WM_NORMAL_HINTS property of a window.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @return The request cookie.
  }
function xcb_icccm_get_wm_normal_hints(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_wm_normal_hints()
  }
function xcb_icccm_get_wm_normal_hints_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill given structure with the WM_NORMAL_HINTS property of a window.
 * @param hints WM_NORMAL_HINTS property value.
 * @param reply The get property request reply.
 * @return Return 1 on success, 0 otherwise.
  }
function xcb_icccm_get_wm_size_hints_from_reply(hints:Pxcb_size_hints_t; reply:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Fill given structure with the WM_NORMAL_HINTS property of a window.
 * @param c The connection to the X server.
 * @param cookie Request cookie.
 * @param hints WM_NORMAL_HINTS property value.
 * @param e Error if any.
 * @return Return 1 on success, 0 otherwise.
 *
 * The parameter e supplied to this function must be NULL if
 * xcb_icccm_get_wm_normal_hints_unchecked() is used.  Otherwise, it stores
 * the error if any. The returned pointer should be freed.
  }
function xcb_icccm_get_wm_normal_hints_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; hints:Pxcb_size_hints_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{ WM_HINTS  }
{*
 * @brief WM hints structure (may be extended in the future).
  }
{* Marks which fields in this structure are defined  }
{* Does this application rely on the window manager to get keyboard
    input?  }
{* See below  }
{* Pixmap to be used as icon  }
{* Window to be used as icon  }
{* Initial position of icon  }
{* Icon mask bitmap  }
{ Identifier of related window group  }
type
  Pxcb_icccm_wm_hints_t = ^Txcb_icccm_wm_hints_t;
  Txcb_icccm_wm_hints_t = record
      flags : Tint32_t;
      input : Tuint32_t;
      initial_state : Tint32_t;
      icon_pixmap : Txcb_pixmap_t;
      icon_window : Txcb_window_t;
      icon_x : Tint32_t;
      icon_y : Tint32_t;
      icon_mask : Txcb_pixmap_t;
      window_group : Txcb_window_t;
    end;
{* Number of elements in this structure  }

const
  XCB_ICCCM_NUM_WM_HINTS_ELEMENTS = 9;  
{*
 * @brief WM_HINTS window states.
  }
type
  Pxcb_icccm_wm_state_t = ^Txcb_icccm_wm_state_t;
  Txcb_icccm_wm_state_t =  Longint;
  Const
    XCB_ICCCM_WM_STATE_WITHDRAWN = 0;
    XCB_ICCCM_WM_STATE_NORMAL = 1;
    XCB_ICCCM_WM_STATE_ICONIC = 3;
;
type
  Pxcb_icccm_wm_t = ^Txcb_icccm_wm_t;
  Txcb_icccm_wm_t =  Longint;
  Const
    XCB_ICCCM_WM_HINT_INPUT = 1 shl 0;
    XCB_ICCCM_WM_HINT_STATE = 1 shl 1;
    XCB_ICCCM_WM_HINT_ICON_PIXMAP = 1 shl 2;
    XCB_ICCCM_WM_HINT_ICON_WINDOW = 1 shl 3;
    XCB_ICCCM_WM_HINT_ICON_POSITION = 1 shl 4;
    XCB_ICCCM_WM_HINT_ICON_MASK = 1 shl 5;
    XCB_ICCCM_WM_HINT_WINDOW_GROUP = 1 shl 6;
    XCB_ICCCM_WM_HINT_X_URGENCY = 1 shl 8;
;
  XCB_ICCCM_WM_ALL_HINTS = (((((XCB_ICCCM_WM_HINT_INPUT or XCB_ICCCM_WM_HINT_STATE) or XCB_ICCCM_WM_HINT_ICON_PIXMAP) or XCB_ICCCM_WM_HINT_ICON_WINDOW) or XCB_ICCCM_WM_HINT_ICON_POSITION) or XCB_ICCCM_WM_HINT_ICON_MASK) or XCB_ICCCM_WM_HINT_WINDOW_GROUP;  
{*
 * @brief Get urgency hint.
 * @param hints WM_HINTS structure.
 * @return Urgency hint value.
  }

function xcb_icccm_wm_hints_get_urgency(hints:Pxcb_icccm_wm_hints_t):Tuint32_t;cdecl;external;
{*
 * @brief Set input focus.
 * @param hints WM_HINTS structure.
 * @param input Input focus.
  }
procedure xcb_icccm_wm_hints_set_input(hints:Pxcb_icccm_wm_hints_t; input:Tuint8_t);cdecl;external;
{*
 * @brief Set hints state to 'iconic'.
 * @param hints WM_HINTS structure.
  }
procedure xcb_icccm_wm_hints_set_iconic(hints:Pxcb_icccm_wm_hints_t);cdecl;external;
{*
 * @brief Set hints state to 'normal'.
 * @param hints WM_HINTS structure.
  }
procedure xcb_icccm_wm_hints_set_normal(hints:Pxcb_icccm_wm_hints_t);cdecl;external;
{*
 * @brief Set hints state to 'withdrawn'.
 * @param hints WM_HINTS structure.
  }
procedure xcb_icccm_wm_hints_set_withdrawn(hints:Pxcb_icccm_wm_hints_t);cdecl;external;
{*
 * @brief Set hints state to none.
 * @param hints WM_HINTS structure.
  }
procedure xcb_icccm_wm_hints_set_none(hints:Pxcb_icccm_wm_hints_t);cdecl;external;
{*
 * @brief Set pixmap to be used as icon.
 * @param hints WM_HINTS structure.
 * @param icon_pixmap Pixmap.
  }
procedure xcb_icccm_wm_hints_set_icon_pixmap(hints:Pxcb_icccm_wm_hints_t; icon_pixmap:Txcb_pixmap_t);cdecl;external;
{*
 * @brief Set icon mask bitmap.
 * @param hints WM_HINTS structure.
 * @param icon_mask Pixmap.
  }
procedure xcb_icccm_wm_hints_set_icon_mask(hints:Pxcb_icccm_wm_hints_t; icon_mask:Txcb_pixmap_t);cdecl;external;
{*
 * @brief Set window identifier to be used as icon.
 * @param hints WM_HINTS structure.
 * @param icon_window Window X identifier.
  }
procedure xcb_icccm_wm_hints_set_icon_window(hints:Pxcb_icccm_wm_hints_t; icon_window:Txcb_window_t);cdecl;external;
{*
 * @brief Set identifier of related window group.
 * @param hints WM_HINTS structure.
 * @param window_group Window X identifier.
  }
procedure xcb_icccm_wm_hints_set_window_group(hints:Pxcb_icccm_wm_hints_t; window_group:Txcb_window_t);cdecl;external;
{*
 * @brief Set urgency hints flag.
 * @param hints WM_HINTS structure.
  }
procedure xcb_icccm_wm_hints_set_urgency(hints:Pxcb_icccm_wm_hints_t);cdecl;external;
{*
 * @brief Deliver a SetProperty request to set WM_HINTS property value.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @param hints Hints value to set.
  }
function xcb_icccm_set_wm_hints_checked(c:Pxcb_connection_t; window:Txcb_window_t; hints:Pxcb_icccm_wm_hints_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_set_wm_hints_checked()
  }
function xcb_icccm_set_wm_hints(c:Pxcb_connection_t; window:Txcb_window_t; hints:Pxcb_icccm_wm_hints_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Send request to get WM_HINTS property of a window.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @return The request cookie.
  }
function xcb_icccm_get_wm_hints(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_wm_hints()
  }
function xcb_icccm_get_wm_hints_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill given structure with the WM_HINTS property of a window.
 * @param hints WM_HINTS property value.
 * @param reply The get property request reply.
 * @return Return 1 on success, 0 otherwise.
  }
function xcb_icccm_get_wm_hints_from_reply(hints:Pxcb_icccm_wm_hints_t; reply:Pxcb_get_property_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Fill given structure with the WM_HINTS property of a window.
 * @param c The connection to the X server.
 * @param cookie Request cookie.
 * @param hints WM_HINTS property value.
 * @param e Error if any.
 * @return Return 1 on success, 0 otherwise.
 *
 * The parameter e supplied to this function must be NULL if
 * xcb_icccm_get_wm_hints_unchecked() is used.  Otherwise, it stores the
 * error if any. The returned pointer should be freed.
  }
function xcb_icccm_get_wm_hints_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; hints:Pxcb_icccm_wm_hints_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{ WM_PROTOCOLS  }
{*
 * @brief Deliver a SetProperty request to set WM_PROTOCOLS property value.
 * @param c The connection to the X server.
 * @param wm_protocols The WM_PROTOCOLS atom.
 * @param window Window X identifier.
 * @param list_len Atom list len.
 * @param list Atom list.
  }
function xcb_icccm_set_wm_protocols_checked(c:Pxcb_connection_t; window:Txcb_window_t; wm_protocols:Txcb_atom_t; list_len:Tuint32_t; list:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_set_wm_protocols_checked()
  }
function xcb_icccm_set_wm_protocols(c:Pxcb_connection_t; window:Txcb_window_t; wm_protocols:Txcb_atom_t; list_len:Tuint32_t; list:Pxcb_atom_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief WM_PROTOCOLS structure.
  }
{* Length of the atoms list  }
{* Atoms list  }
{* Store reply to avoid memory allocation, should normally not be
      used directly  }
type
  Pxcb_icccm_get_wm_protocols_reply_t = ^Txcb_icccm_get_wm_protocols_reply_t;
  Txcb_icccm_get_wm_protocols_reply_t = record
      atoms_len : Tuint32_t;
      atoms : Pxcb_atom_t;
      _reply : Pxcb_get_property_reply_t;
    end;
{*
 * @brief Send request to get WM_PROTOCOLS property of a given window.
 * @param c The connection to the X server.
 * @param window Window X identifier.
 * @return The request cookie.
  }

function xcb_icccm_get_wm_protocols(c:Pxcb_connection_t; window:Txcb_window_t; wm_protocol_atom:Txcb_atom_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @see xcb_icccm_get_wm_protocols()
  }
function xcb_icccm_get_wm_protocols_unchecked(c:Pxcb_connection_t; window:Txcb_window_t; wm_protocol_atom:Txcb_atom_t):Txcb_get_property_cookie_t;cdecl;external;
{*
 * @brief Fill the given structure with the WM_PROTOCOLS property of a window.
 * @param reply The reply of the GetProperty request.
 * @param protocols WM_PROTOCOLS property value.
 * @return Return 1 on success, 0 otherwise.
 *
 * protocols structure members should be freed by
 * xcb_icccm_get_wm_protocols_reply_wipe().
  }
function xcb_icccm_get_wm_protocols_from_reply(reply:Pxcb_get_property_reply_t; protocols:Pxcb_icccm_get_wm_protocols_reply_t):Tuint8_t;cdecl;external;
{*
 * @brief Fill the given structure with the WM_PROTOCOLS property of a window.
 * @param c The connection to the X server.
 * @param cookie Request cookie.
 * @param protocols WM_PROTOCOLS property value.
 * @param e Error if any.
 * @return Return 1 on success, 0 otherwise.
 *
 * The parameter e supplied to this function must be NULL if
 * xcb_icccm_get_wm_protocols_unchecked() is used.  Otherwise, it stores the
 * error if any. protocols structure members should be freed by
 * xcb_icccm_get_wm_protocols_reply_wipe().
  }
function xcb_icccm_get_wm_protocols_reply(c:Pxcb_connection_t; cookie:Txcb_get_property_cookie_t; protocols:Pxcb_icccm_get_wm_protocols_reply_t; e:PPxcb_generic_error_t):Tuint8_t;cdecl;external;
{*
 * @brief Wipe protocols structure members previously allocated by
 *        xcb_icccm_get_wm_protocols_reply().
 * @param protocols protocols structure whose members is going to be freed.
  }
procedure xcb_icccm_get_wm_protocols_reply_wipe(protocols:Pxcb_icccm_get_wm_protocols_reply_t);cdecl;external;
{ C++ end of extern C conditionnal removed }
{*
 * @
  }
{$endif}
{ __XCB_ICCCM_H__  }

implementation


end.
