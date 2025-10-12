
unit shm;
interface

{
  Automatically converted by H2Pas 1.0.0 from shm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shm.h
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
Plongint  = ^longint;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_shm_attach_fd_request_t  = ^xcb_shm_attach_fd_request_t;
Pxcb_shm_attach_request_t  = ^xcb_shm_attach_request_t;
Pxcb_shm_bad_seg_error_t  = ^xcb_shm_bad_seg_error_t;
Pxcb_shm_completion_event_t  = ^xcb_shm_completion_event_t;
Pxcb_shm_create_pixmap_request_t  = ^xcb_shm_create_pixmap_request_t;
Pxcb_shm_create_segment_cookie_t  = ^xcb_shm_create_segment_cookie_t;
Pxcb_shm_create_segment_reply_t  = ^xcb_shm_create_segment_reply_t;
Pxcb_shm_create_segment_request_t  = ^xcb_shm_create_segment_request_t;
Pxcb_shm_detach_request_t  = ^xcb_shm_detach_request_t;
Pxcb_shm_get_image_cookie_t  = ^xcb_shm_get_image_cookie_t;
Pxcb_shm_get_image_reply_t  = ^xcb_shm_get_image_reply_t;
Pxcb_shm_get_image_request_t  = ^xcb_shm_get_image_request_t;
Pxcb_shm_put_image_request_t  = ^xcb_shm_put_image_request_t;
Pxcb_shm_query_version_cookie_t  = ^xcb_shm_query_version_cookie_t;
Pxcb_shm_query_version_reply_t  = ^xcb_shm_query_version_reply_t;
Pxcb_shm_query_version_request_t  = ^xcb_shm_query_version_request_t;
Pxcb_shm_seg_iterator_t  = ^xcb_shm_seg_iterator_t;
Pxcb_shm_seg_t  = ^xcb_shm_seg_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from shm.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Shm_API XCB Shm API
 * @brief Shm XCB Protocol Implementation.
 * @
 * }
{$ifndef __SHM_H}
{$define __SHM_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_SHM_MAJOR_VERSION = 1;  
  XCB_SHM_MINOR_VERSION = 2;  
  var
    xcb_shm_id : Txcb_extension_t;cvar;external;
type
  Pxcb_shm_seg_t = ^Txcb_shm_seg_t;
  Txcb_shm_seg_t = Tuint32_t;
{*
 * @brief xcb_shm_seg_iterator_t
 * }

  Pxcb_shm_seg_iterator_t = ^Txcb_shm_seg_iterator_t;
  Txcb_shm_seg_iterator_t = record
      data : Pxcb_shm_seg_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_shm_completion.  }

const
  XCB_SHM_COMPLETION = 0;  
{*
 * @brief xcb_shm_completion_event_t
 * }
type
  Pxcb_shm_completion_event_t = ^Txcb_shm_completion_event_t;
  Txcb_shm_completion_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      drawable : Txcb_drawable_t;
      minor_event : Tuint16_t;
      major_event : Tuint8_t;
      pad1 : Tuint8_t;
      shmseg : Txcb_shm_seg_t;
      offset : Tuint32_t;
    end;
{* Opcode for xcb_shm_bad_seg.  }

const
  XCB_SHM_BAD_SEG = 0;  
type
  Pxcb_shm_bad_seg_error_t = ^Txcb_shm_bad_seg_error_t;
  Txcb_shm_bad_seg_error_t = Txcb_value_error_t;
{*
 * @brief xcb_shm_query_version_cookie_t
 * }

  Pxcb_shm_query_version_cookie_t = ^Txcb_shm_query_version_cookie_t;
  Txcb_shm_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_shm_query_version.  }

const
  XCB_SHM_QUERY_VERSION = 0;  
{*
 * @brief xcb_shm_query_version_request_t
 * }
type
  Pxcb_shm_query_version_request_t = ^Txcb_shm_query_version_request_t;
  Txcb_shm_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_shm_query_version_reply_t
 * }

  Pxcb_shm_query_version_reply_t = ^Txcb_shm_query_version_reply_t;
  Txcb_shm_query_version_reply_t = record
      response_type : Tuint8_t;
      shared_pixmaps : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint16_t;
      minor_version : Tuint16_t;
      uid : Tuint16_t;
      gid : Tuint16_t;
      pixmap_format : Tuint8_t;
      pad0 : array[0..14] of Tuint8_t;
    end;
{* Opcode for xcb_shm_attach.  }

const
  XCB_SHM_ATTACH = 1;  
{*
 * @brief xcb_shm_attach_request_t
 * }
type
  Pxcb_shm_attach_request_t = ^Txcb_shm_attach_request_t;
  Txcb_shm_attach_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      shmseg : Txcb_shm_seg_t;
      shmid : Tuint32_t;
      read_only : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{* Opcode for xcb_shm_detach.  }

const
  XCB_SHM_DETACH = 2;  
{*
 * @brief xcb_shm_detach_request_t
 * }
type
  Pxcb_shm_detach_request_t = ^Txcb_shm_detach_request_t;
  Txcb_shm_detach_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      shmseg : Txcb_shm_seg_t;
    end;
{* Opcode for xcb_shm_put_image.  }

const
  XCB_SHM_PUT_IMAGE = 3;  
{*
 * @brief xcb_shm_put_image_request_t
 * }
type
  Pxcb_shm_put_image_request_t = ^Txcb_shm_put_image_request_t;
  Txcb_shm_put_image_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      gc : Txcb_gcontext_t;
      total_width : Tuint16_t;
      total_height : Tuint16_t;
      src_x : Tuint16_t;
      src_y : Tuint16_t;
      src_width : Tuint16_t;
      src_height : Tuint16_t;
      dst_x : Tint16_t;
      dst_y : Tint16_t;
      depth : Tuint8_t;
      format : Tuint8_t;
      send_event : Tuint8_t;
      pad0 : Tuint8_t;
      shmseg : Txcb_shm_seg_t;
      offset : Tuint32_t;
    end;
{*
 * @brief xcb_shm_get_image_cookie_t
 * }

  Pxcb_shm_get_image_cookie_t = ^Txcb_shm_get_image_cookie_t;
  Txcb_shm_get_image_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_shm_get_image.  }

const
  XCB_SHM_GET_IMAGE = 4;  
{*
 * @brief xcb_shm_get_image_request_t
 * }
type
  Pxcb_shm_get_image_request_t = ^Txcb_shm_get_image_request_t;
  Txcb_shm_get_image_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      drawable : Txcb_drawable_t;
      x : Tint16_t;
      y : Tint16_t;
      width : Tuint16_t;
      height : Tuint16_t;
      plane_mask : Tuint32_t;
      format : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      shmseg : Txcb_shm_seg_t;
      offset : Tuint32_t;
    end;
{*
 * @brief xcb_shm_get_image_reply_t
 * }

  Pxcb_shm_get_image_reply_t = ^Txcb_shm_get_image_reply_t;
  Txcb_shm_get_image_reply_t = record
      response_type : Tuint8_t;
      depth : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      visual : Txcb_visualid_t;
      size : Tuint32_t;
    end;
{* Opcode for xcb_shm_create_pixmap.  }

const
  XCB_SHM_CREATE_PIXMAP = 5;  
{*
 * @brief xcb_shm_create_pixmap_request_t
 * }
type
  Pxcb_shm_create_pixmap_request_t = ^Txcb_shm_create_pixmap_request_t;
  Txcb_shm_create_pixmap_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      pid : Txcb_pixmap_t;
      drawable : Txcb_drawable_t;
      width : Tuint16_t;
      height : Tuint16_t;
      depth : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
      shmseg : Txcb_shm_seg_t;
      offset : Tuint32_t;
    end;
{* Opcode for xcb_shm_attach_fd.  }

const
  XCB_SHM_ATTACH_FD = 6;  
{*
 * @brief xcb_shm_attach_fd_request_t
 * }
type
  Pxcb_shm_attach_fd_request_t = ^Txcb_shm_attach_fd_request_t;
  Txcb_shm_attach_fd_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      shmseg : Txcb_shm_seg_t;
      read_only : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{*
 * @brief xcb_shm_create_segment_cookie_t
 * }

  Pxcb_shm_create_segment_cookie_t = ^Txcb_shm_create_segment_cookie_t;
  Txcb_shm_create_segment_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_shm_create_segment.  }

const
  XCB_SHM_CREATE_SEGMENT = 7;  
{*
 * @brief xcb_shm_create_segment_request_t
 * }
type
  Pxcb_shm_create_segment_request_t = ^Txcb_shm_create_segment_request_t;
  Txcb_shm_create_segment_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      shmseg : Txcb_shm_seg_t;
      size : Tuint32_t;
      read_only : Tuint8_t;
      pad0 : array[0..2] of Tuint8_t;
    end;
{*
 * @brief xcb_shm_create_segment_reply_t
 * }

  Pxcb_shm_create_segment_reply_t = ^Txcb_shm_create_segment_reply_t;
  Txcb_shm_create_segment_reply_t = record
      response_type : Tuint8_t;
      nfd : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad0 : array[0..23] of Tuint8_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_shm_seg_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_shm_seg_t)
  }

procedure xcb_shm_seg_next(i:Pxcb_shm_seg_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_shm_seg_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_shm_seg_end(i:Txcb_shm_seg_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * @brief Query the version of the MIT-SHM extension.
 *
 * @param c The connection
 * @return A cookie
 *
 * This is used to determine the version of the MIT-SHM extension supported by the
 * X server.  Clients MUST NOT make other requests in this extension until a reply
 * to this requests indicates the X server supports them.
 *
  }
function xcb_shm_query_version(c:Pxcb_connection_t):Txcb_shm_query_version_cookie_t;cdecl;external;
{*
 * @brief Query the version of the MIT-SHM extension.
 *
 * @param c The connection
 * @return A cookie
 *
 * This is used to determine the version of the MIT-SHM extension supported by the
 * X server.  Clients MUST NOT make other requests in this extension until a reply
 * to this requests indicates the X server supports them.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_shm_query_version_unchecked(c:Pxcb_connection_t):Txcb_shm_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_shm_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_shm_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_shm_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_shm_query_version_reply_t;cdecl;external;
{*
 * @brief Attach a System V shared memory segment.
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param shmid The System V shared memory segment the server should map.
 * @param read_only True if the segment shall be mapped read only by the X11 server, otherwise false.
 * @return A cookie
 *
 * Attach a System V shared memory segment to the server.  This will fail unless
 * the server has permission to map the segment.  The client may destroy the segment
 * as soon as it receives a XCB_SHM_COMPLETION event with the shmseg value in this
 * request and with the appropriate serial number.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_shm_attach_checked(c:Pxcb_connection_t; shmseg:Txcb_shm_seg_t; shmid:Tuint32_t; read_only:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Attach a System V shared memory segment.
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param shmid The System V shared memory segment the server should map.
 * @param read_only True if the segment shall be mapped read only by the X11 server, otherwise false.
 * @return A cookie
 *
 * Attach a System V shared memory segment to the server.  This will fail unless
 * the server has permission to map the segment.  The client may destroy the segment
 * as soon as it receives a XCB_SHM_COMPLETION event with the shmseg value in this
 * request and with the appropriate serial number.
 *
  }
function xcb_shm_attach(c:Pxcb_connection_t; shmseg:Txcb_shm_seg_t; shmid:Tuint32_t; read_only:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Destroys the specified shared memory segment.
 *
 * @param c The connection
 * @param shmseg The segment to be destroyed.
 * @return A cookie
 *
 * Destroys the specified shared memory segment.  This will never fail unless the
 * segment number is incorrect.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_shm_detach_checked(c:Pxcb_connection_t; shmseg:Txcb_shm_seg_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Destroys the specified shared memory segment.
 *
 * @param c The connection
 * @param shmseg The segment to be destroyed.
 * @return A cookie
 *
 * Destroys the specified shared memory segment.  This will never fail unless the
 * segment number is incorrect.
 *
  }
function xcb_shm_detach(c:Pxcb_connection_t; shmseg:Txcb_shm_seg_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Copy data from the shared memory to the specified drawable.
 *
 * @param c The connection
 * @param drawable The drawable to draw to.
 * @param gc The graphics context to use.
 * @param total_width The total width of the source image.
 * @param total_height The total height of the source image.
 * @param src_x The source X coordinate of the sub-image to copy.
 * @param src_y The source Y coordinate of the sub-image to copy.
 * @param src_width The width, in source image coordinates, of the data to copy from the source.
 * The X server will use this to determine the amount of data to copy.  The amount
 * of the destination image that is overwritten is determined automatically.
 * @param src_height The height, in source image coordinates, of the data to copy from the source.
 * The X server will use this to determine the amount of data to copy.  The amount
 * of the destination image that is overwritten is determined automatically.
 * @param dst_x The X coordinate on the destination drawable to copy to.
 * @param dst_y The Y coordinate on the destination drawable to copy to.
 * @param depth The depth to use.
 * @param format The format of the image being drawn.  If it is XYBitmap, depth must be 1, or a
 * “BadMatch” error results.  The foreground pixel in the GC determines the source
 * for the one bits in the image, and the background pixel determines the source
 * for the zero bits.  For XYPixmap and ZPixmap, the depth must match the depth of
 * the drawable, or a “BadMatch” error results.
 * @param send_event True if the server should send an XCB_SHM_COMPLETION event when the blit
 * completes.
 * @param offset The offset that the source image starts at.
 * @return A cookie
 *
 * Copy data from the shared memory to the specified drawable.  The amount of bytes
 * written to the destination image is always equal to the number of bytes read
 * from the shared memory segment.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_shm_put_image_checked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; total_width:Tuint16_t; total_height:Tuint16_t; 
           src_x:Tuint16_t; src_y:Tuint16_t; src_width:Tuint16_t; src_height:Tuint16_t; dst_x:Tint16_t; 
           dst_y:Tint16_t; depth:Tuint8_t; format:Tuint8_t; send_event:Tuint8_t; shmseg:Txcb_shm_seg_t; 
           offset:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Copy data from the shared memory to the specified drawable.
 *
 * @param c The connection
 * @param drawable The drawable to draw to.
 * @param gc The graphics context to use.
 * @param total_width The total width of the source image.
 * @param total_height The total height of the source image.
 * @param src_x The source X coordinate of the sub-image to copy.
 * @param src_y The source Y coordinate of the sub-image to copy.
 * @param src_width The width, in source image coordinates, of the data to copy from the source.
 * The X server will use this to determine the amount of data to copy.  The amount
 * of the destination image that is overwritten is determined automatically.
 * @param src_height The height, in source image coordinates, of the data to copy from the source.
 * The X server will use this to determine the amount of data to copy.  The amount
 * of the destination image that is overwritten is determined automatically.
 * @param dst_x The X coordinate on the destination drawable to copy to.
 * @param dst_y The Y coordinate on the destination drawable to copy to.
 * @param depth The depth to use.
 * @param format The format of the image being drawn.  If it is XYBitmap, depth must be 1, or a
 * “BadMatch” error results.  The foreground pixel in the GC determines the source
 * for the one bits in the image, and the background pixel determines the source
 * for the zero bits.  For XYPixmap and ZPixmap, the depth must match the depth of
 * the drawable, or a “BadMatch” error results.
 * @param send_event True if the server should send an XCB_SHM_COMPLETION event when the blit
 * completes.
 * @param offset The offset that the source image starts at.
 * @return A cookie
 *
 * Copy data from the shared memory to the specified drawable.  The amount of bytes
 * written to the destination image is always equal to the number of bytes read
 * from the shared memory segment.
 *
  }
function xcb_shm_put_image(c:Pxcb_connection_t; drawable:Txcb_drawable_t; gc:Txcb_gcontext_t; total_width:Tuint16_t; total_height:Tuint16_t; 
           src_x:Tuint16_t; src_y:Tuint16_t; src_width:Tuint16_t; src_height:Tuint16_t; dst_x:Tint16_t; 
           dst_y:Tint16_t; depth:Tuint8_t; format:Tuint8_t; send_event:Tuint8_t; shmseg:Txcb_shm_seg_t; 
           offset:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Copies data from the specified drawable to the shared memory segment.
 *
 * @param c The connection
 * @param drawable The drawable to copy the image out of.
 * @param x The X coordinate in the drawable to begin copying at.
 * @param y The Y coordinate in the drawable to begin copying at.
 * @param width The width of the image to copy.
 * @param height The height of the image to copy.
 * @param plane_mask A mask that determines which planes are used.
 * @param format The format to use for the copy (???).
 * @param shmseg The destination shared memory segment.
 * @param offset The offset in the shared memory segment to copy data to.
 * @return A cookie
 *
 * Copy data from the specified drawable to the shared memory segment.  The amount
 * of bytes written to the destination image is always equal to the number of bytes
 * read from the shared memory segment.
 *
  }
function xcb_shm_get_image(c:Pxcb_connection_t; drawable:Txcb_drawable_t; x:Tint16_t; y:Tint16_t; width:Tuint16_t; 
           height:Tuint16_t; plane_mask:Tuint32_t; format:Tuint8_t; shmseg:Txcb_shm_seg_t; offset:Tuint32_t):Txcb_shm_get_image_cookie_t;cdecl;external;
{*
 * @brief Copies data from the specified drawable to the shared memory segment.
 *
 * @param c The connection
 * @param drawable The drawable to copy the image out of.
 * @param x The X coordinate in the drawable to begin copying at.
 * @param y The Y coordinate in the drawable to begin copying at.
 * @param width The width of the image to copy.
 * @param height The height of the image to copy.
 * @param plane_mask A mask that determines which planes are used.
 * @param format The format to use for the copy (???).
 * @param shmseg The destination shared memory segment.
 * @param offset The offset in the shared memory segment to copy data to.
 * @return A cookie
 *
 * Copy data from the specified drawable to the shared memory segment.  The amount
 * of bytes written to the destination image is always equal to the number of bytes
 * read from the shared memory segment.
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_shm_get_image_unchecked(c:Pxcb_connection_t; drawable:Txcb_drawable_t; x:Tint16_t; y:Tint16_t; width:Tuint16_t; 
           height:Tuint16_t; plane_mask:Tuint32_t; format:Tuint8_t; shmseg:Txcb_shm_seg_t; offset:Tuint32_t):Txcb_shm_get_image_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_shm_get_image_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_shm_get_image_reply(c:Pxcb_connection_t; cookie:Txcb_shm_get_image_cookie_t; e:PPxcb_generic_error_t):Pxcb_shm_get_image_reply_t;cdecl;external;
{*
 * @brief Create a pixmap backed by shared memory.
 *
 * @param c The connection
 * @param pid A pixmap ID created with xcb_generate_id().
 * @param drawable The drawable to create the pixmap in.
 * @param width The width of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param height The height of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param depth The depth of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param shmseg The shared memory segment to use to create the pixmap.
 * @param offset The offset in the segment to create the pixmap at.
 * @return A cookie
 *
 * Create a pixmap backed by shared memory.  Writes to the shared memory will be
 * reflected in the contents of the pixmap, and writes to the pixmap will be
 * reflected in the contents of the shared memory.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_shm_create_pixmap_checked(c:Pxcb_connection_t; pid:Txcb_pixmap_t; drawable:Txcb_drawable_t; width:Tuint16_t; height:Tuint16_t; 
           depth:Tuint8_t; shmseg:Txcb_shm_seg_t; offset:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Create a pixmap backed by shared memory.
 *
 * @param c The connection
 * @param pid A pixmap ID created with xcb_generate_id().
 * @param drawable The drawable to create the pixmap in.
 * @param width The width of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param height The height of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param depth The depth of the pixmap to create.  Must be nonzero, or a Value error results.
 * @param shmseg The shared memory segment to use to create the pixmap.
 * @param offset The offset in the segment to create the pixmap at.
 * @return A cookie
 *
 * Create a pixmap backed by shared memory.  Writes to the shared memory will be
 * reflected in the contents of the pixmap, and writes to the pixmap will be
 * reflected in the contents of the shared memory.
 *
  }
function xcb_shm_create_pixmap(c:Pxcb_connection_t; pid:Txcb_pixmap_t; drawable:Txcb_drawable_t; width:Tuint16_t; height:Tuint16_t; 
           depth:Tuint8_t; shmseg:Txcb_shm_seg_t; offset:Tuint32_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Create a shared memory segment
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param shm_fd The file descriptor the server should mmap().
 * @param read_only True if the segment shall be mapped read only by the X11 server, otherwise false.
 * @return A cookie
 *
 * Create a shared memory segment.  The file descriptor will be mapped at offset
 * zero, and the size will be obtained using fstat().  A zero size will result in a
 * Value error.
 *
 * This form can be used only if the request will not cause
 * a reply to be generated. Any returned error will be
 * saved for handling by xcb_request_check().
  }
function xcb_shm_attach_fd_checked(c:Pxcb_connection_t; shmseg:Txcb_shm_seg_t; shm_fd:Tint32_t; read_only:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Create a shared memory segment
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param shm_fd The file descriptor the server should mmap().
 * @param read_only True if the segment shall be mapped read only by the X11 server, otherwise false.
 * @return A cookie
 *
 * Create a shared memory segment.  The file descriptor will be mapped at offset
 * zero, and the size will be obtained using fstat().  A zero size will result in a
 * Value error.
 *
  }
function xcb_shm_attach_fd(c:Pxcb_connection_t; shmseg:Txcb_shm_seg_t; shm_fd:Tint32_t; read_only:Tuint8_t):Txcb_void_cookie_t;cdecl;external;
{*
 * @brief Asks the server to allocate a shared memory segment.
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param size The size of the segment to create.
 * @param read_only True if the server should map the segment read-only; otherwise false.
 * @return A cookie
 *
 * Asks the server to allocate a shared memory segment.  The server’s reply will
 * include a file descriptor for the client to pass to mmap().
 *
  }
function xcb_shm_create_segment(c:Pxcb_connection_t; shmseg:Txcb_shm_seg_t; size:Tuint32_t; read_only:Tuint8_t):Txcb_shm_create_segment_cookie_t;cdecl;external;
{*
 * @brief Asks the server to allocate a shared memory segment.
 *
 * @param c The connection
 * @param shmseg A shared memory segment ID created with xcb_generate_id().
 * @param size The size of the segment to create.
 * @param read_only True if the server should map the segment read-only; otherwise false.
 * @return A cookie
 *
 * Asks the server to allocate a shared memory segment.  The server’s reply will
 * include a file descriptor for the client to pass to mmap().
 *
 * This form can be used only if the request will cause
 * a reply to be generated. Any returned error will be
 * placed in the event queue.
  }
function xcb_shm_create_segment_unchecked(c:Pxcb_connection_t; shmseg:Txcb_shm_seg_t; size:Tuint32_t; read_only:Tuint8_t):Txcb_shm_create_segment_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_shm_create_segment_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_shm_create_segment_reply(c:Pxcb_connection_t; cookie:Txcb_shm_create_segment_cookie_t; e:PPxcb_generic_error_t):Pxcb_shm_create_segment_reply_t;cdecl;external;
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
{*<  }function xcb_shm_create_segment_reply_fds(c:Pxcb_connection_t; reply:Pxcb_shm_create_segment_reply_t):Plongint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
