
unit apr_network_io;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_network_io.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_network_io.h
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
Papr_file_t  = ^apr_file_t;
Papr_hdtr_t  = ^apr_hdtr_t;
Papr_int32_t  = ^apr_int32_t;
Papr_interface_e  = ^apr_interface_e;
Papr_interval_time_t  = ^apr_interval_time_t;
Papr_ipsubnet_t  = ^apr_ipsubnet_t;
Papr_off_t  = ^apr_off_t;
Papr_pool_t  = ^apr_pool_t;
Papr_port_t  = ^apr_port_t;
Papr_shutdown_how_e  = ^apr_shutdown_how_e;
Papr_size_t  = ^apr_size_t;
Papr_sockaddr_t  = ^apr_sockaddr_t;
Papr_socket_t  = ^apr_socket_t;
Papr_uint32_t  = ^apr_uint32_t;
Pchar  = ^char;
Pin_addr  = ^in_addr;
Piovec  = ^iovec;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_NETWORK_IO_H}
{$define APR_NETWORK_IO_H}
{*
 * @file apr_network_io.h
 * @brief APR Network library
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{$include "apr_file_io.h"}
{$include "apr_errno.h"}
{$include "apr_inherit.h" }
{$include "apr_perms_set.h"}
{$if APR_HAVE_NETINET_IN_H}
{$include <netinet/in.h>}
{$endif}
{$if APR_HAVE_SYS_UN_H}
{$include <sys/un.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_network_io Network Routines
 * @ingroup APR 
 * @
  }
{$ifndef APR_MAX_SECS_TO_LINGER}
{* Maximum seconds to linger  }

const
  APR_MAX_SECS_TO_LINGER = 30;  
{$endif}
{$ifndef APRMAXHOSTLEN}
{* Maximum hostname length  }

const
  APRMAXHOSTLEN = 256;  
{$endif}
{$ifndef APR_ANYADDR}
{* Default 'any' address  }

const
  APR_ANYADDR = '0.0.0.0';  
{$endif}
{*
 * @defgroup apr_sockopt Socket option definitions
 * @
  }
{*< Linger  }

const
  APR_SO_LINGER = 1;  
{*< Keepalive  }
  APR_SO_KEEPALIVE = 2;  
{*< Debug  }
  APR_SO_DEBUG = 4;  
{*< Non-blocking IO  }
  APR_SO_NONBLOCK = 8;  
{*< Reuse addresses  }
  APR_SO_REUSEADDR = 16;  
{*< Send buffer  }
  APR_SO_SNDBUF = 64;  
{*< Receive buffer  }
  APR_SO_RCVBUF = 128;  
{*< Disconnected  }
  APR_SO_DISCONNECTED = 256;  
{*< For SCTP sockets, this is mapped
                                   * to STCP_NODELAY internally.
                                    }
  APR_TCP_NODELAY = 512;  
{*< No push  }
  APR_TCP_NOPUSH = 1024;  
{*< This flag is ONLY set internally
                                   * when we set APR_TCP_NOPUSH with
                                   * APR_TCP_NODELAY set to tell us that
                                   * APR_TCP_NODELAY should be turned on
                                   * again when NOPUSH is turned off
                                    }
  APR_RESET_NODELAY = 2048;  
{*< Set on non-blocking sockets
				   * (timeout != 0) on which the
				   * previous read() did not fill a buffer
				   * completely.  the next apr_socket_recv() 
                                   * will first call select()/poll() rather than
				   * going straight into read().  (Can also
				   * be set by an application to force a
				   * select()/poll() call before the next
				   * read, in cases where the app expects
				   * that an immediate read would fail.)
				    }
  APR_INCOMPLETE_READ = 4096;  
{*< like APR_INCOMPLETE_READ, but for write
                                   * @see APR_INCOMPLETE_READ
                                    }
  APR_INCOMPLETE_WRITE = 8192;  
{*< Don't accept IPv4 connections on an
                                   * IPv6 listening socket.
                                    }
  APR_IPV6_V6ONLY = 16384;  
{*< Delay accepting of new connections 
                                    * until data is available.
                                    * @see apr_socket_accept_filter
                                     }
  APR_TCP_DEFER_ACCEPT = 32768;  
{*< Allow broadcast
                                     }
  APR_SO_BROADCAST = 65536;  
{*< Allow binding to addresses not owned
                                    * by any interface
                                     }
  APR_SO_FREEBIND = 131072;  
{* @  }
{* Define what type of socket shutdown should occur.  }
{*< no longer allow read request  }
{*< no longer allow write requests  }
{*< no longer allow read or write requests  }
type
  Papr_shutdown_how_e = ^Tapr_shutdown_how_e;
  Tapr_shutdown_how_e =  Longint;
  Const
    APR_SHUTDOWN_READ = 0;
    APR_SHUTDOWN_WRITE = 1;
    APR_SHUTDOWN_READWRITE = 2;
;
{*< @see apr_sockaddr_info_get()  }
  APR_IPV4_ADDR_OK = $01;  
{*< @see apr_sockaddr_info_get()  }
  APR_IPV6_ADDR_OK = $02;  
{$if (!APR_HAVE_IN_ADDR)}
{*
 * We need to make sure we always have an in_addr type, so APR will just
 * define it ourselves, if the platform doesn't provide it.
  }
{*< storage to hold the IP#  }
type
  Pin_addr = ^Tin_addr;
  Tin_addr = record
      s_addr : Tapr_uint32_t;
    end;

{$endif}
{* @def APR_INADDR_NONE
 * Not all platforms have a real INADDR_NONE.  This macro replaces
 * INADDR_NONE on all platforms.
  }
{$ifdef INADDR_NONE}

const
  APR_INADDR_NONE = INADDR_NONE;  
{$else}

{ was #define dname def_expr }
function APR_INADDR_NONE : dword;  

{$endif}
{*
 * @def APR_INET
 * Not all platforms have these defined, so we'll define them here
 * The default values come from FreeBSD 4.1.1
  }

const
  APR_INET = AF_INET;  
{* @def APR_UNSPEC
 * Let the system decide which address family to use
  }
{$ifdef AF_UNSPEC}
  APR_UNSPEC = AF_UNSPEC;  
{$else}

const
  APR_UNSPEC = 0;  
{$endif}
{$if APR_HAVE_IPV6}
{* @def APR_INET6
* IPv6 Address Family. Not all platforms may have this defined.
 }

const
  APR_INET6 = AF_INET6;  
{$endif}
{$if APR_HAVE_SOCKADDR_UN}
{$if defined (AF_UNIX)}

const
  APR_UNIX = AF_UNIX;  
(*** was #elif ****){$else defined(AF_LOCAL)}

const
  APR_UNIX = AF_LOCAL;  
{$else}
{$error "Neither AF_UNIX nor AF_LOCAL is defined"}
{$endif}
{$else}
{ !APR_HAVE_SOCKADDR_UN  }
{$if defined (AF_UNIX)}

const
  APR_UNIX = AF_UNIX;  
(*** was #elif ****){$else defined(AF_LOCAL)}

const
  APR_UNIX = AF_LOCAL;  
{$else}
{ TODO: Use a smarter way to detect unique APR_UNIX value  }

const
  APR_UNIX = 1234;  
{$endif}
{$endif}
{*
 * @defgroup IP_Proto IP Protocol Definitions for use when creating sockets
 * @
  }
{*< TCP   }

const
  APR_PROTO_TCP = 6;  
{*< UDP   }
  APR_PROTO_UDP = 17;  
{*< SCTP  }
  APR_PROTO_SCTP = 132;  
{* @  }
{*
 * Enum used to denote either the local and remote endpoint of a
 * connection.
  }
{*< Socket information for local end of connection  }
{*< Socket information for remote end of connection  }
type
  Papr_interface_e = ^Tapr_interface_e;
  Tapr_interface_e =  Longint;
  Const
    APR_LOCAL = 0;
    APR_REMOTE = 1;
;
{*
 * The specific declaration of inet_addr's ... some platforms fall back
 * inet_network (this is not good, but necessary)
  }
{$if APR_HAVE_INET_ADDR}

const
  apr_inet_addr = inet_addr;  
(*** was #elif ****){$else APR_HAVE_INET_NETWORK        /* only DGUX, as far as I know */}
{*
 * @warning
 * not generally safe... inet_network() and inet_addr() perform
 * different functions  }

const
  apr_inet_addr = inet_network;  
{$endif}
{* A structure to represent sockets  }
type
{*
 * A structure to encapsulate headers and trailers for apr_socket_sendfile
  }
{* A structure to represent in_addr  }
  Tin_addr = Tapr_in_addr_t;
{* A structure to represent an IP subnet  }
{* @remark use apr_uint16_t just in case some system has a short that isn't 16 bits...  }

  Papr_port_t = ^Tapr_port_t;
  Tapr_port_t = Tapr_uint16_t;
{* @remark It's defined here as I think it should all be platform safe...
 * @see apr_sockaddr_t
  }
{*
 * APRs socket address type, used to ensure protocol independence
  }
{* The pool to use...  }
{* The hostname  }
{* Either a string of the port number or the service name for the port  }
{* The numeric port  }
{* The family  }
{* How big is the sockaddr we're using?  }
{* How big is the ip address structure we're using?  }
{* How big should the address buffer be?  16 for v4 or 46 for v6
     *  used in inet_ntop...  }
{* This points to the IP address structure within the appropriate
     *  sockaddr structure.   }
{* If multiple addresses were found by apr_sockaddr_info_get(), this 
     *  points to a representation of the next address.  }
{* Union of either IPv4 or IPv6 sockaddr.  }
{* IPv4 sockaddr structure  }
{$if APR_HAVE_IPV6}
{* IPv6 sockaddr structure  }
{$endif}
{$if APR_HAVE_SA_STORAGE}
{* Placeholder to ensure that the size of this union is not
         * dependent on whether APR_HAVE_IPV6 is defined.  }
{$endif}
{$if APR_HAVE_SOCKADDR_UN}
{* Unix domain socket sockaddr structure  }
{$endif}
type
  Papr_sockaddr_t = ^Tapr_sockaddr_t;
  Tapr_sockaddr_t = record
      pool : Papr_pool_t;
      hostname : Pchar;
      servname : Pchar;
      port : Tapr_port_t;
      family : Tapr_int32_t;
      salen : Tapr_socklen_t;
      ipaddr_len : longint;
      addr_str_len : longint;
      ipaddr_ptr : pointer;
      next : Papr_sockaddr_t;
      sa : record
          case longint of
            0 : ( sin : Tsockaddr_in );
            1 : ( sin6 : Tsockaddr_in6 );
            2 : ( sas : Tsockaddr_storage );
            3 : ( unx : Tsockaddr_un );
          end;
    end;

{$if APR_HAS_SENDFILE}
{* 
 * Support reusing the socket on platforms which support it (from disconnect,
 * specifically Win32.
 * @remark Optional flag passed into apr_socket_sendfile() 
  }

const
  APR_SENDFILE_DISCONNECT_SOCKET = 1;  
{$endif}
{* A structure to encapsulate headers and trailers for apr_socket_sendfile  }
{* An iovec to store the headers sent before the file.  }
{* number of headers in the iovec  }
{* An iovec to store the trailers sent after the file.  }
{* number of trailers in the iovec  }
type
  Papr_hdtr_t = ^Tapr_hdtr_t;
  Tapr_hdtr_t = record
      headers : Piovec;
      numheaders : longint;
      trailers : Piovec;
      numtrailers : longint;
    end;

{ function definitions  }
{*
 * Create a socket.
 * @param new_sock The new socket that has been set up.
 * @param family The address family of the socket (e.g., APR_INET).
 * @param type The type of the socket (e.g., SOCK_STREAM).
 * @param protocol The protocol of the socket (e.g., APR_PROTO_TCP).
 * @param cont The pool for the apr_socket_t and associated storage.
 * @note The pool will be used by various functions that operate on the
 *       socket. The caller must ensure that it is not used by other threads
 *       at the same time.
  }

function apr_socket_create(new_sock:PPapr_socket_t; family:longint; _type:longint; protocol:longint; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Shutdown either reading, writing, or both sides of a socket.
 * @param thesocket The socket to close 
 * @param how How to shutdown the socket.  One of:
 * <PRE>
 *            APR_SHUTDOWN_READ         no longer allow read requests
 *            APR_SHUTDOWN_WRITE        no longer allow write requests
 *            APR_SHUTDOWN_READWRITE    no longer allow read or write requests 
 * </PRE>
 * @see apr_shutdown_how_e
 * @remark This does not actually close the socket descriptor, it just
 *      controls which calls are still valid on the socket.
  }
function apr_socket_shutdown(thesocket:Papr_socket_t; how:Tapr_shutdown_how_e):Tapr_status_t;cdecl;external;
{*
 * Close a socket.
 * @param thesocket The socket to close 
  }
function apr_socket_close(thesocket:Papr_socket_t):Tapr_status_t;cdecl;external;
{*
 * Bind the socket to its associated port
 * @param sock The socket to bind 
 * @param sa The socket address to bind to
 * @remark This may be where we will find out if there is any other process
 *      using the selected port.
  }
function apr_socket_bind(sock:Papr_socket_t; sa:Papr_sockaddr_t):Tapr_status_t;cdecl;external;
{*
 * Listen to a bound socket for connections.
 * @param sock The socket to listen on 
 * @param backlog The number of outstanding connections allowed in the sockets
 *                listen queue.  If this value is less than zero, the listen
 *                queue size is set to zero.  
  }
function apr_socket_listen(sock:Papr_socket_t; backlog:Tapr_int32_t):Tapr_status_t;cdecl;external;
{*
 * Accept a new connection request
 * @param new_sock A copy of the socket that is connected to the socket that
 *                 made the connection request.  This is the socket which should
 *                 be used for all future communication.
 * @param sock The socket we are listening on.
 * @param connection_pool The pool for the new socket.
 * @note The pool will be used by various functions that operate on the
 *       socket. The caller must ensure that it is not used by other threads
 *       at the same time.
  }
function apr_socket_accept(new_sock:PPapr_socket_t; sock:Papr_socket_t; connection_pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Issue a connection request to a socket either on the same machine 
 * or a different one.
 * @param sock The socket we wish to use for our side of the connection 
 * @param sa The address of the machine we wish to connect to.
  }
function apr_socket_connect(sock:Papr_socket_t; sa:Papr_sockaddr_t):Tapr_status_t;cdecl;external;
{*
 * Determine whether the receive part of the socket has been closed by
 * the peer (such that a subsequent call to apr_socket_read would
 * return APR_EOF), if the socket's receive buffer is empty.  This
 * function does not block waiting for I/O.
 *
 * @param sock The socket to check
 * @param atreadeof If APR_SUCCESS is returned, *atreadeof is set to
 *                  non-zero if a subsequent read would return APR_EOF
 * @return an error is returned if it was not possible to determine the
 *         status, in which case *atreadeof is not changed.
  }
function apr_socket_atreadeof(sock:Papr_socket_t; atreadeof:Plongint):Tapr_status_t;cdecl;external;
{*
 * Create apr_sockaddr_t from hostname, address family, and port.
 * @param sa The new apr_sockaddr_t.
 * @param hostname The hostname or numeric address string to resolve/parse, or
 *               NULL to build an address that corresponds to 0.0.0.0 or ::
 *               or in case of APR_UNIX family it is absolute socket filename.
 * @param family The address family to use, or APR_UNSPEC if the system should 
 *               decide.
 * @param port The port number.
 * @param flags Special processing flags:
 * <PRE>
 *       APR_IPV4_ADDR_OK          first query for IPv4 addresses; only look
 *                                 for IPv6 addresses if the first query failed;
 *                                 only valid if family is APR_UNSPEC and hostname
 *                                 isn't NULL; mutually exclusive with
 *                                 APR_IPV6_ADDR_OK
 *       APR_IPV6_ADDR_OK          first query for IPv6 addresses; only look
 *                                 for IPv4 addresses if the first query failed;
 *                                 only valid if family is APR_UNSPEC and hostname
 *                                 isn't NULL and APR_HAVE_IPV6; mutually exclusive
 *                                 with APR_IPV4_ADDR_OK
 * </PRE>
 * @param p The pool for the apr_sockaddr_t and associated storage.
  }
(* Const before type ignored *)
function apr_sockaddr_info_get(sa:PPapr_sockaddr_t; hostname:Pchar; family:Tapr_int32_t; port:Tapr_port_t; flags:Tapr_int32_t; 
           p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Copy apr_sockaddr_t src to dst on pool p.
 * @param dst The destination apr_sockaddr_t.
 * @param src The source apr_sockaddr_t.
 * @param p The pool for the apr_sockaddr_t and associated storage.
  }
(* Const before type ignored *)
function apr_sockaddr_info_copy(dst:PPapr_sockaddr_t; src:Papr_sockaddr_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Set the zone of an IPv6 link-local address object.
 * @param sa Socket address object
 * @param zone_id Zone ID (textual "eth0" or numeric "3").
 * @return Returns APR_EBADIP for non-IPv6 socket or an IPv6 address
 * which isn't link-local.
  }
(* Const before type ignored *)
function apr_sockaddr_zone_set(sa:Papr_sockaddr_t; zone_id:Pchar):Tapr_status_t;cdecl;external;
{*
 * Retrieve the zone of an IPv6 link-local address object.
 * @param sa Socket address object
 * @param name If non-NULL, set to the textual representation of the zone id
 * @param id If non-NULL, set to the integer zone id
 * @param p Pool from which *name is allocated if used.
 * @return Returns APR_EBADIP for non-IPv6 socket or socket without any zone id
 * set, or other error if the interface could not be mapped to a name.
 * @remark Both name and id may be NULL, neither are modified if
 * non-NULL in error cases.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function apr_sockaddr_zone_get(sa:Papr_sockaddr_t; name:PPchar; id:Papr_uint32_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Look up the host name from an apr_sockaddr_t.
 * @param hostname The hostname.
 * @param sa The apr_sockaddr_t.
 * @param flags Special processing flags.
 * @remark Results can vary significantly between platforms
 * when processing wildcard socket addresses.
  }
function apr_getnameinfo(hostname:PPchar; sa:Papr_sockaddr_t; flags:Tapr_int32_t):Tapr_status_t;cdecl;external;
{*
 * Parse hostname/IP address with scope id and port.
 *
 * Any of the following strings are accepted:
 *   8080                  (just the port number)
 *   www.apache.org        (just the hostname)
 *   www.apache.org:8080   (hostname and port number)
 *   [fe80::1]:80          (IPv6 numeric address string only)
 *   [fe80::1%eth0]        (IPv6 numeric address string and scope id)
 *
 * Invalid strings:
 *                         (empty string)
 *   [abc]                 (not valid IPv6 numeric address string)
 *   abc:65536             (invalid port number)
 *
 * @param addr The new buffer containing just the hostname.  On output, *addr 
 *             will be NULL if no hostname/IP address was specfied.
 * @param scope_id The new buffer containing just the scope id.  On output, 
 *                 *scope_id will be NULL if no scope id was specified.
 * @param port The port number.  On output, *port will be 0 if no port was 
 *             specified.
 *             ### FIXME: 0 is a legal port (per RFC 1700). this should
 *             ### return something besides zero if the port is missing.
 * @param str The input string to be parsed.
 * @param p The pool from which *addr and *scope_id are allocated.
 * @remark If scope id shouldn't be allowed, check for scope_id != NULL in 
 *         addition to checking the return code.  If addr/hostname should be 
 *         required, check for addr == NULL in addition to checking the 
 *         return code.
  }
(* Const before type ignored *)
function apr_parse_addr_port(addr:PPchar; scope_id:PPchar; port:Papr_port_t; str:Pchar; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Get name of the current machine
 * @param buf A buffer to store the hostname in.
 * @param len The maximum length of the hostname that can be stored in the
 *            buffer provided.  The suggested length is APRMAXHOSTLEN + 1.
 * @param cont The pool to use.
 * @remark If the buffer was not large enough, an error will be returned.
  }
function apr_gethostname(buf:Pchar; len:longint; cont:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Return the data associated with the current socket
 * @param data The user data associated with the socket.
 * @param key The key to associate with the user data.
 * @param sock The currently open socket.
  }
(* Const before type ignored *)
function apr_socket_data_get(data:Ppointer; key:Pchar; sock:Papr_socket_t):Tapr_status_t;cdecl;external;
{*
 * Set the data associated with the current socket.
 * @param sock The currently open socket.
 * @param data The user data to associate with the socket.
 * @param key The key to associate with the data.
 * @param cleanup The cleanup to call when the socket is destroyed.
  }
(* Const before type ignored *)
function apr_socket_data_set(sock:Papr_socket_t; data:pointer; key:Pchar; cleanup:function (para1:pointer):Tapr_status_t):Tapr_status_t;cdecl;external;
{*
 * Send data over a network.
 * @param sock The socket to send the data over.
 * @param buf The buffer which contains the data to be sent. 
 * @param len On entry, the number of bytes to send; on exit, the number
 *            of bytes sent.
 * @remark
 * <PRE>
 * This functions acts like a blocking write by default.  To change 
 * this behavior, use apr_socket_timeout_set() or the APR_SO_NONBLOCK
 * socket option.
 *
 * It is possible for both bytes to be sent and an error to be returned.
 *
 * APR_EINTR is never returned.
 * </PRE>
  }
(* Const before type ignored *)
function apr_socket_send(sock:Papr_socket_t; buf:Pchar; len:Papr_size_t):Tapr_status_t;cdecl;external;
{*
 * Send multiple buffers over a network.
 * @param sock The socket to send the data over.
 * @param vec The array of iovec structs containing the data to send 
 * @param nvec The number of iovec structs in the array
 * @param len Receives the number of bytes actually written
 * @remark
 * <PRE>
 * This functions acts like a blocking write by default.  To change 
 * this behavior, use apr_socket_timeout_set() or the APR_SO_NONBLOCK
 * socket option.
 * The number of bytes actually sent is stored in argument 4.
 *
 * It is possible for both bytes to be sent and an error to be returned.
 *
 * APR_EINTR is never returned.
 * </PRE>
  }
(* Const before type ignored *)
function apr_socket_sendv(sock:Papr_socket_t; vec:Piovec; nvec:Tapr_int32_t; len:Papr_size_t):Tapr_status_t;cdecl;external;
{*
 * @param sock The socket to send from
 * @param where The apr_sockaddr_t describing where to send the data
 * @param flags The flags to use
 * @param buf  The data to send
 * @param len  The length of the data to send
  }
(* Const before type ignored *)
function apr_socket_sendto(sock:Papr_socket_t; where:Papr_sockaddr_t; flags:Tapr_int32_t; buf:Pchar; len:Papr_size_t):Tapr_status_t;cdecl;external;
{*
 * Read data from a socket.  On success, the address of the peer from
 * which the data was sent is copied into the @a from parameter, and the
 * @a len parameter is updated to give the number of bytes written to
 * @a buf.
 *
 * @param from Updated with the address from which the data was received
 * @param sock The socket to use
 * @param flags The flags to use
 * @param buf  The buffer to use
 * @param len  The length of the available buffer
  }
function apr_socket_recvfrom(from:Papr_sockaddr_t; sock:Papr_socket_t; flags:Tapr_int32_t; buf:Pchar; len:Papr_size_t):Tapr_status_t;cdecl;external;
{$if APR_HAS_SENDFILE || defined(DOXYGEN)}
{*
 * Send a file from an open file descriptor to a socket, along with 
 * optional headers and trailers
 * @param sock The socket to which we're writing
 * @param file The open file from which to read
 * @param hdtr A structure containing the headers and trailers to send
 * @param offset Offset into the file where we should begin writing
 * @param len (input)  - Number of bytes to send from the file 
 *            (output) - Number of bytes actually sent, 
 *                       including headers, file, and trailers
 * @param flags APR flags that are mapped to OS specific flags
 * @remark This functions acts like a blocking write by default.  To change 
 *         this behavior, use apr_socket_timeout_set() or the
 *         APR_SO_NONBLOCK socket option.
 * The number of bytes actually sent is stored in the len parameter.
 * The offset parameter is passed by reference for no reason; its
 * value will never be modified by the apr_socket_sendfile() function.
  }

function apr_socket_sendfile(sock:Papr_socket_t; file:Papr_file_t; hdtr:Papr_hdtr_t; offset:Papr_off_t; len:Papr_size_t; 
           flags:Tapr_int32_t):Tapr_status_t;cdecl;external;
{$endif}
{ APR_HAS_SENDFILE  }
{*
 * Read data from a network.
 * @param sock The socket to read the data from.
 * @param buf The buffer to store the data in. 
 * @param len On entry, the number of bytes to receive; on exit, the number
 *            of bytes received.
 * @remark
 * <PRE>
 * This functions acts like a blocking read by default.  To change 
 * this behavior, use apr_socket_timeout_set() or the APR_SO_NONBLOCK
 * socket option.
 * The number of bytes actually received is stored in argument 3.
 *
 * It is possible for both bytes to be received and an APR_EOF or
 * other error to be returned.
 *
 * APR_EINTR is never returned.
 * </PRE>
  }

function apr_socket_recv(sock:Papr_socket_t; buf:Pchar; len:Papr_size_t):Tapr_status_t;cdecl;external;
{*
 * Setup socket options for the specified socket
 * @param sock The socket to set up.
 * @param opt The option we would like to configure.  One of:
 * <PRE>
 *            APR_SO_DEBUG      --  turn on debugging information 
 *            APR_SO_KEEPALIVE  --  keep connections active
 *            APR_SO_LINGER     --  lingers on close if data is present
 *            APR_SO_NONBLOCK   --  Turns blocking on/off for socket
 *                                  When this option is enabled, use
 *                                  the APR_STATUS_IS_EAGAIN() macro to
 *                                  see if a send or receive function
 *                                  could not transfer data without
 *                                  blocking.
 *            APR_SO_REUSEADDR  --  The rules used in validating addresses
 *                                  supplied to bind should allow reuse
 *                                  of local addresses.
 *            APR_SO_SNDBUF     --  Set the SendBufferSize
 *            APR_SO_RCVBUF     --  Set the ReceiveBufferSize
 *            APR_SO_FREEBIND   --  Allow binding to non-local IP address.
 * </PRE>
 * @param on Value for the option.
  }
function apr_socket_opt_set(sock:Papr_socket_t; opt:Tapr_int32_t; on:Tapr_int32_t):Tapr_status_t;cdecl;external;
{*
 * Setup socket timeout for the specified socket
 * @param sock The socket to set up.
 * @param t Value for the timeout.
 * <PRE>
 *   t > 0  -- read and write calls return APR_TIMEUP if specified time
 *             elapsess with no data read or written
 *   t == 0 -- read and write calls never block
 *   t < 0  -- read and write calls block
 * </PRE>
  }
function apr_socket_timeout_set(sock:Papr_socket_t; t:Tapr_interval_time_t):Tapr_status_t;cdecl;external;
{*
 * Query socket options for the specified socket
 * @param sock The socket to query
 * @param opt The option we would like to query.  One of:
 * <PRE>
 *            APR_SO_DEBUG      --  turn on debugging information 
 *            APR_SO_KEEPALIVE  --  keep connections active
 *            APR_SO_LINGER     --  lingers on close if data is present
 *            APR_SO_NONBLOCK   --  Turns blocking on/off for socket
 *            APR_SO_REUSEADDR  --  The rules used in validating addresses
 *                                  supplied to bind should allow reuse
 *                                  of local addresses.
 *            APR_SO_SNDBUF     --  Set the SendBufferSize
 *            APR_SO_RCVBUF     --  Set the ReceiveBufferSize
 *            APR_SO_DISCONNECTED -- Query the disconnected state of the socket.
 *                                  (Currently only used on Windows)
 * </PRE>
 * @param on Socket option returned on the call.
  }
function apr_socket_opt_get(sock:Papr_socket_t; opt:Tapr_int32_t; on:Papr_int32_t):Tapr_status_t;cdecl;external;
{*
 * Query socket timeout for the specified socket
 * @param sock The socket to query
 * @param t Socket timeout returned from the query.
  }
function apr_socket_timeout_get(sock:Papr_socket_t; t:Papr_interval_time_t):Tapr_status_t;cdecl;external;
{*
 * Query the specified socket if at the OOB/Urgent data mark
 * @param sock The socket to query
 * @param atmark Is set to true if socket is at the OOB/urgent mark,
 *               otherwise is set to false.
  }
function apr_socket_atmark(sock:Papr_socket_t; atmark:Plongint):Tapr_status_t;cdecl;external;
{*
 * Return an address associated with a socket; either the address to
 * which the socket is bound locally or the address of the peer
 * to which the socket is connected.
 * @param sa The returned apr_sockaddr_t.
 * @param which Whether to retrieve the local or remote address
 * @param sock The socket to use
  }
function apr_socket_addr_get(sa:PPapr_sockaddr_t; which:Tapr_interface_e; sock:Papr_socket_t):Tapr_status_t;cdecl;external;
{*
 * Return the IP address (in numeric address string format) in
 * an APR socket address.  APR will allocate storage for the IP address 
 * string from the pool of the apr_sockaddr_t.
 * @param addr The IP address.
 * @param sockaddr The socket address to reference.
  }
function apr_sockaddr_ip_get(addr:PPchar; sockaddr:Papr_sockaddr_t):Tapr_status_t;cdecl;external;
{*
 * Write the IP address (in numeric address string format) of the APR
 * socket address @a sockaddr into the buffer @a buf (of size @a buflen).
 * @param sockaddr The socket address to reference.
  }
function apr_sockaddr_ip_getbuf(buf:Pchar; buflen:Tapr_size_t; sockaddr:Papr_sockaddr_t):Tapr_status_t;cdecl;external;
{*
 * See if the IP addresses in two APR socket addresses are
 * equivalent.  Appropriate logic is present for comparing
 * IPv4-mapped IPv6 addresses with IPv4 addresses.
 *
 * @param addr1 One of the APR socket addresses.
 * @param addr2 The other APR socket address.
 * @remark The return value will be non-zero if the addresses
 * are equivalent.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function apr_sockaddr_equal(addr1:Papr_sockaddr_t; addr2:Papr_sockaddr_t):longint;cdecl;external;
{*
 * See if the IP address in an APR socket address refers to the wildcard
 * address for the protocol family (e.g., INADDR_ANY for IPv4).
 *
 * @param addr The APR socket address to examine.
 * @remark The return value will be non-zero if the address is
 * initialized and is the wildcard address.
  }
(* Const before type ignored *)
function apr_sockaddr_is_wildcard(addr:Papr_sockaddr_t):longint;cdecl;external;
{*
* Return the type of the socket.
* @param sock The socket to query.
* @param type The returned type (e.g., SOCK_STREAM).
 }
function apr_socket_type_get(sock:Papr_socket_t; _type:Plongint):Tapr_status_t;cdecl;external;
{*
 * Given an apr_sockaddr_t and a service name, set the port for the service
 * @param sockaddr The apr_sockaddr_t that will have its port set
 * @param servname The name of the service you wish to use
  }
(* Const before type ignored *)
function apr_getservbyname(sockaddr:Papr_sockaddr_t; servname:Pchar):Tapr_status_t;cdecl;external;
{*
 * Build an ip-subnet representation from an IP address and optional netmask or
 * number-of-bits.
 * @param ipsub The new ip-subnet representation
 * @param ipstr The input IP address string
 * @param mask_or_numbits The input netmask or number-of-bits string, or NULL
 * @param p The pool to allocate from
  }
(* Const before type ignored *)
(* Const before type ignored *)
function apr_ipsubnet_create(ipsub:PPapr_ipsubnet_t; ipstr:Pchar; mask_or_numbits:Pchar; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Test the IP address in an apr_sockaddr_t against a pre-built ip-subnet
 * representation.
 * @param ipsub The ip-subnet representation
 * @param sa The socket address to test
 * @return non-zero if the socket address is within the subnet, 0 otherwise
  }
function apr_ipsubnet_test(ipsub:Papr_ipsubnet_t; sa:Papr_sockaddr_t):longint;cdecl;external;
{$if APR_HAS_SO_ACCEPTFILTER || defined(DOXYGEN)}
{*
 * Set an OS level accept filter.
 * @param sock The socket to put the accept filter on.
 * @param name The accept filter
 * @param args Any extra args to the accept filter.  Passing NULL here removes
 *             the accept filter. 
 * @bug name and args should have been declared as const char *, as they are in
 * APR 2.0
  }

function apr_socket_accept_filter(sock:Papr_socket_t; name:Pchar; args:Pchar):Tapr_status_t;cdecl;external;
{$endif}
{*
 * Return the protocol of the socket.
 * @param sock The socket to query.
 * @param protocol The returned protocol (e.g., APR_PROTO_TCP).
  }

function apr_socket_protocol_get(sock:Papr_socket_t; protocol:Plongint):Tapr_status_t;cdecl;external;
{*
 * Get the pool used by the socket.
  }
  var
    socket : TAPR_POOL_DECLARE_ACCESSOR;cvar;public;
{*
 * Set a socket to be inherited by child processes.
  }
    socket : TAPR_DECLARE_INHERIT_SET;cvar;public;
{*
 * Unset a socket from being inherited by child processes.
  }
    socket : TAPR_DECLARE_INHERIT_UNSET;cvar;public;
{*
 * Set socket permissions.
  }
    socket : TAPR_PERMS_SET_IMPLEMENT;cvar;public;
{*
 * @defgroup apr_mcast IP Multicast
 * @
  }
{*
 * Join a Multicast Group
 * @param sock The socket to join a multicast group
 * @param join The address of the multicast group to join
 * @param iface Address of the interface to use.  If NULL is passed, the 
 *              default multicast interface will be used. (OS Dependent)
 * @param source Source Address to accept transmissions from (non-NULL 
 *               implies Source-Specific Multicast)
  }

function apr_mcast_join(sock:Papr_socket_t; join:Papr_sockaddr_t; iface:Papr_sockaddr_t; source:Papr_sockaddr_t):Tapr_status_t;cdecl;external;
{*
 * Leave a Multicast Group.  All arguments must be the same as
 * apr_mcast_join.
 * @param sock The socket to leave a multicast group
 * @param addr The address of the multicast group to leave
 * @param iface Address of the interface to use.  If NULL is passed, the 
 *              default multicast interface will be used. (OS Dependent)
 * @param source Source Address to accept transmissions from (non-NULL 
 *               implies Source-Specific Multicast)
  }
function apr_mcast_leave(sock:Papr_socket_t; addr:Papr_sockaddr_t; iface:Papr_sockaddr_t; source:Papr_sockaddr_t):Tapr_status_t;cdecl;external;
{*
 * Set the Multicast Time to Live (ttl) for a multicast transmission.
 * @param sock The socket to set the multicast ttl
 * @param ttl Time to live to Assign. 0-255, default=1
 * @remark If the TTL is 0, packets will only be seen by sockets on 
 * the local machine, and only when multicast loopback is enabled.
  }
function apr_mcast_hops(sock:Papr_socket_t; ttl:Tapr_byte_t):Tapr_status_t;cdecl;external;
{*
 * Toggle IP Multicast Loopback
 * @param sock The socket to set multicast loopback
 * @param opt 0=disable, 1=enable
  }
function apr_mcast_loopback(sock:Papr_socket_t; opt:Tapr_byte_t):Tapr_status_t;cdecl;external;
{*
 * Set the Interface to be used for outgoing Multicast Transmissions.
 * @param sock The socket to set the multicast interface on
 * @param iface Address of the interface to use for Multicast
  }
function apr_mcast_interface(sock:Papr_socket_t; iface:Papr_sockaddr_t):Tapr_status_t;cdecl;external;
{* @  }
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_NETWORK_IO_H  }

implementation

{ was #define dname def_expr }
function APR_INADDR_NONE : dword;
  begin
    APR_INADDR_NONE:=dword($ffffffff);
  end;


end.
