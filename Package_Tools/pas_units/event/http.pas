unit http;

interface

uses
  fp_event;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Pevbuffer = type Pointer;
  Pevent_base = type Pointer;
  Pbufferevent = type Pointer;
  Pevhttp_connection = type Pointer;

const
  HTTP_OK = 200;  
  HTTP_NOCONTENT = 204;
  HTTP_MOVEPERM = 301;
  HTTP_MOVETEMP = 302;
  HTTP_NOTMODIFIED = 304;
  HTTP_BADREQUEST = 400;
  HTTP_NOTFOUND = 404;
  HTTP_BADMETHOD = 405;
  HTTP_ENTITYTOOLARGE = 413;
  HTTP_EXPECTATIONFAILED = 417;
  HTTP_INTERNAL = 500;
  HTTP_NOTIMPLEMENTED = 501;
  HTTP_SERVUNAVAIL = 503;
type
  Pevhttp = type Pointer;
  Pevhttp_request = type Pointer;
  Pevkeyvalq = type Pointer;
  Pevhttp_bound_socket =type Pointer;
  Pevconnlistener =type Pointer;
  Pevdns_base = type Pointer;

function evhttp_new(base:Pevent_base):Pevhttp;cdecl;external libevent;
function evhttp_bind_socket(http:Pevhttp; address:Pchar; port:Tev_uint16_t):longint;cdecl;external libevent;
function evhttp_bind_socket_with_handle(http:Pevhttp; address:Pchar; port:Tev_uint16_t):Pevhttp_bound_socket;cdecl;external libevent;
function evhttp_accept_socket(http:Pevhttp; fd:Tevutil_socket_t):longint;cdecl;external libevent;
function evhttp_accept_socket_with_handle(http:Pevhttp; fd:Tevutil_socket_t):Pevhttp_bound_socket;cdecl;external libevent;
{*
 * The most low-level evhttp_bind/accept method: takes an evconnlistener, and
 * returns an evhttp_bound_socket.  The listener will be freed when the bound
 * socket is freed.
  }
function evhttp_bind_listener(http:Pevhttp; listener:Pevconnlistener):Pevhttp_bound_socket;cdecl;external libevent;
{*
 * Return the listener used to implement a bound socket.
  }
function evhttp_bound_socket_get_listener(bound:Pevhttp_bound_socket):Pevconnlistener;cdecl;external libevent;
type

  Tevhttp_bound_socket_foreach_fn = procedure (para1:Pevhttp_bound_socket; para2:pointer);cdecl;
{*
 * Applies the function specified in the first argument to all
 * evhttp_bound_sockets associated with "http". The user must not
 * attempt to free or remove any connections, sockets or listeners
 * in the callback "function".
 *
 * @param http pointer to an evhttp object
 * @param function function to apply to every bound socket
 * @param argument pointer value passed to function for every socket iterated
  }

procedure evhttp_foreach_bound_socket(http:Pevhttp; _function:Pevhttp_bound_socket_foreach_fn; argument:pointer);cdecl;external libevent;
{*
 * Makes an HTTP server stop accepting connections on the specified socket
 *
 * This may be useful when a socket has been sent via file descriptor passing
 * and is no longer needed by the current process.
 *
 * If you created this bound socket with evhttp_bind_socket_with_handle or
 * evhttp_accept_socket_with_handle, this function closes the fd you provided.
 * If you created this bound socket with evhttp_bind_listener, this function
 * frees the listener you provided.
 *
 * \a bound_socket is an invalid pointer after this call returns.
 *
 * @param http a pointer to an evhttp object
 * @param bound_socket a handle returned by evhttp_bind,accept_socket_with_handle
 * @see evhttp_bind_socket_with_handle(), evhttp_accept_socket_with_handle()
  }
procedure evhttp_del_accept_socket(http:Pevhttp; bound_socket:Pevhttp_bound_socket);cdecl;external libevent;
{*
 * Get the raw file descriptor referenced by an evhttp_bound_socket.
 *
 * @param bound_socket a handle returned by evhttp_bind,accept_socket_with_handle
 * @return the file descriptor used by the bound socket
 * @see evhttp_bind_socket_with_handle(), evhttp_accept_socket_with_handle()
  }
function evhttp_bound_socket_get_fd(bound_socket:Pevhttp_bound_socket):Tevutil_socket_t;cdecl;external libevent;
{*
 * Free the previously created HTTP server.
 *
 * Works only if no requests are currently being served.
 *
 * @param http the evhttp server object to be freed
 * @see evhttp_start()
  }
procedure evhttp_free(http:Pevhttp);cdecl;external libevent;
{* XXX Document.  }
procedure evhttp_set_max_headers_size(http:Pevhttp; max_headers_size:Tev_ssize_t);cdecl;external libevent;
{* XXX Document.  }
procedure evhttp_set_max_body_size(http:Pevhttp; max_body_size:Tev_ssize_t);cdecl;external libevent;
{*
  Set the value to use for the Content-Type header when none was provided. If
  the content type string is NULL, the Content-Type header will not be
  automatically added.

  @param http the http server on which to set the default content type
  @param content_type the value for the Content-Type header
 }
procedure evhttp_set_default_content_type(http:Pevhttp; content_type:Pchar);cdecl;external libevent;
{*
  Sets the what HTTP methods are supported in requests accepted by this
  server, and passed to user callbacks.

  If not supported they will generate a "405 Method not allowed" response.

  By default this includes the following methods: GET, POST, HEAD, PUT, DELETE

  @param http the http server on which to set the methods
  @param methods bit mask constructed from evhttp_cmd_type values
 }
procedure evhttp_set_allowed_methods(http:Pevhttp; methods:Tev_uint16_t);cdecl;external libevent;
{*
   Set a callback for a specified URI

   @param http the http sever on which to set the callback
   @param path the path for which to invoke the callback
   @param cb the callback function that gets invoked on requesting path
   @param cb_arg an additional context argument for the callback
   @return 0 on success, -1 if the callback existed already, -2 on failure
 }
function evhttp_set_cb(http:Pevhttp; path:Pchar; cb:procedure (para1:Pevhttp_request; para2:pointer); cb_arg:pointer):longint;cdecl;external libevent;
{* Removes the callback for a specified URI  }
function evhttp_del_cb(para1:Pevhttp; para2:Pchar):longint;cdecl;external libevent;
{*
    Set a callback for all requests that are not caught by specific callbacks

    Invokes the specified callback for all requests that do not match any of
    the previously specified request paths.  This is catchall for requests not
    specifically configured with evhttp_set_cb().

    @param http the evhttp server object for which to set the callback
    @param cb the callback to invoke for any unmatched requests
    @param arg an context argument for the callback
 }
procedure evhttp_set_gencb(http:Pevhttp; cb:procedure (para1:Pevhttp_request; para2:pointer); arg:pointer);cdecl;external libevent;
{*
   Set a callback used to create new bufferevents for connections
   to a given evhttp object.

   You can use this to override the default bufferevent type -- for example,
   to make this evhttp object use SSL bufferevents rather than unencrypted
   ones.

   New bufferevents must be allocated with no fd set on them.

   @param http the evhttp server object for which to set the callback
   @param cb the callback to invoke for incoming connections
   @param arg an context argument for the callback
  }
procedure evhttp_set_bevcb(http:Pevhttp; cb:function (para1:Pevent_base; para2:pointer):Pbufferevent; arg:pointer);cdecl;external libevent;
{*
   Adds a virtual host to the http server.

   A virtual host is a newly initialized evhttp object that has request
   callbacks set on it via evhttp_set_cb() or evhttp_set_gencb().  It
   most not have any listing sockets associated with it.

   If the virtual host has not been removed by the time that evhttp_free()
   is called on the main http server, it will be automatically freed, too.

   It is possible to have hierarchical vhosts.  For example: A vhost
   with the pattern *.example.com may have other vhosts with patterns
   foo.example.com and bar.example.com associated with it.

   @param http the evhttp object to which to add a virtual host
   @param pattern the glob pattern against which the hostname is matched.
     The match is case insensitive and follows otherwise regular shell
     matching.
   @param vhost the virtual host to add the regular http server.
   @return 0 on success, -1 on failure
   @see evhttp_remove_virtual_host()
 }
function evhttp_add_virtual_host(http:Pevhttp; pattern:Pchar; vhost:Pevhttp):longint;cdecl;external libevent;
{*
   Removes a virtual host from the http server.

   @param http the evhttp object from which to remove the virtual host
   @param vhost the virtual host to remove from the regular http server.
   @return 0 on success, -1 on failure
   @see evhttp_add_virtual_host()
 }
function evhttp_remove_virtual_host(http:Pevhttp; vhost:Pevhttp):longint;cdecl;external libevent;
{*
   Add a server alias to an http object. The http object can be a virtual
   host or the main server.

   @param http the evhttp object
   @param alias the alias to add
   @see evhttp_add_remove_alias()
 }
function evhttp_add_server_alias(http:Pevhttp; alias:Pchar):longint;cdecl;external libevent;
{*
   Remove a server alias from an http object.

   @param http the evhttp object
   @param alias the alias to remove
   @see evhttp_add_server_alias()
 }
function evhttp_remove_server_alias(http:Pevhttp; alias:Pchar):longint;cdecl;external libevent;
{*
 * Set the timeout for an HTTP request.
 *
 * @param http an evhttp object
 * @param timeout_in_secs the timeout, in seconds
  }
procedure evhttp_set_timeout(http:Pevhttp; timeout_in_secs:longint);cdecl;external libevent;
{*
 * Set the timeout for an HTTP request.
 *
 * @param http an evhttp object
 * @param tv the timeout, or NULL
  }
procedure evhttp_set_timeout_tv(http:Pevhttp; tv:Ptimeval);cdecl;external libevent;
{ Read all the clients body, and only after this respond with an error if the
 * clients body exceed max_body_size  }
const
  EVHTTP_SERVER_LINGERING_CLOSE = $0001;  
{*
 * Set connection flags for HTTP server.
 *
 * @see EVHTTP_SERVER_*
 * @return 0 on success, otherwise non zero (for example if flag doesn't
 * supported).
  }

function evhttp_set_flags(http:Pevhttp; flags:longint):longint;cdecl;external libevent;
{ Request/Response functionality  }
{*
 * Send an HTML error message to the client.
 *
 * @param req a request object
 * @param error the HTTP error code
 * @param reason a brief explanation of the error.  If this is NULL, we'll
 *    just use the standard meaning of the error code.
  }
procedure evhttp_send_error(req:Pevhttp_request; error:longint; reason:Pchar);cdecl;external libevent;
{*
 * Send an HTML reply to the client.
 *
 * The body of the reply consists of the data in databuf.  After calling
 * evhttp_send_reply() databuf will be empty, but the buffer is still
 * owned by the caller and needs to be deallocated by the caller if
 * necessary.
 *
 * @param req a request object
 * @param code the HTTP response code to send
 * @param reason a brief message to send with the response code
 * @param databuf the body of the response
  }
procedure evhttp_send_reply(req:Pevhttp_request; code:longint; reason:Pchar; databuf:Pevbuffer);cdecl;external libevent;
{ Low-level response interface, for streaming/chunked replies  }
{*
   Initiate a reply that uses Transfer-Encoding chunked.

   This allows the caller to stream the reply back to the client and is
   useful when either not all of the reply data is immediately available
   or when sending very large replies.

   The caller needs to supply data chunks with evhttp_send_reply_chunk()
   and complete the reply by calling evhttp_send_reply_end().

   @param req a request object
   @param code the HTTP response code to send
   @param reason a brief message to send with the response code
 }
procedure evhttp_send_reply_start(req:Pevhttp_request; code:longint; reason:Pchar);cdecl;external libevent;
{*
   Send another data chunk as part of an ongoing chunked reply.

   The reply chunk consists of the data in databuf.  After calling
   evhttp_send_reply_chunk() databuf will be empty, but the buffer is
   still owned by the caller and needs to be deallocated by the caller
   if necessary.

   @param req a request object
   @param databuf the data chunk to send as part of the reply.
 }
procedure evhttp_send_reply_chunk(req:Pevhttp_request; databuf:Pevbuffer);cdecl;external libevent;
{*
   Send another data chunk as part of an ongoing chunked reply.

   The reply chunk consists of the data in databuf.  After calling
   evhttp_send_reply_chunk() databuf will be empty, but the buffer is
   still owned by the caller and needs to be deallocated by the caller
   if necessary.

   @param req a request object
   @param databuf the data chunk to send as part of the reply.
   @param cb callback funcion
   @param call back's argument.
 }
procedure evhttp_send_reply_chunk_with_cb(para1:Pevhttp_request; para2:Pevbuffer; cb:procedure (para1:Pevhttp_connection; para2:pointer); arg:pointer);cdecl;external libevent;
{*
   Complete a chunked reply, freeing the request as appropriate.

   @param req a request object
 }
procedure evhttp_send_reply_end(req:Pevhttp_request);cdecl;external libevent;
{
 * Interfaces for making requests
  }
{* The different request types supported by evhttp.  These are as specified
 * in RFC2616, except for PATCH which is specified by RFC5789.
 *
 * By default, only some of these methods are accepted and passed to user
 * callbacks; use evhttp_set_allowed_methods() to change which methods
 * are allowed.
  }
type
  Tevhttp_cmd_type =  Longint;
  Const
    EVHTTP_REQ_GET = 1 shl 0;
    EVHTTP_REQ_POST = 1 shl 1;
    EVHTTP_REQ_HEAD = 1 shl 2;
    EVHTTP_REQ_PUT = 1 shl 3;
    EVHTTP_REQ_DELETE = 1 shl 4;
    EVHTTP_REQ_OPTIONS = 1 shl 5;
    EVHTTP_REQ_TRACE = 1 shl 6;
    EVHTTP_REQ_CONNECT = 1 shl 7;
    EVHTTP_REQ_PATCH = 1 shl 8;

{* a request object can represent either a request or a reply  }
type
  Tevhttp_request_kind =  Longint;
  Const
    EVHTTP_REQUEST = 0;
    EVHTTP_RESPONSE = 1;

{*
 * Create and return a connection object that can be used to for making HTTP
 * requests.  The connection object tries to resolve address and establish the
 * connection when it is given an http request object.
 *
 * @param base the event_base to use for handling the connection
 * @param dnsbase the dns_base to use for resolving host names; if not
 *     specified host name resolution will block.
 * @param bev a bufferevent to use for connecting to the server; if NULL, a
 *     socket-based bufferevent will be created.  This buffrevent will be freed
 *     when the connection closes.  It must have no fd set on it.
 * @param address the address to which to connect
 * @param port the port to connect to
 * @return an evhttp_connection object that can be used for making requests or
 *   NULL on error
  }

function evhttp_connection_base_bufferevent_new(base:Pevent_base; dnsbase:Pevdns_base; bev:Pbufferevent; address:Pchar; port:Tev_uint16_t):Pevhttp_connection;cdecl;external libevent;
{*
 * Return the bufferevent that an evhttp_connection is using.
  }
function evhttp_connection_get_bufferevent(evcon:Pevhttp_connection):Pbufferevent;cdecl;external libevent;
{*
 * Return the HTTP server associated with this connection, or NULL.
  }
function evhttp_connection_get_server(evcon:Pevhttp_connection):Pevhttp;cdecl;external libevent;
{*
 * Creates a new request object that needs to be filled in with the request
 * parameters.  The callback is executed when the request completed or an
 * error occurred.
  }
function evhttp_request_new(cb:procedure (para1:Pevhttp_request; para2:pointer); arg:pointer):Pevhttp_request;cdecl;external libevent;
{*
 * Enable delivery of chunks to requestor.
 * @param cb will be called after every read of data with the same argument
 *           as the completion callback. Will never be called on an empty
 *           response. May drain the input buffer; it will be drained
 *           automatically on return.
  }
procedure evhttp_request_set_chunked_cb(para1:Pevhttp_request; cb:procedure (para1:Pevhttp_request; para2:pointer));cdecl;external libevent;
{*
 * Register callback for additional parsing of request headers.
 * @param cb will be called after receiving and parsing the full header.
 * It allows analyzing the header and possibly closing the connection
 * by returning a value < 0.
  }
procedure evhttp_request_set_header_cb(para1:Pevhttp_request; cb:function (para1:Pevhttp_request; para2:pointer):longint);cdecl;external libevent;
{*
 * The different error types supported by evhttp
 *
 * @see evhttp_request_set_error_cb()
  }
{*
   * Timeout reached, also @see evhttp_connection_set_timeout()
    }
{*
   * EOF reached
    }
{*
   * Error while reading header, or invalid header
    }
{*
   * Error encountered while reading or writing
    }
{*
   * The evhttp_cancel_request() called on this request.
    }
{*
   * Body is greater then evhttp_connection_set_max_body_size()
    }
type
  Tevhttp_request_error =  Longint;
  Const
    EVREQ_HTTP_TIMEOUT = 0;
    EVREQ_HTTP_EOF = 1;
    EVREQ_HTTP_INVALID_HEADER = 2;
    EVREQ_HTTP_BUFFER_ERROR = 3;
    EVREQ_HTTP_REQUEST_CANCEL = 4;
    EVREQ_HTTP_DATA_TOO_LONG = 5;

{*
 * Set a callback for errors
 * @see evhttp_request_error for error types.
 *
 * On error, both the error callback and the regular callback will be called,
 * error callback is called before the regular callback.
 * }

procedure evhttp_request_set_error_cb(para1:Pevhttp_request; para2:procedure (para1:Tevhttp_request_error; para2:pointer));cdecl;external libevent;
{*
 * Set a callback to be called on request completion of evhttp_send_* function.
 *
 * The callback function will be called on the completion of the request after
 * the output data has been written and before the evhttp_request object
 * is destroyed. This can be useful for tracking resources associated with a
 * request (ex: timing metrics).
 *
 * @param req a request object
 * @param cb callback function that will be called on request completion
 * @param cb_arg an additional context argument for the callback
  }
procedure evhttp_request_set_on_complete_cb(req:Pevhttp_request; cb:procedure (para1:Pevhttp_request; para2:pointer); cb_arg:pointer);cdecl;external libevent;
{* Frees the request object and removes associated events.  }
procedure evhttp_request_free(req:Pevhttp_request);cdecl;external libevent;
{*
 * Create and return a connection object that can be used to for making HTTP
 * requests.  The connection object tries to resolve address and establish the
 * connection when it is given an http request object.
 *
 * @param base the event_base to use for handling the connection
 * @param dnsbase the dns_base to use for resolving host names; if not
 *     specified host name resolution will block.
 * @param address the address to which to connect
 * @param port the port to connect to
 * @return an evhttp_connection object that can be used for making requests or
 *   NULL on error
  }
function evhttp_connection_base_new(base:Pevent_base; dnsbase:Pevdns_base; address:Pchar; port:Tev_uint16_t):Pevhttp_connection;cdecl;external libevent;
{*
 * Set family hint for DNS requests.
  }
procedure evhttp_connection_set_family(evcon:Pevhttp_connection; family:longint);cdecl;external libevent;
{ reuse connection address on retry  }
const
  EVHTTP_CON_REUSE_CONNECTED_ADDR = $0008;  
{ Try to read error, since server may already send and close
 * connection, but if at that time we have some data to send then we
 * can send get EPIPE and fail, while we can read that HTTP error.  }
  EVHTTP_CON_READ_ON_WRITE_ERROR = $0010;  
{ @see EVHTTP_SERVER_LINGERING_CLOSE  }
  EVHTTP_CON_LINGERING_CLOSE = $0020;  
{ Padding for public flags, @see EVHTTP_CON_* in http-internal.h  }
  EVHTTP_CON_PUBLIC_FLAGS_END = $100000;  
{*
 * Set connection flags.
 *
 * @see EVHTTP_CON_*
 * @return 0 on success, otherwise non zero (for example if flag doesn't
 * supported).
  }

function evhttp_connection_set_flags(evcon:Pevhttp_connection; flags:longint):longint;cdecl;external libevent;
{* Takes ownership of the request object
 *
 * Can be used in a request callback to keep onto the request until
 * evhttp_request_free() is explicitly called by the user.
  }
procedure evhttp_request_own(req:Pevhttp_request);cdecl;external libevent;
{* Returns 1 if the request is owned by the user  }
function evhttp_request_is_owned(req:Pevhttp_request):longint;cdecl;external libevent;
{*
 * Returns the connection object associated with the request or NULL
 *
 * The user needs to either free the request explicitly or call
 * evhttp_send_reply_end().
  }
function evhttp_request_get_connection(req:Pevhttp_request):Pevhttp_connection;cdecl;external libevent;
{*
 * Returns the underlying event_base for this connection
  }
function evhttp_connection_get_base(req:Pevhttp_connection):Pevent_base;cdecl;external libevent;
procedure evhttp_connection_set_max_headers_size(evcon:Pevhttp_connection; new_max_headers_size:Tev_ssize_t);cdecl;external libevent;
procedure evhttp_connection_set_max_body_size(evcon:Pevhttp_connection; new_max_body_size:Tev_ssize_t);cdecl;external libevent;
{* Frees an http connection  }
procedure evhttp_connection_free(evcon:Pevhttp_connection);cdecl;external libevent;
{* Disowns a given connection object
 *
 * Can be used to tell libevent to free the connection object after
 * the last request has completed or failed.
  }
procedure evhttp_connection_free_on_completion(evcon:Pevhttp_connection);cdecl;external libevent;
{* sets the ip address from which http connections are made  }
procedure evhttp_connection_set_local_address(evcon:Pevhttp_connection; address:Pchar);cdecl;external libevent;
{* sets the local port from which http connections are made  }
procedure evhttp_connection_set_local_port(evcon:Pevhttp_connection; port:Tev_uint16_t);cdecl;external libevent;
{* Sets the timeout in seconds for events related to this connection  }
procedure evhttp_connection_set_timeout(evcon:Pevhttp_connection; timeout_in_secs:longint);cdecl;external libevent;
{* Sets the timeout for events related to this connection.  Takes a struct
 * timeval.  }
procedure evhttp_connection_set_timeout_tv(evcon:Pevhttp_connection; tv:Ptimeval);cdecl;external libevent;
{* Sets the delay before retrying requests on this connection. This is only
 * used if evhttp_connection_set_retries is used to make the number of retries
 * at least one. Each retry after the first is twice as long as the one before
 * it.  }
procedure evhttp_connection_set_initial_retry_tv(evcon:Pevhttp_connection; tv:Ptimeval);cdecl;external libevent;
{* Sets the retry limit for this connection - -1 repeats indefinitely  }
procedure evhttp_connection_set_retries(evcon:Pevhttp_connection; retry_max:longint);cdecl;external libevent;
{* Set a callback for connection close.  }
procedure evhttp_connection_set_closecb(evcon:Pevhttp_connection; para2:procedure (para1:Pevhttp_connection; para2:pointer); para3:pointer);cdecl;external libevent;
{* Get the remote address and port associated with this connection.  }
procedure evhttp_connection_get_peer(evcon:Pevhttp_connection; address:PPchar; port:Pev_uint16_t);cdecl;external libevent;
{* Get the remote address associated with this connection.
 * extracted from getpeername() OR from nameserver.
 *
 * @return NULL if getpeername() return non success,
 * or connection is not connected,
 * otherwise it return pointer to struct sockaddr_storage  }
function evhttp_connection_get_addr(evcon:Pevhttp_connection):Psockaddr;cdecl;external libevent;
{*
    Make an HTTP request over the specified connection.

    The connection gets ownership of the request.  On failure, the
    request object is no longer valid as it has been freed.

    @param evcon the evhttp_connection object over which to send the request
    @param req the previously created and configured request object
    @param type the request type EVHTTP_REQ_GET, EVHTTP_REQ_POST, etc.
    @param uri the URI associated with the request
    @return 0 on success, -1 on failure
    @see evhttp_cancel_request()
 }
function evhttp_make_request(evcon:Pevhttp_connection; req:Pevhttp_request; _type:Tevhttp_cmd_type; uri:Pchar):longint;cdecl;external libevent;
{*
   Cancels a pending HTTP request.

   Cancels an ongoing HTTP request.  The callback associated with this request
   is not executed and the request object is freed.  If the request is
   currently being processed, e.g. it is ongoing, the corresponding
   evhttp_connection object is going to get reset.

   A request cannot be canceled if its callback has executed already. A request
   may be canceled reentrantly from its chunked callback.

   @param req the evhttp_request to cancel; req becomes invalid after this call.
 }
procedure evhttp_cancel_request(req:Pevhttp_request);cdecl;external libevent;
{*
 * A structure to hold a parsed URI or Relative-Ref conforming to RFC3986.
  }
type
  Pevhttp_uri = ^Tevhttp_uri;
  Tevhttp_uri = record
      {undefined structure}
    end;

{* Returns the request URI  }

function evhttp_request_get_uri(req:Pevhttp_request):Pchar;cdecl;external libevent;
{* Returns the request URI (parsed)  }
function evhttp_request_get_evhttp_uri(req:Pevhttp_request):Pevhttp_uri;cdecl;external libevent;
{* Returns the request command  }
function evhttp_request_get_command(req:Pevhttp_request):Tevhttp_cmd_type;cdecl;external libevent;
function evhttp_request_get_response_code(req:Pevhttp_request):longint;cdecl;external libevent;
function evhttp_request_get_response_code_line(req:Pevhttp_request):Pchar;cdecl;external libevent;
{* Returns the input headers  }
function evhttp_request_get_input_headers(req:Pevhttp_request):Pevkeyvalq;cdecl;external libevent;
{* Returns the output headers  }
function evhttp_request_get_output_headers(req:Pevhttp_request):Pevkeyvalq;cdecl;external libevent;
{* Returns the input buffer  }
function evhttp_request_get_input_buffer(req:Pevhttp_request):Pevbuffer;cdecl;external libevent;
{* Returns the output buffer  }
function evhttp_request_get_output_buffer(req:Pevhttp_request):Pevbuffer;cdecl;external libevent;
{* Returns the host associated with the request. If a client sends an absolute
    URI, the host part of that is preferred. Otherwise, the input headers are
    searched for a Host: header. NULL is returned if no absolute URI or Host:
    header is provided.  }
function evhttp_request_get_host(req:Pevhttp_request):Pchar;cdecl;external libevent;
{ Interfaces for dealing with HTTP headers  }
{*
   Finds the value belonging to a header.

   @param headers the evkeyvalq object in which to find the header
   @param key the name of the header to find
   @returns a pointer to the value for the header or NULL if the header
     could not be found.
   @see evhttp_add_header(), evhttp_remove_header()
 }
function evhttp_find_header(headers:Pevkeyvalq; key:Pchar):Pchar;cdecl;external libevent;
{*
   Removes a header from a list of existing headers.

   @param headers the evkeyvalq object from which to remove a header
   @param key the name of the header to remove
   @returns 0 if the header was removed, -1  otherwise.
   @see evhttp_find_header(), evhttp_add_header()
 }
function evhttp_remove_header(headers:Pevkeyvalq; key:Pchar):longint;cdecl;external libevent;
{*
   Adds a header to a list of existing headers.

   @param headers the evkeyvalq object to which to add a header
   @param key the name of the header
   @param value the value belonging to the header
   @returns 0 on success, -1  otherwise.
   @see evhttp_find_header(), evhttp_clear_headers()
 }
function evhttp_add_header(headers:Pevkeyvalq; key:Pchar; value:Pchar):longint;cdecl;external libevent;
{*
   Removes all headers from the header list.

   @param headers the evkeyvalq object from which to remove all headers
 }
procedure evhttp_clear_headers(headers:Pevkeyvalq);cdecl;external libevent;
{ Miscellaneous utility functions  }
{*
   Helper function to encode a string for inclusion in a URI.  All
   characters are replaced by their hex-escaped (%22) equivalents,
   except for characters explicitly unreserved by RFC3986 -- that is,
   ASCII alphanumeric characters, hyphen, dot, underscore, and tilde.

   The returned string must be freed by the caller.

   @param str an unencoded string
   @return a newly allocated URI-encoded string or NULL on failure
  }
function evhttp_encode_uri(str:Pchar):Pchar;cdecl;external libevent;
{*
   As evhttp_encode_uri, but if 'size' is nonnegative, treat the string
   as being 'size' bytes long.  This allows you to encode strings that
   may contain 0-valued bytes.

   The returned string must be freed by the caller.

   @param str an unencoded string
   @param size the length of the string to encode, or -1 if the string
      is NUL-terminated
   @param space_to_plus if true, space characters in 'str' are encoded
      as +, not %20.
   @return a newly allocate URI-encoded string, or NULL on failure.
  }
function evhttp_uriencode(str:Pchar; size:Tev_ssize_t; space_to_plus:longint):Pchar;cdecl;external libevent;
{*
  Helper function to sort of decode a URI-encoded string.  Unlike
  evhttp_uridecode, it decodes all plus characters that appear
  _after_ the first question mark character, but no plusses that occur
  before.  This is not a good way to decode URIs in whole or in part.

  The returned string must be freed by the caller

  @deprecated  This function is deprecated; you probably want to use
     evhttp_uridecode instead.

  @param uri an encoded URI
  @return a newly allocated unencoded URI or NULL on failure
  }
function evhttp_decode_uri(uri:Pchar):Pchar;cdecl;external libevent;
{*
  Helper function to decode a URI-escaped string or HTTP parameter.

  If 'decode_plus' is 1, then we decode the string as an HTTP parameter
  value, and convert all plus ('+') characters to spaces.  If
  'decode_plus' is 0, we leave all plus characters unchanged.

  The returned string must be freed by the caller.

  @param uri a URI-encode encoded URI
  @param decode_plus determines whether we convert '+' to space.
  @param size_out if size_out is not NULL, *size_out is set to the size of the
     returned string
  @return a newly allocated unencoded URI or NULL on failure
  }
function evhttp_uridecode(uri:Pchar; decode_plus:longint; size_out:Psize_t):Pchar;cdecl;external libevent;
{*
   Helper function to parse out arguments in a query.

   Parsing a URI like

      http://foo.com/?q=test&s=some+thing

   will result in two entries in the key value queue.

   The first entry is: key="q", value="test"
   The second entry is: key="s", value="some thing"

   @deprecated This function is deprecated as of Libevent 2.0.9.  Use
     evhttp_uri_parse and evhttp_parse_query_str instead.

   @param uri the request URI
   @param headers the head of the evkeyval queue
   @return 0 on success, -1 on failure
  }
function evhttp_parse_query(uri:Pchar; headers:Pevkeyvalq):longint;cdecl;external libevent;
{*
   Helper function to parse out arguments from the query portion of an
   HTTP URI.

   Parsing a query string like

     q=test&s=some+thing

   will result in two entries in the key value queue.

   The first entry is: key="q", value="test"
   The second entry is: key="s", value="some thing"

   @param query_parse the query portion of the URI
   @param headers the head of the evkeyval queue
   @return 0 on success, -1 on failure
  }
function evhttp_parse_query_str(uri:Pchar; headers:Pevkeyvalq):longint;cdecl;external libevent;
{*
 * Escape HTML character entities in a string.
 *
 * Replaces <, >, ", ' and & with &lt;, &gt;, &quot;,
 * &#039; and &amp; correspondingly.
 *
 * The returned string needs to be freed by the caller.
 *
 * @param html an unescaped HTML string
 * @return an escaped HTML string or NULL on error
  }
function evhttp_htmlescape(html:Pchar):Pchar;cdecl;external libevent;
{*
 * Return a new empty evhttp_uri with no fields set.
  }
function evhttp_uri_new:Pevhttp_uri;cdecl;external libevent;
{*
 * Changes the flags set on a given URI.  See EVHTTP_URI_* for
 * a list of flags.
 * }
procedure evhttp_uri_set_flags(uri:Pevhttp_uri; flags:dword);cdecl;external libevent;
{* Return the scheme of an evhttp_uri, or NULL if there is no scheme has
 * been set and the evhttp_uri contains a Relative-Ref.  }
function evhttp_uri_get_scheme(uri:Pevhttp_uri):Pchar;cdecl;external libevent;
{*
 * Return the userinfo part of an evhttp_uri, or NULL if it has no userinfo
 * set.
  }
function evhttp_uri_get_userinfo(uri:Pevhttp_uri):Pchar;cdecl;external libevent;
{*
 * Return the host part of an evhttp_uri, or NULL if it has no host set.
 * The host may either be a regular hostname (conforming to the RFC 3986
 * "regname" production), or an IPv4 address, or the empty string, or a
 * bracketed IPv6 address, or a bracketed 'IP-Future' address.
 *
 * Note that having a NULL host means that the URI has no authority
 * section, but having an empty-string host means that the URI has an
 * authority section with no host part.  For example,
 * "mailto:user@example.com" has a host of NULL, but "file:///etc/motd"
 * has a host of "".
  }
function evhttp_uri_get_host(uri:Pevhttp_uri):Pchar;cdecl;external libevent;
{* Return the port part of an evhttp_uri, or -1 if there is no port set.  }
function evhttp_uri_get_port(uri:Pevhttp_uri):longint;cdecl;external libevent;
{* Return the path part of an evhttp_uri, or NULL if it has no path set  }
function evhttp_uri_get_path(uri:Pevhttp_uri):Pchar;cdecl;external libevent;
{* Return the query part of an evhttp_uri (excluding the leading "?"), or
 * NULL if it has no query set  }
function evhttp_uri_get_query(uri:Pevhttp_uri):Pchar;cdecl;external libevent;
{* Return the fragment part of an evhttp_uri (excluding the leading "#"),
 * or NULL if it has no fragment set  }
function evhttp_uri_get_fragment(uri:Pevhttp_uri):Pchar;cdecl;external libevent;
{* Set the scheme of an evhttp_uri, or clear the scheme if scheme==NULL.
 * Returns 0 on success, -1 if scheme is not well-formed.  }
function evhttp_uri_set_scheme(uri:Pevhttp_uri; scheme:Pchar):longint;cdecl;external libevent;
{* Set the userinfo of an evhttp_uri, or clear the userinfo if userinfo==NULL.
 * Returns 0 on success, -1 if userinfo is not well-formed.  }
function evhttp_uri_set_userinfo(uri:Pevhttp_uri; userinfo:Pchar):longint;cdecl;external libevent;
{* Set the host of an evhttp_uri, or clear the host if host==NULL.
 * Returns 0 on success, -1 if host is not well-formed.  }
function evhttp_uri_set_host(uri:Pevhttp_uri; host:Pchar):longint;cdecl;external libevent;
{* Set the port of an evhttp_uri, or clear the port if port==-1.
 * Returns 0 on success, -1 if port is not well-formed.  }
function evhttp_uri_set_port(uri:Pevhttp_uri; port:longint):longint;cdecl;external libevent;
{* Set the path of an evhttp_uri, or clear the path if path==NULL.
 * Returns 0 on success, -1 if path is not well-formed.  }
function evhttp_uri_set_path(uri:Pevhttp_uri; path:Pchar):longint;cdecl;external libevent;
{* Set the query of an evhttp_uri, or clear the query if query==NULL.
 * The query should not include a leading "?".
 * Returns 0 on success, -1 if query is not well-formed.  }
function evhttp_uri_set_query(uri:Pevhttp_uri; query:Pchar):longint;cdecl;external libevent;
{* Set the fragment of an evhttp_uri, or clear the fragment if fragment==NULL.
 * The fragment should not include a leading "#".
 * Returns 0 on success, -1 if fragment is not well-formed.  }
function evhttp_uri_set_fragment(uri:Pevhttp_uri; fragment:Pchar):longint;cdecl;external libevent;
{*
 * Helper function to parse a URI-Reference as specified by RFC3986.
 *
 * This function matches the URI-Reference production from RFC3986,
 * which includes both URIs like
 *
 *    scheme://[[userinfo]@]foo.com[:port]]/[path][?query][#fragment]
 *
 *  and relative-refs like
 *
 *    [path][?query][#fragment]
 *
 * Any optional elements portions not present in the original URI are
 * left set to NULL in the resulting evhttp_uri.  If no port is
 * specified, the port is set to -1.
 *
 * Note that no decoding is performed on percent-escaped characters in
 * the string; if you want to parse them, use evhttp_uridecode or
 * evhttp_parse_query_str as appropriate.
 *
 * Note also that most URI schemes will have additional constraints that
 * this function does not know about, and cannot check.  For example,
 * mailto://www.example.com/cgi-bin/fortune.pl is not a reasonable
 * mailto url, http://www.example.com:99999/ is not a reasonable HTTP
 * URL, and ftp:username@example.com is not a reasonable FTP URL.
 * Nevertheless, all of these URLs conform to RFC3986, and this function
 * accepts all of them as valid.
 *
 * @param source_uri the request URI
 * @param flags Zero or more EVHTTP_URI_* flags to affect the behavior
 *              of the parser.
 * @return uri container to hold parsed data, or NULL if there is error
 * @see evhttp_uri_free()
  }
function evhttp_uri_parse_with_flags(source_uri:Pchar; flags:dword):Pevhttp_uri;cdecl;external libevent;
{* Tolerate URIs that do not conform to RFC3986.
 *
 * Unfortunately, some HTTP clients generate URIs that, according to RFC3986,
 * are not conformant URIs.  If you need to support these URIs, you can
 * do so by passing this flag to evhttp_uri_parse_with_flags.
 *
 * Currently, these changes are:
 * <ul>
 *   <li> Nonconformant URIs are allowed to contain otherwise unreasonable
 *        characters in their path, query, and fragment components.
 * </ul>
  }
const
  EVHTTP_URI_NONCONFORMANT = $01;  
{* Alias for evhttp_uri_parse_with_flags(source_uri, 0)  }

function evhttp_uri_parse(source_uri:Pchar):Pevhttp_uri;cdecl;external libevent;
{*
 * Free all memory allocated for a parsed uri.  Only use this for URIs
 * generated by evhttp_uri_parse.
 *
 * @param uri container with parsed data
 * @see evhttp_uri_parse()
  }
procedure evhttp_uri_free(uri:Pevhttp_uri);cdecl;external libevent;
{*
 * Join together the uri parts from parsed data to form a URI-Reference.
 *
 * Note that no escaping of reserved characters is done on the members
 * of the evhttp_uri, so the generated string might not be a valid URI
 * unless the members of evhttp_uri are themselves valid.
 *
 * @param uri container with parsed data
 * @param buf destination buffer
 * @param limit destination buffer size
 * @return an joined uri as string or NULL on error
 * @see evhttp_uri_parse()
  }
function evhttp_uri_join(uri:Pevhttp_uri; buf:Pchar; limit:Tsize_t):Pchar;cdecl;external libevent;
{ C++ end of extern C conditionnal removed }
{$endif}
{ EVENT2_HTTP_H_INCLUDED_  }

// === Konventiert am: 26-8-25 19:37:45 ===


implementation



end.
