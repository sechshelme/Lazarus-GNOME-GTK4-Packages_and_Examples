{$IFDEF read_interface}


const
  GMIME_FILTER_HTML_PRE = 1 shl 0;
  GMIME_FILTER_HTML_CONVERT_NL = 1 shl 1;
  GMIME_FILTER_HTML_CONVERT_SPACES = 1 shl 2;
  GMIME_FILTER_HTML_CONVERT_URLS = 1 shl 3;
  GMIME_FILTER_HTML_MARK_CITATION = 1 shl 4;
  GMIME_FILTER_HTML_CONVERT_ADDRESSES = 1 shl 5;
  GMIME_FILTER_HTML_ESCAPE_8BIT = 1 shl 6;
  GMIME_FILTER_HTML_CITE = 1 shl 7;
  GMIME_FILTER_HTML_BLOCKQUOTE_CITATION = 1 shl 8;

type
  PUrlScanner = type Pointer;

type
  TGMimeFilterHTML = bitpacked record
    parent_object: TGMimeFilter;
    scanner: PUrlScanner;
    flags: Tguint32;
    colour: Tguint32;
    column: 0..65536 div 2 - 1;
    pre_open: 0..1;
    citation_depth: Tguint32;
  end;
  PGMimeFilterHTML = ^TGMimeFilterHTML;

type
  TGMimeFilterHTMLClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterHTMLClass = ^TGMimeFilterHTMLClass;

function g_mime_filter_html_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_html_new(flags: Tguint32; colour: Tguint32): PGMimeFilter; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:27:52 ===

function GMIME_TYPE_FILTER_HTML: TGType;
function GMIME_FILTER_HTML(obj: Pointer): PGMimeFilterHTML;
function GMIME_FILTER_HTML_CLASS(klass: Pointer): PGMimeFilterHTMLClass;
function GMIME_IS_FILTER_HTML(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_HTML_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_HTML_GET_CLASS(obj: Pointer): PGMimeFilterHTMLClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_FILTER_HTML: TGType;
begin
  GMIME_TYPE_FILTER_HTML := g_mime_filter_html_get_type;
end;

function GMIME_FILTER_HTML(obj: Pointer): PGMimeFilterHTML;
begin
  Result := PGMimeFilterHTML(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_HTML));
end;

function GMIME_FILTER_HTML_CLASS(klass: Pointer): PGMimeFilterHTMLClass;
begin
  Result := PGMimeFilterHTMLClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_HTML));
end;

function GMIME_IS_FILTER_HTML(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_HTML);
end;

function GMIME_IS_FILTER_HTML_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_HTML);
end;

function GMIME_FILTER_HTML_GET_CLASS(obj: Pointer): PGMimeFilterHTMLClass;
begin
  Result := PGMimeFilterHTMLClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
