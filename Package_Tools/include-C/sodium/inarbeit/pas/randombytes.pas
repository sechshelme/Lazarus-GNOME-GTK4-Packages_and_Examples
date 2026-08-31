unit randombytes;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef randombytes_H}
{$define randombytes_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include <sys/types.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)
{ required  }
{ required  }
{ optional  }
{ optional, a default implementation will be used if NULL  }
{ required  }
{ optional  }
type
  Prandombytes_implementation = ^Trandombytes_implementation;
  Trandombytes_implementation = record
      implementation_name : function :Pchar;cdecl;
      random : function :Tuint32_t;cdecl;
      stir : procedure ;cdecl;
      uniform : function (upper_bound:Tuint32_t):Tuint32_t;cdecl;
      buf : procedure (buf:pointer; size:Tsize_t);cdecl;
      close : function :longint;cdecl;
    end;

{ was #define dname def_expr }
function randombytes_BYTES_MAX : longint; { return type might be wrong }

const
  randombytes_SEEDBYTES = 32;  

function randombytes_seedbytes:Tsize_t;cdecl;external libsodium;
procedure randombytes_buf(buf:pointer; size:Tsize_t);cdecl;external libsodium;
procedure randombytes_buf_deterministic(buf:pointer; size:Tsize_t; seed:array[0..(randombytes_SEEDBYTES)-1] of byte);cdecl;external libsodium;
function randombytes_random:Tuint32_t;cdecl;external libsodium;
function randombytes_uniform(upper_bound:Tuint32_t):Tuint32_t;cdecl;external libsodium;
procedure randombytes_stir;cdecl;external libsodium;
function randombytes_close:longint;cdecl;external libsodium;
function randombytes_set_implementation(impl:Prandombytes_implementation):longint;cdecl;external libsodium;
function randombytes_implementation_name:Pchar;cdecl;external libsodium;
{ -- NaCl compatibility interface --  }
procedure randombytes(buf:Pbyte; buf_len:qword);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:34:02 ===


implementation


{ was #define dname def_expr }
function randombytes_BYTES_MAX : longint; { return type might be wrong }
  begin
    randombytes_BYTES_MAX:=SODIUM_MIN(SODIUM_SIZE_MAX,$ffffffff);
  end;


end.
