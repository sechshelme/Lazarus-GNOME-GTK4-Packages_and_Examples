unit xtest;

interface

uses
  fp_xcb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from xtest.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Test_API XCB Test API
 * @brief Test XCB Protocol Implementation.
 * @
 * }
{$ifndef __XTEST_H}
{$define __XTEST_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_TEST_MAJOR_VERSION = 2;  
  XCB_TEST_MINOR_VERSION = 2;  
  var
    xcb_test_id : Txcb_extension_t;cvar;external libxcbxxx;
{*
 * @brief xcb_test_get_version_cookie_t
 * }
type
  Pxcb_test_get_version_cookie_t = ^Txcb_test_get_version_cookie_t;
  Txcb_test_get_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_test_get_version.  }

const
  XCB_TEST_GET_VERSION = 0;  
{*
 * @brief xcb_test_get_version_request_t
 * }
type
  Pxcb_test_get_version_request_t = ^Txcb_test_get_version_request_t;
  Txcb_test_get_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      major_version : Tuint8_t;
      pad0 : Tuint8_t;
      minor_version : Tuint16_t;
    end;
{*
 * @brief xcb_test_get_version_reply_t
 * }

  Pxcb_test_get_version_reply_t = ^Txcb_test_get_version_reply_t;
  Txcb_test_get_version_reply_t = record
      response_type : Tuint8_t;
      major_version : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      minor_version : Tuint16_t;
    end;

  Pxcb_test_cursor_t = ^Txcb_test_cursor_t;
  Txcb_test_cursor_t =  Longint;
  Const
    XCB_TEST_CURSOR_NONE = 0;
    XCB_TEST_CURSOR_CURRENT = 1;
;
{*
 * @brief xcb_test_compare_cursor_cookie_t
 * }
type
  Pxcb_test_compare_cursor_cookie_t = ^Txcb_test_compare_cursor_cookie_t;
  Txcb_test_compare_cursor_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_test_compare_cursor.  }

const
  XCB_TEST_COMPARE_CURSOR = 1;  
{*
 * @brief xcb_test_compare_cursor_request_t
 * }
type
  Pxcb_test_compare_cursor_request_t = ^Txcb_test_compare_cursor_request_t;
  Txcb_test_compare_cursor_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      cursor : Txcb_cursor_t;
    end;
{*
 * @brief xcb_test_compare_cursor_reply_t
 * }

  Pxcb_test_compare_cursor_reply_t = ^Txcb_test_compare_cursor_reply_t;
  Txcb_test_compare_cursor_reply_t = record
      response_type : Tuint8_t;
      same : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
    end;
{* Opcode for xcb_test_fake_input.  }

const
  XCB_TEST_FAKE_INPUT = 2;  
{*
 * @brief xcb_test_fake_input_request_t
 * }
type
  Pxcb_test_fake_input_request_t = ^Txcb_test_fake_input_request_t;
  Txcb_test_fake_input_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      _type : Tuint8_t;
      detail : Tuint8_t;
      pad0 : array[0..1] of Tuint8_t;
      time : Tuint32_t;
      root : Txcb_window_t;
      pad1 : array[0..7] of Tuint8_t;
      rootX : Tint16_t;
      rootY : Tint16_t;
      pad2 : array[0..6] of Tuint8_t;
      deviceid : Tuint8_t;
    end;
{* Opcode for xcb_test_grab_control.  }

const
  XCB_TEST_GRAB_CONTROL = 3;  
{*
 * @brief xcb_test_grab_control_request_t
 * }
type
  Pxcb_test_grab_control_request_t = ^Txcb_test_grab_control_request_t;
  Txcb_test_grab_control_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      impervious : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }

function xcb_test_get_version(c:Pxcb_connection_t; major_version:Tuint8_t; minor_version:Tuint16_t):Txcb_test_get_version_cookie_t;cdecl;external libxcbxxx;
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
function xcb_test_get_version_unchecked(c:Pxcb_connection_t; major_version:Tuint8_t; minor_version:Tuint16_t):Txcb_test_get_version_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_test_get_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_test_get_version_reply(c:Pxcb_connection_t; cookie:Txcb_test_get_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_test_get_version_reply_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_test_compare_cursor(c:Pxcb_connection_t; window:Txcb_window_t; cursor:Txcb_cursor_t):Txcb_test_compare_cursor_cookie_t;cdecl;external libxcbxxx;
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
function xcb_test_compare_cursor_unchecked(c:Pxcb_connection_t; window:Txcb_window_t; cursor:Txcb_cursor_t):Txcb_test_compare_cursor_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_test_compare_cursor_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_test_compare_cursor_reply(c:Pxcb_connection_t; cookie:Txcb_test_compare_cursor_cookie_t; e:PPxcb_generic_error_t):Pxcb_test_compare_cursor_reply_t;cdecl;external libxcbxxx;
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
function xcb_test_fake_input_checked(c:Pxcb_connection_t; _type:Tuint8_t; detail:Tuint8_t; time:Tuint32_t; root:Txcb_window_t; 
           rootX:Tint16_t; rootY:Tint16_t; deviceid:Tuint8_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_test_fake_input(c:Pxcb_connection_t; _type:Tuint8_t; detail:Tuint8_t; time:Tuint32_t; root:Txcb_window_t; 
           rootX:Tint16_t; rootY:Tint16_t; deviceid:Tuint8_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_test_grab_control_checked(c:Pxcb_connection_t; impervious:Tuint8_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_test_grab_control(c:Pxcb_connection_t; impervious:Tuint8_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

// === Konventiert am: 14-10-25 15:39:20 ===


implementation



end.
