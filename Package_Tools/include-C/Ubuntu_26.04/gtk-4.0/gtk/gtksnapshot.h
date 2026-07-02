/* GTK - The GIMP Toolkit
 * Copyright (C) 2016 Benjamin Otte <otte@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
 */

#pragma once


#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gsk/gsk.h>

#include <gtk/gtktypes.h>



typedef struct _GtkSnapshotClass       GtkSnapshotClass;

#define GTK_TYPE_SNAPSHOT               (gtk_snapshot_get_type ())

#define GTK_SNAPSHOT(obj)               (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_SNAPSHOT, GtkSnapshot))
#define GTK_IS_SNAPSHOT(obj)            (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_SNAPSHOT))

////G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GtkSnapshot, g_object_unref)



extern
GType           gtk_snapshot_get_type                   (void) ;

extern
GtkSnapshot *   gtk_snapshot_new                        (void);
extern
GskRenderNode * gtk_snapshot_free_to_node               (GtkSnapshot            *snapshot);
extern
GdkPaintable *  gtk_snapshot_free_to_paintable          (GtkSnapshot            *snapshot,
                                                         const graphene_size_t  *size);

extern
GskRenderNode * gtk_snapshot_to_node                    (GtkSnapshot            *snapshot);
extern
GdkPaintable *  gtk_snapshot_to_paintable               (GtkSnapshot            *snapshot,
                                                         const graphene_size_t  *size);

extern
void            gtk_snapshot_push_debug                 (GtkSnapshot            *snapshot,
                                                         const char             *message,
                                                         ...) ;// (2, 3);
extern
void            gtk_snapshot_push_opacity               (GtkSnapshot            *snapshot,
                                                         double                  opacity);
extern
void            gtk_snapshot_push_isolation             (GtkSnapshot            *snapshot,
                                                         GskIsolation            features);
extern
void            gtk_snapshot_push_blur                  (GtkSnapshot            *snapshot,
                                                         double                  radius);
extern
void            gtk_snapshot_push_color_matrix          (GtkSnapshot            *snapshot,
                                                         const graphene_matrix_t*color_matrix,
                                                         const graphene_vec4_t  *color_offset);

extern
void            gtk_snapshot_push_component_transfer   (GtkSnapshot                *snapshot,
                                                        const GskComponentTransfer *red,
                                                        const GskComponentTransfer *green,
                                                        const GskComponentTransfer *blue,
                                                        const GskComponentTransfer *alpha);

extern
void            gtk_snapshot_push_repeat                (GtkSnapshot            *snapshot,
                                                         const graphene_rect_t  *bounds,
                                                         const graphene_rect_t  *child_bounds);
extern
void            gtk_snapshot_push_clip                  (GtkSnapshot            *snapshot,
                                                         const graphene_rect_t  *bounds);
extern
void            gtk_snapshot_push_rounded_clip          (GtkSnapshot            *snapshot,
                                                         const GskRoundedRect   *bounds);
extern
void            gtk_snapshot_push_fill                  (GtkSnapshot            *snapshot,
                                                         GskPath                *path,
                                                         GskFillRule             fill_rule);
extern
void            gtk_snapshot_push_stroke                (GtkSnapshot            *snapshot,
                                                         GskPath                *path,
                                                         const GskStroke        *stroke);
extern
void            gtk_snapshot_push_shadow                (GtkSnapshot            *snapshot,
                                                         const GskShadow        *shadow,
                                                         gsize                   n_shadows);
extern
void            gtk_snapshot_push_blend                 (GtkSnapshot            *snapshot,
                                                         GskBlendMode            blend_mode);
extern
void            gtk_snapshot_push_mask                  (GtkSnapshot            *snapshot,
                                                         GskMaskMode             mask_mode);
extern
void            gtk_snapshot_push_copy                  (GtkSnapshot            *snapshot);
extern
void            gtk_snapshot_push_composite             (GtkSnapshot            *snapshot,
                                                         GskPorterDuff           op);


extern
void            gtk_snapshot_push_cross_fade            (GtkSnapshot            *snapshot,
                                                         double                  progress);


extern //xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea)
void            gtk_snapshot_push_gl_shader             (GtkSnapshot            *snapshot,
                                                         GskGLShader            *shader,
                                                         const graphene_rect_t  *bounds,
                                                         GBytes                 *take_args);
extern //xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea)
void           gtk_snapshot_gl_shader_pop_texture       (GtkSnapshot            *snapshot);

extern
void            gtk_snapshot_pop                        (GtkSnapshot            *snapshot);
extern
void            gtk_snapshot_save                       (GtkSnapshot            *snapshot);
extern
void            gtk_snapshot_restore                    (GtkSnapshot            *snapshot);
extern
void            gtk_snapshot_transform                  (GtkSnapshot            *snapshot,
                                                         GskTransform           *transform);
extern
void            gtk_snapshot_transform_matrix           (GtkSnapshot            *snapshot,
                                                         const graphene_matrix_t*matrix);
extern
void            gtk_snapshot_translate                  (GtkSnapshot            *snapshot,
                                                         const graphene_point_t *point);
extern
void            gtk_snapshot_translate_3d               (GtkSnapshot            *snapshot,
                                                         const graphene_point3d_t*point);
extern
void            gtk_snapshot_rotate                     (GtkSnapshot            *snapshot,
                                                         float                  angle);
extern
void            gtk_snapshot_rotate_3d                  (GtkSnapshot            *snapshot,
                                                         float                   angle,
                                                         const graphene_vec3_t  *axis);
extern
void            gtk_snapshot_scale                      (GtkSnapshot            *snapshot,
                                                         float                   factor_x,
                                                         float                   factor_y);
extern
void            gtk_snapshot_scale_3d                   (GtkSnapshot            *snapshot,
                                                         float                   factor_x,
                                                         float                   factor_y,
                                                         float                   factor_z);
extern
void            gtk_snapshot_perspective                (GtkSnapshot            *snapshot,
                                                         float                   depth);
extern
void            gtk_snapshot_append_node                (GtkSnapshot            *snapshot,
                                                         GskRenderNode          *node);
extern
cairo_t *       gtk_snapshot_append_cairo               (GtkSnapshot            *snapshot,
                                                         const graphene_rect_t  *bounds);
extern
void            gtk_snapshot_append_texture             (GtkSnapshot            *snapshot,
                                                         GdkTexture             *texture,
                                                         const graphene_rect_t  *bounds);
extern
void            gtk_snapshot_append_scaled_texture      (GtkSnapshot            *snapshot,
                                                         GdkTexture             *texture,
                                                         GskScalingFilter        filter,
                                                         const graphene_rect_t  *bounds);
extern
void            gtk_snapshot_append_color               (GtkSnapshot            *snapshot,
                                                         const GdkRGBA          *color,
                                                         const graphene_rect_t  *bounds);
extern
void            gtk_snapshot_append_linear_gradient     (GtkSnapshot            *snapshot,
                                                         const graphene_rect_t  *bounds,
                                                         const graphene_point_t *start_point,
                                                         const graphene_point_t *end_point,
                                                         const GskColorStop     *stops,
                                                         gsize                   n_stops);
extern
void            gtk_snapshot_append_repeating_linear_gradient (GtkSnapshot            *snapshot,
                                                               const graphene_rect_t  *bounds,
                                                               const graphene_point_t *start_point,
                                                               const graphene_point_t *end_point,
                                                               const GskColorStop     *stops,
                                                               gsize                   n_stops);
extern
void            gtk_snapshot_append_radial_gradient     (GtkSnapshot            *snapshot,
                                                         const graphene_rect_t  *bounds,
                                                         const graphene_point_t *center,
                                                         float                   hradius,
                                                         float                   vradius,
                                                         float                   start,
                                                         float                   end,
                                                         const GskColorStop     *stops,
                                                         gsize                   n_stops);
extern
void            gtk_snapshot_append_repeating_radial_gradient (GtkSnapshot            *snapshot,
                                                               const graphene_rect_t  *bounds,
                                                               const graphene_point_t *center,
                                                               float                   hradius,
                                                               float                   vradius,
                                                               float                   start,
                                                               float                   end,
                                                               const GskColorStop     *stops,
                                                               gsize                   n_stops);
extern
void            gtk_snapshot_append_conic_gradient      (GtkSnapshot            *snapshot,
                                                         const graphene_rect_t  *bounds,
                                                         const graphene_point_t *center,
                                                         float                   rotation,
                                                         const GskColorStop     *stops,
                                                         gsize                   n_stops);
extern
void            gtk_snapshot_append_border              (GtkSnapshot            *snapshot,
                                                         const GskRoundedRect   *outline,
                                                         const float             border_width[4],
                                                         const GdkRGBA           border_color[4]);
extern
void            gtk_snapshot_append_inset_shadow        (GtkSnapshot            *snapshot,
                                                         const GskRoundedRect   *outline,
                                                         const GdkRGBA          *color,
                                                         float                   dx,
                                                         float                   dy,
                                                         float                   spread,
                                                         float                   blur_radius);
extern
void            gtk_snapshot_append_outset_shadow       (GtkSnapshot            *snapshot,
                                                         const GskRoundedRect   *outline,
                                                         const GdkRGBA          *color,
                                                         float                   dx,
                                                         float                   dy,
                                                         float                   spread,
                                                         float                   blur_radius);
/* next function implemented in gskpango.c */
extern
void            gtk_snapshot_append_layout              (GtkSnapshot            *snapshot,
                                                         PangoLayout            *layout,
                                                         const GdkRGBA          *color);

extern
void            gtk_snapshot_append_fill                (GtkSnapshot            *snapshot,
                                                         GskPath                *path,
                                                         GskFillRule             fill_rule,
                                                         const GdkRGBA          *color);
extern
void            gtk_snapshot_append_stroke              (GtkSnapshot            *snapshot,
                                                         GskPath                *path,
                                                         const GskStroke        *stroke,
                                                         const GdkRGBA          *color);
extern
void            gtk_snapshot_append_paste               (GtkSnapshot            *snapshot,
                                                         const graphene_rect_t  *bounds,
                                                         gsize                   nth);



