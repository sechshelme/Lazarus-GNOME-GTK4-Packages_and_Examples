unit dpms;

interface

uses
  fp_xcb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from dpms.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_DPMS_API XCB DPMS API
 * @brief DPMS XCB Protocol Implementation.
 * @
 * }
{$ifndef __DPMS_H}
{$define __DPMS_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_DPMS_MAJOR_VERSION = 1;  
  XCB_DPMS_MINOR_VERSION = 2;  
  var
    xcb_dpms_id : Txcb_extension_t;cvar;external libxcbxxx;
{*
 * @brief xcb_dpms_get_version_cookie_t
 * }
type
  Pxcb_dpms_get_version_cookie_t = ^Txcb_dpms_get_version_cookie_t;
  Txcb_dpms_get_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dpms_get_version.  }

const
  XCB_DPMS_GET_VERSION = 0;  
{*
 * @brief xcb_dpms_get_version_request_t
 * }
type
  Pxcb_dpms_get_version_request_t = ^Txcb_dpms_get_version_request_t;
  Txcb_dpms_get_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      client_major_version : Tuint16_t;
      client_minor_version : Tuint16_t;
    end;
{*
 * @brief xcb_dpms_get_version_reply_t
 * }

  Pxcb_dpms_get_version_reply_t = ^Txcb_dpms_get_version_reply_t;
  Txcb_dpms_get_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      server_major_version : Tuint16_t;
      server_minor_version : Tuint16_t;
    end;
{*
 * @brief xcb_dpms_capable_cookie_t
 * }

  Pxcb_dpms_capable_cookie_t = ^Txcb_dpms_capable_cookie_t;
  Txcb_dpms_capable_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dpms_capable.  }

const
  XCB_DPMS_CAPABLE = 1;  
{*
 * @brief xcb_dpms_capable_request_t
 * }
type
  Pxcb_dpms_capable_request_t = ^Txcb_dpms_capable_request_t;
  Txcb_dpms_capable_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_dpms_capable_reply_t
 * }

  Pxcb_dpms_capable_reply_t = ^Txcb_dpms_capable_reply_t;
  Txcb_dpms_capable_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      capable : Tuint8_t;
      pad1 : array[0..22] of Tuint8_t;
    end;
{*
 * @brief xcb_dpms_get_timeouts_cookie_t
 * }

  Pxcb_dpms_get_timeouts_cookie_t = ^Txcb_dpms_get_timeouts_cookie_t;
  Txcb_dpms_get_timeouts_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dpms_get_timeouts.  }

const
  XCB_DPMS_GET_TIMEOUTS = 2;  
{*
 * @brief xcb_dpms_get_timeouts_request_t
 * }
type
  Pxcb_dpms_get_timeouts_request_t = ^Txcb_dpms_get_timeouts_request_t;
  Txcb_dpms_get_timeouts_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_dpms_get_timeouts_reply_t
 * }

  Pxcb_dpms_get_timeouts_reply_t = ^Txcb_dpms_get_timeouts_reply_t;
  Txcb_dpms_get_timeouts_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      standby_timeout : Tuint16_t;
      suspend_timeout : Tuint16_t;
      off_timeout : Tuint16_t;
      pad1 : array[0..17] of Tuint8_t;
    end;
{* Opcode for xcb_dpms_set_timeouts.  }

const
  XCB_DPMS_SET_TIMEOUTS = 3;  
{*
 * @brief xcb_dpms_set_timeouts_request_t
 * }
type
  Pxcb_dpms_set_timeouts_request_t = ^Txcb_dpms_set_timeouts_request_t;
  Txcb_dpms_set_timeouts_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      standby_timeout : Tuint16_t;
      suspend_timeout : Tuint16_t;
      off_timeout : Tuint16_t;
    end;
{* Opcode for xcb_dpms_enable.  }

const
  XCB_DPMS_ENABLE = 4;  
{*
 * @brief xcb_dpms_enable_request_t
 * }
type
  Pxcb_dpms_enable_request_t = ^Txcb_dpms_enable_request_t;
  Txcb_dpms_enable_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{* Opcode for xcb_dpms_disable.  }

const
  XCB_DPMS_DISABLE = 5;  
{*
 * @brief xcb_dpms_disable_request_t
 * }
type
  Pxcb_dpms_disable_request_t = ^Txcb_dpms_disable_request_t;
  Txcb_dpms_disable_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;

  Pxcb_dpms_dpms_mode_t = ^Txcb_dpms_dpms_mode_t;
  Txcb_dpms_dpms_mode_t =  Longint;
  Const
    XCB_DPMS_DPMS_MODE_ON = 0;
    XCB_DPMS_DPMS_MODE_STANDBY = 1;
    XCB_DPMS_DPMS_MODE_SUSPEND = 2;
    XCB_DPMS_DPMS_MODE_OFF = 3;
;
{* Opcode for xcb_dpms_force_level.  }
  XCB_DPMS_FORCE_LEVEL = 6;  
{*
 * @brief xcb_dpms_force_level_request_t
 * }
type
  Pxcb_dpms_force_level_request_t = ^Txcb_dpms_force_level_request_t;
  Txcb_dpms_force_level_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      power_level : Tuint16_t;
    end;
{*
 * @brief xcb_dpms_info_cookie_t
 * }

  Pxcb_dpms_info_cookie_t = ^Txcb_dpms_info_cookie_t;
  Txcb_dpms_info_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dpms_info.  }

const
  XCB_DPMS_INFO = 7;  
{*
 * @brief xcb_dpms_info_request_t
 * }
type
  Pxcb_dpms_info_request_t = ^Txcb_dpms_info_request_t;
  Txcb_dpms_info_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_dpms_info_reply_t
 * }

  Pxcb_dpms_info_reply_t = ^Txcb_dpms_info_reply_t;
  Txcb_dpms_info_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      power_level : Tuint16_t;
      state : Tuint8_t;
      pad1 : array[0..20] of Tuint8_t;
    end;

  Pxcb_dpms_event_mask_t = ^Txcb_dpms_event_mask_t;
  Txcb_dpms_event_mask_t =  Longint;
  Const
    XCB_DPMS_EVENT_MASK_INFO_NOTIFY = 1;
;
{* Opcode for xcb_dpms_select_input.  }
  XCB_DPMS_SELECT_INPUT = 8;  
{*
 * @brief xcb_dpms_select_input_request_t
 * }
type
  Pxcb_dpms_select_input_request_t = ^Txcb_dpms_select_input_request_t;
  Txcb_dpms_select_input_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      event_mask : Tuint32_t;
    end;
{* Opcode for xcb_dpms_info_notify.  }

const
  XCB_DPMS_INFO_NOTIFY = 0;  
{*
 * @brief xcb_dpms_info_notify_event_t
 * }
type
  Pxcb_dpms_info_notify_event_t = ^Txcb_dpms_info_notify_event_t;
  Txcb_dpms_info_notify_event_t = record
      response_type : Tuint8_t;
      extension : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      event_type : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
      timestamp : Txcb_timestamp_t;
      power_level : Tuint16_t;
      state : Tuint8_t;
      pad1 : array[0..20] of Tuint8_t;
    end;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }

function xcb_dpms_get_version(c:Pxcb_connection_t; client_major_version:Tuint16_t; client_minor_version:Tuint16_t):Txcb_dpms_get_version_cookie_t;cdecl;external libxcbxxx;
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
function xcb_dpms_get_version_unchecked(c:Pxcb_connection_t; client_major_version:Tuint16_t; client_minor_version:Tuint16_t):Txcb_dpms_get_version_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dpms_get_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dpms_get_version_reply(c:Pxcb_connection_t; cookie:Txcb_dpms_get_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_dpms_get_version_reply_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dpms_capable(c:Pxcb_connection_t):Txcb_dpms_capable_cookie_t;cdecl;external libxcbxxx;
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
function xcb_dpms_capable_unchecked(c:Pxcb_connection_t):Txcb_dpms_capable_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dpms_capable_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dpms_capable_reply(c:Pxcb_connection_t; cookie:Txcb_dpms_capable_cookie_t; e:PPxcb_generic_error_t):Pxcb_dpms_capable_reply_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dpms_get_timeouts(c:Pxcb_connection_t):Txcb_dpms_get_timeouts_cookie_t;cdecl;external libxcbxxx;
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
function xcb_dpms_get_timeouts_unchecked(c:Pxcb_connection_t):Txcb_dpms_get_timeouts_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dpms_get_timeouts_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dpms_get_timeouts_reply(c:Pxcb_connection_t; cookie:Txcb_dpms_get_timeouts_cookie_t; e:PPxcb_generic_error_t):Pxcb_dpms_get_timeouts_reply_t;cdecl;external libxcbxxx;
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
function xcb_dpms_set_timeouts_checked(c:Pxcb_connection_t; standby_timeout:Tuint16_t; suspend_timeout:Tuint16_t; off_timeout:Tuint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dpms_set_timeouts(c:Pxcb_connection_t; standby_timeout:Tuint16_t; suspend_timeout:Tuint16_t; off_timeout:Tuint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_dpms_enable_checked(c:Pxcb_connection_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dpms_enable(c:Pxcb_connection_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_dpms_disable_checked(c:Pxcb_connection_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dpms_disable(c:Pxcb_connection_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_dpms_force_level_checked(c:Pxcb_connection_t; power_level:Tuint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dpms_force_level(c:Pxcb_connection_t; power_level:Tuint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dpms_info(c:Pxcb_connection_t):Txcb_dpms_info_cookie_t;cdecl;external libxcbxxx;
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
function xcb_dpms_info_unchecked(c:Pxcb_connection_t):Txcb_dpms_info_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dpms_info_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dpms_info_reply(c:Pxcb_connection_t; cookie:Txcb_dpms_info_cookie_t; e:PPxcb_generic_error_t):Pxcb_dpms_info_reply_t;cdecl;external libxcbxxx;
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
function xcb_dpms_select_input_checked(c:Pxcb_connection_t; event_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dpms_select_input(c:Pxcb_connection_t; event_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

// === Konventiert am: 14-10-25 15:38:56 ===


implementation



end.
