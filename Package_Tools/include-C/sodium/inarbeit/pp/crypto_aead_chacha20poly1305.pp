
unit crypto_aead_chacha20poly1305;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_aead_chacha20poly1305.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_aead_chacha20poly1305.h
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
Pqword  = ^qword;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_aead_chacha20poly1305_H}
{$define crypto_aead_chacha20poly1305_H}
{$include <stddef.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)
{ -- IETF ChaCha20-Poly1305 construction with a 96-bit nonce and a 32-bit internal counter --  }

const
  crypto_aead_chacha20poly1305_ietf_KEYBYTES = 32;  

function crypto_aead_chacha20poly1305_ietf_keybytes:Tsize_t;cdecl;external;
const
  crypto_aead_chacha20poly1305_ietf_NSECBYTES = 0;  

function crypto_aead_chacha20poly1305_ietf_nsecbytes:Tsize_t;cdecl;external;
const
  crypto_aead_chacha20poly1305_ietf_NPUBBYTES = 12;  

function crypto_aead_chacha20poly1305_ietf_npubbytes:Tsize_t;cdecl;external;
const
  crypto_aead_chacha20poly1305_ietf_ABYTES = 16;  

function crypto_aead_chacha20poly1305_ietf_abytes:Tsize_t;cdecl;external;
{ was #define dname def_expr }
function crypto_aead_chacha20poly1305_ietf_MESSAGEBYTES_MAX : longint; { return type might be wrong }

function crypto_aead_chacha20poly1305_ietf_messagebytes_max:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_aead_chacha20poly1305_ietf_encrypt(c:Pbyte; clen_p:Pqword; m:Pbyte; mlen:qword; ad:Pbyte; 
           adlen:qword; nsec:Pbyte; npub:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_aead_chacha20poly1305_ietf_decrypt(m:Pbyte; mlen_p:Pqword; nsec:Pbyte; c:Pbyte; clen:qword; 
           ad:Pbyte; adlen:qword; npub:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_aead_chacha20poly1305_ietf_encrypt_detached(c:Pbyte; mac:Pbyte; maclen_p:Pqword; m:Pbyte; mlen:qword; 
           ad:Pbyte; adlen:qword; nsec:Pbyte; npub:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_aead_chacha20poly1305_ietf_decrypt_detached(m:Pbyte; nsec:Pbyte; c:Pbyte; clen:qword; mac:Pbyte; 
           ad:Pbyte; adlen:qword; npub:Pbyte; k:Pbyte):longint;cdecl;external;
procedure crypto_aead_chacha20poly1305_ietf_keygen(k:array[0..(crypto_aead_chacha20poly1305_ietf_KEYBYTES)-1] of byte);cdecl;external;
{ -- Original ChaCha20-Poly1305 construction with a 64-bit nonce and a 64-bit internal counter --  }
const
  crypto_aead_chacha20poly1305_KEYBYTES = 32;  

function crypto_aead_chacha20poly1305_keybytes:Tsize_t;cdecl;external;
const
  crypto_aead_chacha20poly1305_NSECBYTES = 0;  

function crypto_aead_chacha20poly1305_nsecbytes:Tsize_t;cdecl;external;
const
  crypto_aead_chacha20poly1305_NPUBBYTES = 8;  

function crypto_aead_chacha20poly1305_npubbytes:Tsize_t;cdecl;external;
const
  crypto_aead_chacha20poly1305_ABYTES = 16;  

function crypto_aead_chacha20poly1305_abytes:Tsize_t;cdecl;external;
const
  crypto_aead_chacha20poly1305_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX-crypto_aead_chacha20poly1305_ABYTES;  

function crypto_aead_chacha20poly1305_messagebytes_max:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_aead_chacha20poly1305_encrypt(c:Pbyte; clen_p:Pqword; m:Pbyte; mlen:qword; ad:Pbyte; 
           adlen:qword; nsec:Pbyte; npub:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_aead_chacha20poly1305_decrypt(m:Pbyte; mlen_p:Pqword; nsec:Pbyte; c:Pbyte; clen:qword; 
           ad:Pbyte; adlen:qword; npub:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_aead_chacha20poly1305_encrypt_detached(c:Pbyte; mac:Pbyte; maclen_p:Pqword; m:Pbyte; mlen:qword; 
           ad:Pbyte; adlen:qword; nsec:Pbyte; npub:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_aead_chacha20poly1305_decrypt_detached(m:Pbyte; nsec:Pbyte; c:Pbyte; clen:qword; mac:Pbyte; 
           ad:Pbyte; adlen:qword; npub:Pbyte; k:Pbyte):longint;cdecl;external;
procedure crypto_aead_chacha20poly1305_keygen(k:array[0..(crypto_aead_chacha20poly1305_KEYBYTES)-1] of byte);cdecl;external;
{ Aliases  }
const
  crypto_aead_chacha20poly1305_IETF_KEYBYTES = crypto_aead_chacha20poly1305_ietf_KEYBYTES;  
  crypto_aead_chacha20poly1305_IETF_NSECBYTES = crypto_aead_chacha20poly1305_ietf_NSECBYTES;  
  crypto_aead_chacha20poly1305_IETF_NPUBBYTES = crypto_aead_chacha20poly1305_ietf_NPUBBYTES;  
  crypto_aead_chacha20poly1305_IETF_ABYTES = crypto_aead_chacha20poly1305_ietf_ABYTES;  
  crypto_aead_chacha20poly1305_IETF_MESSAGEBYTES_MAX = crypto_aead_chacha20poly1305_ietf_MESSAGEBYTES_MAX;  
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function crypto_aead_chacha20poly1305_ietf_MESSAGEBYTES_MAX : longint; { return type might be wrong }
  begin
    crypto_aead_chacha20poly1305_ietf_MESSAGEBYTES_MAX:=SODIUM_MIN(SODIUM_SIZE_MAX-crypto_aead_chacha20poly1305_ietf_ABYTES,64*((1 shl 32)-1));
  end;


end.
