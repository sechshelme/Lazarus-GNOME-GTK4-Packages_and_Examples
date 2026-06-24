
unit gallocator;
interface

{
  Automatically converted by H2Pas 1.0.0 from gallocator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gallocator.h
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
PGAllocator  = ^GAllocator;
Pgchar  = ^gchar;
PGMemChunk  = ^GMemChunk;
Ptype  = ^type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_ALLOCATOR_H__}
{$define __G_ALLOCATOR_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
type

const
  G_ALLOC_ONLY = 1;  
  G_ALLOC_AND_FREE = 2;  
  G_ALLOCATOR_LIST = 1;  
  G_ALLOCATOR_SLIST = 2;  
  G_ALLOCATOR_NODE = 3;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function g_chunk_new(_type,chunk : longint) : Ptype;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function g_chunk_new0(_type,chunk : longint) : Ptype;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_chunk_free(mem,mem_chunk : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_mem_chunk_create(_type,x,y : longint) : longint;

(* Const before type ignored *)
function g_mem_chunk_new(name:Pgchar; atom_size:Tgint; area_size:Tgsize; _type:Tgint):PGMemChunk;cdecl;external;
procedure g_mem_chunk_destroy(mem_chunk:PGMemChunk);cdecl;external;
function g_mem_chunk_alloc(mem_chunk:PGMemChunk):Tgpointer;cdecl;external;
function g_mem_chunk_alloc0(mem_chunk:PGMemChunk):Tgpointer;cdecl;external;
procedure g_mem_chunk_free(mem_chunk:PGMemChunk; mem:Tgpointer);cdecl;external;
procedure g_mem_chunk_clean(mem_chunk:PGMemChunk);cdecl;external;
procedure g_mem_chunk_reset(mem_chunk:PGMemChunk);cdecl;external;
procedure g_mem_chunk_print(mem_chunk:PGMemChunk);cdecl;external;
procedure g_mem_chunk_info;cdecl;external;
procedure g_blow_chunks;cdecl;external;
(* Const before type ignored *)
function g_allocator_new(name:Pgchar; n_preallocs:Tguint):PGAllocator;cdecl;external;
procedure g_allocator_free(allocator:PGAllocator);cdecl;external;
procedure g_list_push_allocator(allocator:PGAllocator);cdecl;external;
procedure g_list_pop_allocator;cdecl;external;
procedure g_slist_push_allocator(allocator:PGAllocator);cdecl;external;
procedure g_slist_pop_allocator;cdecl;external;
procedure g_node_push_allocator(allocator:PGAllocator);cdecl;external;
procedure g_node_pop_allocator;cdecl;external;
{$endif}
{ __G_ALLOCATOR_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function g_chunk_new(_type,chunk : longint) : Ptype;
begin
  g_chunk_new:=Ptype(g_mem_chunk_alloc(chunk));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function g_chunk_new0(_type,chunk : longint) : Ptype;
begin
  g_chunk_new0:=Ptype(g_mem_chunk_alloc0(chunk));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_chunk_free(mem,mem_chunk : longint) : longint;
begin
  g_chunk_free:=g_mem_chunk_free(mem_chunk,mem);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function g_mem_chunk_create(_type,x,y : longint) : longint;
begin
  g_mem_chunk_create:=g_mem_chunk_new(NULL,sizeof(_type),0,0);
end;


end.
