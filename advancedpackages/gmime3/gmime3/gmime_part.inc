{$IFDEF read_interface}


type
  TGMimePart = record
    parent_object: TGMimeObject;
    encoding: TGMimeContentEncoding;
    openpgp: TGMimeOpenPGPData;
    content_description: pchar;
    content_location: pchar;
    content_md5: pchar;
    content: PGMimeDataWrapper;
  end;
  PGMimePart = ^TGMimePart;

  TGMimePartClass = record
    parent_class: TGMimeObjectClass;
    set_content: procedure(mime_part: PGMimePart; content: PGMimeDataWrapper); cdecl;
  end;
  PGMimePartClass = ^TGMimePartClass;

function g_mime_part_get_type: TGType; cdecl; external libgmime3;
function g_mime_part_new: PGMimePart; cdecl; external libgmime3;
function g_mime_part_new_with_type(_type: pchar; subtype: pchar): PGMimePart; cdecl; external libgmime3;
procedure g_mime_part_set_content_description(mime_part: PGMimePart; description: pchar); cdecl; external libgmime3;
function g_mime_part_get_content_description(mime_part: PGMimePart): pchar; cdecl; external libgmime3;
procedure g_mime_part_set_content_id(mime_part: PGMimePart; content_id: pchar); cdecl; external libgmime3;
function g_mime_part_get_content_id(mime_part: PGMimePart): pchar; cdecl; external libgmime3;
procedure g_mime_part_set_content_md5(mime_part: PGMimePart; content_md5: pchar); cdecl; external libgmime3;
function g_mime_part_verify_content_md5(mime_part: PGMimePart): Tgboolean; cdecl; external libgmime3;
function g_mime_part_get_content_md5(mime_part: PGMimePart): pchar; cdecl; external libgmime3;
procedure g_mime_part_set_content_location(mime_part: PGMimePart; content_location: pchar); cdecl; external libgmime3;
function g_mime_part_get_content_location(mime_part: PGMimePart): pchar; cdecl; external libgmime3;
procedure g_mime_part_set_content_encoding(mime_part: PGMimePart; encoding: TGMimeContentEncoding); cdecl; external libgmime3;
function g_mime_part_get_content_encoding(mime_part: PGMimePart): TGMimeContentEncoding; cdecl; external libgmime3;
function g_mime_part_get_best_content_encoding(mime_part: PGMimePart; constraint: TGMimeEncodingConstraint): TGMimeContentEncoding; cdecl; external libgmime3;
function g_mime_part_is_attachment(mime_part: PGMimePart): Tgboolean; cdecl; external libgmime3;
procedure g_mime_part_set_filename(mime_part: PGMimePart; filename: pchar); cdecl; external libgmime3;
function g_mime_part_get_filename(mime_part: PGMimePart): pchar; cdecl; external libgmime3;
procedure g_mime_part_set_content(mime_part: PGMimePart; content: PGMimeDataWrapper); cdecl; external libgmime3;
function g_mime_part_get_content(mime_part: PGMimePart): PGMimeDataWrapper; cdecl; external libgmime3;
procedure g_mime_part_set_openpgp_data(mime_part: PGMimePart; data: TGMimeOpenPGPData); cdecl; external libgmime3;
function g_mime_part_get_openpgp_data(mime_part: PGMimePart): TGMimeOpenPGPData; cdecl; external libgmime3;
function g_mime_part_openpgp_encrypt(mime_part: PGMimePart; sign: Tgboolean; userid: pchar; flags: TGMimeEncryptFlags; recipients: PGPtrArray;
  err: PPGError): Tgboolean; cdecl; external libgmime3;
function g_mime_part_openpgp_decrypt(mime_part: PGMimePart; flags: TGMimeDecryptFlags; session_key: pchar; err: PPGError): PGMimeDecryptResult; cdecl; external libgmime3;
function g_mime_part_openpgp_sign(mime_part: PGMimePart; userid: pchar; err: PPGError): Tgboolean; cdecl; external libgmime3;
function g_mime_part_openpgp_verify(mime_part: PGMimePart; flags: TGMimeVerifyFlags; err: PPGError): PGMimeSignatureList; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:32:56 ===

function GMIME_TYPE_PART: TGType;
function GMIME_PART(obj: Pointer): PGMimePart;
function GMIME_PART_CLASS(klass: Pointer): PGMimePartClass;
function GMIME_IS_PART(obj: Pointer): Tgboolean;
function GMIME_IS_PART_CLASS(klass: Pointer): Tgboolean;
function GMIME_PART_GET_CLASS(obj: Pointer): PGMimePartClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_PART: TGType;
begin
  GMIME_TYPE_PART := g_mime_part_get_type;
end;

function GMIME_PART(obj: Pointer): PGMimePart;
begin
  Result := PGMimePart(g_type_check_instance_cast(obj, GMIME_TYPE_PART));
end;

function GMIME_PART_CLASS(klass: Pointer): PGMimePartClass;
begin
  Result := PGMimePartClass(g_type_check_class_cast(klass, GMIME_TYPE_PART));
end;

function GMIME_IS_PART(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_PART);
end;

function GMIME_IS_PART_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_PART);
end;

function GMIME_PART_GET_CLASS(obj: Pointer): PGMimePartClass;
begin
  Result := PGMimePartClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
