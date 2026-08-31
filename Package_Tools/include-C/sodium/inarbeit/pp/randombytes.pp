
unit randombytes;
interface

{
  Automatically converted by H2Pas 1.0.0 from randombytes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    randombytes
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
Prandombytes_implementation  = ^randombytes_implementation;
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
(* Const before type ignored *)
{ required  }
{ required  }
{ optional  }
(* Const before type ignored *)
{ optional, a default implementation will be used if NULL  }
(* Const before declarator ignored *)
(* Const before type ignored *)
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

function randombytes_seedbytes:Tsize_t;cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
procedure randombytes_buf(buf:pointer; size:Tsize_t);cdecl;external;
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure randombytes_buf_deterministic(buf:pointer; size:Tsize_t; seed:array[0..(randombytes_SEEDBYTES)-1] of byte);cdecl;external;
function randombytes_random:Tuint32_t;cdecl;external;
(* Const before type ignored *)
function randombytes_uniform(upper_bound:Tuint32_t):Tuint32_t;cdecl;external;
procedure randombytes_stir;cdecl;external;
function randombytes_close:longint;cdecl;external;
function randombytes_set_implementation(impl:Prandombytes_implementation):longint;cdecl;external;
(* Const before type ignored *)
function randombytes_implementation_name:Pchar;cdecl;external;
{ -- NaCl compatibility interface --  }
(* Const before declarator ignored *)
(* Const before type ignored *)
procedure randombytes(buf:Pbyte; buf_len:qword);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function randombytes_BYTES_MAX : longint; { return type might be wrong }
  begin
    randombytes_BYTES_MAX:=SODIUM_MIN(SODIUM_SIZE_MAX,$ffffffff);
  end;


end.
