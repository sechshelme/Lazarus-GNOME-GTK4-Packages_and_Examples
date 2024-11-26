

//{$include GDK/gdkversionmacros.inc}                   // io.

{$include pango/pango_types.inc}          // io.
{$include pango/pango_enum_types.inc}     // io.
{$include pango/pango_tabs.inc}           // io.
{$include pango/pango_script.inc}         // io.
{$include pango/pango_language.inc}       // io. -> pango_script
{$include pango/pango_direction.inc}      // io.
{$include pango/pango_bidi_type.inc}      // io. -> pango_direction
{$include pango/pango_color.inc}          // io.
{$include pango/pango_matrix.inc}         // io.
{$include pango/pango_gravity.inc}        // io. -> pango_matrix, pango_script
{$include pango/pango_context.inc}        // io. -> pango_gravity, pango_matrix
{$include pango/pango_item.inc}           // io. -> pango_context, pango_direction
{$include pango/pango_break.inc}          // io. -> pango_item
{$include pango/pango_glyph.inc}          // io. -> pango_item, pango_break
{$include pango/pango_coverage.inc}       // io.
{$include pango/pango_engine.inc}         // io. -> pango_item, pango_break, pango_glyph, pango_coverage, pango_script
{$include pango/pango_fontset.inc}        // io.
{$include pango/pango_fontmap.inc}        // io. -> pango_context
{$include pango/pango_font.inc}           // io. -> pango_gravity, pango_coverage, pango_context
{$include pango/pango_attributes.inc}     // io. -> pango_color, pango_font, pango_gravity
{$include pango/pango_features.inc}       // io.
{$include pango/pango_version_macros.inc} // io. -> pango_features
{$include pango/pango_glyph_item.inc}     // io. -> pango_item, pango_glyph, pango_break
{$include pango/pango_layout.inc}         // io. -> pango_glyph_item, pango_break
{$include pango/pango_renderer.inc}       // io. -> pango_attributes, pango_matrix, pango_glyph, pango_glyph_item, pango_layout, pango_color
{$include pango/pango_utils.inc}          // io. -> pango_font, pango_direction
{$include pango/pango_fontset_simple.inc} // io.
{$include pango/pango_markup.inc}         // io.
{$include pango/pango_modules.inc}        // io. pango_engine, pango_script
{$include pango/pangocairo.inc}
{$include pango/pangoft2.inc}             //    !!!!! ft2 !!!!! -> pango_glyph, pango_matrix, pango_layout, pango_coverage
{$include pango/pangofc_font.inc}         //    !!!!! ft2 !!!!! -> pango_matrix, pango_glyph
{$include pango/pango_ot.inc}             //    !!!!! ft2 !!!!! -> pango_script, pango_glyph, pangofc_font
{$include pango/pangofc_decoder.inc}      //    !!!!! ft2 !!!!! -> pangofc_font
{$include pango/pangofc_fontmap.inc}      //    !!!!! ft2 !!!!! -> pangofc_decoder, pangofc_font




// ==== X11

{$IFDEF Linux}
{$includes pango/pangoxft.inc}               // io. Nur Linux
{$includes pango/pangoxft_render.inc}        // io. Nur Linux
{$ENDIF}





