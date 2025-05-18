unit evas_textgrid_eo_legacy;

interface

uses
  ctypes, efl,fp_eo, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEvas_Textgrid = ^TEvas_Textgrid;
  TEvas_Textgrid = TEo;

type
  PEvas_Textgrid_Palette = ^TEvas_Textgrid_Palette;
  TEvas_Textgrid_Palette = longint;

const
  EVAS_TEXTGRID_PALETTE_NONE = 0;
  EVAS_TEXTGRID_PALETTE_STANDARD = 1;
  EVAS_TEXTGRID_PALETTE_EXTENDED = 2;
  EVAS_TEXTGRID_PALETTE_LAST = 3;

type
  PEvas_Textgrid_Font_Style = ^TEvas_Textgrid_Font_Style;
  TEvas_Textgrid_Font_Style = longint;

const
  EVAS_TEXTGRID_FONT_STYLE_NORMAL = 1;
  EVAS_TEXTGRID_FONT_STYLE_BOLD = 2;
  EVAS_TEXTGRID_FONT_STYLE_ITALIC = 4;

procedure evas_object_textgrid_supported_font_styles_set(obj: PEvas_Textgrid; styles: TEvas_Textgrid_Font_Style); cdecl; external libevas;
function evas_object_textgrid_supported_font_styles_get(obj: PEvas_Textgrid): TEvas_Textgrid_Font_Style; cdecl; external libevas;
procedure evas_object_textgrid_size_set(obj: PEvas_Textgrid; w: longint; h: longint); cdecl; external libevas;
procedure evas_object_textgrid_size_get(obj: PEvas_Textgrid; w: Plongint; h: Plongint); cdecl; external libevas;
procedure evas_object_textgrid_cell_size_get(obj: PEvas_Textgrid; width: Plongint; height: Plongint); cdecl; external libevas;
procedure evas_object_textgrid_update_add(obj: PEvas_Textgrid; x: longint; y: longint; w: longint; h: longint); cdecl; external libevas;
procedure evas_object_textgrid_cellrow_set(obj: PEvas_Textgrid; y: longint; row: PEvas_Textgrid_Cell); cdecl; external libevas;
function evas_object_textgrid_cellrow_get(obj: PEvas_Textgrid; y: longint): PEvas_Textgrid_Cell; cdecl; external libevas;
procedure evas_object_textgrid_palette_set(obj: PEvas_Textgrid; pal: TEvas_Textgrid_Palette; idx: longint; r: longint; g: longint; b: longint; a: longint); cdecl; external libevas;
procedure evas_object_textgrid_palette_get(obj: PEvas_Textgrid; pal: TEvas_Textgrid_Palette; idx: longint; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libevas;

// === Konventiert am: 13-5-25 17:21:11 ===


implementation



end.
