

{$IFDEF read_function}
function gegl_node_new: PGeglNode; cdecl; external libgegl;
function gegl_node_new_child(parent: PGeglNode; first_property_name: Pgchar): PGeglNode; cdecl; varargs; external libgegl;
function gegl_node_connect_from(sink: PGeglNode; input_pad_name: Pgchar; source: PGeglNode; output_pad_name: Pgchar): Tgboolean; cdecl; external libgegl; deprecated;
function gegl_node_connect_to(source: PGeglNode; output_pad_name: Pgchar; sink: PGeglNode; input_pad_name: Pgchar): Tgboolean; cdecl; external libgegl; deprecated;
function gegl_node_connect(a: PGeglNode; a_pad_name: Pgchar; b: PGeglNode; b_pad_name: Pgchar): Tgboolean; cdecl; external libgegl;
procedure gegl_node_link(source: PGeglNode; sink: PGeglNode); cdecl; external libgegl;
procedure gegl_node_link_many(source: PGeglNode; first_sink: PGeglNode); cdecl; varargs; external libgegl;
function gegl_node_disconnect(node: PGeglNode; input_pad: Pgchar): Tgboolean; cdecl; external libgegl;
procedure gegl_node_set(node: PGeglNode; first_property_name: Pgchar); cdecl; varargs; external libgegl;
procedure gegl_node_set_valist(node: PGeglNode; first_property_name: Pgchar; args: Tva_list); cdecl; external libgegl;
procedure gegl_node_get(node: PGeglNode; first_property_name: Pgchar); cdecl; varargs; external libgegl;
procedure gegl_node_get_valist(node: PGeglNode; first_property_name: Pgchar; args: Tva_list); cdecl; external libgegl;
procedure gegl_node_blit(node: PGeglNode; scale: Tgdouble; roi: PGeglRectangle; format: PBabl; destination_buf: Tgpointer;
  rowstride: Tgint; flags: TGeglBlitFlags); cdecl; external libgegl;
procedure gegl_node_blit_buffer(node: PGeglNode; buffer: PGeglBuffer; roi: PGeglRectangle; level: longint; abyss_policy: TGeglAbyssPolicy); cdecl; external libgegl;
procedure gegl_node_process(sink_node: PGeglNode); cdecl; external libgegl;
function gegl_node_add_child(graph: PGeglNode; child: PGeglNode): PGeglNode; cdecl; external libgegl;
function gegl_node_remove_child(graph: PGeglNode; child: PGeglNode): PGeglNode; cdecl; external libgegl;
function gegl_node_get_parent(node: PGeglNode): PGeglNode; cdecl; external libgegl;
function gegl_node_detect(node: PGeglNode; x: Tgint; y: Tgint): PGeglNode; cdecl; external libgegl;
function gegl_node_find_property(node: PGeglNode; property_name: Pgchar): PGParamSpec; cdecl; external libgegl;
function gegl_node_get_bounding_box(node: PGeglNode): TGeglRectangle; cdecl; external libgegl;
function gegl_node_get_children(node: PGeglNode): PGSList; cdecl; external libgegl;
function gegl_node_get_consumers(node: PGeglNode; output_pad: Pgchar; nodes: PPPGeglNode; pads: PPPgchar): Tgint; cdecl; external libgegl;
function gegl_node_get_input_proxy(node: PGeglNode; pad_name: Pgchar): PGeglNode; cdecl; external libgegl;
function gegl_node_get_operation(node: PGeglNode): Pgchar; cdecl; external libgegl;
function gegl_node_get_gegl_operation(node: PGeglNode): PGeglOperation; cdecl; external libgegl;
function gegl_node_get_output_proxy(node: PGeglNode; pad_name: Pgchar): PGeglNode; cdecl; external libgegl;
function gegl_node_get_producer(node: PGeglNode; input_pad_name: Pgchar; output_pad_name: PPgchar): PGeglNode; cdecl; external libgegl;
function gegl_node_has_pad(node: PGeglNode; pad_name: Pgchar): Tgboolean; cdecl; external libgegl;
function gegl_node_list_input_pads(node: PGeglNode): PPgchar; cdecl; external libgegl;
function gegl_node_list_output_pads(node: PGeglNode): PPgchar; cdecl; external libgegl;
function gegl_node_create_child(parent: PGeglNode; operation: Pgchar): PGeglNode; cdecl; external libgegl;
procedure gegl_node_get_property(node: PGeglNode; property_name: Pgchar; value: PGValue); cdecl; external libgegl;
procedure gegl_node_set_property(node: PGeglNode; property_name: Pgchar; value: PGValue); cdecl; external libgegl;
function gegl_node_new_from_xml(xmldata: Pgchar; path_root: Pgchar): PGeglNode; cdecl; external libgegl;
function gegl_node_new_from_file(path: Pgchar): PGeglNode; cdecl; external libgegl;
function gegl_node_to_xml(node: PGeglNode; path_root: Pgchar): Pgchar; cdecl; external libgegl;
function gegl_node_to_xml_full(head: PGeglNode; tail: PGeglNode; path_root: Pgchar): Pgchar; cdecl; external libgegl;
function gegl_node_get_passthrough(node: PGeglNode): Tgboolean; cdecl; external libgegl;
procedure gegl_node_set_passthrough(node: PGeglNode; passthrough: Tgboolean); cdecl; external libgegl;
function gegl_node_is_graph(node: PGeglNode): Tgboolean; cdecl; external libgegl;
procedure gegl_node_progress(node: PGeglNode; progress: Tgdouble; message: Pgchar); cdecl; external libgegl;
function gegl_operation_get_op_version(op_name: Pgchar): pchar; cdecl; external libgegl;
procedure gegl_node_set_enum_as_string(node: PGeglNode; key: pchar; value: pchar); cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 15:08:44 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
