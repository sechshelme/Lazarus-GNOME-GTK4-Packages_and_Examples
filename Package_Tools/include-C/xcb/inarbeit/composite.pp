
unit composite;
interface

{
  Automatically converted by H2Pas 1.0.0 from composite.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    composite.h
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
Pxcb_composite_create_region_from_border_clip_request_t  = ^xcb_composite_create_region_from_border_clip_request_t;
Pxcb_composite_get_overlay_window_cookie_t  = ^xcb_composite_get_overlay_window_cookie_t;
Pxcb_composite_get_overlay_window_reply_t  = ^xcb_composite_get_overlay_window_reply_t;
Pxcb_composite_get_overlay_window_request_t  = ^xcb_composite_get_overlay_window_request_t;
Pxcb_composite_name_window_pixmap_request_t  = ^xcb_composite_name_window_pixmap_request_t;
Pxcb_composite_query_version_cookie_t  = ^xcb_composite_query_version_cookie_t;
Pxcb_composite_query_version_reply_t  = ^xcb_composite_query_version_reply_t;
Pxcb_composite_query_version_request_t  = ^xcb_composite_query_version_request_t;
Pxcb_composite_redirect_subwindows_request_t  = ^xcb_composite_redirect_subwindows_request_t;
Pxcb_composite_redirect_t  = ^xcb_composite_redirect_t;
Pxcb_composite_redirect_window_request_t  = ^xcb_composite_redirect_window_request_t;
Pxcb_composite_release_overlay_window_request_t  = ^xcb_composite_release_overlay_window_request_t;
Pxcb_composite_unredirect_subwindows_request_t  = ^xcb_composite_unredirect_subwindows_request_t;
Pxcb_composite_unredirect_window_request_t  = ^xcb_composite_unredirect_window_request_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from composite.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Composite_API XCB Composite API
 * @brief Composite XCB Protocol Implementation.
 * @
 * }
{$ifndef __COMPOSITE_H}
{$define __COMPOSITE_H}
{$include "xcb.h"}
{$include "xproto.h"}
{$include "xfixes.h"}
{ C++ extern C conditionnal removed }

const
  XCB_COMPOSITE_MAJOR_VERSION = 0;  
  XCB_COMPOSITE_MINOR_VERSION = 4;  
  var
    xcb_composite_id : Txcb_extension_t;cvar;external;
type
  Pxcb_composite_redirect_t = ^Txcb_composite_redirect_t;
  Txcb_composite_redirect_t =  Longint;
  Const
    XCB_COMPOSITE_REDIRECT_AUTOMATIC = 0;
    XCB_COMPOSITE_REDIRECT_MANUAL = 1;
;
{*
 * @brief xcb_composite_query_version_cookie_t
 * }
type
  Pxcb_composite_query_version_cookie_t = ^Txcb_composite_query_version_cookie_t;
  Txcb_composite_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_composite_query_version.  }

const
  XCB_COMPOSITE_QUERY_VERSION = 0;  
{*
 * @brief xcb_composite_query_version_request_t
 * }
type
  Pxcb_composite_query_version_request_t = ^Txcb_composite_query_version_request_t;
  Txcb_composite_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      client_major_version : Tuint32_t;
      client_minor_version : Tuint32_t;
    end;
{*
 * @brief xcb_composite_query_version_reply_t
 * }

  Pxcb_composite_query_version_reply_t = ^Txcb_composite_query_version_reply_t;
  Txcb_composite_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{* Opcode for xcb_composite_redirect_window.  }

const
  XCB_COMPOSITE_REDIRECT_WINDOW = 1;  
{*
 * @brief xcb_composite_redirect_window_request_t
 * }
type
  Pxcb_composite_redirect_window_request_t = ^Txcb_composite_redirect_window_request_t;
  Txcb_composite_redirect_window_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      update : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_composite_redirect_subwindows.  }

const
  XCB_COMPOSITE_REDIRECT_SUBWINDOWS = 2;  
{*
 * @brief xcb_composite_redirect_subwindows_request_t
 * }
type
  Pxcb_composite_redirect_subwindows_request_t = ^Txcb_composite_redirect_subwindows_request_t;
  Txcb_composite_redirect_subwindows_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      update : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_composite_unredirect_window.  }

const
  XCB_COMPOSITE_UNREDIRECT_WINDOW = 3;  
{*
 * @brief xcb_composite_unredirect_window_request_t
 * }
type
  Pxcb_composite_unredirect_window_request_t = ^Txcb_composite_unredirect_window_request_t;
  Txcb_composite_unredirect_window_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      update : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_composite_unredirect_subwindows.  }

const
  XCB_COMPOSITE_UNREDIRECT_SUBWINDOWS = 4;  
{*
 * @brief xcb_composite_unredirect_subwindows_request_t
 * }
type
  Pxcb_composite_unredirect_subwindows_request_t = ^Txcb_composite_unredirect_subwindows_request_t;
  Txcb_composite_unredirect_subwindows_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      update : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_composite_create_region_from_border_clip.  }

const
  XCB_COMPOSITE_CREATE_REGION_FROM_BORDER_CLIP = 5;  
{*
 * @brief xcb_composite_create_region_from_border_clip_request_t
 * }
type
  Pxcb_composite_create_region_from_border_clip_request_t = ^Txcb_composite_create_region_from_border_clip_request_t;
  Txcb_composite_create_region_from_border_clip_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      region : Txcb_xfixes_region_t;
      window : Txcb_window_t;
    end;
{* Opcode for xcb_composite_name_window_pixmap.  }

const
  XCB_COMPOSITE_NAME_WINDOW_PIXMAP = 6;  
{*
 * @brief xcb_composite_name_window_pixmap_request_t
 * }
type
  Pxcb_composite_name_window_pixmap_request_t = ^Txcb_composite_name_window_pixmap_request_t;
  Txcb_composite_name_window_pixmap_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      pixmap : Txcb_pixmap_t;
    end;
{*
 * @brief xcb_composite_get_overlay_window_cookie_t
 * }

  Pxcb_composite_get_overlay_window_cookie_t = ^Txcb_composite_get_overlay_window_cookie_t;
  Txcb_composite_get_overlay_window_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_composite_get_overlay_window.  }

const
  XCB_COMPOSITE_GET_OVERLAY_WINDOW = 7;  
{*
 * @brief xcb_composite_get_overlay_window_request_t
 * }
type
  Pxcb_composite_get_overlay_window_request_t = ^Txcb_composite_get_overlay_window_request_t;
  Txcb_composite_get_overlay_window_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_composite_get_overlay_window_reply_t
 * }

  Pxcb_composite_get_overlay_window_reply_t = ^Txcb_composite_get_overlay_window_reply_t;
  Txcb_composite_get_overlay_window_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      overlay_win : Txcb_window_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{* Opcode for xcb_composite_release_overlay_window.  }

const
  XCB_COMPOSITE_RELEASE_OVERLAY_WINDOW = 8;  
{*
 * @brief xcb_composite_release_overlay_window_request_t
 * }
type
  Pxcb_composite_release_overlay_window_request_t = ^Txcb_composite_release_overlay_window_request_t;
  Txcb_composite_release_overlay_window_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{*
 * @brief Negotiate the version of Composite
 *
 * @param c The connection
 * @param client_major_version The major version supported by the client.
 * @param client_minor_version The minor version supported by the client.
 * @return A cookie
 *
 * This negotiates the version of the Composite extension.  It must be precede all
 * other requests using Composite.  Failure to do so will cause a BadRequest error.
 *
  }

function xcb_composite_query_version(c:Pxcb_connection_t; client_major_version:Tuint32_t; client_minor_version:Tuint32_t):Txcb_composite_query_version_cookie_t;cdecl;external;
{*
 * @brief Negotiate the version of Composite
 *
 * @param c The connection
 * @param client_major_version The major version supported by the client.
 * @param client_minor_version The minor version supported by the client.
 * @return A cookie
 *
 * This negotiates the version of the Composite extension.  It must be precede all
 * other requests using Composite.  Failure to do so will cause a BadRequest error.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_composite_query_version_unchecked(c:Pxcb_connection_t; client_major_version:Tuint32_t; client_minor_version:Tuint32_t):Txcb_composite_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_composite_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_composite_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_composite_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_composite_query_version_reply_t;cdecl;external;
{*
 * @brief Redirect the heirarchy starting at “window” to off-screen storage.
 *
 * @param c The connection
 * @param window The root of the heirarchy to redirect to off-screen storage.
 * @param update A bitmask of #xcb_composite_redirect_t values.
 * @param update Whether contents are automatically mirrored to the parent window.  If one client
 * 	already specifies an update type of Manual, any attempt by another to specify a
 * 	mode of Manual so will result in an Access error.
 * @return A cookie
 *
 * The hierarchy starting at 'window' is directed to off-screen
 * 	storage.  When all clients enabling redirection terminate,
 * 	the redirection will automatically be disabled.
 * 
 * 	The root window may not be redirected. Doing so results in a Match
 * 	error.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_composite_redirect_window_checked(c:Pxcb_connection_t; window:Txcb_window_t; update:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Redirect the heirarchy starting at “window” to off-screen storage.
 *
 * @param c The connection
 * @param window The root of the heirarchy to redirect to off-screen storage.
 * @param update A bitmask of #xcb_composite_redirect_t values.
 * @param update Whether contents are automatically mirrored to the parent window.  If one client
 * 	already specifies an update type of Manual, any attempt by another to specify a
 * 	mode of Manual so will result in an Access error.
 * @return A cookie
 *
 * The hierarchy starting at 'window' is directed to off-screen
 * 	storage.  When all clients enabling redirection terminate,
 * 	the redirection will automatically be disabled.
 * 
 * 	The root window may not be redirected. Doing so results in a Match
 * 	error.
 *
  }
function xcb_composite_redirect_window(c:Pxcb_connection_t; window:Txcb_window_t; update:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Redirect all current and future children of ‘window’
 *
 * @param c The connection
 * @param window The root of the heirarchy to redirect to off-screen storage.
 * @param update A bitmask of #xcb_composite_redirect_t values.
 * @param update Whether contents are automatically mirrored to the parent window.  If one client
 * 	already specifies an update type of Manual, any attempt by another to specify a
 * 	mode of Manual so will result in an Access error.
 * @return A cookie
 *
 * Hierarchies starting at all current and future children of window
 * 	will be redirected as in RedirectWindow. If update is Manual,
 * 	then painting of the window background during window manipulation
 * 	and ClearArea requests is inhibited.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_composite_redirect_subwindows_checked(c:Pxcb_connection_t; window:Txcb_window_t; update:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Redirect all current and future children of ‘window’
 *
 * @param c The connection
 * @param window The root of the heirarchy to redirect to off-screen storage.
 * @param update A bitmask of #xcb_composite_redirect_t values.
 * @param update Whether contents are automatically mirrored to the parent window.  If one client
 * 	already specifies an update type of Manual, any attempt by another to specify a
 * 	mode of Manual so will result in an Access error.
 * @return A cookie
 *
 * Hierarchies starting at all current and future children of window
 * 	will be redirected as in RedirectWindow. If update is Manual,
 * 	then painting of the window background during window manipulation
 * 	and ClearArea requests is inhibited.
 *
  }
function xcb_composite_redirect_subwindows(c:Pxcb_connection_t; window:Txcb_window_t; update:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Terminate redirection of the specified window.
 *
 * @param c The connection
 * @param window The window to terminate redirection of.  Must be redirected by the
 * 	current client, or a Value error results.
 * @param update A bitmask of #xcb_composite_redirect_t values.
 * @param update The update type passed to RedirectWindows.  If this does not match the
 * 	previously requested update type, a Value error results.
 * @return A cookie
 *
 * Redirection of the specified window will be terminated.  This cannot be
 * 	used if the window was redirected with RedirectSubwindows.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_composite_unredirect_window_checked(c:Pxcb_connection_t; window:Txcb_window_t; update:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Terminate redirection of the specified window.
 *
 * @param c The connection
 * @param window The window to terminate redirection of.  Must be redirected by the
 * 	current client, or a Value error results.
 * @param update A bitmask of #xcb_composite_redirect_t values.
 * @param update The update type passed to RedirectWindows.  If this does not match the
 * 	previously requested update type, a Value error results.
 * @return A cookie
 *
 * Redirection of the specified window will be terminated.  This cannot be
 * 	used if the window was redirected with RedirectSubwindows.
 *
  }
function xcb_composite_unredirect_window(c:Pxcb_connection_t; window:Txcb_window_t; update:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Terminate redirection of the specified window’s children
 *
 * @param c The connection
 * @param window The window to terminate redirection of.  Must have previously been
 * 	selected for sub-redirection by the current client, or a Value error
 * 	results.
 * @param update A bitmask of #xcb_composite_redirect_t values.
 * @param update The update type passed to RedirectSubWindows.  If this does not match
 * 	the previously requested update type, a Value error results.
 * @return A cookie
 *
 * Redirection of all children of window will be terminated.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_composite_unredirect_subwindows_checked(c:Pxcb_connection_t; window:Txcb_window_t; update:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Terminate redirection of the specified window’s children
 *
 * @param c The connection
 * @param window The window to terminate redirection of.  Must have previously been
 * 	selected for sub-redirection by the current client, or a Value error
 * 	results.
 * @param update A bitmask of #xcb_composite_redirect_t values.
 * @param update The update type passed to RedirectSubWindows.  If this does not match
 * 	the previously requested update type, a Value error results.
 * @return A cookie
 *
 * Redirection of all children of window will be terminated.
 *
  }
function xcb_composite_unredirect_subwindows(c:Pxcb_connection_t; window:Txcb_window_t; update:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_composite_create_region_from_border_clip_checked(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_composite_create_region_from_border_clip(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_composite_name_window_pixmap_checked(c:Pxcb_connection_t; window:Txcb_window_t; pixmap:Txcb_pixmap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_composite_name_window_pixmap(c:Pxcb_connection_t; window:Txcb_window_t; pixmap:Txcb_pixmap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_composite_get_overlay_window(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_composite_get_overlay_window_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_composite_get_overlay_window_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_composite_get_overlay_window_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_composite_get_overlay_window_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_composite_get_overlay_window_reply(c:Pxcb_connection_t; cookie:Txcb_composite_get_overlay_window_cookie_t; e:PPxcb_generic_error_t):Pxcb_composite_get_overlay_window_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_composite_release_overlay_window_checked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_composite_release_overlay_window(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
