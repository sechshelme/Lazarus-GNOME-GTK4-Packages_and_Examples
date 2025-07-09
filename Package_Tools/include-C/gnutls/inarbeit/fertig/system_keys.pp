
unit system_keys;
interface

{
  Automatically converted by H2Pas 1.0.0 from system_keys.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    system_keys.h
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
Pgnutls_datum_t  = ^gnutls_datum_t;
Pgnutls_system_key_iter_t  = ^gnutls_system_key_iter_t;
Psystem_key_iter_st  = ^system_key_iter_st;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2014 Red Hat, Inc.
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
{$ifndef GNUTLS_SYSTEM_KEYS_H}
{$define GNUTLS_SYSTEM_KEYS_H}
{$include <gnutls/gnutls.h>}
{$include <gnutls/x509.h>}
{ This API allows to access user key and certificate pairs that are
 * available in the current system. If any passwords are required,
 * they will be requested through the pin callbacks.
  }
{ C++ extern C conditionnal removed }
type
  Psystem_key_iter_st = ^Tsystem_key_iter_st;
  Tsystem_key_iter_st = record
      {undefined structure}
    end;


  Pgnutls_system_key_iter_t = ^Tgnutls_system_key_iter_t;
  Tgnutls_system_key_iter_t = Psystem_key_iter_st;

procedure gnutls_system_key_iter_deinit(iter:Tgnutls_system_key_iter_t);cdecl;external;
{ gnutls_certificate_type_t  }function gnutls_system_key_iter_get_info(iter:Pgnutls_system_key_iter_t; cert_type:dword; cert_url:PPchar; key_url:PPchar; _label:PPchar; 
           der:Pgnutls_datum_t; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gnutls_system_key_delete(cert_url:Pchar; key_url:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gnutls_system_key_add_x509(crt:Tgnutls_x509_crt_t; privkey:Tgnutls_x509_privkey_t; _label:Pchar; cert_url:PPchar; key_url:PPchar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GNUTLS_SYSTEM_KEYS_H  }

implementation


end.
