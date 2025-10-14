
unit bigreq;
interface

{
  Automatically converted by H2Pas 1.0.0 from bigreq.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bigreq.h
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
Pxcb_big_requests_enable_cookie_t  = ^xcb_big_requests_enable_cookie_t;
Pxcb_big_requests_enable_reply_t  = ^xcb_big_requests_enable_reply_t;
Pxcb_big_requests_enable_request_t  = ^xcb_big_requests_enable_request_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from bigreq.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_BigRequests_API XCB BigRequests API
 * @brief BigRequests XCB Protocol Implementation.
 * @
 * }
{$ifndef __BIGREQ_H}
{$define __BIGREQ_H}
{$include "xcb.h"}
{ C++ extern C conditionnal removed }

const
  XCB_BIGREQUESTS_MAJOR_VERSION = 0;  
  XCB_BIGREQUESTS_MINOR_VERSION = 0;  
  var
    xcb_big_requests_id : Txcb_extension_t;cvar;external;
{*
 * @brief xcb_big_requests_enable_cookie_t
 * }
type
  Pxcb_big_requests_enable_cookie_t = ^Txcb_big_requests_enable_cookie_t;
  Txcb_big_requests_enable_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_big_requests_enable.  }

const
  XCB_BIG_REQUESTS_ENABLE = 0;  
{*
 * @brief xcb_big_requests_enable_request_t
 * }
type
  Pxcb_big_requests_enable_request_t = ^Txcb_big_requests_enable_request_t;
  Txcb_big_requests_enable_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_big_requests_enable_reply_t
 * }

  Pxcb_big_requests_enable_reply_t = ^Txcb_big_requests_enable_reply_t;
  Txcb_big_requests_enable_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      maximum_request_length : Tuint32_t;
    end;
{*
 * @brief Enable the BIG-REQUESTS extension
 *
 * @param c The connection
 * @return A cookie
 *
 * This enables the BIG-REQUESTS extension, which allows for requests larger than
 * 262140 bytes in length.  When enabled, if the 16-bit length field is zero, it
 * is immediately followed by a 32-bit length field specifying the length of the
 * request in 4-byte units.
 *
  }

function xcb_big_requests_enable(c:Pxcb_connection_t):Txcb_big_requests_enable_cookie_t;cdecl;external;
{*
 * @brief Enable the BIG-REQUESTS extension
 *
 * @param c The connection
 * @return A cookie
 *
 * This enables the BIG-REQUESTS extension, which allows for requests larger than
 * 262140 bytes in length.  When enabled, if the 16-bit length field is zero, it
 * is immediately followed by a 32-bit length field specifying the length of the
 * request in 4-byte units.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_big_requests_enable_unchecked(c:Pxcb_connection_t):Txcb_big_requests_enable_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_big_requests_enable_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_big_requests_enable_reply(c:Pxcb_connection_t; cookie:Txcb_big_requests_enable_cookie_t; e:PPxcb_generic_error_t):Pxcb_big_requests_enable_reply_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
