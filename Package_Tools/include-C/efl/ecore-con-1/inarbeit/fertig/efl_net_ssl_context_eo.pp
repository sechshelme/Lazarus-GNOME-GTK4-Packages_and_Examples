
unit efl_net_ssl_context_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_ssl_context_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_ssl_context_eo.h
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
PEfl_Net_Ssl_Context  = ^Efl_Net_Ssl_Context;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SSL_CONTEXT_EO_H_}
{$define _EFL_NET_SSL_CONTEXT_EO_H_}
{$ifndef _EFL_NET_SSL_CONTEXT_EO_CLASS_TYPE}
{$define _EFL_NET_SSL_CONTEXT_EO_CLASS_TYPE}
type
  PEfl_Net_Ssl_Context = ^TEfl_Net_Ssl_Context;
  TEfl_Net_Ssl_Context = TEo;
{$endif}
{$ifndef _EFL_NET_SSL_CONTEXT_EO_TYPES}
{$define _EFL_NET_SSL_CONTEXT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A SSL Context that is used to start a SSL socket wrapper.
 *
 * The context will contain common configurations such as certificates, private
 * keys, certificate revocation lists (CRLs), certificate authorities (CAs) and
 * so on.
 *
 * The method @ref efl_net_ssl_context_setup must be called once before
 * @ref efl_finalize in order to define the mandatory operational parameters.
 *
 * @note All setter methods must be called before @ref efl_finalize.
 *
 * @ingroup Efl_Net_Ssl_Context
  }

{ was #define dname def_expr }
function EFL_NET_SSL_CONTEXT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_ssl_context_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The default context for dialers.
 *
 * It will start with:
 *
 * - default_paths_load = true - cipher = auto - verify_mode = required -
 * verify_hostname = true
 *
 * @return Default SSL context
 *
 * @ingroup Efl_Net_Ssl_Context
  }
function efl_net_ssl_context_default_dialer_get:PEfl_Net_Ssl_Context;cdecl;external;
{*
 * @brief Defines the context mandatory operation parameters
 *
 * @param[in] obj The object.
 * @param[in] cipher Cipher to use, prefer @ref EFL_NET_SSL_CIPHER_AUTO
 * @param[in] is_dialer If @c true, this SSL context is targeted at dialers
 * connecting to a remote serer
 *
 * @ingroup Efl_Net_Ssl_Context
  }
procedure efl_net_ssl_context_setup(obj:PEo; cipher:TEfl_Net_Ssl_Cipher; is_dialer:TEina_Bool);cdecl;external;
{*
 * @brief The list of paths to certificates to use.
 *
 * Can only be set during object construction!
 *
 * @param[in] obj The object.
 * @param[in] paths Path list for certificates
 *
 * @ingroup Efl_Net_Ssl_Context
  }
procedure efl_net_ssl_context_certificates_set(obj:PEo; paths:PEina_Iterator);cdecl;external;
{*
 * @brief The list of paths to certificates to use.
 *
 * Can only be set during object construction!
 *
 * @param[in] obj The object.
 *
 * @return Path list for certificates
 *
 * @ingroup Efl_Net_Ssl_Context
  }
(* Const before type ignored *)
function efl_net_ssl_context_certificates_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief The list of paths to private keys to use.
 *
 * Can only be set during object construction!
 *
 * @param[in] obj The object.
 * @param[in] paths Path list for private keys
 *
 * @ingroup Efl_Net_Ssl_Context
  }
procedure efl_net_ssl_context_private_keys_set(obj:PEo; paths:PEina_Iterator);cdecl;external;
{*
 * @brief The list of paths to private keys to use.
 *
 * Can only be set during object construction!
 *
 * @param[in] obj The object.
 *
 * @return Path list for private keys
 *
 * @ingroup Efl_Net_Ssl_Context
  }
(* Const before type ignored *)
function efl_net_ssl_context_private_keys_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief The list of paths to CRL (certificate revocation list) to use.
 *
 * Can only be set during object construction!
 *
 * @param[in] obj The object.
 * @param[in] paths Path list for CRL's
 *
 * @ingroup Efl_Net_Ssl_Context
  }
procedure efl_net_ssl_context_certificate_revocation_lists_set(obj:PEo; paths:PEina_Iterator);cdecl;external;
{*
 * @brief The list of paths to CRL (certificate revocation list) to use.
 *
 * Can only be set during object construction!
 *
 * @param[in] obj The object.
 *
 * @return Path list for CRL's
 *
 * @ingroup Efl_Net_Ssl_Context
  }
(* Const before type ignored *)
function efl_net_ssl_context_certificate_revocation_lists_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief The list of paths to CA (certificate authoritie) to use.
 *
 * Can only be set during object construction!
 *
 * @param[in] obj The object.
 * @param[in] paths Path list for CA's
 *
 * @ingroup Efl_Net_Ssl_Context
  }
procedure efl_net_ssl_context_certificate_authorities_set(obj:PEo; paths:PEina_Iterator);cdecl;external;
{*
 * @brief The list of paths to CA (certificate authoritie) to use.
 *
 * Can only be set during object construction!
 *
 * @param[in] obj The object.
 *
 * @return Path list for CA's
 *
 * @ingroup Efl_Net_Ssl_Context
  }
(* Const before type ignored *)
function efl_net_ssl_context_certificate_authorities_get(obj:PEo):PEina_Iterator;cdecl;external;
{*
 * @brief If @c true, will use system's default certificate storage
 *
 * Can only be set during object construction!
 *
 * @param[in] obj The object.
 * @param[in] default_paths_load @c if true use system default paths for
 * loading, @c false otherwise
 *
 * @ingroup Efl_Net_Ssl_Context
  }
procedure efl_net_ssl_context_default_paths_load_set(obj:PEo; default_paths_load:TEina_Bool);cdecl;external;
{*
 * @brief If @c true, will use system's default certificate storage
 *
 * Can only be set during object construction!
 *
 * @param[in] obj The object.
 *
 * @return @c if true use system default paths for loading, @c false otherwise
 *
 * @ingroup Efl_Net_Ssl_Context
  }
(* Const before type ignored *)
function efl_net_ssl_context_default_paths_load_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief How to verify the remote peer.
 *
 * @param[in] obj The object.
 * @param[in] verify_mode Remote verification mode
 *
 * @ingroup Efl_Net_Ssl_Context
  }
procedure efl_net_ssl_context_verify_mode_set(obj:PEo; verify_mode:TEfl_Net_Ssl_Verify_Mode);cdecl;external;
{*
 * @brief How to verify the remote peer.
 *
 * @param[in] obj The object.
 *
 * @return Remote verification mode
 *
 * @ingroup Efl_Net_Ssl_Context
  }
(* Const before type ignored *)
function efl_net_ssl_context_verify_mode_get(obj:PEo):TEfl_Net_Ssl_Verify_Mode;cdecl;external;
{*
 * @brief Defines if hostname should be verified.
 *
 * This will check the socket hostname (without the port in case of an IP) or
 * the overriden value from @ref efl_net_ssl_context_hostname_get.
 *
 * @param[in] obj The object.
 * @param[in] hostname_verify @c true if the hostname will be verified,
 * @c false otherwise
 *
 * @ingroup Efl_Net_Ssl_Context
  }
procedure efl_net_ssl_context_hostname_verify_set(obj:PEo; hostname_verify:TEina_Bool);cdecl;external;
{*
 * @brief Defines if hostname should be verified.
 *
 * This will check the socket hostname (without the port in case of an IP) or
 * the overriden value from @ref efl_net_ssl_context_hostname_get.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the hostname will be verified, @c false otherwise
 *
 * @ingroup Efl_Net_Ssl_Context
  }
(* Const before type ignored *)
function efl_net_ssl_context_hostname_verify_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Defines the hostname to use for sockets.
 *
 * This is useful to avoid replicating a hostname in all socket wrapper with
 * hostname_override.
 *
 * If @c NULL, then sockets wrappers will will fetch from adopted socket using
 * address_remote or address_dial.
 *
 * It's only used if @ref efl_net_ssl_context_hostname_verify_get is @c true.
 *
 * @param[in] obj The object.
 * @param[in] hostname Hostname for this socket
 *
 * @ingroup Efl_Net_Ssl_Context
  }
(* Const before type ignored *)
procedure efl_net_ssl_context_hostname_set(obj:PEo; hostname:Pchar);cdecl;external;
{*
 * @brief Defines the hostname to use for sockets.
 *
 * This is useful to avoid replicating a hostname in all socket wrapper with
 * hostname_override.
 *
 * If @c NULL, then sockets wrappers will will fetch from adopted socket using
 * address_remote or address_dial.
 *
 * It's only used if @ref efl_net_ssl_context_hostname_verify_get is @c true.
 *
 * @param[in] obj The object.
 *
 * @return Hostname for this socket
 *
 * @ingroup Efl_Net_Ssl_Context
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_ssl_context_hostname_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SSL_CONTEXT_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SSL_CONTEXT_CLASS:=efl_net_ssl_context_class_get;
  end;


end.
