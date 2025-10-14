unit res;

interface

uses
  fp_xcb;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from res.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Res_API XCB Res API
 * @brief Res XCB Protocol Implementation.
 * @
 * }
{$ifndef __RES_H}
{$define __RES_H}
{$include "xcb.h"}
{$include "xproto.h"}
{ C++ extern C conditionnal removed }

const
  XCB_RES_MAJOR_VERSION = 1;  
  XCB_RES_MINOR_VERSION = 2;  
  var
    xcb_res_id : Txcb_extension_t;cvar;external libxcbxxx;
{*
 * @brief xcb_res_client_t
 * }
type
  Pxcb_res_client_t = ^Txcb_res_client_t;
  Txcb_res_client_t = record
      resource_base : Tuint32_t;
      resource_mask : Tuint32_t;
    end;
{*
 * @brief xcb_res_client_iterator_t
 * }

  Pxcb_res_client_iterator_t = ^Txcb_res_client_iterator_t;
  Txcb_res_client_iterator_t = record
      data : Pxcb_res_client_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_res_type_t
 * }

  Pxcb_res_type_t = ^Txcb_res_type_t;
  Txcb_res_type_t = record
      resource_type : Txcb_atom_t;
      count : Tuint32_t;
    end;
{*
 * @brief xcb_res_type_iterator_t
 * }

  Pxcb_res_type_iterator_t = ^Txcb_res_type_iterator_t;
  Txcb_res_type_iterator_t = record
      data : Pxcb_res_type_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_res_client_id_mask_t = ^Txcb_res_client_id_mask_t;
  Txcb_res_client_id_mask_t =  Longint;
  Const
    XCB_RES_CLIENT_ID_MASK_CLIENT_XID = 1;
    XCB_RES_CLIENT_ID_MASK_LOCAL_CLIENT_PID = 2;
;
{*
 * @brief xcb_res_client_id_spec_t
 * }
type
  Pxcb_res_client_id_spec_t = ^Txcb_res_client_id_spec_t;
  Txcb_res_client_id_spec_t = record
      client : Tuint32_t;
      mask : Tuint32_t;
    end;
{*
 * @brief xcb_res_client_id_spec_iterator_t
 * }

  Pxcb_res_client_id_spec_iterator_t = ^Txcb_res_client_id_spec_iterator_t;
  Txcb_res_client_id_spec_iterator_t = record
      data : Pxcb_res_client_id_spec_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_res_client_id_value_t
 * }

  Pxcb_res_client_id_value_t = ^Txcb_res_client_id_value_t;
  Txcb_res_client_id_value_t = record
      spec : Txcb_res_client_id_spec_t;
      length : Tuint32_t;
    end;
{*
 * @brief xcb_res_client_id_value_iterator_t
 * }

  Pxcb_res_client_id_value_iterator_t = ^Txcb_res_client_id_value_iterator_t;
  Txcb_res_client_id_value_iterator_t = record
      data : Pxcb_res_client_id_value_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_res_resource_id_spec_t
 * }

  Pxcb_res_resource_id_spec_t = ^Txcb_res_resource_id_spec_t;
  Txcb_res_resource_id_spec_t = record
      resource : Tuint32_t;
      _type : Tuint32_t;
    end;
{*
 * @brief xcb_res_resource_id_spec_iterator_t
 * }

  Pxcb_res_resource_id_spec_iterator_t = ^Txcb_res_resource_id_spec_iterator_t;
  Txcb_res_resource_id_spec_iterator_t = record
      data : Pxcb_res_resource_id_spec_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_res_resource_size_spec_t
 * }

  Pxcb_res_resource_size_spec_t = ^Txcb_res_resource_size_spec_t;
  Txcb_res_resource_size_spec_t = record
      spec : Txcb_res_resource_id_spec_t;
      bytes : Tuint32_t;
      ref_count : Tuint32_t;
      use_count : Tuint32_t;
    end;
{*
 * @brief xcb_res_resource_size_spec_iterator_t
 * }

  Pxcb_res_resource_size_spec_iterator_t = ^Txcb_res_resource_size_spec_iterator_t;
  Txcb_res_resource_size_spec_iterator_t = record
      data : Pxcb_res_resource_size_spec_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_res_resource_size_value_t
 * }

  Pxcb_res_resource_size_value_t = ^Txcb_res_resource_size_value_t;
  Txcb_res_resource_size_value_t = record
      size : Txcb_res_resource_size_spec_t;
      num_cross_references : Tuint32_t;
    end;
{*
 * @brief xcb_res_resource_size_value_iterator_t
 * }

  Pxcb_res_resource_size_value_iterator_t = ^Txcb_res_resource_size_value_iterator_t;
  Txcb_res_resource_size_value_iterator_t = record
      data : Pxcb_res_resource_size_value_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_res_query_version_cookie_t
 * }

  Pxcb_res_query_version_cookie_t = ^Txcb_res_query_version_cookie_t;
  Txcb_res_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_res_query_version.  }

const
  XCB_RES_QUERY_VERSION = 0;  
{*
 * @brief xcb_res_query_version_request_t
 * }
type
  Pxcb_res_query_version_request_t = ^Txcb_res_query_version_request_t;
  Txcb_res_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      client_major : Tuint8_t;
      client_minor : Tuint8_t;
    end;
{*
 * @brief xcb_res_query_version_reply_t
 * }

  Pxcb_res_query_version_reply_t = ^Txcb_res_query_version_reply_t;
  Txcb_res_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      server_major : Tuint16_t;
      server_minor : Tuint16_t;
    end;
{*
 * @brief xcb_res_query_clients_cookie_t
 * }

  Pxcb_res_query_clients_cookie_t = ^Txcb_res_query_clients_cookie_t;
  Txcb_res_query_clients_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_res_query_clients.  }

const
  XCB_RES_QUERY_CLIENTS = 1;  
{*
 * @brief xcb_res_query_clients_request_t
 * }
type
  Pxcb_res_query_clients_request_t = ^Txcb_res_query_clients_request_t;
  Txcb_res_query_clients_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
    end;
{*
 * @brief xcb_res_query_clients_reply_t
 * }

  Pxcb_res_query_clients_reply_t = ^Txcb_res_query_clients_reply_t;
  Txcb_res_query_clients_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_clients : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * @brief xcb_res_query_client_resources_cookie_t
 * }

  Pxcb_res_query_client_resources_cookie_t = ^Txcb_res_query_client_resources_cookie_t;
  Txcb_res_query_client_resources_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_res_query_client_resources.  }

const
  XCB_RES_QUERY_CLIENT_RESOURCES = 2;  
{*
 * @brief xcb_res_query_client_resources_request_t
 * }
type
  Pxcb_res_query_client_resources_request_t = ^Txcb_res_query_client_resources_request_t;
  Txcb_res_query_client_resources_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      xid : Tuint32_t;
    end;
{*
 * @brief xcb_res_query_client_resources_reply_t
 * }

  Pxcb_res_query_client_resources_reply_t = ^Txcb_res_query_client_resources_reply_t;
  Txcb_res_query_client_resources_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_types : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * @brief xcb_res_query_client_pixmap_bytes_cookie_t
 * }

  Pxcb_res_query_client_pixmap_bytes_cookie_t = ^Txcb_res_query_client_pixmap_bytes_cookie_t;
  Txcb_res_query_client_pixmap_bytes_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_res_query_client_pixmap_bytes.  }

const
  XCB_RES_QUERY_CLIENT_PIXMAP_BYTES = 3;  
{*
 * @brief xcb_res_query_client_pixmap_bytes_request_t
 * }
type
  Pxcb_res_query_client_pixmap_bytes_request_t = ^Txcb_res_query_client_pixmap_bytes_request_t;
  Txcb_res_query_client_pixmap_bytes_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      xid : Tuint32_t;
    end;
{*
 * @brief xcb_res_query_client_pixmap_bytes_reply_t
 * }

  Pxcb_res_query_client_pixmap_bytes_reply_t = ^Txcb_res_query_client_pixmap_bytes_reply_t;
  Txcb_res_query_client_pixmap_bytes_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      bytes : Tuint32_t;
      bytes_overflow : Tuint32_t;
    end;
{*
 * @brief xcb_res_query_client_ids_cookie_t
 * }

  Pxcb_res_query_client_ids_cookie_t = ^Txcb_res_query_client_ids_cookie_t;
  Txcb_res_query_client_ids_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_res_query_client_ids.  }

const
  XCB_RES_QUERY_CLIENT_IDS = 4;  
{*
 * @brief xcb_res_query_client_ids_request_t
 * }
type
  Pxcb_res_query_client_ids_request_t = ^Txcb_res_query_client_ids_request_t;
  Txcb_res_query_client_ids_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      num_specs : Tuint32_t;
    end;
{*
 * @brief xcb_res_query_client_ids_reply_t
 * }

  Pxcb_res_query_client_ids_reply_t = ^Txcb_res_query_client_ids_reply_t;
  Txcb_res_query_client_ids_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_ids : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * @brief xcb_res_query_resource_bytes_cookie_t
 * }

  Pxcb_res_query_resource_bytes_cookie_t = ^Txcb_res_query_resource_bytes_cookie_t;
  Txcb_res_query_resource_bytes_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_res_query_resource_bytes.  }

const
  XCB_RES_QUERY_RESOURCE_BYTES = 5;  
{*
 * @brief xcb_res_query_resource_bytes_request_t
 * }
type
  Pxcb_res_query_resource_bytes_request_t = ^Txcb_res_query_resource_bytes_request_t;
  Txcb_res_query_resource_bytes_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      client : Tuint32_t;
      num_specs : Tuint32_t;
    end;
{*
 * @brief xcb_res_query_resource_bytes_reply_t
 * }

  Pxcb_res_query_resource_bytes_reply_t = ^Txcb_res_query_resource_bytes_reply_t;
  Txcb_res_query_resource_bytes_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      num_sizes : Tuint32_t;
      pad1 : array[0..19] of Tuint8_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_res_client_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_res_client_t)
  }

procedure xcb_res_client_next(i:Pxcb_res_client_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_res_client_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_res_client_end(i:Txcb_res_client_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_res_type_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_res_type_t)
  }
procedure xcb_res_type_next(i:Pxcb_res_type_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_res_type_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_res_type_end(i:Txcb_res_type_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_res_client_id_spec_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_res_client_id_spec_t)
  }
procedure xcb_res_client_id_spec_next(i:Pxcb_res_client_id_spec_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_res_client_id_spec_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_res_client_id_spec_end(i:Txcb_res_client_id_spec_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
function xcb_res_client_id_value_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
function xcb_res_client_id_value_value(R:Pxcb_res_client_id_value_t):Puint32_t;cdecl;external libxcbxxx;
function xcb_res_client_id_value_value_length(R:Pxcb_res_client_id_value_t):longint;cdecl;external libxcbxxx;
function xcb_res_client_id_value_value_end(R:Pxcb_res_client_id_value_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_res_client_id_value_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_res_client_id_value_t)
  }
procedure xcb_res_client_id_value_next(i:Pxcb_res_client_id_value_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_res_client_id_value_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_res_client_id_value_end(i:Txcb_res_client_id_value_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_res_resource_id_spec_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_res_resource_id_spec_t)
  }
procedure xcb_res_resource_id_spec_next(i:Pxcb_res_resource_id_spec_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_res_resource_id_spec_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_res_resource_id_spec_end(i:Txcb_res_resource_id_spec_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_res_resource_size_spec_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_res_resource_size_spec_t)
  }
procedure xcb_res_resource_size_spec_next(i:Pxcb_res_resource_size_spec_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_res_resource_size_spec_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_res_resource_size_spec_end(i:Txcb_res_resource_size_spec_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
function xcb_res_resource_size_value_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
function xcb_res_resource_size_value_cross_references(R:Pxcb_res_resource_size_value_t):Pxcb_res_resource_size_spec_t;cdecl;external libxcbxxx;
function xcb_res_resource_size_value_cross_references_length(R:Pxcb_res_resource_size_value_t):longint;cdecl;external libxcbxxx;
function xcb_res_resource_size_value_cross_references_iterator(R:Pxcb_res_resource_size_value_t):Txcb_res_resource_size_spec_iterator_t;cdecl;external libxcbxxx;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_res_resource_size_value_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_res_resource_size_value_t)
  }
procedure xcb_res_resource_size_value_next(i:Pxcb_res_resource_size_value_iterator_t);cdecl;external libxcbxxx;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_res_resource_size_value_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_res_resource_size_value_end(i:Txcb_res_resource_size_value_iterator_t):Txcb_generic_iterator_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_res_query_version(c:Pxcb_connection_t; client_major:Tuint8_t; client_minor:Tuint8_t):Txcb_res_query_version_cookie_t;cdecl;external libxcbxxx;
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
function xcb_res_query_version_unchecked(c:Pxcb_connection_t; client_major:Tuint8_t; client_minor:Tuint8_t):Txcb_res_query_version_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_res_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_res_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_res_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_res_query_version_reply_t;cdecl;external libxcbxxx;
function xcb_res_query_clients_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_res_query_clients(c:Pxcb_connection_t):Txcb_res_query_clients_cookie_t;cdecl;external libxcbxxx;
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
function xcb_res_query_clients_unchecked(c:Pxcb_connection_t):Txcb_res_query_clients_cookie_t;cdecl;external libxcbxxx;
function xcb_res_query_clients_clients(R:Pxcb_res_query_clients_reply_t):Pxcb_res_client_t;cdecl;external libxcbxxx;
function xcb_res_query_clients_clients_length(R:Pxcb_res_query_clients_reply_t):longint;cdecl;external libxcbxxx;
function xcb_res_query_clients_clients_iterator(R:Pxcb_res_query_clients_reply_t):Txcb_res_client_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_res_query_clients_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_res_query_clients_reply(c:Pxcb_connection_t; cookie:Txcb_res_query_clients_cookie_t; e:PPxcb_generic_error_t):Pxcb_res_query_clients_reply_t;cdecl;external libxcbxxx;
function xcb_res_query_client_resources_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_res_query_client_resources(c:Pxcb_connection_t; xid:Tuint32_t):Txcb_res_query_client_resources_cookie_t;cdecl;external libxcbxxx;
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
function xcb_res_query_client_resources_unchecked(c:Pxcb_connection_t; xid:Tuint32_t):Txcb_res_query_client_resources_cookie_t;cdecl;external libxcbxxx;
function xcb_res_query_client_resources_types(R:Pxcb_res_query_client_resources_reply_t):Pxcb_res_type_t;cdecl;external libxcbxxx;
function xcb_res_query_client_resources_types_length(R:Pxcb_res_query_client_resources_reply_t):longint;cdecl;external libxcbxxx;
function xcb_res_query_client_resources_types_iterator(R:Pxcb_res_query_client_resources_reply_t):Txcb_res_type_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_res_query_client_resources_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_res_query_client_resources_reply(c:Pxcb_connection_t; cookie:Txcb_res_query_client_resources_cookie_t; e:PPxcb_generic_error_t):Pxcb_res_query_client_resources_reply_t;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_res_query_client_pixmap_bytes(c:Pxcb_connection_t; xid:Tuint32_t):Txcb_res_query_client_pixmap_bytes_cookie_t;cdecl;external libxcbxxx;
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
function xcb_res_query_client_pixmap_bytes_unchecked(c:Pxcb_connection_t; xid:Tuint32_t):Txcb_res_query_client_pixmap_bytes_cookie_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_res_query_client_pixmap_bytes_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_res_query_client_pixmap_bytes_reply(c:Pxcb_connection_t; cookie:Txcb_res_query_client_pixmap_bytes_cookie_t; e:PPxcb_generic_error_t):Pxcb_res_query_client_pixmap_bytes_reply_t;cdecl;external libxcbxxx;
function xcb_res_query_client_ids_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_res_query_client_ids(c:Pxcb_connection_t; num_specs:Tuint32_t; specs:Pxcb_res_client_id_spec_t):Txcb_res_query_client_ids_cookie_t;cdecl;external libxcbxxx;
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
function xcb_res_query_client_ids_unchecked(c:Pxcb_connection_t; num_specs:Tuint32_t; specs:Pxcb_res_client_id_spec_t):Txcb_res_query_client_ids_cookie_t;cdecl;external libxcbxxx;
function xcb_res_query_client_ids_ids_length(R:Pxcb_res_query_client_ids_reply_t):longint;cdecl;external libxcbxxx;
function xcb_res_query_client_ids_ids_iterator(R:Pxcb_res_query_client_ids_reply_t):Txcb_res_client_id_value_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_res_query_client_ids_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_res_query_client_ids_reply(c:Pxcb_connection_t; cookie:Txcb_res_query_client_ids_cookie_t; e:PPxcb_generic_error_t):Pxcb_res_query_client_ids_reply_t;cdecl;external libxcbxxx;
function xcb_res_query_resource_bytes_sizeof(_buffer:pointer):longint;cdecl;external libxcbxxx;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_res_query_resource_bytes(c:Pxcb_connection_t; client:Tuint32_t; num_specs:Tuint32_t; specs:Pxcb_res_resource_id_spec_t):Txcb_res_query_resource_bytes_cookie_t;cdecl;external libxcbxxx;
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
function xcb_res_query_resource_bytes_unchecked(c:Pxcb_connection_t; client:Tuint32_t; num_specs:Tuint32_t; specs:Pxcb_res_resource_id_spec_t):Txcb_res_query_resource_bytes_cookie_t;cdecl;external libxcbxxx;
function xcb_res_query_resource_bytes_sizes_length(R:Pxcb_res_query_resource_bytes_reply_t):longint;cdecl;external libxcbxxx;
function xcb_res_query_resource_bytes_sizes_iterator(R:Pxcb_res_query_resource_bytes_reply_t):Txcb_res_resource_size_value_iterator_t;cdecl;external libxcbxxx;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_res_query_resource_bytes_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_res_query_resource_bytes_reply(c:Pxcb_connection_t; cookie:Txcb_res_query_resource_bytes_cookie_t; e:PPxcb_generic_error_t):Pxcb_res_query_resource_bytes_reply_t;cdecl;external libxcbxxx;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

// === Konventiert am: 14-10-25 15:39:01 ===


implementation



end.
