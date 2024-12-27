

{$include harfbuzz/hb_common.inc}             // io.
{$include harfbuzz/hb_version.inc}            // io.
{$include harfbuzz/hb_unicode.inc}            // io.
{$include harfbuzz/hb_blob.inc}               // io.
{$include harfbuzz/hb_draw.inc}               // io.
{$include harfbuzz/hb_paint.inc}              // io. -> hb_blob
{$include harfbuzz/hb_set.inc}                // io.
{$include harfbuzz/hb_map.inc}                // io. -> hb_set
{$include harfbuzz/hb_face.inc}               // io. -> hb_blob, hb_set, hb_map
{$include harfbuzz/hb_font.inc}               // io. -> hb_draw, hb_paint, hb_face
{$include harfbuzz/hb_buffer.inc}             // io. -> hb_font, hb_unicode
{$include harfbuzz/hb_shape_.inc}             // io. -> hb_buffer
{$include harfbuzz/hb_ot_name.inc}            // io.
{$include harfbuzz/hb_aat_layout.inc}         // io. -> hb_ot_name
{$include harfbuzz/hb_ot_layout.inc}          // io. -> hb_set, hb_map, hb_ot_name, hb_font
{$include harfbuzz/hb_ot_math.inc}            // io.
{$include harfbuzz/hb_ot_metrics.inc}         // io.
{$include harfbuzz/hb_ft.inc}                 // io.
{$include harfbuzz/hb_ot_var.inc}             // io. -> hb_ot_name
{$include harfbuzz/hb_ot_color.inc}           // io. -> hb_ot_name, hb_blob
{$include harfbuzz/hb_shape_plan.inc}         // io. -> hb_buffer
{$include harfbuzz/hb_style.inc}              // io.
{$include harfbuzz/hb_features.inc}           // io.
{$include harfbuzz/hb_ot_meta.inc}            // io. -> hb_blob
{$include harfbuzz/hb_glib.inc}               // io. -> hb_unicode, hb_blob
{$include harfbuzz/hb_graphite2.inc}          // io.
{$include harfbuzz/hb_ot_shape.inc}           // io. -> hb_buffer, hb_set, hb_shape_plan
{$include harfbuzz/hb_ot_font.inc}            // io.
{$include harfbuzz/hb_gobject_enums.inc}      // io.                                          ( andere lib )
{$include harfbuzz/hb_gobject_structs.inc}    // io.                                          ( andere lib )
{$include harfbuzz/hb_subset.inc}             // io. -> hb_common, hb_set, hb_map, hb_ot_name ( andere lib )
{$include harfbuzz/hb_cairo.inc}              // io. -> hb_buffer                             ( andere lib )
{$include harfbuzz/hb_icu.inc}                // io. -> hb_unicode                            ( andere lib )
{$include harfbuzz/hb_subset_repacker.inc}    // io. ->                                       ( andere lib )
{$include harfbuzz/hb_deprecated.inc}         // io. -> hb_common, hb_buffer, hb_font, hb_unicode, hb_draw, hb_aat_layout
{$include harfbuzz/hb_ot_deprecated.inc}      // io. -> hb_ot_math, hb_ot_name


