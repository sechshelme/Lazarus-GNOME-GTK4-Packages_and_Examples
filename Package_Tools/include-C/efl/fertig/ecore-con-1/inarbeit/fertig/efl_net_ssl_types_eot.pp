
unit efl_net_ssl_types_eot;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_ssl_types_eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_ssl_types_eot.h
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
PEfl_Net_Ssl_Cipher  = ^Efl_Net_Ssl_Cipher;
PEfl_Net_Ssl_Verify_Mode  = ^Efl_Net_Ssl_Verify_Mode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SSL_TYPES_EOT_H_}
{$define _EFL_NET_SSL_TYPES_EOT_H_}
{$ifndef _EFL_NET_SSL_TYPES_EOT_TYPES}
{$define _EFL_NET_SSL_TYPES_EOT_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Defines how remote peers should be verified.
 *
 * @since 1.19
 *
 * @ingroup Efl_Net_Ssl_Verify_Mode
  }
{*< Do not verify peer
                                     *
                                     * @since 1.19  }
{*< If provided, verify. Otherwise proceed
                                     *
                                     * @since 1.19  }
{*< Always verify and fail if certificate
                                    * wasn't provided
                                    *
                                    * @since 1.19  }
type
  PEfl_Net_Ssl_Verify_Mode = ^TEfl_Net_Ssl_Verify_Mode;
  TEfl_Net_Ssl_Verify_Mode =  Longint;
  Const
    EFL_NET_SSL_VERIFY_MODE_NONE = 0;
    EFL_NET_SSL_VERIFY_MODE_OPTIONAL = 1;
    EFL_NET_SSL_VERIFY_MODE_REQUIRED = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Defines the SSL/TLS version to use.
 *
 * Prefer 'auto' or one of the TLS variants.
 *
 * @note since it's very insecure, SSLv2 is not present. SSLv3 support depends
 * on being available on the platform.
 *
 * @since 1.19
 *
 * @ingroup Efl_Net_Ssl_Cipher
  }
{*< The default. Use the best your system
                                * supports, disables dangerous ciphers
                                *
                                * @since 1.19  }
{*< TLSv1, secure and widely available
                             *
                             * @since 1.19  }
{*< TLSv1.1, secure
                               *
                               * @since 1.19  }
{*< TLSv1.2, secure
                              *
                              * @since 1.19  }
type
  PEfl_Net_Ssl_Cipher = ^TEfl_Net_Ssl_Cipher;
  TEfl_Net_Ssl_Cipher =  Longint;
  Const
    EFL_NET_SSL_CIPHER_AUTO = 0;
    EFL_NET_SSL_CIPHER_TLSV1 = 1;
    EFL_NET_SSL_CIPHER_TLSV1_1 = 2;
    EFL_NET_SSL_CIPHER_TLSV1_2 = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$endif}

implementation


end.
