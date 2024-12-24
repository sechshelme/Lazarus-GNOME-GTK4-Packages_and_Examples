

{$include graphene/graphene_macros.inc}      // io.
{$include graphene/graphene_gobject.inc}     // io.
{$include graphene/graphene_types.inc}       // io.
{$include graphene/graphene_version.inc}     // io.
{$include graphene/graphene_vec2.inc}        // io.
{$include graphene/graphene_vec3.inc}        // io.
{$include graphene/graphene_vec4.inc}        // io.
{$include graphene/graphene_point.inc}       // io.
{$include graphene/graphene_size.inc}        // io.
{$include graphene/graphene_rect.inc}        // io. -> graphene_size, graphene_point
{$include graphene/graphene_point3d.inc}     // io. -> graphene_rect
{$include graphene/graphene_euler.inc}       // io.
{$include graphene/graphene_quaternion.inc}  // io. -> graphene_euler
{$include graphene/graphene_plane.inc}       // io. -> graphene_point3d
{$include graphene/graphene_box.inc}         // io. -> graphene_point3d
{$include graphene/graphene_sphere.inc}      // io. -> graphene_point3d
{$include graphene/graphene_triangle.inc}    // io. -> graphene_point3d, graphene_plane
{$include graphene/graphene_ray.inc}         // io. -> graphene_point3d, graphene_plane, graphene_triangle
{$include graphene/graphene_quad.inc}        // io. -> graphene_point, graphene_rect
{$include graphene/graphene_frustum.inc}     // io. -> graphene_plane, graphene_point3d
{$include graphene/graphene_matrix.inc}      // io. -> graphene_point3d, graphene_point, graphene_rect, graphene_quad, graphene_ray, graphene_euler

{$include graphene/graphene_simd4f.inc}      // inline und record Problem
{$include graphene/graphene_simd4x4f.inc}    // inline und record Problem


