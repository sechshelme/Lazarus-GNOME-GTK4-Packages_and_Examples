unit sokol_shape;

interface

uses
  fp_sokol, sokol_gfx;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tsshape_range = record
    ptr: pointer;
    size: Tsize_t;
  end;
  Psshape_range = ^Tsshape_range;

  Tsshape_mat4_t = record
    m: array[0..3] of array[0..3] of single;
  end;
  Psshape_mat4_t = ^Tsshape_mat4_t;

  Tsshape_vertex_t = record
    x: single;
    y: single;
    z: single;
    normal: Tuint32_t;
    u: Tuint16_t;
    v: Tuint16_t;
    color: Tuint32_t;
  end;
  Psshape_vertex_t = ^Tsshape_vertex_t;

  Tsshape_element_range_t = record
    base_element: longint;
    num_elements: longint;
  end;
  Psshape_element_range_t = ^Tsshape_element_range_t;

  Tsshape_sizes_item_t = record
    num: Tuint32_t;
    size: Tuint32_t;
  end;
  Psshape_sizes_item_t = ^Tsshape_sizes_item_t;

  Tsshape_sizes_t = record
    vertices: Tsshape_sizes_item_t;
    indices: Tsshape_sizes_item_t;
  end;
  Psshape_sizes_t = ^Tsshape_sizes_t;

  Tsshape_buffer_item_t = record
    buffer: Tsshape_range;
    data_size: Tsize_t;
    shape_offset: Tsize_t;
  end;
  Psshape_buffer_item_t = ^Tsshape_buffer_item_t;

  Tsshape_buffer_t = record
    valid: boolean;
    vertices: Tsshape_buffer_item_t;
    indices: Tsshape_buffer_item_t;
  end;
  Psshape_buffer_t = ^Tsshape_buffer_t;

  Tsshape_plane_t = record
    width: single;
    depth: single;
    tiles: Tuint16_t;
    color: Tuint32_t;
    random_colors: boolean;
    merge: boolean;
    transform: Tsshape_mat4_t;
  end;
  Psshape_plane_t = ^Tsshape_plane_t;

  Tsshape_box_t = record
    width: single;
    height: single;
    depth: single;
    tiles: Tuint16_t;
    color: Tuint32_t;
    random_colors: boolean;
    merge: boolean;
    transform: Tsshape_mat4_t;
  end;
  Psshape_box_t = ^Tsshape_box_t;

  Tsshape_sphere_t = record
    radius: single;
    slices: Tuint16_t;
    stacks: Tuint16_t;
    color: Tuint32_t;
    random_colors: boolean;
    merge: boolean;
    transform: Tsshape_mat4_t;
  end;
  Psshape_sphere_t = ^Tsshape_sphere_t;

  Tsshape_cylinder_t = record
    radius: single;
    height: single;
    slices: Tuint16_t;
    stacks: Tuint16_t;
    color: Tuint32_t;
    random_colors: boolean;
    merge: boolean;
    transform: Tsshape_mat4_t;
  end;
  Psshape_cylinder_t = ^Tsshape_cylinder_t;

  Tsshape_torus_t = record
    radius: single;
    ring_radius: single;
    sides: Tuint16_t;
    rings: Tuint16_t;
    color: Tuint32_t;
    random_colors: boolean;
    merge: boolean;
    transform: Tsshape_mat4_t;
  end;
  Psshape_torus_t = ^Tsshape_torus_t;

function sshape_build_plane(buf: Psshape_buffer_t; params: Psshape_plane_t): Tsshape_buffer_t; cdecl; external libsokol;
function sshape_build_box(buf: Psshape_buffer_t; params: Psshape_box_t): Tsshape_buffer_t; cdecl; external libsokol;
function sshape_build_sphere(buf: Psshape_buffer_t; params: Psshape_sphere_t): Tsshape_buffer_t; cdecl; external libsokol;
function sshape_build_cylinder(buf: Psshape_buffer_t; params: Psshape_cylinder_t): Tsshape_buffer_t; cdecl; external libsokol;
function sshape_build_torus(buf: Psshape_buffer_t; params: Psshape_torus_t): Tsshape_buffer_t; cdecl; external libsokol;

function sshape_plane_sizes(tiles: Tuint32_t): Tsshape_sizes_t; cdecl; external libsokol;
function sshape_box_sizes(tiles: Tuint32_t): Tsshape_sizes_t; cdecl; external libsokol;
function sshape_sphere_sizes(slices: Tuint32_t; stacks: Tuint32_t): Tsshape_sizes_t; cdecl; external libsokol;
function sshape_cylinder_sizes(slices: Tuint32_t; stacks: Tuint32_t): Tsshape_sizes_t; cdecl; external libsokol;
function sshape_torus_sizes(sides: Tuint32_t; rings: Tuint32_t): Tsshape_sizes_t; cdecl; external libsokol;

function sshape_element_range(buf: Psshape_buffer_t): Tsshape_element_range_t; cdecl; external libsokol;
function sshape_vertex_buffer_desc(buf: Psshape_buffer_t): Tsg_buffer_desc; cdecl; external libsokol;
function sshape_index_buffer_desc(buf: Psshape_buffer_t): Tsg_buffer_desc; cdecl; external libsokol;
function sshape_vertex_buffer_layout_state: Tsg_vertex_buffer_layout_state; cdecl; external libsokol;
function sshape_position_vertex_attr_state: Tsg_vertex_attr_state; cdecl; external libsokol;
function sshape_normal_vertex_attr_state: Tsg_vertex_attr_state; cdecl; external libsokol;
function sshape_texcoord_vertex_attr_state: Tsg_vertex_attr_state; cdecl; external libsokol;
function sshape_color_vertex_attr_state: Tsg_vertex_attr_state; cdecl; external libsokol;

function sshape_color_4f(r: single; g: single; b: single; a: single): Tuint32_t; cdecl; external libsokol;
function sshape_color_3f(r: single; g: single; b: single): Tuint32_t; cdecl; external libsokol;
function sshape_color_4b(r: Tuint8_t; g: Tuint8_t; b: Tuint8_t; a: Tuint8_t): Tuint32_t; cdecl; external libsokol;
function sshape_color_3b(r: Tuint8_t; g: Tuint8_t; b: Tuint8_t): Tuint32_t; cdecl; external libsokol;

function sshape_mat4(m: Psingle): Tsshape_mat4_t; cdecl; external libsokol;
function sshape_mat4_transpose(m: Psingle): Tsshape_mat4_t; cdecl; external libsokol;

// === Konventiert am: 24-3-26 13:40:12 ===


implementation



end.
