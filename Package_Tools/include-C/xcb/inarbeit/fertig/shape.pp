
unit shape;
interface

{
  Automatically converted by H2Pas 1.0.0 from shape.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shape.h
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
Pxcb_rectangle_t  = ^xcb_rectangle_t;
Pxcb_shape_combine_request_t  = ^xcb_shape_combine_request_t;
Pxcb_shape_get_rectangles_cookie_t  = ^xcb_shape_get_rectangles_cookie_t;
Pxcb_shape_get_rectangles_reply_t  = ^xcb_shape_get_rectangles_reply_t;
Pxcb_shape_get_rectangles_request_t  = ^xcb_shape_get_rectangles_request_t;
Pxcb_shape_input_selected_cookie_t  = ^xcb_shape_input_selected_cookie_t;
Pxcb_shape_input_selected_reply_t  = ^xcb_shape_input_selected_reply_t;
Pxcb_shape_input_selected_request_t  = ^xcb_shape_input_selected_request_t;
Pxcb_shape_kind_iterator_t  = ^xcb_shape_kind_iterator_t;
Pxcb_shape_kind_t  = ^xcb_shape_kind_t;
Pxcb_shape_mask_request_t  = ^xcb_shape_mask_request_t;
Pxcb_shape_notify_event_t  = ^xcb_shape_notify_event_t;
Pxcb_shape_offset_request_t  = ^xcb_shape_offset_request_t;
Pxcb_shape_op_iterator_t  = ^xcb_shape_op_iterator_t;
Pxcb_shape_op_t  = ^xcb_shape_op_t;
Pxcb_shape_query_extents_cookie_t  = ^xcb_shape_query_extents_cookie_t;
Pxcb_shape_query_extents_reply_t  = ^xcb_shape_query_extents_reply_t;
Pxcb_shape_query_extents_request_t  = ^xcb_shape_query_extents_request_t;
Pxcb_shape_query_version_cookie_t  = ^xcb_shape_query_version_cookie_t;
Pxcb_shape_query_version_reply_t  = ^xcb_shape_query_version_reply_t;
Pxcb_shape_query_version_request_t  = ^xcb_shape_query_version_request_t;
Pxcb_shape_rectangles_request_t  = ^xcb_shape_rectangles_request_t;
Pxcb_shape_select_input_request_t  = ^xcb_shape_select_input_request_t;
Pxcb_shape_sk_t  = ^xcb_shape_sk_t;
Pxcb_shape_so_t  = ^xcb_shape_so_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from shape.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Shape_API XCB Shape API
 * @brief Shape XCB Protocol Implementation.
 * @
 * }
{$ifndef __SHAPE_H}
{$define __SHAPE_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_SHAPE_MAJOR_VERSION = 1;  
  XCB_SHAPE_MINOR_VERSION = 1;  
  var
    xcb_shape_id : Txcb_extension_t;cvar;external;
type
  Pxcb_shape_op_t = ^Txcb_shape_op_t;
  Txcb_shape_op_t = Tuint8_t;
{*
 * @brief xcb_shape_op_iterator_t
 * }

  Pxcb_shape_op_iterator_t = ^Txcb_shape_op_iterator_t;
  Txcb_shape_op_iterator_t = record
      data : Pxcb_shape_op_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_shape_kind_t = ^Txcb_shape_kind_t;
  Txcb_shape_kind_t = Tuint8_t;
{*
 * @brief xcb_shape_kind_iterator_t
 * }

  Pxcb_shape_kind_iterator_t = ^Txcb_shape_kind_iterator_t;
  Txcb_shape_kind_iterator_t = record
      data : Pxcb_shape_kind_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_shape_so_t = ^Txcb_shape_so_t;
  Txcb_shape_so_t =  Longint;
  Const
    XCB_SHAPE_SO_SET = 0;
    XCB_SHAPE_SO_UNION = 1;
    XCB_SHAPE_SO_INTERSECT = 2;
    XCB_SHAPE_SO_SUBTRACT = 3;
    XCB_SHAPE_SO_INVERT = 4;
;
type
  Pxcb_shape_sk_t = ^Txcb_shape_sk_t;
  Txcb_shape_sk_t =  Longint;
  Const
    XCB_SHAPE_SK_BOUNDING = 0;
    XCB_SHAPE_SK_CLIP = 1;
    XCB_SHAPE_SK_INPUT = 2;
;
{* Opcode for xcb_shape_notify.  }
  XCB_SHAPE_NOTIFY = 0;  
{*
 * @brief xcb_shape_notify_event_t
 * }
type
  Pxcb_shape_notify_event_t = ^Txcb_shape_notify_event_t;
  Txcb_shape_notify_event_t = record
      response_type : Tuint8_t;
      shape_kind : Txcb_shape_kind_t;
      sequence : Tuint16_t;
      affected_window : Txcb_window_t;
      extents_x : Tint16_t;
      extents_y : Tint16_t;
      extents_width : Tuint16_t;
      extents_height : Tuint16_t;
      server_time : Txcb_timestamp_t;
      shaped : Tuint8_t;
      pad0 : array[0..10] of Tuint8_t;
    end;
{*
 * @brief xcb_shape_query_version_cookie_t
 * }

  Pxcb_shape_query_version_cookie_t = ^Txcb_shape_query_version_cookie_t;
  Txcb_shape_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_shape_query_version.  }

const
  XCB_SHAPE_QUERY_VERSION = 0;  
{*
 * @brief xcb_shape_query_version_request_t
 * }
type
  Pxcb_shape_query_version_request_t = ^Txcb_shape_query_version_request_t;
  Txcb_shape_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_shape_query_version_reply_t
 * }

  Pxcb_shape_query_version_reply_t = ^Txcb_shape_query_version_reply_t;
  Txcb_shape_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint16_t;
      minor_version : Tuint16_t;
    end;
{* Opcode for xcb_shape_rectangles.  }

const
  XCB_SHAPE_RECTANGLES = 1;  
{*
 * @brief xcb_shape_rectangles_request_t
 * }
type
  Pxcb_shape_rectangles_request_t = ^Txcb_shape_rectangles_request_t;
  Txcb_shape_rectangles_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      operation : Txcb_shape_op_t;
      destination_kind : Txcb_shape_kind_t;
      ordering : Tuint8_t;
      pad0 : Tuint8_t;
      destination_window : Txcb_window_t;
      x_offset : Tint16_t;
      y_offset : Tint16_t;
    end;
{* Opcode for xcb_shape_mask.  }

const
  XCB_SHAPE_MASK = 2;  
{*
 * @brief xcb_shape_mask_request_t
 * }
type
  Pxcb_shape_mask_request_t = ^Txcb_shape_mask_request_t;
  Txcb_shape_mask_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      operation : Txcb_shape_op_t;
      destination_kind : Txcb_shape_kind_t;
      pad0 : array[0..1] of Tuint8_t;
      destination_window : Txcb_window_t;
      x_offset : Tint16_t;
      y_offset : Tint16_t;
      source_bitmap : Txcb_pixmap_t;
    end;
{* Opcode for xcb_shape_combine.  }

const
  XCB_SHAPE_COMBINE = 3;  
{*
 * @brief xcb_shape_combine_request_t
 * }
type
  Pxcb_shape_combine_request_t = ^Txcb_shape_combine_request_t;
  Txcb_shape_combine_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      operation : Txcb_shape_op_t;
      destination_kind : Txcb_shape_kind_t;
      source_kind : Txcb_shape_kind_t;
      pad0 : Tuint8_t;
      destination_window : Txcb_window_t;
      x_offset : Tint16_t;
      y_offset : Tint16_t;
      source_window : Txcb_window_t;
    end;
{* Opcode for xcb_shape_offset.  }

const
  XCB_SHAPE_OFFSET = 4;  
{*
 * @brief xcb_shape_offset_request_t
 * }
type
  Pxcb_shape_offset_request_t = ^Txcb_shape_offset_request_t;
  Txcb_shape_offset_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      destination_kind : Txcb_shape_kind_t;
      pad0 : array[0..2] of Tuint8_t;
      destination_window : Txcb_window_t;
      x_offset : Tint16_t;
      y_offset : Tint16_t;
    end;
{*
 * @brief xcb_shape_query_extents_cookie_t
 * }

  Pxcb_shape_query_extents_cookie_t = ^Txcb_shape_query_extents_cookie_t;
  Txcb_shape_query_extents_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_shape_query_extents.  }

const
  XCB_SHAPE_QUERY_EXTENTS = 5;  
{*
 * @brief xcb_shape_query_extents_request_t
 * }
type
  Pxcb_shape_query_extents_request_t = ^Txcb_shape_query_extents_request_t;
  Txcb_shape_query_extents_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      destination_window : Txcb_window_t;
    end;
{*
 * @brief xcb_shape_query_extents_reply_t
 * }

  Pxcb_shape_query_extents_reply_t = ^Txcb_shape_query_extents_reply_t;
  Txcb_shape_query_extents_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      bounding_shaped : Tuint8_t;
      clip_shaped : Tuint8_t;
      pad1 : array[0..1] of Tuint8_t;
      bounding_shape_extents_x : Tint16_t;
      bounding_shape_extents_y : Tint16_t;
      bounding_shape_extents_width : Tuint16_t;
      bounding_shape_extents_height : Tuint16_t;
      clip_shape_extents_x : Tint16_t;
      clip_shape_extents_y : Tint16_t;
      clip_shape_extents_width : Tuint16_t;
      clip_shape_extents_height : Tuint16_t;
    end;
{* Opcode for xcb_shape_select_input.  }

const
  XCB_SHAPE_SELECT_INPUT = 6;  
{*
 * @brief xcb_shape_select_input_request_t
 * }
type
  Pxcb_shape_select_input_request_t = ^Txcb_shape_select_input_request_t;
  Txcb_shape_select_input_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      destination_window : Txcb_window_t;
      enable : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{*
 * @brief xcb_shape_input_selected_cookie_t
 * }

  Pxcb_shape_input_selected_cookie_t = ^Txcb_shape_input_selected_cookie_t;
  Txcb_shape_input_selected_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_shape_input_selected.  }

const
  XCB_SHAPE_INPUT_SELECTED = 7;  
{*
 * @brief xcb_shape_input_selected_request_t
 * }
type
  Pxcb_shape_input_selected_request_t = ^Txcb_shape_input_selected_request_t;
  Txcb_shape_input_selected_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      destination_window : Txcb_window_t;
    end;
{*
 * @brief xcb_shape_input_selected_reply_t
 * }

  Pxcb_shape_input_selected_reply_t = ^Txcb_shape_input_selected_reply_t;
  Txcb_shape_input_selected_reply_t = record
      response_type : Tuint8_t;
      enabled : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
    end;
{*
 * @brief xcb_shape_get_rectangles_cookie_t
 * }

  Pxcb_shape_get_rectangles_cookie_t = ^Txcb_shape_get_rectangles_cookie_t;
  Txcb_shape_get_rectangles_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_shape_get_rectangles.  }

const
  XCB_SHAPE_GET_RECTANGLES = 8;  
{*
 * @brief xcb_shape_get_rectangles_request_t
 * }
type
  Pxcb_shape_get_rectangles_request_t = ^Txcb_shape_get_rectangles_request_t;
  Txcb_shape_get_rectangles_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      window : Txcb_window_t;
      source_kind : Txcb_shape_kind_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{*
 * @brief xcb_shape_get_rectangles_reply_t
 * }

  Pxcb_shape_get_rectangles_reply_t = ^Txcb_shape_get_rectangles_reply_t;
  Txcb_shape_get_rectangles_reply_t = record
      response_type : Tuint8_t;
      ordering : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      rectangles_len : Tuint32_t;
      pad0 : array[0..19] of Tuint8_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_shape_op_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_shape_op_t)
  }

procedure xcb_shape_op_next(i:Pxcb_shape_op_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_shape_op_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_shape_op_end(i:Txcb_shape_op_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_shape_kind_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_shape_kind_t)
  }
procedure xcb_shape_kind_next(i:Pxcb_shape_kind_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_shape_kind_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_shape_kind_end(i:Txcb_shape_kind_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_shape_query_version(c:Pxcb_connection_t):Txcb_shape_query_version_cookie_t;cdecl;external;
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
function xcb_shape_query_version_unchecked(c:Pxcb_connection_t):Txcb_shape_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_shape_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_shape_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_shape_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_shape_query_version_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_shape_rectangles_sizeof(_buffer:pointer; rectangles_len:Tuint32_t):longint;cdecl;external;
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
function xcb_shape_rectangles_checked(c:Pxcb_connection_t; operation:Txcb_shape_op_t; destination_kind:Txcb_shape_kind_t; ordering:Tuint8_t; destination_window:Txcb_window_t; 
           x_offset:Tint16_t; y_offset:Tint16_t; rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_shape_rectangles(c:Pxcb_connection_t; operation:Txcb_shape_op_t; destination_kind:Txcb_shape_kind_t; ordering:Tuint8_t; destination_window:Txcb_window_t; 
           x_offset:Tint16_t; y_offset:Tint16_t; rectangles_len:Tuint32_t; rectangles:Pxcb_rectangle_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_shape_rectangles_rectangles(R:Pxcb_shape_rectangles_request_t):Pxcb_rectangle_t;cdecl;external;
(* Const before type ignored *)
function xcb_shape_rectangles_rectangles_length(R:Pxcb_shape_rectangles_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_shape_rectangles_rectangles_iterator(R:Pxcb_shape_rectangles_request_t):Txcb_rectangle_iterator_t;cdecl;external;
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
function xcb_shape_mask_checked(c:Pxcb_connection_t; operation:Txcb_shape_op_t; destination_kind:Txcb_shape_kind_t; destination_window:Txcb_window_t; x_offset:Tint16_t; 
           y_offset:Tint16_t; source_bitmap:Txcb_pixmap_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_shape_mask(c:Pxcb_connection_t; operation:Txcb_shape_op_t; destination_kind:Txcb_shape_kind_t; destination_window:Txcb_window_t; x_offset:Tint16_t; 
           y_offset:Tint16_t; source_bitmap:Txcb_pixmap_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_shape_combine_checked(c:Pxcb_connection_t; operation:Txcb_shape_op_t; destination_kind:Txcb_shape_kind_t; source_kind:Txcb_shape_kind_t; destination_window:Txcb_window_t; 
           x_offset:Tint16_t; y_offset:Tint16_t; source_window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_shape_combine(c:Pxcb_connection_t; operation:Txcb_shape_op_t; destination_kind:Txcb_shape_kind_t; source_kind:Txcb_shape_kind_t; destination_window:Txcb_window_t; 
           x_offset:Tint16_t; y_offset:Tint16_t; source_window:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_shape_offset_checked(c:Pxcb_connection_t; destination_kind:Txcb_shape_kind_t; destination_window:Txcb_window_t; x_offset:Tint16_t; y_offset:Tint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_shape_offset(c:Pxcb_connection_t; destination_kind:Txcb_shape_kind_t; destination_window:Txcb_window_t; x_offset:Tint16_t; y_offset:Tint16_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_shape_query_extents(c:Pxcb_connection_t; destination_window:Txcb_window_t):Txcb_shape_query_extents_cookie_t;cdecl;external;
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
function xcb_shape_query_extents_unchecked(c:Pxcb_connection_t; destination_window:Txcb_window_t):Txcb_shape_query_extents_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_shape_query_extents_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_shape_query_extents_reply(c:Pxcb_connection_t; cookie:Txcb_shape_query_extents_cookie_t; e:PPxcb_generic_error_t):Pxcb_shape_query_extents_reply_t;cdecl;external;
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
function xcb_shape_select_input_checked(c:Pxcb_connection_t; destination_window:Txcb_window_t; enable:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_shape_select_input(c:Pxcb_connection_t; destination_window:Txcb_window_t; enable:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_shape_input_selected(c:Pxcb_connection_t; destination_window:Txcb_window_t):Txcb_shape_input_selected_cookie_t;cdecl;external;
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
function xcb_shape_input_selected_unchecked(c:Pxcb_connection_t; destination_window:Txcb_window_t):Txcb_shape_input_selected_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_shape_input_selected_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_shape_input_selected_reply(c:Pxcb_connection_t; cookie:Txcb_shape_input_selected_cookie_t; e:PPxcb_generic_error_t):Pxcb_shape_input_selected_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_shape_get_rectangles_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_shape_get_rectangles(c:Pxcb_connection_t; window:Txcb_window_t; source_kind:Txcb_shape_kind_t):Txcb_shape_get_rectangles_cookie_t;cdecl;external;
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
function xcb_shape_get_rectangles_unchecked(c:Pxcb_connection_t; window:Txcb_window_t; source_kind:Txcb_shape_kind_t):Txcb_shape_get_rectangles_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_shape_get_rectangles_rectangles(R:Pxcb_shape_get_rectangles_reply_t):Pxcb_rectangle_t;cdecl;external;
(* Const before type ignored *)
function xcb_shape_get_rectangles_rectangles_length(R:Pxcb_shape_get_rectangles_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_shape_get_rectangles_rectangles_iterator(R:Pxcb_shape_get_rectangles_reply_t):Txcb_rectangle_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_shape_get_rectangles_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_shape_get_rectangles_reply(c:Pxcb_connection_t; cookie:Txcb_shape_get_rectangles_cookie_t; e:PPxcb_generic_error_t):Pxcb_shape_get_rectangles_reply_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
