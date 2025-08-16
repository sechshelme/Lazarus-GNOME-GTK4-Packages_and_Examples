{$IFDEF read_interface}

type
  PPopplerAnnotType = ^TPopplerAnnotType;
  TPopplerAnnotType = longint;

const
  POPPLER_ANNOT_UNKNOWN = 0;
  POPPLER_ANNOT_TEXT_ = 1;
  POPPLER_ANNOT_LINK = 2;
  POPPLER_ANNOT_FREE_TEXT_ = 3;
  POPPLER_ANNOT_LINE_ = 4;
  POPPLER_ANNOT_SQUARE_ = 5;
  POPPLER_ANNOT_CIRCLE_ = 6;
  POPPLER_ANNOT_POLYGON = 7;
  POPPLER_ANNOT_POLY_LINE = 8;
  POPPLER_ANNOT_HIGHLIGHT = 9;
  POPPLER_ANNOT_UNDERLINE = 10;
  POPPLER_ANNOT_SQUIGGLY = 11;
  POPPLER_ANNOT_STRIKE_OUT = 12;
  POPPLER_ANNOT_STAMP_ = 13;
  POPPLER_ANNOT_CARET = 14;
  POPPLER_ANNOT_INK = 15;
  POPPLER_ANNOT_POPUP = 16;
  POPPLER_ANNOT_FILE_ATTACHMENT_ = 17;
  POPPLER_ANNOT_SOUND = 18;
  POPPLER_ANNOT_MOVIE_ = 19;
  POPPLER_ANNOT_WIDGET = 20;
  POPPLER_ANNOT_SCREEN_ = 21;
  POPPLER_ANNOT_PRINTER_MARK = 22;
  POPPLER_ANNOT_TRAP_NET = 23;
  POPPLER_ANNOT_WATERMARK = 24;
  POPPLER_ANNOT_3D = 25;

type
  PPopplerAnnotFlag = ^TPopplerAnnotFlag;
  TPopplerAnnotFlag = longint;

const
  POPPLER_ANNOT_FLAG_UNKNOWN = 0;
  POPPLER_ANNOT_FLAG_INVISIBLE = 1 shl 0;
  POPPLER_ANNOT_FLAG_HIDDEN = 1 shl 1;
  POPPLER_ANNOT_FLAG_PRINT = 1 shl 2;
  POPPLER_ANNOT_FLAG_NO_ZOOM = 1 shl 3;
  POPPLER_ANNOT_FLAG_NO_ROTATE = 1 shl 4;
  POPPLER_ANNOT_FLAG_NO_VIEW = 1 shl 5;
  POPPLER_ANNOT_FLAG_READ_ONLY = 1 shl 6;
  POPPLER_ANNOT_FLAG_LOCKED = 1 shl 7;
  POPPLER_ANNOT_FLAG_TOGGLE_NO_VIEW = 1 shl 8;
  POPPLER_ANNOT_FLAG_LOCKED_CONTENTS = 1 shl 9;

type
  PPopplerAnnotMarkupReplyType = ^TPopplerAnnotMarkupReplyType;
  TPopplerAnnotMarkupReplyType = longint;

const
  POPPLER_ANNOT_MARKUP_REPLY_TYPE_R = 0;
  POPPLER_ANNOT_MARKUP_REPLY_TYPE_GROUP = 1;

type
  PPopplerAnnotExternalDataType = ^TPopplerAnnotExternalDataType;
  TPopplerAnnotExternalDataType = longint;

const
  POPPLER_ANNOT_EXTERNAL_DATA_MARKUP_3D = 0;
  POPPLER_ANNOT_EXTERNAL_DATA_MARKUP_UNKNOWN = 1;

  POPPLER_ANNOT_TEXT_ICON_NOTE = 'Note';
  POPPLER_ANNOT_TEXT_ICON_COMMENT = 'Comment';
  POPPLER_ANNOT_TEXT_ICON_KEY = 'Key';
  POPPLER_ANNOT_TEXT_ICON_HELP = 'Help';
  POPPLER_ANNOT_TEXT_ICON_NEW_PARAGRAPH = 'NewParagraph';
  POPPLER_ANNOT_TEXT_ICON_PARAGRAPH = 'Paragraph';
  POPPLER_ANNOT_TEXT_ICON_INSERT = 'Insert';
  POPPLER_ANNOT_TEXT_ICON_CROSS = 'Cross';
  POPPLER_ANNOT_TEXT_ICON_CIRCLE = 'Circle';

type
  PPopplerAnnotTextState = ^TPopplerAnnotTextState;
  TPopplerAnnotTextState = longint;

const
  POPPLER_ANNOT_TEXT_STATE_MARKED = 0;
  POPPLER_ANNOT_TEXT_STATE_UNMARKED = 1;
  POPPLER_ANNOT_TEXT_STATE_ACCEPTED = 2;
  POPPLER_ANNOT_TEXT_STATE_REJECTED = 3;
  POPPLER_ANNOT_TEXT_STATE_CANCELLED = 4;
  POPPLER_ANNOT_TEXT_STATE_COMPLETED = 5;
  POPPLER_ANNOT_TEXT_STATE_NONE = 6;
  POPPLER_ANNOT_TEXT_STATE_UNKNOWN = 7;

type
  PPopplerAnnotFreeTextQuadding = ^TPopplerAnnotFreeTextQuadding;
  TPopplerAnnotFreeTextQuadding = longint;

const
  POPPLER_ANNOT_FREE_TEXT_QUADDING_LEFT_JUSTIFIED = 0;
  POPPLER_ANNOT_FREE_TEXT_QUADDING_CENTERED = 1;
  POPPLER_ANNOT_FREE_TEXT_QUADDING_RIGHT_JUSTIFIED = 2;

type
  TPopplerAnnotCalloutLine = record
    multiline: Tgboolean;
    x1: Tgdouble;
    y1: Tgdouble;
    x2: Tgdouble;
    y2: Tgdouble;
    x3: Tgdouble;
    y3: Tgdouble;
  end;
  PPopplerAnnotCalloutLine = ^TPopplerAnnotCalloutLine;

  PPopplerAnnotStampIcon = ^TPopplerAnnotStampIcon;
  TPopplerAnnotStampIcon = longint;

const
  POPPLER_ANNOT_STAMP_ICON_UNKNOWN = 0;
  POPPLER_ANNOT_STAMP_ICON_APPROVED = 1;
  POPPLER_ANNOT_STAMP_ICON_AS_IS = 2;
  POPPLER_ANNOT_STAMP_ICON_CONFIDENTIAL = 3;
  POPPLER_ANNOT_STAMP_ICON_FINAL = 4;
  POPPLER_ANNOT_STAMP_ICON_EXPERIMENTAL = 5;
  POPPLER_ANNOT_STAMP_ICON_EXPIRED = 6;
  POPPLER_ANNOT_STAMP_ICON_NOT_APPROVED = 7;
  POPPLER_ANNOT_STAMP_ICON_NOT_FOR_PUBLIC_RELEASE = 8;
  POPPLER_ANNOT_STAMP_ICON_SOLD = 9;
  POPPLER_ANNOT_STAMP_ICON_DEPARTMENTAL = 10;
  POPPLER_ANNOT_STAMP_ICON_FOR_COMMENT = 11;
  POPPLER_ANNOT_STAMP_ICON_FOR_PUBLIC_RELEASE = 12;
  POPPLER_ANNOT_STAMP_ICON_TOP_SECRET = 13;
  POPPLER_ANNOT_STAMP_ICON_NONE = 14;

function poppler_annot_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_get_annot_type(poppler_annot: PPopplerAnnot): TPopplerAnnotType; cdecl; external poppler_glib;
function poppler_annot_get_contents(poppler_annot: PPopplerAnnot): Pgchar; cdecl; external poppler_glib;
procedure poppler_annot_set_contents(poppler_annot: PPopplerAnnot; contents: Pgchar); cdecl; external poppler_glib;
function poppler_annot_get_name(poppler_annot: PPopplerAnnot): Pgchar; cdecl; external poppler_glib;
function poppler_annot_get_modified(poppler_annot: PPopplerAnnot): Pgchar; cdecl; external poppler_glib;
function poppler_annot_get_flags(poppler_annot: PPopplerAnnot): TPopplerAnnotFlag; cdecl; external poppler_glib;
procedure poppler_annot_set_flags(poppler_annot: PPopplerAnnot; flags: TPopplerAnnotFlag); cdecl; external poppler_glib;
function poppler_annot_get_color(poppler_annot: PPopplerAnnot): PPopplerColor; cdecl; external poppler_glib;
procedure poppler_annot_set_color(poppler_annot: PPopplerAnnot; poppler_color: PPopplerColor); cdecl; external poppler_glib;
function poppler_annot_get_page_index(poppler_annot: PPopplerAnnot): Tgint; cdecl; external poppler_glib;
procedure poppler_annot_get_rectangle(poppler_annot: PPopplerAnnot; poppler_rect: PPopplerRectangle); cdecl; external poppler_glib;
procedure poppler_annot_set_rectangle(poppler_annot: PPopplerAnnot; poppler_rect: PPopplerRectangle); cdecl; external poppler_glib;
function poppler_annot_markup_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_markup_get_label(poppler_annot: PPopplerAnnotMarkup): Pgchar; cdecl; external poppler_glib;
procedure poppler_annot_markup_set_label(poppler_annot: PPopplerAnnotMarkup; _label: Pgchar); cdecl; external poppler_glib;
function poppler_annot_markup_has_popup(poppler_annot: PPopplerAnnotMarkup): Tgboolean; cdecl; external poppler_glib;
procedure poppler_annot_markup_set_popup(poppler_annot: PPopplerAnnotMarkup; popup_rect: PPopplerRectangle); cdecl; external poppler_glib;
function poppler_annot_markup_get_popup_is_open(poppler_annot: PPopplerAnnotMarkup): Tgboolean; cdecl; external poppler_glib;
procedure poppler_annot_markup_set_popup_is_open(poppler_annot: PPopplerAnnotMarkup; is_open: Tgboolean); cdecl; external poppler_glib;
function poppler_annot_markup_get_popup_rectangle(poppler_annot: PPopplerAnnotMarkup; poppler_rect: PPopplerRectangle): Tgboolean; cdecl; external poppler_glib;
procedure poppler_annot_markup_set_popup_rectangle(poppler_annot: PPopplerAnnotMarkup; poppler_rect: PPopplerRectangle); cdecl; external poppler_glib;
function poppler_annot_markup_get_opacity(poppler_annot: PPopplerAnnotMarkup): Tgdouble; cdecl; external poppler_glib;
procedure poppler_annot_markup_set_opacity(poppler_annot: PPopplerAnnotMarkup; opacity: Tgdouble); cdecl; external poppler_glib;
function poppler_annot_markup_get_date(poppler_annot: PPopplerAnnotMarkup): PGDate; cdecl; external poppler_glib;
function poppler_annot_markup_get_subject(poppler_annot: PPopplerAnnotMarkup): Pgchar; cdecl; external poppler_glib;
function poppler_annot_markup_get_reply_to(poppler_annot: PPopplerAnnotMarkup): TPopplerAnnotMarkupReplyType; cdecl; external poppler_glib;
function poppler_annot_markup_get_external_data(poppler_annot: PPopplerAnnotMarkup): TPopplerAnnotExternalDataType; cdecl; external poppler_glib;
function poppler_annot_text_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_text_new(doc: PPopplerDocument; rect: PPopplerRectangle): PPopplerAnnot; cdecl; external poppler_glib;
function poppler_annot_text_get_is_open(poppler_annot: PPopplerAnnotText): Tgboolean; cdecl; external poppler_glib;
procedure poppler_annot_text_set_is_open(poppler_annot: PPopplerAnnotText; is_open: Tgboolean); cdecl; external poppler_glib;
function poppler_annot_text_get_icon(poppler_annot: PPopplerAnnotText): Pgchar; cdecl; external poppler_glib;
procedure poppler_annot_text_set_icon(poppler_annot: PPopplerAnnotText; icon: Pgchar); cdecl; external poppler_glib;
function poppler_annot_text_get_state(poppler_annot: PPopplerAnnotText): TPopplerAnnotTextState; cdecl; external poppler_glib;
function poppler_annot_text_markup_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_text_markup_new_highlight(doc: PPopplerDocument; rect: PPopplerRectangle; quadrilaterals: PGArray): PPopplerAnnot; cdecl; external poppler_glib;
function poppler_annot_text_markup_new_squiggly(doc: PPopplerDocument; rect: PPopplerRectangle; quadrilaterals: PGArray): PPopplerAnnot; cdecl; external poppler_glib;
function poppler_annot_text_markup_new_strikeout(doc: PPopplerDocument; rect: PPopplerRectangle; quadrilaterals: PGArray): PPopplerAnnot; cdecl; external poppler_glib;
function poppler_annot_text_markup_new_underline(doc: PPopplerDocument; rect: PPopplerRectangle; quadrilaterals: PGArray): PPopplerAnnot; cdecl; external poppler_glib;
procedure poppler_annot_text_markup_set_quadrilaterals(poppler_annot: PPopplerAnnotTextMarkup; quadrilaterals: PGArray); cdecl; external poppler_glib;
function poppler_annot_text_markup_get_quadrilaterals(poppler_annot: PPopplerAnnotTextMarkup): PGArray; cdecl; external poppler_glib;
function poppler_annot_free_text_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_free_text_get_quadding(poppler_annot: PPopplerAnnotFreeText): TPopplerAnnotFreeTextQuadding; cdecl; external poppler_glib;
function poppler_annot_free_text_get_callout_line(poppler_annot: PPopplerAnnotFreeText): PPopplerAnnotCalloutLine; cdecl; external poppler_glib;
function poppler_annot_file_attachment_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_file_attachment_get_attachment(poppler_annot: PPopplerAnnotFileAttachment): PPopplerAttachment; cdecl; external poppler_glib;
function poppler_annot_file_attachment_get_name(poppler_annot: PPopplerAnnotFileAttachment): Pgchar; cdecl; external poppler_glib;
function poppler_annot_movie_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_movie_get_title(poppler_annot: PPopplerAnnotMovie): Pgchar; cdecl; external poppler_glib;
function poppler_annot_movie_get_movie(poppler_annot: PPopplerAnnotMovie): PPopplerMovie; cdecl; external poppler_glib;
function poppler_annot_screen_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_screen_get_action(poppler_annot: PPopplerAnnotScreen): PPopplerAction; cdecl; external poppler_glib;
function poppler_annot_line_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_line_new(doc: PPopplerDocument; rect: PPopplerRectangle; start: PPopplerPoint; end_: PPopplerPoint): PPopplerAnnot; cdecl; external poppler_glib;
procedure poppler_annot_line_set_vertices(poppler_annot: PPopplerAnnotLine; start: PPopplerPoint; end_: PPopplerPoint); cdecl; external poppler_glib;
function poppler_annot_callout_line_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_callout_line_new: PPopplerAnnotCalloutLine; cdecl; external poppler_glib;
function poppler_annot_callout_line_copy(callout: PPopplerAnnotCalloutLine): PPopplerAnnotCalloutLine; cdecl; external poppler_glib;
procedure poppler_annot_callout_line_free(callout: PPopplerAnnotCalloutLine); cdecl; external poppler_glib;
function poppler_annot_circle_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_circle_new(doc: PPopplerDocument; rect: PPopplerRectangle): PPopplerAnnot; cdecl; external poppler_glib;
procedure poppler_annot_circle_set_interior_color(poppler_annot: PPopplerAnnotCircle; poppler_color: PPopplerColor); cdecl; external poppler_glib;
function poppler_annot_circle_get_interior_color(poppler_annot: PPopplerAnnotCircle): PPopplerColor; cdecl; external poppler_glib;
function poppler_annot_square_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_square_new(doc: PPopplerDocument; rect: PPopplerRectangle): PPopplerAnnot; cdecl; external poppler_glib;
procedure poppler_annot_square_set_interior_color(poppler_annot: PPopplerAnnotSquare; poppler_color: PPopplerColor); cdecl; external poppler_glib;
function poppler_annot_square_get_interior_color(poppler_annot: PPopplerAnnotSquare): PPopplerColor; cdecl; external poppler_glib;
function poppler_annot_stamp_get_type: TGType; cdecl; external poppler_glib;
function poppler_annot_stamp_new(doc: PPopplerDocument; rect: PPopplerRectangle): PPopplerAnnot; cdecl; external poppler_glib;
function poppler_annot_stamp_get_icon(poppler_annot: PPopplerAnnotStamp): TPopplerAnnotStampIcon; cdecl; external poppler_glib;
procedure poppler_annot_stamp_set_icon(poppler_annot: PPopplerAnnotStamp; icon: TPopplerAnnotStampIcon); cdecl; external poppler_glib;
function poppler_annot_stamp_set_custom_image(poppler_annot: PPopplerAnnotStamp; image: Pcairo_surface_t; error: PPGError): Tgboolean; cdecl; external poppler_glib;

// === Konventiert am: 15-8-25 16:56:07 ===

function POPPLER_TYPE_ANNOT: TGType;
function POPPLER_ANNOT(obj: Pointer): PPopplerAnnot;
function POPPLER_IS_ANNOT(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_MARKUP: TGType;
function POPPLER_ANNOT_MARKUP(obj: Pointer): PPopplerAnnotMarkup;
function POPPLER_IS_ANNOT_MARKUP(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_TEXT: TGType;
function POPPLER_ANNOT_TEXT(obj: Pointer): PPopplerAnnotText;
function POPPLER_IS_ANNOT_TEXT(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_TEXT_MARKUP: TGType;
function POPPLER_ANNOT_TEXT_MARKUP(obj: Pointer): PPopplerAnnotTextMarkup;
function POPPLER_IS_ANNOT_TEXT_MARKUP(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_FREE_TEXT: TGType;
function POPPLER_ANNOT_FREE_TEXT(obj: Pointer): PPopplerAnnotFreeText;
function POPPLER_IS_ANNOT_FREE_TEXT(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_FILE_ATTACHMENT: TGType;
function POPPLER_ANNOT_FILE_ATTACHMENT(obj: Pointer): PPopplerAnnotFileAttachment;
function POPPLER_IS_ANNOT_FILE_ATTACHMENT(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_MOVIE: TGType;
function POPPLER_ANNOT_MOVIE(obj: Pointer): PPopplerAnnotMovie;
function POPPLER_IS_ANNOT_MOVIE(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_SCREEN: TGType;
function POPPLER_ANNOT_SCREEN(obj: Pointer): PPopplerAnnotScreen;
function POPPLER_IS_ANNOT_SCREEN(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_LINE: TGType;
function POPPLER_ANNOT_LINE(obj: Pointer): PPopplerAnnotLine;
function POPPLER_IS_ANNOT_LINE(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_CALLOUT_LINE: TGType;

function POPPLER_TYPE_ANNOT_CIRCLE: TGType;
function POPPLER_ANNOT_CIRCLE(obj: Pointer): PPopplerAnnotCircle;
function POPPLER_IS_ANNOT_CIRCLE(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_SQUARE: TGType;
function POPPLER_ANNOT_SQUARE(obj: Pointer): PPopplerAnnotSquare;
function POPPLER_IS_ANNOT_SQUARE(obj: Pointer): Tgboolean;

function POPPLER_TYPE_ANNOT_STAMP: TGType;
function POPPLER_ANNOT_STAMP(obj: Pointer): PPopplerAnnotStamp;
function POPPLER_IS_ANNOT_STAMP(obj: Pointer): Tgboolean;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function POPPLER_TYPE_ANNOT: TGType;
begin
  POPPLER_TYPE_ANNOT := poppler_annot_get_type;
end;

function POPPLER_ANNOT(obj: Pointer): PPopplerAnnot;
begin
  Result := PPopplerAnnot(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT));
end;

function POPPLER_IS_ANNOT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT);
end;

// ====

function POPPLER_TYPE_ANNOT_MARKUP: TGType;
begin
  POPPLER_TYPE_ANNOT_MARKUP := poppler_annot_markup_get_type;
end;

function POPPLER_ANNOT_MARKUP(obj: Pointer): PPopplerAnnotMarkup;
begin
  Result := PPopplerAnnotMarkup(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_MARKUP));
end;

function POPPLER_IS_ANNOT_MARKUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_MARKUP);
end;

// ====

function POPPLER_TYPE_ANNOT_TEXT: TGType;
begin
  POPPLER_TYPE_ANNOT_TEXT := poppler_annot_text_get_type;
end;

function POPPLER_ANNOT_TEXT(obj: Pointer): PPopplerAnnotText;
begin
  Result := PPopplerAnnotText(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_TEXT));
end;

function POPPLER_IS_ANNOT_TEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_TEXT);
end;

// ====

function POPPLER_TYPE_ANNOT_TEXT_MARKUP: TGType;
begin
  POPPLER_TYPE_ANNOT_TEXT_MARKUP := poppler_annot_text_markup_get_type;
end;

function POPPLER_ANNOT_TEXT_MARKUP(obj: Pointer): PPopplerAnnotTextMarkup;
begin
  Result := PPopplerAnnotTextMarkup(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_TEXT_MARKUP));
end;

function POPPLER_IS_ANNOT_TEXT_MARKUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_TEXT_MARKUP);
end;

// ====

function POPPLER_TYPE_ANNOT_FREE_TEXT: TGType;
begin
  POPPLER_TYPE_ANNOT_FREE_TEXT := poppler_annot_free_text_get_type;
end;

function POPPLER_ANNOT_FREE_TEXT(obj: Pointer): PPopplerAnnotFreeText;
begin
  Result := PPopplerAnnotFreeText(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_FREE_TEXT));
end;

function POPPLER_IS_ANNOT_FREE_TEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_FREE_TEXT);
end;

// ====

function POPPLER_TYPE_ANNOT_FILE_ATTACHMENT: TGType;
begin
  POPPLER_TYPE_ANNOT_FILE_ATTACHMENT := poppler_annot_file_attachment_get_type;
end;

function POPPLER_ANNOT_FILE_ATTACHMENT(obj: Pointer): PPopplerAnnotFileAttachment;
begin
  Result := PPopplerAnnotFileAttachment(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_FILE_ATTACHMENT));
end;

function POPPLER_IS_ANNOT_FILE_ATTACHMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_FILE_ATTACHMENT);
end;

// ====

function POPPLER_TYPE_ANNOT_MOVIE: TGType;
begin
  POPPLER_TYPE_ANNOT_MOVIE := poppler_annot_movie_get_type;
end;

function POPPLER_ANNOT_MOVIE(obj: Pointer): PPopplerAnnotMovie;
begin
  Result := PPopplerAnnotMovie(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_MOVIE));
end;

function POPPLER_IS_ANNOT_MOVIE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_MOVIE);
end;

// ====

function POPPLER_TYPE_ANNOT_SCREEN: TGType;
begin
  POPPLER_TYPE_ANNOT_SCREEN := poppler_annot_screen_get_type;
end;

function POPPLER_ANNOT_SCREEN(obj: Pointer): PPopplerAnnotScreen;
begin
  Result := PPopplerAnnotScreen(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_SCREEN));
end;

function POPPLER_IS_ANNOT_SCREEN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_SCREEN);
end;

// ====

function POPPLER_TYPE_ANNOT_LINE: TGType;
begin
  POPPLER_TYPE_ANNOT_LINE := poppler_annot_line_get_type;
end;

function POPPLER_ANNOT_LINE(obj: Pointer): PPopplerAnnotLine;
begin
  Result := PPopplerAnnotLine(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_LINE));
end;

function POPPLER_IS_ANNOT_LINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_LINE);
end;

// ====

function POPPLER_TYPE_ANNOT_CALLOUT_LINE: TGType;
begin
  POPPLER_TYPE_ANNOT_CALLOUT_LINE := poppler_annot_callout_line_get_type;
end;

// ====

function POPPLER_TYPE_ANNOT_CIRCLE: TGType;
begin
  POPPLER_TYPE_ANNOT_CIRCLE := poppler_annot_circle_get_type;
end;

function POPPLER_ANNOT_CIRCLE(obj: Pointer): PPopplerAnnotCircle;
begin
  Result := PPopplerAnnotCircle(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_CIRCLE));
end;

function POPPLER_IS_ANNOT_CIRCLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_CIRCLE);
end;

// ====

function POPPLER_TYPE_ANNOT_SQUARE: TGType;
begin
  POPPLER_TYPE_ANNOT_SQUARE := poppler_annot_square_get_type;
end;

function POPPLER_ANNOT_SQUARE(obj: Pointer): PPopplerAnnotSquare;
begin
  Result := PPopplerAnnotSquare(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_SQUARE));
end;

function POPPLER_IS_ANNOT_SQUARE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_SQUARE);
end;

// ====

function POPPLER_TYPE_ANNOT_STAMP: TGType;
begin
  POPPLER_TYPE_ANNOT_STAMP := poppler_annot_stamp_get_type;
end;

function POPPLER_ANNOT_STAMP(obj: Pointer): PPopplerAnnotStamp;
begin
  Result := PPopplerAnnotStamp(g_type_check_instance_cast(obj, POPPLER_TYPE_ANNOT_STAMP));
end;

function POPPLER_IS_ANNOT_STAMP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_ANNOT_STAMP);
end;


{$ENDIF read_implementation}
