{$IFDEF read_interface}


type
  PGMimeFilterGZipMode = ^TGMimeFilterGZipMode;
  TGMimeFilterGZipMode = longint;

const
  GMIME_FILTER_GZIP_MODE_ZIP = 0;
  GMIME_FILTER_GZIP_MODE_UNZIP = 1;

type
  PGMimeFilterGZipPrivate = type Pointer;

  TGMimeFilterGZip = record
    parent_object: TGMimeFilter;
    priv: PGMimeFilterGZipPrivate;
    mode: TGMimeFilterGZipMode;
    level: longint;
  end;
  PGMimeFilterGZip = ^TGMimeFilterGZip;

  TGMimeFilterGZipClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterGZipClass = ^TGMimeFilterGZipClass;

function g_mime_filter_gzip_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_gzip_new(mode: TGMimeFilterGZipMode; level: longint): PGMimeFilter; cdecl; external libgmime3;
function g_mime_filter_gzip_get_filename(gzip: PGMimeFilterGZip): pchar; cdecl; external libgmime3;
procedure g_mime_filter_gzip_set_filename(gzip: PGMimeFilterGZip; filename: pchar); cdecl; external libgmime3;
function g_mime_filter_gzip_get_comment(gzip: PGMimeFilterGZip): pchar; cdecl; external libgmime3;
procedure g_mime_filter_gzip_set_comment(gzip: PGMimeFilterGZip; comment: pchar); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:27:46 ===

function GMIME_TYPE_FILTER_GZIP: TGType;
function GMIME_FILTER_GZIP(obj: Pointer): PGMimeFilterGZip;
function GMIME_FILTER_GZIP_CLASS(klass: Pointer): PGMimeFilterGZipClass;
function GMIME_IS_FILTER_GZIP(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_GZIP_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_GZIP_GET_CLASS(obj: Pointer): PGMimeFilterGZipClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_FILTER_GZIP: TGType;
begin
  GMIME_TYPE_FILTER_GZIP := g_mime_filter_gzip_get_type;
end;

function GMIME_FILTER_GZIP(obj: Pointer): PGMimeFilterGZip;
begin
  Result := PGMimeFilterGZip(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_GZIP));
end;

function GMIME_FILTER_GZIP_CLASS(klass: Pointer): PGMimeFilterGZipClass;
begin
  Result := PGMimeFilterGZipClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_GZIP));
end;

function GMIME_IS_FILTER_GZIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_GZIP);
end;

function GMIME_IS_FILTER_GZIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_GZIP);
end;

function GMIME_FILTER_GZIP_GET_CLASS(obj: Pointer): PGMimeFilterGZipClass;
begin
  Result := PGMimeFilterGZipClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
