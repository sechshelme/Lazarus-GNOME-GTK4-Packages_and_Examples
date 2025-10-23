{$IFDEF read_interface}


type
  TGMimeTextPart = record
    parent_object: TGMimePart;
  end;
  PGMimeTextPart = ^TGMimeTextPart;

  TGMimeTextPartClass = record
    parent_class: TGMimePartClass;
  end;
  PGMimeTextPartClass = ^TGMimeTextPartClass;

function g_mime_text_part_get_type: TGType; cdecl; external libgmime3;
function g_mime_text_part_new: PGMimeTextPart; cdecl; external libgmime3;
function g_mime_text_part_new_with_subtype(subtype: pchar): PGMimeTextPart; cdecl; external libgmime3;
procedure g_mime_text_part_set_charset(mime_part: PGMimeTextPart; charset: pchar); cdecl; external libgmime3;
function g_mime_text_part_get_charset(mime_part: PGMimeTextPart): pchar; cdecl; external libgmime3;
procedure g_mime_text_part_set_text(mime_part: PGMimeTextPart; text: pchar); cdecl; external libgmime3;
function g_mime_text_part_get_text(mime_part: PGMimeTextPart): pchar; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:34:26 ===

function GMIME_TYPE_TEXT_PART: TGType;
function GMIME_TEXT_PART(obj: Pointer): PGMimeTextPart;
function GMIME_TEXT_PART_CLASS(klass: Pointer): PGMimeTextPartClass;
function GMIME_IS_TEXT_PART(obj: Pointer): Tgboolean;
function GMIME_IS_TEXT_PART_CLASS(klass: Pointer): Tgboolean;
function GMIME_TEXT_PART_GET_CLASS(obj: Pointer): PGMimeTextPartClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_TEXT_PART: TGType;
begin
  GMIME_TYPE_TEXT_PART := g_mime_text_part_get_type;
end;

function GMIME_TEXT_PART(obj: Pointer): PGMimeTextPart;
begin
  Result := PGMimeTextPart(g_type_check_instance_cast(obj, GMIME_TYPE_TEXT_PART));
end;

function GMIME_TEXT_PART_CLASS(klass: Pointer): PGMimeTextPartClass;
begin
  Result := PGMimeTextPartClass(g_type_check_class_cast(klass, GMIME_TYPE_TEXT_PART));
end;

function GMIME_IS_TEXT_PART(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_TEXT_PART);
end;

function GMIME_IS_TEXT_PART_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_TEXT_PART);
end;

function GMIME_TEXT_PART_GET_CLASS(obj: Pointer): PGMimeTextPartClass;
begin
  Result := PGMimeTextPartClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
