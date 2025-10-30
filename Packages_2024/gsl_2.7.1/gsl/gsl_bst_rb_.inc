{$IFDEF read_interface}



const
  GSL_BST_RB_MAX_HEIGHT = 48;

type
  Pgsl_bst_rb_node = ^Tgsl_bst_rb_node;
  Tgsl_bst_rb_node = record
    rb_link: array[0..1] of Pgsl_bst_rb_node;
    rb_data: pointer;
    rb_color: byte;
  end;

  Tgsl_bst_rb_table = record
    rb_root: Pgsl_bst_rb_node;
    rb_compare: Pgsl_bst_cmp_function;
    rb_param: pointer;
    rb_alloc: Pgsl_bst_allocator;
    rb_count: Tsize_t;
    rb_generation: Tculong;
  end;
  Pgsl_bst_rb_table = ^Tgsl_bst_rb_table;

  Tgsl_bst_rb_traverser = record
    rb_table: Pgsl_bst_rb_table;
    rb_node: Pgsl_bst_rb_node;
    rb_stack: array[0..(GSL_BST_RB_MAX_HEIGHT) - 1] of Pgsl_bst_rb_node;
    rb_height: Tsize_t;
    rb_generation: Tculong;
  end;
  Pgsl_bst_rb_traverser = ^Tgsl_bst_rb_traverser;

  // === Konventiert am: 20-8-25 17:44:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
