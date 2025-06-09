
unit efl_net_dialer_ssl_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_dialer_ssl_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_dialer_ssl_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Net_Dialer_Ssl  = ^Efl_Net_Dialer_Ssl;
PEfl_Net_Ssl_Context  = ^Efl_Net_Ssl_Context;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_DIALER_SSL_EO_H_}
{$define _EFL_NET_DIALER_SSL_EO_H_}
{$ifndef _EFL_NET_DIALER_SSL_EO_CLASS_TYPE}
{$define _EFL_NET_DIALER_SSL_EO_CLASS_TYPE}
type
  PEfl_Net_Dialer_Ssl = ^TEfl_Net_Dialer_Ssl;
  TEfl_Net_Dialer_Ssl = TEo;
{$endif}
{$ifndef _EFL_NET_DIALER_SSL_EO_TYPES}
{$define _EFL_NET_DIALER_SSL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Connects to a remote SSL server using TCP.
 *
 * This creates an internal @ref Efl_Net_Dialer_Tcp and once connected it will
 * start the SSL handshake.
 *
 * If the proxy is @c NULL (default), then the system proxy will be used. On
 * UNIX that's the environment variable @c socks_proxy (or '$proxy' or
 * '$all_proxy') is used if the given address doesn't match @c no_proxy
 * patterns. To disable proxy use an empty string.
 *
 * If the proxy is @c NULL (default), then the system proxy will be used. On
 * UNIX that's the environment variable @c socks_proxy (or '$all_proxy') is
 * used if the given address doesn't match @c no_proxy patterns. To disable
 * proxy use an empty string. If provided proxy must be one of the protocols:
 *
 * - socks5://username:password\@proxyserver:port (SOCKSv5) -
 * socks5h://username\@proxyserver:port (let socks server to resolve domain) -
 * socks5://proxyserver:port - socks5://proxyserver (default port 1080) -
 * socks4a://proxyserver:port (SOCKSv4 and let socks server to resolve domain)
 * - socks4://proxyserver:port (SOCKSv4)
 *
 * @ingroup Efl_Net_Dialer_Ssl
  }

{ was #define dname def_expr }
function EFL_NET_DIALER_SSL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_dialer_ssl_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Defines the SSL context to use for this dialer.
 *
 * This specifies a shared context for all clients, with certificate, private
 * keys, CRL, CAs...
 *
 * It must be called before @ref efl_finalize!
 *
 * @param[in] obj The object.
 * @param[in] ssl_context SSL context
 *
 * @ingroup Efl_Net_Dialer_Ssl
  }
procedure efl_net_dialer_ssl_context_set(obj:PEo; ssl_context:PEfl_Net_Ssl_Context);cdecl;external;
{*
 * @brief Defines the SSL context to use for this dialer.
 *
 * This specifies a shared context for all clients, with certificate, private
 * keys, CRL, CAs...
 *
 * It must be called before @ref efl_finalize!
 *
 * @param[in] obj The object.
 *
 * @return SSL context
 *
 * @ingroup Efl_Net_Dialer_Ssl
  }
(* Const before type ignored *)
function efl_net_dialer_ssl_context_get(obj:PEo):PEfl_Net_Ssl_Context;cdecl;external;
{*
 * @brief Controls keep-alive using SO_KEEPALIVE
 *
 * @param[in] obj The object.
 * @param[in] keep_alive @c true if keep alive is enabled, @c false otherwise
 *
 * @return @c true on success
 *
 * @ingroup Efl_Net_Dialer_Ssl
  }
function efl_net_dialer_ssl_keep_alive_set(obj:PEo; keep_alive:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Controls keep-alive using SO_KEEPALIVE
 *
 * @param[in] obj The object.
 *
 * @return @c true if keep alive is enabled, @c false otherwise
 *
 * @ingroup Efl_Net_Dialer_Ssl
  }
(* Const before type ignored *)
function efl_net_dialer_ssl_keep_alive_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Controls TCP's no-delay using TCP_NODELAY
 *
 * @param[in] obj The object.
 * @param[in] no_delay @c true if no delay is enabled, @c false otherwise
 *
 * @return @c true on success
 *
 * @ingroup Efl_Net_Dialer_Ssl
  }
function efl_net_dialer_ssl_no_delay_set(obj:PEo; no_delay:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Controls TCP's no-delay using TCP_NODELAY
 *
 * @param[in] obj The object.
 *
 * @return @c true if no delay is enabled, @c false otherwise
 *
 * @ingroup Efl_Net_Dialer_Ssl
  }
(* Const before type ignored *)
function efl_net_dialer_ssl_no_delay_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_DIALER_SSL_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_SSL_CLASS:=efl_net_dialer_ssl_class_get;
  end;


end.
