{$IFDEF read_interface}


type
  TGMimeFilterChecksum = record
    parent_object: TGMimeFilter;
    checksum: PGChecksum;
  end;
  PGMimeFilterChecksum = ^TGMimeFilterChecksum;

  TGMimeFilterChecksumClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterChecksumClass = ^TGMimeFilterChecksumClass;

function g_mime_filter_checksum_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_checksum_new(_type: TGChecksumType): PGMimeFilter; cdecl; external libgmime3;
function g_mime_filter_checksum_get_digest(checksum: PGMimeFilterChecksum; digest: pbyte; len: Tsize_t): Tsize_t; cdecl; external libgmime3;
function g_mime_filter_checksum_get_string(checksum: PGMimeFilterChecksum): Pgchar; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:27:25 ===

function GMIME_TYPE_FILTER_CHECKSUM: TGType;
function GMIME_FILTER_CHECKSUM(obj: Pointer): PGMimeFilterChecksum;
function GMIME_FILTER_CHECKSUM_CLASS(klass: Pointer): PGMimeFilterChecksumClass;
function GMIME_IS_FILTER_CHECKSUM(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_CHECKSUM_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_CHECKSUM_GET_CLASS(obj: Pointer): PGMimeFilterChecksumClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_FILTER_CHECKSUM: TGType;
begin
  GMIME_TYPE_FILTER_CHECKSUM := g_mime_filter_checksum_get_type;
end;

function GMIME_FILTER_CHECKSUM(obj: Pointer): PGMimeFilterChecksum;
begin
  Result := PGMimeFilterChecksum(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_CHECKSUM));
end;

function GMIME_FILTER_CHECKSUM_CLASS(klass: Pointer): PGMimeFilterChecksumClass;
begin
  Result := PGMimeFilterChecksumClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_CHECKSUM));
end;

function GMIME_IS_FILTER_CHECKSUM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_CHECKSUM);
end;

function GMIME_IS_FILTER_CHECKSUM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_CHECKSUM);
end;

function GMIME_FILTER_CHECKSUM_GET_CLASS(obj: Pointer): PGMimeFilterChecksumClass;
begin
  Result := PGMimeFilterChecksumClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
