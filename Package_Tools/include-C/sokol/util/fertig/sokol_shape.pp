
unit sokol_shape;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_shape.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_shape.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Psshape_box_t  = ^sshape_box_t;
Psshape_buffer_item_t  = ^sshape_buffer_item_t;
Psshape_buffer_t  = ^sshape_buffer_t;
Psshape_cylinder_t  = ^sshape_cylinder_t;
Psshape_element_range_t  = ^sshape_element_range_t;
Psshape_mat4_t  = ^sshape_mat4_t;
Psshape_plane_t  = ^sshape_plane_t;
Psshape_range  = ^sshape_range;
Psshape_sizes_item_t  = ^sshape_sizes_item_t;
Psshape_sizes_t  = ^sshape_sizes_t;
Psshape_sphere_t  = ^sshape_sphere_t;
Psshape_torus_t  = ^sshape_torus_t;
Psshape_vertex_t  = ^sshape_vertex_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    sshape_range is a pointer-size-pair struct used to pass memory
    blobs into sokol-shape. When initialized from a value type
    (array or struct), use the SSHAPE_RANGE() macro to build
    an sshape_range struct.
 }
(* Const before type ignored *)
type
  Psshape_range = ^Tsshape_range;
  Tsshape_range = record
      ptr : pointer;
      size : Tsize_t;
    end;
{ a 4x4 matrix wrapper struct  }

  Psshape_mat4_t = ^Tsshape_mat4_t;
  Tsshape_mat4_t = record
      m : array[0..3] of array[0..3] of single;
    end;
{ vertex layout of the generated geometry  }
{ packed normal as BYTE4N }
{ packed uv coords as USHORT2N }
{ packed color as UBYTE4N (r,g,b,a); }

  Psshape_vertex_t = ^Tsshape_vertex_t;
  Tsshape_vertex_t = record
      x : single;
      y : single;
      z : single;
      normal : Tuint32_t;
      u : Tuint16_t;
      v : Tuint16_t;
      color : Tuint32_t;
    end;
{ a range of draw-elements (sg_draw(int base_element, int num_element, ...))  }

  Psshape_element_range_t = ^Tsshape_element_range_t;
  Tsshape_element_range_t = record
      base_element : longint;
      num_elements : longint;
    end;
{ number of elements and byte size of build actions  }
{ number of elements }
{ the same as size in bytes }

  Psshape_sizes_item_t = ^Tsshape_sizes_item_t;
  Tsshape_sizes_item_t = record
      num : Tuint32_t;
      size : Tuint32_t;
    end;

  Psshape_sizes_t = ^Tsshape_sizes_t;
  Tsshape_sizes_t = record
      vertices : Tsshape_sizes_item_t;
      indices : Tsshape_sizes_item_t;
    end;
{ in/out struct to keep track of mesh-build state  }
{ pointer/size pair of output buffer }
{ size in bytes of valid data in buffer }
{ data offset of the most recent shape }

  Psshape_buffer_item_t = ^Tsshape_buffer_item_t;
  Tsshape_buffer_item_t = record
      buffer : Tsshape_range;
      data_size : Tsize_t;
      shape_offset : Tsize_t;
    end;

  Psshape_buffer_t = ^Tsshape_buffer_t;
  Tsshape_buffer_t = record
      valid : Tbool;
      vertices : Tsshape_buffer_item_t;
      indices : Tsshape_buffer_item_t;
    end;
{ creation parameters for the different shape types  }
{ default: 1.0 }
{ default: 1 }
{ default: white }
{ default: false }
{ if true merge with previous shape (default: false) }
{ default: identity matrix }

  Psshape_plane_t = ^Tsshape_plane_t;
  Tsshape_plane_t = record
      width : single;
      depth : single;
      tiles : Tuint16_t;
      color : Tuint32_t;
      random_colors : Tbool;
      merge : Tbool;
      transform : Tsshape_mat4_t;
    end;
{ default: 1.0 }
{ default: 1 }
{ default: white }
{ default: false }
{ if true merge with previous shape (default: false) }
{ default: identity matrix }

  Psshape_box_t = ^Tsshape_box_t;
  Tsshape_box_t = record
      width : single;
      height : single;
      depth : single;
      tiles : Tuint16_t;
      color : Tuint32_t;
      random_colors : Tbool;
      merge : Tbool;
      transform : Tsshape_mat4_t;
    end;
{ default: 0.5 }
{ default: 5 }
{ default: 4 }
{ default: white }
{ default: false }
{ if true merge with previous shape (default: false) }
{ default: identity matrix }

  Psshape_sphere_t = ^Tsshape_sphere_t;
  Tsshape_sphere_t = record
      radius : single;
      slices : Tuint16_t;
      stacks : Tuint16_t;
      color : Tuint32_t;
      random_colors : Tbool;
      merge : Tbool;
      transform : Tsshape_mat4_t;
    end;
{ default: 0.5 }
{ default: 1.0 }
{ default: 5 }
{ default: 1 }
{ default: white }
{ default: false }
{ if true merge with previous shape (default: false) }
{ default: identity matrix }

  Psshape_cylinder_t = ^Tsshape_cylinder_t;
  Tsshape_cylinder_t = record
      radius : single;
      height : single;
      slices : Tuint16_t;
      stacks : Tuint16_t;
      color : Tuint32_t;
      random_colors : Tbool;
      merge : Tbool;
      transform : Tsshape_mat4_t;
    end;
{ default: 0.5f }
{ default: 0.2f }
{ default: 5 }
{ default: 5 }
{ default: white }
{ default: false }
{ if true merge with previous shape (default: false) }
{ default: identity matrix }

  Psshape_torus_t = ^Tsshape_torus_t;
  Tsshape_torus_t = record
      radius : single;
      ring_radius : single;
      sides : Tuint16_t;
      rings : Tuint16_t;
      color : Tuint32_t;
      random_colors : Tbool;
      merge : Tbool;
      transform : Tsshape_mat4_t;
    end;
{ shape builder functions  }
(* Const before type ignored *)
(* Const before type ignored *)

function sshape_build_plane(buf:Psshape_buffer_t; params:Psshape_plane_t):Tsshape_buffer_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function sshape_build_box(buf:Psshape_buffer_t; params:Psshape_box_t):Tsshape_buffer_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function sshape_build_sphere(buf:Psshape_buffer_t; params:Psshape_sphere_t):Tsshape_buffer_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function sshape_build_cylinder(buf:Psshape_buffer_t; params:Psshape_cylinder_t):Tsshape_buffer_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function sshape_build_torus(buf:Psshape_buffer_t; params:Psshape_torus_t):Tsshape_buffer_t;cdecl;external;
{ query required vertex- and index-buffer sizes in bytes  }
function sshape_plane_sizes(tiles:Tuint32_t):Tsshape_sizes_t;cdecl;external;
function sshape_box_sizes(tiles:Tuint32_t):Tsshape_sizes_t;cdecl;external;
function sshape_sphere_sizes(slices:Tuint32_t; stacks:Tuint32_t):Tsshape_sizes_t;cdecl;external;
function sshape_cylinder_sizes(slices:Tuint32_t; stacks:Tuint32_t):Tsshape_sizes_t;cdecl;external;
function sshape_torus_sizes(sides:Tuint32_t; rings:Tuint32_t):Tsshape_sizes_t;cdecl;external;
{ extract sokol-gfx desc structs and primitive ranges from build state  }
(* Const before type ignored *)
function sshape_element_range(buf:Psshape_buffer_t):Tsshape_element_range_t;cdecl;external;
(* Const before type ignored *)
function sshape_vertex_buffer_desc(buf:Psshape_buffer_t):Tsg_buffer_desc;cdecl;external;
(* Const before type ignored *)
function sshape_index_buffer_desc(buf:Psshape_buffer_t):Tsg_buffer_desc;cdecl;external;
function sshape_vertex_buffer_layout_state:Tsg_vertex_buffer_layout_state;cdecl;external;
function sshape_position_vertex_attr_state:Tsg_vertex_attr_state;cdecl;external;
function sshape_normal_vertex_attr_state:Tsg_vertex_attr_state;cdecl;external;
function sshape_texcoord_vertex_attr_state:Tsg_vertex_attr_state;cdecl;external;
function sshape_color_vertex_attr_state:Tsg_vertex_attr_state;cdecl;external;
{ helper functions to build packed color value from floats or bytes  }
function sshape_color_4f(r:single; g:single; b:single; a:single):Tuint32_t;cdecl;external;
function sshape_color_3f(r:single; g:single; b:single):Tuint32_t;cdecl;external;
function sshape_color_4b(r:Tuint8_t; g:Tuint8_t; b:Tuint8_t; a:Tuint8_t):Tuint32_t;cdecl;external;
function sshape_color_3b(r:Tuint8_t; g:Tuint8_t; b:Tuint8_t):Tuint32_t;cdecl;external;
{ adapter function for filling matrix struct from generic float[16] array  }
(* Const before type ignored *)
function sshape_mat4(m:array[0..15] of single):Tsshape_mat4_t;cdecl;external;
(* Const before type ignored *)
function sshape_mat4_transpose(m:array[0..15] of single):Tsshape_mat4_t;cdecl;external;

implementation


end.
