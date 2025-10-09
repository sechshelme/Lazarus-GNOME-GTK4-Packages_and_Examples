
unit xcbext;
interface

{
  Automatically converted by H2Pas 1.0.0 from xcbext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xcbext.h
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
Piovec  = ^iovec;
Plongint  = ^longint;
Puint64_t  = ^uint64_t;
Puint8_t  = ^uint8_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_extension_t  = ^xcb_extension_t;
Pxcb_generic_error_t  = ^xcb_generic_error_t;
Pxcb_protocol_request_t  = ^xcb_protocol_request_t;
Pxcb_send_request_flags_t  = ^xcb_send_request_flags_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2001-2004 Bart Massey and Jamey Sharp.
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
{$ifndef __XCBEXT_H}
{$define __XCBEXT_H}
{$include "xcb.h"}
{ C++ extern C conditionnal removed }
{ xcb_ext.c  }
(* Const before type ignored *)
type
  Pxcb_extension_t = ^Txcb_extension_t;
  Txcb_extension_t = record
      name : Pchar;
      global_id : longint;
    end;

{ xcb_out.c  }

  Pxcb_protocol_request_t = ^Txcb_protocol_request_t;
  Txcb_protocol_request_t = record
      count : Tsize_t;
      ext : Pxcb_extension_t;
      opcode : Tuint8_t;
      isvoid : Tuint8_t;
    end;
  Txcb_send_request_flags_t =  Longint;
  Const
    XCB_REQUEST_CHECKED = 1 shl 0;
    XCB_REQUEST_RAW = 1 shl 1;
    XCB_REQUEST_DISCARD_REPLY = 1 shl 2;
    XCB_REQUEST_REPLY_FDS = 1 shl 3;

{*
 * @brief Send a request to the server.
 * @param c The connection to the X server.
 * @param flags A combination of flags from the xcb_send_request_flags_t enumeration.
 * @param vector Data to send; must have two iovecs before start for internal use.
 * @param request Information about the request to be sent.
 * @return The request's sequence number on success, 0 otherwise.
 *
 * This function sends a new request to the X server. The data of the request is
 * given as an array of @c iovecs in the @p vector argument. The length of that
 * array and the necessary management information are given in the @p request
 * argument.
 *
 * When this function returns, the request might or might not be sent already.
 * Use xcb_flush() to make sure that it really was sent.
 *
 * Please note that this function is not the preferred way for sending requests.
 * It's better to use the generated wrapper functions.
 *
 * Please note that xcb might use index -1 and -2 of the @p vector array internally,
 * so they must be valid!
  }
(* Const before type ignored *)

function xcb_send_request(c:Pxcb_connection_t; flags:longint; vector:Piovec; request:Pxcb_protocol_request_t):dword;cdecl;external;
{*
 * @brief Send a request to the server.
 * @param c The connection to the X server.
 * @param flags A combination of flags from the xcb_send_request_flags_t enumeration.
 * @param vector Data to send; must have two iovecs before start for internal use.
 * @param request Information about the request to be sent.
 * @param num_fds Number of additional file descriptors to send to the server
 * @param fds Additional file descriptors that should be send to the server.
 * @return The request's sequence number on success, 0 otherwise.
 *
 * This function sends a new request to the X server. The data of the request is
 * given as an array of @c iovecs in the @p vector argument. The length of that
 * array and the necessary management information are given in the @p request
 * argument.
 *
 * If @p num_fds is non-zero, @p fds points to an array of file descriptors that
 * will be sent to the X server along with this request. After this function
 * returns, all file descriptors sent are owned by xcb and will be closed
 * eventually.
 *
 * When this function returns, the request might or might not be sent already.
 * Use xcb_flush() to make sure that it really was sent.
 *
 * Please note that this function is not the preferred way for sending requests.
 *
 * Please note that xcb might use index -1 and -2 of the @p vector array internally,
 * so they must be valid!
  }
(* Const before type ignored *)
function xcb_send_request_with_fds(c:Pxcb_connection_t; flags:longint; vector:Piovec; request:Pxcb_protocol_request_t; num_fds:dword; 
           fds:Plongint):dword;cdecl;external;
{*
 * @brief Send a request to the server, with 64-bit sequence number returned.
 * @param c The connection to the X server.
 * @param flags A combination of flags from the xcb_send_request_flags_t enumeration.
 * @param vector Data to send; must have two iovecs before start for internal use.
 * @param request Information about the request to be sent.
 * @return The request's sequence number on success, 0 otherwise.
 *
 * This function sends a new request to the X server. The data of the request is
 * given as an array of @c iovecs in the @p vector argument. The length of that
 * array and the necessary management information are given in the @p request
 * argument.
 *
 * When this function returns, the request might or might not be sent already.
 * Use xcb_flush() to make sure that it really was sent.
 *
 * Please note that this function is not the preferred way for sending requests.
 * It's better to use the generated wrapper functions.
 *
 * Please note that xcb might use index -1 and -2 of the @p vector array internally,
 * so they must be valid!
  }
(* Const before type ignored *)
function xcb_send_request64(c:Pxcb_connection_t; flags:longint; vector:Piovec; request:Pxcb_protocol_request_t):Tuint64_t;cdecl;external;
{*
 * @brief Send a request to the server, with 64-bit sequence number returned.
 * @param c The connection to the X server.
 * @param flags A combination of flags from the xcb_send_request_flags_t enumeration.
 * @param vector Data to send; must have two iovecs before start for internal use.
 * @param request Information about the request to be sent.
 * @param num_fds Number of additional file descriptors to send to the server
 * @param fds Additional file descriptors that should be send to the server.
 * @return The request's sequence number on success, 0 otherwise.
 *
 * This function sends a new request to the X server. The data of the request is
 * given as an array of @c iovecs in the @p vector argument. The length of that
 * array and the necessary management information are given in the @p request
 * argument.
 *
 * If @p num_fds is non-zero, @p fds points to an array of file descriptors that
 * will be sent to the X server along with this request. After this function
 * returns, all file descriptors sent are owned by xcb and will be closed
 * eventually.
 *
 * When this function returns, the request might or might not be sent already.
 * Use xcb_flush() to make sure that it really was sent.
 *
 * Please note that this function is not the preferred way for sending requests.
 * It's better to use the generated wrapper functions.
 *
 * Please note that xcb might use index -1 and -2 of the @p vector array internally,
 * so they must be valid!
  }
(* Const before type ignored *)
function xcb_send_request_with_fds64(c:Pxcb_connection_t; flags:longint; vector:Piovec; request:Pxcb_protocol_request_t; num_fds:dword; 
           fds:Plongint):Tuint64_t;cdecl;external;
{*
 * @brief Send a file descriptor to the server in the next call to xcb_send_request.
 * @param c The connection to the X server.
 * @param fd The file descriptor to send.
 *
 * After this function returns, the file descriptor given is owned by xcb and
 * will be closed eventually.
 *
 * @deprecated This function cannot be used in a thread-safe way. Two threads
 * that run xcb_send_fd(); xcb_send_request(); could mix up their file
 * descriptors. Instead, xcb_send_request_with_fds() should be used.
  }
procedure xcb_send_fd(c:Pxcb_connection_t; fd:longint);cdecl;external;
{*
 * @brief Take over the write side of the socket
 * @param c The connection to the X server.
 * @param return_socket Callback function that will be called when xcb wants
 *                        to use the socket again.
 * @param closure Argument to the callback function.
 * @param flags A combination of flags from the xcb_send_request_flags_t enumeration.
 * @param sent Location to the sequence number of the last sequence request.
 *              Must not be NULL.
 * @return 1 on success, else 0.
 *
 * xcb_take_socket allows external code to ask XCB for permission to
 * take over the write side of the socket and send raw data with
 * xcb_writev. xcb_take_socket provides the sequence number of the last
 * request XCB sent. The caller of xcb_take_socket must supply a
 * callback which XCB can call when it wants the write side of the
 * socket back to make a request. This callback synchronizes with the
 * external socket owner and flushes any output queues if appropriate.
 * If you are sending requests which won't cause a reply, please note the
 * comment for xcb_writev which explains some sequence number wrap issues.
 *
 * All replies that are generated while the socket is owned externally have
 * @p flags applied to them. For example, use XCB_REQUEST_CHECK if you don't
 * want errors to go to xcb's normal error handling, but instead having to be
 * picked up via xcb_wait_for_reply(), xcb_poll_for_reply() or
 * xcb_request_check().
  }
function xcb_take_socket(c:Pxcb_connection_t; return_socket:procedure (closure:pointer); closure:pointer; flags:longint; sent:Puint64_t):longint;cdecl;external;
{*
 * @brief Send raw data to the X server.
 * @param c The connection to the X server.
 * @param vector Array of data to be sent.
 * @param count Number of entries in @p vector.
 * @param requests Number of requests that are being sent.
 * @return 1 on success, else 0.
 *
 * You must own the write-side of the socket (you've called
 * xcb_take_socket, and haven't returned from return_socket yet) to call
 * xcb_writev. Also, the iovec must have at least 1 byte of data in it.
 * You have to make sure that xcb can detect sequence number wraps correctly.
 * This means that the first request you send after xcb_take_socket must cause a
 * reply (e.g. just insert a GetInputFocus request). After every (1 << 16) - 1
 * requests without a reply, you have to insert a request which will cause a
 * reply. You can again use GetInputFocus for this. You do not have to wait for
 * any of the GetInputFocus replies, but can instead handle them via
 * xcb_discard_reply().
  }
function xcb_writev(c:Pxcb_connection_t; vector:Piovec; count:longint; requests:Tuint64_t):longint;cdecl;external;
{ xcb_in.c  }
{*
 * @brief Wait for the reply of a given request.
 * @param c The connection to the X server.
 * @param request Sequence number of the request as returned by xcb_send_request().
 * @param e Location to store errors in, or NULL. Ignored for unchecked requests.
 *
 * Returns the reply to the given request or returns null in the event of
 * errors. Blocks until the reply or error for the request arrives, or an I/O
 * error occurs.
  }
function xcb_wait_for_reply(c:Pxcb_connection_t; request:dword; e:PPxcb_generic_error_t):pointer;cdecl;external;
{*
 * @brief Wait for the reply of a given request, with 64-bit sequence number
 * @param c The connection to the X server.
 * @param request 64-bit sequence number of the request as returned by xcb_send_request64().
 * @param e Location to store errors in, or NULL. Ignored for unchecked requests.
 *
 * Returns the reply to the given request or returns null in the event of
 * errors. Blocks until the reply or error for the request arrives, or an I/O
 * error occurs.
 *
 * Unlike its xcb_wait_for_reply() counterpart, the given sequence number is not
 * automatically "widened" to 64-bit.
  }
function xcb_wait_for_reply64(c:Pxcb_connection_t; request:Tuint64_t; e:PPxcb_generic_error_t):pointer;cdecl;external;
{*
 * @brief Poll for the reply of a given request.
 * @param c The connection to the X server.
 * @param request Sequence number of the request as returned by xcb_send_request().
 * @param reply Location to store the reply in, must not be NULL.
 * @param error Location to store errors in, or NULL. Ignored for unchecked requests.
 * @return 1 when the reply to the request was returned, else 0.
 *
 * Checks if the reply to the given request already received. Does not block.
  }
function xcb_poll_for_reply(c:Pxcb_connection_t; request:dword; reply:Ppointer; error:PPxcb_generic_error_t):longint;cdecl;external;
{*
 * @brief Poll for the reply of a given request, with 64-bit sequence number.
 * @param c The connection to the X server.
 * @param request 64-bit sequence number of the request as returned by xcb_send_request().
 * @param reply Location to store the reply in, must not be NULL.
 * @param error Location to store errors in, or NULL. Ignored for unchecked requests.
 * @return 1 when the reply to the request was returned, else 0.
 *
 * Checks if the reply to the given request already received. Does not block.
 *
 * Unlike its xcb_poll_for_reply() counterpart, the given sequence number is not
 * automatically "widened" to 64-bit.
  }
function xcb_poll_for_reply64(c:Pxcb_connection_t; request:Tuint64_t; reply:Ppointer; error:PPxcb_generic_error_t):longint;cdecl;external;
{*
 * @brief Don't use this, only needed by the generated code.
 * @param c The connection to the X server.
 * @param reply A reply that was received from the server
 * @param replylen The size of the reply.
 * @return Pointer to the location where received file descriptors are stored.
  }
function xcb_get_reply_fds(c:Pxcb_connection_t; reply:pointer; replylen:Tsize_t):Plongint;cdecl;external;
{ xcb_util.c  }
{*
 * @param mask The mask to check
 * @return The number of set bits in the mask
  }
function xcb_popcount(mask:Tuint32_t):longint;cdecl;external;
{*
 * @param list The base of an array
 * @param len The length of the array
 * @return The sum of all entries in the array.
  }
function xcb_sumof(list:Puint8_t; len:longint):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
