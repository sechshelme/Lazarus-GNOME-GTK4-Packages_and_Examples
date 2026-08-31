
unit utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    utils.h
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
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef sodium_utils_H}
{$define sodium_utils_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }
(* Const before declarator ignored *)
(* Const before type ignored *)

procedure sodium_memzero(pnt:pointer; len:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure sodium_stackzero(len:Tsize_t);cdecl;external;
{
 * WARNING: sodium_memcmp() must be used to verify if two secret keys
 * are equal, in constant time.
 * It returns 0 if the keys are equal, and -1 if they differ.
 * This function is not designed for lexicographical comparisons.
  }
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function sodium_memcmp(b1_:pointer; b2_:pointer; len:Tsize_t):longint;cdecl;external;
{
 * sodium_compare() returns -1 if b1_ < b2_, 1 if b1_ > b2_ and 0 if b1_ == b2_
 * It is suitable for lexicographical comparisons, or to compare nonces
 * and counters stored in little-endian format.
 * However, it is slower than sodium_memcmp().
  }
(* Const before type ignored *)
(* Const before type ignored *)
function sodium_compare(b1_:Pbyte; b2_:Pbyte; len:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function sodium_is_zero(n:Pbyte; nlen:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
procedure sodium_increment(n:Pbyte; nlen:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure sodium_add(a:Pbyte; b:Pbyte; len:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure sodium_sub(a:Pbyte; b:Pbyte; len:Tsize_t);cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
function sodium_bin2hex(hex:Pchar; hex_maxlen:Tsize_t; bin:Pbyte; bin_len:Tsize_t):Pchar;cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function sodium_hex2bin(bin:Pbyte; bin_maxlen:Tsize_t; hex:Pchar; hex_len:Tsize_t; ignore:Pchar; 
           bin_len:Psize_t; hex_end:PPchar):longint;cdecl;external;
const
  sodium_base64_VARIANT_ORIGINAL = 1;  
  sodium_base64_VARIANT_ORIGINAL_NO_PADDING = 3;  
  sodium_base64_VARIANT_URLSAFE = 5;  
  sodium_base64_VARIANT_URLSAFE_NO_PADDING = 7;  
{
 * Computes the required length to encode BIN_LEN bytes as a base64 string
 * using the given variant. The computed length includes a trailing \0.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function sodium_base64_ENCODED_LEN(BIN_LEN,VARIANT : longint) : longint;

(* Const before type ignored *)
(* Const before type ignored *)
function sodium_base64_encoded_len(bin_len:Tsize_t; variant:longint):Tsize_t;cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function sodium_bin2base64(b64:Pchar; b64_maxlen:Tsize_t; bin:Pbyte; bin_len:Tsize_t; variant:longint):Pchar;cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
function sodium_base642bin(bin:Pbyte; bin_maxlen:Tsize_t; b64:Pchar; b64_len:Tsize_t; ignore:Pchar; 
           bin_len:Psize_t; b64_end:PPchar; variant:longint):longint;cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
function sodium_mlock(addr:pointer; len:Tsize_t):longint;cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
function sodium_munlock(addr:pointer; len:Tsize_t):longint;cdecl;external;
{ WARNING: sodium_malloc() and sodium_allocarray() are not general-purpose
 * allocation functions.
 *
 * They return a pointer to a region filled with 0xd0 bytes, immediately
 * followed by a guard page.
 * As a result, accessing a single byte after the requested allocation size
 * will intentionally trigger a segmentation fault.
 *
 * A canary and an additional guard page placed before the beginning of the
 * region may also kill the process if a buffer underflow is detected.
 *
 * The memory layout is:
 * [unprotected region size (read only)][guard page (no access)][unprotected pages (read/write)][guard page (no access)]
 * With the layout of the unprotected pages being:
 * [optional padding][16-bytes canary][user region]
 *
 * However:
 * - These functions are significantly slower than standard functions
 * - Each allocation requires 3 or 4 additional pages
 * - The returned address will not be aligned if the allocation size is not
 *   a multiple of the required alignment. For this reason, these functions
 *   are designed to store data, such as secret keys and messages.
 *
 * sodium_malloc() can be used to allocate any libsodium data structure.
 *
 * The crypto_generichash_state structure is packed and its length is
 * either 357 or 361 bytes. For this reason, when using sodium_malloc() to
 * allocate a crypto_generichash_state structure, padding must be added in
 * order to ensure proper alignment. crypto_generichash_statebytes()
 * returns the rounded up structure size, and should be prefered to sizeof():
 * state = sodium_malloc(crypto_generichash_statebytes());
  }
(* Const before type ignored *)
function sodium_malloc(size:Tsize_t):pointer;cdecl;external;
function sodium_allocarray(count:Tsize_t; size:Tsize_t):pointer;cdecl;external;
procedure sodium_free(ptr:pointer);cdecl;external;
function sodium_mprotect_noaccess(ptr:pointer):longint;cdecl;external;
function sodium_mprotect_readonly(ptr:pointer):longint;cdecl;external;
function sodium_mprotect_readwrite(ptr:pointer):longint;cdecl;external;
function sodium_pad(padded_buflen_p:Psize_t; buf:Pbyte; unpadded_buflen:Tsize_t; blocksize:Tsize_t; max_buflen:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function sodium_unpad(unpadded_buflen_p:Psize_t; buf:Pbyte; padded_buflen:Tsize_t; blocksize:Tsize_t):longint;cdecl;external;
{ --------  }
function _sodium_alloc_init:longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function sodium_base64_ENCODED_LEN(BIN_LEN,VARIANT : longint) : longint;
begin
  sodium_base64_ENCODED_LEN:=(((BIN_LEN/3)*4)+(((((TBIN_LEN(-(BIN_LEN/3)))*3) or (((TBIN_LEN(-(BIN_LEN/3)))*3) shr 1)) and 1)*(4-(( not (((TVARIANT(@(2))) shr 1)-1)) and (3-((TBIN_LEN(-(BIN_LEN/3)))*3))))))+1;
end;


end.
