program project1;

uses
  ctypes,

//  pango_types,          // io.
//  pango_enum_types,     // io.
//  pango_tabs,           // io.
//  pango_script,         // io.
//  pango_language,       // io. -> pango_script
//  pango_direction,      // io.
//  pango_bidi_type,      // io. -> pango_direction
//  pango_color,          // io.
//  pango_matrix,         // io.
//  pango_gravity,        // io. -> pango_matrix, pango_script
//  pango_context,        // io. -> pango_gravity, pango_matrix, pango_direction
//  pango_item,           // io. -> pango_context, pango_direction
//  pango_break,          // io. -> pango_item
//  pango_glyph,          // io. -> pango_item, pango_break
//  pango_coverage,       // io.
//  pango_engine,         // io. -> pango_item, pango_break, pango_glyph, pango_coverage, pango_script
//  pango_fontset,        // io.
//  pango_fontmap,        // io. -> pango_context
//  pango_font,           // io. -> pango_gravity, pango_coverage, pango_context
//  pango_attributes,     // io. -> pango_color, pango_font, pango_gravity
//  pango_features,       // io.
//  pango_version_macros, // io. -> pango_features
//  pango_glyph_item,     // io. -> pango_item, pango_glyph, pango_break, pango_attributes
//  pango_layout,         // io. -> pango_glyph_item, pango_break, pango_direction, pango_context, pango_tabs
//  pango_renderer,       // io. -> pango_attributes, pango_matrix, pango_glyph, pango_glyph_item, pango_layout, pango_color
//  pango_utils,          // io. -> pango_font, pango_direction
//  pango_fontset_simple, // io.
//  pango_markup,         // io.
//  pango_modules,        // io. -> pango_engine, pango_script
//
//
////  pangoft2,             //    !!!!! ft2 !!!!! -> pango_glyph, pango_matrix, pango_layout, pango_coverage
////  pangofc_font,         //    !!!!! ft2 !!!!! -> pango_matrix, pango_glyph
////  pango_ot,             //    !!!!! ft2 !!!!! -> pango_script, pango_glyph, pangofc_font
////  pangofc_decoder,      //    !!!!! ft2 !!!!! -> pangofc_font
////  pangofc_fontmap,      //    !!!!! ft2 !!!!! -> pangofc_decoder, pangofc_font
//
//  pangoxft,               // io. Nur Linux
//  pangoxft_render,        // io. Nur Linux
//
//  pangocairo,

       fp_pango,

  fp_glib2;

  // https://www.perplexity.ai/search/was-ist-gi-scanner-JsyzTafESNujenggA8EGLw

//function pango_ot_info_get_type: TGType; cdecl; external libpango;


  procedure Print_PangoLogAttr;
  var
    Text: Pgchar = 'Hello, Pango!'#10'Hallo Pango!';
    len, i: integer;
    log_attrs: PPangoLogAttr;

  begin
    pango_bidi_type_for_unichar(0);
//    pango_ot_info_get_type;
    len := StrLen(Text);

    log_attrs := g_malloc((len + 1) * SizeOf(TPangoLogAttr));

    pango_get_log_attrs(Text, len, -1, nil, log_attrs, len + 1);

    g_printf('Die Größe von PangoLogAttr beträgt: %zu Bytes'#10, SizeOf(TPangoLogAttr));

    for i := 0 to len do begin
      g_printf('Position %d:', i);
      if log_attrs[i].is_line_break = 1 then begin
        g_printf('Möglicher Zeilenumbruch ');
      end;
      if log_attrs[i].is_word_start = 1 then begin
        g_printf('Wortanfang ');
      end;
      if log_attrs[i].is_word_end = 1 then begin
        g_printf('Wortende ');
      end;
      g_printf('         %40b'#10, log_attrs[i]);
    end;

    g_free(log_attrs);
  end;



  function main(argc: cint; argv: PPChar): cint;
  begin
    Print_PangoLogAttr;
  end;

begin
//  pango_fc_font_get_type;
  main(argc, argv);
end.
