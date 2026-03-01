unit manifoldc;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright 2023 The Manifold Authors. }
{ }
{ Licensed under the Apache License, Version 2.0 (the "License"); }
{ you may not use this file except in compliance with the License. }
{ You may obtain a copy of the License at }
{ }
{      http://www.apache.org/licenses/LICENSE-2.0 }
{ }
{ Unless required by applicable law or agreed to in writing, software }
{ distributed under the License is distributed on an "AS IS" BASIS, }
{ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{ See the License for the specific language governing permissions and }
{ limitations under the License. }
{$include <stddef.h>}
{$include <stdint.h>}
{$include "manifold/types.h"}
{ Polygons }

function manifold_simple_polygon(mem:pointer; ps:PManifoldVec2; length:Tsize_t):PManifoldSimplePolygon;cdecl;external libmanifoldc;
function manifold_polygons(mem:pointer; ps:PPManifoldSimplePolygon; length:Tsize_t):PManifoldPolygons;cdecl;external libmanifoldc;
function manifold_simple_polygon_length(p:PManifoldSimplePolygon):Tsize_t;cdecl;external libmanifoldc;
function manifold_polygons_length(ps:PManifoldPolygons):Tsize_t;cdecl;external libmanifoldc;
function manifold_polygons_simple_length(ps:PManifoldPolygons; idx:Tsize_t):Tsize_t;cdecl;external libmanifoldc;
function manifold_simple_polygon_get_point(p:PManifoldSimplePolygon; idx:Tsize_t):TManifoldVec2;cdecl;external libmanifoldc;
function manifold_polygons_get_simple(mem:pointer; ps:PManifoldPolygons; idx:Tsize_t):PManifoldSimplePolygon;cdecl;external libmanifoldc;
function manifold_polygons_get_point(ps:PManifoldPolygons; simple_idx:Tsize_t; pt_idx:Tsize_t):TManifoldVec2;cdecl;external libmanifoldc;
{ Mesh Construction }
function manifold_meshgl(mem:pointer; vert_props:Psingle; n_verts:Tsize_t; n_props:Tsize_t; tri_verts:Puint32_t; 
           n_tris:Tsize_t):PManifoldMeshGL;cdecl;external libmanifoldc;
function manifold_meshgl_w_tangents(mem:pointer; vert_props:Psingle; n_verts:Tsize_t; n_props:Tsize_t; tri_verts:Puint32_t; 
           n_tris:Tsize_t; halfedge_tangent:Psingle):PManifoldMeshGL;cdecl;external libmanifoldc;
function manifold_meshgl_w_options(mem:pointer; vert_props:Psingle; n_verts:Tsize_t; n_props:Tsize_t; tri_verts:Puint32_t; 
           n_tris:Tsize_t; options:PManifoldMeshGLOptions):PManifoldMeshGL;cdecl;external libmanifoldc;
function manifold_get_meshgl(mem:pointer; m:PManifoldManifold):PManifoldMeshGL;cdecl;external libmanifoldc;
function manifold_get_meshgl_w_normals(mem:pointer; m:PManifoldManifold; normalIdx:Tint32_t):PManifoldMeshGL;cdecl;external libmanifoldc;
function manifold_meshgl_copy(mem:pointer; m:PManifoldMeshGL):PManifoldMeshGL;cdecl;external libmanifoldc;
function manifold_meshgl_merge(mem:pointer; m:PManifoldMeshGL):PManifoldMeshGL;cdecl;external libmanifoldc;
function manifold_meshgl64(mem:pointer; vert_props:Pdouble; n_verts:Tsize_t; n_props:Tsize_t; tri_verts:Puint64_t; 
           n_tris:Tsize_t):PManifoldMeshGL64;cdecl;external libmanifoldc;
function manifold_meshgl64_w_tangents(mem:pointer; vert_props:Pdouble; n_verts:Tsize_t; n_props:Tsize_t; tri_verts:Puint64_t; 
           n_tris:Tsize_t; halfedge_tangent:Pdouble):PManifoldMeshGL64;cdecl;external libmanifoldc;
function manifold_meshgl64_w_options(mem:pointer; vert_props:Pdouble; n_verts:Tsize_t; n_props:Tsize_t; tri_verts:Puint64_t; 
           n_tris:Tsize_t; options:PManifoldMeshGL64Options):PManifoldMeshGL64;cdecl;external libmanifoldc;
function manifold_get_meshgl64(mem:pointer; m:PManifoldManifold):PManifoldMeshGL64;cdecl;external libmanifoldc;
function manifold_get_meshgl64_w_normals(mem:pointer; m:PManifoldManifold; normalIdx:Tint32_t):PManifoldMeshGL64;cdecl;external libmanifoldc;
function manifold_meshgl64_copy(mem:pointer; m:PManifoldMeshGL64):PManifoldMeshGL64;cdecl;external libmanifoldc;
function manifold_meshgl64_merge(mem:pointer; m:PManifoldMeshGL64):PManifoldMeshGL64;cdecl;external libmanifoldc;
{ SDF }
{ By default, the execution policy (sequential or parallel) of }
{ manifold_level_set will be chosen automatically depending on the size of the }
{ job and whether Manifold has been compiled with a PAR backend. If you are }
{ using these bindings from a language that has a runtime lock preventing the }
{ parallel execution of closures, then you should use manifold_level_set_seq to }
{ force sequential execution. }
function manifold_level_set(mem:pointer; sdf:TManifoldSdf; bounds:PManifoldBox; edge_length:Tdouble; level:Tdouble; 
           tolerance:Tdouble; ctx:pointer):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_level_set_seq(mem:pointer; sdf:TManifoldSdf; bounds:PManifoldBox; edge_length:Tdouble; level:Tdouble; 
           tolerance:Tdouble; ctx:pointer):PManifoldManifold;cdecl;external libmanifoldc;
{ Manifold Vectors }
function manifold_manifold_empty_vec(mem:pointer):PManifoldManifoldVec;cdecl;external libmanifoldc;
function manifold_manifold_vec(mem:pointer; sz:Tsize_t):PManifoldManifoldVec;cdecl;external libmanifoldc;
procedure manifold_manifold_vec_reserve(ms:PManifoldManifoldVec; sz:Tsize_t);cdecl;external libmanifoldc;
function manifold_manifold_vec_length(ms:PManifoldManifoldVec):Tsize_t;cdecl;external libmanifoldc;
function manifold_manifold_vec_get(mem:pointer; ms:PManifoldManifoldVec; idx:Tsize_t):PManifoldManifold;cdecl;external libmanifoldc;
procedure manifold_manifold_vec_set(ms:PManifoldManifoldVec; idx:Tsize_t; m:PManifoldManifold);cdecl;external libmanifoldc;
procedure manifold_manifold_vec_push_back(ms:PManifoldManifoldVec; m:PManifoldManifold);cdecl;external libmanifoldc;
{ Manifold Booleans }
function manifold_boolean(mem:pointer; a:PManifoldManifold; b:PManifoldManifold; op:TManifoldOpType):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_batch_boolean(mem:pointer; ms:PManifoldManifoldVec; op:TManifoldOpType):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_union(mem:pointer; a:PManifoldManifold; b:PManifoldManifold):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_difference(mem:pointer; a:PManifoldManifold; b:PManifoldManifold):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_intersection(mem:pointer; a:PManifoldManifold; b:PManifoldManifold):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_split(mem_first:pointer; mem_second:pointer; a:PManifoldManifold; b:PManifoldManifold):TManifoldManifoldPair;cdecl;external libmanifoldc;
function manifold_split_by_plane(mem_first:pointer; mem_second:pointer; m:PManifoldManifold; normal_x:Tdouble; normal_y:Tdouble; 
           normal_z:Tdouble; offset:Tdouble):TManifoldManifoldPair;cdecl;external libmanifoldc;
function manifold_trim_by_plane(mem:pointer; m:PManifoldManifold; normal_x:Tdouble; normal_y:Tdouble; normal_z:Tdouble; 
           offset:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_minkowski_sum(mem:pointer; a:PManifoldManifold; b:PManifoldManifold):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_minkowski_difference(mem:pointer; a:PManifoldManifold; b:PManifoldManifold):PManifoldManifold;cdecl;external libmanifoldc;
{ 3D to 2D }
function manifold_slice(mem:pointer; m:PManifoldManifold; height:Tdouble):PManifoldPolygons;cdecl;external libmanifoldc;
function manifold_project(mem:pointer; m:PManifoldManifold):PManifoldPolygons;cdecl;external libmanifoldc;
{ Convex Hulls }
function manifold_hull(mem:pointer; m:PManifoldManifold):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_batch_hull(mem:pointer; ms:PManifoldManifoldVec):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_hull_pts(mem:pointer; ps:PManifoldVec3; length:Tsize_t):PManifoldManifold;cdecl;external libmanifoldc;
{ Manifold Transformations }
function manifold_translate(mem:pointer; m:PManifoldManifold; x:Tdouble; y:Tdouble; z:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_rotate(mem:pointer; m:PManifoldManifold; x:Tdouble; y:Tdouble; z:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_scale(mem:pointer; m:PManifoldManifold; x:Tdouble; y:Tdouble; z:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_transform(mem:pointer; m:PManifoldManifold; x1:Tdouble; y1:Tdouble; z1:Tdouble; 
           x2:Tdouble; y2:Tdouble; z2:Tdouble; x3:Tdouble; y3:Tdouble; 
           z3:Tdouble; x4:Tdouble; y4:Tdouble; z4:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_mirror(mem:pointer; m:PManifoldManifold; nx:Tdouble; ny:Tdouble; nz:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_warp(mem:pointer; m:PManifoldManifold; fun:function (para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:pointer):TManifoldVec3; ctx:pointer):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_smooth_by_normals(mem:pointer; m:PManifoldManifold; normalIdx:longint):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_smooth_out(mem:pointer; m:PManifoldManifold; minSharpAngle:Tdouble; minSmoothness:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_refine(mem:pointer; m:PManifoldManifold; refine:longint):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_refine_to_length(mem:pointer; m:PManifoldManifold; length:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_refine_to_tolerance(mem:pointer; m:PManifoldManifold; tolerance:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
{ Manifold Shapes / Constructors }
function manifold_empty(mem:pointer):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_copy(mem:pointer; m:PManifoldManifold):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_tetrahedron(mem:pointer):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_cube(mem:pointer; x:Tdouble; y:Tdouble; z:Tdouble; center:longint):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_cylinder(mem:pointer; height:Tdouble; radius_low:Tdouble; radius_high:Tdouble; circular_segments:longint; 
           center:longint):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_sphere(mem:pointer; radius:Tdouble; circular_segments:longint):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_of_meshgl(mem:pointer; mesh:PManifoldMeshGL):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_of_meshgl64(mem:pointer; mesh:PManifoldMeshGL64):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_smooth(mem:pointer; mesh:PManifoldMeshGL; half_edges:Psize_t; smoothness:Pdouble; n_idxs:Tsize_t):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_smooth64(mem:pointer; mesh:PManifoldMeshGL64; half_edges:Psize_t; smoothness:Pdouble; n_idxs:Tsize_t):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_extrude(mem:pointer; cs:PManifoldPolygons; height:Tdouble; slices:longint; twist_degrees:Tdouble; 
           scale_x:Tdouble; scale_y:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_revolve(mem:pointer; cs:PManifoldPolygons; circular_segments:longint; revolve_degrees:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_compose(mem:pointer; ms:PManifoldManifoldVec):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_decompose(mem:pointer; m:PManifoldManifold):PManifoldManifoldVec;cdecl;external libmanifoldc;
function manifold_as_original(mem:pointer; m:PManifoldManifold):PManifoldManifold;cdecl;external libmanifoldc;
{ Manifold Info }
function manifold_is_empty(m:PManifoldManifold):longint;cdecl;external libmanifoldc;
function manifold_status(m:PManifoldManifold):TManifoldError;cdecl;external libmanifoldc;
function manifold_num_vert(m:PManifoldManifold):Tsize_t;cdecl;external libmanifoldc;
function manifold_num_edge(m:PManifoldManifold):Tsize_t;cdecl;external libmanifoldc;
function manifold_num_tri(m:PManifoldManifold):Tsize_t;cdecl;external libmanifoldc;
function manifold_num_prop(m:PManifoldManifold):Tsize_t;cdecl;external libmanifoldc;
function manifold_bounding_box(mem:pointer; m:PManifoldManifold):PManifoldBox;cdecl;external libmanifoldc;
function manifold_epsilon(m:PManifoldManifold):Tdouble;cdecl;external libmanifoldc;
function manifold_genus(m:PManifoldManifold):longint;cdecl;external libmanifoldc;
function manifold_surface_area(m:PManifoldManifold):Tdouble;cdecl;external libmanifoldc;
function manifold_volume(m:PManifoldManifold):Tdouble;cdecl;external libmanifoldc;
function manifold_get_circular_segments(radius:Tdouble):longint;cdecl;external libmanifoldc;
function manifold_original_id(m:PManifoldManifold):longint;cdecl;external libmanifoldc;
function manifold_reserve_ids(n:Tuint32_t):Tuint32_t;cdecl;external libmanifoldc;
function manifold_set_properties(mem:pointer; m:PManifoldManifold; num_prop:longint; fun:procedure (new_prop:Pdouble; position:TManifoldVec3; old_prop:Pdouble; ctx:pointer); ctx:pointer):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_calculate_curvature(mem:pointer; m:PManifoldManifold; gaussian_idx:longint; mean_idx:longint):PManifoldManifold;cdecl;external libmanifoldc;
function manifold_min_gap(m:PManifoldManifold; other:PManifoldManifold; searchLength:Tdouble):Tdouble;cdecl;external libmanifoldc;
function manifold_calculate_normals(mem:pointer; m:PManifoldManifold; normal_idx:longint; min_sharp_angle:Tdouble):PManifoldManifold;cdecl;external libmanifoldc;
{ CrossSection Shapes/Constructors }
function manifold_cross_section_empty(mem:pointer):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_copy(mem:pointer; cs:PManifoldCrossSection):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_of_simple_polygon(mem:pointer; p:PManifoldSimplePolygon; fr:TManifoldFillRule):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_of_polygons(mem:pointer; p:PManifoldPolygons; fr:TManifoldFillRule):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_square(mem:pointer; x:Tdouble; y:Tdouble; center:longint):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_circle(mem:pointer; radius:Tdouble; circular_segments:longint):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_compose(mem:pointer; csv:PManifoldCrossSectionVec):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_decompose(mem:pointer; cs:PManifoldCrossSection):PManifoldCrossSectionVec;cdecl;external libmanifoldc;
{ CrossSection Vectors }
function manifold_cross_section_empty_vec(mem:pointer):PManifoldCrossSectionVec;cdecl;external libmanifoldc;
function manifold_cross_section_vec(mem:pointer; sz:Tsize_t):PManifoldCrossSectionVec;cdecl;external libmanifoldc;
procedure manifold_cross_section_vec_reserve(csv:PManifoldCrossSectionVec; sz:Tsize_t);cdecl;external libmanifoldc;
function manifold_cross_section_vec_length(csv:PManifoldCrossSectionVec):Tsize_t;cdecl;external libmanifoldc;
function manifold_cross_section_vec_get(mem:pointer; csv:PManifoldCrossSectionVec; idx:Tsize_t):PManifoldCrossSection;cdecl;external libmanifoldc;
procedure manifold_cross_section_vec_set(csv:PManifoldCrossSectionVec; idx:Tsize_t; cs:PManifoldCrossSection);cdecl;external libmanifoldc;
procedure manifold_cross_section_vec_push_back(csv:PManifoldCrossSectionVec; cs:PManifoldCrossSection);cdecl;external libmanifoldc;
{ CrossSection Booleans }
function manifold_cross_section_boolean(mem:pointer; a:PManifoldCrossSection; b:PManifoldCrossSection; op:TManifoldOpType):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_batch_boolean(mem:pointer; csv:PManifoldCrossSectionVec; op:TManifoldOpType):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_union(mem:pointer; a:PManifoldCrossSection; b:PManifoldCrossSection):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_difference(mem:pointer; a:PManifoldCrossSection; b:PManifoldCrossSection):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_intersection(mem:pointer; a:PManifoldCrossSection; b:PManifoldCrossSection):PManifoldCrossSection;cdecl;external libmanifoldc;
{ CrossSection Convex Hulls }
function manifold_cross_section_hull(mem:pointer; cs:PManifoldCrossSection):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_batch_hull(mem:pointer; css:PManifoldCrossSectionVec):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_hull_simple_polygon(mem:pointer; ps:PManifoldSimplePolygon):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_hull_polygons(mem:pointer; ps:PManifoldPolygons):PManifoldCrossSection;cdecl;external libmanifoldc;
{ CrossSection Transformation }
function manifold_cross_section_translate(mem:pointer; cs:PManifoldCrossSection; x:Tdouble; y:Tdouble):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_rotate(mem:pointer; cs:PManifoldCrossSection; deg:Tdouble):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_scale(mem:pointer; cs:PManifoldCrossSection; x:Tdouble; y:Tdouble):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_mirror(mem:pointer; cs:PManifoldCrossSection; ax_x:Tdouble; ax_y:Tdouble):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_transform(mem:pointer; cs:PManifoldCrossSection; x1:Tdouble; y1:Tdouble; x2:Tdouble; 
           y2:Tdouble; x3:Tdouble; y3:Tdouble):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_warp(mem:pointer; cs:PManifoldCrossSection; fun:function (para1:Tdouble; para2:Tdouble):TManifoldVec2):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_warp_context(mem:pointer; cs:PManifoldCrossSection; fun:function (para1:Tdouble; para2:Tdouble; para3:pointer):TManifoldVec2; ctx:pointer):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_simplify(mem:pointer; cs:PManifoldCrossSection; epsilon:Tdouble):PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_cross_section_offset(mem:pointer; cs:PManifoldCrossSection; delta:Tdouble; jt:TManifoldJoinType; miter_limit:Tdouble; 
           circular_segments:longint):PManifoldCrossSection;cdecl;external libmanifoldc;
{ CrossSection Info }
function manifold_cross_section_area(cs:PManifoldCrossSection):Tdouble;cdecl;external libmanifoldc;
function manifold_cross_section_num_vert(cs:PManifoldCrossSection):Tsize_t;cdecl;external libmanifoldc;
function manifold_cross_section_num_contour(cs:PManifoldCrossSection):Tsize_t;cdecl;external libmanifoldc;
function manifold_cross_section_is_empty(cs:PManifoldCrossSection):longint;cdecl;external libmanifoldc;
function manifold_cross_section_bounds(mem:pointer; cs:PManifoldCrossSection):PManifoldRect;cdecl;external libmanifoldc;
function manifold_cross_section_to_polygons(mem:pointer; cs:PManifoldCrossSection):PManifoldPolygons;cdecl;external libmanifoldc;
{ Rectangle }
function manifold_rect(mem:pointer; x1:Tdouble; y1:Tdouble; x2:Tdouble; y2:Tdouble):PManifoldRect;cdecl;external libmanifoldc;
function manifold_rect_min(r:PManifoldRect):TManifoldVec2;cdecl;external libmanifoldc;
function manifold_rect_max(r:PManifoldRect):TManifoldVec2;cdecl;external libmanifoldc;
function manifold_rect_dimensions(r:PManifoldRect):TManifoldVec2;cdecl;external libmanifoldc;
function manifold_rect_center(r:PManifoldRect):TManifoldVec2;cdecl;external libmanifoldc;
function manifold_rect_scale(r:PManifoldRect):Tdouble;cdecl;external libmanifoldc;
function manifold_rect_contains_pt(r:PManifoldRect; x:Tdouble; y:Tdouble):longint;cdecl;external libmanifoldc;
function manifold_rect_contains_rect(a:PManifoldRect; b:PManifoldRect):longint;cdecl;external libmanifoldc;
procedure manifold_rect_include_pt(r:PManifoldRect; x:Tdouble; y:Tdouble);cdecl;external libmanifoldc;
function manifold_rect_union(mem:pointer; a:PManifoldRect; b:PManifoldRect):PManifoldRect;cdecl;external libmanifoldc;
function manifold_rect_transform(mem:pointer; r:PManifoldRect; x1:Tdouble; y1:Tdouble; x2:Tdouble; 
           y2:Tdouble; x3:Tdouble; y3:Tdouble):PManifoldRect;cdecl;external libmanifoldc;
function manifold_rect_translate(mem:pointer; r:PManifoldRect; x:Tdouble; y:Tdouble):PManifoldRect;cdecl;external libmanifoldc;
function manifold_rect_mul(mem:pointer; r:PManifoldRect; x:Tdouble; y:Tdouble):PManifoldRect;cdecl;external libmanifoldc;
function manifold_rect_does_overlap_rect(a:PManifoldRect; r:PManifoldRect):longint;cdecl;external libmanifoldc;
function manifold_rect_is_empty(r:PManifoldRect):longint;cdecl;external libmanifoldc;
function manifold_rect_is_finite(r:PManifoldRect):longint;cdecl;external libmanifoldc;
{ Bounding Box }
function manifold_box(mem:pointer; x1:Tdouble; y1:Tdouble; z1:Tdouble; x2:Tdouble; 
           y2:Tdouble; z2:Tdouble):PManifoldBox;cdecl;external libmanifoldc;
function manifold_box_min(b:PManifoldBox):TManifoldVec3;cdecl;external libmanifoldc;
function manifold_box_max(b:PManifoldBox):TManifoldVec3;cdecl;external libmanifoldc;
function manifold_box_dimensions(b:PManifoldBox):TManifoldVec3;cdecl;external libmanifoldc;
function manifold_box_center(b:PManifoldBox):TManifoldVec3;cdecl;external libmanifoldc;
function manifold_box_scale(b:PManifoldBox):Tdouble;cdecl;external libmanifoldc;
function manifold_box_contains_pt(b:PManifoldBox; x:Tdouble; y:Tdouble; z:Tdouble):longint;cdecl;external libmanifoldc;
function manifold_box_contains_box(a:PManifoldBox; b:PManifoldBox):longint;cdecl;external libmanifoldc;
procedure manifold_box_include_pt(b:PManifoldBox; x:Tdouble; y:Tdouble; z:Tdouble);cdecl;external libmanifoldc;
function manifold_box_union(mem:pointer; a:PManifoldBox; b:PManifoldBox):PManifoldBox;cdecl;external libmanifoldc;
function manifold_box_transform(mem:pointer; b:PManifoldBox; x1:Tdouble; y1:Tdouble; z1:Tdouble; 
           x2:Tdouble; y2:Tdouble; z2:Tdouble; x3:Tdouble; y3:Tdouble; 
           z3:Tdouble; x4:Tdouble; y4:Tdouble; z4:Tdouble):PManifoldBox;cdecl;external libmanifoldc;
function manifold_box_translate(mem:pointer; b:PManifoldBox; x:Tdouble; y:Tdouble; z:Tdouble):PManifoldBox;cdecl;external libmanifoldc;
function manifold_box_mul(mem:pointer; b:PManifoldBox; x:Tdouble; y:Tdouble; z:Tdouble):PManifoldBox;cdecl;external libmanifoldc;
function manifold_box_does_overlap_pt(b:PManifoldBox; x:Tdouble; y:Tdouble; z:Tdouble):longint;cdecl;external libmanifoldc;
function manifold_box_does_overlap_box(a:PManifoldBox; b:PManifoldBox):longint;cdecl;external libmanifoldc;
function manifold_box_is_finite(b:PManifoldBox):longint;cdecl;external libmanifoldc;
{ Static Quality Globals }
procedure manifold_set_min_circular_angle(degrees:Tdouble);cdecl;external libmanifoldc;
procedure manifold_set_min_circular_edge_length(length:Tdouble);cdecl;external libmanifoldc;
procedure manifold_set_circular_segments(number:longint);cdecl;external libmanifoldc;
procedure manifold_reset_to_circular_defaults;cdecl;external libmanifoldc;
{ Manifold Mesh Extraction }
function manifold_meshgl_num_prop(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_num_vert(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_num_tri(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_vert_properties_length(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_tri_length(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_merge_length(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_run_index_length(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_run_original_id_length(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_run_transform_length(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_face_id_length(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_tangent_length(m:PManifoldMeshGL):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_vert_properties(mem:pointer; m:PManifoldMeshGL):Psingle;cdecl;external libmanifoldc;
function manifold_meshgl_tri_verts(mem:pointer; m:PManifoldMeshGL):Puint32_t;cdecl;external libmanifoldc;
function manifold_meshgl_merge_from_vert(mem:pointer; m:PManifoldMeshGL):Puint32_t;cdecl;external libmanifoldc;
function manifold_meshgl_merge_to_vert(mem:pointer; m:PManifoldMeshGL):Puint32_t;cdecl;external libmanifoldc;
function manifold_meshgl_run_index(mem:pointer; m:PManifoldMeshGL):Puint32_t;cdecl;external libmanifoldc;
function manifold_meshgl_run_original_id(mem:pointer; m:PManifoldMeshGL):Puint32_t;cdecl;external libmanifoldc;
function manifold_meshgl_run_transform(mem:pointer; m:PManifoldMeshGL):Psingle;cdecl;external libmanifoldc;
function manifold_meshgl_face_id(mem:pointer; m:PManifoldMeshGL):Puint32_t;cdecl;external libmanifoldc;
function manifold_meshgl_halfedge_tangent(mem:pointer; m:PManifoldMeshGL):Psingle;cdecl;external libmanifoldc;
function manifold_meshgl64_num_prop(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_num_vert(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_num_tri(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_vert_properties_length(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_tri_length(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_merge_length(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_run_index_length(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_run_original_id_length(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_run_transform_length(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_face_id_length(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_tangent_length(m:PManifoldMeshGL64):Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_vert_properties(mem:pointer; m:PManifoldMeshGL64):Pdouble;cdecl;external libmanifoldc;
function manifold_meshgl64_tri_verts(mem:pointer; m:PManifoldMeshGL64):Puint64_t;cdecl;external libmanifoldc;
function manifold_meshgl64_merge_from_vert(mem:pointer; m:PManifoldMeshGL64):Puint64_t;cdecl;external libmanifoldc;
function manifold_meshgl64_merge_to_vert(mem:pointer; m:PManifoldMeshGL64):Puint64_t;cdecl;external libmanifoldc;
function manifold_meshgl64_run_index(mem:pointer; m:PManifoldMeshGL64):Puint64_t;cdecl;external libmanifoldc;
function manifold_meshgl64_run_original_id(mem:pointer; m:PManifoldMeshGL64):Puint32_t;cdecl;external libmanifoldc;
function manifold_meshgl64_run_transform(mem:pointer; m:PManifoldMeshGL64):Pdouble;cdecl;external libmanifoldc;
function manifold_meshgl64_face_id(mem:pointer; m:PManifoldMeshGL64):Puint64_t;cdecl;external libmanifoldc;
function manifold_meshgl64_halfedge_tangent(mem:pointer; m:PManifoldMeshGL64):Pdouble;cdecl;external libmanifoldc;
{ Triangulation }
function manifold_triangulate(mem:pointer; ps:PManifoldPolygons; epsilon:Tdouble):PManifoldTriangulation;cdecl;external libmanifoldc;
function manifold_triangulation_num_tri(m:PManifoldTriangulation):Tsize_t;cdecl;external libmanifoldc;
function manifold_triangulation_tri_verts(mem:pointer; m:PManifoldTriangulation):Plongint;cdecl;external libmanifoldc;
{ memory size }
function manifold_manifold_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_manifold_vec_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_cross_section_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_cross_section_vec_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_simple_polygon_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_polygons_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_manifold_pair_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_meshgl64_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_box_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_rect_size:Tsize_t;cdecl;external libmanifoldc;
function manifold_triangulation_size:Tsize_t;cdecl;external libmanifoldc;
{ allocation }
function manifold_alloc_manifold:PManifoldManifold;cdecl;external libmanifoldc;
function manifold_alloc_manifold_vec:PManifoldManifoldVec;cdecl;external libmanifoldc;
function manifold_alloc_cross_section:PManifoldCrossSection;cdecl;external libmanifoldc;
function manifold_alloc_cross_section_vec:PManifoldCrossSectionVec;cdecl;external libmanifoldc;
function manifold_alloc_simple_polygon:PManifoldSimplePolygon;cdecl;external libmanifoldc;
function manifold_alloc_polygons:PManifoldPolygons;cdecl;external libmanifoldc;
function manifold_alloc_meshgl:PManifoldMeshGL;cdecl;external libmanifoldc;
function manifold_alloc_meshgl64:PManifoldMeshGL64;cdecl;external libmanifoldc;
function manifold_alloc_box:PManifoldBox;cdecl;external libmanifoldc;
function manifold_alloc_rect:PManifoldRect;cdecl;external libmanifoldc;
function manifold_alloc_triangulation:PManifoldTriangulation;cdecl;external libmanifoldc;
{ destruction }
procedure manifold_destruct_manifold(m:PManifoldManifold);cdecl;external libmanifoldc;
procedure manifold_destruct_manifold_vec(ms:PManifoldManifoldVec);cdecl;external libmanifoldc;
procedure manifold_destruct_cross_section(m:PManifoldCrossSection);cdecl;external libmanifoldc;
procedure manifold_destruct_cross_section_vec(csv:PManifoldCrossSectionVec);cdecl;external libmanifoldc;
procedure manifold_destruct_simple_polygon(p:PManifoldSimplePolygon);cdecl;external libmanifoldc;
procedure manifold_destruct_polygons(p:PManifoldPolygons);cdecl;external libmanifoldc;
procedure manifold_destruct_meshgl(m:PManifoldMeshGL);cdecl;external libmanifoldc;
procedure manifold_destruct_meshgl64(m:PManifoldMeshGL64);cdecl;external libmanifoldc;
procedure manifold_destruct_box(b:PManifoldBox);cdecl;external libmanifoldc;
procedure manifold_destruct_rect(b:PManifoldRect);cdecl;external libmanifoldc;
procedure manifold_destruct_triangulation(M:PManifoldTriangulation);cdecl;external libmanifoldc;
{ pointer free + destruction }
procedure manifold_delete_manifold(m:PManifoldManifold);cdecl;external libmanifoldc;
procedure manifold_delete_manifold_vec(ms:PManifoldManifoldVec);cdecl;external libmanifoldc;
procedure manifold_delete_cross_section(cs:PManifoldCrossSection);cdecl;external libmanifoldc;
procedure manifold_delete_cross_section_vec(csv:PManifoldCrossSectionVec);cdecl;external libmanifoldc;
procedure manifold_delete_simple_polygon(p:PManifoldSimplePolygon);cdecl;external libmanifoldc;
procedure manifold_delete_polygons(p:PManifoldPolygons);cdecl;external libmanifoldc;
procedure manifold_delete_meshgl(m:PManifoldMeshGL);cdecl;external libmanifoldc;
procedure manifold_delete_meshgl64(m:PManifoldMeshGL64);cdecl;external libmanifoldc;
procedure manifold_delete_box(b:PManifoldBox);cdecl;external libmanifoldc;
procedure manifold_delete_rect(b:PManifoldRect);cdecl;external libmanifoldc;
procedure manifold_delete_triangulation(m:PManifoldTriangulation);cdecl;external libmanifoldc;
{ MeshIO / Export }
{ Import a manifold from a Wavefront obj file. }
{ The obj_file parameter is the content of the obj file, not the filename, }
{ and should be null-terminated. }
function manifold_read_obj(mem:pointer; obj_file:Pchar):PManifoldManifold;cdecl;external libmanifoldc;
{ Import a meshgl from a Wavefront obj file. }
{ The obj_file parameter is the content of the obj file, not the filename, }
{ and should be null-terminated. }
function manifold_meshgl64_read_obj(mem:pointer; obj_file:Pchar):PManifoldMeshGL64;cdecl;external libmanifoldc;
{ Export a manifold to a Wavefront obj file. }
{ The callback accepts two parameters: }
{ 1. Temporary null-terminated string buffer, containing the content of the }
{    file. This buffer will be freed automatically after returning from the }
{    callback. }
{ 2. An arg value (the third parameter in the manifold_write_obj function), for }
{    passing additional data into the callback. }
procedure manifold_write_obj(manifold:PManifoldManifold; callback:procedure (para1:Pchar; para2:pointer); args:pointer);cdecl;external libmanifoldc;
{ Export a MeshGL64 to a Wavefront obj file. }
{ The callback accepts two parameters: }
{ 1. Temporary null-terminated string buffer, containing the content of the }
{    file. This buffer will be freed automatically after returning from the }
{    callback. }
{ 2. An arg value (the third parameter in the manifold_write_obj function), for }
{    passing additional data into the callback. }
procedure manifold_meshgl64_write_obj(mesh:PManifoldMeshGL64; callback:procedure (para1:Pchar; para2:pointer); args:pointer);cdecl;external libmanifoldc;
{ C++ end of extern C conditionnal removed }

// === Konventiert am: 1-3-26 15:50:03 ===


implementation



end.
