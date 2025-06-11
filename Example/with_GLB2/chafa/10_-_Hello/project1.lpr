program project1;

uses
  fp_glib2,
  fp_chafa;

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

begin
  symbol_map := chafa_symbol_map_new;
  chafa_symbol_map_add_by_tags(symbol_map, CHAFA_SYMBOL_TAG_ALL);

  config := chafa_canvas_config_new;
  chafa_canvas_config_set_geometry(config, 80, 40);
  chafa_canvas_config_set_symbol_map(config, symbol_map);

  canvas := chafa_canvas_new(config);

  chafa_canvas_draw_all_pixels(canvas, CHAFA_PIXEL_RGBA8_UNASSOCIATED, pixels, PIX_WIDTH, PIX_HEIGHT, PIX_WIDTH * N_CHANNELS);

  gs := chafa_canvas_build_ansi(canvas);

  g_printf('%s'#10, gs^.str);
  g_printf(#10);

  g_string_free(gs, True);
  chafa_canvas_unref(canvas);
  chafa_canvas_config_unref(config);
  chafa_symbol_map_unref(symbol_map);
end.
