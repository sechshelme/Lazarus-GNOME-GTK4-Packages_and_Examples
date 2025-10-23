{$IFDEF read_interface}


type
  TGMimeFilterCharset = record
    parent_object: TGMimeFilter;
    from_charset: pchar;
    to_charset: pchar;
    cd: Ticonv_t;
  end;
  PGMimeFilterCharset = ^TGMimeFilterCharset;

  TGMimeFilterCharsetClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterCharsetClass = ^TGMimeFilterCharsetClass;

function g_mime_filter_charset_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_charset_new(from_charset: pchar; to_charset: pchar): PGMimeFilter; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:27:21 ===

function GMIME_TYPE_FILTER_CHARSET: TGType;
function GMIME_FILTER_CHARSET(obj: Pointer): PGMimeFilterCharset;
function GMIME_FILTER_CHARSET_CLASS(klass: Pointer): PGMimeFilterCharsetClass;
function GMIME_IS_FILTER_CHARSET(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_CHARSET_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_CHARSET_GET_CLASS(obj: Pointer): PGMimeFilterCharsetClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_FILTER_CHARSET: TGType;
begin
  GMIME_TYPE_FILTER_CHARSET := g_mime_filter_charset_get_type;
end;

function GMIME_FILTER_CHARSET(obj: Pointer): PGMimeFilterCharset;
begin
  Result := PGMimeFilterCharset(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_CHARSET));
end;

function GMIME_FILTER_CHARSET_CLASS(klass: Pointer): PGMimeFilterCharsetClass;
begin
  Result := PGMimeFilterCharsetClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_CHARSET));
end;

function GMIME_IS_FILTER_CHARSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_CHARSET);
end;

function GMIME_IS_FILTER_CHARSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_CHARSET);
end;

function GMIME_FILTER_CHARSET_GET_CLASS(obj: Pointer): PGMimeFilterCharsetClass;
begin
  Result := PGMimeFilterCharsetClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
