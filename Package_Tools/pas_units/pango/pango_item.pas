unit pango_item;

interface

uses
  fp_glib2, pango_types, pango_context, pango_direction;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  PANGO_ANALYSIS_FLAG_CENTERED_BASELINE = 1 shl 0;
  PANGO_ANALYSIS_FLAG_IS_ELLIPSIS = 1 shl 1;
  PANGO_ANALYSIS_FLAG_NEED_HYPHEN = 1 shl 2;

type
  TPangoAnalysis = record
    shape_engine: PPangoEngineShape;
    lang_engine: PPangoEngineLang;
    font: PPangoFont;
    level: Tguint8;
    gravity: Tguint8;
    flags: Tguint8;
    script: Tguint8;
    language: PPangoLanguage;
    extra_attrs: PGSList;
  end;
  PPangoAnalysis = ^TPangoAnalysis;

  TPangoItem = record
    offset: longint;
    length: longint;
    num_chars: longint;
    analysis: TPangoAnalysis;
  end;
  PPangoItem = ^TPangoItem;


function pango_item_get_type: TGType; cdecl; external libpango;
function pango_item_new: PPangoItem; cdecl; external libpango;
function pango_item_copy(item: PPangoItem): PPangoItem; cdecl; external libpango;
procedure pango_item_free(item: PPangoItem); cdecl; external libpango;
function pango_item_split(orig: PPangoItem; split_index: longint; split_offset: longint): PPangoItem; cdecl; external libpango;
procedure pango_item_apply_attrs(item: PPangoItem; iter: PPangoAttrIterator); cdecl; external libpango;
function pango_reorder_items(items: PGList): PGList; cdecl; external libpango;
function pango_itemize(context: PPangoContext; Text: pchar; start_index: longint; length: longint; attrs: PPangoAttrList;
  cached_iter: PPangoAttrIterator): PGList; cdecl; external libpango;
function pango_itemize_with_base_dir(context: PPangoContext; base_dir: TPangoDirection; Text: pchar; start_index: longint; length: longint;
  attrs: PPangoAttrList; cached_iter: PPangoAttrIterator): PGList; cdecl; external libpango;

// === Konventiert am: 23-11-24 19:39:43 ===

function PANGO_TYPE_ITEM: TGType;

implementation

function PANGO_TYPE_ITEM: TGType;
begin
  PANGO_TYPE_ITEM := pango_item_get_type;
end;



end.
