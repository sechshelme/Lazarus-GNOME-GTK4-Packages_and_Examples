
unit crypto_secretstream_xchacha20poly1305;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_secretstream_xchacha20poly1305.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_secretstream_xchacha20poly1305.h
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
Pcrypto_secretstream_xchacha20poly1305_state  = ^crypto_secretstream_xchacha20poly1305_state;
Pqword  = ^qword;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_secretstream_xchacha20poly1305_H}
{$define crypto_secretstream_xchacha20poly1305_H}
{$include <stddef.h>}
{$include "crypto_aead_xchacha20poly1305.h"}
{$include "crypto_stream_chacha20.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_secretstream_xchacha20poly1305_ABYTES = 1+crypto_aead_xchacha20poly1305_ietf_ABYTES;  

function crypto_secretstream_xchacha20poly1305_abytes:Tsize_t;cdecl;external;
const
  crypto_secretstream_xchacha20poly1305_HEADERBYTES = crypto_aead_xchacha20poly1305_ietf_NPUBBYTES;  

function crypto_secretstream_xchacha20poly1305_headerbytes:Tsize_t;cdecl;external;
const
  crypto_secretstream_xchacha20poly1305_KEYBYTES = crypto_aead_xchacha20poly1305_ietf_KEYBYTES;  

function crypto_secretstream_xchacha20poly1305_keybytes:Tsize_t;cdecl;external;
{ was #define dname def_expr }
function crypto_secretstream_xchacha20poly1305_MESSAGEBYTES_MAX : longint; { return type might be wrong }

function crypto_secretstream_xchacha20poly1305_messagebytes_max:Tsize_t;cdecl;external;
const
  crypto_secretstream_xchacha20poly1305_TAG_MESSAGE = $00;  

function crypto_secretstream_xchacha20poly1305_tag_message:byte;cdecl;external;
const
  crypto_secretstream_xchacha20poly1305_TAG_PUSH = $01;  

function crypto_secretstream_xchacha20poly1305_tag_push:byte;cdecl;external;
const
  crypto_secretstream_xchacha20poly1305_TAG_REKEY = $02;  

function crypto_secretstream_xchacha20poly1305_tag_rekey:byte;cdecl;external;
const
  crypto_secretstream_xchacha20poly1305_TAG_FINAL = crypto_secretstream_xchacha20poly1305_TAG_PUSH or crypto_secretstream_xchacha20poly1305_TAG_REKEY;  

function crypto_secretstream_xchacha20poly1305_tag_final:byte;cdecl;external;
type
  Pcrypto_secretstream_xchacha20poly1305_state = ^Tcrypto_secretstream_xchacha20poly1305_state;
  Tcrypto_secretstream_xchacha20poly1305_state = record
      k : array[0..(crypto_stream_chacha20_ietf_KEYBYTES)-1] of byte;
      nonce : array[0..(crypto_stream_chacha20_ietf_NONCEBYTES)-1] of byte;
      _pad : array[0..7] of byte;
    end;

function crypto_secretstream_xchacha20poly1305_statebytes:Tsize_t;cdecl;external;
procedure crypto_secretstream_xchacha20poly1305_keygen(k:array[0..(crypto_secretstream_xchacha20poly1305_KEYBYTES)-1] of byte);cdecl;external;
(* Const before type ignored *)
function crypto_secretstream_xchacha20poly1305_init_push(state:Pcrypto_secretstream_xchacha20poly1305_state; header:array[0..(crypto_secretstream_xchacha20poly1305_HEADERBYTES)-1] of byte; k:array[0..(crypto_secretstream_xchacha20poly1305_KEYBYTES)-1] of byte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_secretstream_xchacha20poly1305_push(state:Pcrypto_secretstream_xchacha20poly1305_state; c:Pbyte; clen_p:Pqword; m:Pbyte; mlen:qword; 
           ad:Pbyte; adlen:qword; tag:byte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_secretstream_xchacha20poly1305_init_pull(state:Pcrypto_secretstream_xchacha20poly1305_state; header:array[0..(crypto_secretstream_xchacha20poly1305_HEADERBYTES)-1] of byte; k:array[0..(crypto_secretstream_xchacha20poly1305_KEYBYTES)-1] of byte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_secretstream_xchacha20poly1305_pull(state:Pcrypto_secretstream_xchacha20poly1305_state; m:Pbyte; mlen_p:Pqword; tag_p:Pbyte; c:Pbyte; 
           clen:qword; ad:Pbyte; adlen:qword):longint;cdecl;external;
procedure crypto_secretstream_xchacha20poly1305_rekey(state:Pcrypto_secretstream_xchacha20poly1305_state);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function crypto_secretstream_xchacha20poly1305_MESSAGEBYTES_MAX : longint; { return type might be wrong }
  begin
    crypto_secretstream_xchacha20poly1305_MESSAGEBYTES_MAX:=SODIUM_MIN(SODIUM_SIZE_MAX-crypto_secretstream_xchacha20poly1305_ABYTES,64*((1 shl 32)-2));
  end;


end.
