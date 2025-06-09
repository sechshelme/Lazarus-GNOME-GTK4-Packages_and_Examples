
unit Efl_Net;
interface

{
  Automatically converted by H2Pas 1.0.0 from Efl_Net.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Efl_Net.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_H}
{$define _EFL_NET_H}
{$include <time.h>}
{$include <libgen.h>}
{$ifdef _WIN32}
{$include <ws2tcpip.h>}
{$else}
{$include <netdb.h>}
{$endif}
{$define __EFL_NET_IS_REQUIRED}
{$include <Efl_Core.h>}
{$include <ecore_con_api.h>}
{ C++ extern C conditionnal removed }
{*
 * @brief Initializes the Ecore_Con library.
 * @return  Number of times the library has been initialised without being
 *          shut down.
 *
 * @note This function already calls ecore_init() internally, so you don't need
 * to call it explicitly.
  }

function ecore_con_init:longint;cdecl;external;
{*
 * @brief Shuts down the Ecore_Con library.
 * @return  Number of times the library has been initialised without being
 *          shut down.
 * @note This function already calls ecore_shutdown() internally, so you don't
 * need to call it explicitly unless you called ecore_init() explicitly too.
  }
function ecore_con_shutdown:longint;cdecl;external;
{*
 * @brief Initializes the Ecore_Con_Url library.
 * @return Number of times the library has been initialised without being
 *          shut down.
 *
 * @note This function doesn't call ecore_con_init(). You still need to call it
 * explicitly before calling this one.
  }
function ecore_con_url_init:longint;cdecl;external;
{*
 * @brief Shuts down the Ecore_Con_Url library.
 * @return  Number of calls that still uses Ecore_Con_Url
 *
 * @note This function doesn't call ecore_con_shutdown(). You still need to call
 * it explicitly after calling this one.
  }
function ecore_con_url_shutdown:longint;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{* HTTP error: bad content encoding  }
  var
    EFL_NET_HTTP_ERROR_BAD_CONTENT_ENCODING : TEina_Error;cvar;external;
{* HTTP error: bad download resume  }
    EFL_NET_HTTP_ERROR_BAD_DOWNLOAD_RESUME : TEina_Error;cvar;external;
{* HTTP error: bad function argument  }
    EFL_NET_HTTP_ERROR_BAD_FUNCTION_ARGUMENT : TEina_Error;cvar;external;
{* HTTP error: chunk failed  }
    EFL_NET_HTTP_ERROR_CHUNK_FAILED : TEina_Error;cvar;external;
{* HTTP error: conv failed  }
    EFL_NET_HTTP_ERROR_CONV_FAILED : TEina_Error;cvar;external;
{* HTTP error: conv reqd  }
    EFL_NET_HTTP_ERROR_CONV_REQD : TEina_Error;cvar;external;
{* HTTP error: failed init  }
    EFL_NET_HTTP_ERROR_FAILED_INIT : TEina_Error;cvar;external;
{* HTTP error: could not read file  }
    EFL_NET_HTTP_ERROR_FILE_COULDNT_READ_FILE : TEina_Error;cvar;external;
{* HTTP error: filesize exceeded  }
    EFL_NET_HTTP_ERROR_FILESIZE_EXCEEDED : TEina_Error;cvar;external;
{* HTTP error: function not found  }
    EFL_NET_HTTP_ERROR_FUNCTION_NOT_FOUND : TEina_Error;cvar;external;
{* HTTP error: got nothing  }
    EFL_NET_HTTP_ERROR_GOT_NOTHING : TEina_Error;cvar;external;
{* HTTP error: http2  }
    EFL_NET_HTTP_ERROR_HTTP2 : TEina_Error;cvar;external;
{* HTTP error: http2 stream  }
    EFL_NET_HTTP_ERROR_HTTP2_STREAM : TEina_Error;cvar;external;
{* HTTP error: http post error  }
    EFL_NET_HTTP_ERROR_HTTP_POST_ERROR : TEina_Error;cvar;external;
{* HTTP error: http returned error  }
    EFL_NET_HTTP_ERROR_HTTP_RETURNED_ERROR : TEina_Error;cvar;external;
{* HTTP error: interface failed  }
    EFL_NET_HTTP_ERROR_INTERFACE_FAILED : TEina_Error;cvar;external;
{* HTTP error: login denied  }
    EFL_NET_HTTP_ERROR_LOGIN_DENIED : TEina_Error;cvar;external;
{* HTTP error: no connection available  }
    EFL_NET_HTTP_ERROR_NO_CONNECTION_AVAILABLE : TEina_Error;cvar;external;
{* HTTP error: not built in  }
    EFL_NET_HTTP_ERROR_NOT_BUILT_IN : TEina_Error;cvar;external;
{* HTTP error: operation timeout  }
    EFL_NET_HTTP_ERROR_OPERATION_TIMEDOUT : TEina_Error;cvar;external;
{* HTTP error: partial file  }
    EFL_NET_HTTP_ERROR_PARTIAL_FILE : TEina_Error;cvar;external;
{* HTTP error: peer failed verification  }
    EFL_NET_HTTP_ERROR_PEER_FAILED_VERIFICATION : TEina_Error;cvar;external;
{* HTTP error: range error  }
    EFL_NET_HTTP_ERROR_RANGE_ERROR : TEina_Error;cvar;external;
{* HTTP error: read error  }
    EFL_NET_HTTP_ERROR_READ_ERROR : TEina_Error;cvar;external;
{* HTTP error: receive error  }
    EFL_NET_HTTP_ERROR_RECV_ERROR : TEina_Error;cvar;external;
{* HTTP error: remote access denied  }
    EFL_NET_HTTP_ERROR_REMOTE_ACCESS_DENIED : TEina_Error;cvar;external;
{* HTTP error: remote disk full  }
    EFL_NET_HTTP_ERROR_REMOTE_DISK_FULL : TEina_Error;cvar;external;
{* HTTP error: remote file exists  }
    EFL_NET_HTTP_ERROR_REMOTE_FILE_EXISTS : TEina_Error;cvar;external;
{* HTTP error: remote file not found  }
    EFL_NET_HTTP_ERROR_REMOTE_FILE_NOT_FOUND : TEina_Error;cvar;external;
{* HTTP error: send error  }
    EFL_NET_HTTP_ERROR_SEND_ERROR : TEina_Error;cvar;external;
{* HTTP error: send fail rewind  }
    EFL_NET_HTTP_ERROR_SEND_FAIL_REWIND : TEina_Error;cvar;external;
{* HTTP error: SSL cacert  }
    EFL_NET_HTTP_ERROR_SSL_CACERT : TEina_Error;cvar;external;
{* HTTP error: SSL cacert bad file  }
    EFL_NET_HTTP_ERROR_SSL_CACERT_BADFILE : TEina_Error;cvar;external;
{* HTTP error: SSL certproblem  }
    EFL_NET_HTTP_ERROR_SSL_CERTPROBLEM : TEina_Error;cvar;external;
{* HTTP error: SSL cipher  }
    EFL_NET_HTTP_ERROR_SSL_CIPHER : TEina_Error;cvar;external;
{* HTTP error: SSL connect error  }
    EFL_NET_HTTP_ERROR_SSL_CONNECT_ERROR : TEina_Error;cvar;external;
{* HTTP error: SSL crl bad file  }
    EFL_NET_HTTP_ERROR_SSL_CRL_BADFILE : TEina_Error;cvar;external;
{* HTTP error: SSL engine init failed  }
    EFL_NET_HTTP_ERROR_SSL_ENGINE_INITFAILED : TEina_Error;cvar;external;
{* HTTP error: SSL engine not found  }
    EFL_NET_HTTP_ERROR_SSL_ENGINE_NOTFOUND : TEina_Error;cvar;external;
{* HTTP error: SSL engine set failed  }
    EFL_NET_HTTP_ERROR_SSL_ENGINE_SETFAILED : TEina_Error;cvar;external;
{* HTTP error: SSL invalid cert status  }
    EFL_NET_HTTP_ERROR_SSL_INVALIDCERTSTATUS : TEina_Error;cvar;external;
{* HTTP error: SSL issuer error  }
    EFL_NET_HTTP_ERROR_SSL_ISSUER_ERROR : TEina_Error;cvar;external;
{* HTTP error: SSL pinned pub key does not match  }
    EFL_NET_HTTP_ERROR_SSL_PINNEDPUBKEYNOTMATCH : TEina_Error;cvar;external;
{* HTTP error: SSL shutdown failed  }
    EFL_NET_HTTP_ERROR_SSL_SHUTDOWN_FAILED : TEina_Error;cvar;external;
{* HTTP error: too many redirects  }
    EFL_NET_HTTP_ERROR_TOO_MANY_REDIRECTS : TEina_Error;cvar;external;
{* HTTP error: unknown option  }
    EFL_NET_HTTP_ERROR_UNKNOWN_OPTION : TEina_Error;cvar;external;
{* HTTP error: unsupported protocol  }
    EFL_NET_HTTP_ERROR_UNSUPPORTED_PROTOCOL : TEina_Error;cvar;external;
{* HTTP error: upload failed  }
    EFL_NET_HTTP_ERROR_UPLOAD_FAILED : TEina_Error;cvar;external;
{* HTTP error: URL mal-formatted  }
    EFL_NET_HTTP_ERROR_URL_MALFORMAT : TEina_Error;cvar;external;
{* HTTP error: usage of SSL failed  }
    EFL_NET_HTTP_ERROR_USE_SSL_FAILED : TEina_Error;cvar;external;
{* HTTP error: write error  }
    EFL_NET_HTTP_ERROR_WRITE_ERROR : TEina_Error;cvar;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$include "efl_net_types.eot.h"}
{$include "efl_net_ip_address.eo.h"}
{$include "efl_net_socket.eo.h"}
{$include "efl_net_dialer.eo.h"}
{$include "efl_net_server.eo.h"}
{$include "efl_net_socket_simple.eo.h"}
{$include "efl_net_dialer_simple.eo.h"}
{$include "efl_net_server_simple.eo.h"}
{$include "efl_net_socket_fd.eo.h"}
{$include "efl_net_server_fd.eo.h"}
{$include "efl_net_server_ip.eo.h"}
{$include "efl_net_socket_tcp.eo.h"}
{$include "efl_net_dialer_tcp.eo.h"}
{$include "efl_net_server_tcp.eo.h"}
{$ifdef _WIN32}
{$include "efl_net_socket_windows.eo.h"}
{$include "efl_net_dialer_windows.eo.h"}
{$include "efl_net_server_windows.eo.h"}
{$else}
{$include "efl_net_socket_unix.eo.h"}
{$include "efl_net_dialer_unix.eo.h"}
{$include "efl_net_server_unix.eo.h"}
{$endif}
{$include "efl_net_socket_udp.eo.h"}
{$include "efl_net_dialer_udp.eo.h"}
{$include "efl_net_server_udp.eo.h"}
{$include "efl_net_server_udp_client.eo.h"}
{$include "efl_net_http_types.eot.h"}
{$include "efl_net_dialer_http.eo.h"}
{$include "efl_net_dialer_websocket.eo.h"}
{$include "efl_net_ssl_types.eot.h"}
{$include "efl_net_ssl_context.eo.h"}
{$include "efl_net_socket_ssl.eo.h"}
{$include "efl_net_dialer_ssl.eo.h"}
{$include "efl_net_server_ssl.eo.h"}
{$include "efl_net_control_technology.eo.h"}
{$include "efl_net_control_access_point.eo.h"}
{$include "efl_net_control_manager.eo.h"}
{$include "efl_net_session.eo.h"}
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
