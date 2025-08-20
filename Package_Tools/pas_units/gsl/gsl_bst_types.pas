unit gsl_bst_types;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ bst/gsl_bst_types.h
 * 
 * Copyright (C) 2019 Patrick Alken
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __GSL_BST_TYPES_H__}
{$define __GSL_BST_TYPES_H__}
{$include <stdlib.h>}
type

  Tgsl_bst_cmp_function = function (a:pointer; b:pointer; params:pointer):longint;cdecl;
{ allocation routines  }

  Pgsl_bst_allocator = ^Tgsl_bst_allocator;
  Tgsl_bst_allocator = record
      alloc : function (size:Tsize_t; params:pointer):pointer;cdecl;
      free : procedure (block:pointer; params:pointer);cdecl;
    end;
{$endif}
{ __GSL_BST_TYPES_H__  }

// === Konventiert am: 20-8-25 17:44:18 ===


implementation



end.
