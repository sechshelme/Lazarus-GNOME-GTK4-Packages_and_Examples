
unit xcb;
interface

{
  Automatically converted by H2Pas 1.0.0 from xcb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xcb.h
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
Plongint  = ^longint;
Puint32_t  = ^uint32_t;
Pxcb_auth_info_t  = ^xcb_auth_info_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_extension_t  = ^xcb_extension_t;
Pxcb_ge_event_t  = ^xcb_ge_event_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_generic_event_t  = ^xcb_generic_event_t;
Pxcb_generic_iterator_t  = ^xcb_generic_iterator_t;
Pxcb_generic_reply_t  = ^xcb_generic_reply_t;
Pxcb_query_extension_reply_t  = ^xcb_query_extension_reply_t;
Pxcb_raw_generic_event_t  = ^xcb_raw_generic_event_t;
Pxcb_setup_t  = ^xcb_setup_t;
Pxcb_special_event_t  = ^xcb_special_event_t;
Pxcb_void_cookie_t  = ^xcb_void_cookie_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2001-2006 Bart Massey, Jamey Sharp, and Josh Triplett.
 * All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
  }
{$ifndef __XCB_H__}
{$define __XCB_H__}
{$include <sys/types.h>}
{$if defined(__solaris__)}
{$include <inttypes.h>}
{$else}
{$include <stdint.h>}
{$endif}
{$ifndef _WIN32}
{$include <sys/uio.h>}
{$else}
{$include "xcb_windefs.h"}
{$endif}
{$include <pthread.h>}
{ C++ extern C conditionnal removed }
{*
 * @file xcb.h
  }
{$ifdef __GNUC__}

{ was #define dname def_expr }
function XCB_PACKED : longint; { return type might be wrong }

{$else}
{$define XCB_PACKED}
{$endif}
{*
 * @defgroup XCB_Core_API XCB Core API
 * @brief Core API of the XCB library.
 *
 * @
  }
{ Pre-defined constants  }
{* Current protocol version  }

const
  X_PROTOCOL = 11;  
{* Current minor version  }
  X_PROTOCOL_REVISION = 0;  
{* X_TCP_PORT + display number = server port for TCP transport  }
  X_TCP_PORT = 6000;  
{* xcb connection errors because of socket, pipe and other stream errors.  }
  XCB_CONN_ERROR = 1;  
{* xcb connection shutdown because of extension not supported  }
  XCB_CONN_CLOSED_EXT_NOTSUPPORTED = 2;  
{* malloc(), calloc() and realloc() error upon failure, for eg ENOMEM  }
  XCB_CONN_CLOSED_MEM_INSUFFICIENT = 3;  
{* Connection closed, exceeding request length that server accepts.  }
  XCB_CONN_CLOSED_REQ_LEN_EXCEED = 4;  
{* Connection closed, error during parsing display string.  }
  XCB_CONN_CLOSED_PARSE_ERR = 5;  
{* Connection closed because the server does not have a screen matching the display.  }
  XCB_CONN_CLOSED_INVALID_SCREEN = 6;  
{* Connection closed because some FD passing operation failed  }
  XCB_CONN_CLOSED_FDPASSING_FAILED = 7;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function XCB_TYPE_PAD(T,I : longint) : longint;

{ Opaque structures  }
{*
 * @brief XCB Connection structure.
 *
 * A structure that contain all data that  XCB needs to communicate with an X server.
  }
type
{*< Opaque structure containing all data that  XCB needs to communicate with an X server.  }
{ Other types  }
{*
 * @brief Generic iterator.
 *
 * A generic iterator structure.
  }
{*< Data of the current iterator  }
{*< remaining elements  }
{*< index of the current iterator  }

  Pxcb_generic_iterator_t = ^Txcb_generic_iterator_t;
  Txcb_generic_iterator_t = record
      data : pointer;
      rem : longint;
      index : longint;
    end;
{*
 * @brief Generic reply.
 *
 * A generic reply structure.
  }
{*< Type of the response  }
{*< Padding  }
{*< Sequence number  }
{*< Length of the response  }

  Pxcb_generic_reply_t = ^Txcb_generic_reply_t;
  Txcb_generic_reply_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
    end;
{*
 * @brief Generic event.
 *
 * A generic event structure.
  }
{*< Type of the response  }
{*< Padding  }
{*< Sequence number  }
{*< Padding  }
{*< full sequence  }

  Pxcb_generic_event_t = ^Txcb_generic_event_t;
  Txcb_generic_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      pad : array[0..6] of Tuint32_t;
      full_sequence : Tuint32_t;
    end;
{*
 * @brief Raw Generic event.
 *
 * A generic event structure as used on the wire, i.e., without the full_sequence field
  }
{*< Type of the response  }
{*< Padding  }
{*< Sequence number  }
{*< Padding  }

  Pxcb_raw_generic_event_t = ^Txcb_raw_generic_event_t;
  Txcb_raw_generic_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      pad : array[0..6] of Tuint32_t;
    end;
{*
 * @brief GE event
 *
 * An event as sent by the XGE extension. The length field specifies the
 * number of 4-byte blocks trailing the struct.
 *
 * @deprecated Since some fields in this struct have unfortunate names, it is
 * recommended to use xcb_ge_generic_event_t instead.
  }
{*< Type of the response  }
{*< Padding  }
{*< Sequence number  }
{*< Padding  }
{*< full sequence  }

  Pxcb_ge_event_t = ^Txcb_ge_event_t;
  Txcb_ge_event_t = record
      response_type : Tuint8_t;
      pad0 : Tuint8_t;
      sequence : Tuint16_t;
      length : Tuint32_t;
      event_type : Tuint16_t;
      pad1 : Tuint16_t;
      pad : array[0..4] of Tuint32_t;
      full_sequence : Tuint32_t;
    end;
{*
 * @brief Generic error.
 *
 * A generic error structure.
  }
{*< Type of the response  }
{*< Error code  }
{*< Sequence number  }
{* < Resource ID for requests with side effects only  }
{* < Minor opcode of the failed request  }
{* < Major opcode of the failed request  }
{*< Padding  }
{*< full sequence  }

  Pxcb_generic_error_t = ^Txcb_generic_error_t;
  Txcb_generic_error_t = record
      response_type : Tuint8_t;
      error_code : Tuint8_t;
      sequence : Tuint16_t;
      resource_id : Tuint32_t;
      minor_code : Tuint16_t;
      major_code : Tuint8_t;
      pad0 : Tuint8_t;
      pad : array[0..4] of Tuint32_t;
      full_sequence : Tuint32_t;
    end;
{*
 * @brief Generic cookie.
 *
 * A generic cookie structure.
  }
{*< Sequence number  }

  Pxcb_void_cookie_t = ^Txcb_void_cookie_t;
  Txcb_void_cookie_t = record
      sequence : dword;
    end;
{ Include the generated xproto header.  }
{$include "xproto.h"}
{* XCB_NONE is the universal null resource or null atom parameter value for many core X requests  }

const
  XCB_NONE = 0;  
{* XCB_COPY_FROM_PARENT can be used for many xcb_create_window parameters  }
  XCB_COPY_FROM_PARENT = 0;  
{* XCB_CURRENT_TIME can be used in most requests that take an xcb_timestamp_t  }
  XCB_CURRENT_TIME = 0;  
{* XCB_NO_SYMBOL fills in unused entries in xcb_keysym_t tables  }
  XCB_NO_SYMBOL = 0;  
{ xcb_auth.c  }
{*
 * @brief Container for authorization information.
 *
 * A container for authorization information to be sent to the X server.
  }
{*< Length of the string name (as returned by strlen).  }
{*< String containing the authentication protocol name, such as "MIT-MAGIC-COOKIE-1" or "XDM-AUTHORIZATION-1".  }
{*< Length of the data member.  }
{*< Data interpreted in a protocol-specific manner.  }
type
  Pxcb_auth_info_t = ^Txcb_auth_info_t;
  Txcb_auth_info_t = record
      namelen : longint;
      name : Pchar;
      datalen : longint;
      data : Pchar;
    end;
{ xcb_out.c  }
{*
 * @brief Forces any buffered output to be written to the server.
 * @param c The connection to the X server.
 * @return > @c 0 on success, <= @c 0 otherwise.
 *
 * Forces any buffered output to be written to the server. Blocks
 * until the write is complete.
  }

function xcb_flush(c:Pxcb_connection_t):longint;cdecl;external;
{*
 * @brief Returns the maximum request length that this server accepts.
 * @param c The connection to the X server.
 * @return The maximum request length field.
 *
 * In the absence of the BIG-REQUESTS extension, returns the
 * maximum request length field from the connection setup data, which
 * may be as much as 65535. If the server supports BIG-REQUESTS, then
 * the maximum request length field from the reply to the
 * BigRequestsEnable request will be returned instead.
 *
 * Note that this length is measured in four-byte units, making the
 * theoretical maximum lengths roughly 256kB without BIG-REQUESTS and
 * 16GB with.
  }
function xcb_get_maximum_request_length(c:Pxcb_connection_t):Tuint32_t;cdecl;external;
{*
 * @brief Prefetch the maximum request length without blocking.
 * @param c The connection to the X server.
 *
 * Without blocking, does as much work as possible toward computing
 * the maximum request length accepted by the X server.
 *
 * Invoking this function may cause a call to xcb_big_requests_enable,
 * but will not block waiting for the reply.
 * xcb_get_maximum_request_length will return the prefetched data
 * after possibly blocking while the reply is retrieved.
 *
 * Note that in order for this function to be fully non-blocking, the
 * application must previously have called
 * xcb_prefetch_extension_data(c, &xcb_big_requests_id) and the reply
 * must have already arrived.
  }
procedure xcb_prefetch_maximum_request_length(c:Pxcb_connection_t);cdecl;external;
{ xcb_in.c  }
{*
 * @brief Returns the next event or error from the server.
 * @param c The connection to the X server.
 * @return The next event from the server.
 *
 * Returns the next event or error from the server, or returns null in
 * the event of an I/O error. Blocks until either an event or error
 * arrive, or an I/O error occurs.
  }
function xcb_wait_for_event(c:Pxcb_connection_t):Pxcb_generic_event_t;cdecl;external;
{*
 * @brief Returns the next event or error from the server.
 * @param c The connection to the X server.
 * @return The next event from the server.
 *
 * Returns the next event or error from the server, if one is
 * available, or returns @c NULL otherwise. If no event is available, that
 * might be because an I/O error like connection close occurred while
 * attempting to read the next event, in which case the connection is
 * shut down when this function returns.
  }
function xcb_poll_for_event(c:Pxcb_connection_t):Pxcb_generic_event_t;cdecl;external;
{*
 * @brief Returns the next event without reading from the connection.
 * @param c The connection to the X server.
 * @return The next already queued event from the server.
 *
 * This is a version of xcb_poll_for_event that only examines the
 * event queue for new events. The function doesn't try to read new
 * events from the connection if no queued events are found.
 *
 * This function is useful for callers that know in advance that all
 * interesting events have already been read from the connection. For
 * example, callers might use xcb_wait_for_reply and be interested
 * only of events that preceded a specific reply.
  }
function xcb_poll_for_queued_event(c:Pxcb_connection_t):Pxcb_generic_event_t;cdecl;external;
type
  Txcb_special_event = Txcb_special_event_t;
{*
 * @brief Returns the next event from a special queue
  }

function xcb_poll_for_special_event(c:Pxcb_connection_t; se:Pxcb_special_event_t):Pxcb_generic_event_t;cdecl;external;
{*
 * @brief Returns the next event from a special queue, blocking until one arrives
  }
function xcb_wait_for_special_event(c:Pxcb_connection_t; se:Pxcb_special_event_t):Pxcb_generic_event_t;cdecl;external;
{*
 * @typedef typedef struct xcb_extension_t xcb_extension_t
  }
type
{*< Opaque structure used as key for xcb_get_extension_data_t.  }
{*
 * @brief Listen for a special event
  }

function xcb_register_for_special_xge(c:Pxcb_connection_t; ext:Pxcb_extension_t; eid:Tuint32_t; stamp:Puint32_t):Pxcb_special_event_t;cdecl;external;
{*
 * @brief Stop listening for a special event
  }
procedure xcb_unregister_for_special_event(c:Pxcb_connection_t; se:Pxcb_special_event_t);cdecl;external;
{*
 * @brief Return the error for a request, or NULL if none can ever arrive.
 * @param c The connection to the X server.
 * @param cookie The request cookie.
 * @return The error for the request, or NULL if none can ever arrive.
 *
 * The xcb_void_cookie_t cookie supplied to this function must have resulted
 * from a call to xcb_[request_name]_checked().  This function will block
 * until one of two conditions happens.  If an error is received, it will be
 * returned.  If a reply to a subsequent request has already arrived, no error
 * can arrive for this request, so this function will return NULL.
 *
 * Note that this function will perform a sync if needed to ensure that the
 * sequence number will advance beyond that provided in cookie; this is a
 * convenience to avoid races in determining whether the sync is needed.
  }
function xcb_request_check(c:Pxcb_connection_t; cookie:Txcb_void_cookie_t):Pxcb_generic_error_t;cdecl;external;
{*
 * @brief Discards the reply for a request.
 * @param c The connection to the X server.
 * @param sequence The request sequence number from a cookie.
 *
 * Discards the reply for a request. Additionally, any error generated
 * by the request is also discarded (unless it was an _unchecked request
 * and the error has already arrived).
 *
 * This function will not block even if the reply is not yet available.
 *
 * Note that the sequence really does have to come from an xcb cookie;
 * this function is not designed to operate on socket-handoff replies.
  }
procedure xcb_discard_reply(c:Pxcb_connection_t; sequence:dword);cdecl;external;
{*
 * @brief Discards the reply for a request, given by a 64bit sequence number
 * @param c The connection to the X server.
 * @param sequence 64-bit sequence number as returned by xcb_send_request64().
 *
 * Discards the reply for a request. Additionally, any error generated
 * by the request is also discarded (unless it was an _unchecked request
 * and the error has already arrived).
 *
 * This function will not block even if the reply is not yet available.
 *
 * Note that the sequence really does have to come from xcb_send_request64();
 * the cookie sequence number is defined as "unsigned" int and therefore
 * not 64-bit on all platforms.
 * This function is not designed to operate on socket-handoff replies.
 *
 * Unlike its xcb_discard_reply() counterpart, the given sequence number is not
 * automatically "widened" to 64-bit.
  }
procedure xcb_discard_reply64(c:Pxcb_connection_t; sequence:Tuint64_t);cdecl;external;
{ xcb_ext.c  }
{*
 * @brief Caches reply information from QueryExtension requests.
 * @param c The connection.
 * @param ext The extension data.
 * @return A pointer to the xcb_query_extension_reply_t for the extension.
 *
 * This function is the primary interface to the "extension cache",
 * which caches reply information from QueryExtension
 * requests. Invoking this function may cause a call to
 * xcb_query_extension to retrieve extension information from the
 * server, and may block until extension data is received from the
 * server.
 *
 * The result must not be freed. This storage is managed by the cache
 * itself.
  }
(* Const before type ignored *)
function xcb_get_extension_data(c:Pxcb_connection_t; ext:Pxcb_extension_t):Pxcb_query_extension_reply_t;cdecl;external;
{*
 * @brief Prefetch of extension data into the extension cache
 * @param c The connection.
 * @param ext The extension data.
 *
 * This function allows a "prefetch" of extension data into the
 * extension cache. Invoking the function may cause a call to
 * xcb_query_extension, but will not block waiting for the
 * reply. xcb_get_extension_data will return the prefetched data after
 * possibly blocking while it is retrieved.
  }
procedure xcb_prefetch_extension_data(c:Pxcb_connection_t; ext:Pxcb_extension_t);cdecl;external;
{ xcb_conn.c  }
{*
 * @brief Access the data returned by the server.
 * @param c The connection.
 * @return A pointer to an xcb_setup_t structure.
 *
 * Accessor for the data returned by the server when the xcb_connection_t
 * was initialized. This data includes
 * - the server's required format for images,
 * - a list of available visuals,
 * - a list of available screens,
 * - the server's maximum request length (in the absence of the
 * BIG-REQUESTS extension),
 * - and other assorted information.
 *
 * See the X protocol specification for more details.
 *
 * The result must not be freed.
  }
(* Const before type ignored *)
function xcb_get_setup(c:Pxcb_connection_t):Pxcb_setup_t;cdecl;external;
{*
 * @brief Access the file descriptor of the connection.
 * @param c The connection.
 * @return The file descriptor.
 *
 * Accessor for the file descriptor that was passed to the
 * xcb_connect_to_fd call that returned @p c.
  }
function xcb_get_file_descriptor(c:Pxcb_connection_t):longint;cdecl;external;
{*
 * @brief Test whether the connection has shut down due to a fatal error.
 * @param c The connection.
 * @return > 0 if the connection is in an error state; 0 otherwise.
 *
 * Some errors that occur in the context of an xcb_connection_t
 * are unrecoverable. When such an error occurs, the
 * connection is shut down and further operations on the
 * xcb_connection_t have no effect, but memory will not be freed until
 * xcb_disconnect() is called on the xcb_connection_t.
 *
 * @return XCB_CONN_ERROR, because of socket errors, pipe errors or other stream errors.
 * @return XCB_CONN_CLOSED_EXT_NOTSUPPORTED, when extension not supported.
 * @return XCB_CONN_CLOSED_MEM_INSUFFICIENT, when memory not available.
 * @return XCB_CONN_CLOSED_REQ_LEN_EXCEED, exceeding request length that server accepts.
 * @return XCB_CONN_CLOSED_PARSE_ERR, error during parsing display string.
 * @return XCB_CONN_CLOSED_INVALID_SCREEN, because the server does not have a screen matching the display.
  }
function xcb_connection_has_error(c:Pxcb_connection_t):longint;cdecl;external;
{*
 * @brief Connects to the X server.
 * @param fd The file descriptor.
 * @param auth_info Authentication data.
 * @return A newly allocated xcb_connection_t structure.
 *
 * Connects to an X server, given the open socket @p fd and the
 * xcb_auth_info_t @p auth_info. The file descriptor @p fd is
 * bidirectionally connected to an X server. If the connection
 * should be unauthenticated, @p auth_info must be @c
 * NULL.
 *
 * Always returns a non-NULL pointer to a xcb_connection_t, even on failure.
 * Callers need to use xcb_connection_has_error() to check for failure.
 * When finished, use xcb_disconnect() to close the connection and free
 * the structure.
  }
function xcb_connect_to_fd(fd:longint; auth_info:Pxcb_auth_info_t):Pxcb_connection_t;cdecl;external;
{*
 * @brief Closes the connection.
 * @param c The connection.
 *
 * Closes the file descriptor and frees all memory associated with the
 * connection @c c. If @p c is @c NULL, nothing is done.
  }
procedure xcb_disconnect(c:Pxcb_connection_t);cdecl;external;
{ xcb_util.c  }
{*
 * @brief Parses a display string name in the form documented by X(7x).
 * @param name The name of the display.
 * @param host A pointer to a malloc'd copy of the hostname.
 * @param display A pointer to the display number.
 * @param screen A pointer to the screen number.
 * @return 0 on failure, non 0 otherwise.
 *
 * Parses the display string name @p display_name in the form
 * documented by X(7x). Has no side effects on failure. If
 * @p displayname is @c NULL or empty, it uses the environment
 * variable DISPLAY. @p hostp is a pointer to a newly allocated string
 * that contain the host name. @p displayp is set to the display
 * number and @p screenp to the preferred screen number. @p screenp
 * can be @c NULL. If @p displayname does not contain a screen number,
 * it is set to @c 0.
  }
(* Const before type ignored *)
function xcb_parse_display(name:Pchar; host:PPchar; display:Plongint; screen:Plongint):longint;cdecl;external;
{*
 * @brief Connects to the X server.
 * @param displayname The name of the display.
 * @param screenp A pointer to a preferred screen number.
 * @return A newly allocated xcb_connection_t structure.
 *
 * Connects to the X server specified by @p displayname. If @p
 * displayname is @c NULL, uses the value of the DISPLAY environment
 * variable. If a particular screen on that server is preferred, the
 * int pointed to by @p screenp (if not @c NULL) will be set to that
 * screen; otherwise the screen will be set to 0.
 *
 * Always returns a non-NULL pointer to a xcb_connection_t, even on failure.
 * Callers need to use xcb_connection_has_error() to check for failure.
 * When finished, use xcb_disconnect() to close the connection and free
 * the structure.
  }
(* Const before type ignored *)
function xcb_connect(displayname:Pchar; screenp:Plongint):Pxcb_connection_t;cdecl;external;
{*
 * @brief Connects to the X server, using an authorization information.
 * @param display The name of the display.
 * @param auth The authorization information.
 * @param screen A pointer to a preferred screen number.
 * @return A newly allocated xcb_connection_t structure.
 *
 * Connects to the X server specified by @p displayname, using the
 * authorization @p auth. If a particular screen on that server is
 * preferred, the int pointed to by @p screenp (if not @c NULL) will
 * be set to that screen; otherwise @p screenp will be set to 0.
 *
 * Always returns a non-NULL pointer to a xcb_connection_t, even on failure.
 * Callers need to use xcb_connection_has_error() to check for failure.
 * When finished, use xcb_disconnect() to close the connection and free
 * the structure.
  }
(* Const before type ignored *)
function xcb_connect_to_display_with_auth_info(display:Pchar; auth:Pxcb_auth_info_t; screen:Plongint):Pxcb_connection_t;cdecl;external;
{ xcb_xid.c  }
{*
 * @brief Allocates an XID for a new object.
 * @param c The connection.
 * @return A newly allocated XID, or -1 on failure.
 *
 * Allocates an XID for a new object. Typically used just prior to
 * various object creation functions, such as xcb_create_window.
  }
function xcb_generate_id(c:Pxcb_connection_t):Tuint32_t;cdecl;external;
{*
 * @brief Obtain number of bytes read from the connection.
 * @param c The connection
 * @return Number of bytes read from the server.
 *
 * Returns cumulative number of bytes received from the connection.
 *
 * This retrieves the total number of bytes read from this connection,
 * to be used for diagnostic/monitoring/informative purposes.
  }
function xcb_total_read(c:Pxcb_connection_t):Tuint64_t;cdecl;external;
{*
 *
 * @brief Obtain number of bytes written to the connection.
 * @param c The connection
 * @return Number of bytes written to the server.
 *
 * Returns cumulative number of bytes sent to the connection.
 *
 * This retrieves the total number of bytes written to this connection,
 * to be used for diagnostic/monitoring/informative purposes.
  }
function xcb_total_written(c:Pxcb_connection_t):Tuint64_t;cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XCB_H__  }

implementation

{ was #define dname def_expr }
function XCB_PACKED : longint; { return type might be wrong }
  begin
    XCB_PACKED:=__attribute__(__packed__);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XCB_TYPE_PAD(T,I : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if 4 then
    if_local1:=3
  else
    if_local1:=(sizeof(T))-1;
  XCB_TYPE_PAD:=-(TI(@((sizeof(T))>(if_local1))));
end;


end.
