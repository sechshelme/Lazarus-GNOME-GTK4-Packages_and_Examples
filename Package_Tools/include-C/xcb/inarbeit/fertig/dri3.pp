
unit dri3;
interface

{
  Automatically converted by H2Pas 1.0.0 from dri3.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dri3.h
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
Pint32_t  = ^int32_t;
Plongint  = ^longint;
Puint32_t  = ^uint32_t;
Puint64_t  = ^uint64_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_dri3_buffer_from_pixmap_cookie_t  = ^xcb_dri3_buffer_from_pixmap_cookie_t;
Pxcb_dri3_buffer_from_pixmap_reply_t  = ^xcb_dri3_buffer_from_pixmap_reply_t;
Pxcb_dri3_buffer_from_pixmap_request_t  = ^xcb_dri3_buffer_from_pixmap_request_t;
Pxcb_dri3_buffers_from_pixmap_cookie_t  = ^xcb_dri3_buffers_from_pixmap_cookie_t;
Pxcb_dri3_buffers_from_pixmap_reply_t  = ^xcb_dri3_buffers_from_pixmap_reply_t;
Pxcb_dri3_buffers_from_pixmap_request_t  = ^xcb_dri3_buffers_from_pixmap_request_t;
Pxcb_dri3_fd_from_fence_cookie_t  = ^xcb_dri3_fd_from_fence_cookie_t;
Pxcb_dri3_fd_from_fence_reply_t  = ^xcb_dri3_fd_from_fence_reply_t;
Pxcb_dri3_fd_from_fence_request_t  = ^xcb_dri3_fd_from_fence_request_t;
Pxcb_dri3_fence_from_fd_request_t  = ^xcb_dri3_fence_from_fd_request_t;
Pxcb_dri3_get_supported_modifiers_cookie_t  = ^xcb_dri3_get_supported_modifiers_cookie_t;
Pxcb_dri3_get_supported_modifiers_reply_t  = ^xcb_dri3_get_supported_modifiers_reply_t;
Pxcb_dri3_get_supported_modifiers_request_t  = ^xcb_dri3_get_supported_modifiers_request_t;
Pxcb_dri3_open_cookie_t  = ^xcb_dri3_open_cookie_t;
Pxcb_dri3_open_reply_t  = ^xcb_dri3_open_reply_t;
Pxcb_dri3_open_request_t  = ^xcb_dri3_open_request_t;
Pxcb_dri3_pixmap_from_buffer_request_t  = ^xcb_dri3_pixmap_from_buffer_request_t;
Pxcb_dri3_pixmap_from_buffers_request_t  = ^xcb_dri3_pixmap_from_buffers_request_t;
Pxcb_dri3_query_version_cookie_t  = ^xcb_dri3_query_version_cookie_t;
Pxcb_dri3_query_version_reply_t  = ^xcb_dri3_query_version_reply_t;
Pxcb_dri3_query_version_request_t  = ^xcb_dri3_query_version_request_t;
Pxcb_dri3_set_drm_device_in_use_request_t  = ^xcb_dri3_set_drm_device_in_use_request_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from dri3.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_DRI3_API XCB DRI3 API
 * @brief DRI3 XCB Protocol Implementation.
 * @
 * }
{$ifndef __DRI3_H}
{$define __DRI3_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_DRI3_MAJOR_VERSION = 1;  
  XCB_DRI3_MINOR_VERSION = 3;  
  var
    xcb_dri3_id : Txcb_extension_t;cvar;external;
{*
 * @brief xcb_dri3_query_version_cookie_t
 * }
type
  Pxcb_dri3_query_version_cookie_t = ^Txcb_dri3_query_version_cookie_t;
  Txcb_dri3_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri3_query_version.  }

const
  XCB_DRI3_QUERY_VERSION = 0;  
{*
 * @brief xcb_dri3_query_version_request_t
 * }
type
  Pxcb_dri3_query_version_request_t = ^Txcb_dri3_query_version_request_t;
  Txcb_dri3_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
    end;
{*
 * @brief xcb_dri3_query_version_reply_t
 * }

  Pxcb_dri3_query_version_reply_t = ^Txcb_dri3_query_version_reply_t;
  Txcb_dri3_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
    end;
{*
 * @brief xcb_dri3_open_cookie_t
 * }

  Pxcb_dri3_open_cookie_t = ^Txcb_dri3_open_cookie_t;
  Txcb_dri3_open_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri3_open.  }

const
  XCB_DRI3_OPEN = 1;  
{*
 * @brief xcb_dri3_open_request_t
 * }
type
  Pxcb_dri3_open_request_t = ^Txcb_dri3_open_request_t;
  Txcb_dri3_open_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      provider : Tuint32_t;
    end;
{*
 * @brief xcb_dri3_open_reply_t
 * }

  Pxcb_dri3_open_reply_t = ^Txcb_dri3_open_reply_t;
  Txcb_dri3_open_reply_t = record
      response_type : Tuint8_t;
      nfd : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad0 : array[0..23] of Tuint8_t;
    end;
{* Opcode for xcb_dri3_pixmap_from_buffer.  }

const
  XCB_DRI3_PIXMAP_FROM_BUFFER = 2;  
{*
 * @brief xcb_dri3_pixmap_from_buffer_request_t
 * }
type
  Pxcb_dri3_pixmap_from_buffer_request_t = ^Txcb_dri3_pixmap_from_buffer_request_t;
  Txcb_dri3_pixmap_from_buffer_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      pixmap : Txcb_pixmap_t;
      drawable : Txcb_drawable_t;
      size : Tuint32_t;
      width : Tuint16_t;
      height : Tuint16_t;
      stride : Tuint16_t;
      depth : Tuint8_t;
      bpp : Tuint8_t;
    end;
{*
 * @brief xcb_dri3_buffer_from_pixmap_cookie_t
 * }

  Pxcb_dri3_buffer_from_pixmap_cookie_t = ^Txcb_dri3_buffer_from_pixmap_cookie_t;
  Txcb_dri3_buffer_from_pixmap_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri3_buffer_from_pixmap.  }

const
  XCB_DRI3_BUFFER_FROM_PIXMAP = 3;  
{*
 * @brief xcb_dri3_buffer_from_pixmap_request_t
 * }
type
  Pxcb_dri3_buffer_from_pixmap_request_t = ^Txcb_dri3_buffer_from_pixmap_request_t;
  Txcb_dri3_buffer_from_pixmap_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      pixmap : Txcb_pixmap_t;
    end;
{*
 * @brief xcb_dri3_buffer_from_pixmap_reply_t
 * }

  Pxcb_dri3_buffer_from_pixmap_reply_t = ^Txcb_dri3_buffer_from_pixmap_reply_t;
  Txcb_dri3_buffer_from_pixmap_reply_t = record
      response_type : Tuint8_t;
      nfd : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      size : Tuint32_t;
      width : Tuint16_t;
      height : Tuint16_t;
      stride : Tuint16_t;
      depth : Tuint8_t;
      bpp : Tuint8_t;
      pad0 : array[0..11] of Tuint8_t;
    end;
{* Opcode for xcb_dri3_fence_from_fd.  }

const
  XCB_DRI3_FENCE_FROM_FD = 4;  
{*
 * @brief xcb_dri3_fence_from_fd_request_t
 * }
type
  Pxcb_dri3_fence_from_fd_request_t = ^Txcb_dri3_fence_from_fd_request_t;
  Txcb_dri3_fence_from_fd_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      fence : Tuint32_t;
      initially_triggered : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{*
 * @brief xcb_dri3_fd_from_fence_cookie_t
 * }

  Pxcb_dri3_fd_from_fence_cookie_t = ^Txcb_dri3_fd_from_fence_cookie_t;
  Txcb_dri3_fd_from_fence_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri3_fd_from_fence.  }

const
  XCB_DRI3_FD_FROM_FENCE = 5;  
{*
 * @brief xcb_dri3_fd_from_fence_request_t
 * }
type
  Pxcb_dri3_fd_from_fence_request_t = ^Txcb_dri3_fd_from_fence_request_t;
  Txcb_dri3_fd_from_fence_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      fence : Tuint32_t;
    end;
{*
 * @brief xcb_dri3_fd_from_fence_reply_t
 * }

  Pxcb_dri3_fd_from_fence_reply_t = ^Txcb_dri3_fd_from_fence_reply_t;
  Txcb_dri3_fd_from_fence_reply_t = record
      response_type : Tuint8_t;
      nfd : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad0 : array[0..23] of Tuint8_t;
    end;
{*
 * @brief xcb_dri3_get_supported_modifiers_cookie_t
 * }

  Pxcb_dri3_get_supported_modifiers_cookie_t = ^Txcb_dri3_get_supported_modifiers_cookie_t;
  Txcb_dri3_get_supported_modifiers_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri3_get_supported_modifiers.  }

const
  XCB_DRI3_GET_SUPPORTED_MODIFIERS = 6;  
{*
 * @brief xcb_dri3_get_supported_modifiers_request_t
 * }
type
  Pxcb_dri3_get_supported_modifiers_request_t = ^Txcb_dri3_get_supported_modifiers_request_t;
  Txcb_dri3_get_supported_modifiers_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Tuint32_t;
      depth : Tuint8_t;
      bpp : Tuint8_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_dri3_get_supported_modifiers_reply_t
 * }

  Pxcb_dri3_get_supported_modifiers_reply_t = ^Txcb_dri3_get_supported_modifiers_reply_t;
  Txcb_dri3_get_supported_modifiers_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_window_modifiers : Tuint32_t;
      num_screen_modifiers : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{* Opcode for xcb_dri3_pixmap_from_buffers.  }

const
  XCB_DRI3_PIXMAP_FROM_BUFFERS = 7;  
{*
 * @brief xcb_dri3_pixmap_from_buffers_request_t
 * }
type
  Pxcb_dri3_pixmap_from_buffers_request_t = ^Txcb_dri3_pixmap_from_buffers_request_t;
  Txcb_dri3_pixmap_from_buffers_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      pixmap : Txcb_pixmap_t;
      window : Txcb_window_t;
      num_buffers : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      width : Tuint16_t;
      height : Tuint16_t;
      stride0 : Tuint32_t;
      offset0 : Tuint32_t;
      stride1 : Tuint32_t;
      offset1 : Tuint32_t;
      stride2 : Tuint32_t;
      offset2 : Tuint32_t;
      stride3 : Tuint32_t;
      offset3 : Tuint32_t;
      depth : Tuint8_t;
      bpp : Tuint8_t;
      pad1 : array[0..1] of Tuint8_t;
      modifier : Tuint64_t;
    end;
{*
 * @brief xcb_dri3_buffers_from_pixmap_cookie_t
 * }

  Pxcb_dri3_buffers_from_pixmap_cookie_t = ^Txcb_dri3_buffers_from_pixmap_cookie_t;
  Txcb_dri3_buffers_from_pixmap_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri3_buffers_from_pixmap.  }

const
  XCB_DRI3_BUFFERS_FROM_PIXMAP = 8;  
{*
 * @brief xcb_dri3_buffers_from_pixmap_request_t
 * }
type
  Pxcb_dri3_buffers_from_pixmap_request_t = ^Txcb_dri3_buffers_from_pixmap_request_t;
  Txcb_dri3_buffers_from_pixmap_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      pixmap : Txcb_pixmap_t;
    end;
{*
 * @brief xcb_dri3_buffers_from_pixmap_reply_t
 * }

  Pxcb_dri3_buffers_from_pixmap_reply_t = ^Txcb_dri3_buffers_from_pixmap_reply_t;
  Txcb_dri3_buffers_from_pixmap_reply_t = record
      response_type : Tuint8_t;
      nfd : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      width : Tuint16_t;
      height : Tuint16_t;
      pad0 : array[0..3] of Tuint8_t;
      modifier : Tuint64_t;
      depth : Tuint8_t;
      bpp : Tuint8_t;
      pad1 : array[0..5] of Tuint8_t;
    end;
{* Opcode for xcb_dri3_set_drm_device_in_use.  }

const
  XCB_DRI3_SET_DRM_DEVICE_IN_USE = 9;  
{*
 * @brief xcb_dri3_set_drm_device_in_use_request_t
 * }
type
  Pxcb_dri3_set_drm_device_in_use_request_t = ^Txcb_dri3_set_drm_device_in_use_request_t;
  Txcb_dri3_set_drm_device_in_use_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      drmMajor : Tuint32_t;
      drmMinor : Tuint32_t;
    end;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }

function xcb_dri3_query_version(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t):Txcb_dri3_query_version_cookie_t;cdecl;external;
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
function xcb_dri3_query_version_unchecked(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t):Txcb_dri3_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri3_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_dri3_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri3_query_version_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri3_open(c:Pxcb_connection_t; drawable:Txcb_drawable_t; provider:Tuint32_t):Txcb_dri3_open_cookie_t;cdecl;external;
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
function xcb_dri3_open_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; provider:Tuint32_t):Txcb_dri3_open_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_open_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri3_open_reply(c:Pxcb_connection_t; cookie:Txcb_dri3_open_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri3_open_reply_t;cdecl;external;
{*
 * Return the reply fds
 * @param c      The connection
 * @param reply  The reply
 *
 * Returns a pointer to the array of reply fds of the reply.
 *
 * The returned value points into the reply and must not be free().
 * The fds are not managed by xcb. You must close() them before freeing the reply.
  }
{*<  }function xcb_dri3_open_reply_fds(c:Pxcb_connection_t; reply:Pxcb_dri3_open_reply_t):Plongint;cdecl;external;
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
function xcb_dri3_pixmap_from_buffer_checked(c:Pxcb_connection_t; pixmap:Txcb_pixmap_t; drawable:Txcb_drawable_t; size:Tuint32_t; width:Tuint16_t; 
           height:Tuint16_t; stride:Tuint16_t; depth:Tuint8_t; bpp:Tuint8_t; pixmap_fd:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri3_pixmap_from_buffer(c:Pxcb_connection_t; pixmap:Txcb_pixmap_t; drawable:Txcb_drawable_t; size:Tuint32_t; width:Tuint16_t; 
           height:Tuint16_t; stride:Tuint16_t; depth:Tuint8_t; bpp:Tuint8_t; pixmap_fd:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri3_buffer_from_pixmap(c:Pxcb_connection_t; pixmap:Txcb_pixmap_t):Txcb_dri3_buffer_from_pixmap_cookie_t;cdecl;external;
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
function xcb_dri3_buffer_from_pixmap_unchecked(c:Pxcb_connection_t; pixmap:Txcb_pixmap_t):Txcb_dri3_buffer_from_pixmap_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_buffer_from_pixmap_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri3_buffer_from_pixmap_reply(c:Pxcb_connection_t; cookie:Txcb_dri3_buffer_from_pixmap_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri3_buffer_from_pixmap_reply_t;cdecl;external;
{*
 * Return the reply fds
 * @param c      The connection
 * @param reply  The reply
 *
 * Returns a pointer to the array of reply fds of the reply.
 *
 * The returned value points into the reply and must not be free().
 * The fds are not managed by xcb. You must close() them before freeing the reply.
  }
{*<  }function xcb_dri3_buffer_from_pixmap_reply_fds(c:Pxcb_connection_t; reply:Pxcb_dri3_buffer_from_pixmap_reply_t):Plongint;cdecl;external;
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
function xcb_dri3_fence_from_fd_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; fence:Tuint32_t; initially_triggered:Tuint8_t; fence_fd:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri3_fence_from_fd(c:Pxcb_connection_t; drawable:Txcb_drawable_t; fence:Tuint32_t; initially_triggered:Tuint8_t; fence_fd:Tint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri3_fd_from_fence(c:Pxcb_connection_t; drawable:Txcb_drawable_t; fence:Tuint32_t):Txcb_dri3_fd_from_fence_cookie_t;cdecl;external;
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
function xcb_dri3_fd_from_fence_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; fence:Tuint32_t):Txcb_dri3_fd_from_fence_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_fd_from_fence_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri3_fd_from_fence_reply(c:Pxcb_connection_t; cookie:Txcb_dri3_fd_from_fence_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri3_fd_from_fence_reply_t;cdecl;external;
{*
 * Return the reply fds
 * @param c      The connection
 * @param reply  The reply
 *
 * Returns a pointer to the array of reply fds of the reply.
 *
 * The returned value points into the reply and must not be free().
 * The fds are not managed by xcb. You must close() them before freeing the reply.
  }
{*<  }function xcb_dri3_fd_from_fence_reply_fds(c:Pxcb_connection_t; reply:Pxcb_dri3_fd_from_fence_reply_t):Plongint;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_get_supported_modifiers_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri3_get_supported_modifiers(c:Pxcb_connection_t; window:Tuint32_t; depth:Tuint8_t; bpp:Tuint8_t):Txcb_dri3_get_supported_modifiers_cookie_t;cdecl;external;
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
function xcb_dri3_get_supported_modifiers_unchecked(c:Pxcb_connection_t; window:Tuint32_t; depth:Tuint8_t; bpp:Tuint8_t):Txcb_dri3_get_supported_modifiers_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_get_supported_modifiers_window_modifiers(R:Pxcb_dri3_get_supported_modifiers_reply_t):Puint64_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_get_supported_modifiers_window_modifiers_length(R:Pxcb_dri3_get_supported_modifiers_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_get_supported_modifiers_window_modifiers_end(R:Pxcb_dri3_get_supported_modifiers_reply_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_get_supported_modifiers_screen_modifiers(R:Pxcb_dri3_get_supported_modifiers_reply_t):Puint64_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_get_supported_modifiers_screen_modifiers_length(R:Pxcb_dri3_get_supported_modifiers_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_get_supported_modifiers_screen_modifiers_end(R:Pxcb_dri3_get_supported_modifiers_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_get_supported_modifiers_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri3_get_supported_modifiers_reply(c:Pxcb_connection_t; cookie:Txcb_dri3_get_supported_modifiers_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri3_get_supported_modifiers_reply_t;cdecl;external;
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
function xcb_dri3_pixmap_from_buffers_checked(c:Pxcb_connection_t; pixmap:Txcb_pixmap_t; window:Txcb_window_t; num_buffers:Tuint8_t; width:Tuint16_t; 
           height:Tuint16_t; stride0:Tuint32_t; offset0:Tuint32_t; stride1:Tuint32_t; offset1:Tuint32_t; 
           stride2:Tuint32_t; offset2:Tuint32_t; stride3:Tuint32_t; offset3:Tuint32_t; depth:Tuint8_t; 
           bpp:Tuint8_t; modifier:Tuint64_t; buffers:Pint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_dri3_pixmap_from_buffers(c:Pxcb_connection_t; pixmap:Txcb_pixmap_t; window:Txcb_window_t; num_buffers:Tuint8_t; width:Tuint16_t; 
           height:Tuint16_t; stride0:Tuint32_t; offset0:Tuint32_t; stride1:Tuint32_t; offset1:Tuint32_t; 
           stride2:Tuint32_t; offset2:Tuint32_t; stride3:Tuint32_t; offset3:Tuint32_t; depth:Tuint8_t; 
           bpp:Tuint8_t; modifier:Tuint64_t; buffers:Pint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_buffers_from_pixmap_sizeof(_buffer:pointer; buffers:Tint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri3_buffers_from_pixmap(c:Pxcb_connection_t; pixmap:Txcb_pixmap_t):Txcb_dri3_buffers_from_pixmap_cookie_t;cdecl;external;
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
function xcb_dri3_buffers_from_pixmap_unchecked(c:Pxcb_connection_t; pixmap:Txcb_pixmap_t):Txcb_dri3_buffers_from_pixmap_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_buffers_from_pixmap_strides(R:Pxcb_dri3_buffers_from_pixmap_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_buffers_from_pixmap_strides_length(R:Pxcb_dri3_buffers_from_pixmap_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_buffers_from_pixmap_strides_end(R:Pxcb_dri3_buffers_from_pixmap_reply_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_buffers_from_pixmap_offsets(R:Pxcb_dri3_buffers_from_pixmap_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_buffers_from_pixmap_offsets_length(R:Pxcb_dri3_buffers_from_pixmap_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_buffers_from_pixmap_offsets_end(R:Pxcb_dri3_buffers_from_pixmap_reply_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_buffers_from_pixmap_buffers(R:Pxcb_dri3_buffers_from_pixmap_reply_t):Pint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_buffers_from_pixmap_buffers_length(R:Pxcb_dri3_buffers_from_pixmap_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_dri3_buffers_from_pixmap_buffers_end(R:Pxcb_dri3_buffers_from_pixmap_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri3_buffers_from_pixmap_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri3_buffers_from_pixmap_reply(c:Pxcb_connection_t; cookie:Txcb_dri3_buffers_from_pixmap_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri3_buffers_from_pixmap_reply_t;cdecl;external;
{*
 * Return the reply fds
 * @param c      The connection
 * @param reply  The reply
 *
 * Returns a pointer to the array of reply fds of the reply.
 *
 * The returned value points into the reply and must not be free().
 * The fds are not managed by xcb. You must close() them before freeing the reply.
  }
{*<  }function xcb_dri3_buffers_from_pixmap_reply_fds(c:Pxcb_connection_t; reply:Pxcb_dri3_buffers_from_pixmap_reply_t):Plongint;cdecl;external;
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
function xcb_dri3_set_drm_device_in_use_checked(c:Pxcb_connection_t; window:Txcb_window_t; drmMajor:Tuint32_t; drmMinor:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri3_set_drm_device_in_use(c:Pxcb_connection_t; window:Txcb_window_t; drmMajor:Tuint32_t; drmMinor:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
