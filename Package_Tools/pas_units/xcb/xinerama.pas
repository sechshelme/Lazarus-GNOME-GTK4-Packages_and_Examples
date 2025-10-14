unit xinerama;

interface

uses
  fp_xcb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from xinerama.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Xinerama_API XCB Xinerama API
 * @brief Xinerama XCB Protocol Implementation.
 * @
 * }
{$ifndef __XINERAMA_H}
{$define __XINERAMA_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_XINERAMA_MAJOR_VERSION = 1;  
  XCB_XINERAMA_MINOR_VERSION = 1;  
  var
    xcb_xinerama_id : Txcb_extension_t;cvar;external libxcbxxx;
{*
 * @brief xcb_xinerama_screen_info_t
 * }
type
  Pxcb_xinerama_screen_info_t = ^Txcb_xinerama_screen_info_t;
  Txcb_xinerama_screen_info_t = record
      x_org : Tint16_t;
      y_org : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{*
 * @brief xcb_xinerama_screen_info_iterator_t
 * }

  Pxcb_xinerama_screen_info_iterator_t = ^Txcb_xinerama_screen_info_iterator_t;
  Txcb_xinerama_screen_info_iterator_t = record
      data : Pxcb_xinerama_screen_info_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_xinerama_query_version_cookie_t
 * }

  Pxcb_xinerama_query_version_cookie_t = ^Txcb_xinerama_query_version_cookie_t;
  Txcb_xinerama_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xinerama_query_version.  }

const
  XCB_XINERAMA_QUERY_VERSION = 0;  
{*
 * @brief xcb_xinerama_query_version_request_t
 * }
type
  Pxcb_xinerama_query_version_request_t = ^Txcb_xinerama_query_version_request_t;
  Txcb_xinerama_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      major : Tuint8_t;
      minor : Tuint8_t;
    end;
{*
 * @brief xcb_xinerama_query_version_reply_t
 * }

  Pxcb_xinerama_query_version_reply_t = ^Txcb_xinerama_query_version_reply_t;
  Txcb_xinerama_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major : Tuint16_t;
      minor : Tuint16_t;
    end;
{*
 * @brief xcb_xinerama_get_state_cookie_t
 * }

  Pxcb_xinerama_get_state_cookie_t = ^Txcb_xinerama_get_state_cookie_t;
  Txcb_xinerama_get_state_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xinerama_get_state.  }

const
  XCB_XINERAMA_GET_STATE = 1;  
{*
 * @brief xcb_xinerama_get_state_request_t
 * }
type
  Pxcb_xinerama_get_state_request_t = ^Txcb_xinerama_get_state_request_t;
  Txcb_xinerama_get_state_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_xinerama_get_state_reply_t
 * }

  Pxcb_xinerama_get_state_reply_t = ^Txcb_xinerama_get_state_reply_t;
  Txcb_xinerama_get_state_reply_t = record
      response_type : Tuint8_t;
      state : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_xinerama_get_screen_count_cookie_t
 * }

  Pxcb_xinerama_get_screen_count_cookie_t = ^Txcb_xinerama_get_screen_count_cookie_t;
  Txcb_xinerama_get_screen_count_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xinerama_get_screen_count.  }

const
  XCB_XINERAMA_GET_SCREEN_COUNT = 2;  
{*
 * @brief xcb_xinerama_get_screen_count_request_t
 * }
type
  Pxcb_xinerama_get_screen_count_request_t = ^Txcb_xinerama_get_screen_count_request_t;
  Txcb_xinerama_get_screen_count_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_xinerama_get_screen_count_reply_t
 * }

  Pxcb_xinerama_get_screen_count_reply_t = ^Txcb_xinerama_get_screen_count_reply_t;
  Txcb_xinerama_get_screen_count_reply_t = record
      response_type : Tuint8_t;
      screen_count : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      window : Txcb_window_t;
    end;
{*
 * @brief xcb_xinerama_get_screen_size_cookie_t
 * }

  Pxcb_xinerama_get_screen_size_cookie_t = ^Txcb_xinerama_get_screen_size_cookie_t;
  Txcb_xinerama_get_screen_size_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xinerama_get_screen_size.  }

const
  XCB_XINERAMA_GET_SCREEN_SIZE = 3;  
{*
 * @brief xcb_xinerama_get_screen_size_request_t
 * }
type
  Pxcb_xinerama_get_screen_size_request_t = ^Txcb_xinerama_get_screen_size_request_t;
  Txcb_xinerama_get_screen_size_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      screen : Tuint32_t;
    end;
{*
 * @brief xcb_xinerama_get_screen_size_reply_t
 * }

  Pxcb_xinerama_get_screen_size_reply_t = ^Txcb_xinerama_get_screen_size_reply_t;
  Txcb_xinerama_get_screen_size_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      width : Tuint32_t;
      height : Tuint32_t;
      window : Txcb_window_t;
      screen : Tuint32_t;
    end;
{*
 * @brief xcb_xinerama_is_active_cookie_t
 * }

  Pxcb_xinerama_is_active_cookie_t = ^Txcb_xinerama_is_active_cookie_t;
  Txcb_xinerama_is_active_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xinerama_is_active.  }

const
  XCB_XINERAMA_IS_ACTIVE = 4;  
{*
 * @brief xcb_xinerama_is_active_request_t
 * }
type
  Pxcb_xinerama_is_active_request_t = ^Txcb_xinerama_is_active_request_t;
  Txcb_xinerama_is_active_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_xinerama_is_active_reply_t
 * }

  Pxcb_xinerama_is_active_reply_t = ^Txcb_xinerama_is_active_reply_t;
  Txcb_xinerama_is_active_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      state : Tuint32_t;
    end;
{*
 * @brief xcb_xinerama_query_screens_cookie_t
 * }

  Pxcb_xinerama_query_screens_cookie_t = ^Txcb_xinerama_query_screens_cookie_t;
  Txcb_xinerama_query_screens_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xinerama_query_screens.  }

const
  XCB_XINERAMA_QUERY_SCREENS = 5;  
{*
 * @brief xcb_xinerama_query_screens_request_t
 * }
type
  Pxcb_xinerama_query_screens_request_t = ^Txcb_xinerama_query_screens_request_t;
  Txcb_xinerama_query_screens_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_xinerama_query_screens_reply_t
 * }

  Pxcb_xinerama_query_screens_reply_t = ^Txcb_xinerama_query_screens_reply_t;
  Txcb_xinerama_query_screens_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      number : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_xinerama_screen_info_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_xinerama_screen_info_t)
  }

procedure xcb_xinerama_screen_info_next(i:Pxcb_xinerama_screen_info_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_xinerama_screen_info_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_xinerama_screen_info_end(i:Txcb_xinerama_screen_info_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xinerama_query_version(c:Pxcb_connection_t; major:Tuint8_t; minor:Tuint8_t):Txcb_xinerama_query_version_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xinerama_query_version_unchecked(c:Pxcb_connection_t; major:Tuint8_t; minor:Tuint8_t):Txcb_xinerama_query_version_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xinerama_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xinerama_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_xinerama_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_xinerama_query_version_reply_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xinerama_get_state(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_xinerama_get_state_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xinerama_get_state_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_xinerama_get_state_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xinerama_get_state_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xinerama_get_state_reply(c:Pxcb_connection_t; cookie:Txcb_xinerama_get_state_cookie_t; e:PPxcb_generic_error_t):Pxcb_xinerama_get_state_reply_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xinerama_get_screen_count(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_xinerama_get_screen_count_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xinerama_get_screen_count_unchecked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_xinerama_get_screen_count_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xinerama_get_screen_count_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xinerama_get_screen_count_reply(c:Pxcb_connection_t; cookie:Txcb_xinerama_get_screen_count_cookie_t; e:PPxcb_generic_error_t):Pxcb_xinerama_get_screen_count_reply_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xinerama_get_screen_size(c:Pxcb_connection_t; window:Txcb_window_t; screen:Tuint32_t):Txcb_xinerama_get_screen_size_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xinerama_get_screen_size_unchecked(c:Pxcb_connection_t; window:Txcb_window_t; screen:Tuint32_t):Txcb_xinerama_get_screen_size_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xinerama_get_screen_size_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xinerama_get_screen_size_reply(c:Pxcb_connection_t; cookie:Txcb_xinerama_get_screen_size_cookie_t; e:PPxcb_generic_error_t):Pxcb_xinerama_get_screen_size_reply_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xinerama_is_active(c:Pxcb_connection_t):Txcb_xinerama_is_active_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xinerama_is_active_unchecked(c:Pxcb_connection_t):Txcb_xinerama_is_active_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xinerama_is_active_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xinerama_is_active_reply(c:Pxcb_connection_t; cookie:Txcb_xinerama_is_active_cookie_t; e:PPxcb_generic_error_t):Pxcb_xinerama_is_active_reply_t;cdecl;external libxcbxxx;
function xcb_xinerama_query_screens_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xinerama_query_screens(c:Pxcb_connection_t):Txcb_xinerama_query_screens_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xinerama_query_screens_unchecked(c:Pxcb_connection_t):Txcb_xinerama_query_screens_cookie_t;cdecl;external libxcbxxx;
function xcb_xinerama_query_screens_screen_info(R:Pxcb_xinerama_query_screens_reply_t):Pxcb_xinerama_screen_info_t;cdecl;external libxcbxxx;
function xcb_xinerama_query_screens_screen_info_length(R:Pxcb_xinerama_query_screens_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xinerama_query_screens_screen_info_iterator(R:Pxcb_xinerama_query_screens_reply_t):Txcb_xinerama_screen_info_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xinerama_query_screens_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xinerama_query_screens_reply(c:Pxcb_connection_t; cookie:Txcb_xinerama_query_screens_cookie_t; e:PPxcb_generic_error_t):Pxcb_xinerama_query_screens_reply_t;cdecl;external libxcbxxx;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

// === Konventiert am: 14-10-25 15:39:17 ===


implementation



end.
