
unit types;
interface

{
  Automatically converted by H2Pas 1.0.0 from types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    types.h
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
Pbrotli_alloc_func  = ^brotli_alloc_func;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright 2013 Google Inc. All Rights Reserved.

   Distributed under MIT license.
   See file LICENSE for detail or copy at https://opensource.org/licenses/MIT
 }
{*
 * @file
 * Common types used in decoder and encoder API.
  }
{$ifndef BROTLI_COMMON_TYPES_H_}
{$define BROTLI_COMMON_TYPES_H_}
{$include <stddef.h>  /* for size_t */}
{*
 * A portable @c bool replacement.
 *
 * ::BROTLI_BOOL is a "documentation" type: actually it is @c int, but in API it
 * denotes a type, whose only values are ::BROTLI_TRUE and ::BROTLI_FALSE.
 *
 * ::BROTLI_BOOL values passed to Brotli should either be ::BROTLI_TRUE or
 * ::BROTLI_FALSE, or be a result of ::TO_BROTLI_BOOL macros.
 *
 * ::BROTLI_BOOL values returned by Brotli should not be tested for equality
 * with @c true, @c false, ::BROTLI_TRUE, ::BROTLI_FALSE, but rather should be
 * evaluated, for example: @code.cpp
 * if (SomeBrotliFunction(encoder, BROTLI_TRUE) &&
 *     !OtherBrotliFunction(decoder, BROTLI_FALSE)) 
 *   bool x = !!YetAnotherBrotliFunction(encoder, TO_BROLTI_BOOL(2 * 2 == 4));
 *   DoSomething(x);
 * 
 * @endcode
  }

const
  BROTLI_BOOL = longint;  
{* Portable @c true replacement.  }
  BROTLI_TRUE = 1;  
{* Portable @c false replacement.  }
  BROTLI_FALSE = 0;  
{* @c bool to ::BROTLI_BOOL conversion macros.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function TO_BROTLI_BOOL(X : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BROTLI_MAKE_UINT64_T(high,low : longint) : longint;

{ was #define dname def_expr }
function BROTLI_UINT32_MAX : longint; { return type might be wrong }

{ was #define dname def_expr }
function BROTLI_SIZE_MAX : longint; { return type might be wrong }

{*
 * Allocating function pointer type.
 *
 * @param opaque custom memory manager handle provided by client
 * @param size requested memory region size; can not be @c 0
 * @returns @c 0 in the case of failure
 * @returns a valid pointer to a memory region of at least @p size bytes
 *          long otherwise
  }
type
  Pbrotli_alloc_func = ^Tbrotli_alloc_func;
  Tbrotli_alloc_func = function (opaque:pointer; size:Tsize_t):pointer;cdecl;
{*
 * Deallocating function pointer type.
 *
 * This function @b SHOULD do nothing if @p address is @c 0.
 *
 * @param opaque custom memory manager handle provided by client
 * @param address memory region pointer returned by ::brotli_alloc_func, or @c 0
  }

  Tbrotli_free_func = procedure (opaque:pointer; address:pointer);cdecl;
{$endif}
{ BROTLI_COMMON_TYPES_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function TO_BROTLI_BOOL(X : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if  not ( not (X)) then
    if_local1:=BROTLI_TRUE
  else
    if_local1:=BROTLI_FALSE;
  TO_BROTLI_BOOL:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BROTLI_MAKE_UINT64_T(high,low : longint) : longint;
begin
  BROTLI_MAKE_UINT64_T:=((Tuint64_t(high)) shl 32) or low;
end;

{ was #define dname def_expr }
function BROTLI_UINT32_MAX : longint; { return type might be wrong }
  begin
    BROTLI_UINT32_MAX:= not (Tuint32_t(0));
  end;

{ was #define dname def_expr }
function BROTLI_SIZE_MAX : longint; { return type might be wrong }
  begin
    BROTLI_SIZE_MAX:= not (Tsize_t(0));
  end;


end.
