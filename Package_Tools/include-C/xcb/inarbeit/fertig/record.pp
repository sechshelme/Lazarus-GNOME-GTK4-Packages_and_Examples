
unit record;
interface

{
  Automatically converted by H2Pas 1.0.0 from record.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    record.h
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
Puint8_t  = ^uint8_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_record_bad_context_error_t  = ^xcb_record_bad_context_error_t;
Pxcb_record_client_info_iterator_t  = ^xcb_record_client_info_iterator_t;
Pxcb_record_client_info_t  = ^xcb_record_client_info_t;
Pxcb_record_client_spec_iterator_t  = ^xcb_record_client_spec_iterator_t;
Pxcb_record_client_spec_t  = ^xcb_record_client_spec_t;
Pxcb_record_context_iterator_t  = ^xcb_record_context_iterator_t;
Pxcb_record_context_t  = ^xcb_record_context_t;
Pxcb_record_create_context_request_t  = ^xcb_record_create_context_request_t;
Pxcb_record_cs_t  = ^xcb_record_cs_t;
Pxcb_record_disable_context_request_t  = ^xcb_record_disable_context_request_t;
Pxcb_record_element_header_iterator_t  = ^xcb_record_element_header_iterator_t;
Pxcb_record_element_header_t  = ^xcb_record_element_header_t;
Pxcb_record_enable_context_cookie_t  = ^xcb_record_enable_context_cookie_t;
Pxcb_record_enable_context_reply_t  = ^xcb_record_enable_context_reply_t;
Pxcb_record_enable_context_request_t  = ^xcb_record_enable_context_request_t;
Pxcb_record_ext_range_iterator_t  = ^xcb_record_ext_range_iterator_t;
Pxcb_record_ext_range_t  = ^xcb_record_ext_range_t;
Pxcb_record_free_context_request_t  = ^xcb_record_free_context_request_t;
Pxcb_record_get_context_cookie_t  = ^xcb_record_get_context_cookie_t;
Pxcb_record_get_context_reply_t  = ^xcb_record_get_context_reply_t;
Pxcb_record_get_context_request_t  = ^xcb_record_get_context_request_t;
Pxcb_record_h_type_t  = ^xcb_record_h_type_t;
Pxcb_record_query_version_cookie_t  = ^xcb_record_query_version_cookie_t;
Pxcb_record_query_version_reply_t  = ^xcb_record_query_version_reply_t;
Pxcb_record_query_version_request_t  = ^xcb_record_query_version_request_t;
Pxcb_record_range_16_iterator_t  = ^xcb_record_range_16_iterator_t;
Pxcb_record_range_16_t  = ^xcb_record_range_16_t;
Pxcb_record_range_8_iterator_t  = ^xcb_record_range_8_iterator_t;
Pxcb_record_range_8_t  = ^xcb_record_range_8_t;
Pxcb_record_range_iterator_t  = ^xcb_record_range_iterator_t;
Pxcb_record_range_t  = ^xcb_record_range_t;
Pxcb_record_register_clients_request_t  = ^xcb_record_register_clients_request_t;
Pxcb_record_unregister_clients_request_t  = ^xcb_record_unregister_clients_request_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file generated automatically from record.xml by c_client.py.
 * Edit at your peril.
  }
{*
 * @defgroup XCB_Record_API XCB Record API
 * @brief Record XCB Protocol Implementation.
 * @
 * }
{$ifndef __RECORD_H}
{$define __RECORD_H}
{$include "xcb.h"}
{ C++ extern C conditionnal removed }

const
  XCB_RECORD_MAJOR_VERSION = 1;  
  XCB_RECORD_MINOR_VERSION = 13;  
  var
    xcb_record_id : Txcb_extension_t;cvar;external;
type
  Pxcb_record_context_t = ^Txcb_record_context_t;
  Txcb_record_context_t = Tuint32_t;
{*
 * @brief xcb_record_context_iterator_t
 * }

  Pxcb_record_context_iterator_t = ^Txcb_record_context_iterator_t;
  Txcb_record_context_iterator_t = record
      data : Pxcb_record_context_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_record_range_8_t
 * }

  Pxcb_record_range_8_t = ^Txcb_record_range_8_t;
  Txcb_record_range_8_t = record
      first : Tuint8_t;
      last : Tuint8_t;
    end;
{*
 * @brief xcb_record_range_8_iterator_t
 * }

  Pxcb_record_range_8_iterator_t = ^Txcb_record_range_8_iterator_t;
  Txcb_record_range_8_iterator_t = record
      data : Pxcb_record_range_8_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_record_range_16_t
 * }

  Pxcb_record_range_16_t = ^Txcb_record_range_16_t;
  Txcb_record_range_16_t = record
      first : Tuint16_t;
      last : Tuint16_t;
    end;
{*
 * @brief xcb_record_range_16_iterator_t
 * }

  Pxcb_record_range_16_iterator_t = ^Txcb_record_range_16_iterator_t;
  Txcb_record_range_16_iterator_t = record
      data : Pxcb_record_range_16_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_record_ext_range_t
 * }

  Pxcb_record_ext_range_t = ^Txcb_record_ext_range_t;
  Txcb_record_ext_range_t = record
      major : Txcb_record_range_8_t;
      minor : Txcb_record_range_16_t;
    end;
{*
 * @brief xcb_record_ext_range_iterator_t
 * }

  Pxcb_record_ext_range_iterator_t = ^Txcb_record_ext_range_iterator_t;
  Txcb_record_ext_range_iterator_t = record
      data : Pxcb_record_ext_range_t;
      rem : longint;
      index : longint;
    end;
{*
 * @brief xcb_record_range_t
 * }

  Pxcb_record_range_t = ^Txcb_record_range_t;
  Txcb_record_range_t = record
      core_requests : Txcb_record_range_8_t;
      core_replies : Txcb_record_range_8_t;
      ext_requests : Txcb_record_ext_range_t;
      ext_replies : Txcb_record_ext_range_t;
      delivered_events : Txcb_record_range_8_t;
      device_events : Txcb_record_range_8_t;
      errors : Txcb_record_range_8_t;
      client_started : Tuint8_t;
      client_died : Tuint8_t;
    end;
{*
 * @brief xcb_record_range_iterator_t
 * }

  Pxcb_record_range_iterator_t = ^Txcb_record_range_iterator_t;
  Txcb_record_range_iterator_t = record
      data : Pxcb_record_range_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_record_element_header_t = ^Txcb_record_element_header_t;
  Txcb_record_element_header_t = Tuint8_t;
{*
 * @brief xcb_record_element_header_iterator_t
 * }

  Pxcb_record_element_header_iterator_t = ^Txcb_record_element_header_iterator_t;
  Txcb_record_element_header_iterator_t = record
      data : Pxcb_record_element_header_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_record_h_type_t = ^Txcb_record_h_type_t;
  Txcb_record_h_type_t =  Longint;
  Const
    XCB_RECORD_H_TYPE_FROM_SERVER_TIME = 1;
    XCB_RECORD_H_TYPE_FROM_CLIENT_TIME = 2;
    XCB_RECORD_H_TYPE_FROM_CLIENT_SEQUENCE = 4;
;
type
  Pxcb_record_client_spec_t = ^Txcb_record_client_spec_t;
  Txcb_record_client_spec_t = Tuint32_t;
{*
 * @brief xcb_record_client_spec_iterator_t
 * }

  Pxcb_record_client_spec_iterator_t = ^Txcb_record_client_spec_iterator_t;
  Txcb_record_client_spec_iterator_t = record
      data : Pxcb_record_client_spec_t;
      rem : longint;
      index : longint;
    end;

  Pxcb_record_cs_t = ^Txcb_record_cs_t;
  Txcb_record_cs_t =  Longint;
  Const
    XCB_RECORD_CS_CURRENT_CLIENTS = 1;
    XCB_RECORD_CS_FUTURE_CLIENTS = 2;
    XCB_RECORD_CS_ALL_CLIENTS = 3;
;
{*
 * @brief xcb_record_client_info_t
 * }
type
  Pxcb_record_client_info_t = ^Txcb_record_client_info_t;
  Txcb_record_client_info_t = record
      client_resource : Txcb_record_client_spec_t;
      num_ranges : Tuint32_t;
    end;
{*
 * @brief xcb_record_client_info_iterator_t
 * }

  Pxcb_record_client_info_iterator_t = ^Txcb_record_client_info_iterator_t;
  Txcb_record_client_info_iterator_t = record
      data : Pxcb_record_client_info_t;
      rem : longint;
      index : longint;
    end;
{* Opcode for xcb_record_bad_context.  }

const
  XCB_RECORD_BAD_CONTEXT = 0;  
{*
 * @brief xcb_record_bad_context_error_t
 * }
type
  Pxcb_record_bad_context_error_t = ^Txcb_record_bad_context_error_t;
  Txcb_record_bad_context_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      invalid_record : Tuint32_t;
      minor_opcode : Tuint16_t;
      major_opcode : Tuint8_t;
    end;
{*
 * @brief xcb_record_query_version_cookie_t
 * }

  Pxcb_record_query_version_cookie_t = ^Txcb_record_query_version_cookie_t;
  Txcb_record_query_version_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_record_query_version.  }

const
  XCB_RECORD_QUERY_VERSION = 0;  
{*
 * @brief xcb_record_query_version_request_t
 * }
type
  Pxcb_record_query_version_request_t = ^Txcb_record_query_version_request_t;
  Txcb_record_query_version_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      major_version : Tuint16_t;
      minor_version : Tuint16_t;
    end;
{*
 * @brief xcb_record_query_version_reply_t
 * }

  Pxcb_record_query_version_reply_t = ^Txcb_record_query_version_reply_t;
  Txcb_record_query_version_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      major_version : Tuint16_t;
      minor_version : Tuint16_t;
    end;
{* Opcode for xcb_record_create_context.  }

const
  XCB_RECORD_CREATE_CONTEXT = 1;  
{*
 * @brief xcb_record_create_context_request_t
 * }
type
  Pxcb_record_create_context_request_t = ^Txcb_record_create_context_request_t;
  Txcb_record_create_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_record_context_t;
      element_header : Txcb_record_element_header_t;
      pad0 : array[0..2] of Tuint8_t;
      num_client_specs : Tuint32_t;
      num_ranges : Tuint32_t;
    end;
{* Opcode for xcb_record_register_clients.  }

const
  XCB_RECORD_REGISTER_CLIENTS = 2;  
{*
 * @brief xcb_record_register_clients_request_t
 * }
type
  Pxcb_record_register_clients_request_t = ^Txcb_record_register_clients_request_t;
  Txcb_record_register_clients_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_record_context_t;
      element_header : Txcb_record_element_header_t;
      pad0 : array[0..2] of Tuint8_t;
      num_client_specs : Tuint32_t;
      num_ranges : Tuint32_t;
    end;
{* Opcode for xcb_record_unregister_clients.  }

const
  XCB_RECORD_UNREGISTER_CLIENTS = 3;  
{*
 * @brief xcb_record_unregister_clients_request_t
 * }
type
  Pxcb_record_unregister_clients_request_t = ^Txcb_record_unregister_clients_request_t;
  Txcb_record_unregister_clients_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_record_context_t;
      num_client_specs : Tuint32_t;
    end;
{*
 * @brief xcb_record_get_context_cookie_t
 * }

  Pxcb_record_get_context_cookie_t = ^Txcb_record_get_context_cookie_t;
  Txcb_record_get_context_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_record_get_context.  }

const
  XCB_RECORD_GET_CONTEXT = 4;  
{*
 * @brief xcb_record_get_context_request_t
 * }
type
  Pxcb_record_get_context_request_t = ^Txcb_record_get_context_request_t;
  Txcb_record_get_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_record_context_t;
    end;
{*
 * @brief xcb_record_get_context_reply_t
 * }

  Pxcb_record_get_context_reply_t = ^Txcb_record_get_context_reply_t;
  Txcb_record_get_context_reply_t = record
      response_type : Tuint8_t;
      enabled : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      element_header : Txcb_record_element_header_t;
      pad0 : array[0..2] of Tuint8_t;
      num_intercepted_clients : Tuint32_t;
      pad1 : array[0..15] of Tuint8_t;
    end;
{*
 * @brief xcb_record_enable_context_cookie_t
 * }

  Pxcb_record_enable_context_cookie_t = ^Txcb_record_enable_context_cookie_t;
  Txcb_record_enable_context_cookie_t = record
      sequence : dword;
    end;
{* Opcode for xcb_record_enable_context.  }

const
  XCB_RECORD_ENABLE_CONTEXT = 5;  
{*
 * @brief xcb_record_enable_context_request_t
 * }
type
  Pxcb_record_enable_context_request_t = ^Txcb_record_enable_context_request_t;
  Txcb_record_enable_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_record_context_t;
    end;
{*
 * @brief xcb_record_enable_context_reply_t
 * }

  Pxcb_record_enable_context_reply_t = ^Txcb_record_enable_context_reply_t;
  Txcb_record_enable_context_reply_t = record
      response_type : Tuint8_t;
      category : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      element_header : Txcb_record_element_header_t;
      client_swapped : Tuint8_t;
      pad0 : array[0..1] of Tuint8_t;
      xid_base : Tuint32_t;
      server_time : Tuint32_t;
      rec_sequence_num : Tuint32_t;
      pad1 : array[0..7] of Tuint8_t;
    end;
{* Opcode for xcb_record_disable_context.  }

const
  XCB_RECORD_DISABLE_CONTEXT = 6;  
{*
 * @brief xcb_record_disable_context_request_t
 * }
type
  Pxcb_record_disable_context_request_t = ^Txcb_record_disable_context_request_t;
  Txcb_record_disable_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_record_context_t;
    end;
{* Opcode for xcb_record_free_context.  }

const
  XCB_RECORD_FREE_CONTEXT = 7;  
{*
 * @brief xcb_record_free_context_request_t
 * }
type
  Pxcb_record_free_context_request_t = ^Txcb_record_free_context_request_t;
  Txcb_record_free_context_request_t = record
      major_opcode : Tuint8_t;
      minor_opcode : Tuint8_t;
      length : Tuint16_t;
      context : Txcb_record_context_t;
    end;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_record_context_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_record_context_t)
  }

procedure xcb_record_context_next(i:Pxcb_record_context_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_record_context_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_record_context_end(i:Txcb_record_context_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_record_range_8_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_record_range_8_t)
  }
procedure xcb_record_range_8_next(i:Pxcb_record_range_8_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_record_range_8_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_record_range_8_end(i:Txcb_record_range_8_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_record_range_16_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_record_range_16_t)
  }
procedure xcb_record_range_16_next(i:Pxcb_record_range_16_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_record_range_16_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_record_range_16_end(i:Txcb_record_range_16_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_record_ext_range_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_record_ext_range_t)
  }
procedure xcb_record_ext_range_next(i:Pxcb_record_ext_range_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_record_ext_range_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_record_ext_range_end(i:Txcb_record_ext_range_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_record_range_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_record_range_t)
  }
procedure xcb_record_range_next(i:Pxcb_record_range_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_record_range_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_record_range_end(i:Txcb_record_range_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_record_element_header_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_record_element_header_t)
  }
procedure xcb_record_element_header_next(i:Pxcb_record_element_header_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_record_element_header_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_record_element_header_end(i:Txcb_record_element_header_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_record_client_spec_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_record_client_spec_t)
  }
procedure xcb_record_client_spec_next(i:Pxcb_record_client_spec_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_record_client_spec_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_record_client_spec_end(i:Txcb_record_client_spec_iterator_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_client_info_sizeof(_buffer:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xcb_record_client_info_ranges(R:Pxcb_record_client_info_t):Pxcb_record_range_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_client_info_ranges_length(R:Pxcb_record_client_info_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_record_client_info_ranges_iterator(R:Pxcb_record_client_info_t):Txcb_record_range_iterator_t;cdecl;external;
{*
 * Get the next element of the iterator
 * @param i Pointer to a xcb_record_client_info_iterator_t
 *
 * Get the next element in the iterator. The member rem is
 * decreased by one. The member data points to the next
 * element. The member index is increased by sizeof(xcb_record_client_info_t)
  }
procedure xcb_record_client_info_next(i:Pxcb_record_client_info_iterator_t);cdecl;external;
{*
 * Return the iterator pointing to the last element
 * @param i An xcb_record_client_info_iterator_t
 * @return  The iterator pointing to the last element
 *
 * Set the current element in the iterator to the last element.
 * The member rem is set to 0. The member data points to the
 * last element.
  }
function xcb_record_client_info_end(i:Txcb_record_client_info_iterator_t):Txcb_generic_iterator_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_record_query_version(c:Pxcb_connection_t; major_version:Tuint16_t; minor_version:Tuint16_t):Txcb_record_query_version_cookie_t;cdecl;external;
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
function xcb_record_query_version_unchecked(c:Pxcb_connection_t; major_version:Tuint16_t; minor_version:Tuint16_t):Txcb_record_query_version_cookie_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_record_query_version_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_record_query_version_reply(c:Pxcb_connection_t; cookie:Txcb_record_query_version_cookie_t; e:PPxcb_generic_error_t):Pxcb_record_query_version_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_create_context_sizeof(_buffer:pointer):longint;cdecl;external;
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
(* Const before type ignored *)
function xcb_record_create_context_checked(c:Pxcb_connection_t; context:Txcb_record_context_t; element_header:Txcb_record_element_header_t; num_client_specs:Tuint32_t; num_ranges:Tuint32_t; 
           client_specs:Pxcb_record_client_spec_t; ranges:Pxcb_record_range_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xcb_record_create_context(c:Pxcb_connection_t; context:Txcb_record_context_t; element_header:Txcb_record_element_header_t; num_client_specs:Tuint32_t; num_ranges:Tuint32_t; 
           client_specs:Pxcb_record_client_spec_t; ranges:Pxcb_record_range_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_create_context_client_specs(R:Pxcb_record_create_context_request_t):Pxcb_record_client_spec_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_create_context_client_specs_length(R:Pxcb_record_create_context_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_record_create_context_client_specs_end(R:Pxcb_record_create_context_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_create_context_ranges(R:Pxcb_record_create_context_request_t):Pxcb_record_range_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_create_context_ranges_length(R:Pxcb_record_create_context_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_record_create_context_ranges_iterator(R:Pxcb_record_create_context_request_t):Txcb_record_range_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_register_clients_sizeof(_buffer:pointer):longint;cdecl;external;
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
(* Const before type ignored *)
function xcb_record_register_clients_checked(c:Pxcb_connection_t; context:Txcb_record_context_t; element_header:Txcb_record_element_header_t; num_client_specs:Tuint32_t; num_ranges:Tuint32_t; 
           client_specs:Pxcb_record_client_spec_t; ranges:Pxcb_record_range_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xcb_record_register_clients(c:Pxcb_connection_t; context:Txcb_record_context_t; element_header:Txcb_record_element_header_t; num_client_specs:Tuint32_t; num_ranges:Tuint32_t; 
           client_specs:Pxcb_record_client_spec_t; ranges:Pxcb_record_range_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_register_clients_client_specs(R:Pxcb_record_register_clients_request_t):Pxcb_record_client_spec_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_register_clients_client_specs_length(R:Pxcb_record_register_clients_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_record_register_clients_client_specs_end(R:Pxcb_record_register_clients_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_register_clients_ranges(R:Pxcb_record_register_clients_request_t):Pxcb_record_range_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_register_clients_ranges_length(R:Pxcb_record_register_clients_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_record_register_clients_ranges_iterator(R:Pxcb_record_register_clients_request_t):Txcb_record_range_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_unregister_clients_sizeof(_buffer:pointer):longint;cdecl;external;
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
function xcb_record_unregister_clients_checked(c:Pxcb_connection_t; context:Txcb_record_context_t; num_client_specs:Tuint32_t; client_specs:Pxcb_record_client_spec_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
(* Const before type ignored *)
function xcb_record_unregister_clients(c:Pxcb_connection_t; context:Txcb_record_context_t; num_client_specs:Tuint32_t; client_specs:Pxcb_record_client_spec_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_unregister_clients_client_specs(R:Pxcb_record_unregister_clients_request_t):Pxcb_record_client_spec_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_unregister_clients_client_specs_length(R:Pxcb_record_unregister_clients_request_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_record_unregister_clients_client_specs_end(R:Pxcb_record_unregister_clients_request_t):Txcb_generic_iterator_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_get_context_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_record_get_context(c:Pxcb_connection_t; context:Txcb_record_context_t):Txcb_record_get_context_cookie_t;cdecl;external;
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
function xcb_record_get_context_unchecked(c:Pxcb_connection_t; context:Txcb_record_context_t):Txcb_record_get_context_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_get_context_intercepted_clients_length(R:Pxcb_record_get_context_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_record_get_context_intercepted_clients_iterator(R:Pxcb_record_get_context_reply_t):Txcb_record_client_info_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_record_get_context_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_record_get_context_reply(c:Pxcb_connection_t; cookie:Txcb_record_get_context_cookie_t; e:PPxcb_generic_error_t):Pxcb_record_get_context_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_enable_context_sizeof(_buffer:pointer):longint;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_record_enable_context(c:Pxcb_connection_t; context:Txcb_record_context_t):Txcb_record_enable_context_cookie_t;cdecl;external;
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
function xcb_record_enable_context_unchecked(c:Pxcb_connection_t; context:Txcb_record_context_t):Txcb_record_enable_context_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_enable_context_data(R:Pxcb_record_enable_context_reply_t):Puint8_t;cdecl;external;
(* Const before type ignored *)
function xcb_record_enable_context_data_length(R:Pxcb_record_enable_context_reply_t):longint;cdecl;external;
(* Const before type ignored *)
function xcb_record_enable_context_data_end(R:Pxcb_record_enable_context_reply_t):Txcb_generic_iterator_t;cdecl;external;
{*
 * Return the reply
 * @param c      The connection
 * @param cookie The cookie
 * @param e      The xcb_generic_error_t supplied
 *
 * Returns the reply of the request asked by
 *
 * The parameter @p e supplied to this function must be NULL if
 * xcb_record_enable_context_unchecked(). is used.
 * Otherwise, it stores the error if any.
 *
 * The returned value must be freed by the caller using free().
  }
{*<  }function xcb_record_enable_context_reply(c:Pxcb_connection_t; cookie:Txcb_record_enable_context_cookie_t; e:PPxcb_generic_error_t):Pxcb_record_enable_context_reply_t;cdecl;external;
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
function xcb_record_disable_context_checked(c:Pxcb_connection_t; context:Txcb_record_context_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_record_disable_context(c:Pxcb_connection_t; context:Txcb_record_context_t):Txcb_void_cookie_t;cdecl;external;
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
function xcb_record_free_context_checked(c:Pxcb_connection_t; context:Txcb_record_context_t):Txcb_void_cookie_t;cdecl;external;
{*
 *
 * @param c The connection
 * @return A cookie
 *
 * Delivers a request to the X server.
 *
  }
function xcb_record_free_context(c:Pxcb_connection_t; context:Txcb_record_context_t):Txcb_void_cookie_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{*
 * @
  }

implementation


end.
