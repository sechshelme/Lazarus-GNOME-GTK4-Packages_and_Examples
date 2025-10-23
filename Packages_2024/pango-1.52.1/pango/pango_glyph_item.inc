
{$IFDEF read_interface}

type
  TPangoGlyphItem = record
    item: PPangoItem;
    glyphs: PPangoGlyphString;
    y_offset: longint;
    start_x_offset: longint;
    end_x_offset: longint;
  end;
  PPangoGlyphItem = ^TPangoGlyphItem;

function pango_glyph_item_get_type: TGType; cdecl; external libpango;
function pango_glyph_item_split(orig: PPangoGlyphItem; Text: pchar; split_index: longint): PPangoGlyphItem; cdecl; external libpango;
function pango_glyph_item_copy(orig: PPangoGlyphItem): PPangoGlyphItem; cdecl; external libpango;
procedure pango_glyph_item_free(glyph_item: PPangoGlyphItem); cdecl; external libpango;
function pango_glyph_item_apply_attrs(glyph_item: PPangoGlyphItem; Text: pchar; list: PPangoAttrList): PGSList; cdecl; external libpango;
procedure pango_glyph_item_letter_space(glyph_item: PPangoGlyphItem; Text: pchar; log_attrs: PPangoLogAttr; letter_spacing: longint); cdecl; external libpango;
procedure pango_glyph_item_get_logical_widths(glyph_item: PPangoGlyphItem; Text: pchar; logical_widths: Plongint); cdecl; external libpango;

type
  TPangoGlyphItemIter = record
    glyph_item: PPangoGlyphItem;
    Text: Pgchar;
    start_glyph: longint;
    start_index: longint;
    start_char: longint;
    end_glyph: longint;
    end_index: longint;
    end_char: longint;
  end;
  PPangoGlyphItemIter = ^TPangoGlyphItemIter;

function pango_glyph_item_iter_get_type: TGType; cdecl; external libpango;
function pango_glyph_item_iter_copy(orig: PPangoGlyphItemIter): PPangoGlyphItemIter; cdecl; external libpango;
procedure pango_glyph_item_iter_free(iter: PPangoGlyphItemIter); cdecl; external libpango;
function pango_glyph_item_iter_init_start(iter: PPangoGlyphItemIter; glyph_item: PPangoGlyphItem; Text: pchar): Tgboolean; cdecl; external libpango;
function pango_glyph_item_iter_init_end(iter: PPangoGlyphItemIter; glyph_item: PPangoGlyphItem; Text: pchar): Tgboolean; cdecl; external libpango;
function pango_glyph_item_iter_next_cluster(iter: PPangoGlyphItemIter): Tgboolean; cdecl; external libpango;
function pango_glyph_item_iter_prev_cluster(iter: PPangoGlyphItemIter): Tgboolean; cdecl; external libpango;

// === Konventiert am: 24-11-24 19:37:31 ===

function PANGO_TYPE_GLYPH_ITEM_ITER: TGType;
function PANGO_TYPE_GLYPH_ITEM: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_GLYPH_ITEM: TGType;
begin
  PANGO_TYPE_GLYPH_ITEM := pango_glyph_item_get_type;
end;

function PANGO_TYPE_GLYPH_ITEM_ITER: TGType;
begin
  PANGO_TYPE_GLYPH_ITEM_ITER := pango_glyph_item_iter_get_type;
end;


{$ENDIF read_implementation}
