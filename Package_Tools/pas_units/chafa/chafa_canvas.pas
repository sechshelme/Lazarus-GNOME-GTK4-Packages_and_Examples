unit chafa_canvas;

interface

uses
  fp_glib2, chafa_canvas_config, chafa_placement, chafa_common, chafa_term_info;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TChafaCanvas = record
  end;
  PChafaCanvas = ^TChafaCanvas;

function chafa_canvas_new(config: PChafaCanvasConfig): PChafaCanvas; cdecl; external libchafa;
function chafa_canvas_new_similar(orig: PChafaCanvas): PChafaCanvas; cdecl; external libchafa;
procedure chafa_canvas_ref(canvas: PChafaCanvas); cdecl; external libchafa;
procedure chafa_canvas_unref(canvas: PChafaCanvas); cdecl; external libchafa;
function chafa_canvas_peek_config(canvas: PChafaCanvas): PChafaCanvasConfig; cdecl; external libchafa;
procedure chafa_canvas_set_placement(canvas: PChafaCanvas; placement: PChafaPlacement); cdecl; external libchafa;
procedure chafa_canvas_draw_all_pixels(canvas: PChafaCanvas; src_pixel_type: TChafaPixelType; src_pixels: Pguint8; src_width: Tgint; src_height: Tgint;
  src_rowstride: Tgint); cdecl; external libchafa;
function chafa_canvas_print(canvas: PChafaCanvas; term_info: PChafaTermInfo): PGString; cdecl; external libchafa;
procedure chafa_canvas_print_rows(canvas: PChafaCanvas; term_info: PChafaTermInfo; array_out: PPPGString; array_len_out: Pgint); cdecl; external libchafa;
function chafa_canvas_print_rows_strv(canvas: PChafaCanvas; term_info: PChafaTermInfo): PPgchar; cdecl; external libchafa;
function chafa_canvas_get_char_at(canvas: PChafaCanvas; x: Tgint; y: Tgint): Tgunichar; cdecl; external libchafa;
function chafa_canvas_set_char_at(canvas: PChafaCanvas; x: Tgint; y: Tgint; c: Tgunichar): Tgint; cdecl; external libchafa;
procedure chafa_canvas_get_colors_at(canvas: PChafaCanvas; x: Tgint; y: Tgint; fg_out: Pgint; bg_out: Pgint); cdecl; external libchafa;
procedure chafa_canvas_set_colors_at(canvas: PChafaCanvas; x: Tgint; y: Tgint; fg: Tgint; bg: Tgint); cdecl; external libchafa;
procedure chafa_canvas_get_raw_colors_at(canvas: PChafaCanvas; x: Tgint; y: Tgint; fg_out: Pgint; bg_out: Pgint); cdecl; external libchafa;
procedure chafa_canvas_set_raw_colors_at(canvas: PChafaCanvas; x: Tgint; y: Tgint; fg: Tgint; bg: Tgint); cdecl; external libchafa;

procedure chafa_canvas_set_contents_rgba8(canvas: PChafaCanvas; src_pixels: Pguint8; src_width: Tgint; src_height: Tgint; src_rowstride: Tgint); cdecl; external libchafa; deprecated '{CHAFA_DEPRECATED_IN_1_2 }';
function chafa_canvas_build_ansi(canvas: PChafaCanvas): PGString; cdecl; external libchafa; deprecated '{CHAFA_DEPRECATED_IN_1_6 }';

// === Konventiert am: 29-1-25 19:04:28 ===


implementation



end.
