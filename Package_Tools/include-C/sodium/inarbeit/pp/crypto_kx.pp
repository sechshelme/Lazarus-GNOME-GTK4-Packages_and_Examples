
unit crypto_kx;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_kx.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_kx.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_kx_H}
{$define crypto_kx_H}
{$include <stddef.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_kx_PUBLICKEYBYTES = 32;  

function crypto_kx_publickeybytes:Tsize_t;cdecl;external;
const
  crypto_kx_SECRETKEYBYTES = 32;  

function crypto_kx_secretkeybytes:Tsize_t;cdecl;external;
const
  crypto_kx_SEEDBYTES = 32;  

function crypto_kx_seedbytes:Tsize_t;cdecl;external;
const
  crypto_kx_SESSIONKEYBYTES = 32;  

function crypto_kx_sessionkeybytes:Tsize_t;cdecl;external;
const
  crypto_kx_PRIMITIVE = 'x25519blake2b';  
(* Const before type ignored *)

function crypto_kx_primitive:Pchar;cdecl;external;
(* Const before type ignored *)
function crypto_kx_seed_keypair(pk:array[0..(crypto_kx_PUBLICKEYBYTES)-1] of byte; sk:array[0..(crypto_kx_SECRETKEYBYTES)-1] of byte; seed:array[0..(crypto_kx_SEEDBYTES)-1] of byte):longint;cdecl;external;
function crypto_kx_keypair(pk:array[0..(crypto_kx_PUBLICKEYBYTES)-1] of byte; sk:array[0..(crypto_kx_SECRETKEYBYTES)-1] of byte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_kx_client_session_keys(rx:array[0..(crypto_kx_SESSIONKEYBYTES)-1] of byte; tx:array[0..(crypto_kx_SESSIONKEYBYTES)-1] of byte; client_pk:array[0..(crypto_kx_PUBLICKEYBYTES)-1] of byte; client_sk:array[0..(crypto_kx_SECRETKEYBYTES)-1] of byte; server_pk:array[0..(crypto_kx_PUBLICKEYBYTES)-1] of byte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_kx_server_session_keys(rx:array[0..(crypto_kx_SESSIONKEYBYTES)-1] of byte; tx:array[0..(crypto_kx_SESSIONKEYBYTES)-1] of byte; server_pk:array[0..(crypto_kx_PUBLICKEYBYTES)-1] of byte; server_sk:array[0..(crypto_kx_SECRETKEYBYTES)-1] of byte; client_pk:array[0..(crypto_kx_PUBLICKEYBYTES)-1] of byte):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
