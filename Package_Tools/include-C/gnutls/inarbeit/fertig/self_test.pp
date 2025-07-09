
unit self_test;
interface

{
  Automatically converted by H2Pas 1.0.0 from self_test.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    self_test.h
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


{
 * Copyright (C) 2014 Free Software Foundation, Inc.
 *
 * Author: Nikos Mavrogiannopoulos
 *
 * This file is part of GnuTLS.
 *
 * The GnuTLS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>
 *
  }
{$ifndef GNUTLS_SELF_TEST_H}
{$define GNUTLS_SELF_TEST_H}
{$include <gnutls/gnutls.h>}
{ Self checking functions  }

const
  GNUTLS_SELF_TEST_FLAG_ALL = 1;  
  GNUTLS_SELF_TEST_FLAG_NO_COMPAT = 1 shl 1;  

function gnutls_cipher_self_test(flags:dword; cipher:Tgnutls_cipher_algorithm_t):longint;cdecl;external;
function gnutls_mac_self_test(flags:dword; mac:Tgnutls_mac_algorithm_t):longint;cdecl;external;
function gnutls_digest_self_test(flags:dword; digest:Tgnutls_digest_algorithm_t):longint;cdecl;external;
function gnutls_pk_self_test(flags:dword; pk:Tgnutls_pk_algorithm_t):longint;cdecl;external;
function gnutls_hkdf_self_test(flags:dword; mac:Tgnutls_mac_algorithm_t):longint;cdecl;external;
function gnutls_pbkdf2_self_test(flags:dword; mac:Tgnutls_mac_algorithm_t):longint;cdecl;external;
function gnutls_tlsprf_self_test(flags:dword; mac:Tgnutls_mac_algorithm_t):longint;cdecl;external;
{$endif}
{ GNUTLS_SELF_TEST_H  }

implementation


end.
