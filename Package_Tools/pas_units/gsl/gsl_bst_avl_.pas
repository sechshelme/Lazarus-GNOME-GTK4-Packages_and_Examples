unit gsl_bst_avl_;

interface

uses
  fp_gsl, gsl_bst_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  GSL_BST_AVL_MAX_HEIGHT = 32;

type
  Pgsl_bst_avl_node = ^Tgsl_bst_avl_node;

  Tgsl_bst_avl_node = record
    avl_link: array[0..1] of Pgsl_bst_avl_node;
    avl_data: pointer;
    avl_balance: char;
  end;

  Tgsl_bst_avl_table = record
    avl_root: Pgsl_bst_avl_node;
    avl_compare: Pgsl_bst_cmp_function;
    avl_param: pointer;
    avl_alloc: Pgsl_bst_allocator;
    avl_count: Tsize_t;
    avl_generation: dword;
  end;
  Pgsl_bst_avl_table = ^Tgsl_bst_avl_table;

  Tgsl_bst_avl_traverser = record
    avl_table: Pgsl_bst_avl_table;
    avl_node: Pgsl_bst_avl_node;
    avl_stack: array[0..(GSL_BST_AVL_MAX_HEIGHT) - 1] of Pgsl_bst_avl_node;
    avl_height: Tsize_t;
    avl_generation: dword;
  end;
  Pgsl_bst_avl_traverser = ^Tgsl_bst_avl_traverser;

  // === Konventiert am: 20-8-25 17:44:12 ===


implementation



end.
