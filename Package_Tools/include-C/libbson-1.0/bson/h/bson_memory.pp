
unit bson_memory;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_memory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_memory.h
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
Pbson_mem_vtable_t  = ^bson_mem_vtable_t;
Pbson_realloc_func  = ^bson_realloc_func;
PT  = ^T;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$include <bson/bson-prelude.h>}
{$ifndef BSON_MEMORY_H}
{$define BSON_MEMORY_H}
{$include <bson/bson-macros.h>}
{$include <bson/bson-types.h>}
type
  Pbson_realloc_func = ^Tbson_realloc_func;
  Tbson_realloc_func = function (mem:pointer; num_bytes:Tsize_t; ctx:pointer):pointer;cdecl;

  Pbson_mem_vtable_t = ^Tbson_mem_vtable_t;
  Tbson_mem_vtable_t = record
      malloc : function (num_bytes:Tsize_t):pointer;cdecl;
      calloc : function (n_members:Tsize_t; num_bytes:Tsize_t):pointer;cdecl;
      realloc : function (mem:pointer; num_bytes:Tsize_t):pointer;cdecl;
      free : procedure (mem:pointer);cdecl;
      aligned_alloc : function (alignment:Tsize_t; num_bytes:Tsize_t):pointer;cdecl;
      padding : array[0..2] of pointer;
    end;
(* Const before type ignored *)

procedure bson_mem_set_vtable(vtable:Pbson_mem_vtable_t);cdecl;external;
procedure bson_mem_restore_vtable;cdecl;external;
function bson_malloc(num_bytes:Tsize_t):pointer;cdecl;external;
function bson_malloc0(num_bytes:Tsize_t):pointer;cdecl;external;
function bson_aligned_alloc(alignment:Tsize_t; num_bytes:Tsize_t):pointer;cdecl;external;
function bson_aligned_alloc0(alignment:Tsize_t; num_bytes:Tsize_t):pointer;cdecl;external;
function bson_realloc(mem:pointer; num_bytes:Tsize_t):pointer;cdecl;external;
function bson_realloc_ctx(mem:pointer; num_bytes:Tsize_t; ctx:pointer):pointer;cdecl;external;
procedure bson_free(mem:pointer);cdecl;external;
procedure bson_zero_free(mem:pointer; size:Tsize_t);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BSON_ALIGNED_ALLOC(T : longint) : PT;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BSON_ALIGNED_ALLOC0(T : longint) : PT;

{$endif}
{ BSON_MEMORY_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BSON_ALIGNED_ALLOC(T : longint) : PT;
begin
  BSON_ALIGNED_ALLOC:=PT(bson_aligned_alloc(BSON_ALIGNOF(T),sizeof(T)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function BSON_ALIGNED_ALLOC0(T : longint) : PT;
begin
  BSON_ALIGNED_ALLOC0:=PT(bson_aligned_alloc0(BSON_ALIGNOF(T),sizeof(T)));
end;


end.
