/* This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2009 Øyvind Kolås
 */

#ifndef __GEGL_LOOKUP_H__
#define __GEGL_LOOKUP_H__



#ifndef __cplusplus

typedef     gfloat (* GeglLookupFunction) (gfloat   value,
                                           gpointer data);

#define GEGL_LOOKUP_MAX_ENTRIES   (819200)

typedef struct GeglLookup
{
  GeglLookupFunction function;
  gpointer           data;
  gint               shift;
  guint32            positive_min, positive_max, negative_min, negative_max;
  guint32            bitmask[GEGL_LOOKUP_MAX_ENTRIES/32];
  gfloat             table[];
} GeglLookup;


/**
 * gegl_lookup_new_full: (skip)
 * @function: The function to build a lookup for
 * @data: A user data pointer passed to lookup calls
 * @start: Lower bound of the lookup
 * @end: Upper bound of the lookup
 * @precision: The precision of the lookup table
 *
 * Return value: a #GeglLookup
 */
GeglLookup *gegl_lookup_new_full  (GeglLookupFunction  function,
                                   gpointer            data,
                                   gfloat              start,
                                   gfloat              end,
                                   gfloat              precision);
/**
 * gegl_lookup_new: (skip)
 * @function: The function to build a lookup for
 * @data: A user data pointer passed to lookup calls
 *
 * Return value: a #GeglLookup
 */
GeglLookup *gegl_lookup_new       (GeglLookupFunction  function,
                                   gpointer            data);

/**
 * gegl_lookup_free: (skip)
 * @lookup: #GeglLookup to free
 */
void        gegl_lookup_free      (GeglLookup         *lookup);



#endif /* __cplusplus */



#endif
