program project1;

uses
  fp_glib2,
  fp_chafa,


  //chafa_common,             // io.
  //chafa_version_macros,     // io.
  //chafa_symbol_map,         // io.
  //chafa_canvas_config,      // io. -> chafa_symbol_map
  //chafa_term_info,          // io.
  //chafa_frame,              // io.
  //chafa_image,              // io. -> chafa_frame
  //chafa_placement,          // io. -> chafa_image
  //chafa_canvas,             // io. -> chafa_canvas_config, chafa_placement, chafa_term_info
  //chafa_features,           // io.
  //chafa_term_db,            // io. -> chafa_term_info
  //chafa_util,               // io.

  Math;

  // https://github.com/hpjansson/chafa/blob/master/examples/example.c

const
  PIX_WIDTH = 3;
  PIX_HEIGHT = 3;
  N_CHANNELS = 4;

  pixels: array[0..(PIX_WIDTH * PIX_HEIGHT * N_CHANNELS) - 1] of byte = (
    $FF, $00, $00, $FF, $00, $00, $00, $FF, $FF, $00, $00, $FF,
    $00, $00, $00, $FF, $FF, $00, $00, $FF, $00, $00, $00, $FF,
    $FF, $00, $00, $FF, $00, $00, $00, $FF, $FF, $00, $00, $FF);

var
  symbol_map: PChafaSymbolMap;
  config: PChafaCanvasConfig;
  canvas: PChafaCanvas;
  gs: PGString;
  term_info: PChafaTermInfo;

begin
  symbol_map := chafa_symbol_map_new;
  chafa_symbol_map_add_by_tags(symbol_map, CHAFA_SYMBOL_TAG_ALL);

  config := chafa_canvas_config_new;
  chafa_canvas_config_set_geometry(config, 80, 40);
  chafa_canvas_config_set_symbol_map(config, symbol_map);

  canvas := chafa_canvas_new(config);

  //  chafa_canvas_set_contents_rgba8(canvas, pixels, PIX_WIDTH, PIX_HEIGHT, PIX_WIDTH * N_CHANNELS);
  chafa_canvas_draw_all_pixels(canvas, CHAFA_PIXEL_RGBA8_UNASSOCIATED, pixels, PIX_WIDTH, PIX_HEIGHT, PIX_WIDTH * N_CHANNELS);

//  term_info := chafa_term_info_new();
//  gs := chafa_canvas_print(canvas, term_info);
//  chafa_term_info_unref(term_info);


    gs := chafa_canvas_build_ansi(canvas);

  g_printf('%s'#10, gs^.str);
  g_printf(#10);

  g_string_free(gs, True);
  chafa_canvas_unref(canvas);
  chafa_canvas_config_unref(config);
  chafa_symbol_map_unref(symbol_map);
end.
