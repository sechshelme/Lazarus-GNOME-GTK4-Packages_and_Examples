
unit xf86dri;
interface

{
  Automatically converted by H2Pas 1.0.0 from xf86dri.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xf86dri.h
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
Puint32_t  = ^uint32_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_xf86dri_auth_connection_cookie_t  = ^xcb_xf86dri_auth_connection_cookie_t;
Pxcb_xf86dri_auth_connection_reply_t  = ^xcb_xf86dri_auth_connection_reply_t;
Pxcb_xf86dri_auth_connection_request_t  = ^xcb_xf86dri_auth_connection_request_t;
Pxcb_xf86dri_close_connection_request_t  = ^xcb_xf86dri_close_connection_request_t;
Pxcb_xf86dri_create_context_cookie_t  = ^xcb_xf86dri_create_context_cookie_t;
Pxcb_xf86dri_create_context_reply_t  = ^xcb_xf86dri_create_context_reply_t;
Pxcb_xf86dri_create_context_request_t  = ^xcb_xf86dri_create_context_request_t;
Pxcb_xf86dri_create_drawable_cookie_t  = ^xcb_xf86dri_create_drawable_cookie_t;
Pxcb_xf86dri_create_drawable_reply_t  = ^xcb_xf86dri_create_drawable_reply_t;
Pxcb_xf86dri_create_drawable_request_t  = ^xcb_xf86dri_create_drawable_request_t;
Pxcb_xf86dri_destroy_context_request_t  = ^xcb_xf86dri_destroy_context_request_t;
Pxcb_xf86dri_destroy_drawable_request_t  = ^xcb_xf86dri_destroy_drawable_request_t;
Pxcb_xf86dri_drm_clip_rect_iterator_t  = ^xcb_xf86dri_drm_clip_rect_iterator_t;
Pxcb_xf86dri_drm_clip_rect_t  = ^xcb_xf86dri_drm_clip_rect_t;
Pxcb_xf86dri_get_client_driver_name_cookie_t  = ^xcb_xf86dri_get_client_driver_name_cookie_t;
Pxcb_xf86dri_get_client_driver_name_reply_t  = ^xcb_xf86dri_get_client_driver_name_reply_t;
Pxcb_xf86dri_get_client_driver_name_request_t  = ^xcb_xf86dri_get_client_driver_name_request_t;
Pxcb_xf86dri_get_device_info_cookie_t  = ^xcb_xf86dri_get_device_info_cookie_t;
Pxcb_xf86dri_get_device_info_reply_t  = ^xcb_xf86dri_get_device_info_reply_t;
Pxcb_xf86dri_get_device_info_request_t  = ^xcb_xf86dri_get_device_info_request_t;
Pxcb_xf86dri_get_drawable_info_cookie_t  = ^xcb_xf86dri_get_drawable_info_cookie_t;
Pxcb_xf86dri_get_drawable_info_reply_t  = ^xcb_xf86dri_get_drawable_info_reply_t;
Pxcb_xf86dri_get_drawable_info_request_t  = ^xcb_xf86dri_get_drawable_info_request_t;
Pxcb_xf86dri_open_connection_cookie_t  = ^xcb_xf86dri_open_connection_cookie_t;
Pxcb_xf86dri_open_connection_reply_t  = ^xcb_xf86dri_open_connection_reply_t;
Pxcb_xf86dri_open_connection_request_t  = ^xcb_xf86dri_open_connection_request_t;
Pxcb_xf86dri_query_direct_rendering_capable_cookie_t  = ^xcb_xf86dri_query_direct_rendering_capable_cookie_t;
Pxcb_xf86dri_query_direct_rendering_capable_reply_t  = ^xcb_xf86dri_query_direct_rendering_capable_reply_t;
Pxcb_xf86dri_query_direct_rendering_capable_request_t  = ^xcb_xf86dri_query_direct_rendering_capable_request_t;
Pxcb_xf86dri_query_version_cookie_t  = ^xcb_xf86dri_query_version_cookie_t;
Pxcb_xf86dri_query_version_reply_t  = ^xcb_xf86dri_query_version_reply_t;
Pxcb_xf86dri_query_version_request_t  = ^xcb_xf86dri_query_version_request_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from xf86dri.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_XF86Dri_API XCB XF86Dri API
 * @brief XF86Dri XCB Protocol Implementation.
 * @
 * }
{$ifndef __XF86DRI_H}
{$define __XF86DRI_H}
{$include "xcb.h"}
{ C++ extern C conditionnal removed }

const
  XCB_XF86DRI_MAJOR_VERSION = 4;  
  XCB_XF86DRI_MINOR_VERSION = 1;  
  var
    xcb_xf86dri_id : Txcb_extension_t;cvar;external;
{*
 * @brief xcb_xf86dri_drm_clip_rect_t
 * }
type
  Pxcb_xf86dri_drm_clip_rect_t = ^Txcb_xf86dri_drm_clip_rect_t;
  Txcb_xf86dri_drm_clip_rect_t = record
      x1 : Tint16_t;
      y1 : Tint16_t;
      x2 : Tint16_t;
      x3 : Tint16_t;
    end;
{*
 * @brief xcb_xf86dri_drm_clip_rect_iterator_t
 * }

  Pxcb_xf86dri_drm_clip_rect_iterator_t = ^Txcb_xf86dri_drm_clip_rect_iterator_t;
  Txcb_xf86dri_drm_clip_rect_iterator_t = record
      data : Pxcb_xf86dri_drm_clip_rect_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_xf86dri_query_version_cookie_t
 * }

  Pxcb_xf86dri_query_version_cookie_t = ^Txcb_xf86dri_query_version_cookie_t;
  Txcb_xf86dri_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xf86dri_query_version.  }

const
  XCB_XF86DRI_QUERY_VERSION = 0;  
{*
 * @brief xcb_xf86dri_query_version_request_t
 * }
type
  Pxcb_xf86dri_query_version_request_t = ^Txcb_xf86dri_query_version_request_t;
  Txcb_xf86dri_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_xf86dri_query_version_reply_t
 * }

  Pxcb_xf86dri_query_version_reply_t = ^Txcb_xf86dri_query_version_reply_t;
  Txcb_xf86dri_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      dri_major_version : Tuint16_t;
      dri_minor_version : Tuint16_t;
      dri_minor_patch : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_query_direct_rendering_capable_cookie_t
 * }

  Pxcb_xf86dri_query_direct_rendering_capable_cookie_t = ^Txcb_xf86dri_query_direct_rendering_capable_cookie_t;
  Txcb_xf86dri_query_direct_rendering_capable_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xf86dri_query_direct_rendering_capable.  }

const
  XCB_XF86DRI_QUERY_DIRECT_RENDERING_CAPABLE = 1;  
{*
 * @brief xcb_xf86dri_query_direct_rendering_capable_request_t
 * }
type
  Pxcb_xf86dri_query_direct_rendering_capable_request_t = ^Txcb_xf86dri_query_direct_rendering_capable_request_t;
  Txcb_xf86dri_query_direct_rendering_capable_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_query_direct_rendering_capable_reply_t
 * }

  Pxcb_xf86dri_query_direct_rendering_capable_reply_t = ^Txcb_xf86dri_query_direct_rendering_capable_reply_t;
  Txcb_xf86dri_query_direct_rendering_capable_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      is_capable : Tuint8_t;
    end;
{*
 * @brief xcb_xf86dri_open_connection_cookie_t
 * }

  Pxcb_xf86dri_open_connection_cookie_t = ^Txcb_xf86dri_open_connection_cookie_t;
  Txcb_xf86dri_open_connection_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xf86dri_open_connection.  }

const
  XCB_XF86DRI_OPEN_CONNECTION = 2;  
{*
 * @brief xcb_xf86dri_open_connection_request_t
 * }
type
  Pxcb_xf86dri_open_connection_request_t = ^Txcb_xf86dri_open_connection_request_t;
  Txcb_xf86dri_open_connection_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_open_connection_reply_t
 * }

  Pxcb_xf86dri_open_connection_reply_t = ^Txcb_xf86dri_open_connection_reply_t;
  Txcb_xf86dri_open_connection_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      sarea_handle_low : Tuint32_t;
      sarea_handle_high : Tuint32_t;
      bus_id_len : Tuint32_t;
      pad1 : array[0..11] of Tuint8_t;
    end;
{* Opcode for xcb_xf86dri_close_connection.  }

const
  XCB_XF86DRI_CLOSE_CONNECTION = 3;  
{*
 * @brief xcb_xf86dri_close_connection_request_t
 * }
type
  Pxcb_xf86dri_close_connection_request_t = ^Txcb_xf86dri_close_connection_request_t;
  Txcb_xf86dri_close_connection_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_get_client_driver_name_cookie_t
 * }

  Pxcb_xf86dri_get_client_driver_name_cookie_t = ^Txcb_xf86dri_get_client_driver_name_cookie_t;
  Txcb_xf86dri_get_client_driver_name_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xf86dri_get_client_driver_name.  }

const
  XCB_XF86DRI_GET_CLIENT_DRIVER_NAME = 4;  
{*
 * @brief xcb_xf86dri_get_client_driver_name_request_t
 * }
type
  Pxcb_xf86dri_get_client_driver_name_request_t = ^Txcb_xf86dri_get_client_driver_name_request_t;
  Txcb_xf86dri_get_client_driver_name_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_get_client_driver_name_reply_t
 * }

  Pxcb_xf86dri_get_client_driver_name_reply_t = ^Txcb_xf86dri_get_client_driver_name_reply_t;
  Txcb_xf86dri_get_client_driver_name_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      client_driver_major_version : Tuint32_t;
      client_driver_minor_version : Tuint32_t;
      client_driver_patch_version : Tuint32_t;
      client_driver_name_len : Tuint32_t;
      pad1 : array[0..7] of Tuint8_t;
    end;
{*
 * @brief xcb_xf86dri_create_context_cookie_t
 * }

  Pxcb_xf86dri_create_context_cookie_t = ^Txcb_xf86dri_create_context_cookie_t;
  Txcb_xf86dri_create_context_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xf86dri_create_context.  }

const
  XCB_XF86DRI_CREATE_CONTEXT = 5;  
{*
 * @brief xcb_xf86dri_create_context_request_t
 * }
type
  Pxcb_xf86dri_create_context_request_t = ^Txcb_xf86dri_create_context_request_t;
  Txcb_xf86dri_create_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      visual : Tuint32_t;
      context : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_create_context_reply_t
 * }

  Pxcb_xf86dri_create_context_reply_t = ^Txcb_xf86dri_create_context_reply_t;
  Txcb_xf86dri_create_context_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      hw_context : Tuint32_t;
    end;
{* Opcode for xcb_xf86dri_destroy_context.  }

const
  XCB_XF86DRI_DESTROY_CONTEXT = 6;  
{*
 * @brief xcb_xf86dri_destroy_context_request_t
 * }
type
  Pxcb_xf86dri_destroy_context_request_t = ^Txcb_xf86dri_destroy_context_request_t;
  Txcb_xf86dri_destroy_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      context : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_create_drawable_cookie_t
 * }

  Pxcb_xf86dri_create_drawable_cookie_t = ^Txcb_xf86dri_create_drawable_cookie_t;
  Txcb_xf86dri_create_drawable_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xf86dri_create_drawable.  }

const
  XCB_XF86DRI_CREATE_DRAWABLE = 7;  
{*
 * @brief xcb_xf86dri_create_drawable_request_t
 * }
type
  Pxcb_xf86dri_create_drawable_request_t = ^Txcb_xf86dri_create_drawable_request_t;
  Txcb_xf86dri_create_drawable_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      drawable : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_create_drawable_reply_t
 * }

  Pxcb_xf86dri_create_drawable_reply_t = ^Txcb_xf86dri_create_drawable_reply_t;
  Txcb_xf86dri_create_drawable_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      hw_drawable_handle : Tuint32_t;
    end;
{* Opcode for xcb_xf86dri_destroy_drawable.  }

const
  XCB_XF86DRI_DESTROY_DRAWABLE = 8;  
{*
 * @brief xcb_xf86dri_destroy_drawable_request_t
 * }
type
  Pxcb_xf86dri_destroy_drawable_request_t = ^Txcb_xf86dri_destroy_drawable_request_t;
  Txcb_xf86dri_destroy_drawable_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      drawable : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_get_drawable_info_cookie_t
 * }

  Pxcb_xf86dri_get_drawable_info_cookie_t = ^Txcb_xf86dri_get_drawable_info_cookie_t;
  Txcb_xf86dri_get_drawable_info_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xf86dri_get_drawable_info.  }

const
  XCB_XF86DRI_GET_DRAWABLE_INFO = 9;  
{*
 * @brief xcb_xf86dri_get_drawable_info_request_t
 * }
type
  Pxcb_xf86dri_get_drawable_info_request_t = ^Txcb_xf86dri_get_drawable_info_request_t;
  Txcb_xf86dri_get_drawable_info_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      drawable : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_get_drawable_info_reply_t
 * }

  Pxcb_xf86dri_get_drawable_info_reply_t = ^Txcb_xf86dri_get_drawable_info_reply_t;
  Txcb_xf86dri_get_drawable_info_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      drawable_table_index : Tuint32_t;
      drawable_table_stamp : Tuint32_t;
      drawable_origin_X : Tint16_t;
      drawable_origin_Y : Tint16_t;
      drawable_size_W : Tint16_t;
      drawable_size_H : Tint16_t;
      num_clip_rects : Tuint32_t;
      back_x : Tint16_t;
      back_y : Tint16_t;
      num_back_clip_rects : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_get_device_info_cookie_t
 * }

  Pxcb_xf86dri_get_device_info_cookie_t = ^Txcb_xf86dri_get_device_info_cookie_t;
  Txcb_xf86dri_get_device_info_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xf86dri_get_device_info.  }

const
  XCB_XF86DRI_GET_DEVICE_INFO = 10;  
{*
 * @brief xcb_xf86dri_get_device_info_request_t
 * }
type
  Pxcb_xf86dri_get_device_info_request_t = ^Txcb_xf86dri_get_device_info_request_t;
  Txcb_xf86dri_get_device_info_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_get_device_info_reply_t
 * }

  Pxcb_xf86dri_get_device_info_reply_t = ^Txcb_xf86dri_get_device_info_reply_t;
  Txcb_xf86dri_get_device_info_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      framebuffer_handle_low : Tuint32_t;
      framebuffer_handle_high : Tuint32_t;
      framebuffer_origin_offset : Tuint32_t;
      framebuffer_size : Tuint32_t;
      framebuffer_stride : Tuint32_t;
      device_private_size : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_auth_connection_cookie_t
 * }

  Pxcb_xf86dri_auth_connection_cookie_t = ^Txcb_xf86dri_auth_connection_cookie_t;
  Txcb_xf86dri_auth_connection_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xf86dri_auth_connection.  }

const
  XCB_XF86DRI_AUTH_CONNECTION = 11;  
{*
 * @brief xcb_xf86dri_auth_connection_request_t
 * }
type
  Pxcb_xf86dri_auth_connection_request_t = ^Txcb_xf86dri_auth_connection_request_t;
  Txcb_xf86dri_auth_connection_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      screen : Tuint32_t;
      magic : Tuint32_t;
    end;
{*
 * @brief xcb_xf86dri_auth_connection_reply_t
 * }

  Pxcb_xf86dri_auth_connection_reply_t = ^Txcb_xf86dri_auth_connection_reply_t;
  Txcb_xf86dri_auth_connection_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      authenticated : Tuint32_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_xf86dri_drm_clip_rect_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_xf86dri_drm_clip_rect_t)
  }

procedure xcb_xf86dri_drm_clip_rect_next(i:Pxcb_xf86dri_drm_clip_rect_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_xf86dri_drm_clip_rect_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_xf86dri_drm_clip_rect_end(i:Txcb_xf86dri_drm_clip_rect_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_query_version(c:Pxcb_connection_t):Txcb_xf86dri_query_version_cookie_t;cdecl;external;
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
function xcb_xf86dri_query_version_unchecked(c:Pxcb_connection_t):Txcb_xf86dri_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xf86dri_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xf86dri_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_xf86dri_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_xf86dri_query_version_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_query_direct_rendering_capable(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_xf86dri_query_direct_rendering_capable_cookie_t;cdecl;external;
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
function xcb_xf86dri_query_direct_rendering_capable_unchecked(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_xf86dri_query_direct_rendering_capable_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xf86dri_query_direct_rendering_capable_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xf86dri_query_direct_rendering_capable_reply(c:Pxcb_connection_t; cookie:Txcb_xf86dri_query_direct_rendering_capable_cookie_t; e:PPxcb_generic_error_t):Pxcb_xf86dri_query_direct_rendering_capable_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_open_connection_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_open_connection(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_xf86dri_open_connection_cookie_t;cdecl;external;
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
function xcb_xf86dri_open_connection_unchecked(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_xf86dri_open_connection_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_open_connection_bus_id(R:Pxcb_xf86dri_open_connection_reply_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_open_connection_bus_id_length(R:Pxcb_xf86dri_open_connection_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_open_connection_bus_id_end(R:Pxcb_xf86dri_open_connection_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xf86dri_open_connection_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xf86dri_open_connection_reply(c:Pxcb_connection_t; cookie:Txcb_xf86dri_open_connection_cookie_t; e:PPxcb_generic_error_t):Pxcb_xf86dri_open_connection_reply_t;cdecl;external;
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
function xcb_xf86dri_close_connection_checked(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_close_connection(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_client_driver_name_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_get_client_driver_name(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_xf86dri_get_client_driver_name_cookie_t;cdecl;external;
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
function xcb_xf86dri_get_client_driver_name_unchecked(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_xf86dri_get_client_driver_name_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_client_driver_name_client_driver_name(R:Pxcb_xf86dri_get_client_driver_name_reply_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_client_driver_name_client_driver_name_length(R:Pxcb_xf86dri_get_client_driver_name_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_client_driver_name_client_driver_name_end(R:Pxcb_xf86dri_get_client_driver_name_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xf86dri_get_client_driver_name_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xf86dri_get_client_driver_name_reply(c:Pxcb_connection_t; cookie:Txcb_xf86dri_get_client_driver_name_cookie_t; e:PPxcb_generic_error_t):Pxcb_xf86dri_get_client_driver_name_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_create_context(c:Pxcb_connection_t; screen:Tuint32_t; visual:Tuint32_t; context:Tuint32_t):Txcb_xf86dri_create_context_cookie_t;cdecl;external;
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
function xcb_xf86dri_create_context_unchecked(c:Pxcb_connection_t; screen:Tuint32_t; visual:Tuint32_t; context:Tuint32_t):Txcb_xf86dri_create_context_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xf86dri_create_context_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xf86dri_create_context_reply(c:Pxcb_connection_t; cookie:Txcb_xf86dri_create_context_cookie_t; e:PPxcb_generic_error_t):Pxcb_xf86dri_create_context_reply_t;cdecl;external;
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
function xcb_xf86dri_destroy_context_checked(c:Pxcb_connection_t; screen:Tuint32_t; context:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_destroy_context(c:Pxcb_connection_t; screen:Tuint32_t; context:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_create_drawable(c:Pxcb_connection_t; screen:Tuint32_t; drawable:Tuint32_t):Txcb_xf86dri_create_drawable_cookie_t;cdecl;external;
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
function xcb_xf86dri_create_drawable_unchecked(c:Pxcb_connection_t; screen:Tuint32_t; drawable:Tuint32_t):Txcb_xf86dri_create_drawable_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xf86dri_create_drawable_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xf86dri_create_drawable_reply(c:Pxcb_connection_t; cookie:Txcb_xf86dri_create_drawable_cookie_t; e:PPxcb_generic_error_t):Pxcb_xf86dri_create_drawable_reply_t;cdecl;external;
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
function xcb_xf86dri_destroy_drawable_checked(c:Pxcb_connection_t; screen:Tuint32_t; drawable:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_destroy_drawable(c:Pxcb_connection_t; screen:Tuint32_t; drawable:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_drawable_info_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_get_drawable_info(c:Pxcb_connection_t; screen:Tuint32_t; drawable:Tuint32_t):Txcb_xf86dri_get_drawable_info_cookie_t;cdecl;external;
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
function xcb_xf86dri_get_drawable_info_unchecked(c:Pxcb_connection_t; screen:Tuint32_t; drawable:Tuint32_t):Txcb_xf86dri_get_drawable_info_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_drawable_info_clip_rects(R:Pxcb_xf86dri_get_drawable_info_reply_t):Pxcb_xf86dri_drm_clip_rect_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_drawable_info_clip_rects_length(R:Pxcb_xf86dri_get_drawable_info_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_drawable_info_clip_rects_iterator(R:Pxcb_xf86dri_get_drawable_info_reply_t):Txcb_xf86dri_drm_clip_rect_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_drawable_info_back_clip_rects(R:Pxcb_xf86dri_get_drawable_info_reply_t):Pxcb_xf86dri_drm_clip_rect_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_drawable_info_back_clip_rects_length(R:Pxcb_xf86dri_get_drawable_info_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_drawable_info_back_clip_rects_iterator(R:Pxcb_xf86dri_get_drawable_info_reply_t):Txcb_xf86dri_drm_clip_rect_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xf86dri_get_drawable_info_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xf86dri_get_drawable_info_reply(c:Pxcb_connection_t; cookie:Txcb_xf86dri_get_drawable_info_cookie_t; e:PPxcb_generic_error_t):Pxcb_xf86dri_get_drawable_info_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_device_info_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_get_device_info(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_xf86dri_get_device_info_cookie_t;cdecl;external;
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
function xcb_xf86dri_get_device_info_unchecked(c:Pxcb_connection_t; screen:Tuint32_t):Txcb_xf86dri_get_device_info_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_device_info_device_private(R:Pxcb_xf86dri_get_device_info_reply_t):Puint32_t;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_device_info_device_private_length(R:Pxcb_xf86dri_get_device_info_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_xf86dri_get_device_info_device_private_end(R:Pxcb_xf86dri_get_device_info_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xf86dri_get_device_info_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xf86dri_get_device_info_reply(c:Pxcb_connection_t; cookie:Txcb_xf86dri_get_device_info_cookie_t; e:PPxcb_generic_error_t):Pxcb_xf86dri_get_device_info_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xf86dri_auth_connection(c:Pxcb_connection_t; screen:Tuint32_t; magic:Tuint32_t):Txcb_xf86dri_auth_connection_cookie_t;cdecl;external;
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
function xcb_xf86dri_auth_connection_unchecked(c:Pxcb_connection_t; screen:Tuint32_t; magic:Tuint32_t):Txcb_xf86dri_auth_connection_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xf86dri_auth_connection_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xf86dri_auth_connection_reply(c:Pxcb_connection_t; cookie:Txcb_xf86dri_auth_connection_cookie_t; e:PPxcb_generic_error_t):Pxcb_xf86dri_auth_connection_reply_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
