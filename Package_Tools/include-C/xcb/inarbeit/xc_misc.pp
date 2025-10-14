
unit xc_misc;
interface

{
  Automatically converted by H2Pas 1.0.0 from xc_misc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xc_misc.h
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
Puint32_t  = ^uint32_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_xc_misc_get_version_cookie_t  = ^xcb_xc_misc_get_version_cookie_t;
Pxcb_xc_misc_get_version_reply_t  = ^xcb_xc_misc_get_version_reply_t;
Pxcb_xc_misc_get_version_request_t  = ^xcb_xc_misc_get_version_request_t;
Pxcb_xc_misc_get_xid_list_cookie_t  = ^xcb_xc_misc_get_xid_list_cookie_t;
Pxcb_xc_misc_get_xid_list_reply_t  = ^xcb_xc_misc_get_xid_list_reply_t;
Pxcb_xc_misc_get_xid_list_request_t  = ^xcb_xc_misc_get_xid_list_request_t;
Pxcb_xc_misc_get_xid_range_cookie_t  = ^xcb_xc_misc_get_xid_range_cookie_t;
Pxcb_xc_misc_get_xid_range_reply_t  = ^xcb_xc_misc_get_xid_range_reply_t;
Pxcb_xc_misc_get_xid_range_request_t  = ^xcb_xc_misc_get_xid_range_request_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from xc_misc.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_XCMisc_API XCB XCMisc API
 * @brief XCMisc XCB Protocol Implementation.
 * @
 * }
{$ifndef __XC_MISC_H}
{$define __XC_MISC_H}
{$include "xcb.h"}
{ C++ extern C conditionnal removed }

const
  XCB_XCMISC_MAJOR_VERSION = 1;  
  XCB_XCMISC_MINOR_VERSION = 1;  
  var
    xcb_xc_misc_id : Txcb_extension_t;cvar;external;
{*
 * @brief xcb_xc_misc_get_version_cookie_t
 * }
type
  Pxcb_xc_misc_get_version_cookie_t = ^Txcb_xc_misc_get_version_cookie_t;
  Txcb_xc_misc_get_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xc_misc_get_version.  }

const
  XCB_XC_MISC_GET_VERSION = 0;  
{*
 * @brief xcb_xc_misc_get_version_request_t
 * }
type
  Pxcb_xc_misc_get_version_request_t = ^Txcb_xc_misc_get_version_request_t;
  Txcb_xc_misc_get_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      client_major_version : Tuint16_t;
      client_minor_version : Tuint16_t;
    end;
{*
 * @brief xcb_xc_misc_get_version_reply_t
 * }

  Pxcb_xc_misc_get_version_reply_t = ^Txcb_xc_misc_get_version_reply_t;
  Txcb_xc_misc_get_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      server_major_version : Tuint16_t;
      server_minor_version : Tuint16_t;
    end;
{*
 * @brief xcb_xc_misc_get_xid_range_cookie_t
 * }

  Pxcb_xc_misc_get_xid_range_cookie_t = ^Txcb_xc_misc_get_xid_range_cookie_t;
  Txcb_xc_misc_get_xid_range_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xc_misc_get_xid_range.  }

const
  XCB_XC_MISC_GET_XID_RANGE = 1;  
{*
 * @brief xcb_xc_misc_get_xid_range_request_t
 * }
type
  Pxcb_xc_misc_get_xid_range_request_t = ^Txcb_xc_misc_get_xid_range_request_t;
  Txcb_xc_misc_get_xid_range_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_xc_misc_get_xid_range_reply_t
 * }

  Pxcb_xc_misc_get_xid_range_reply_t = ^Txcb_xc_misc_get_xid_range_reply_t;
  Txcb_xc_misc_get_xid_range_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      start_id : Tuint32_t;
      count : Tuint32_t;
    end;
{*
 * @brief xcb_xc_misc_get_xid_list_cookie_t
 * }

  Pxcb_xc_misc_get_xid_list_cookie_t = ^Txcb_xc_misc_get_xid_list_cookie_t;
  Txcb_xc_misc_get_xid_list_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xc_misc_get_xid_list.  }

const
  XCB_XC_MISC_GET_XID_LIST = 2;  
{*
 * @brief xcb_xc_misc_get_xid_list_request_t
 * }
type
  Pxcb_xc_misc_get_xid_list_request_t = ^Txcb_xc_misc_get_xid_list_request_t;
  Txcb_xc_misc_get_xid_list_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      count : Tuint32_t;
    end;
{*
 * @brief xcb_xc_misc_get_xid_list_reply_t
 * }

  Pxcb_xc_misc_get_xid_list_reply_t = ^Txcb_xc_misc_get_xid_list_reply_t;
  Txcb_xc_misc_get_xid_list_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ids_len : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }

function xcb_xc_misc_get_version(c:Pxcb_connection_t; client_major_version:Tuint16_t; client_minor_version:Tuint16_t):Txcb_xc_misc_get_version_cookie_t;cdecl;external;
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
function xcb_xc_misc_get_version_unchecked(c:Pxcb_connection_t; client_major_version:Tuint16_t; client_minor_version:Tuint16_t):Txcb_xc_misc_get_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xc_misc_get_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xc_misc_get_version_reply(c:Pxcb_connection_t; cookie:Txcb_xc_misc_get_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_xc_misc_get_version_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xc_misc_get_xid_range(c:Pxcb_connection_t):Txcb_xc_misc_get_xid_range_cookie_t;cdecl;external;
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
function xcb_xc_misc_get_xid_range_unchecked(c:Pxcb_connection_t):Txcb_xc_misc_get_xid_range_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xc_misc_get_xid_range_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xc_misc_get_xid_range_reply(c:Pxcb_connection_t; cookie:Txcb_xc_misc_get_xid_range_cookie_t; e:PPxcb_generic_error_t):Pxcb_xc_misc_get_xid_range_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_xc_misc_get_xid_list_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xc_misc_get_xid_list(c:Pxcb_connection_t; count:Tuint32_t):Txcb_xc_misc_get_xid_list_cookie_t;cdecl;external;
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
function xcb_xc_misc_get_xid_list_unchecked(c:Pxcb_connection_t; count:Tuint32_t):Txcb_xc_misc_get_xid_list_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_xc_misc_get_xid_list_ids(R:Pxcb_xc_misc_get_xid_list_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_xc_misc_get_xid_list_ids_length(R:Pxcb_xc_misc_get_xid_list_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_xc_misc_get_xid_list_ids_end(R:Pxcb_xc_misc_get_xid_list_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xc_misc_get_xid_list_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xc_misc_get_xid_list_reply(c:Pxcb_connection_t; cookie:Txcb_xc_misc_get_xid_list_cookie_t; e:PPxcb_generic_error_t):Pxcb_xc_misc_get_xid_list_reply_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
