
unit crypto_sign;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_sign.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_sign
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
Pchar  = ^char;
Pcrypto_sign_state  = ^crypto_sign_state;
Pqword  = ^qword;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_sign_H}
{$define crypto_sign_H}
{
 * THREAD SAFETY: crypto_sign_keypair() is thread-safe,
 * provided that sodium_init() was called before.
 *
 * Other functions, including crypto_sign_seed_keypair() are always thread-safe.
  }
{$include <stddef.h>}
{$include "crypto_sign_ed25519.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)
type
  Pcrypto_sign_state = ^Tcrypto_sign_state;
  Tcrypto_sign_state = Tcrypto_sign_ed25519ph_state;

function crypto_sign_statebytes:Tsize_t;cdecl;external;
const
  crypto_sign_BYTES = crypto_sign_ed25519_BYTES;  

function crypto_sign_bytes:Tsize_t;cdecl;external;
const
  crypto_sign_SEEDBYTES = crypto_sign_ed25519_SEEDBYTES;  

function crypto_sign_seedbytes:Tsize_t;cdecl;external;
const
  crypto_sign_PUBLICKEYBYTES = crypto_sign_ed25519_PUBLICKEYBYTES;  

function crypto_sign_publickeybytes:Tsize_t;cdecl;external;
const
  crypto_sign_SECRETKEYBYTES = crypto_sign_ed25519_SECRETKEYBYTES;  

function crypto_sign_secretkeybytes:Tsize_t;cdecl;external;
const
  crypto_sign_MESSAGEBYTES_MAX = crypto_sign_ed25519_MESSAGEBYTES_MAX;  

function crypto_sign_messagebytes_max:Tsize_t;cdecl;external;
const
  crypto_sign_PRIMITIVE = 'ed25519';  
(* Const before type ignored *)

function crypto_sign_primitive:Pchar;cdecl;external;
(* Const before type ignored *)
function crypto_sign_seed_keypair(pk:Pbyte; sk:Pbyte; seed:Pbyte):longint;cdecl;external;
function crypto_sign_keypair(pk:Pbyte; sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign(sm:Pbyte; smlen_p:Pqword; m:Pbyte; mlen:qword; sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign_open(m:Pbyte; mlen_p:Pqword; sm:Pbyte; smlen:qword; pk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign_detached(sig:Pbyte; siglen_p:Pqword; m:Pbyte; mlen:qword; sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign_verify_detached(sig:Pbyte; m:Pbyte; mlen:qword; pk:Pbyte):longint;cdecl;external;
function crypto_sign_init(state:Pcrypto_sign_state):longint;cdecl;external;
(* Const before type ignored *)
function crypto_sign_update(state:Pcrypto_sign_state; m:Pbyte; mlen:qword):longint;cdecl;external;
(* Const before type ignored *)
function crypto_sign_final_create(state:Pcrypto_sign_state; sig:Pbyte; siglen_p:Pqword; sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign_final_verify(state:Pcrypto_sign_state; sig:Pbyte; pk:Pbyte):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
