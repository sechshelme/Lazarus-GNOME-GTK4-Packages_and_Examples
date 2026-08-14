

  {$IFDEF read_enum}
type
  PGeglSerializeFlag = ^TGeglSerializeFlag;
  TGeglSerializeFlag = longint;
const
  GEGL_SERIALIZE_TRIM_DEFAULTS = 1 shl 0;
  GEGL_SERIALIZE_VERSION = 1 shl 1;
  GEGL_SERIALIZE_INDENT = 1 shl 2;
  GEGL_SERIALIZE_BAKE_ANIM = 1 shl 3;
  {$ENDIF read_enum}

{$IFDEF read_function}
procedure gegl_create_chain_argv(ops: PPchar; op_start: PGeglNode; op_end: PGeglNode; time: double; rel_dim: longint;
  path_root: pchar; error: PPGError); cdecl; external libgegl;
procedure gegl_create_chain(ops: pchar; op_start: PGeglNode; op_end: PGeglNode; time: double; rel_dim: longint;
  path_root: pchar; error: PPGError); cdecl; external libgegl;
function gegl_serialize(start: PGeglNode; end_: PGeglNode; basepath: pchar; serialize_flags: TGeglSerializeFlag): Pgchar; cdecl; external libgegl;
function gegl_node_new_from_serialized(chaindata: Pgchar; path_root: Pgchar): PGeglNode; cdecl; external libgegl;
procedure gegl_node_set_time(node: PGeglNode; time: double); cdecl; external libgegl;
procedure gegl_buffer_set_color(buffer: PGeglBuffer; rect: PGeglRectangle; color: PGeglColor); cdecl; external libgegl;
function gegl_babl_variant(format: PBabl; variant: TGeglBablVariant): PBabl; cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 17:15:55 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
