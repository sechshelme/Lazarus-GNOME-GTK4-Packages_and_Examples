
unit gegl_scratch;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_scratch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_scratch.h
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
Ptype  = ^type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2019 Ell
  }
{$ifndef __GEGL_SCRATCH_H__}
{$define __GEGL_SCRATCH_H__}
{*
 * gegl_scratch_alloc: (skip)
 * @size: the number of bytes to allocte.
 *
 * Allocates @size bytes of scratch memory.
 *
 * Returns a pointer to the allocated memory.
  }

function gegl_scratch_alloc(size:Tgsize):Tgpointer;cdecl;external;
{*
 * gegl_scratch_alloc0: (skip)
 * @size: the number of bytes to allocte.
 *
 * Allocates @size bytes of scratch memory, initialized to zero.
 *
 * Returns a pointer to the allocated memory.
  }
function gegl_scratch_alloc0(size:Tgsize):Tgpointer;cdecl;external;
{*
 * gegl_scratch_free: (skip)
 * @ptr: the memory to free.
 *
 * Frees the memory pointed to by @ptr.
 *
 * The memory must have been allocated using one of the scratch-memory
 * allocation functions.
  }
procedure gegl_scratch_free(ptr:Tgpointer);cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _GEGL_SCRATCH_MUL(x,y : longint) : longint;

{*
 * gegl_scratch_new: (skip)
 * @type: the type of the elements to allocate
 * @n: the number of elements to allocate
 *
 * Allocates @n elements of type @type using scratch memory.
 * The returned pointer is cast to a pointer to the given type.
 * Care is taken to avoid overflow when calculating the size of
 * the allocated block.
 *
 * Since the returned pointer is already cast to the right type,
 * it is normally unnecessary to cast it explicitly, and doing
 * so might hide memory allocation errors.
 *
 * Returns: a pointer to the allocated memory, cast to a pointer
 * to @type.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gegl_scratch_new(_type,n : longint) : Ptype;

{*
 * gegl_scratch_new0: (skip)
 * @type: the type of the elements to allocate
 * @n: the number of elements to allocate
 *
 * Allocates @n elements of type @type using scratch memory,
 * initialized to 0.
 * The returned pointer is cast to a pointer to the given type.
 * Care is taken to avoid overflow when calculating the size of
 * the allocated block.
 *
 * Since the returned pointer is already cast to the right type,
 * it is normally unnecessary to cast it explicitly, and doing
 * so might hide memory allocation errors.
 *
 * Returns: a pointer to the allocated memory, cast to a pointer
 * to @type.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gegl_scratch_new0(_type,n : longint) : Ptype;

{$endif}
{ __GEGL_SCRATCH_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _GEGL_SCRATCH_MUL(x,y : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if G_LIKELY(y<=(G_MAXSIZE/x)) then
    if_local1:=x*y
  else
    if_local1:=G_MAXSIZE;
  _GEGL_SCRATCH_MUL:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gegl_scratch_new(_type,n : longint) : Ptype;
begin
  gegl_scratch_new:=Ptype(gegl_scratch_alloc(_GEGL_SCRATCH_MUL(sizeof(_type),Tgsize(n))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function gegl_scratch_new0(_type,n : longint) : Ptype;
begin
  gegl_scratch_new0:=Ptype(gegl_scratch_alloc0(_GEGL_SCRATCH_MUL(sizeof(_type),Tgsize(n))));
end;


end.
