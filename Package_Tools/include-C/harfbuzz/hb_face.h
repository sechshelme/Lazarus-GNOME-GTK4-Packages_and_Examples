/*
 * Copyright © 2009  Red Hat, Inc.
 *
 *  This is part of HarfBuzz, a text shaping library.
 *
 * Permission is hereby granted, without written agreement and without
 * license or royalty fees, to use, copy, modify, and distribute this
 * software and its documentation for any purpose, provided that the
 * above copyright notice and the following two paragraphs appear in
 * all copies of this software.
 *
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
 * ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN
 * IF THE COPYRIGHT HOLDER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 * THE COPYRIGHT HOLDER SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE COPYRIGHT HOLDER HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 *
 * Red Hat Author(s): Behdad Esfahbod
 */

#if !defined(HB_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)
#error "Include <hb.h> instead."
#endif

#ifndef HB_FACE_H
#define HB_FACE_H

#include "hb-common.h"
#include "hb-blob.h"
#include "hb-map.h"
#include "hb-set.h"




extern unsigned int
hb_face_count (hb_blob_t *blob);


/*
 * hb_face_t
 */

/**
 * hb_face_t:
 *
 * Data type for holding font faces.
 *
 **/
typedef struct hb_face_t hb_face_t;

extern hb_face_t *
hb_face_create (hb_blob_t    *blob,
		unsigned int  index);

/**
 * hb_reference_table_func_t:
 * @face: an #hb_face_t to reference table for
 * @tag: the tag of the table to reference
 * @user_data: User data pointer passed by the caller
 *
 * Callback function for hb_face_create_for_tables().
 *
 * Return value: (transfer full): A pointer to the @tag table within @face
 *
 * Since: 0.9.2
 */

typedef hb_blob_t * (*hb_reference_table_func_t)  (hb_face_t *face, hb_tag_t tag, void *user_data);

/* calls destroy() when not needing user_data anymore */
extern hb_face_t *
hb_face_create_for_tables (hb_reference_table_func_t  reference_table_func,
			   void                      *user_data,
			   hb_destroy_func_t          destroy);

extern hb_face_t *
hb_face_get_empty (void);

extern hb_face_t *
hb_face_reference (hb_face_t *face);

extern void
hb_face_destroy (hb_face_t *face);

extern hb_bool_t
hb_face_set_user_data (hb_face_t          *face,
		       hb_user_data_key_t *key,
		       void *              data,
		       hb_destroy_func_t   destroy,
		       hb_bool_t           replace);

extern void *
hb_face_get_user_data (const hb_face_t    *face,
		       hb_user_data_key_t *key);

extern void
hb_face_make_immutable (hb_face_t *face);

extern hb_bool_t
hb_face_is_immutable (const hb_face_t *face);


extern hb_blob_t *
hb_face_reference_table (const hb_face_t *face,
			 hb_tag_t tag);

extern hb_blob_t *
hb_face_reference_blob (hb_face_t *face);

extern void
hb_face_set_index (hb_face_t    *face,
		   unsigned int  index);

extern unsigned int
hb_face_get_index (const hb_face_t *face);

extern void
hb_face_set_upem (hb_face_t    *face,
		  unsigned int  upem);

extern unsigned int
hb_face_get_upem (const hb_face_t *face);

extern void
hb_face_set_glyph_count (hb_face_t    *face,
			 unsigned int  glyph_count);

extern unsigned int
hb_face_get_glyph_count (const hb_face_t *face);

extern unsigned int
hb_face_get_table_tags (const hb_face_t *face,
			unsigned int  start_offset,
			unsigned int *table_count, /* IN/OUT */
			hb_tag_t     *table_tags /* OUT */);


/*
 * Character set.
 */

extern void
hb_face_collect_unicodes (hb_face_t *face,
			  hb_set_t  *out);

extern void
hb_face_collect_nominal_glyph_mapping (hb_face_t *face,
				       hb_map_t  *mapping,
				       hb_set_t  *unicodes);

extern void
hb_face_collect_variation_selectors (hb_face_t *face,
				     hb_set_t  *out);

extern void
hb_face_collect_variation_unicodes (hb_face_t *face,
				    hb_codepoint_t variation_selector,
				    hb_set_t  *out);


/*
 * Builder face.
 */

extern hb_face_t *
hb_face_builder_create (void);

extern hb_bool_t
hb_face_builder_add_table (hb_face_t *face,
			   hb_tag_t   tag,
			   hb_blob_t *blob);

extern void
hb_face_builder_sort_tables (hb_face_t *face,
                             const hb_tag_t  *tags);




#endif /* HB_FACE_H */
