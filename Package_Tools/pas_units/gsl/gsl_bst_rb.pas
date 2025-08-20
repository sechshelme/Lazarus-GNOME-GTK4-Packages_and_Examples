unit gsl_bst_rb;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ bst/gsl_bst_rb.h
 * 
 * Copyright (C) 2018 Patrick Alken
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
{$ifndef __GSL_BST_RB_H__}
{$define __GSL_BST_RB_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_bst_types.h>}
{$ifndef GSL_BST_RB_MAX_HEIGHT}

const
  GSL_BST_RB_MAX_HEIGHT = 48;  
{$endif}
{ red-black node  }
{ subtrees  }
{ pointer to data  }
{ color  }
type
  Pgsl_bst_rb_node = ^Tgsl_bst_rb_node;
  Tgsl_bst_rb_node = record
      rb_link : array[0..1] of Pgsl_bst_rb_node;
      rb_data : pointer;
      rb_color : byte;
    end;

{ red-black tree data structure  }
{ tree's root  }
{ comparison function  }
{ extra argument to |rb_compare|  }
{ memory allocator  }
{ number of items in tree  }
{ generation number  }

  Pgsl_bst_rb_table = ^Tgsl_bst_rb_table;
  Tgsl_bst_rb_table = record
      rb_root : Pgsl_bst_rb_node;
      rb_compare : Pgsl_bst_cmp_function;
      rb_param : pointer;
      rb_alloc : Pgsl_bst_allocator;
      rb_count : Tsize_t;
      rb_generation : dword;
    end;
{ red-black traverser structure  }
{ tree being traversed  }
{ current node in tree  }
{ all the nodes above |rb_node|  }
{ number of nodes in |rb_parent|  }
{ generation number  }

  Pgsl_bst_rb_traverser = ^Tgsl_bst_rb_traverser;
  Tgsl_bst_rb_traverser = record
      rb_table : Pgsl_bst_rb_table;
      rb_node : Pgsl_bst_rb_node;
      rb_stack : array[0..(GSL_BST_RB_MAX_HEIGHT)-1] of Pgsl_bst_rb_node;
      rb_height : Tsize_t;
      rb_generation : dword;
    end;
{$endif}
{ __GSL_BST_RB_H__  }

// === Konventiert am: 20-8-25 17:44:15 ===


implementation



end.
