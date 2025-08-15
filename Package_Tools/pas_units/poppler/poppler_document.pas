unit poppler_document;

interface

uses
  fp_glib2, fp_cairo, fp_poppler_glib, poppler;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPopplerPageLayout = ^TPopplerPageLayout;
  TPopplerPageLayout = longint;

const
  POPPLER_PAGE_LAYOUT_UNSET = 0;
  POPPLER_PAGE_LAYOUT_SINGLE_PAGE = 1;
  POPPLER_PAGE_LAYOUT_ONE_COLUMN = 2;
  POPPLER_PAGE_LAYOUT_TWO_COLUMN_LEFT = 3;
  POPPLER_PAGE_LAYOUT_TWO_COLUMN_RIGHT = 4;
  POPPLER_PAGE_LAYOUT_TWO_PAGE_LEFT = 5;
  POPPLER_PAGE_LAYOUT_TWO_PAGE_RIGHT = 6;

type
  PPopplerPageMode = ^TPopplerPageMode;
  TPopplerPageMode = longint;

const
  POPPLER_PAGE_MODE_UNSET = 0;
  POPPLER_PAGE_MODE_NONE = 1;
  POPPLER_PAGE_MODE_USE_OUTLINES = 2;
  POPPLER_PAGE_MODE_USE_THUMBS = 3;
  POPPLER_PAGE_MODE_FULL_SCREEN = 4;
  POPPLER_PAGE_MODE_USE_OC = 5;
  POPPLER_PAGE_MODE_USE_ATTACHMENTS = 6;

type
  PPopplerFontType = ^TPopplerFontType;
  TPopplerFontType = longint;

const
  POPPLER_FONT_TYPE_UNKNOWN = 0;
  POPPLER_FONT_TYPE_TYPE1 = 1;
  POPPLER_FONT_TYPE_TYPE1C = 2;
  POPPLER_FONT_TYPE_TYPE1COT = 3;
  POPPLER_FONT_TYPE_TYPE3 = 4;
  POPPLER_FONT_TYPE_TRUETYPE = 5;
  POPPLER_FONT_TYPE_TRUETYPEOT = 6;
  POPPLER_FONT_TYPE_CID_TYPE0 = 7;
  POPPLER_FONT_TYPE_CID_TYPE0C = 8;
  POPPLER_FONT_TYPE_CID_TYPE0COT = 9;
  POPPLER_FONT_TYPE_CID_TYPE2 = 10;
  POPPLER_FONT_TYPE_CID_TYPE2OT = 11;

type
  PPopplerViewerPreferences = ^TPopplerViewerPreferences;
  TPopplerViewerPreferences = longint;

const
  POPPLER_VIEWER_PREFERENCES_UNSET = 0;
  POPPLER_VIEWER_PREFERENCES_HIDE_TOOLBAR = 1 shl 0;
  POPPLER_VIEWER_PREFERENCES_HIDE_MENUBAR = 1 shl 1;
  POPPLER_VIEWER_PREFERENCES_HIDE_WINDOWUI = 1 shl 2;
  POPPLER_VIEWER_PREFERENCES_FIT_WINDOW = 1 shl 3;
  POPPLER_VIEWER_PREFERENCES_CENTER_WINDOW = 1 shl 4;
  POPPLER_VIEWER_PREFERENCES_DISPLAY_DOC_TITLE = 1 shl 5;
  POPPLER_VIEWER_PREFERENCES_DIRECTION_RTL = 1 shl 6;

type
  PPopplerPrintScaling = ^TPopplerPrintScaling;
  TPopplerPrintScaling = longint;

const
  POPPLER_PRINT_SCALING_APP_DEFAULT = 0;
  POPPLER_PRINT_SCALING_NONE = 1;

type
  PPopplerPrintDuplex = ^TPopplerPrintDuplex;
  TPopplerPrintDuplex = longint;

const
  POPPLER_PRINT_DUPLEX_NONE = 0;
  POPPLER_PRINT_DUPLEX_SIMPLEX = 1;
  POPPLER_PRINT_DUPLEX_DUPLEX_FLIP_SHORT_EDGE = 2;
  POPPLER_PRINT_DUPLEX_DUPLEX_FLIP_LONG_EDGE = 3;

type
  PPopplerPermissions = ^TPopplerPermissions;
  TPopplerPermissions = longint;

const
  POPPLER_PERMISSIONS_OK_TO_PRINT = 1 shl 0;
  POPPLER_PERMISSIONS_OK_TO_MODIFY = 1 shl 1;
  POPPLER_PERMISSIONS_OK_TO_COPY = 1 shl 2;
  POPPLER_PERMISSIONS_OK_TO_ADD_NOTES = 1 shl 3;
  POPPLER_PERMISSIONS_OK_TO_FILL_FORM = 1 shl 4;
  POPPLER_PERMISSIONS_OK_TO_EXTRACT_CONTENTS = 1 shl 5;
  POPPLER_PERMISSIONS_OK_TO_ASSEMBLE = 1 shl 6;
  POPPLER_PERMISSIONS_OK_TO_PRINT_HIGH_RESOLUTION = 1 shl 7;
  POPPLER_PERMISSIONS_FULL = POPPLER_PERMISSIONS_OK_TO_PRINT or POPPLER_PERMISSIONS_OK_TO_MODIFY or POPPLER_PERMISSIONS_OK_TO_COPY or POPPLER_PERMISSIONS_OK_TO_ADD_NOTES or POPPLER_PERMISSIONS_OK_TO_FILL_FORM or POPPLER_PERMISSIONS_OK_TO_EXTRACT_CONTENTS or
    POPPLER_PERMISSIONS_OK_TO_ASSEMBLE or POPPLER_PERMISSIONS_OK_TO_PRINT_HIGH_RESOLUTION;

type
  PPopplerPDFSubtype = ^TPopplerPDFSubtype;
  TPopplerPDFSubtype = longint;

const
  POPPLER_PDF_SUBTYPE_UNSET = 0;
  POPPLER_PDF_SUBTYPE_PDF_A = 1;
  POPPLER_PDF_SUBTYPE_PDF_E = 2;
  POPPLER_PDF_SUBTYPE_PDF_UA = 3;
  POPPLER_PDF_SUBTYPE_PDF_VT = 4;
  POPPLER_PDF_SUBTYPE_PDF_X = 5;
  POPPLER_PDF_SUBTYPE_NONE = 6;

type
  PPopplerPDFPart = ^TPopplerPDFPart;
  TPopplerPDFPart = longint;

const
  POPPLER_PDF_SUBTYPE_PART_UNSET = 0;
  POPPLER_PDF_SUBTYPE_PART_1 = 1;
  POPPLER_PDF_SUBTYPE_PART_2 = 2;
  POPPLER_PDF_SUBTYPE_PART_3 = 3;
  POPPLER_PDF_SUBTYPE_PART_4 = 4;
  POPPLER_PDF_SUBTYPE_PART_5 = 5;
  POPPLER_PDF_SUBTYPE_PART_6 = 6;
  POPPLER_PDF_SUBTYPE_PART_7 = 7;
  POPPLER_PDF_SUBTYPE_PART_8 = 8;
  POPPLER_PDF_SUBTYPE_PART_NONE = 9;

type
  PPopplerPDFConformance = ^TPopplerPDFConformance;
  TPopplerPDFConformance = longint;

const
  POPPLER_PDF_SUBTYPE_CONF_UNSET = 0;
  POPPLER_PDF_SUBTYPE_CONF_A = 1;
  POPPLER_PDF_SUBTYPE_CONF_B = 2;
  POPPLER_PDF_SUBTYPE_CONF_G = 3;
  POPPLER_PDF_SUBTYPE_CONF_N = 4;
  POPPLER_PDF_SUBTYPE_CONF_P = 5;
  POPPLER_PDF_SUBTYPE_CONF_PG = 6;
  POPPLER_PDF_SUBTYPE_CONF_U = 7;
  POPPLER_PDF_SUBTYPE_CONF_NONE = 8;

function poppler_document_get_type: TGType; cdecl; external poppler_glib;
function poppler_document_new_from_file(uri: pchar; password: pchar; error: PPGError): PPopplerDocument; cdecl; external poppler_glib;
function poppler_document_new_from_data(data: pchar; length: longint; password: pchar; error: PPGError): PPopplerDocument; cdecl; external poppler_glib; deprecated 'G_GNUC_DEPRECATED*_FOR(poppler_document_new_from_bytes)';
function poppler_document_new_from_bytes(bytes: PGBytes; password: pchar; error: PPGError): PPopplerDocument; cdecl; external poppler_glib;
function poppler_document_new_from_stream(stream: PGInputStream; length: Tgoffset; password: pchar; cancellable: PGCancellable; error: PPGError): PPopplerDocument; cdecl; external poppler_glib;
function poppler_document_new_from_gfile(file_: PGFile; password: pchar; cancellable: PGCancellable; error: PPGError): PPopplerDocument; cdecl; external poppler_glib;

{$ifndef windows}
function poppler_document_new_from_fd(fd: longint; password: pchar; error: PPGError): PPopplerDocument; cdecl; external poppler_glib;
{$endif}

function poppler_document_save(document: PPopplerDocument; uri: pchar; error: PPGError): Tgboolean; cdecl; external poppler_glib;
function poppler_document_save_a_copy(document: PPopplerDocument; uri: pchar; error: PPGError): Tgboolean; cdecl; external poppler_glib;

{$ifndef windows}
function poppler_document_save_to_fd(document: PPopplerDocument; fd: longint; include_changes: Tgboolean; error: PPGError): Tgboolean; cdecl; external poppler_glib;
{$endif}

function poppler_document_get_id(document: PPopplerDocument; permanent_id: PPgchar; update_id: PPgchar): Tgboolean; cdecl; external poppler_glib;
function poppler_document_get_n_pages(document: PPopplerDocument): longint; cdecl; external poppler_glib;
function poppler_document_get_page(document: PPopplerDocument; index: longint): PPopplerPage; cdecl; external poppler_glib;
function poppler_document_get_page_by_label(document: PPopplerDocument; _label: pchar): PPopplerPage; cdecl; external poppler_glib;
function poppler_document_get_pdf_version_string(document: PPopplerDocument): Pgchar; cdecl; external poppler_glib;
procedure poppler_document_get_pdf_version(document: PPopplerDocument; major_version: Pguint; minor_version: Pguint); cdecl; external poppler_glib;
function poppler_document_get_title(document: PPopplerDocument): Pgchar; cdecl; external poppler_glib;
procedure poppler_document_set_title(document: PPopplerDocument; title: Pgchar); cdecl; external poppler_glib;
function poppler_document_get_author(document: PPopplerDocument): Pgchar; cdecl; external poppler_glib;
procedure poppler_document_set_author(document: PPopplerDocument; author: Pgchar); cdecl; external poppler_glib;
function poppler_document_get_subject(document: PPopplerDocument): Pgchar; cdecl; external poppler_glib;
procedure poppler_document_set_subject(document: PPopplerDocument; subject: Pgchar); cdecl; external poppler_glib;
function poppler_document_get_keywords(document: PPopplerDocument): Pgchar; cdecl; external poppler_glib;
procedure poppler_document_set_keywords(document: PPopplerDocument; keywords: Pgchar); cdecl; external poppler_glib;
function poppler_document_get_creator(document: PPopplerDocument): Pgchar; cdecl; external poppler_glib;
procedure poppler_document_set_creator(document: PPopplerDocument; creator: Pgchar); cdecl; external poppler_glib;
function poppler_document_get_producer(document: PPopplerDocument): Pgchar; cdecl; external poppler_glib;
procedure poppler_document_set_producer(document: PPopplerDocument; producer: Pgchar); cdecl; external poppler_glib;
function poppler_document_get_creation_date(document: PPopplerDocument): Ttime_t; cdecl; external poppler_glib;
procedure poppler_document_set_creation_date(document: PPopplerDocument; creation_date: Ttime_t); cdecl; external poppler_glib;
function poppler_document_get_creation_date_time(document: PPopplerDocument): PGDateTime; cdecl; external poppler_glib;
procedure poppler_document_set_creation_date_time(document: PPopplerDocument; creation_datetime: PGDateTime); cdecl; external poppler_glib;
function poppler_document_get_modification_date(document: PPopplerDocument): Ttime_t; cdecl; external poppler_glib;
procedure poppler_document_set_modification_date(document: PPopplerDocument; modification_date: Ttime_t); cdecl; external poppler_glib;
function poppler_document_get_modification_date_time(document: PPopplerDocument): PGDateTime; cdecl; external poppler_glib;
procedure poppler_document_set_modification_date_time(document: PPopplerDocument; modification_datetime: PGDateTime); cdecl; external poppler_glib;
function poppler_document_is_linearized(document: PPopplerDocument): Tgboolean; cdecl; external poppler_glib;
function poppler_document_get_page_layout(document: PPopplerDocument): TPopplerPageLayout; cdecl; external poppler_glib;
function poppler_document_get_page_mode(document: PPopplerDocument): TPopplerPageMode; cdecl; external poppler_glib;
function poppler_document_get_permissions(document: PPopplerDocument): TPopplerPermissions; cdecl; external poppler_glib;
function poppler_document_get_pdf_subtype_string(document: PPopplerDocument): Pgchar; cdecl; external poppler_glib;
function poppler_document_get_pdf_subtype(document: PPopplerDocument): TPopplerPDFSubtype; cdecl; external poppler_glib;
function poppler_document_get_pdf_part(document: PPopplerDocument): TPopplerPDFPart; cdecl; external poppler_glib;
function poppler_document_get_pdf_conformance(document: PPopplerDocument): TPopplerPDFConformance; cdecl; external poppler_glib;
function poppler_document_get_metadata(document: PPopplerDocument): Pgchar; cdecl; external poppler_glib;
function poppler_document_get_print_scaling(document: PPopplerDocument): TPopplerPrintScaling; cdecl; external poppler_glib;
function poppler_document_get_print_duplex(document: PPopplerDocument): TPopplerPrintDuplex; cdecl; external poppler_glib;
function poppler_document_get_print_n_copies(document: PPopplerDocument): Tgint; cdecl; external poppler_glib;
function poppler_document_get_print_page_ranges(document: PPopplerDocument; n_ranges: Plongint): PPopplerPageRange; cdecl; external poppler_glib;
function poppler_document_get_n_attachments(document: PPopplerDocument): Tguint; cdecl; external poppler_glib;
function poppler_document_has_attachments(document: PPopplerDocument): Tgboolean; cdecl; external poppler_glib;
function poppler_document_get_attachments(document: PPopplerDocument): PGList; cdecl; external poppler_glib;
function poppler_document_find_dest(document: PPopplerDocument; link_name: Pgchar): PPopplerDest; cdecl; external poppler_glib;
function poppler_document_create_dests_tree(document: PPopplerDocument): PGTree; cdecl; external poppler_glib;
function poppler_document_get_form_field(document: PPopplerDocument; id: Tgint): PPopplerFormField; cdecl; external poppler_glib;
procedure poppler_document_reset_form(document: PPopplerDocument; fields: PGList; exclude_fields: Tgboolean); cdecl; external poppler_glib;
function poppler_document_has_javascript(document: PPopplerDocument): Tgboolean; cdecl; external poppler_glib;
function poppler_document_get_signature_fields(document: PPopplerDocument): PGList; cdecl; external poppler_glib;
function poppler_document_get_n_signatures(document: PPopplerDocument): Tgint; cdecl; external poppler_glib;

function POPPLER_TYPE_INDEX_ITER: TGType;

function poppler_index_iter_get_type: TGType; cdecl; external poppler_glib;
function poppler_index_iter_new(document: PPopplerDocument): PPopplerIndexIter; cdecl; external poppler_glib;
function poppler_index_iter_copy(iter: PPopplerIndexIter): PPopplerIndexIter; cdecl; external poppler_glib;
procedure poppler_index_iter_free(iter: PPopplerIndexIter); cdecl; external poppler_glib;
function poppler_index_iter_get_child(parent: PPopplerIndexIter): PPopplerIndexIter; cdecl; external poppler_glib;
function poppler_index_iter_is_open(iter: PPopplerIndexIter): Tgboolean; cdecl; external poppler_glib;
function poppler_index_iter_get_action(iter: PPopplerIndexIter): PPopplerAction; cdecl; external poppler_glib;
function poppler_index_iter_next(iter: PPopplerIndexIter): Tgboolean; cdecl; external poppler_glib;


function POPPLER_TYPE_FONT_INFO: TGType;
function POPPLER_FONT_INFO(obj: Pointer): PPopplerFontInfo;
function POPPLER_IS_FONT_INFO(obj: Pointer): Tgboolean;

function poppler_font_info_get_type: TGType; cdecl; external poppler_glib;
function poppler_font_info_new(document: PPopplerDocument): PPopplerFontInfo; cdecl; external poppler_glib;
function poppler_font_info_scan(font_info: PPopplerFontInfo; n_pages: longint; iter: PPPopplerFontsIter): Tgboolean; cdecl; external poppler_glib;
procedure poppler_font_info_free(font_info: PPopplerFontInfo); cdecl; external poppler_glib;

function POPPLER_TYPE_FONTS_ITER: TGType;

function poppler_fonts_iter_get_type: TGType; cdecl; external poppler_glib;
function poppler_fonts_iter_copy(iter: PPopplerFontsIter): PPopplerFontsIter; cdecl; external poppler_glib;
procedure poppler_fonts_iter_free(iter: PPopplerFontsIter); cdecl; external poppler_glib;
function poppler_fonts_iter_get_name(iter: PPopplerFontsIter): pchar; cdecl; external poppler_glib;
function poppler_fonts_iter_get_full_name(iter: PPopplerFontsIter): pchar; cdecl; external poppler_glib;
function poppler_fonts_iter_get_substitute_name(iter: PPopplerFontsIter): pchar; cdecl; external poppler_glib;
function poppler_fonts_iter_get_file_name(iter: PPopplerFontsIter): pchar; cdecl; external poppler_glib;
function poppler_fonts_iter_get_font_type(iter: PPopplerFontsIter): TPopplerFontType; cdecl; external poppler_glib;
function poppler_fonts_iter_get_encoding(iter: PPopplerFontsIter): pchar; cdecl; external poppler_glib;
function poppler_fonts_iter_is_embedded(iter: PPopplerFontsIter): Tgboolean; cdecl; external poppler_glib;
function poppler_fonts_iter_is_subset(iter: PPopplerFontsIter): Tgboolean; cdecl; external poppler_glib;
function poppler_fonts_iter_next(iter: PPopplerFontsIter): Tgboolean; cdecl; external poppler_glib;

function POPPLER_TYPE_LAYERS_ITER: TGType;

function poppler_layers_iter_get_type: TGType; cdecl; external poppler_glib;
function poppler_layers_iter_new(document: PPopplerDocument): PPopplerLayersIter; cdecl; external poppler_glib;
function poppler_layers_iter_copy(iter: PPopplerLayersIter): PPopplerLayersIter; cdecl; external poppler_glib;
procedure poppler_layers_iter_free(iter: PPopplerLayersIter); cdecl; external poppler_glib;
function poppler_layers_iter_get_child(parent: PPopplerLayersIter): PPopplerLayersIter; cdecl; external poppler_glib;
function poppler_layers_iter_get_title(iter: PPopplerLayersIter): Pgchar; cdecl; external poppler_glib;
function poppler_layers_iter_get_layer(iter: PPopplerLayersIter): PPopplerLayer; cdecl; external poppler_glib;
function poppler_layers_iter_next(iter: PPopplerLayersIter): Tgboolean; cdecl; external poppler_glib;

function POPPLER_TYPE_PS_FILE: TGType;
function POPPLER_PS_FILE(obj: Pointer): PPopplerPSFile;
function POPPLER_IS_PS_FILE(obj: Pointer): Tgboolean;

function poppler_ps_file_get_type: TGType; cdecl; external poppler_glib;
function poppler_ps_file_new(document: PPopplerDocument; filename: pchar; first_page: longint; n_pages: longint): PPopplerPSFile; cdecl; external poppler_glib;

{$ifndef windows}
function poppler_ps_file_new_fd(document: PPopplerDocument; fd: longint; first_page: longint; n_pages: longint): PPopplerPSFile; cdecl; external poppler_glib;
{$endif}

procedure poppler_ps_file_set_paper_size(ps_file: PPopplerPSFile; width: Tdouble; height: Tdouble); cdecl; external poppler_glib;
procedure poppler_ps_file_set_duplex(ps_file: PPopplerPSFile; duplex: Tgboolean); cdecl; external poppler_glib;
procedure poppler_ps_file_free(ps_file: PPopplerPSFile); cdecl; external poppler_glib;
procedure poppler_document_sign(document: PPopplerDocument; signing_data: PPopplerSigningData; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external poppler_glib;
function poppler_document_sign_finish(document: PPopplerDocument; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external poppler_glib;

type
  TPopplerPageRange = record
    start_page: Tgint;
    end_page: Tgint;
  end;
  PPopplerPageRange = ^TPopplerPageRange;


  // === Konventiert am: 15-8-25 16:54:25 ===

function POPPLER_TYPE_DOCUMENT: TGType;
function POPPLER_DOCUMENT(obj: Pointer): PPopplerDocument;
function POPPLER_IS_DOCUMENT(obj: Pointer): Tgboolean;

implementation

function POPPLER_TYPE_DOCUMENT: TGType;
begin
  POPPLER_TYPE_DOCUMENT := poppler_document_get_type;
end;

function POPPLER_DOCUMENT(obj: Pointer): PPopplerDocument;
begin
  Result := PPopplerDocument(g_type_check_instance_cast(obj, POPPLER_TYPE_DOCUMENT));
end;

function POPPLER_IS_DOCUMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_DOCUMENT);
end;


function POPPLER_TYPE_INDEX_ITER: TGType;
begin
  POPPLER_TYPE_INDEX_ITER := poppler_index_iter_get_type;
end;


function POPPLER_TYPE_FONT_INFO: TGType;
begin
  POPPLER_TYPE_FONT_INFO := poppler_font_info_get_type;
end;

function POPPLER_FONT_INFO(obj: Pointer): PPopplerFontInfo;
begin
  POPPLER_FONT_INFO := PPopplerFontInfo(g_type_check_instance_cast(obj, POPPLER_TYPE_FONT_INFO));
end;

function POPPLER_IS_FONT_INFO(obj: Pointer): Tgboolean;
begin
  POPPLER_IS_FONT_INFO := g_type_check_instance_is_a(obj, POPPLER_TYPE_FONT_INFO);
end;


function POPPLER_TYPE_FONTS_ITER: TGType;
begin
  POPPLER_TYPE_FONTS_ITER := poppler_fonts_iter_get_type;
end;

function POPPLER_TYPE_LAYERS_ITER: TGType;
begin
  POPPLER_TYPE_LAYERS_ITER := poppler_layers_iter_get_type;
end;


function POPPLER_TYPE_PS_FILE: TGType;
begin
  POPPLER_TYPE_PS_FILE := poppler_ps_file_get_type;
end;

function POPPLER_PS_FILE(obj: Pointer): PPopplerPSFile;
begin
  POPPLER_PS_FILE := PPopplerPSFile(g_type_check_instance_cast(obj, POPPLER_TYPE_PS_FILE));
end;

function POPPLER_IS_PS_FILE(obj: Pointer): Tgboolean;
begin
  POPPLER_IS_PS_FILE := g_type_check_instance_is_a(obj, POPPLER_TYPE_PS_FILE);
end;


end.
