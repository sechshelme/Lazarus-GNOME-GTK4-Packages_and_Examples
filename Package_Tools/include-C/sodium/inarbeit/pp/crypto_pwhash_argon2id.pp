
unit crypto_pwhash_argon2id;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_pwhash_argon2id.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_pwhash_argon2id.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_pwhash_argon2id_H}
{$define crypto_pwhash_argon2id_H}
{$include <limits.h>}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_pwhash_argon2id_ALG_ARGON2ID13 = 2;  

function crypto_pwhash_argon2id_alg_argon2id13:longint;cdecl;external;
const
  crypto_pwhash_argon2id_BYTES_MIN = 16;  

function crypto_pwhash_argon2id_bytes_min:Tsize_t;cdecl;external;
{ was #define dname def_expr }
function crypto_pwhash_argon2id_BYTES_MAX : longint; { return type might be wrong }

function crypto_pwhash_argon2id_bytes_max:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_PASSWD_MIN = 0;  

function crypto_pwhash_argon2id_passwd_min:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_PASSWD_MAX = 4294967295;  

function crypto_pwhash_argon2id_passwd_max:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_SALTBYTES = 16;  

function crypto_pwhash_argon2id_saltbytes:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_STRBYTES = 128;  

function crypto_pwhash_argon2id_strbytes:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_STRPREFIX = '$argon2id$';  
(* Const before type ignored *)

function crypto_pwhash_argon2id_strprefix:Pchar;cdecl;external;
const
  crypto_pwhash_argon2id_OPSLIMIT_MIN = 1;  

function crypto_pwhash_argon2id_opslimit_min:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_OPSLIMIT_MAX = 4294967295;  

function crypto_pwhash_argon2id_opslimit_max:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_MEMLIMIT_MIN = 8192;  

function crypto_pwhash_argon2id_memlimit_min:Tsize_t;cdecl;external;
{ was #define dname def_expr }
function crypto_pwhash_argon2id_MEMLIMIT_MAX : longint; { return type might be wrong }

function crypto_pwhash_argon2id_memlimit_max:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_OPSLIMIT_INTERACTIVE = 2;  

function crypto_pwhash_argon2id_opslimit_interactive:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_MEMLIMIT_INTERACTIVE = 67108864;  

function crypto_pwhash_argon2id_memlimit_interactive:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_OPSLIMIT_MODERATE = 3;  

function crypto_pwhash_argon2id_opslimit_moderate:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_MEMLIMIT_MODERATE = 268435456;  

function crypto_pwhash_argon2id_memlimit_moderate:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_OPSLIMIT_SENSITIVE = 4;  

function crypto_pwhash_argon2id_opslimit_sensitive:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2id_MEMLIMIT_SENSITIVE = 1073741824;  

function crypto_pwhash_argon2id_memlimit_sensitive:Tsize_t;cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function crypto_pwhash_argon2id(out:Pbyte; outlen:qword; passwd:Pchar; passwdlen:qword; salt:Pbyte; 
           opslimit:qword; memlimit:Tsize_t; alg:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function crypto_pwhash_argon2id_str(out:array[0..(crypto_pwhash_argon2id_STRBYTES)-1] of char; passwd:Pchar; passwdlen:qword; opslimit:qword; memlimit:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function crypto_pwhash_argon2id_str_verify(str:array[0..(crypto_pwhash_argon2id_STRBYTES)-1] of char; passwd:Pchar; passwdlen:qword):longint;cdecl;external;
(* Const before type ignored *)
function crypto_pwhash_argon2id_str_needs_rehash(str:array[0..(crypto_pwhash_argon2id_STRBYTES)-1] of char; opslimit:qword; memlimit:Tsize_t):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function crypto_pwhash_argon2id_BYTES_MAX : longint; { return type might be wrong }
  begin
    crypto_pwhash_argon2id_BYTES_MAX:=SODIUM_MIN(SODIUM_SIZE_MAX,4294967295);
  end;

{ was #define dname def_expr }
function crypto_pwhash_argon2id_MEMLIMIT_MAX : longint; { return type might be wrong }
  var
     if_local1, if_local2 : longint;
  (* result types are not known *)
  begin
    if SIZE_MAX>=4398046510080 then
      if_local1:=4398046510080
    else
      if_local1:=SIZE_MAX>=2147483648;
    if if_local1 then
      if_local2:=2147483648
    else
      if_local2:=32768;
    crypto_pwhash_argon2id_MEMLIMIT_MAX:=if_local2;
  end;


end.
