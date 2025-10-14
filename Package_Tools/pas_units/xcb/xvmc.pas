unit xvmc;

interface

uses
  fp_xcb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from xvmc.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_XvMC_API XCB XvMC API
 * @brief XvMC XCB Protocol Implementation.
 * @
 * }
{$ifndef __XVMC_H}
{$define __XVMC_H}
{$include "xcb.h"}
{$include "xv.h"}
{ C++ extern C conditionnal removed }

const
  XCB_XVMC_MAJOR_VERSION = 1;  
  XCB_XVMC_MINOR_VERSION = 1;  
  var
    xcb_xvmc_id : Txcb_extension_t;cvar;external libxcbxxx;
type
  Pxcb_xvmc_context_t = ^Txcb_xvmc_context_t;
  Txcb_xvmc_context_t = Tuint32_t;
{*
 * @brief xcb_xvmc_context_iterator_t
 * }

  Pxcb_xvmc_context_iterator_t = ^Txcb_xvmc_context_iterator_t;
  Txcb_xvmc_context_iterator_t = record
      data : Pxcb_xvmc_context_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_xvmc_surface_t = ^Txcb_xvmc_surface_t;
  Txcb_xvmc_surface_t = Tuint32_t;
{*
 * @brief xcb_xvmc_surface_iterator_t
 * }

  Pxcb_xvmc_surface_iterator_t = ^Txcb_xvmc_surface_iterator_t;
  Txcb_xvmc_surface_iterator_t = record
      data : Pxcb_xvmc_surface_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_xvmc_subpicture_t = ^Txcb_xvmc_subpicture_t;
  Txcb_xvmc_subpicture_t = Tuint32_t;
{*
 * @brief xcb_xvmc_subpicture_iterator_t
 * }

  Pxcb_xvmc_subpicture_iterator_t = ^Txcb_xvmc_subpicture_iterator_t;
  Txcb_xvmc_subpicture_iterator_t = record
      data : Pxcb_xvmc_subpicture_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_xvmc_surface_info_t
 * }

  Pxcb_xvmc_surface_info_t = ^Txcb_xvmc_surface_info_t;
  Txcb_xvmc_surface_info_t = record
      id : Txcb_xvmc_surface_t;
      chroma_format : Tuint16_t;
      pad0 : Tuint16_t;
      max_width : Tuint16_t;
      max_height : Tuint16_t;
      subpicture_max_width : Tuint16_t;
      subpicture_max_height : Tuint16_t;
      mc_type : Tuint32_t;
      flags : Tuint32_t;
    end;
{*
 * @brief xcb_xvmc_surface_info_iterator_t
 * }

  Pxcb_xvmc_surface_info_iterator_t = ^Txcb_xvmc_surface_info_iterator_t;
  Txcb_xvmc_surface_info_iterator_t = record
      data : Pxcb_xvmc_surface_info_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_xvmc_query_version_cookie_t
 * }

  Pxcb_xvmc_query_version_cookie_t = ^Txcb_xvmc_query_version_cookie_t;
  Txcb_xvmc_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xvmc_query_version.  }

const
  XCB_XVMC_QUERY_VERSION = 0;  
{*
 * @brief xcb_xvmc_query_version_request_t
 * }
type
  Pxcb_xvmc_query_version_request_t = ^Txcb_xvmc_query_version_request_t;
  Txcb_xvmc_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_xvmc_query_version_reply_t
 * }

  Pxcb_xvmc_query_version_reply_t = ^Txcb_xvmc_query_version_reply_t;
  Txcb_xvmc_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major : Tuint32_t;
      minor : Tuint32_t;
    end;
{*
 * @brief xcb_xvmc_list_surface_types_cookie_t
 * }

  Pxcb_xvmc_list_surface_types_cookie_t = ^Txcb_xvmc_list_surface_types_cookie_t;
  Txcb_xvmc_list_surface_types_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xvmc_list_surface_types.  }

const
  XCB_XVMC_LIST_SURFACE_TYPES = 1;  
{*
 * @brief xcb_xvmc_list_surface_types_request_t
 * }
type
  Pxcb_xvmc_list_surface_types_request_t = ^Txcb_xvmc_list_surface_types_request_t;
  Txcb_xvmc_list_surface_types_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      port_id : Txcb_xv_port_t;
    end;
{*
 * @brief xcb_xvmc_list_surface_types_reply_t
 * }

  Pxcb_xvmc_list_surface_types_reply_t = ^Txcb_xvmc_list_surface_types_reply_t;
  Txcb_xvmc_list_surface_types_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * @brief xcb_xvmc_create_context_cookie_t
 * }

  Pxcb_xvmc_create_context_cookie_t = ^Txcb_xvmc_create_context_cookie_t;
  Txcb_xvmc_create_context_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xvmc_create_context.  }

const
  XCB_XVMC_CREATE_CONTEXT = 2;  
{*
 * @brief xcb_xvmc_create_context_request_t
 * }
type
  Pxcb_xvmc_create_context_request_t = ^Txcb_xvmc_create_context_request_t;
  Txcb_xvmc_create_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_id : Txcb_xvmc_context_t;
      port_id : Txcb_xv_port_t;
      surface_id : Txcb_xvmc_surface_t;
      width : Tuint16_t;
      height : Tuint16_t;
      flags : Tuint32_t;
    end;
{*
 * @brief xcb_xvmc_create_context_reply_t
 * }

  Pxcb_xvmc_create_context_reply_t = ^Txcb_xvmc_create_context_reply_t;
  Txcb_xvmc_create_context_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      width_actual : Tuint16_t;
      height_actual : Tuint16_t;
      flags_return : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{* Opcode for xcb_xvmc_destroy_context.  }

const
  XCB_XVMC_DESTROY_CONTEXT = 3;  
{*
 * @brief xcb_xvmc_destroy_context_request_t
 * }
type
  Pxcb_xvmc_destroy_context_request_t = ^Txcb_xvmc_destroy_context_request_t;
  Txcb_xvmc_destroy_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context_id : Txcb_xvmc_context_t;
    end;
{*
 * @brief xcb_xvmc_create_surface_cookie_t
 * }

  Pxcb_xvmc_create_surface_cookie_t = ^Txcb_xvmc_create_surface_cookie_t;
  Txcb_xvmc_create_surface_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xvmc_create_surface.  }

const
  XCB_XVMC_CREATE_SURFACE = 4;  
{*
 * @brief xcb_xvmc_create_surface_request_t
 * }
type
  Pxcb_xvmc_create_surface_request_t = ^Txcb_xvmc_create_surface_request_t;
  Txcb_xvmc_create_surface_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      surface_id : Txcb_xvmc_surface_t;
      context_id : Txcb_xvmc_context_t;
    end;
{*
 * @brief xcb_xvmc_create_surface_reply_t
 * }

  Pxcb_xvmc_create_surface_reply_t = ^Txcb_xvmc_create_surface_reply_t;
  Txcb_xvmc_create_surface_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      pad1 : array[0..23] of Tuint8_t;
    end;
{* Opcode for xcb_xvmc_destroy_surface.  }

const
  XCB_XVMC_DESTROY_SURFACE = 5;  
{*
 * @brief xcb_xvmc_destroy_surface_request_t
 * }
type
  Pxcb_xvmc_destroy_surface_request_t = ^Txcb_xvmc_destroy_surface_request_t;
  Txcb_xvmc_destroy_surface_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      surface_id : Txcb_xvmc_surface_t;
    end;
{*
 * @brief xcb_xvmc_create_subpicture_cookie_t
 * }

  Pxcb_xvmc_create_subpicture_cookie_t = ^Txcb_xvmc_create_subpicture_cookie_t;
  Txcb_xvmc_create_subpicture_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xvmc_create_subpicture.  }

const
  XCB_XVMC_CREATE_SUBPICTURE = 6;  
{*
 * @brief xcb_xvmc_create_subpicture_request_t
 * }
type
  Pxcb_xvmc_create_subpicture_request_t = ^Txcb_xvmc_create_subpicture_request_t;
  Txcb_xvmc_create_subpicture_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      subpicture_id : Txcb_xvmc_subpicture_t;
      context : Txcb_xvmc_context_t;
      xvimage_id : Tuint32_t;
      width : Tuint16_t;
      height : Tuint16_t;
    end;
{*
 * @brief xcb_xvmc_create_subpicture_reply_t
 * }

  Pxcb_xvmc_create_subpicture_reply_t = ^Txcb_xvmc_create_subpicture_reply_t;
  Txcb_xvmc_create_subpicture_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      width_actual : Tuint16_t;
      height_actual : Tuint16_t;
      num_palette_entries : Tuint16_t;
      entry_bytes : Tuint16_t;
      component_order : array[0..3] of Tuint8_t;
      pad1 : array[0..11] of Tuint8_t;
    end;
{* Opcode for xcb_xvmc_destroy_subpicture.  }

const
  XCB_XVMC_DESTROY_SUBPICTURE = 7;  
{*
 * @brief xcb_xvmc_destroy_subpicture_request_t
 * }
type
  Pxcb_xvmc_destroy_subpicture_request_t = ^Txcb_xvmc_destroy_subpicture_request_t;
  Txcb_xvmc_destroy_subpicture_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      subpicture_id : Txcb_xvmc_subpicture_t;
    end;
{*
 * @brief xcb_xvmc_list_subpicture_types_cookie_t
 * }

  Pxcb_xvmc_list_subpicture_types_cookie_t = ^Txcb_xvmc_list_subpicture_types_cookie_t;
  Txcb_xvmc_list_subpicture_types_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_xvmc_list_subpicture_types.  }

const
  XCB_XVMC_LIST_SUBPICTURE_TYPES = 8;  
{*
 * @brief xcb_xvmc_list_subpicture_types_request_t
 * }
type
  Pxcb_xvmc_list_subpicture_types_request_t = ^Txcb_xvmc_list_subpicture_types_request_t;
  Txcb_xvmc_list_subpicture_types_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      port_id : Txcb_xv_port_t;
      surface_id : Txcb_xvmc_surface_t;
    end;
{*
 * @brief xcb_xvmc_list_subpicture_types_reply_t
 * }

  Pxcb_xvmc_list_subpicture_types_reply_t = ^Txcb_xvmc_list_subpicture_types_reply_t;
  Txcb_xvmc_list_subpicture_types_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_xvmc_context_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_xvmc_context_t)
  }

procedure xcb_xvmc_context_next(i:Pxcb_xvmc_context_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_xvmc_context_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_xvmc_context_end(i:Txcb_xvmc_context_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_xvmc_surface_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_xvmc_surface_t)
  }
procedure xcb_xvmc_surface_next(i:Pxcb_xvmc_surface_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_xvmc_surface_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_xvmc_surface_end(i:Txcb_xvmc_surface_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_xvmc_subpicture_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_xvmc_subpicture_t)
  }
procedure xcb_xvmc_subpicture_next(i:Pxcb_xvmc_subpicture_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_xvmc_subpicture_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_xvmc_subpicture_end(i:Txcb_xvmc_subpicture_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_xvmc_surface_info_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_xvmc_surface_info_t)
  }
procedure xcb_xvmc_surface_info_next(i:Pxcb_xvmc_surface_info_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_xvmc_surface_info_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_xvmc_surface_info_end(i:Txcb_xvmc_surface_info_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xvmc_query_version(c:Pxcb_connection_t):Txcb_xvmc_query_version_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xvmc_query_version_unchecked(c:Pxcb_connection_t):Txcb_xvmc_query_version_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xvmc_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xvmc_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_xvmc_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_xvmc_query_version_reply_t;cdecl;external libxcbxxx;
function xcb_xvmc_list_surface_types_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xvmc_list_surface_types(c:Pxcb_connection_t; port_id:Txcb_xv_port_t):Txcb_xvmc_list_surface_types_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xvmc_list_surface_types_unchecked(c:Pxcb_connection_t; port_id:Txcb_xv_port_t):Txcb_xvmc_list_surface_types_cookie_t;cdecl;external libxcbxxx;
function xcb_xvmc_list_surface_types_surfaces(R:Pxcb_xvmc_list_surface_types_reply_t):Pxcb_xvmc_surface_info_t;cdecl;external libxcbxxx;
function xcb_xvmc_list_surface_types_surfaces_length(R:Pxcb_xvmc_list_surface_types_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xvmc_list_surface_types_surfaces_iterator(R:Pxcb_xvmc_list_surface_types_reply_t):Txcb_xvmc_surface_info_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xvmc_list_surface_types_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xvmc_list_surface_types_reply(c:Pxcb_connection_t; cookie:Txcb_xvmc_list_surface_types_cookie_t; e:PPxcb_generic_error_t):Pxcb_xvmc_list_surface_types_reply_t;cdecl;external libxcbxxx;
function xcb_xvmc_create_context_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xvmc_create_context(c:Pxcb_connection_t; context_id:Txcb_xvmc_context_t; port_id:Txcb_xv_port_t; surface_id:Txcb_xvmc_surface_t; width:Tuint16_t; 
           height:Tuint16_t; flags:Tuint32_t):Txcb_xvmc_create_context_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xvmc_create_context_unchecked(c:Pxcb_connection_t; context_id:Txcb_xvmc_context_t; port_id:Txcb_xv_port_t; surface_id:Txcb_xvmc_surface_t; width:Tuint16_t; 
           height:Tuint16_t; flags:Tuint32_t):Txcb_xvmc_create_context_cookie_t;cdecl;external libxcbxxx;
function xcb_xvmc_create_context_priv_data(R:Pxcb_xvmc_create_context_reply_t):Puint32_t;cdecl;external libxcbxxx;
function xcb_xvmc_create_context_priv_data_length(R:Pxcb_xvmc_create_context_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xvmc_create_context_priv_data_end(R:Pxcb_xvmc_create_context_reply_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xvmc_create_context_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xvmc_create_context_reply(c:Pxcb_connection_t; cookie:Txcb_xvmc_create_context_cookie_t; e:PPxcb_generic_error_t):Pxcb_xvmc_create_context_reply_t;cdecl;external libxcbxxx;
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
function xcb_xvmc_destroy_context_checked(c:Pxcb_connection_t; context_id:Txcb_xvmc_context_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xvmc_destroy_context(c:Pxcb_connection_t; context_id:Txcb_xvmc_context_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xvmc_create_surface_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xvmc_create_surface(c:Pxcb_connection_t; surface_id:Txcb_xvmc_surface_t; context_id:Txcb_xvmc_context_t):Txcb_xvmc_create_surface_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xvmc_create_surface_unchecked(c:Pxcb_connection_t; surface_id:Txcb_xvmc_surface_t; context_id:Txcb_xvmc_context_t):Txcb_xvmc_create_surface_cookie_t;cdecl;external libxcbxxx;
function xcb_xvmc_create_surface_priv_data(R:Pxcb_xvmc_create_surface_reply_t):Puint32_t;cdecl;external libxcbxxx;
function xcb_xvmc_create_surface_priv_data_length(R:Pxcb_xvmc_create_surface_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xvmc_create_surface_priv_data_end(R:Pxcb_xvmc_create_surface_reply_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xvmc_create_surface_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xvmc_create_surface_reply(c:Pxcb_connection_t; cookie:Txcb_xvmc_create_surface_cookie_t; e:PPxcb_generic_error_t):Pxcb_xvmc_create_surface_reply_t;cdecl;external libxcbxxx;
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
function xcb_xvmc_destroy_surface_checked(c:Pxcb_connection_t; surface_id:Txcb_xvmc_surface_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xvmc_destroy_surface(c:Pxcb_connection_t; surface_id:Txcb_xvmc_surface_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xvmc_create_subpicture_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xvmc_create_subpicture(c:Pxcb_connection_t; subpicture_id:Txcb_xvmc_subpicture_t; context:Txcb_xvmc_context_t; xvimage_id:Tuint32_t; width:Tuint16_t; 
           height:Tuint16_t):Txcb_xvmc_create_subpicture_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xvmc_create_subpicture_unchecked(c:Pxcb_connection_t; subpicture_id:Txcb_xvmc_subpicture_t; context:Txcb_xvmc_context_t; xvimage_id:Tuint32_t; width:Tuint16_t; 
           height:Tuint16_t):Txcb_xvmc_create_subpicture_cookie_t;cdecl;external libxcbxxx;
function xcb_xvmc_create_subpicture_priv_data(R:Pxcb_xvmc_create_subpicture_reply_t):Puint32_t;cdecl;external libxcbxxx;
function xcb_xvmc_create_subpicture_priv_data_length(R:Pxcb_xvmc_create_subpicture_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xvmc_create_subpicture_priv_data_end(R:Pxcb_xvmc_create_subpicture_reply_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xvmc_create_subpicture_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xvmc_create_subpicture_reply(c:Pxcb_connection_t; cookie:Txcb_xvmc_create_subpicture_cookie_t; e:PPxcb_generic_error_t):Pxcb_xvmc_create_subpicture_reply_t;cdecl;external libxcbxxx;
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
function xcb_xvmc_destroy_subpicture_checked(c:Pxcb_connection_t; subpicture_id:Txcb_xvmc_subpicture_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xvmc_destroy_subpicture(c:Pxcb_connection_t; subpicture_id:Txcb_xvmc_subpicture_t):Txcb_void_cookie_t;cdecl;external libxcbxxx;
function xcb_xvmc_list_subpicture_types_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_xvmc_list_subpicture_types(c:Pxcb_connection_t; port_id:Txcb_xv_port_t; surface_id:Txcb_xvmc_surface_t):Txcb_xvmc_list_subpicture_types_cookie_t;cdecl;external libxcbxxx;
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
function xcb_xvmc_list_subpicture_types_unchecked(c:Pxcb_connection_t; port_id:Txcb_xv_port_t; surface_id:Txcb_xvmc_surface_t):Txcb_xvmc_list_subpicture_types_cookie_t;cdecl;external libxcbxxx;
function xcb_xvmc_list_subpicture_types_types(R:Pxcb_xvmc_list_subpicture_types_reply_t):Pxcb_xv_image_format_info_t;cdecl;external libxcbxxx;
function xcb_xvmc_list_subpicture_types_types_length(R:Pxcb_xvmc_list_subpicture_types_reply_t):longint;cdecl;external libxcbxxx;
function xcb_xvmc_list_subpicture_types_types_iterator(R:Pxcb_xvmc_list_subpicture_types_reply_t):Txcb_xv_image_format_info_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_xvmc_list_subpicture_types_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_xvmc_list_subpicture_types_reply(c:Pxcb_connection_t; cookie:Txcb_xvmc_list_subpicture_types_cookie_t; e:PPxcb_generic_error_t):Pxcb_xvmc_list_subpicture_types_reply_t;cdecl;external libxcbxxx;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

// === Konventiert am: 14-10-25 15:39:22 ===


implementation



end.
