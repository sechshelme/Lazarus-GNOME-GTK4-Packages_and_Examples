unit xfixes;

interface

uses
  fp_xcb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from xfixes.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_XFixes_API XCB XFixes API
 * @brief XFixes XCB Protocol Implementation.
 * @
 * }
{$ifndef __XFIXES_H}
{$define __XFIXES_H}
{$include "xcb.h"}
{$include "xproto.h"}
{$include "render.h"}
{$include "shape.h"}
{ C++ extern C conditionnal removed }

const
  XCB_XFIXES_MAJOR_VERSION = 6;  
  XCB_XFIXES_MINOR_VERSION = 0;  
  var
    xcb_xfixes_id : Txcb_extension_t;cvar;external libxcbxxx;
{*
 * @brief xcb_xfixes_query_version_cookie_t
 * }
type
  Pxcb_xfixes_query_version_cookie_t = ^Txcb_xfixes_query_version_cookie_t;
  Txcb_xfixes_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xfixes_query_version.  }

const
  XCB_XFIXES_QUERY_VERSION = 0;  
{*
 * @brief xcb_xfixes_query_version_request_t
 * }
type
  Pxcb_xfixes_query_version_request_t = ^Txcb_xfixes_query_version_request_t;
  Txcb_xfixes_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      client_major_version : Tuint32_t;
      client_minor_version : Tuint32_t;
    end;
{*
 * @brief xcb_xfixes_query_version_reply_t
 * }

  Pxcb_xfixes_query_version_reply_t = ^Txcb_xfixes_query_version_reply_t;
  Txcb_xfixes_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint32_t;
      minor_version : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;

  Pxcb_xfixes_save_set_mode_t = ^Txcb_xfixes_save_set_mode_t;
  Txcb_xfixes_save_set_mode_t =  Longint;
  Const
    XCB_XFIXES_SAVE_SET_MODE_INSERT = 0;
    XCB_XFIXES_SAVE_SET_MODE_DELETE = 1;
;
type
  Pxcb_xfixes_save_set_target_t = ^Txcb_xfixes_save_set_target_t;
  Txcb_xfixes_save_set_target_t =  Longint;
  Const
    XCB_XFIXES_SAVE_SET_TARGET_NEAREST = 0;
    XCB_XFIXES_SAVE_SET_TARGET_ROOT = 1;
;
type
  Pxcb_xfixes_save_set_mapping_t = ^Txcb_xfixes_save_set_mapping_t;
  Txcb_xfixes_save_set_mapping_t =  Longint;
  Const
    XCB_XFIXES_SAVE_SET_MAPPING_MAP = 0;
    XCB_XFIXES_SAVE_SET_MAPPING_UNMAP = 1;
;
{* Opcode for xcb_xfixes_change_save_set.  }
  XCB_XFIXES_CHANGE_SAVE_SET = 1;  
{*
 * @brief xcb_xfixes_change_save_set_request_t
 * }
type
  Pxcb_xfixes_change_save_set_request_t = ^Txcb_xfixes_change_save_set_request_t;
  Txcb_xfixes_change_save_set_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      mode : Tuint8_t;
      target : Tuint8_t;
      map : Tuint8_t;
      pad0 : Tuint8_t;
      window : Txcb_window_t;
    end;

  Pxcb_xfixes_selection_event_t = ^Txcb_xfixes_selection_event_t;
  Txcb_xfixes_selection_event_t =  Longint;
  Const
    XCB_XFIXES_SELECTION_EVENT_SET_SELECTION_OWNER = 0;
    XCB_XFIXES_SELECTION_EVENT_SELECTION_WINDOW_DESTROY = 1;
    XCB_XFIXES_SELECTION_EVENT_SELECTION_CLIENT_CLOSE = 2;
;
type
  Pxcb_xfixes_selection_event_mask_t = ^Txcb_xfixes_selection_event_mask_t;
  Txcb_xfixes_selection_event_mask_t =  Longint;
  Const
    XCB_XFIXES_SELECTION_EVENT_MASK_SET_SELECTION_OWNER = 1;
    XCB_XFIXES_SELECTION_EVENT_MASK_SELECTION_WINDOW_DESTROY = 2;
    XCB_XFIXES_SELECTION_EVENT_MASK_SELECTION_CLIENT_CLOSE = 4;
;
{* Opcode for xcb_xfixes_selection_notify.  }
  XCB_XFIXES_SELECTION_NOTIFY = 0;  
{*
 * @brief xcb_xfixes_selection_notify_event_t
 * }
type
  Pxcb_xfixes_selection_notify_event_t = ^Txcb_xfixes_selection_notify_event_t;
  Txcb_xfixes_selection_notify_event_t = record
      response_type : Tuint8_t;
      subtype : Tuint8_t;
      sequence : Tuint16_t;
      window : Txcb_window_t;
      owner : Txcb_window_t;
      selection : Txcb_atom_t;
      timestamp : Txcb_timestamp_t;
      selection_timestamp : Txcb_timestamp_t;
      pad0 : array[0..7] of Tuint8_t;
    end;
{* Opcode for xcb_xfixes_select_selection_input.  }

const
  XCB_XFIXES_SELECT_SELECTION_INPUT = 2;  
{*
 * @brief xcb_xfixes_select_selection_input_request_t
 * }
type
  Pxcb_xfixes_select_selection_input_request_t = ^Txcb_xfixes_select_selection_input_request_t;
  Txcb_xfixes_select_selection_input_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      selection : Txcb_atom_t;
      event_mask : Tuint32_t;
    end;

  Pxcb_xfixes_cursor_notify_t = ^Txcb_xfixes_cursor_notify_t;
  Txcb_xfixes_cursor_notify_t =  Longint;
  Const
    XCB_XFIXES_CURSOR_NOTIFY_DISPLAY_CURSOR = 0;
;
type
  Pxcb_xfixes_cursor_notify_mask_t = ^Txcb_xfixes_cursor_notify_mask_t;
  Txcb_xfixes_cursor_notify_mask_t =  Longint;
  Const
    XCB_XFIXES_CURSOR_NOTIFY_MASK_DISPLAY_CURSOR = 1;
;
{* Opcode for xcb_xfixes_cursor_notify.  }
  XCB_XFIXES_CURSOR_NOTIFY = 1;  
{*
 * @brief xcb_xfixes_cursor_notify_event_t
 * }
type
  Pxcb_xfixes_cursor_notify_event_t = ^Txcb_xfixes_cursor_notify_event_t;
  Txcb_xfixes_cursor_notify_event_t = record
      response_type : Tuint8_t;
      subtype : Tuint8_t;
      sequence : Tuint16_t;
      window : Txcb_window_t;
      cursor_serial : Tuint32_t;
      timestamp : Txcb_timestamp_t;
      name : Txcb_atom_t;
      pad0 : array[0..11] of Tuint8_t;
    end;
{* Opcode for xcb_xfixes_select_cursor_input.  }

const
  XCB_XFIXES_SELECT_CURSOR_INPUT = 3;  
{*
 * @brief xcb_xfixes_select_cursor_input_request_t
 * }
type
  Pxcb_xfixes_select_cursor_input_request_t = ^Txcb_xfixes_select_cursor_input_request_t;
  Txcb_xfixes_select_cursor_input_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      event_mask : Tuint32_t;
    end;
{*
 * @brief xcb_xfixes_get_cursor_image_cookie_t
 * }

  Pxcb_xfixes_get_cursor_image_cookie_t = ^Txcb_xfixes_get_cursor_image_cookie_t;
  Txcb_xfixes_get_cursor_image_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xfixes_get_cursor_image.  }

const
  XCB_XFIXES_GET_CURSOR_IMAGE = 4;  
{*
 * @brief xcb_xfixes_get_cursor_image_request_t
 * }
type
  Pxcb_xfixes_get_cursor_image_request_t = ^Txcb_xfixes_get_cursor_image_request_t;
  Txcb_xfixes_get_cursor_image_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_xfixes_get_cursor_image_reply_t
 * }

  Pxcb_xfixes_get_cursor_image_reply_t = ^Txcb_xfixes_get_cursor_image_reply_t;
  Txcb_xfixes_get_cursor_image_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      xhot : Tuint16_t;
      yhot : Tuint16_t;
      cursor_serial : Tuint32_t;
      pad1 : array[0..7] of Tuint8_t;
    end;

  Pxcb_xfixes_region_t = ^Txcb_xfixes_region_t;
  Txcb_xfixes_region_t = Tuint32_t;
{*
 * @brief xcb_xfixes_region_iterator_t
 * }

  Pxcb_xfixes_region_iterator_t = ^Txcb_xfixes_region_iterator_t;
  Txcb_xfixes_region_iterator_t = record
      data : Pxcb_xfixes_region_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_xfixes_bad_region.  }

const
  XCB_XFIXES_BAD_REGION = 0;  
{*
 * @brief xcb_xfixes_bad_region_error_t
 * }
type
  Pxcb_xfixes_bad_region_error_t = ^Txcb_xfixes_bad_region_error_t;
  Txcb_xfixes_bad_region_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      bad_value : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
    end;

  Pxcb_xfixes_region_enum_t = ^Txcb_xfixes_region_enum_t;
  Txcb_xfixes_region_enum_t =  Longint;
  Const
    XCB_XFIXES_REGION_NONE = 0;
;
{* Opcode for xcb_xfixes_create_region.  }
  XCB_XFIXES_CREATE_REGION = 5;  
{*
 * @brief xcb_xfixes_create_region_request_t
 * }
type
  Pxcb_xfixes_create_region_request_t = ^Txcb_xfixes_create_region_request_t;
  Txcb_xfixes_create_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      region : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_xfixes_create_region_from_bitmap.  }

const
  XCB_XFIXES_CREATE_REGION_FROM_BITMAP = 6;  
{*
 * @brief xcb_xfixes_create_region_from_bitmap_request_t
 * }
type
  Pxcb_xfixes_create_region_from_bitmap_request_t = ^Txcb_xfixes_create_region_from_bitmap_request_t;
  Txcb_xfixes_create_region_from_bitmap_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      region : Txcb_xfixes_region_t;
      bitmap : Txcb_pixmap_t;
    end;
{* Opcode for xcb_xfixes_create_region_from_window.  }

const
  XCB_XFIXES_CREATE_REGION_FROM_WINDOW = 7;  
{*
 * @brief xcb_xfixes_create_region_from_window_request_t
 * }
type
  Pxcb_xfixes_create_region_from_window_request_t = ^Txcb_xfixes_create_region_from_window_request_t;
  Txcb_xfixes_create_region_from_window_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      region : Txcb_xfixes_region_t;
      window : Txcb_window_t;
      kind : Txcb_shape_kind_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_xfixes_create_region_from_gc.  }

const
  XCB_XFIXES_CREATE_REGION_FROM_GC = 8;  
{*
 * @brief xcb_xfixes_create_region_from_gc_request_t
 * }
type
  Pxcb_xfixes_create_region_from_gc_request_t = ^Txcb_xfixes_create_region_from_gc_request_t;
  Txcb_xfixes_create_region_from_gc_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      region : Txcb_xfixes_region_t;
      gc : Txcb_gcontext_t;
    end;
{* Opcode for xcb_xfixes_create_region_from_picture.  }

const
  XCB_XFIXES_CREATE_REGION_FROM_PICTURE = 9;  
{*
 * @brief xcb_xfixes_create_region_from_picture_request_t
 * }
type
  Pxcb_xfixes_create_region_from_picture_request_t = ^Txcb_xfixes_create_region_from_picture_request_t;
  Txcb_xfixes_create_region_from_picture_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      region : Txcb_xfixes_region_t;
      picture : Txcb_render_picture_t;
    end;
{* Opcode for xcb_xfixes_destroy_region.  }

const
  XCB_XFIXES_DESTROY_REGION = 10;  
{*
 * @brief xcb_xfixes_destroy_region_request_t
 * }
type
  Pxcb_xfixes_destroy_region_request_t = ^Txcb_xfixes_destroy_region_request_t;
  Txcb_xfixes_destroy_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      region : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_xfixes_set_region.  }

const
  XCB_XFIXES_SET_REGION = 11;  
{*
 * @brief xcb_xfixes_set_region_request_t
 * }
type
  Pxcb_xfixes_set_region_request_t = ^Txcb_xfixes_set_region_request_t;
  Txcb_xfixes_set_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      region : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_xfixes_copy_region.  }

const
  XCB_XFIXES_COPY_REGION = 12;  
{*
 * @brief xcb_xfixes_copy_region_request_t
 * }
type
  Pxcb_xfixes_copy_region_request_t = ^Txcb_xfixes_copy_region_request_t;
  Txcb_xfixes_copy_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      source : Txcb_xfixes_region_t;
      destination : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_xfixes_union_region.  }

const
  XCB_XFIXES_UNION_REGION = 13;  
{*
 * @brief xcb_xfixes_union_region_request_t
 * }
type
  Pxcb_xfixes_union_region_request_t = ^Txcb_xfixes_union_region_request_t;
  Txcb_xfixes_union_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      source1 : Txcb_xfixes_region_t;
      source2 : Txcb_xfixes_region_t;
      destination : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_xfixes_intersect_region.  }

const
  XCB_XFIXES_INTERSECT_REGION = 14;  
{*
 * @brief xcb_xfixes_intersect_region_request_t
 * }
type
  Pxcb_xfixes_intersect_region_request_t = ^Txcb_xfixes_intersect_region_request_t;
  Txcb_xfixes_intersect_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      source1 : Txcb_xfixes_region_t;
      source2 : Txcb_xfixes_region_t;
      destination : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_xfixes_subtract_region.  }

const
  XCB_XFIXES_SUBTRACT_REGION = 15;  
{*
 * @brief xcb_xfixes_subtract_region_request_t
 * }
type
  Pxcb_xfixes_subtract_region_request_t = ^Txcb_xfixes_subtract_region_request_t;
  Txcb_xfixes_subtract_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      source1 : Txcb_xfixes_region_t;
      source2 : Txcb_xfixes_region_t;
      destination : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_xfixes_invert_region.  }

const
  XCB_XFIXES_INVERT_REGION = 16;  
{*
 * @brief xcb_xfixes_invert_region_request_t
 * }
type
  Pxcb_xfixes_invert_region_request_t = ^Txcb_xfixes_invert_region_request_t;
  Txcb_xfixes_invert_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      source : Txcb_xfixes_region_t;
      bounds : Txcb_rectangle_t;
      destination : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_xfixes_translate_region.  }

const
  XCB_XFIXES_TRANSLATE_REGION = 17;  
{*
 * @brief xcb_xfixes_translate_region_request_t
 * }
type
  Pxcb_xfixes_translate_region_request_t = ^Txcb_xfixes_translate_region_request_t;
  Txcb_xfixes_translate_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      region : Txcb_xfixes_region_t;
      dx : Tint16_t;
      dy : Tint16_t;
    end;
{* Opcode for xcb_xfixes_region_extents.  }

const
  XCB_XFIXES_REGION_EXTENTS = 18;  
{*
 * @brief xcb_xfixes_region_extents_request_t
 * }
type
  Pxcb_xfixes_region_extents_request_t = ^Txcb_xfixes_region_extents_request_t;
  Txcb_xfixes_region_extents_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      source : Txcb_xfixes_region_t;
      destination : Txcb_xfixes_region_t;
    end;
{*
 * @brief xcb_xfixes_fetch_region_cookie_t
 * }

  Pxcb_xfixes_fetch_region_cookie_t = ^Txcb_xfixes_fetch_region_cookie_t;
  Txcb_xfixes_fetch_region_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xfixes_fetch_region.  }

const
  XCB_XFIXES_FETCH_REGION = 19;  
{*
 * @brief xcb_xfixes_fetch_region_request_t
 * }
type
  Pxcb_xfixes_fetch_region_request_t = ^Txcb_xfixes_fetch_region_request_t;
  Txcb_xfixes_fetch_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      region : Txcb_xfixes_region_t;
    end;
{*
 * @brief xcb_xfixes_fetch_region_reply_t
 * }

  Pxcb_xfixes_fetch_region_reply_t = ^Txcb_xfixes_fetch_region_reply_t;
  Txcb_xfixes_fetch_region_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      extents : Txcb_rectangle_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{* Opcode for xcb_xfixes_set_gc_clip_region.  }

const
  XCB_XFIXES_SET_GC_CLIP_REGION = 20;  
{*
 * @brief xcb_xfixes_set_gc_clip_region_request_t
 * }
type
  Pxcb_xfixes_set_gc_clip_region_request_t = ^Txcb_xfixes_set_gc_clip_region_request_t;
  Txcb_xfixes_set_gc_clip_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      gc : Txcb_gcontext_t;
      region : Txcb_xfixes_region_t;
      x_origin : Tint16_t;
      y_origin : Tint16_t;
    end;
{* Opcode for xcb_xfixes_set_window_shape_region.  }

const
  XCB_XFIXES_SET_WINDOW_SHAPE_REGION = 21;  
{*
 * @brief xcb_xfixes_set_window_shape_region_request_t
 * }
type
  Pxcb_xfixes_set_window_shape_region_request_t = ^Txcb_xfixes_set_window_shape_region_request_t;
  Txcb_xfixes_set_window_shape_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      dest : Txcb_window_t;
      dest_kind : Txcb_shape_kind_t;
      pad0 : array[0..2] of Tuint8_t;
      x_offset : Tint16_t;
      y_offset : Tint16_t;
      region : Txcb_xfixes_region_t;
    end;
{* Opcode for xcb_xfixes_set_picture_clip_region.  }

const
  XCB_XFIXES_SET_PICTURE_CLIP_REGION = 22;  
{*
 * @brief xcb_xfixes_set_picture_clip_region_request_t
 * }
type
  Pxcb_xfixes_set_picture_clip_region_request_t = ^Txcb_xfixes_set_picture_clip_region_request_t;
  Txcb_xfixes_set_picture_clip_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      picture : Txcb_render_picture_t;
      region : Txcb_xfixes_region_t;
      x_origin : Tint16_t;
      y_origin : Tint16_t;
    end;
{* Opcode for xcb_xfixes_set_cursor_name.  }

const
  XCB_XFIXES_SET_CURSOR_NAME = 23;  
{*
 * @brief xcb_xfixes_set_cursor_name_request_t
 * }
type
  Pxcb_xfixes_set_cursor_name_request_t = ^Txcb_xfixes_set_cursor_name_request_t;
  Txcb_xfixes_set_cursor_name_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      cursor : Txcb_cursor_t;
      nbytes : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{*
 * @brief xcb_xfixes_get_cursor_name_cookie_t
 * }

  Pxcb_xfixes_get_cursor_name_cookie_t = ^Txcb_xfixes_get_cursor_name_cookie_t;
  Txcb_xfixes_get_cursor_name_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xfixes_get_cursor_name.  }

const
  XCB_XFIXES_GET_CURSOR_NAME = 24;  
{*
 * @brief xcb_xfixes_get_cursor_name_request_t
 * }
type
  Pxcb_xfixes_get_cursor_name_request_t = ^Txcb_xfixes_get_cursor_name_request_t;
  Txcb_xfixes_get_cursor_name_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      cursor : Txcb_cursor_t;
    end;
{*
 * @brief xcb_xfixes_get_cursor_name_reply_t
 * }

  Pxcb_xfixes_get_cursor_name_reply_t = ^Txcb_xfixes_get_cursor_name_reply_t;
  Txcb_xfixes_get_cursor_name_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      atom : Txcb_atom_t;
      nbytes : Tuint16_t;
      pad1 : array[0..17] of Tuint8_t;
    end;
{*
 * @brief xcb_xfixes_get_cursor_image_and_name_cookie_t
 * }

  Pxcb_xfixes_get_cursor_image_and_name_cookie_t = ^Txcb_xfixes_get_cursor_image_and_name_cookie_t;
  Txcb_xfixes_get_cursor_image_and_name_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xfixes_get_cursor_image_and_name.  }

const
  XCB_XFIXES_GET_CURSOR_IMAGE_AND_NAME = 25;  
{*
 * @brief xcb_xfixes_get_cursor_image_and_name_request_t
 * }
type
  Pxcb_xfixes_get_cursor_image_and_name_request_t = ^Txcb_xfixes_get_cursor_image_and_name_request_t;
  Txcb_xfixes_get_cursor_image_and_name_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_xfixes_get_cursor_image_and_name_reply_t
 * }

  Pxcb_xfixes_get_cursor_image_and_name_reply_t = ^Txcb_xfixes_get_cursor_image_and_name_reply_t;
  Txcb_xfixes_get_cursor_image_and_name_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      xhot : Tuint16_t;
      yhot : Tuint16_t;
      cursor_serial : Tuint32_t;
      cursor_atom : Txcb_atom_t;
      nbytes : Tuint16_t;
      pad1 : array[0..1] of Tuint8_t;
    end;
{* Opcode for xcb_xfixes_change_cursor.  }

const
  XCB_XFIXES_CHANGE_CURSOR = 26;  
{*
 * @brief xcb_xfixes_change_cursor_request_t
 * }
type
  Pxcb_xfixes_change_cursor_request_t = ^Txcb_xfixes_change_cursor_request_t;
  Txcb_xfixes_change_cursor_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      source : Txcb_cursor_t;
      destination : Txcb_cursor_t;
    end;
{* Opcode for xcb_xfixes_change_cursor_by_name.  }

const
  XCB_XFIXES_CHANGE_CURSOR_BY_NAME = 27;  
{*
 * @brief xcb_xfixes_change_cursor_by_name_request_t
 * }
type
  Pxcb_xfixes_change_cursor_by_name_request_t = ^Txcb_xfixes_change_cursor_by_name_request_t;
  Txcb_xfixes_change_cursor_by_name_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      src : Txcb_cursor_t;
      nbytes : Tuint16_t;
      pad0 : array[0..1] of Tuint8_t;
    end;
{* Opcode for xcb_xfixes_expand_region.  }

const
  XCB_XFIXES_EXPAND_REGION = 28;  
{*
 * @brief xcb_xfixes_expand_region_request_t
 * }
type
  Pxcb_xfixes_expand_region_request_t = ^Txcb_xfixes_expand_region_request_t;
  Txcb_xfixes_expand_region_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      source : Txcb_xfixes_region_t;
      destination : Txcb_xfixes_region_t;
      left : Tuint16_t;
      right : Tuint16_t;
      top : Tuint16_t;
      bottom : Tuint16_t;
    end;
{* Opcode for xcb_xfixes_hide_cursor.  }

const
  XCB_XFIXES_HIDE_CURSOR = 29;  
{*
 * @brief xcb_xfixes_hide_cursor_request_t
 * }
type
  Pxcb_xfixes_hide_cursor_request_t = ^Txcb_xfixes_hide_cursor_request_t;
  Txcb_xfixes_hide_cursor_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;
{* Opcode for xcb_xfixes_show_cursor.  }

const
  XCB_XFIXES_SHOW_CURSOR = 30;  
{*
 * @brief xcb_xfixes_show_cursor_request_t
 * }
type
  Pxcb_xfixes_show_cursor_request_t = ^Txcb_xfixes_show_cursor_request_t;
  Txcb_xfixes_show_cursor_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
    end;

  Pxcb_xfixes_barrier_t = ^Txcb_xfixes_barrier_t;
  Txcb_xfixes_barrier_t = Tuint32_t;
{*
 * @brief xcb_xfixes_barrier_iterator_t
 * }

  Pxcb_xfixes_barrier_iterator_t = ^Txcb_xfixes_barrier_iterator_t;
  Txcb_xfixes_barrier_iterator_t = record
      data : Pxcb_xfixes_barrier_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_xfixes_barrier_directions_t = ^Txcb_xfixes_barrier_directions_t;
  Txcb_xfixes_barrier_directions_t =  Longint;
  Const
    XCB_XFIXES_BARRIER_DIRECTIONS_POSITIVE_X = 1;
    XCB_XFIXES_BARRIER_DIRECTIONS_POSITIVE_Y = 2;
    XCB_XFIXES_BARRIER_DIRECTIONS_NEGATIVE_X = 4;
    XCB_XFIXES_BARRIER_DIRECTIONS_NEGATIVE_Y = 8;
;
{* Opcode for xcb_xfixes_create_pointer_barrier.  }
  XCB_XFIXES_CREATE_POINTER_BARRIER = 31;  
{*
 * @brief xcb_xfixes_create_pointer_barrier_request_t
 * }
type
  Pxcb_xfixes_create_pointer_barrier_request_t = ^Txcb_xfixes_create_pointer_barrier_request_t;
  Txcb_xfixes_create_pointer_barrier_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      barrier : Txcb_xfixes_barrier_t;
      window : Txcb_window_t;
      x1 : Tuint16_t;
      y1 : Tuint16_t;
      x2 : Tuint16_t;
      y2 : Tuint16_t;
      directions : Tuint32_t;
      pad0 : array[0..1] of Tuint8_t;
      num_devices : Tuint16_t;
    end;
{* Opcode for xcb_xfixes_delete_pointer_barrier.  }

const
  XCB_XFIXES_DELETE_POINTER_BARRIER = 32;  
{*
 * @brief xcb_xfixes_delete_pointer_barrier_request_t
 * }
type
  Pxcb_xfixes_delete_pointer_barrier_request_t = ^Txcb_xfixes_delete_pointer_barrier_request_t;
  Txcb_xfixes_delete_pointer_barrier_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      barrier : Txcb_xfixes_barrier_t;
    end;
{*< The default behavior for regular clients: the X11 server won't terminate as long
as such clients are still connected, and should this client disconnect, the
server will continue running so long as other clients (that have not set
XFixesClientDisconnectFlagTerminate) are connected.  }
{*< Indicates to the X11 server that it can ignore the client and terminate itself
even though the client is still connected to the X11 server.  }

  Pxcb_xfixes_client_disconnect_flags_t = ^Txcb_xfixes_client_disconnect_flags_t;
  Txcb_xfixes_client_disconnect_flags_t =  Longint;
  Const
    XCB_XFIXES_CLIENT_DISCONNECT_FLAGS_DEFAULT = 0;
    XCB_XFIXES_CLIENT_DISCONNECT_FLAGS_TERMINATE = 1;
;
{* Opcode for xcb_xfixes_set_client_disconnect_mode.  }
  XCB_XFIXES_SET_CLIENT_DISCONNECT_MODE = 33;  
{*
 * @brief xcb_xfixes_set_client_disconnect_mode_request_t
 * }
type
  Pxcb_xfixes_set_client_disconnect_mode_request_t = ^Txcb_xfixes_set_client_disconnect_mode_request_t;
  Txcb_xfixes_set_client_disconnect_mode_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      disconnect_mode : Tuint32_t;
    end;
{*
 * @brief xcb_xfixes_get_client_disconnect_mode_cookie_t
 * }

  Pxcb_xfixes_get_client_disconnect_mode_cookie_t = ^Txcb_xfixes_get_client_disconnect_mode_cookie_t;
  Txcb_xfixes_get_client_disconnect_mode_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xfixes_get_client_disconnect_mode.  }

const
  XCB_XFIXES_GET_CLIENT_DISCONNECT_MODE = 34;  
{*
 * @brief xcb_xfixes_get_client_disconnect_mode_request_t
 * }
type
  Pxcb_xfixes_get_client_disconnect_mode_request_t = ^Txcb_xfixes_get_client_disconnect_mode_request_t;
  Txcb_xfixes_get_client_disconnect_mode_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_xfixes_get_client_disconnect_mode_reply_t
 * }

  Pxcb_xfixes_get_client_disconnect_mode_reply_t = ^Txcb_xfixes_get_client_disconnect_mode_reply_t;
  Txcb_xfixes_get_client_disconnect_mode_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      disconnect_mode : Tuint32_t;
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

function xcb_xfixes_query_version(c:Pxcb_connection_t; client_major_version:Tuint32_t; client_minor_version:Tuint32_t):Txcb_xfixes_query_version_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_query_version_unchecked(c:Pxcb_connection_t; client_major_version:Tuint32_t; client_minor_version:Tuint32_t):Txcb_xfixes_query_version_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xfixes_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xfixes_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_xfixes_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_xfixes_query_version_reply_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_change_save_set_checked(c:Pxcb_connection_t; mode:Tuint8_t; target:Tuint8_t; map:Tuint8_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_change_save_set(c:Pxcb_connection_t; mode:Tuint8_t; target:Tuint8_t; map:Tuint8_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_select_selection_input_checked(c:Pxcb_connection_t; window:Txcb_window_t; selection:Txcb_atom_t; event_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_select_selection_input(c:Pxcb_connection_t; window:Txcb_window_t; selection:Txcb_atom_t; event_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_select_cursor_input_checked(c:Pxcb_connection_t; window:Txcb_window_t; event_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_select_cursor_input(c:Pxcb_connection_t; window:Txcb_window_t; event_mask:Tuint32_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_get_cursor_image(c:Pxcb_connection_t):Txcb_xfixes_get_cursor_image_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_get_cursor_image_unchecked(c:Pxcb_connection_t):Txcb_xfixes_get_cursor_image_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_cursor_image(R:Pxcb_xfixes_get_cursor_image_reply_t):Puint32_t;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_cursor_image_length(R:Pxcb_xfixes_get_cursor_image_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_cursor_image_end(R:Pxcb_xfixes_get_cursor_image_reply_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xfixes_get_cursor_image_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xfixes_get_cursor_image_reply(c:Pxcb_connection_t; cookie:Txcb_xfixes_get_cursor_image_cookie_t; e:PPxcb_generic_error_t):Pxcb_xfixes_get_cursor_image_reply_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_xfixes_region_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_xfixes_region_t)
  }
procedure xcb_xfixes_region_next(i:Pxcb_xfixes_region_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_xfixes_region_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_xfixes_region_end(i:Txcb_xfixes_region_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
function xcb_xfixes_create_region_sizeof(_buffer:pointer; rectangles_len:Tuint32_t):longint;cdecl;external libxcbxxx;
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
function xcb_xfixes_create_region_checked(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_create_region(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_create_region_rectangles(R:Pxcb_xfixes_create_region_request_t):Pxcb_rectangle_t;cdecl;external libxcbxxx;
function xcb_xfixes_create_region_rectangles_length(R:Pxcb_xfixes_create_region_request_t):longint;cdecl;external libxcbxxx;
function xcb_xfixes_create_region_rectangles_iterator(R:Pxcb_xfixes_create_region_request_t):Txcb_rectangle_iterator_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_create_region_from_bitmap_checked(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; bitmap:Txcb_pixmap_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_create_region_from_bitmap(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; bitmap:Txcb_pixmap_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_create_region_from_window_checked(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; window:Txcb_window_t; kind:Txcb_shape_kind_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_create_region_from_window(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; window:Txcb_window_t; kind:Txcb_shape_kind_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_create_region_from_gc_checked(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; gc:Txcb_gcontext_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_create_region_from_gc(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; gc:Txcb_gcontext_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_create_region_from_picture_checked(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; picture:Txcb_render_picture_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_create_region_from_picture(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; picture:Txcb_render_picture_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_destroy_region_checked(c:Pxcb_connection_t; region:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_destroy_region(c:Pxcb_connection_t; region:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_set_region_sizeof(_buffer:pointer; rectangles_len:Tuint32_t):longint;cdecl;external libxcbxxx;
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
function xcb_xfixes_set_region_checked(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_set_region(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_set_region_rectangles(R:Pxcb_xfixes_set_region_request_t):Pxcb_rectangle_t;cdecl;external libxcbxxx;
function xcb_xfixes_set_region_rectangles_length(R:Pxcb_xfixes_set_region_request_t):longint;cdecl;external libxcbxxx;
function xcb_xfixes_set_region_rectangles_iterator(R:Pxcb_xfixes_set_region_request_t):Txcb_rectangle_iterator_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_copy_region_checked(c:Pxcb_connection_t; source:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_copy_region(c:Pxcb_connection_t; source:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_union_region_checked(c:Pxcb_connection_t; source1:Txcb_xfixes_region_t; source2:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_union_region(c:Pxcb_connection_t; source1:Txcb_xfixes_region_t; source2:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_intersect_region_checked(c:Pxcb_connection_t; source1:Txcb_xfixes_region_t; source2:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_intersect_region(c:Pxcb_connection_t; source1:Txcb_xfixes_region_t; source2:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_subtract_region_checked(c:Pxcb_connection_t; source1:Txcb_xfixes_region_t; source2:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_subtract_region(c:Pxcb_connection_t; source1:Txcb_xfixes_region_t; source2:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_invert_region_checked(c:Pxcb_connection_t; source:Txcb_xfixes_region_t; bounds:Txcb_rectangle_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_invert_region(c:Pxcb_connection_t; source:Txcb_xfixes_region_t; bounds:Txcb_rectangle_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_translate_region_checked(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; dx:Tint16_t; dy:Tint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_translate_region(c:Pxcb_connection_t; region:Txcb_xfixes_region_t; dx:Tint16_t; dy:Tint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_region_extents_checked(c:Pxcb_connection_t; source:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_region_extents(c:Pxcb_connection_t; source:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_fetch_region_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_fetch_region(c:Pxcb_connection_t; region:Txcb_xfixes_region_t):Txcb_xfixes_fetch_region_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_fetch_region_unchecked(c:Pxcb_connection_t; region:Txcb_xfixes_region_t):Txcb_xfixes_fetch_region_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_fetch_region_rectangles(R:Pxcb_xfixes_fetch_region_reply_t):Pxcb_rectangle_t;cdecl;external libxcbxxx;
function xcb_xfixes_fetch_region_rectangles_length(R:Pxcb_xfixes_fetch_region_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xfixes_fetch_region_rectangles_iterator(R:Pxcb_xfixes_fetch_region_reply_t):Txcb_rectangle_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xfixes_fetch_region_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xfixes_fetch_region_reply(c:Pxcb_connection_t; cookie:Txcb_xfixes_fetch_region_cookie_t; e:PPxcb_generic_error_t):Pxcb_xfixes_fetch_region_reply_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_set_gc_clip_region_checked(c:Pxcb_connection_t; gc:Txcb_gcontext_t; region:Txcb_xfixes_region_t; x_origin:Tint16_t; y_origin:Tint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_set_gc_clip_region(c:Pxcb_connection_t; gc:Txcb_gcontext_t; region:Txcb_xfixes_region_t; x_origin:Tint16_t; y_origin:Tint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_set_window_shape_region_checked(c:Pxcb_connection_t; dest:Txcb_window_t; dest_kind:Txcb_shape_kind_t; x_offset:Tint16_t; y_offset:Tint16_t; 
           region:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_set_window_shape_region(c:Pxcb_connection_t; dest:Txcb_window_t; dest_kind:Txcb_shape_kind_t; x_offset:Tint16_t; y_offset:Tint16_t; 
           region:Txcb_xfixes_region_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_set_picture_clip_region_checked(c:Pxcb_connection_t; picture:Txcb_render_picture_t; region:Txcb_xfixes_region_t; x_origin:Tint16_t; y_origin:Tint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_set_picture_clip_region(c:Pxcb_connection_t; picture:Txcb_render_picture_t; region:Txcb_xfixes_region_t; x_origin:Tint16_t; y_origin:Tint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_set_cursor_name_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
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
function xcb_xfixes_set_cursor_name_checked(c:Pxcb_connection_t; cursor:Txcb_cursor_t; nbytes:Tuint16_t; name:Pchar):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_set_cursor_name(c:Pxcb_connection_t; cursor:Txcb_cursor_t; nbytes:Tuint16_t; name:Pchar):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_set_cursor_name_name(R:Pxcb_xfixes_set_cursor_name_request_t):Pchar;cdecl;external libxcbxxx;
function xcb_xfixes_set_cursor_name_name_length(R:Pxcb_xfixes_set_cursor_name_request_t):longint;cdecl;external libxcbxxx;
function xcb_xfixes_set_cursor_name_name_end(R:Pxcb_xfixes_set_cursor_name_request_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_name_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_get_cursor_name(c:Pxcb_connection_t; cursor:Txcb_cursor_t):Txcb_xfixes_get_cursor_name_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_get_cursor_name_unchecked(c:Pxcb_connection_t; cursor:Txcb_cursor_t):Txcb_xfixes_get_cursor_name_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_name_name(R:Pxcb_xfixes_get_cursor_name_reply_t):Pchar;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_name_name_length(R:Pxcb_xfixes_get_cursor_name_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_name_name_end(R:Pxcb_xfixes_get_cursor_name_reply_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xfixes_get_cursor_name_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xfixes_get_cursor_name_reply(c:Pxcb_connection_t; cookie:Txcb_xfixes_get_cursor_name_cookie_t; e:PPxcb_generic_error_t):Pxcb_xfixes_get_cursor_name_reply_t;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_and_name_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_get_cursor_image_and_name(c:Pxcb_connection_t):Txcb_xfixes_get_cursor_image_and_name_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_get_cursor_image_and_name_unchecked(c:Pxcb_connection_t):Txcb_xfixes_get_cursor_image_and_name_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_and_name_cursor_image(R:Pxcb_xfixes_get_cursor_image_and_name_reply_t):Puint32_t;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_and_name_cursor_image_length(R:Pxcb_xfixes_get_cursor_image_and_name_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_and_name_cursor_image_end(R:Pxcb_xfixes_get_cursor_image_and_name_reply_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_and_name_name(R:Pxcb_xfixes_get_cursor_image_and_name_reply_t):Pchar;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_and_name_name_length(R:Pxcb_xfixes_get_cursor_image_and_name_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xfixes_get_cursor_image_and_name_name_end(R:Pxcb_xfixes_get_cursor_image_and_name_reply_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xfixes_get_cursor_image_and_name_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xfixes_get_cursor_image_and_name_reply(c:Pxcb_connection_t; cookie:Txcb_xfixes_get_cursor_image_and_name_cookie_t; e:PPxcb_generic_error_t):Pxcb_xfixes_get_cursor_image_and_name_reply_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_change_cursor_checked(c:Pxcb_connection_t; source:Txcb_cursor_t; destination:Txcb_cursor_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_change_cursor(c:Pxcb_connection_t; source:Txcb_cursor_t; destination:Txcb_cursor_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_change_cursor_by_name_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
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
function xcb_xfixes_change_cursor_by_name_checked(c:Pxcb_connection_t; src:Txcb_cursor_t; nbytes:Tuint16_t; name:Pchar):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_change_cursor_by_name(c:Pxcb_connection_t; src:Txcb_cursor_t; nbytes:Tuint16_t; name:Pchar):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_change_cursor_by_name_name(R:Pxcb_xfixes_change_cursor_by_name_request_t):Pchar;cdecl;external libxcbxxx;
function xcb_xfixes_change_cursor_by_name_name_length(R:Pxcb_xfixes_change_cursor_by_name_request_t):longint;cdecl;external libxcbxxx;
function xcb_xfixes_change_cursor_by_name_name_end(R:Pxcb_xfixes_change_cursor_by_name_request_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_expand_region_checked(c:Pxcb_connection_t; source:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t; left:Tuint16_t; right:Tuint16_t; 
           top:Tuint16_t; bottom:Tuint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_expand_region(c:Pxcb_connection_t; source:Txcb_xfixes_region_t; destination:Txcb_xfixes_region_t; left:Tuint16_t; right:Tuint16_t; 
           top:Tuint16_t; bottom:Tuint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_hide_cursor_checked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_hide_cursor(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_show_cursor_checked(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_show_cursor(c:Pxcb_connection_t; window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_xfixes_barrier_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_xfixes_barrier_t)
  }
procedure xcb_xfixes_barrier_next(i:Pxcb_xfixes_barrier_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_xfixes_barrier_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_xfixes_barrier_end(i:Txcb_xfixes_barrier_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
function xcb_xfixes_create_pointer_barrier_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
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
function xcb_xfixes_create_pointer_barrier_checked(c:Pxcb_connection_t; barrier:Txcb_xfixes_barrier_t; window:Txcb_window_t; x1:Tuint16_t; y1:Tuint16_t; 
           x2:Tuint16_t; y2:Tuint16_t; directions:Tuint32_t; num_devices:Tuint16_t; devices:Puint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_create_pointer_barrier(c:Pxcb_connection_t; barrier:Txcb_xfixes_barrier_t; window:Txcb_window_t; x1:Tuint16_t; y1:Tuint16_t; 
           x2:Tuint16_t; y2:Tuint16_t; directions:Tuint32_t; num_devices:Tuint16_t; devices:Puint16_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xfixes_create_pointer_barrier_devices(R:Pxcb_xfixes_create_pointer_barrier_request_t):Puint16_t;cdecl;external libxcbxxx;
function xcb_xfixes_create_pointer_barrier_devices_length(R:Pxcb_xfixes_create_pointer_barrier_request_t):longint;cdecl;external libxcbxxx;
function xcb_xfixes_create_pointer_barrier_devices_end(R:Pxcb_xfixes_create_pointer_barrier_request_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_delete_pointer_barrier_checked(c:Pxcb_connection_t; barrier:Txcb_xfixes_barrier_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_delete_pointer_barrier(c:Pxcb_connection_t; barrier:Txcb_xfixes_barrier_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 * @brief Sets the disconnect mode for the client.
 *
 * @param c The connection
 * @param disconnect_mode The new disconnect mode.
 * @return A cookie
 *
 * No description yet
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_xfixes_set_client_disconnect_mode_checked(c:Pxcb_connection_t; disconnect_mode:Tuint32_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 * @brief Sets the disconnect mode for the client.
 *
 * @param c The connection
 * @param disconnect_mode The new disconnect mode.
 * @return A cookie
 *
 * No description yet
 *
  }
function xcb_xfixes_set_client_disconnect_mode(c:Pxcb_connection_t; disconnect_mode:Tuint32_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xfixes_get_client_disconnect_mode(c:Pxcb_connection_t):Txcb_xfixes_get_client_disconnect_mode_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xfixes_get_client_disconnect_mode_unchecked(c:Pxcb_connection_t):Txcb_xfixes_get_client_disconnect_mode_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xfixes_get_client_disconnect_mode_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xfixes_get_client_disconnect_mode_reply(c:Pxcb_connection_t; cookie:Txcb_xfixes_get_client_disconnect_mode_cookie_t; e:PPxcb_generic_error_t):Pxcb_xfixes_get_client_disconnect_mode_reply_t;cdecl;external libxcbxxx;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

// === Konventiert am: 9-10-25 20:04:07 ===


implementation



end.
