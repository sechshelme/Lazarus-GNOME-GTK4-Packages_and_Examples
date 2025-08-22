{$IFDEF read_interface}


type
  Tgsl_bst_cmp_function = function(a: pointer; b: pointer; params: pointer): longint; cdecl;
  Pgsl_bst_cmp_function = ^Tgsl_bst_cmp_function;

  Tgsl_bst_allocator = record
    alloc: function(size: Tsize_t; params: pointer): pointer; cdecl;
    free: procedure(block: pointer; params: pointer); cdecl;
  end;
  Pgsl_bst_allocator = ^Tgsl_bst_allocator;

  // === Konventiert am: 20-8-25 17:44:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
