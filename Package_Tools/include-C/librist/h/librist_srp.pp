
unit librist_srp;
interface

{
  Automatically converted by H2Pas 1.0.0 from librist_srp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    librist_srp.h
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
Pbool  = ^bool;
Pchar  = ^char;
Plibrist_verifier_lookup_data_t  = ^librist_verifier_lookup_data_t;
Plongint  = ^longint;
Prist_peer  = ^rist_peer;
Psize_t  = ^size_t;
Puint64_t  = ^uint64_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020, VideoLAN and librist authors
 * Copyright © 2019-2020 SipRadius LLC
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-2-Clause
  }
{$ifndef _LIBRIST_SRP_H_}
{$define _LIBRIST_SRP_H_}
{$include "librist_config.h"}
{$if HAVE_SRP_SUPPORT}
{$include "librist.h"}
{$include <stdbool.h>}
{$include <stddef.h>}
{$include <stdint.h>}
{ C++ extern C conditionnal removed }
{*
 * @brief SRP User lookup function
 *
 *  The SRP User lookup function is called inside the process of authentication
 *  the calling application MUST implement this function if it desires to so run
 *  as a RIST MAIN profile server with SRP authentication enabled.
 *  Userlookup is assumed to have been successful if both verifier params and both
 *  salt params are set by the lookup function.
 *  libRIST will take ownership of all heap allocated data.
 *
 *  @param username IN the username attempting authentication
 *  @param verifier_len OUT len in bytes of the verifier.
 *  @param verifier OUT verifier bytes, MUST be heap allocated.
 *  @param salt_len OUT salt len in bytes of the salt.
 *  @param salt OUT salt bytes, MUST be heap allocated.
 *  @param use_default_2048_bit_n_modulus OUT Use the default 2048 bit modulus, when true N Prime modulus & generator MUST be NULL.
 *  @param n_modulus_ascii OUT N Prime modulus in hex as a zero terminated C string, MUST be heap allocated or NULL.
 *  @param generator_ascii OUT Generator in hex as a zero terminated C string, MUST be heap allocated or NULL.
 *  @param user_data IN pointer to user data.
 *
 * }
type

  Tuser_verifier_lookup_t = procedure (username:Pchar; verifier_len:Psize_t; verifier:PPchar; salt_len:Psize_t; salt:PPchar; 
                use_default_2048_bit_n_modulus:Pbool; n_modulus_ascii:PPchar; generator_ascii:PPchar; user_data:pointer);cdecl;
{ len in bytes of the verifier.  }
{ verifier bytes, MUST be heap allocated.  }
{ len in bytes of the salt. }
{ salt bytes, MUST be heap allocated.  }
{ Use the default 2048 bit modulus, when true N Prime modulus & generator MUST be NULL.  }
{ N Prime modulus in hex as a zero terminated C string, MUST be heap allocated or NULL.  }
{ Generator in hex as a zero terminated C string, MUST be heap allocated or NULL.  }

  Plibrist_verifier_lookup_data_t = ^Tlibrist_verifier_lookup_data_t;
  Tlibrist_verifier_lookup_data_t = record
      verifier_len : Tsize_t;
      verifier : Puint8_t;
      salt_len : Tsize_t;
      salt : Puint8_t;
      default_ng : Tbool;
      n_modulus_ascii : Pchar;
      generator_ascii : Pchar;
    end;
{*
 * @brief SRP User lookup function
 *
 *  The SRP User lookup function is called inside the process of authentication
 *  the calling application MUST implement this function if it desires to so run
 *  as a RIST MAIN profile server with SRP authentication enabled.
 *  Userlookup is assumed to have been successful if both verifier params and both salt
 *  params are set by the lookup function.
 *  If the verifier function sets a non-zero generation number libRIST will periodically
 *  poll it to see if salt/verifier has changed, it will do this with lookup_data set to
 *  NULL. On changes it will request the client to re-authenticate itself.
 *  Leave generation number at 0 to keep the old behaviour of unconditionally periodically
 *  reauthenticating clients.
 *  libRIST will take ownership of all heap allocated data.
 *
 *  @bug Previous releases of libRIST had an error in combined hashing of multiple data
	     sources. The error produced reproducable hashes that are not matching with
		 correctly hashed data. This reflects in the SRP file and also results in
		 incompatibilty with the newly created nettle+gmp crypto backend.
		 To ensure compatibilty with previous libRIST releases it's recommended to have
		 both old and new verifier/salt pairs availabe and in the lookup function return
		 the maximum requested version. Where 0 is the legacy compatible version and 1
		 is the new correct version.
		 Compatibility with the broken hashing will be removed in a future release.
 *
 *  @param username IN the username attempting authentication
 *  @param lookup_data OUT: when non-null the calling application should fill this with the requested data.
 *  @param hashversion IN/OUT IN: the maximum supported hashversion that should be looked up. OUT: the hashversion of the found salt/verifier pair.
 *  @param generation IN/OUT IN: generation number the library has cached for the requested user. OUT: generation number of the returned data.
 *  @param user_data IN pointer to user data.
 *
 * }

  Tuser_verifier_lookup_2_t = procedure (username:Pchar; lookup_data:Plibrist_verifier_lookup_data_t; hashversion:Plongint; generation:Puint64_t; user_data:pointer);cdecl;
{*
 * @brief Enable SRP authentication
 *
 * This will enable SRP authentication on RIST MAIN profile connections. When
 * running in client mode username and password are mandatory parameters. Else
 * only a lookup function must be provided.
 *
 * @param peer IN Peer object (connection) upon which to enable SRP authentication.
 * @param username IN username MANDATORY in client mode.
 * @param password IN password MANDATORY in client mode.
 * @param lookup_func IN @see *user_verifier_lookup_t MANDATORY in server mode.
 * @param userdata IN optional user data to be supplied to lookup function.
 *
 * }
{xxxxxxxxxxextern RIST_DEPRECATED  }
(* Const before type ignored *)
(* Const before type ignored *)

function rist_enable_eap_srp(peer:Prist_peer; username:Pchar; password:Pchar; lookup_func:Tuser_verifier_lookup_t; userdata:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function rist_enable_eap_srp_2(peer:Prist_peer; username:Pchar; password:Pchar; lookup_func:Tuser_verifier_lookup_2_t; userdata:pointer):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{$endif}

implementation


end.
