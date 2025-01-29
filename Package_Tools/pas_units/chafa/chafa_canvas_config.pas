unit chafa_canvas_config;

interface

uses
  fp_glib2, chafa_symbol_map;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PChafaColorExtractor = ^TChafaColorExtractor;
  TChafaColorExtractor = longint;

const
  CHAFA_COLOR_EXTRACTOR_AVERAGE = 0;
  CHAFA_COLOR_EXTRACTOR_MEDIAN = 1;
  CHAFA_COLOR_EXTRACTOR_MAX = 2;

type
  PChafaColorSpace = ^TChafaColorSpace;
  TChafaColorSpace = longint;

const
  CHAFA_COLOR_SPACE_RGB = 0;
  CHAFA_COLOR_SPACE_DIN99D = 1;
  CHAFA_COLOR_SPACE_MAX = 2;

type
  PChafaCanvasMode = ^TChafaCanvasMode;
  TChafaCanvasMode = longint;

const
  CHAFA_CANVAS_MODE_TRUECOLOR = 0;
  CHAFA_CANVAS_MODE_INDEXED_256 = 1;
  CHAFA_CANVAS_MODE_INDEXED_240 = 2;
  CHAFA_CANVAS_MODE_INDEXED_16 = 3;
  CHAFA_CANVAS_MODE_FGBG_BGFG = 4;
  CHAFA_CANVAS_MODE_FGBG = 5;
  CHAFA_CANVAS_MODE_INDEXED_8 = 6;
  CHAFA_CANVAS_MODE_INDEXED_16_8 = 7;
  CHAFA_CANVAS_MODE_MAX = 8;

type
  PChafaDitherMode = ^TChafaDitherMode;
  TChafaDitherMode = longint;

const
  CHAFA_DITHER_MODE_NONE = 0;
  CHAFA_DITHER_MODE_ORDERED = 1;
  CHAFA_DITHER_MODE_DIFFUSION = 2;
  CHAFA_DITHER_MODE_MAX = 3;

type
  PChafaPixelMode = ^TChafaPixelMode;
  TChafaPixelMode = longint;

const
  CHAFA_PIXEL_MODE_SYMBOLS = 0;
  CHAFA_PIXEL_MODE_SIXELS = 1;
  CHAFA_PIXEL_MODE_KITTY = 2;
  CHAFA_PIXEL_MODE_ITERM2 = 3;
  CHAFA_PIXEL_MODE_MAX = 4;

type
  PChafaOptimizations = ^TChafaOptimizations;
  TChafaOptimizations = longint;

const
  CHAFA_OPTIMIZATION_REUSE_ATTRIBUTES = 1 shl 0;
  CHAFA_OPTIMIZATION_SKIP_CELLS = 1 shl 1;
  CHAFA_OPTIMIZATION_REPEAT_CELLS = 1 shl 2;
  CHAFA_OPTIMIZATION_NONE = 0;
  CHAFA_OPTIMIZATION_ALL = $7fffffff;

type
  PChafaPassthrough = ^TChafaPassthrough;
  TChafaPassthrough = longint;

const
  CHAFA_PASSTHROUGH_NONE = 0;
  CHAFA_PASSTHROUGH_SCREEN = 1;
  CHAFA_PASSTHROUGH_TMUX = 2;
  CHAFA_PASSTHROUGH_MAX = 3;

type
  TChafaCanvasConfig = record
  end;
  PChafaCanvasConfig = ^TChafaCanvasConfig;

function chafa_canvas_config_new: PChafaCanvasConfig; cdecl; external libchafa;
function chafa_canvas_config_copy(config: PChafaCanvasConfig): PChafaCanvasConfig; cdecl; external libchafa;
procedure chafa_canvas_config_ref(config: PChafaCanvasConfig); cdecl; external libchafa;
procedure chafa_canvas_config_unref(config: PChafaCanvasConfig); cdecl; external libchafa;
procedure chafa_canvas_config_get_geometry(config: PChafaCanvasConfig; width_out: Pgint; height_out: Pgint); cdecl; external libchafa;
procedure chafa_canvas_config_set_geometry(config: PChafaCanvasConfig; Width: Tgint; Height: Tgint); cdecl; external libchafa;
procedure chafa_canvas_config_get_cell_geometry(config: PChafaCanvasConfig; cell_width_out: Pgint; cell_height_out: Pgint); cdecl; external libchafa;
procedure chafa_canvas_config_set_cell_geometry(config: PChafaCanvasConfig; cell_width: Tgint; cell_height: Tgint); cdecl; external libchafa;
function chafa_canvas_config_get_canvas_mode(config: PChafaCanvasConfig): TChafaCanvasMode; cdecl; external libchafa;
procedure chafa_canvas_config_set_canvas_mode(config: PChafaCanvasConfig; mode: TChafaCanvasMode); cdecl; external libchafa;
function chafa_canvas_config_get_color_extractor(config: PChafaCanvasConfig): TChafaColorExtractor; cdecl; external libchafa;
procedure chafa_canvas_config_set_color_extractor(config: PChafaCanvasConfig; color_extractor: TChafaColorExtractor); cdecl; external libchafa;
function chafa_canvas_config_get_color_space(config: PChafaCanvasConfig): TChafaColorSpace; cdecl; external libchafa;
procedure chafa_canvas_config_set_color_space(config: PChafaCanvasConfig; color_space: TChafaColorSpace); cdecl; external libchafa;
function chafa_canvas_config_peek_symbol_map(config: PChafaCanvasConfig): PChafaSymbolMap; cdecl; external libchafa;
procedure chafa_canvas_config_set_symbol_map(config: PChafaCanvasConfig; symbol_map: PChafaSymbolMap); cdecl; external libchafa;
function chafa_canvas_config_peek_fill_symbol_map(config: PChafaCanvasConfig): PChafaSymbolMap; cdecl; external libchafa;
procedure chafa_canvas_config_set_fill_symbol_map(config: PChafaCanvasConfig; fill_symbol_map: PChafaSymbolMap); cdecl; external libchafa;
function chafa_canvas_config_get_transparency_threshold(config: PChafaCanvasConfig): Tgfloat; cdecl; external libchafa;
procedure chafa_canvas_config_set_transparency_threshold(config: PChafaCanvasConfig; alpha_threshold: Tgfloat); cdecl; external libchafa;
function chafa_canvas_config_get_fg_color(config: PChafaCanvasConfig): Tguint32; cdecl; external libchafa;
procedure chafa_canvas_config_set_fg_color(config: PChafaCanvasConfig; fg_color_packed_rgb: Tguint32); cdecl; external libchafa;
function chafa_canvas_config_get_bg_color(config: PChafaCanvasConfig): Tguint32; cdecl; external libchafa;
procedure chafa_canvas_config_set_bg_color(config: PChafaCanvasConfig; bg_color_packed_rgb: Tguint32); cdecl; external libchafa;
function chafa_canvas_config_get_work_factor(config: PChafaCanvasConfig): Tgfloat; cdecl; external libchafa;
procedure chafa_canvas_config_set_work_factor(config: PChafaCanvasConfig; work_factor: Tgfloat); cdecl; external libchafa;
function chafa_canvas_config_get_preprocessing_enabled(config: PChafaCanvasConfig): Tgboolean; cdecl; external libchafa;
procedure chafa_canvas_config_set_preprocessing_enabled(config: PChafaCanvasConfig; preprocessing_enabled: Tgboolean); cdecl; external libchafa;
function chafa_canvas_config_get_dither_mode(config: PChafaCanvasConfig): TChafaDitherMode; cdecl; external libchafa;
procedure chafa_canvas_config_set_dither_mode(config: PChafaCanvasConfig; dither_mode: TChafaDitherMode); cdecl; external libchafa;
procedure chafa_canvas_config_get_dither_grain_size(config: PChafaCanvasConfig; width_out: Pgint; height_out: Pgint); cdecl; external libchafa;
procedure chafa_canvas_config_set_dither_grain_size(config: PChafaCanvasConfig; Width: Tgint; Height: Tgint); cdecl; external libchafa;
function chafa_canvas_config_get_dither_intensity(config: PChafaCanvasConfig): Tgfloat; cdecl; external libchafa;
procedure chafa_canvas_config_set_dither_intensity(config: PChafaCanvasConfig; intensity: Tgfloat); cdecl; external libchafa;
function chafa_canvas_config_get_pixel_mode(config: PChafaCanvasConfig): TChafaPixelMode; cdecl; external libchafa;
procedure chafa_canvas_config_set_pixel_mode(config: PChafaCanvasConfig; pixel_mode: TChafaPixelMode); cdecl; external libchafa;
function chafa_canvas_config_get_optimizations(config: PChafaCanvasConfig): TChafaOptimizations; cdecl; external libchafa;
procedure chafa_canvas_config_set_optimizations(config: PChafaCanvasConfig; optimizations: TChafaOptimizations); cdecl; external libchafa;
function chafa_canvas_config_get_fg_only_enabled(config: PChafaCanvasConfig): Tgboolean; cdecl; external libchafa;
procedure chafa_canvas_config_set_fg_only_enabled(config: PChafaCanvasConfig; fg_only_enabled: Tgboolean); cdecl; external libchafa;
function chafa_canvas_config_get_passthrough(config: PChafaCanvasConfig): TChafaPassthrough; cdecl; external libchafa;
procedure chafa_canvas_config_set_passthrough(config: PChafaCanvasConfig; passthrough: TChafaPassthrough); cdecl; external libchafa;

// === Konventiert am: 29-1-25 18:57:44 ===


implementation



end.
