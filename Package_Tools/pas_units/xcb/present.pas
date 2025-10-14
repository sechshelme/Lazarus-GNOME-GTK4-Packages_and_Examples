unit present;

interface

uses
  fp_xcb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from present.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Present_API XCB Present API
 * @brief Present XCB Protocol Implementation.
 * @
 * }
{$ifndef __PRESENT_H}
{$define __PRESENT_H}
{$include "xcb.h"}
{$include "xproto.h"}
{$include "randr.h"}
{$include "xfixes.h"}
{$include "sync.h"}
{ C++ extern C conditionnal removed }

const
  XCB_PRESENT_MAJOR_VERSION = 1;  
  XCB_PRESENT_MINOR_VERSION = 3;  
  var
    xcb_present_id : Txcb_extension_t;cvar;external libxcbxxx;
type
  Pxcb_present_event_enum_t = ^Txcb_present_event_enum_t;
  Txcb_present_event_enum_t =  Longint;
  Const
    XCB_PRESENT_EVENT_CONFIGURE_NOTIFY = 0;
    XCB_PRESENT_EVENT_COMPLETE_NOTIFY = 1;
    XCB_PRESENT_EVENT_IDLE_NOTIFY = 2;
    XCB_PRESENT_EVENT_REDIRECT_NOTIFY = 3;
;
type
  Pxcb_present_event_mask_t = ^Txcb_present_event_mask_t;
  Txcb_present_event_mask_t =  Longint;
  Const
    XCB_PRESENT_EVENT_MASK_NO_EVENT = 0;
    XCB_PRESENT_EVENT_MASK_CONFIGURE_NOTIFY = 1;
    XCB_PRESENT_EVENT_MASK_COMPLETE_NOTIFY = 2;
    XCB_PRESENT_EVENT_MASK_IDLE_NOTIFY = 4;
    XCB_PRESENT_EVENT_MASK_REDIRECT_NOTIFY = 8;
;
type
  Pxcb_present_option_t = ^Txcb_present_option_t;
  Txcb_present_option_t =  Longint;
  Const
    XCB_PRESENT_OPTION_NONE = 0;
    XCB_PRESENT_OPTION_ASYNC = 1;
    XCB_PRESENT_OPTION_COPY = 2;
    XCB_PRESENT_OPTION_UST = 4;
    XCB_PRESENT_OPTION_SUBOPTIMAL = 8;
    XCB_PRESENT_OPTION_ASYNC_MAY_TEAR = 16;
;
type
  Pxcb_present_capability_t = ^Txcb_present_capability_t;
  Txcb_present_capability_t =  Longint;
  Const
    XCB_PRESENT_CAPABILITY_NONE = 0;
    XCB_PRESENT_CAPABILITY_ASYNC = 1;
    XCB_PRESENT_CAPABILITY_FENCE = 2;
    XCB_PRESENT_CAPABILITY_UST = 4;
    XCB_PRESENT_CAPABILITY_ASYNC_MAY_TEAR = 8;
;
type
  Pxcb_present_complete_kind_t = ^Txcb_present_complete_kind_t;
  Txcb_present_complete_kind_t =  Longint;
  Const
    XCB_PRESENT_COMPLETE_KIND_PIXMAP = 0;
    XCB_PRESENT_COMPLETE_KIND_NOTIFY_MSC = 1;
;
type
  Pxcb_present_complete_mode_t = ^Txcb_present_complete_mode_t;
  Txcb_present_complete_mode_t =  Longint;
  Const
    XCB_PRESENT_COMPLETE_MODE_COPY = 0;
    XCB_PRESENT_COMPLETE_MODE_FLIP = 1;
    XCB_PRESENT_COMPLETE_MODE_SKIP = 2;
    XCB_PRESENT_COMPLETE_MODE_SUBOPTIMAL_COPY = 3;
;
{*
 * @brief xcb_present_notify_t
 * }
type
  Pxcb_present_notify_t = ^Txcb_present_notify_t;
  Txcb_present_notify_t = record
      window : Txcb_window_t;
      serial : Tuint32_t;
    end;
{*
 * @brief xcb_present_notify_iterator_t
 * }

  Pxcb_present_notify_iterator_t = ^Txcb_present_notify_iterator_t;
  Txcb_present_notify_iterator_t = record
      data : Pxcb_present_notify_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_present_query_version_cookie_t
 * }

  Pxcb_present_query_version_cookie_t = ^Txcb_present_query_version_cookie_t;
  Txcb_present_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_present_query_version.  }

const
  XCB_PRESENT_QUERY_VERSION = 0;  
{*
 * @brief xcb_present_query_version_request_t
 * }
type
  Pxcb_present_query_version_request_t = ^Txcb_present_query_version_request_t;
  Txcb_present_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
    end;
{*
 * @brief xcb_present_query_version_reply_t
 * }

  Pxcb_present_query_version_reply_t = ^Txcb_present_query_version_reply_t;
  Txcb_present_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
    end;
{* Opcode for xcb_present_pixmap.  }

const
  XCB_PRESENT_PIXMAP = 1;  
{*
 * @brief xcb_present_pixmap_request_t
 * }
type
  Pxcb_present_pixmap_request_t = ^Txcb_present_pixmap_request_t;
  Txcb_present_pixmap_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      pixmap : Txcb_pixmap_t;
      serial : Tuint32_t;
      valid : Txcb_xfixes_region_t;
      update : Txcb_xfixes_region_t;
      x_off : Tint16_t;
      y_off : Tint16_t;
      target_crtc : Txcb_randr_crtc_t;
      wait_fence : Txcb_sync_fence_t;
      idle_fence : Txcb_sync_fence_t;
      options : Tuint32_t;
      pad0 : array[0..3] of Tuint8_t;
      target_msc : Tuint64_t;
      divisor : Tuint64_t;
      remainder : Tuint64_t;
    end;
{* Opcode for xcb_present_notify_msc.  }

const
  XCB_PRESENT_NOTIFY_MSC = 2;  
{*
 * @brief xcb_present_notify_msc_request_t
 * }
type
  Pxcb_present_notify_msc_request_t = ^Txcb_present_notify_msc_request_t;
  Txcb_present_notify_msc_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      serial : Tuint32_t;
      pad0 : array[0..3] of Tuint8_t;
      target_msc : Tuint64_t;
      divisor : Tuint64_t;
      remainder : Tuint64_t;
    end;

  Pxcb_present_event_t = ^Txcb_present_event_t;
  Txcb_present_event_t = Tuint32_t;
{*
 * @brief xcb_present_event_iterator_t
 * }

  Pxcb_present_event_iterator_t = ^Txcb_present_event_iterator_t;
  Txcb_present_event_iterator_t = record
      data : Pxcb_present_event_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_present_select_input.  }

const
  XCB_PRESENT_SELECT_INPUT = 3;  
{*
 * @brief xcb_present_select_input_request_t
 * }
type
  Pxcb_present_select_input_request_t = ^Txcb_present_select_input_request_t;
  Txcb_present_select_input_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      eid : Txcb_present_event_t;
      window : Txcb_window_t;
      event_mask : Tuint32_t;
    end;
{*
 * @brief xcb_present_query_capabilities_cookie_t
 * }

  Pxcb_present_query_capabilities_cookie_t = ^Txcb_present_query_capabilities_cookie_t;
  Txcb_present_query_capabilities_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_present_query_capabilities.  }

const
  XCB_PRESENT_QUERY_CAPABILITIES = 4;  
{*
 * @brief xcb_present_query_capabilities_request_t
 * }
type
  Pxcb_present_query_capabilities_request_t = ^Txcb_present_query_capabilities_request_t;
  Txcb_present_query_capabilities_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      target : Tuint32_t;
    end;
{*
 * @brief xcb_present_query_capabilities_reply_t
 * }

  Pxcb_present_query_capabilities_reply_t = ^Txcb_present_query_capabilities_reply_t;
  Txcb_present_query_capabilities_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      capabilities : Tuint32_t;
    end;
{* Opcode for xcb_present_generic.  }

const
  XCB_PRESENT_GENERIC = 0;  
{*
 * @brief xcb_present_generic_event_t
 * }
type
  Pxcb_present_generic_event_t = ^Txcb_present_generic_event_t;
  Txcb_present_generic_event_t = record
      response_type : Tuint8_t;
      extension : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      evtype : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
      event : Txcb_present_event_t;
    end;
{* Opcode for xcb_present_configure_notify.  }

const
  XCB_PRESENT_CONFIGURE_NOTIFY = 0;  
{*
 * @brief xcb_present_configure_notify_event_t
 * }
type
  Pxcb_present_configure_notify_event_t = ^Txcb_present_configure_notify_event_t;
  Txcb_present_configure_notify_event_t = record
      response_type : Tuint8_t;
      extension : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      event_type : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
      event : Txcb_present_event_t;
      window : Txcb_window_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      off_x : Tint16_t;
      off_y : Tint16_t;
      full_sequence : Tuint32_t;
      pixmap_width : Tuint16_t;
      pixmap_height : Tuint16_t;
      pixmap_flags : Tuint32_t;
    end;
{* Opcode for xcb_present_complete_notify.  }

const
  XCB_PRESENT_COMPLETE_NOTIFY = 1;  
{*
 * @brief xcb_present_complete_notify_event_t
 * }
type
  Pxcb_present_complete_notify_event_t = ^Txcb_present_complete_notify_event_t;
  Txcb_present_complete_notify_event_t = record
      response_type : Tuint8_t;
      extension : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      event_type : Tuint16_t;
      kind : Tuint8_t;
      mode : Tuint8_t;
      event : Txcb_present_event_t;
      window : Txcb_window_t;
      serial : Tuint32_t;
      ust : Tuint64_t;
      full_sequence : Tuint32_t;
      msc : Tuint64_t;
    end;
{* Opcode for xcb_present_idle_notify.  }

const
  XCB_PRESENT_IDLE_NOTIFY = 2;  
{*
 * @brief xcb_present_idle_notify_event_t
 * }
type
  Pxcb_present_idle_notify_event_t = ^Txcb_present_idle_notify_event_t;
  Txcb_present_idle_notify_event_t = record
      response_type : Tuint8_t;
      extension : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      event_type : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
      event : Txcb_present_event_t;
      window : Txcb_window_t;
      serial : Tuint32_t;
      pixmap : Txcb_pixmap_t;
      idle_fence : Txcb_sync_fence_t;
      full_sequence : Tuint32_t;
    end;
{* Opcode for xcb_present_redirect_notify.  }

const
  XCB_PRESENT_REDIRECT_NOTIFY = 3;  
{*
 * @brief xcb_present_redirect_notify_event_t
 * }
type
  Pxcb_present_redirect_notify_event_t = ^Txcb_present_redirect_notify_event_t;
  Txcb_present_redirect_notify_event_t = record
      response_type : Tuint8_t;
      extension : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      event_type : Tuint16_t;
      update_window : Tuint8_t;
      pad0 : Tuint8_t;
      event : Txcb_present_event_t;
      event_window : Txcb_window_t;
      window : Txcb_window_t;
      pixmap : Txcb_pixmap_t;
      serial : Tuint32_t;
      full_sequence : Tuint32_t;
      valid_region : Txcb_xfixes_region_t;
      update_region : Txcb_xfixes_region_t;
      valid_rect : Txcb_rectangle_t;
      update_rect : Txcb_rectangle_t;
      x_off : Tint16_t;
      y_off : Tint16_t;
      target_crtc : Txcb_randr_crtc_t;
      wait_fence : Txcb_sync_fence_t;
      idle_fence : Txcb_sync_fence_t;
      options : Tuint32_t;
      pad1 : array[0..3] of Tuint8_t;
      target_msc : Tuint64_t;
      divisor : Tuint64_t;
      remainder : Tuint64_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_present_notify_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_present_notify_t)
  }

procedure xcb_present_notify_next(i:Pxcb_present_notify_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_present_notify_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_present_notify_end(i:Txcb_present_notify_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_present_query_version(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t):Txcb_present_query_version_cookie_t;cdecl;external libxcbxxx;
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
function xcb_present_query_version_unchecked(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t):Txcb_present_query_version_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_present_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_present_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_present_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_present_query_version_reply_t;cdecl;external libxcbxxx;
function xcb_present_pixmap_sizeof(_buffer:pointer; notifies_len:Tuint32_t):longint;cdecl;external libxcbxxx;
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
function xcb_present_pixmap_checked(c:Pxcb_connection_t; window:Txcb_window_t; pixmap:Txcb_pixmap_t; serial:Tuint32_t; valid:Txcb_xfixes_region_t; 
           update:Txcb_xfixes_region_t; x_off:Tint16_t; y_off:Tint16_t; target_crtc:Txcb_randr_crtc_t; wait_fence:Txcb_sync_fence_t; 
           idle_fence:Txcb_sync_fence_t; options:Tuint32_t; target_msc:Tuint64_t; divisor:Tuint64_t; remainder:Tuint64_t; 
           notifies_len:Tuint32_t; notifies:Pxcb_present_notify_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_present_pixmap(c:Pxcb_connection_t; window:Txcb_window_t; pixmap:Txcb_pixmap_t; serial:Tuint32_t; valid:Txcb_xfixes_region_t; 
           update:Txcb_xfixes_region_t; x_off:Tint16_t; y_off:Tint16_t; target_crtc:Txcb_randr_crtc_t; wait_fence:Txcb_sync_fence_t; 
           idle_fence:Txcb_sync_fence_t; options:Tuint32_t; target_msc:Tuint64_t; divisor:Tuint64_t; remainder:Tuint64_t; 
           notifies_len:Tuint32_t; notifies:Pxcb_present_notify_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_present_pixmap_notifies(R:Pxcb_present_pixmap_request_t):Pxcb_present_notify_t;cdecl;external libxcbxxx;
function xcb_present_pixmap_notifies_length(R:Pxcb_present_pixmap_request_t):longint;cdecl;external libxcbxxx;
function xcb_present_pixmap_notifies_iterator(R:Pxcb_present_pixmap_request_t):Txcb_present_notify_iterator_t;cdecl;external libxcbxxx;
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
function xcb_present_notify_msc_checked(c:Pxcb_connection_t; window:Txcb_window_t; serial:Tuint32_t; target_msc:Tuint64_t; divisor:Tuint64_t; 
           remainder:Tuint64_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_present_notify_msc(c:Pxcb_connection_t; window:Txcb_window_t; serial:Tuint32_t; target_msc:Tuint64_t; divisor:Tuint64_t; 
           remainder:Tuint64_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_present_event_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_present_event_t)
  }
procedure xcb_present_event_next(i:Pxcb_present_event_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_present_event_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_present_event_end(i:Txcb_present_event_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
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
function xcb_present_select_input_checked(c:Pxcb_connection_t; eid:Txcb_present_event_t; window:Txcb_window_t; event_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_present_select_input(c:Pxcb_connection_t; eid:Txcb_present_event_t; window:Txcb_window_t; event_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_present_query_capabilities(c:Pxcb_connection_t; target:Tuint32_t):Txcb_present_query_capabilities_cookie_t;cdecl;external libxcbxxx;
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
function xcb_present_query_capabilities_unchecked(c:Pxcb_connection_t; target:Tuint32_t):Txcb_present_query_capabilities_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_present_query_capabilities_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_present_query_capabilities_reply(c:Pxcb_connection_t; cookie:Txcb_present_query_capabilities_cookie_t; e:PPxcb_generic_error_t):Pxcb_present_query_capabilities_reply_t;cdecl;external libxcbxxx;
function xcb_present_redirect_notify_sizeof(_buffer:pointer; notifies_len:Tuint32_t):longint;cdecl;external libxcbxxx;
function xcb_present_redirect_notify_notifies(R:Pxcb_present_redirect_notify_event_t):Pxcb_present_notify_t;cdecl;external libxcbxxx;
function xcb_present_redirect_notify_notifies_length(R:Pxcb_present_redirect_notify_event_t):longint;cdecl;external libxcbxxx;
function xcb_present_redirect_notify_notifies_iterator(R:Pxcb_present_redirect_notify_event_t):Txcb_present_notify_iterator_t;cdecl;external libxcbxxx;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

// === Konventiert am: 14-10-25 15:38:59 ===


implementation



end.
