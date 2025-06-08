
unit efl_net_dialer_http_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_dialer_http_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_dialer_http_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Net_Dialer_Http  = ^Efl_Net_Dialer_Http;
PEfl_Net_Dialer_Http_Primary_Mode  = ^Efl_Net_Dialer_Http_Primary_Mode;
PEfl_Net_Http_Authentication_Method  = ^Efl_Net_Http_Authentication_Method;
PEina_Bool  = ^Eina_Bool;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
Puint64_t  = ^uint64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_DIALER_HTTP_EO_H_}
{$define _EFL_NET_DIALER_HTTP_EO_H_}
{$ifndef _EFL_NET_DIALER_HTTP_EO_CLASS_TYPE}
{$define _EFL_NET_DIALER_HTTP_EO_CLASS_TYPE}
type
  PEfl_Net_Dialer_Http = ^TEfl_Net_Dialer_Http;
  TEfl_Net_Dialer_Http = TEo;
{$endif}
{$ifndef _EFL_NET_DIALER_HTTP_EO_TYPES}
{$define _EFL_NET_DIALER_HTTP_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Primary HTTP mode
 *
 * @ingroup Efl_Net_Dialer_Http_Primary_Mode
  }
{*< HTTP auto mode  }
{*< HTTP download mode  }
{*< HTTP upload mode  }
type
  PEfl_Net_Dialer_Http_Primary_Mode = ^TEfl_Net_Dialer_Http_Primary_Mode;
  TEfl_Net_Dialer_Http_Primary_Mode =  Longint;
  Const
    EFL_NET_DIALER_HTTP_PRIMARY_MODE_AUTO = 0;
    EFL_NET_DIALER_HTTP_PRIMARY_MODE_DOWNLOAD = 1;
    EFL_NET_DIALER_HTTP_PRIMARY_MODE_UPLOAD = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief HTTP Dialer (Client).
 *
 * The effective URL in use, if @ref efl_net_dialer_http_allow_redirects_get is
 * @c true will be available as @ref efl_net_socket_address_remote_get. The
 * @ref efl_net_socket_address_local_get is an IP:PORT pair.
 *
 * The dialer can perform bi-directional information exchanges. It can also do
 * a PUT and upload a file, or GET and download one. It can also do a POST with
 * some form values, including a file, and retrieve its headers and body
 * response. To make usage more streamlined, choose your area of interest with
 * @ref efl_net_dialer_http_primary_mode_get then get some properties such as
 * @ref efl_io_sizer_size_get to report or use the information you need.
 *
 * If @ref efl_net_dialer_http_allow_redirects_get is @c true, multiple
 * "connected" and "resolved" signals will be dispatched, one for each
 * connection. In this case @ref efl_net_dialer_http_response_status_get and
 * @ref efl_net_dialer_http_response_headers_get will keep changing. Using
 * @ref efl_net_dialer_http_response_headers_all_get one can see the whole
 * history of headers and connections.
 *
 * To enable debugging use EINA_LOG_LEVELS=ecore_con:4 environment variable.
 *
 * If the proxy is @c NULL (default), then the system proxy will be used. On
 * UNIX that's the environment variable @c http_proxy (or '$all_proxy') is used
 * if the given address doesn't match @c no_proxy patterns. To disable proxy
 * use an empty string. If provided, the proxy must use one of the following
 * protocols:
 *
 * - http://username:password\@proxyserver:port -
 * http://username\@proxyserver:port - http://proxyserver:port -
 * http://proxyserver  (default port 1080) -
 * socks5://username:password\@proxyserver:port (SOCKSv5) -
 * socks5h://username\@proxyserver:port (let socks server to resolve domain) -
 * socks5://proxyserver:port - socks5://proxyserver (default port 1080) -
 * socks4a://proxyserver:port (SOCKSv4 and let socks server to resolve domain)
 * - socks4://proxyserver:port (SOCKSv4)
 *
 * @ingroup Efl_Net_Dialer_Http
  }

{ was #define dname def_expr }
function EFL_NET_DIALER_HTTP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_dialer_http_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The HTTP method to use.
 *
 * A string representing the HTTP method to use, such as GET, POST, HEAD, PUT,
 * DELETE...
 *
 * This should be set before dialing.
 *
 * @param[in] obj The object.
 * @param[in] method HTTP method
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
procedure efl_net_dialer_http_method_set(obj:PEo; method:Pchar);cdecl;external;
{*
 * @brief The HTTP method to use.
 *
 * A string representing the HTTP method to use, such as GET, POST, HEAD, PUT,
 * DELETE...
 *
 * This should be set before dialing.
 *
 * @param[in] obj The object.
 *
 * @return HTTP method
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_dialer_http_method_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Is this request primarily a download or upload?
 *
 * This property will change the behavior of @ref Efl_Io_Sizer:
 *
 * - If @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_AUTO, then
 * @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_DOWNLOAD or
 * @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_UPLOAD will be chosen based on the
 * @ref efl_net_dialer_http_method_get: if "PUT", then it's upload, otherwise
 * it's download.
 *
 * - If @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_UPLOAD, applying a new size with
 * @ref efl_io_sizer_resize or @ref efl_io_sizer_size_set will specify the
 * "Content-Length" to upload. If no size is previously set, then the upload
 * will happen in "Transfer-encoding: chunked".
 *
 * - If @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_DOWNLOAD, then
 * @ref efl_io_sizer_size_get will report the "Content-Length" provided by the
 * server, if any.
 *
 * You can also provide and retrieve these values using
 * @ref efl_net_dialer_http_request_headers_get (to send) and
 * @ref efl_net_dialer_http_response_headers_get (what was received), as well
 * as using the specific properties
 * @ref efl_net_dialer_http_request_content_length_get (upload) and
 * @ref efl_net_dialer_http_response_content_length_get (download).
 *
 * @param[in] obj The object.
 * @param[in] primary_mode Primary HTTP mode
 *
 * @ingroup Efl_Net_Dialer_Http
  }
procedure efl_net_dialer_http_primary_mode_set(obj:PEo; primary_mode:TEfl_Net_Dialer_Http_Primary_Mode);cdecl;external;
{*
 * @brief Is this request primarily a download or upload?
 *
 * This property will change the behavior of @ref Efl_Io_Sizer:
 *
 * - If @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_AUTO, then
 * @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_DOWNLOAD or
 * @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_UPLOAD will be chosen based on the
 * @ref efl_net_dialer_http_method_get: if "PUT", then it's upload, otherwise
 * it's download.
 *
 * - If @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_UPLOAD, applying a new size with
 * @ref efl_io_sizer_resize or @ref efl_io_sizer_size_set will specify the
 * "Content-Length" to upload. If no size is previously set, then the upload
 * will happen in "Transfer-encoding: chunked".
 *
 * - If @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_DOWNLOAD, then
 * @ref efl_io_sizer_size_get will report the "Content-Length" provided by the
 * server, if any.
 *
 * You can also provide and retrieve these values using
 * @ref efl_net_dialer_http_request_headers_get (to send) and
 * @ref efl_net_dialer_http_response_headers_get (what was received), as well
 * as using the specific properties
 * @ref efl_net_dialer_http_request_content_length_get (upload) and
 * @ref efl_net_dialer_http_response_content_length_get (download).
 *
 * The effective primary mode.
 *
 * This will return one of @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_DOWNLOAD or
 * @ref EFL_NET_DIALER_HTTP_PRIMARY_MODE_UPLOAD. If "auto" was set (the
 * default), then it will pick the best based on the
 * @ref efl_net_dialer_http_method_get in use.
 *
 * @param[in] obj The object.
 *
 * @return Primary HTTP mode
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
function efl_net_dialer_http_primary_mode_get(obj:PEo):TEfl_Net_Dialer_Http_Primary_Mode;cdecl;external;
{*
 * @brief The User-Agent to specify.
 *
 * This should be set before dialing.
 *
 * @param[in] obj The object.
 * @param[in] ser_agent User-agent
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
procedure efl_net_dialer_http_user_agent_set(obj:PEo; ser_agent:Pchar);cdecl;external;
{*
 * @brief The User-Agent to specify.
 *
 * This should be set before dialing.
 *
 * @param[in] obj The object.
 *
 * @return User-agent
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_dialer_http_user_agent_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief The HTTP version to use.
 *
 * This should be set before dialing.
 *
 * Once connected, it will change to the actual connection HTTP version, so
 * check after "connected" event.
 *
 * @param[in] obj The object.
 * @param[in] http_version HTTP version
 *
 * @ingroup Efl_Net_Dialer_Http
  }
procedure efl_net_dialer_http_version_set(obj:PEo; http_version:TEfl_Net_Http_Version);cdecl;external;
{*
 * @brief The HTTP version to use.
 *
 * This should be set before dialing.
 *
 * Once connected, it will change to the actual connection HTTP version, so
 * check after "connected" event.
 *
 * @param[in] obj The object.
 *
 * @return HTTP version
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
function efl_net_dialer_http_version_get(obj:PEo):TEfl_Net_Http_Version;cdecl;external;
{*
 * @brief HTTP authentication to use.
 *
 * This should be set before dialing.
 *
 * @param[in] obj The object.
 * @param[in] username HTTP authentication username
 * @param[in] password HTTP authentication password
 * @param[in] method Authentication method to use. Defaults to
 * @ref EFL_NET_HTTP_AUTHENTICATION_METHOD_BASIC
 * @param[in] restricted Restrict method
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_dialer_http_authentication_set(obj:PEo; username:Pchar; password:Pchar; method:TEfl_Net_Http_Authentication_Method; restricted:TEina_Bool);cdecl;external;
{*
 * @brief HTTP authentication to use.
 *
 * This should be set before dialing.
 *
 * @param[in] obj The object.
 * @param[out] username HTTP authentication username
 * @param[out] password HTTP authentication password
 * @param[out] method Authentication method to use. Defaults to
 * @ref EFL_NET_HTTP_AUTHENTICATION_METHOD_BASIC
 * @param[out] restricted Restrict method
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_dialer_http_authentication_get(obj:PEo; username:PPchar; password:PPchar; method:PEfl_Net_Http_Authentication_Method; restricted:PEina_Bool);cdecl;external;
{*
 * @brief Allows HTTP redirects to be followed.
 *
 * This should be set before dialing.
 *
 * @param[in] obj The object.
 * @param[in] allow_redirects @c true if redirects are followed, @c false
 * otherwise
 *
 * @ingroup Efl_Net_Dialer_Http
  }
procedure efl_net_dialer_http_allow_redirects_set(obj:PEo; allow_redirects:TEina_Bool);cdecl;external;
{*
 * @brief Allows HTTP redirects to be followed.
 *
 * This should be set before dialing.
 *
 * @param[in] obj The object.
 *
 * @return @c true if redirects are followed, @c false otherwise
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
function efl_net_dialer_http_allow_redirects_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Adds a request header 'key: value'.
 *
 * See @ref efl_net_dialer_http_request_headers_clear
 *
 * This should be called before dialing.
 *
 * @param[in] obj The object.
 * @param[in] key Request header key
 * @param[in] value Request header value
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_net_dialer_http_request_header_add(obj:PEo; key:Pchar; value:Pchar);cdecl;external;
{*
 * @brief Clears all request headers.
 *
 * See @ref efl_net_dialer_http_request_header_add
 *
 * This should be called before dialing.
 * @param[in] obj The object.
 *
 * @ingroup Efl_Net_Dialer_Http
  }
procedure efl_net_dialer_http_request_headers_clear(obj:PEo);cdecl;external;
{*
 * @brief Returns an iterator to the key-value pairs for request headers
 *
 * @param[in] obj The object.
 *
 * @return Iterator for request headers
 *
 * @ingroup Efl_Net_Dialer_Http
  }
function efl_net_dialer_http_request_headers_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief "Content-Length:" Header used for uploading/sending.
 *
 * To unset use -1
 *
 * @param[in] obj The object.
 * @param[in] length Length value
 *
 * @ingroup Efl_Net_Dialer_Http
  }
procedure efl_net_dialer_http_request_content_length_set(obj:PEo; length:Tint64_t);cdecl;external;
{*
 * @brief "Content-Length:" Header used for uploading/sending.
 *
 * To unset use -1
 *
 * @param[in] obj The object.
 *
 * @return Length value
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
function efl_net_dialer_http_request_content_length_get(obj:PEo):Tint64_t;cdecl;external;
{$ifdef EFL_NET_DIALER_HTTP_PROTECTED}
{*
 * @brief "Content-Length:" Header used for downloading/receiving.
 *
 * If unset is -1.
 *
 * @param[in] obj The object.
 * @param[in] length Length value
 *
 * @ingroup Efl_Net_Dialer_Http
  }
procedure efl_net_dialer_http_response_content_length_set(obj:PEo; length:Tint64_t);cdecl;external;
{$endif}
{*
 * @brief "Content-Length:" Header used for downloading/receiving.
 *
 * If unset is -1.
 *
 * @param[in] obj The object.
 *
 * @return Length value
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)

function efl_net_dialer_http_response_content_length_get(obj:PEo):Tint64_t;cdecl;external;
{$ifdef EFL_NET_DIALER_HTTP_PROTECTED}
{*
 * @brief "Content-Type:" Header used for downloading/receiving
 *
 * @param[in] obj The object.
 * @param[in] content_type Content type header string
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
procedure efl_net_dialer_http_response_content_type_set(obj:PEo; content_type:Pchar);cdecl;external;
{$endif}
{*
 * @brief "Content-Type:" Header used for downloading/receiving
 *
 * @param[in] obj The object.
 *
 * @return Content type header string
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_net_dialer_http_response_content_type_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief The HTTP response status of this request.
 *
 * This will be 0 if not connected, otherwise it'll be whatever is returned by
 * the server.
 *
 * See https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
 *
 * This will be usable after the "connected" event is dispatched.
 *
 * @param[in] obj The object.
 *
 * @return HTTP status
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
function efl_net_dialer_http_response_status_get(obj:PEo):TEfl_Net_Http_Status;cdecl;external;
{*
 * @brief Returns an iterator to the key-value pairs for the last response
 * headers.
 *
 * Since multiple requests can occur if
 * @ref efl_net_dialer_http_allow_redirects_get is true, then all headers will
 * be accumulated. This method returns only the headers for the last request.
 *
 * To list all the headers, check
 * @ref efl_net_dialer_http_response_headers_all_get.
 *
 * This will be usable after the "headers,done" event is dispatched.
 *
 * @param[in] obj The object.
 *
 * @return Iterator for response headers
 *
 * @ingroup Efl_Net_Dialer_Http
  }
function efl_net_dialer_http_response_headers_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief Returns an iterator to the key-value pairs for all response headers.
 *
 * Since multiple requests can occur if
 * @ref efl_net_dialer_http_allow_redirects_get is true, then all headers will
 * be accumulated. To know when a new request's been started, check for headers
 * with keys being @c NULL. The value will be the "HTTP/VERSION RESPONSE"
 * string received from the host, such as:
 *
 * - key=NULL, value="HTTP/1.1 302 Found" - key="Location",
 * value="http://someredirect.com" - key=NULL, value="HTTP/1.1 200 Ok" -
 * key="Content-Type", value="text/html"
 *
 * This means the original request had a redirect to http://someredirect.com.
 *
 * To receive an iterator to only the last request, use
 * @ref efl_net_dialer_http_response_headers_get
 *
 * This will be usable after the "headers,done" event is dispatched.
 *
 * @param[in] obj The object.
 *
 * @return Iterator for all response headers
 *
 * @ingroup Efl_Net_Dialer_Http
  }
function efl_net_dialer_http_response_headers_all_get(obj:PEo):PEina_Iterator;cdecl;external;
{* Saves memory by disposing of the received headers
 *
 * @ingroup Efl_Net_Dialer_Http
  }
procedure efl_net_dialer_http_response_headers_clear(obj:PEo);cdecl;external;
{*
 * @brief How many bytes were downloaded and how many were expected.
 *
 * @param[in] obj The object.
 * @param[out] downloaded Downloaded bytes so far
 * @param[out] total Download total in bytes, 0 if unknown
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
procedure efl_net_dialer_http_progress_download_get(obj:PEo; downloaded:Puint64_t; total:Puint64_t);cdecl;external;
{*
 * @brief How many bytes were uploaded and how many were expected.
 *
 * @param[in] obj The object.
 * @param[out] uploaded Uploaded bytes so far
 * @param[out] total Upload total in bytes, 0 if unknown
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
procedure efl_net_dialer_http_progress_upload_get(obj:PEo; uploaded:Puint64_t; total:Puint64_t);cdecl;external;
{*
 * @brief This property sets the filename to read and write cookies.
 *
 * By setting a file to load and store cookies, the internal cookie system will
 * be activated, automatically handling HTTP headers such as 'Set-cookie:' and
 * sending the appropriate cookies for the server.
 *
 * If a new, empty session is to be used, start with an empty or non-existent
 * file such as created with eina_file_mkstemp() or tmpfile(). Alternatively
 * use an empty string ("") to store it in memory.
 *
 * If you want to start from a pre-existing cookie jar but do not want to
 * modify it, first copy that file and then pass the new, temporary file.
 *
 * Likewise, if you want to add cookies to the system, create a cookie jar and
 * pass its path to this property.
 *
 * @note that whenever this property is set, even if to the same value, it will
 * flush all cookies to the previously set file, then erase all known cookies.
 * It will then use the new file (if any).
 *
 * @param[in] obj The object.
 * @param[in] path Path to cookie jar
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
procedure efl_net_dialer_http_cookie_jar_set(obj:PEo; path:Pchar);cdecl;external;
{*
 * @brief This property sets the filename to read and write cookies.
 *
 * By setting a file to load and store cookies, the internal cookie system will
 * be activated, automatically handling HTTP headers such as 'Set-cookie:' and
 * sending the appropriate cookies for the server.
 *
 * If a new, empty session is to be used, start with an empty or non-existent
 * file such as created with eina_file_mkstemp() or tmpfile(). Alternatively
 * use an empty string ("") to store it in memory.
 *
 * If you want to start from a pre-existing cookie jar but do not want to
 * modify it, first copy that file and then pass the new, temporary file.
 *
 * Likewise, if you want to add cookies to the system, create a cookie jar and
 * pass its path to this property.
 *
 * @note that whenever this property is set, even if to the same value, it will
 * flush all cookies to the previously set file, then erase all known cookies.
 * It will then use the new file (if any).
 *
 * @param[in] obj The object.
 *
 * @return Path to cookie jar
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_dialer_http_cookie_jar_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief If remote peer's SSL certificate should be verified.
 *
 * Defaults to both peer and hostname verification (all @c true).
 *
 * @param[in] obj The object.
 * @param[in] peer If @c true, SSL certificate will be verified. If @c false,
 * untrusted certificates (including self signed) will be accepted.
 * @param[in] hostname If @c true, in addition to SSL certificate validation
 * the server name will be matched to certificate DNS entries
 *
 * @ingroup Efl_Net_Dialer_Http
  }
procedure efl_net_dialer_http_ssl_verify_set(obj:PEo; peer:TEina_Bool; hostname:TEina_Bool);cdecl;external;
{*
 * @brief If remote peer's SSL certificate should be verified.
 *
 * Defaults to both peer and hostname verification (all @c true).
 *
 * @param[in] obj The object.
 * @param[out] peer If @c true, SSL certificate will be verified. If @c false,
 * untrusted certificates (including self signed) will be accepted.
 * @param[out] hostname If @c true, in addition to SSL certificate validation
 * the server name will be matched to certificate DNS entries
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
procedure efl_net_dialer_http_ssl_verify_get(obj:PEo; peer:PEina_Bool; hostname:PEina_Bool);cdecl;external;
{*
 * @brief Overrides the CA (Certificate Authority) path or directory.
 *
 * Defaults to system setup.
 *
 * @param[in] obj The object.
 * @param[in] path Directory or file path to use for Certificate Authority
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
procedure efl_net_dialer_http_ssl_certificate_authority_set(obj:PEo; path:Pchar);cdecl;external;
{*
 * @brief Overrides the CA (Certificate Authority) path or directory.
 *
 * Defaults to system setup.
 *
 * @param[in] obj The object.
 *
 * @return Directory or file path to use for Certificate Authority
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_dialer_http_ssl_certificate_authority_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Defines a CRL (Certificate Revocation List) path to use.
 *
 * @param[in] obj The object.
 * @param[in] file File path to use for CRL
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
procedure efl_net_dialer_http_ssl_certificate_revocation_list_set(obj:PEo; file:Pchar);cdecl;external;
{*
 * @brief Defines a CRL (Certificate Revocation List) path to use.
 *
 * @param[in] obj The object.
 *
 * @return File path to use for CRL
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_dialer_http_ssl_certificate_revocation_list_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Parses the given string as time in seconds since 1/1/1970.
 *
 * This method is useful to parse header values such as "Last-Modified".
 *
 * @param[in] str String in HTTP text format: Tue, 15 Nov 1994 12:45:26 GMT
 *
 * @return Seconds since 1/1/1970
 *
 * @ingroup Efl_Net_Dialer_Http
  }
(* Const before type ignored *)
function efl_net_dialer_http_date_parse(str:Pchar):Tint64_t;cdecl;external;
{*
 * @brief Serializes the given GMT time in seconds since 1/1/1970.
 *
 * The timezone must be GMT (ie: gmtime()).
 *
 * @param[in] epochtime UNIX Epoch time - seconds since 1/1/1970
 *
 * @return Newly allocated null-terminated string on success or @c NULL on
 * errors
 *
 * @ingroup Efl_Net_Dialer_Http
  }
function efl_net_dialer_http_date_serialize(epochtime:Tint64_t):Pchar;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_NET_DIALER_HTTP_EVENT_HEADERS_DONE : TEfl_Event_Description;cvar;external;
{* Notifies all headers were parsed and are available.
 *
 * @ingroup Efl_Net_Dialer_Http
  }

{ was #define dname def_expr }
function EFL_NET_DIALER_HTTP_EVENT_HEADERS_DONE : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_DIALER_HTTP_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_HTTP_CLASS:=efl_net_dialer_http_class_get;
  end;

{ was #define dname def_expr }
function EFL_NET_DIALER_HTTP_EVENT_HEADERS_DONE : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_HTTP_EVENT_HEADERS_DONE:=@(_EFL_NET_DIALER_HTTP_EVENT_HEADERS_DONE);
  end;


end.
