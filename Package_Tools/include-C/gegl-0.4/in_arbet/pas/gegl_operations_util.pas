unit gegl_operations_util;

interface

uses
  fp_glib2, fp_gegl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is the public GEGL API
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
 * 2000-2008 © Calvin Williamson, Øyvind Kolås.
  }
{$ifndef __GEGL_OPERATIONS_UTIL_H__}
{$define __GEGL_OPERATIONS_UTIL_H__}
{$if !defined (__GEGL_H_INSIDE__)}
{$error "This file can not be included directly, use <gegl.h> instead."}
{$endif}
{**
 * Available operations:
 * Gegl provides means to check for available processing operations that
 * can be used with nodes using #gegl_list_operations and #gegl_has_operation.
 * For a specified op, you can get a list of properties with
 * #gegl_operation_list_properties.
  }
{*
 * gegl_list_operations:
 * @n_operations_p: (out caller-allocates): return location for number of operations.
 *
 * Return value: (transfer container) (array length=n_operations_p): An
 * alphabetically sorted array of available operation names. This excludes any
 * compat-name registered by operations. The list should be freed with g_free
 * after use.
 * ---
 * gchar **operations;
 * guint   n_operations;
 * gint i;
 *
 * operations = gegl_list_operations (&n_operations);
 * g_print ("Available operations:\n");
 * for (i=0; i < n_operations; i++)
 *   
 *     g_print ("\t%s\n", operations[i]);
 *   
 * g_free (operations);
  }

function gegl_list_operations(n_operations_p:Pguint):^Pgchar;cdecl;external libgegl;
{*
 * gegl_has_operation:
 * @operation_type: the name of the operation
 *
 * Return value: A boolean telling whether the operation is present or not. This
 * also returns true for any compat-name registered by operations.
  }
function gegl_has_operation(operation_type:Pgchar):Tgboolean;cdecl;external libgegl;
{*
 * gegl_operation_list_properties:
 * @operation_type: the name of the operation type we want to query to properties of.
 * @n_properties_p: (out caller-allocates): return location for number of properties.
 *
 * Return value: (transfer container) (array length=n_properties_p): An allocated array of #GParamSpecs describing the properties
 * of the operation available when a node has operation_type set. The list should be freed with g_free after use.
  }
function gegl_operation_list_properties(operation_type:Pgchar; n_properties_p:Pguint):^PGParamSpec;cdecl;external libgegl;
{*
 * gegl_operation_find_property::
 * @operation_type: the name of the operation type we want to locate a property on.
 * @property_name: the name of the property we seek.
 *
 * Return value: (transfer none): The paramspec of the matching property - or
 * NULL if there as no match.
  }
function gegl_operation_find_property(operation_type:Pgchar; property_name:Pgchar):PGParamSpec;cdecl;external libgegl;
{*
 * gegl_operation_get_property_key:
 * @operation_type: the name of the operation type we want to query to property keys for.
 * @property_name: the property to query a key for.
 * @property_key_name: the property mata data key to query
 *
 * Return value: NULL or a string with the meta-data value for the operation
 * key.
  }
function gegl_operation_get_property_key(operation_type:Pgchar; property_name:Pgchar; property_key_name:Pgchar):Pgchar;cdecl;external libgegl;
{*
 * gegl_operation_list_property_keys:
 * @operation_type: the name of the operation type we want to query to property keys for.
 * @property_name: the property to query a key for.
 * @n_keys: (out caller-allocates): return location for number of property
 * keys.
 *
 * Return value: (transfer container) (array length=n_keys): An allocated NULL terminated array of property-key names. The list should be freed with g_free after use.
  }
function gegl_operation_list_property_keys(operation_type:Pgchar; property_name:Pgchar; n_keys:Pguint):^Pgchar;cdecl;external libgegl;
function gegl_param_spec_get_property_key(pspec:PGParamSpec; key_name:Pgchar):Pgchar;cdecl;external libgegl;
procedure gegl_param_spec_set_property_key(pspec:PGParamSpec; key_name:Pgchar; value:Pgchar);cdecl;external libgegl;
{xxxxxxxxx
static inline gdouble
gegl_coordinate_relative_to_pixel (gdouble relative, gdouble pixel_dim)

    return relative * pixel_dim;


static inline gdouble
gegl_coordinate_pixel_to_relative (gdouble pixel, gdouble pixel_dim)

    return pixel / pixel_dim;

 }
function gegl_operation_list_keys(operation_type:Pgchar; n_keys:Pguint):^Pgchar;cdecl;external libgegl;
function gegl_operation_get_key(operation_type:Pgchar; key_name:Pgchar):Pgchar;cdecl;external libgegl;
{$endif}
{ __GEGL_OPERATIONS_UTIL_H__  }

// === Konventiert am: 12-8-26 15:08:35 ===


implementation



end.
