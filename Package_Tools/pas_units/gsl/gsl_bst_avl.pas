unit gsl_bst_avl;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ bst/gsl_bst_avl.h
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
{$ifndef __GSL_BST_AVL_H__}
{$define __GSL_BST_AVL_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_bst_types.h>}
{$ifndef GSL_BST_AVL_MAX_HEIGHT}

const
  GSL_BST_AVL_MAX_HEIGHT = 32;  
{$endif}
{ AVL node  }
{ subtrees  }
{ pointer to data  }
{ balance factor  }
type
  Pgsl_bst_avl_node = ^Tgsl_bst_avl_node;
  Tgsl_bst_avl_node = record
      avl_link : array[0..1] of Pgsl_bst_avl_node;
      avl_data : pointer;
      avl_balance : char;
    end;

{ tree data structure  }
{ tree's root  }
{ comparison function  }
{ extra argument to |avl_compare|  }
{ memory allocator  }
{ number of items in tree  }
{ generation number  }

  Pgsl_bst_avl_table = ^Tgsl_bst_avl_table;
  Tgsl_bst_avl_table = record
      avl_root : Pgsl_bst_avl_node;
      avl_compare : Pgsl_bst_cmp_function;
      avl_param : pointer;
      avl_alloc : Pgsl_bst_allocator;
      avl_count : Tsize_t;
      avl_generation : dword;
    end;
{ AVL traverser structure  }
{ tree being traversed  }
{ current node in tree  }
{ all the nodes above |avl_node|  }
{ number of nodes in |avl_parent|  }
{ generation number  }

  Pgsl_bst_avl_traverser = ^Tgsl_bst_avl_traverser;
  Tgsl_bst_avl_traverser = record
      avl_table : Pgsl_bst_avl_table;
      avl_node : Pgsl_bst_avl_node;
      avl_stack : array[0..(GSL_BST_AVL_MAX_HEIGHT)-1] of Pgsl_bst_avl_node;
      avl_height : Tsize_t;
      avl_generation : dword;
    end;
{$endif}
{ __GSL_BST_AVL_H__  }

// === Konventiert am: 20-8-25 17:44:12 ===


implementation



end.
