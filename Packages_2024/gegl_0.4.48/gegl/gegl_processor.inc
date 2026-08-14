

{$IFDEF read_function}
function gegl_node_new_processor(node: PGeglNode; rectangle: PGeglRectangle): PGeglProcessor; cdecl; external libgegl;
procedure gegl_processor_set_level(processor: PGeglProcessor; level: Tgint); cdecl; external libgegl;
procedure gegl_processor_set_scale(processor: PGeglProcessor; scale: Tgdouble); cdecl; external libgegl;
procedure gegl_processor_set_rectangle(processor: PGeglProcessor; rectangle: PGeglRectangle); cdecl; external libgegl;
function gegl_processor_work(processor: PGeglProcessor; progress: Pgdouble): Tgboolean; cdecl; external libgegl;
function gegl_processor_get_buffer(processor: PGeglProcessor): PGeglBuffer; cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 15:23:55 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
