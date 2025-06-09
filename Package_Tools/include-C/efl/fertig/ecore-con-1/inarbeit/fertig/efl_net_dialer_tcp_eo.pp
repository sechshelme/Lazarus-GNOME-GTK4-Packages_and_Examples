
unit efl_net_dialer_tcp_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_dialer_tcp_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_dialer_tcp_eo.h
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
PEfl_Net_Dialer_Tcp  = ^Efl_Net_Dialer_Tcp;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_DIALER_TCP_EO_H_}
{$define _EFL_NET_DIALER_TCP_EO_H_}
{$ifndef _EFL_NET_DIALER_TCP_EO_CLASS_TYPE}
{$define _EFL_NET_DIALER_TCP_EO_CLASS_TYPE}
type
  PEfl_Net_Dialer_Tcp = ^TEfl_Net_Dialer_Tcp;
  TEfl_Net_Dialer_Tcp = TEo;
{$endif}
{$ifndef _EFL_NET_DIALER_TCP_EO_TYPES}
{$define _EFL_NET_DIALER_TCP_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Connects to a remote TCP server.
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
 * @ingroup Efl_Net_Dialer_Tcp
  }

{ was #define dname def_expr }
function EFL_NET_DIALER_TCP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_dialer_tcp_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_DIALER_TCP_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_TCP_CLASS:=efl_net_dialer_tcp_class_get;
  end;


end.
