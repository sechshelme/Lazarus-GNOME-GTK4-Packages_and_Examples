
unit crypto_sign_ed25519;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_sign_ed25519.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_sign_ed25519.h
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
Pbyte  = ^byte;
Pcrypto_sign_ed25519ph_state  = ^crypto_sign_ed25519ph_state;
Pqword  = ^qword;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_sign_ed25519_H}
{$define crypto_sign_ed25519_H}
{$include <stddef.h>}
{$include "crypto_hash_sha512.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)
type
  Pcrypto_sign_ed25519ph_state = ^Tcrypto_sign_ed25519ph_state;
  Tcrypto_sign_ed25519ph_state = record
      hs : Tcrypto_hash_sha512_state;
    end;

function crypto_sign_ed25519ph_statebytes:Tsize_t;cdecl;external;
const
  crypto_sign_ed25519_BYTES = 64;  

function crypto_sign_ed25519_bytes:Tsize_t;cdecl;external;
const
  crypto_sign_ed25519_SEEDBYTES = 32;  

function crypto_sign_ed25519_seedbytes:Tsize_t;cdecl;external;
const
  crypto_sign_ed25519_PUBLICKEYBYTES = 32;  

function crypto_sign_ed25519_publickeybytes:Tsize_t;cdecl;external;
const
  crypto_sign_ed25519_SECRETKEYBYTES = 32+32;  

function crypto_sign_ed25519_secretkeybytes:Tsize_t;cdecl;external;
const
  crypto_sign_ed25519_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX-crypto_sign_ed25519_BYTES;  

function crypto_sign_ed25519_messagebytes_max:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign_ed25519(sm:Pbyte; smlen_p:Pqword; m:Pbyte; mlen:qword; sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign_ed25519_open(m:Pbyte; mlen_p:Pqword; sm:Pbyte; smlen:qword; pk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign_ed25519_detached(sig:Pbyte; siglen_p:Pqword; m:Pbyte; mlen:qword; sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign_ed25519_verify_detached(sig:Pbyte; m:Pbyte; mlen:qword; pk:Pbyte):longint;cdecl;external;
function crypto_sign_ed25519_keypair(pk:Pbyte; sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_sign_ed25519_seed_keypair(pk:Pbyte; sk:Pbyte; seed:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_sign_ed25519_pk_to_curve25519(curve25519_pk:Pbyte; ed25519_pk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_sign_ed25519_sk_to_curve25519(curve25519_sk:Pbyte; ed25519_sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_sign_ed25519_sk_to_seed(seed:Pbyte; sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_sign_ed25519_sk_to_pk(pk:Pbyte; sk:Pbyte):longint;cdecl;external;
function crypto_sign_ed25519ph_init(state:Pcrypto_sign_ed25519ph_state):longint;cdecl;external;
(* Const before type ignored *)
function crypto_sign_ed25519ph_update(state:Pcrypto_sign_ed25519ph_state; m:Pbyte; mlen:qword):longint;cdecl;external;
(* Const before type ignored *)
function crypto_sign_ed25519ph_final_create(state:Pcrypto_sign_ed25519ph_state; sig:Pbyte; siglen_p:Pqword; sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign_ed25519ph_final_verify(state:Pcrypto_sign_ed25519ph_state; sig:Pbyte; pk:Pbyte):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
