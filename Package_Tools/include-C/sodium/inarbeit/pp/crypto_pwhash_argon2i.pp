
unit crypto_pwhash_argon2i;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_pwhash_argon2i.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_pwhash_argon2i.h
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


{$ifndef crypto_pwhash_argon2i_H}
{$define crypto_pwhash_argon2i_H}
{$include <limits.h>}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_pwhash_argon2i_ALG_ARGON2I13 = 1;  

function crypto_pwhash_argon2i_alg_argon2i13:longint;cdecl;external;
const
  crypto_pwhash_argon2i_BYTES_MIN = 16;  

function crypto_pwhash_argon2i_bytes_min:Tsize_t;cdecl;external;
{ was #define dname def_expr }
function crypto_pwhash_argon2i_BYTES_MAX : longint; { return type might be wrong }

function crypto_pwhash_argon2i_bytes_max:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_PASSWD_MIN = 0;  

function crypto_pwhash_argon2i_passwd_min:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_PASSWD_MAX = 4294967295;  

function crypto_pwhash_argon2i_passwd_max:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_SALTBYTES = 16;  

function crypto_pwhash_argon2i_saltbytes:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_STRBYTES = 128;  

function crypto_pwhash_argon2i_strbytes:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_STRPREFIX = '$argon2i$';  
(* Const before type ignored *)

function crypto_pwhash_argon2i_strprefix:Pchar;cdecl;external;
const
  crypto_pwhash_argon2i_OPSLIMIT_MIN = 3;  

function crypto_pwhash_argon2i_opslimit_min:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_OPSLIMIT_MAX = 4294967295;  

function crypto_pwhash_argon2i_opslimit_max:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_MEMLIMIT_MIN = 8192;  

function crypto_pwhash_argon2i_memlimit_min:Tsize_t;cdecl;external;
{ was #define dname def_expr }
function crypto_pwhash_argon2i_MEMLIMIT_MAX : longint; { return type might be wrong }

function crypto_pwhash_argon2i_memlimit_max:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_OPSLIMIT_INTERACTIVE = 4;  

function crypto_pwhash_argon2i_opslimit_interactive:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_MEMLIMIT_INTERACTIVE = 33554432;  

function crypto_pwhash_argon2i_memlimit_interactive:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_OPSLIMIT_MODERATE = 6;  

function crypto_pwhash_argon2i_opslimit_moderate:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_MEMLIMIT_MODERATE = 134217728;  

function crypto_pwhash_argon2i_memlimit_moderate:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_OPSLIMIT_SENSITIVE = 8;  

function crypto_pwhash_argon2i_opslimit_sensitive:Tsize_t;cdecl;external;
const
  crypto_pwhash_argon2i_MEMLIMIT_SENSITIVE = 536870912;  

function crypto_pwhash_argon2i_memlimit_sensitive:Tsize_t;cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function crypto_pwhash_argon2i(out:Pbyte; outlen:qword; passwd:Pchar; passwdlen:qword; salt:Pbyte; 
           opslimit:qword; memlimit:Tsize_t; alg:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function crypto_pwhash_argon2i_str(out:array[0..(crypto_pwhash_argon2i_STRBYTES)-1] of char; passwd:Pchar; passwdlen:qword; opslimit:qword; memlimit:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function crypto_pwhash_argon2i_str_verify(str:array[0..(crypto_pwhash_argon2i_STRBYTES)-1] of char; passwd:Pchar; passwdlen:qword):longint;cdecl;external;
(* Const before type ignored *)
function crypto_pwhash_argon2i_str_needs_rehash(str:array[0..(crypto_pwhash_argon2i_STRBYTES)-1] of char; opslimit:qword; memlimit:Tsize_t):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function crypto_pwhash_argon2i_BYTES_MAX : longint; { return type might be wrong }
  begin
    crypto_pwhash_argon2i_BYTES_MAX:=SODIUM_MIN(SODIUM_SIZE_MAX,4294967295);
  end;

{ was #define dname def_expr }
function crypto_pwhash_argon2i_MEMLIMIT_MAX : longint; { return type might be wrong }
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
    crypto_pwhash_argon2i_MEMLIMIT_MAX:=if_local2;
  end;


end.
