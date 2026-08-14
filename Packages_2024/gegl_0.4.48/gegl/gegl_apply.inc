

{$IFDEF read_function}
procedure gegl_apply_op(buffer: PGeglBuffer; operation_name: Pgchar); cdecl; varargs; external libgegl;
function gegl_filter_op(source_buffer: PGeglBuffer; operation_name: Pgchar): PGeglBuffer; cdecl; varargs; external libgegl;
procedure gegl_render_op(source_buffer: PGeglBuffer; target_buffer: PGeglBuffer; operation_name: Pgchar); cdecl; varargs; external libgegl;
procedure gegl_apply_op_valist(buffer: PGeglBuffer; operation_name: Pgchar; var_args: Tva_list); cdecl; external libgegl;
function gegl_filter_op_valist(source_buffer: PGeglBuffer; operation_name: Pgchar; var_args: Tva_list): PGeglBuffer; cdecl; external libgegl;
procedure gegl_render_op_valist(source_buffer: PGeglBuffer; target_buffer: PGeglBuffer; operation_name: Pgchar; var_args: Tva_list); cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 14:30:31 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
