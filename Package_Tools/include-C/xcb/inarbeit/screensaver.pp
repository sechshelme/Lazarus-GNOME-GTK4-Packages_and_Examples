
unit screensaver;
interface

{
  Automatically converted by H2Pas 1.0.0 from screensaver.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    screensaver.h
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
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_screensaver_event_t  = ^xcb_screensaver_event_t;
Pxcb_screensaver_kind_t  = ^xcb_screensaver_kind_t;
Pxcb_screensaver_notify_event_t  = ^xcb_screensaver_notify_event_t;
Pxcb_screensaver_query_info_cookie_t  = ^xcb_screensaver_query_info_cookie_t;
Pxcb_screensaver_query_info_reply_t  = ^xcb_screensaver_query_info_reply_t;
Pxcb_screensaver_query_info_request_t  = ^xcb_screensaver_query_info_request_t;
Pxcb_screensaver_query_version_cookie_t  = ^xcb_screensaver_query_version_cookie_t;
Pxcb_screensaver_query_version_reply_t  = ^xcb_screensaver_query_version_reply_t;
Pxcb_screensaver_query_version_request_t  = ^xcb_screensaver_query_version_request_t;
Pxcb_screensaver_select_input_request_t  = ^xcb_screensaver_select_input_request_t;
Pxcb_screensaver_set_attributes_request_t  = ^xcb_screensaver_set_attributes_request_t;
Pxcb_screensaver_set_attributes_value_list_t  = ^xcb_screensaver_set_attributes_value_list_t;
Pxcb_screensaver_state_t  = ^xcb_screensaver_state_t;
Pxcb_screensaver_suspend_request_t  = ^xcb_screensaver_suspend_request_t;
Pxcb_screensaver_unset_attributes_request_t  = ^xcb_screensaver_unset_attributes_request_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from screensaver.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_ScreenSaver_API XCB ScreenSaver API
 * @brief ScreenSaver XCB Protocol Implementation.
 * @
 * }
{$ifndef __SCREENSAVER_H}
{$define __SCREENSAVER_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_SCREENSAVER_MAJOR_VERSION = 1;  
  XCB_SCREENSAVER_MINOR_VERSION = 1;  
  var
    xcb_screensaver_id : Txcb_extension_t;cvar;external;
type
  Pxcb_screensaver_kind_t = ^Txcb_screensaver_kind_t;
  Txcb_screensaver_kind_t =  Longint;
  Const
    XCB_SCREENSAVER_KIND_BLANKED = 0;
    XCB_SCREENSAVER_KIND_INTERNAL = 1;
    XCB_SCREENSAVER_KIND_EXTERNAL = 2;
;
type
  Pxcb_screensaver_event_t = ^Txcb_screensaver_event_t;
  Txcb_screensaver_event_t =  Longint;
  Const
    XCB_SCREENSAVER_EVENT_NOTIFY_MASK = 1;
    XCB_SCREENSAVER_EVENT_CYCLE_MASK = 2;
;
type
  Pxcb_screensaver_state_t = ^Txcb_screensaver_state_t;
  Txcb_screensaver_state_t =  Longint;
  Const
    XCB_SCREENSAVER_STATE_OFF = 0;
    XCB_SCREENSAVER_STATE_ON = 1;
    XCB_SCREENSAVER_STATE_CYCLE = 2;
    XCB_SCREENSAVER_STATE_DISABLED = 3;
;
{*
 * @brief xcb_screensaver_query_version_cookie_t
 * }
type
  Pxcb_screensaver_query_version_cookie_t = ^Txcb_screensaver_query_version_cookie_t;
  Txcb_screensaver_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_screensaver_query_version.  }

const
  XCB_SCREENSAVER_QUERY_VERSION = 0;  
{*
 * @brief xcb_screensaver_query_version_request_t
 * }
type
  Pxcb_screensaver_query_version_request_t = ^Txcb_screensaver_query_version_request_t;
  Txcb_screensaver_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      client_major_version : Tuint8_t;
      client_minor_version : Tuint8_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_screensaver_query_version_reply_t
 * }

  Pxcb_screensaver_query_version_reply_t = ^Txcb_screensaver_query_version_reply_t;
  Txcb_screensaver_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      server_major_version : Tuint16_t;
      server_minor_version : Tuint16_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * @brief xcb_screensaver_query_info_cookie_t
 * }

  Pxcb_screensaver_query_info_cookie_t = ^Txcb_screensaver_query_info_cookie_t;
  Txcb_screensaver_query_info_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_screensaver_query_info.  }

const
  XCB_SCREENSAVER_QUERY_INFO = 1;  
{*
 * @brief xcb_screensaver_query_info_request_t
 * }
type
  Pxcb_screensaver_query_info_request_t = ^Txcb_screensaver_query_info_request_t;
  Txcb_screensaver_query_info_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
    end;
{*
 * @brief xcb_screensaver_query_info_reply_t
 * }

  Pxcb_screensaver_query_info_reply_t = ^Txcb_screensaver_query_info_reply_t;
  Txcb_screensaver_query_info_reply_t = record
      response_type : Tuint8_t;
      state : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      saver_window : Txcb_window_t;
      ms_until_server : Tuint32_t;
      ms_since_user_input : Tuint32_t;
      event_mask : Tuint32_t;
      kind : Tuint8_t;
      pad0 : array[0..6] of Tuint8_t;
    end;
{* Opcode for xcb_screensaver_select_input.  }

const
  XCB_SCREENSAVER_SELECT_INPUT = 2;  
{*
 * @brief xcb_screensaver_select_input_request_t
 * }
type
  Pxcb_screensaver_select_input_request_t = ^Txcb_screensaver_select_input_request_t;
  Txcb_screensaver_select_input_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      event_mask : Tuint32_t;
    end;
{*
 * @brief xcb_screensaver_set_attributes_value_list_t
 * }

  Pxcb_screensaver_set_attributes_value_list_t = ^Txcb_screensaver_set_attributes_value_list_t;
  Txcb_screensaver_set_attributes_value_list_t = record
      background_pixmap : Txcb_pixmap_t;
      background_pixel : Tuint32_t;
      border_pixmap : Txcb_pixmap_t;
      border_pixel : Tuint32_t;
      bit_gravity : Tuint32_t;
      win_gravity : Tuint32_t;
      backing_store : Tuint32_t;
      backing_planes : Tuint32_t;
      backing_pixel : Tuint32_t;
      override_redirect : Txcb_bool32_t;
      save_under : Txcb_bool32_t;
      event_mask : Tuint32_t;
      do_not_propogate_mask : Tuint32_t;
      colormap : Txcb_colormap_t;
      cursor : Txcb_cursor_t;
    end;
{* Opcode for xcb_screensaver_set_attributes.  }

const
  XCB_SCREENSAVER_SET_ATTRIBUTES = 3;  
{*
 * @brief xcb_screensaver_set_attributes_request_t
 * }
type
  Pxcb_screensaver_set_attributes_request_t = ^Txcb_screensaver_set_attributes_request_t;
  Txcb_screensaver_set_attributes_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      border_width : Tuint16_t;
      _class : Tuint8_t;
      depth : Tuint8_t;
      visual : Txcb_visualid_t;
      value_mask : Tuint32_t;
    end;
{* Opcode for xcb_screensaver_unset_attributes.  }

const
  XCB_SCREENSAVER_UNSET_ATTRIBUTES = 4;  
{*
 * @brief xcb_screensaver_unset_attributes_request_t
 * }
type
  Pxcb_screensaver_unset_attributes_request_t = ^Txcb_screensaver_unset_attributes_request_t;
  Txcb_screensaver_unset_attributes_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
    end;
{* Opcode for xcb_screensaver_suspend.  }

const
  XCB_SCREENSAVER_SUSPEND = 5;  
{*
 * @brief xcb_screensaver_suspend_request_t
 * }
type
  Pxcb_screensaver_suspend_request_t = ^Txcb_screensaver_suspend_request_t;
  Txcb_screensaver_suspend_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      suspend : Tuint32_t;
    end;
{* Opcode for xcb_screensaver_notify.  }

const
  XCB_SCREENSAVER_NOTIFY = 0;  
{*
 * @brief xcb_screensaver_notify_event_t
 * }
type
  Pxcb_screensaver_notify_event_t = ^Txcb_screensaver_notify_event_t;
  Txcb_screensaver_notify_event_t = record
      response_type : Tuint8_t;
      state : Tuint8_t;
      sequence : Tuint16_t;
      time : Txcb_timestamp_t;
      root : Txcb_window_t;
      window : Txcb_window_t;
      kind : Tuint8_t;
      forced : Tuint8_t;
      pad0 : array[0..13] of Tuint8_t;
    end;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }

function xcb_screensaver_query_version(c:Pxcb_connection_t; client_major_version:Tuint8_t; client_minor_version:Tuint8_t):Txcb_screensaver_query_version_cookie_t;cdecl;external;
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
function xcb_screensaver_query_version_unchecked(c:Pxcb_connection_t; client_major_version:Tuint8_t; client_minor_version:Tuint8_t):Txcb_screensaver_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_screensaver_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_screensaver_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_screensaver_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_screensaver_query_version_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_screensaver_query_info(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_screensaver_query_info_cookie_t;cdecl;external;
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
function xcb_screensaver_query_info_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_screensaver_query_info_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_screensaver_query_info_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_screensaver_query_info_reply(c:Pxcb_connection_t; cookie:Txcb_screensaver_query_info_cookie_t; e:PPxcb_generic_error_t):Pxcb_screensaver_query_info_reply_t;cdecl;external;
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
function xcb_screensaver_select_input_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; event_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_screensaver_select_input(c:Pxcb_connection_t; drawable:Txcb_drawable_t; event_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_screensaver_set_attributes_value_list_serialize(_buffer:Ppointer; value_mask:Tuint32_t; _aux:Pxcb_screensaver_set_attributes_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_screensaver_set_attributes_value_list_unpack(_buffer:pointer; value_mask:Tuint32_t; _aux:Pxcb_screensaver_set_attributes_value_list_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_screensaver_set_attributes_value_list_sizeof(_buffer:pointer; value_mask:Tuint32_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_screensaver_set_attributes_sizeof(_buffer:pointer):longint;cdecl;external;
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
(* Const before type ignored *)
function xcb_screensaver_set_attributes_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; x:Tint16_t; y:Tint16_t; width:Tuint16_t; 
           height:Tuint16_t; border_width:Tuint16_t; _class:Tuint8_t; depth:Tuint8_t; visual:Txcb_visualid_t; 
           value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_screensaver_set_attributes(c:Pxcb_connection_t; drawable:Txcb_drawable_t; x:Tint16_t; y:Tint16_t; width:Tuint16_t; 
           height:Tuint16_t; border_width:Tuint16_t; _class:Tuint8_t; depth:Tuint8_t; visual:Txcb_visualid_t; 
           value_mask:Tuint32_t; value_list:pointer):Txcb_void_cookie_t;cdecl;external;
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
(* Const before type ignored *)
function xcb_screensaver_set_attributes_aux_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; x:Tint16_t; y:Tint16_t; width:Tuint16_t; 
           height:Tuint16_t; border_width:Tuint16_t; _class:Tuint8_t; depth:Tuint8_t; visual:Txcb_visualid_t; 
           value_mask:Tuint32_t; value_list:Pxcb_screensaver_set_attributes_value_list_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_screensaver_set_attributes_aux(c:Pxcb_connection_t; drawable:Txcb_drawable_t; x:Tint16_t; y:Tint16_t; width:Tuint16_t; 
           height:Tuint16_t; border_width:Tuint16_t; _class:Tuint8_t; depth:Tuint8_t; visual:Txcb_visualid_t; 
           value_mask:Tuint32_t; value_list:Pxcb_screensaver_set_attributes_value_list_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_screensaver_set_attributes_value_list(R:Pxcb_screensaver_set_attributes_request_t):pointer;cdecl;external;
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
function xcb_screensaver_unset_attributes_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_screensaver_unset_attributes(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_screensaver_suspend_checked(c:Pxcb_connection_t; suspend:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_screensaver_suspend(c:Pxcb_connection_t; suspend:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
