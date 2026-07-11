unit gstvalue;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2003> David A. Schleef <ds@schleef.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_VALUE_H__}
{$define __GST_VALUE_H__}
{$include <gst/gstconfig.h>}
{$include <gst/gstcaps.h>}
{$include <gst/gststructure.h>}
{$include <gst/gstcapsfeatures.h>}
{*
 * GST_MAKE_FOURCC:
 * @a: the first character
 * @b: the second character
 * @c: the third character
 * @d: the fourth character
 *
 * Transform four characters into a #guint32 fourcc value with host
 * endianness.
 *
 * |[
 * guint32 fourcc = GST_MAKE_FOURCC ('M', 'J', 'P', 'G');
 * ]|
 *
  }
  var
    _gst_int_range_type : TGType;cvar;external libgstreamer;
{*
 * GstIntRange:
 *
 * A fundamental type that describes a #gint range
  }
{*
 * GST_TYPE_INT_RANGE:
 *
 * a #GValue type that represents an integer range
 *
 * Returns: the #GType of GstIntRange
  }
    _gst_int64_range_type : TGType;cvar;external libgstreamer;
{*
 * GstInt64Range:
 *
 * A fundamental type that describes a #gint64 range
  }
{*
 * GST_TYPE_INT64_RANGE:
 *
 * a #GValue type that represents an #gint64 range
 *
 * Returns: the #GType of GstInt64Range
  }
    _gst_double_range_type : TGType;cvar;external libgstreamer;
{*
 * GstDoubleRange:
 *
 * A fundamental type that describes a #gdouble range
  }
{*
 * GST_TYPE_DOUBLE_RANGE:
 *
 * a #GValue type that represents a floating point range with double precision
 *
 * Returns: the #GType of GstIntRange
  }
    _gst_fraction_range_type : TGType;cvar;external libgstreamer;
{*
 * GstFractionRange:
 *
 * A fundamental type that describes a #GstFractionRange range
  }
{*
 * GST_TYPE_FRACTION_RANGE:
 *
 * a #GValue type that represents a GstFraction range
 *
 * Returns: the #GType of GstFractionRange
  }
    _gst_value_list_type : TGType;cvar;external libgstreamer;
{*
 * GstValueList:
 *
 * A fundamental type that describes an unordered list of #GValue
  }
{*
 * GST_TYPE_LIST:
 *
 * a #GValue type that represents an unordered list of #GValue values. This
 * is used for example to express a list of possible values for a field in
 * a caps structure, like a list of possible sample rates, of which only one
 * will be chosen in the end. This means that all values in the list are
 * meaningful on their own.
 *
 * Returns: the #GType of GstValueList (which is not explicitly typed)
  }
    _gst_value_unique_list_type : TGType;cvar;external libgstreamer;
{*
 * GstValueUniqueList:
 *
 * A fundamental type that describes a set of #GValue
 *
 * Since: 1.28
  }
{*
 * GST_TYPE_UNIQUE_LIST:
 *
 * a #GValue type that represents a set of #GValue values.
 *
 * Returns: the #GType of GstValueUniqueList
 *
 * Since: 1.28
  }
    _gst_value_array_type : TGType;cvar;external libgstreamer;
{*
 * GstValueArray:
 *
 * A fundamental type that describes an ordered list of #GValue
  }
{*
 * GST_TYPE_ARRAY:
 *
 * a #GValue type that represents an ordered list of #GValue values. This is
 * used to express a set of values that is meaningful only in their specific
 * combination and order of values. Each value on its own is not particularly
 * meaningful, only the ordered array in its entirety is meaningful. This is
 * used for example to express channel layouts for multichannel audio where
 * each channel needs to be mapped to a position in the room.
 *
 * Returns: the #GType of GstArrayList (which is not explicitly typed)
  }
    _gst_fraction_type : TGType;cvar;external libgstreamer;
{*
 * GstFraction:
 *
 * A fundamental type that describes a fraction of an integer numerator
 * over an integer denominator
  }
{*
 * GST_TYPE_FRACTION:
 *
 * a #GValue type that represents a fraction of an integer numerator over
 * an integer denominator
 *
 * Returns: the #GType of GstFraction (which is not explicitly typed)
  }
    _gst_bitmask_type : TGType;cvar;external libgstreamer;
{*
 * GstBitmask:
 *
 * A fundamental type that describes a 64-bit bitmask
  }
{*
 * GST_TYPE_BITMASK:
 *
 * a #GValue type that represents a 64-bit bitmask.
 *
 * Returns: the #GType of GstBitmask (which is not explicitly typed)
  }
    _gst_flagset_type : TGType;cvar;external libgstreamer;
{*
 * GstFlagSet:
 *
 * A fundamental type that describes a 32-bit flag bitfield, with 32-bit
 * mask indicating which of the bits in the field are explicitly set.
  }
{*
 * GST_TYPE_FLAG_SET:
 *
 * a #GValue type that represents a 32-bit flag bitfield, with 32-bit
 * mask indicating which of the bits in the field are explicitly set.
 * Useful for negotiation.
 *
 * Returns: the #GType of GstFlags (which is not explicitly typed)
 *
 * Since: 1.6
  }
{*
 * GST_TYPE_G_THREAD:
 *
 * a boxed #GValue type for #GThread that represents a thread.
 *
 * Returns: the #GType of GstGThread
  }
{*
 * GST_VALUE_LESS_THAN:
 *
 * Indicates that the first value provided to a comparison function
 * (gst_value_compare()) is lesser than the second one.
  }

const
  GST_VALUE_LESS_THAN = -(1);  
{*
 * GST_VALUE_EQUAL:
 *
 * Indicates that the first value provided to a comparison function
 * (gst_value_compare()) is equal to the second one.
  }
  GST_VALUE_EQUAL = 0;  
{*
 * GST_VALUE_GREATER_THAN:
 *
 * Indicates that the first value provided to a comparison function
 * (gst_value_compare()) is greater than the second one.
  }
  GST_VALUE_GREATER_THAN = 1;  
{*
 * GST_VALUE_UNORDERED:
 *
 * Indicates that the comparison function (gst_value_compare()) can not
 * determine a order for the two provided values.
  }
  GST_VALUE_UNORDERED = 2;  
{*
 * GstValueCompareFunc:
 * @value1: first value for comparison
 * @value2: second value for comparison
 *
 * Used together with gst_value_compare() to compare #GValue items.
 *
 * Returns: one of GST_VALUE_LESS_THAN, GST_VALUE_EQUAL, GST_VALUE_GREATER_THAN
 * or GST_VALUE_UNORDERED
  }
type

  TGstValueCompareFunc = function (value1:PGValue; value2:PGValue):Tgint;cdecl;
{*
 * GstValueSerializeFunc:
 * @value1: a #GValue
 *
 * Used by gst_value_serialize() to obtain a non-binary form of the #GValue.
 *
 * Free-function: g_free
 *
 * Returns: (transfer full): the string representation of the value
  }

  PGstValueSerializeFunc = ^TGstValueSerializeFunc;
  TGstValueSerializeFunc = function (value1:PGValue):Pgchar;cdecl;
{*
 * GstValueDeserializeFunc:
 * @dest: a #GValue
 * @s: a string
 *
 * Used by gst_value_deserialize() to parse a non-binary form into the #GValue.
 *
 * Returns: %TRUE for success
  }

  TGstValueDeserializeFunc = function (dest:PGValue; s:Pgchar):Tgboolean;cdecl;
{*
 * GstValueDeserializeWithPSpecFunc:
 * @dest: a #GValue
 * @s: a string
 * @pspec: a #GParamSpec describing the expected value
 *
 * Used by gst_value_deserialize_with_pspec() to parse a non-binary form into the #GValue.
 *
 * Returns: %TRUE for success
 * Since: 1.20
  }

  TGstValueDeserializeWithPSpecFunc = function (dest:PGValue; s:Pgchar; pspec:PGParamSpec):Tgboolean;cdecl;
{*
 * GstValueHashFunc:
 * @value: a #GValue
 * @res: (out): a location to store the hash value
 *
 * Used by gst_value_hash() to calculate a hash of @value.
 *
 * Returns: %TRUE, or %FALSE if @value cannot be hashed.
 *
 * Since: 1.28
  }

  TGstValueHashFunc = function (value:PGValue; res:Pguint):Tgboolean;cdecl;
{*
 * GstValueTable:
 * @type: a #GType
 * @compare: a #GstValueCompareFunc
 * @serialize: a #GstValueSerializeFunc
 * @deserialize: a #GstValueDeserializeFunc
 * @deserialize_with_pspec: a #GstValueDeserializeWithPSpecFunc
 *
 * VTable for the #GValue @type.
  }
{*
   * GstValueTable.deserialize_with_pspec:
   *
   * a #GstValueDeserializeWithPSpecFunc
   *
   * Since: 1.20
    }
{*
   * GstValueTable.hash:
   *
   * a #GstValueHashFunc
   *
   * Since: 1.28
    }
{< private > }
  PGstValueTable = ^TGstValueTable;
  TGstValueTable = record
      _type : TGType;cdecl;
      compare : TGstValueCompareFunc;
      serialize : TGstValueSerializeFunc;
      deserialize : TGstValueDeserializeFunc;
      deserialize_with_pspec : TGstValueDeserializeWithPSpecFunc;
      hash : TGstValueHashFunc;
      _gst_reserved : array[0..(GST_PADDING-2)-1] of Tgpointer;
    end;


function gst_int_range_get_type:TGType;cdecl;external libgstreamer;
function gst_int64_range_get_type:TGType;cdecl;external libgstreamer;
function gst_double_range_get_type:TGType;cdecl;external libgstreamer;
function gst_fraction_range_get_type:TGType;cdecl;external libgstreamer;
function gst_fraction_get_type:TGType;cdecl;external libgstreamer;
function gst_value_list_get_type:TGType;cdecl;external libgstreamer;
function gst_value_array_get_type:TGType;cdecl;external libgstreamer;
function gst_value_unique_list_get_type:TGType;cdecl;external libgstreamer;
function gst_bitmask_get_type:TGType;cdecl;external libgstreamer;
function gst_flagset_get_type:TGType;cdecl;external libgstreamer;
{ Hide this compatibility type from introspection  }
{$ifndef __GI_SCANNER__}

function gst_g_thread_get_type:TGType;cdecl;external libgstreamer;
{$endif}

procedure gst_value_register(table:PGstValueTable);cdecl;external libgstreamer;
procedure gst_value_init_and_copy(dest:PGValue; src:PGValue);cdecl;external libgstreamer;
function gst_value_serialize(value:PGValue):Pgchar;cdecl;external libgstreamer;
function gst_value_deserialize(dest:PGValue; src:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_value_deserialize_with_pspec(dest:PGValue; src:Pgchar; pspec:PGParamSpec):Tgboolean;cdecl;external libgstreamer;
function gst_value_hash(value:PGValue; res:Pguint):Tgboolean;cdecl;external libgstreamer;
{ list  }
procedure gst_value_list_append_value(value:PGValue; append_value:PGValue);cdecl;external libgstreamer;
procedure gst_value_list_append_and_take_value(value:PGValue; append_value:PGValue);cdecl;external libgstreamer;
procedure gst_value_list_prepend_value(value:PGValue; prepend_value:PGValue);cdecl;external libgstreamer;
procedure gst_value_list_concat(dest:PGValue; value1:PGValue; value2:PGValue);cdecl;external libgstreamer;
procedure gst_value_list_merge(dest:PGValue; value1:PGValue; value2:PGValue);cdecl;external libgstreamer;
function gst_value_list_get_size(value:PGValue):Tguint;cdecl;external libgstreamer;
function gst_value_list_get_value(value:PGValue; index:Tguint):PGValue;cdecl;external libgstreamer;
function gst_value_list_init(value:PGValue; prealloc:Tguint):PGValue;cdecl;external libgstreamer;
{ array  }
procedure gst_value_array_append_value(value:PGValue; append_value:PGValue);cdecl;external libgstreamer;
procedure gst_value_array_append_and_take_value(value:PGValue; append_value:PGValue);cdecl;external libgstreamer;
procedure gst_value_array_prepend_value(value:PGValue; prepend_value:PGValue);cdecl;external libgstreamer;
function gst_value_array_get_size(value:PGValue):Tguint;cdecl;external libgstreamer;
function gst_value_array_get_value(value:PGValue; index:Tguint):PGValue;cdecl;external libgstreamer;
function gst_value_array_init(value:PGValue; prealloc:Tguint):PGValue;cdecl;external libgstreamer;
{ unique list  }
procedure gst_value_unique_list_append_value(value:PGValue; append_value:PGValue);cdecl;external libgstreamer;
procedure gst_value_unique_list_append_and_take_value(value:PGValue; append_value:PGValue);cdecl;external libgstreamer;
procedure gst_value_unique_list_prepend_value(value:PGValue; prepend_value:PGValue);cdecl;external libgstreamer;
procedure gst_value_unique_list_concat(dest:PGValue; value1:PGValue; value2:PGValue);cdecl;external libgstreamer;
function gst_value_unique_list_get_size(value:PGValue):Tguint;cdecl;external libgstreamer;
function gst_value_unique_list_get_value(value:PGValue; index:Tguint):PGValue;cdecl;external libgstreamer;
{ int range  }
procedure gst_value_set_int_range(value:PGValue; start:Tgint; end:Tgint);cdecl;external libgstreamer;
procedure gst_value_set_int_range_step(value:PGValue; start:Tgint; end:Tgint; step:Tgint);cdecl;external libgstreamer;
function gst_value_get_int_range_min(value:PGValue):Tgint;cdecl;external libgstreamer;
function gst_value_get_int_range_max(value:PGValue):Tgint;cdecl;external libgstreamer;
function gst_value_get_int_range_step(value:PGValue):Tgint;cdecl;external libgstreamer;
{ int64 range  }
procedure gst_value_set_int64_range(value:PGValue; start:Tgint64; end:Tgint64);cdecl;external libgstreamer;
procedure gst_value_set_int64_range_step(value:PGValue; start:Tgint64; end:Tgint64; step:Tgint64);cdecl;external libgstreamer;
function gst_value_get_int64_range_min(value:PGValue):Tgint64;cdecl;external libgstreamer;
function gst_value_get_int64_range_max(value:PGValue):Tgint64;cdecl;external libgstreamer;
function gst_value_get_int64_range_step(value:PGValue):Tgint64;cdecl;external libgstreamer;
{ double range  }
procedure gst_value_set_double_range(value:PGValue; start:Tgdouble; end:Tgdouble);cdecl;external libgstreamer;
function gst_value_get_double_range_min(value:PGValue):Tgdouble;cdecl;external libgstreamer;
function gst_value_get_double_range_max(value:PGValue):Tgdouble;cdecl;external libgstreamer;
{ caps  }
function gst_value_get_caps(value:PGValue):PGstCaps;cdecl;external libgstreamer;
procedure gst_value_set_caps(value:PGValue; caps:PGstCaps);cdecl;external libgstreamer;
{ structure  }
function gst_value_get_structure(value:PGValue):PGstStructure;cdecl;external libgstreamer;
procedure gst_value_set_structure(value:PGValue; structure:PGstStructure);cdecl;external libgstreamer;
{ caps features  }
function gst_value_get_caps_features(value:PGValue):PGstCapsFeatures;cdecl;external libgstreamer;
procedure gst_value_set_caps_features(value:PGValue; features:PGstCapsFeatures);cdecl;external libgstreamer;
{ fraction  }
procedure gst_value_set_fraction(value:PGValue; numerator:Tgint; denominator:Tgint);cdecl;external libgstreamer;
function gst_value_get_fraction_numerator(value:PGValue):Tgint;cdecl;external libgstreamer;
function gst_value_get_fraction_denominator(value:PGValue):Tgint;cdecl;external libgstreamer;
function gst_value_fraction_multiply(product:PGValue; factor1:PGValue; factor2:PGValue):Tgboolean;cdecl;external libgstreamer;
function gst_value_fraction_subtract(dest:PGValue; minuend:PGValue; subtrahend:PGValue):Tgboolean;cdecl;external libgstreamer;
{ fraction range  }
procedure gst_value_set_fraction_range(value:PGValue; start:PGValue; end:PGValue);cdecl;external libgstreamer;
procedure gst_value_set_fraction_range_full(value:PGValue; numerator_start:Tgint; denominator_start:Tgint; numerator_end:Tgint; denominator_end:Tgint);cdecl;external libgstreamer;
function gst_value_get_fraction_range_min(value:PGValue):PGValue;cdecl;external libgstreamer;
function gst_value_get_fraction_range_max(value:PGValue):PGValue;cdecl;external libgstreamer;
{ bitmask  }
function gst_value_get_bitmask(value:PGValue):Tguint64;cdecl;external libgstreamer;
procedure gst_value_set_bitmask(value:PGValue; bitmask:Tguint64);cdecl;external libgstreamer;
{ flagset  }
procedure gst_value_set_flagset(value:PGValue; flags:Tguint; mask:Tguint);cdecl;external libgstreamer;
function gst_value_get_flagset_flags(value:PGValue):Tguint;cdecl;external libgstreamer;
function gst_value_get_flagset_mask(value:PGValue):Tguint;cdecl;external libgstreamer;
{ compare  }
function gst_value_compare(value1:PGValue; value2:PGValue):Tgint;cdecl;external libgstreamer;
function gst_value_can_compare(value1:PGValue; value2:PGValue):Tgboolean;cdecl;external libgstreamer;
function gst_value_is_subset(value1:PGValue; value2:PGValue):Tgboolean;cdecl;external libgstreamer;
{ union  }
function gst_value_union(dest:PGValue; value1:PGValue; value2:PGValue):Tgboolean;cdecl;external libgstreamer;
function gst_value_can_union(value1:PGValue; value2:PGValue):Tgboolean;cdecl;external libgstreamer;
{ intersection  }
function gst_value_intersect(dest:PGValue; value1:PGValue; value2:PGValue):Tgboolean;cdecl;external libgstreamer;
function gst_value_can_intersect(value1:PGValue; value2:PGValue):Tgboolean;cdecl;external libgstreamer;
{ subtraction  }
function gst_value_subtract(dest:PGValue; minuend:PGValue; subtrahend:PGValue):Tgboolean;cdecl;external libgstreamer;
function gst_value_can_subtract(minuend:PGValue; subtrahend:PGValue):Tgboolean;cdecl;external libgstreamer;
{ fixation  }
function gst_value_is_fixed(value:PGValue):Tgboolean;cdecl;external libgstreamer;
function gst_value_fixate(dest:PGValue; src:PGValue):Tgboolean;cdecl;external libgstreamer;
{ Flagset registration wrapper  }
function gst_flagset_register(flags_type:TGType):TGType;cdecl;external libgstreamer;
{$endif}

// === Konventiert am: 11-7-26 15:53:56 ===


implementation



end.
