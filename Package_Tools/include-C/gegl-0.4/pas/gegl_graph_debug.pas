unit gegl_graph_debug;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl, gegl_types, gegl_buffer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
procedure gegl_graph_dump_outputs(node: PGeglNode); cdecl; external libgegl;
procedure gegl_graph_dump_request(node: PGeglNode; roi: PGeglRectangle); cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 14:47:15 ===


implementation



end.
