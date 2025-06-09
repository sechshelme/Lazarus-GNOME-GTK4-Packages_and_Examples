
unit efl_net_server_ssl_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_server_ssl_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_server_ssl_eo.h
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
PEfl_Net_Server_Ssl  = ^Efl_Net_Server_Ssl;
PEfl_Net_Ssl_Context  = ^Efl_Net_Ssl_Context;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SERVER_SSL_EO_H_}
{$define _EFL_NET_SERVER_SSL_EO_H_}
{$ifndef _EFL_NET_SERVER_SSL_EO_CLASS_TYPE}
{$define _EFL_NET_SERVER_SSL_EO_CLASS_TYPE}
type
  PEfl_Net_Server_Ssl = ^TEfl_Net_Server_Ssl;
  TEfl_Net_Server_Ssl = TEo;
{$endif}
{$ifndef _EFL_NET_SERVER_SSL_EO_TYPES}
{$define _EFL_NET_SERVER_SSL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* A SSL server over TCP.
 *
 * @ingroup Efl_Net_Server_Ssl
  }

{ was #define dname def_expr }
function EFL_NET_SERVER_SSL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_server_ssl_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Defines the SSL context to use for this server.
 *
 * This specifies a shared context for all clients, with certificate, private
 * keys, CRL, CAs...
 *
 * If changed in runtime, it will only affect new clients.
 *
 * @param[in] obj The object.
 * @param[in] ssl_context SSL context
 *
 * @ingroup Efl_Net_Server_Ssl
  }
procedure efl_net_server_ssl_context_set(obj:PEo; ssl_context:PEfl_Net_Ssl_Context);cdecl;external;
{*
 * @brief Defines the SSL context to use for this server.
 *
 * This specifies a shared context for all clients, with certificate, private
 * keys, CRL, CAs...
 *
 * If changed in runtime, it will only affect new clients.
 *
 * @param[in] obj The object.
 *
 * @return SSL context
 *
 * @ingroup Efl_Net_Server_Ssl
  }
(* Const before type ignored *)
function efl_net_server_ssl_context_get(obj:PEo):PEfl_Net_Ssl_Context;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SERVER_SSL_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SERVER_SSL_CLASS:=efl_net_server_ssl_class_get;
  end;


end.
