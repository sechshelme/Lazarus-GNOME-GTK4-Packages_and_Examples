
unit dri2;
interface

{
  Automatically converted by H2Pas 1.0.0 from dri2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dri2.h
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
Pxcb_dri2_attach_format_iterator_t  = ^xcb_dri2_attach_format_iterator_t;
Pxcb_dri2_attach_format_t  = ^xcb_dri2_attach_format_t;
Pxcb_dri2_attachment_t  = ^xcb_dri2_attachment_t;
Pxcb_dri2_authenticate_cookie_t  = ^xcb_dri2_authenticate_cookie_t;
Pxcb_dri2_authenticate_reply_t  = ^xcb_dri2_authenticate_reply_t;
Pxcb_dri2_authenticate_request_t  = ^xcb_dri2_authenticate_request_t;
Pxcb_dri2_buffer_swap_complete_event_t  = ^xcb_dri2_buffer_swap_complete_event_t;
Pxcb_dri2_connect_cookie_t  = ^xcb_dri2_connect_cookie_t;
Pxcb_dri2_connect_reply_t  = ^xcb_dri2_connect_reply_t;
Pxcb_dri2_connect_request_t  = ^xcb_dri2_connect_request_t;
Pxcb_dri2_copy_region_cookie_t  = ^xcb_dri2_copy_region_cookie_t;
Pxcb_dri2_copy_region_reply_t  = ^xcb_dri2_copy_region_reply_t;
Pxcb_dri2_copy_region_request_t  = ^xcb_dri2_copy_region_request_t;
Pxcb_dri2_create_drawable_request_t  = ^xcb_dri2_create_drawable_request_t;
Pxcb_dri2_destroy_drawable_request_t  = ^xcb_dri2_destroy_drawable_request_t;
Pxcb_dri2_dri2_buffer_iterator_t  = ^xcb_dri2_dri2_buffer_iterator_t;
Pxcb_dri2_dri2_buffer_t  = ^xcb_dri2_dri2_buffer_t;
Pxcb_dri2_driver_type_t  = ^xcb_dri2_driver_type_t;
Pxcb_dri2_event_type_t  = ^xcb_dri2_event_type_t;
Pxcb_dri2_get_buffers_cookie_t  = ^xcb_dri2_get_buffers_cookie_t;
Pxcb_dri2_get_buffers_reply_t  = ^xcb_dri2_get_buffers_reply_t;
Pxcb_dri2_get_buffers_request_t  = ^xcb_dri2_get_buffers_request_t;
Pxcb_dri2_get_buffers_with_format_cookie_t  = ^xcb_dri2_get_buffers_with_format_cookie_t;
Pxcb_dri2_get_buffers_with_format_reply_t  = ^xcb_dri2_get_buffers_with_format_reply_t;
Pxcb_dri2_get_buffers_with_format_request_t  = ^xcb_dri2_get_buffers_with_format_request_t;
Pxcb_dri2_get_msc_cookie_t  = ^xcb_dri2_get_msc_cookie_t;
Pxcb_dri2_get_msc_reply_t  = ^xcb_dri2_get_msc_reply_t;
Pxcb_dri2_get_msc_request_t  = ^xcb_dri2_get_msc_request_t;
Pxcb_dri2_get_param_cookie_t  = ^xcb_dri2_get_param_cookie_t;
Pxcb_dri2_get_param_reply_t  = ^xcb_dri2_get_param_reply_t;
Pxcb_dri2_get_param_request_t  = ^xcb_dri2_get_param_request_t;
Pxcb_dri2_invalidate_buffers_event_t  = ^xcb_dri2_invalidate_buffers_event_t;
Pxcb_dri2_query_version_cookie_t  = ^xcb_dri2_query_version_cookie_t;
Pxcb_dri2_query_version_reply_t  = ^xcb_dri2_query_version_reply_t;
Pxcb_dri2_query_version_request_t  = ^xcb_dri2_query_version_request_t;
Pxcb_dri2_swap_buffers_cookie_t  = ^xcb_dri2_swap_buffers_cookie_t;
Pxcb_dri2_swap_buffers_reply_t  = ^xcb_dri2_swap_buffers_reply_t;
Pxcb_dri2_swap_buffers_request_t  = ^xcb_dri2_swap_buffers_request_t;
Pxcb_dri2_swap_interval_request_t  = ^xcb_dri2_swap_interval_request_t;
Pxcb_dri2_wait_msc_cookie_t  = ^xcb_dri2_wait_msc_cookie_t;
Pxcb_dri2_wait_msc_reply_t  = ^xcb_dri2_wait_msc_reply_t;
Pxcb_dri2_wait_msc_request_t  = ^xcb_dri2_wait_msc_request_t;
Pxcb_dri2_wait_sbc_cookie_t  = ^xcb_dri2_wait_sbc_cookie_t;
Pxcb_dri2_wait_sbc_reply_t  = ^xcb_dri2_wait_sbc_reply_t;
Pxcb_dri2_wait_sbc_request_t  = ^xcb_dri2_wait_sbc_request_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from dri2.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_DRI2_API XCB DRI2 API
 * @brief DRI2 XCB Protocol Implementation.
 * @
 * }
{$ifndef __DRI2_H}
{$define __DRI2_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_DRI2_MAJOR_VERSION = 1;  
  XCB_DRI2_MINOR_VERSION = 4;  
  var
    xcb_dri2_id : Txcb_extension_t;cvar;external;
type
  Pxcb_dri2_attachment_t = ^Txcb_dri2_attachment_t;
  Txcb_dri2_attachment_t =  Longint;
  Const
    XCB_DRI2_ATTACHMENT_BUFFER_FRONT_LEFT = 0;
    XCB_DRI2_ATTACHMENT_BUFFER_BACK_LEFT = 1;
    XCB_DRI2_ATTACHMENT_BUFFER_FRONT_RIGHT = 2;
    XCB_DRI2_ATTACHMENT_BUFFER_BACK_RIGHT = 3;
    XCB_DRI2_ATTACHMENT_BUFFER_DEPTH = 4;
    XCB_DRI2_ATTACHMENT_BUFFER_STENCIL = 5;
    XCB_DRI2_ATTACHMENT_BUFFER_ACCUM = 6;
    XCB_DRI2_ATTACHMENT_BUFFER_FAKE_FRONT_LEFT = 7;
    XCB_DRI2_ATTACHMENT_BUFFER_FAKE_FRONT_RIGHT = 8;
    XCB_DRI2_ATTACHMENT_BUFFER_DEPTH_STENCIL = 9;
    XCB_DRI2_ATTACHMENT_BUFFER_HIZ = 10;
;
type
  Pxcb_dri2_driver_type_t = ^Txcb_dri2_driver_type_t;
  Txcb_dri2_driver_type_t =  Longint;
  Const
    XCB_DRI2_DRIVER_TYPE_DRI = 0;
    XCB_DRI2_DRIVER_TYPE_VDPAU = 1;
;
type
  Pxcb_dri2_event_type_t = ^Txcb_dri2_event_type_t;
  Txcb_dri2_event_type_t =  Longint;
  Const
    XCB_DRI2_EVENT_TYPE_EXCHANGE_COMPLETE = 1;
    XCB_DRI2_EVENT_TYPE_BLIT_COMPLETE = 2;
    XCB_DRI2_EVENT_TYPE_FLIP_COMPLETE = 3;
;
{*
 * @brief xcb_dri2_dri2_buffer_t
 * }
type
  Pxcb_dri2_dri2_buffer_t = ^Txcb_dri2_dri2_buffer_t;
  Txcb_dri2_dri2_buffer_t = record
      attachment : Tuint32_t;
      name : Tuint32_t;
      pitch : Tuint32_t;
      cpp : Tuint32_t;
      flags : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_dri2_buffer_iterator_t
 * }

  Pxcb_dri2_dri2_buffer_iterator_t = ^Txcb_dri2_dri2_buffer_iterator_t;
  Txcb_dri2_dri2_buffer_iterator_t = record
      data : Pxcb_dri2_dri2_buffer_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_dri2_attach_format_t
 * }

  Pxcb_dri2_attach_format_t = ^Txcb_dri2_attach_format_t;
  Txcb_dri2_attach_format_t = record
      attachment : Tuint32_t;
      format : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_attach_format_iterator_t
 * }

  Pxcb_dri2_attach_format_iterator_t = ^Txcb_dri2_attach_format_iterator_t;
  Txcb_dri2_attach_format_iterator_t = record
      data : Pxcb_dri2_attach_format_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_dri2_query_version_cookie_t
 * }

  Pxcb_dri2_query_version_cookie_t = ^Txcb_dri2_query_version_cookie_t;
  Txcb_dri2_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_query_version.  }

const
  XCB_DRI2_QUERY_VERSION = 0;  
{*
 * @brief xcb_dri2_query_version_request_t
 * }
type
  Pxcb_dri2_query_version_request_t = ^Txcb_dri2_query_version_request_t;
  Txcb_dri2_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_query_version_reply_t
 * }

  Pxcb_dri2_query_version_reply_t = ^Txcb_dri2_query_version_reply_t;
  Txcb_dri2_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_connect_cookie_t
 * }

  Pxcb_dri2_connect_cookie_t = ^Txcb_dri2_connect_cookie_t;
  Txcb_dri2_connect_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_connect.  }

const
  XCB_DRI2_CONNECT = 1;  
{*
 * @brief xcb_dri2_connect_request_t
 * }
type
  Pxcb_dri2_connect_request_t = ^Txcb_dri2_connect_request_t;
  Txcb_dri2_connect_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      driver_type : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_connect_reply_t
 * }

  Pxcb_dri2_connect_reply_t = ^Txcb_dri2_connect_reply_t;
  Txcb_dri2_connect_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      driver_name_length : Tuint32_t;
      device_name_length : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{*
 * @brief xcb_dri2_authenticate_cookie_t
 * }

  Pxcb_dri2_authenticate_cookie_t = ^Txcb_dri2_authenticate_cookie_t;
  Txcb_dri2_authenticate_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_authenticate.  }

const
  XCB_DRI2_AUTHENTICATE = 2;  
{*
 * @brief xcb_dri2_authenticate_request_t
 * }
type
  Pxcb_dri2_authenticate_request_t = ^Txcb_dri2_authenticate_request_t;
  Txcb_dri2_authenticate_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      magic : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_authenticate_reply_t
 * }

  Pxcb_dri2_authenticate_reply_t = ^Txcb_dri2_authenticate_reply_t;
  Txcb_dri2_authenticate_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      authenticated : Tuint32_t;
    end;
{* Opcode for xcb_dri2_create_drawable.  }

const
  XCB_DRI2_CREATE_DRAWABLE = 3;  
{*
 * @brief xcb_dri2_create_drawable_request_t
 * }
type
  Pxcb_dri2_create_drawable_request_t = ^Txcb_dri2_create_drawable_request_t;
  Txcb_dri2_create_drawable_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
    end;
{* Opcode for xcb_dri2_destroy_drawable.  }

const
  XCB_DRI2_DESTROY_DRAWABLE = 4;  
{*
 * @brief xcb_dri2_destroy_drawable_request_t
 * }
type
  Pxcb_dri2_destroy_drawable_request_t = ^Txcb_dri2_destroy_drawable_request_t;
  Txcb_dri2_destroy_drawable_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
    end;
{*
 * @brief xcb_dri2_get_buffers_cookie_t
 * }

  Pxcb_dri2_get_buffers_cookie_t = ^Txcb_dri2_get_buffers_cookie_t;
  Txcb_dri2_get_buffers_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_get_buffers.  }

const
  XCB_DRI2_GET_BUFFERS = 5;  
{*
 * @brief xcb_dri2_get_buffers_request_t
 * }
type
  Pxcb_dri2_get_buffers_request_t = ^Txcb_dri2_get_buffers_request_t;
  Txcb_dri2_get_buffers_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      count : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_get_buffers_reply_t
 * }

  Pxcb_dri2_get_buffers_reply_t = ^Txcb_dri2_get_buffers_reply_t;
  Txcb_dri2_get_buffers_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      width : Tuint32_t;
      height : Tuint32_t;
      count : Tuint32_t;
      pad1 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_dri2_copy_region_cookie_t
 * }

  Pxcb_dri2_copy_region_cookie_t = ^Txcb_dri2_copy_region_cookie_t;
  Txcb_dri2_copy_region_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_copy_region.  }

const
  XCB_DRI2_COPY_REGION = 6;  
{*
 * @brief xcb_dri2_copy_region_request_t
 * }
type
  Pxcb_dri2_copy_region_request_t = ^Txcb_dri2_copy_region_request_t;
  Txcb_dri2_copy_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      region : Tuint32_t;
      dest : Tuint32_t;
      src : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_copy_region_reply_t
 * }

  Pxcb_dri2_copy_region_reply_t = ^Txcb_dri2_copy_region_reply_t;
  Txcb_dri2_copy_region_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_get_buffers_with_format_cookie_t
 * }

  Pxcb_dri2_get_buffers_with_format_cookie_t = ^Txcb_dri2_get_buffers_with_format_cookie_t;
  Txcb_dri2_get_buffers_with_format_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_get_buffers_with_format.  }

const
  XCB_DRI2_GET_BUFFERS_WITH_FORMAT = 7;  
{*
 * @brief xcb_dri2_get_buffers_with_format_request_t
 * }
type
  Pxcb_dri2_get_buffers_with_format_request_t = ^Txcb_dri2_get_buffers_with_format_request_t;
  Txcb_dri2_get_buffers_with_format_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      count : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_get_buffers_with_format_reply_t
 * }

  Pxcb_dri2_get_buffers_with_format_reply_t = ^Txcb_dri2_get_buffers_with_format_reply_t;
  Txcb_dri2_get_buffers_with_format_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      width : Tuint32_t;
      height : Tuint32_t;
      count : Tuint32_t;
      pad1 : array[0..11] of Tuint8_t;
    end;
{*
 * @brief xcb_dri2_swap_buffers_cookie_t
 * }

  Pxcb_dri2_swap_buffers_cookie_t = ^Txcb_dri2_swap_buffers_cookie_t;
  Txcb_dri2_swap_buffers_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_swap_buffers.  }

const
  XCB_DRI2_SWAP_BUFFERS = 8;  
{*
 * @brief xcb_dri2_swap_buffers_request_t
 * }
type
  Pxcb_dri2_swap_buffers_request_t = ^Txcb_dri2_swap_buffers_request_t;
  Txcb_dri2_swap_buffers_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      target_msc_hi : Tuint32_t;
      target_msc_lo : Tuint32_t;
      divisor_hi : Tuint32_t;
      divisor_lo : Tuint32_t;
      remainder_hi : Tuint32_t;
      remainder_lo : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_swap_buffers_reply_t
 * }

  Pxcb_dri2_swap_buffers_reply_t = ^Txcb_dri2_swap_buffers_reply_t;
  Txcb_dri2_swap_buffers_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      swap_hi : Tuint32_t;
      swap_lo : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_get_msc_cookie_t
 * }

  Pxcb_dri2_get_msc_cookie_t = ^Txcb_dri2_get_msc_cookie_t;
  Txcb_dri2_get_msc_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_get_msc.  }

const
  XCB_DRI2_GET_MSC = 9;  
{*
 * @brief xcb_dri2_get_msc_request_t
 * }
type
  Pxcb_dri2_get_msc_request_t = ^Txcb_dri2_get_msc_request_t;
  Txcb_dri2_get_msc_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
    end;
{*
 * @brief xcb_dri2_get_msc_reply_t
 * }

  Pxcb_dri2_get_msc_reply_t = ^Txcb_dri2_get_msc_reply_t;
  Txcb_dri2_get_msc_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ust_hi : Tuint32_t;
      ust_lo : Tuint32_t;
      msc_hi : Tuint32_t;
      msc_lo : Tuint32_t;
      sbc_hi : Tuint32_t;
      sbc_lo : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_wait_msc_cookie_t
 * }

  Pxcb_dri2_wait_msc_cookie_t = ^Txcb_dri2_wait_msc_cookie_t;
  Txcb_dri2_wait_msc_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_wait_msc.  }

const
  XCB_DRI2_WAIT_MSC = 10;  
{*
 * @brief xcb_dri2_wait_msc_request_t
 * }
type
  Pxcb_dri2_wait_msc_request_t = ^Txcb_dri2_wait_msc_request_t;
  Txcb_dri2_wait_msc_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      target_msc_hi : Tuint32_t;
      target_msc_lo : Tuint32_t;
      divisor_hi : Tuint32_t;
      divisor_lo : Tuint32_t;
      remainder_hi : Tuint32_t;
      remainder_lo : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_wait_msc_reply_t
 * }

  Pxcb_dri2_wait_msc_reply_t = ^Txcb_dri2_wait_msc_reply_t;
  Txcb_dri2_wait_msc_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ust_hi : Tuint32_t;
      ust_lo : Tuint32_t;
      msc_hi : Tuint32_t;
      msc_lo : Tuint32_t;
      sbc_hi : Tuint32_t;
      sbc_lo : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_wait_sbc_cookie_t
 * }

  Pxcb_dri2_wait_sbc_cookie_t = ^Txcb_dri2_wait_sbc_cookie_t;
  Txcb_dri2_wait_sbc_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_wait_sbc.  }

const
  XCB_DRI2_WAIT_SBC = 11;  
{*
 * @brief xcb_dri2_wait_sbc_request_t
 * }
type
  Pxcb_dri2_wait_sbc_request_t = ^Txcb_dri2_wait_sbc_request_t;
  Txcb_dri2_wait_sbc_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      target_sbc_hi : Tuint32_t;
      target_sbc_lo : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_wait_sbc_reply_t
 * }

  Pxcb_dri2_wait_sbc_reply_t = ^Txcb_dri2_wait_sbc_reply_t;
  Txcb_dri2_wait_sbc_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      ust_hi : Tuint32_t;
      ust_lo : Tuint32_t;
      msc_hi : Tuint32_t;
      msc_lo : Tuint32_t;
      sbc_hi : Tuint32_t;
      sbc_lo : Tuint32_t;
    end;
{* Opcode for xcb_dri2_swap_interval.  }

const
  XCB_DRI2_SWAP_INTERVAL = 12;  
{*
 * @brief xcb_dri2_swap_interval_request_t
 * }
type
  Pxcb_dri2_swap_interval_request_t = ^Txcb_dri2_swap_interval_request_t;
  Txcb_dri2_swap_interval_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      interval : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_get_param_cookie_t
 * }

  Pxcb_dri2_get_param_cookie_t = ^Txcb_dri2_get_param_cookie_t;
  Txcb_dri2_get_param_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_dri2_get_param.  }

const
  XCB_DRI2_GET_PARAM = 13;  
{*
 * @brief xcb_dri2_get_param_request_t
 * }
type
  Pxcb_dri2_get_param_request_t = ^Txcb_dri2_get_param_request_t;
  Txcb_dri2_get_param_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      param : Tuint32_t;
    end;
{*
 * @brief xcb_dri2_get_param_reply_t
 * }

  Pxcb_dri2_get_param_reply_t = ^Txcb_dri2_get_param_reply_t;
  Txcb_dri2_get_param_reply_t = record
      response_type : Tuint8_t;
      is_param_recognized : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      value_hi : Tuint32_t;
      value_lo : Tuint32_t;
    end;
{* Opcode for xcb_dri2_buffer_swap_complete.  }

const
  XCB_DRI2_BUFFER_SWAP_COMPLETE = 0;  
{*
 * @brief xcb_dri2_buffer_swap_complete_event_t
 * }
type
  Pxcb_dri2_buffer_swap_complete_event_t = ^Txcb_dri2_buffer_swap_complete_event_t;
  Txcb_dri2_buffer_swap_complete_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      event_type : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
      drawable : Txcb_drawable_t;
      ust_hi : Tuint32_t;
      ust_lo : Tuint32_t;
      msc_hi : Tuint32_t;
      msc_lo : Tuint32_t;
      sbc : Tuint32_t;
    end;
{* Opcode for xcb_dri2_invalidate_buffers.  }

const
  XCB_DRI2_INVALIDATE_BUFFERS = 1;  
{*
 * @brief xcb_dri2_invalidate_buffers_event_t
 * }
type
  Pxcb_dri2_invalidate_buffers_event_t = ^Txcb_dri2_invalidate_buffers_event_t;
  Txcb_dri2_invalidate_buffers_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      drawable : Txcb_drawable_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_dri2_dri2_buffer_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_dri2_dri2_buffer_t)
  }

procedure xcb_dri2_dri2_buffer_next(i:Pxcb_dri2_dri2_buffer_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_dri2_dri2_buffer_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_dri2_dri2_buffer_end(i:Txcb_dri2_dri2_buffer_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_dri2_attach_format_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_dri2_attach_format_t)
  }
procedure xcb_dri2_attach_format_next(i:Pxcb_dri2_attach_format_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_dri2_attach_format_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_dri2_attach_format_end(i:Txcb_dri2_attach_format_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_query_version(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t):Txcb_dri2_query_version_cookie_t;cdecl;external;
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
function xcb_dri2_query_version_unchecked(c:Pxcb_connection_t; major_version:Tuint32_t; minor_version:Tuint32_t):Txcb_dri2_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_query_version_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_connect_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_connect(c:Pxcb_connection_t; window:Txcb_window_t; driver_type:Tuint32_t):Txcb_dri2_connect_cookie_t;cdecl;external;
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
function xcb_dri2_connect_unchecked(c:Pxcb_connection_t; window:Txcb_window_t; driver_type:Tuint32_t):Txcb_dri2_connect_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_connect_driver_name(R:Pxcb_dri2_connect_reply_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_connect_driver_name_length(R:Pxcb_dri2_connect_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_connect_driver_name_end(R:Pxcb_dri2_connect_reply_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_connect_alignment_pad(R:Pxcb_dri2_connect_reply_t):pointer;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_connect_alignment_pad_length(R:Pxcb_dri2_connect_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_connect_alignment_pad_end(R:Pxcb_dri2_connect_reply_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_connect_device_name(R:Pxcb_dri2_connect_reply_t):Pchar;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_connect_device_name_length(R:Pxcb_dri2_connect_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_connect_device_name_end(R:Pxcb_dri2_connect_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_connect_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_connect_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_connect_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_connect_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_authenticate(c:Pxcb_connection_t; window:Txcb_window_t; magic:Tuint32_t):Txcb_dri2_authenticate_cookie_t;cdecl;external;
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
function xcb_dri2_authenticate_unchecked(c:Pxcb_connection_t; window:Txcb_window_t; magic:Tuint32_t):Txcb_dri2_authenticate_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_authenticate_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_authenticate_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_authenticate_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_authenticate_reply_t;cdecl;external;
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
function xcb_dri2_create_drawable_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_create_drawable(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_dri2_destroy_drawable_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_destroy_drawable(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_get_buffers_sizeof(_buffer:pointer; attachments_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_dri2_get_buffers(c:Pxcb_connection_t; drawable:Txcb_drawable_t; count:Tuint32_t; attachments_len:Tuint32_t; attachments:Puint32_t):Txcb_dri2_get_buffers_cookie_t;cdecl;external;
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
(* Const before type ignored *)
function xcb_dri2_get_buffers_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; count:Tuint32_t; attachments_len:Tuint32_t; attachments:Puint32_t):Txcb_dri2_get_buffers_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_get_buffers_buffers(R:Pxcb_dri2_get_buffers_reply_t):Pxcb_dri2_dri2_buffer_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_get_buffers_buffers_length(R:Pxcb_dri2_get_buffers_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_get_buffers_buffers_iterator(R:Pxcb_dri2_get_buffers_reply_t):Txcb_dri2_dri2_buffer_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_get_buffers_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_get_buffers_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_get_buffers_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_get_buffers_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_copy_region(c:Pxcb_connection_t; drawable:Txcb_drawable_t; region:Tuint32_t; dest:Tuint32_t; src:Tuint32_t):Txcb_dri2_copy_region_cookie_t;cdecl;external;
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
function xcb_dri2_copy_region_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; region:Tuint32_t; dest:Tuint32_t; src:Tuint32_t):Txcb_dri2_copy_region_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_copy_region_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_copy_region_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_copy_region_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_copy_region_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_get_buffers_with_format_sizeof(_buffer:pointer; attachments_len:Tuint32_t):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_dri2_get_buffers_with_format(c:Pxcb_connection_t; drawable:Txcb_drawable_t; count:Tuint32_t; attachments_len:Tuint32_t; attachments:Pxcb_dri2_attach_format_t):Txcb_dri2_get_buffers_with_format_cookie_t;cdecl;external;
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
(* Const before type ignored *)
function xcb_dri2_get_buffers_with_format_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; count:Tuint32_t; attachments_len:Tuint32_t; attachments:Pxcb_dri2_attach_format_t):Txcb_dri2_get_buffers_with_format_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_get_buffers_with_format_buffers(R:Pxcb_dri2_get_buffers_with_format_reply_t):Pxcb_dri2_dri2_buffer_t;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_get_buffers_with_format_buffers_length(R:Pxcb_dri2_get_buffers_with_format_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_dri2_get_buffers_with_format_buffers_iterator(R:Pxcb_dri2_get_buffers_with_format_reply_t):Txcb_dri2_dri2_buffer_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_get_buffers_with_format_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_get_buffers_with_format_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_get_buffers_with_format_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_get_buffers_with_format_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_swap_buffers(c:Pxcb_connection_t; drawable:Txcb_drawable_t; target_msc_hi:Tuint32_t; target_msc_lo:Tuint32_t; divisor_hi:Tuint32_t; 
           divisor_lo:Tuint32_t; remainder_hi:Tuint32_t; remainder_lo:Tuint32_t):Txcb_dri2_swap_buffers_cookie_t;cdecl;external;
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
function xcb_dri2_swap_buffers_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; target_msc_hi:Tuint32_t; target_msc_lo:Tuint32_t; divisor_hi:Tuint32_t; 
           divisor_lo:Tuint32_t; remainder_hi:Tuint32_t; remainder_lo:Tuint32_t):Txcb_dri2_swap_buffers_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_swap_buffers_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_swap_buffers_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_swap_buffers_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_swap_buffers_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_get_msc(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_dri2_get_msc_cookie_t;cdecl;external;
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
function xcb_dri2_get_msc_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t):Txcb_dri2_get_msc_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_get_msc_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_get_msc_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_get_msc_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_get_msc_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_wait_msc(c:Pxcb_connection_t; drawable:Txcb_drawable_t; target_msc_hi:Tuint32_t; target_msc_lo:Tuint32_t; divisor_hi:Tuint32_t; 
           divisor_lo:Tuint32_t; remainder_hi:Tuint32_t; remainder_lo:Tuint32_t):Txcb_dri2_wait_msc_cookie_t;cdecl;external;
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
function xcb_dri2_wait_msc_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; target_msc_hi:Tuint32_t; target_msc_lo:Tuint32_t; divisor_hi:Tuint32_t; 
           divisor_lo:Tuint32_t; remainder_hi:Tuint32_t; remainder_lo:Tuint32_t):Txcb_dri2_wait_msc_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_wait_msc_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_wait_msc_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_wait_msc_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_wait_msc_reply_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_wait_sbc(c:Pxcb_connection_t; drawable:Txcb_drawable_t; target_sbc_hi:Tuint32_t; target_sbc_lo:Tuint32_t):Txcb_dri2_wait_sbc_cookie_t;cdecl;external;
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
function xcb_dri2_wait_sbc_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; target_sbc_hi:Tuint32_t; target_sbc_lo:Tuint32_t):Txcb_dri2_wait_sbc_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_wait_sbc_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_wait_sbc_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_wait_sbc_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_wait_sbc_reply_t;cdecl;external;
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
function xcb_dri2_swap_interval_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; interval:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_swap_interval(c:Pxcb_connection_t; drawable:Txcb_drawable_t; interval:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_dri2_get_param(c:Pxcb_connection_t; drawable:Txcb_drawable_t; param:Tuint32_t):Txcb_dri2_get_param_cookie_t;cdecl;external;
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
function xcb_dri2_get_param_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; param:Tuint32_t):Txcb_dri2_get_param_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_dri2_get_param_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_dri2_get_param_reply(c:Pxcb_connection_t; cookie:Txcb_dri2_get_param_cookie_t; e:PPxcb_generic_error_t):Pxcb_dri2_get_param_reply_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
