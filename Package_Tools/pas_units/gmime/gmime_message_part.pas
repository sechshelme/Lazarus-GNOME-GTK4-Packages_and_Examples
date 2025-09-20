unit gmime_message_part;

interface

uses
  fp_glib2, fp_gmime3, gmime_object, gmime_message;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeMessagePart = record
    parent_object: TGMimeObject;
    message: PGMimeMessage;
  end;
  PGMimeMessagePart = ^TGMimeMessagePart;

  TGMimeMessagePartClass = record
    parent_class: TGMimeObjectClass;
  end;
  PGMimeMessagePartClass = ^TGMimeMessagePartClass;

function g_mime_message_part_get_type: TGType; cdecl; external libgmime3;
function g_mime_message_part_new(subtype: pchar): PGMimeMessagePart; cdecl; external libgmime3;
function g_mime_message_part_new_with_message(subtype: pchar; message: PGMimeMessage): PGMimeMessagePart; cdecl; external libgmime3;
procedure g_mime_message_part_set_message(part: PGMimeMessagePart; message: PGMimeMessage); cdecl; external libgmime3;
function g_mime_message_part_get_message(part: PGMimeMessagePart): PGMimeMessage; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:29:39 ===

function GMIME_TYPE_MESSAGE_PART: TGType;
function GMIME_MESSAGE_PART(obj: Pointer): PGMimeMessagePart;
function GMIME_MESSAGE_PART_CLASS(klass: Pointer): PGMimeMessagePartClass;
function GMIME_IS_MESSAGE_PART(obj: Pointer): Tgboolean;
function GMIME_IS_MESSAGE_PART_CLASS(klass: Pointer): Tgboolean;
function GMIME_MESSAGE_PART_GET_CLASS(obj: Pointer): PGMimeMessagePartClass;

implementation

function GMIME_TYPE_MESSAGE_PART: TGType;
begin
  GMIME_TYPE_MESSAGE_PART := g_mime_message_part_get_type;
end;

function GMIME_MESSAGE_PART(obj: Pointer): PGMimeMessagePart;
begin
  Result := PGMimeMessagePart(g_type_check_instance_cast(obj, GMIME_TYPE_MESSAGE_PART));
end;

function GMIME_MESSAGE_PART_CLASS(klass: Pointer): PGMimeMessagePartClass;
begin
  Result := PGMimeMessagePartClass(g_type_check_class_cast(klass, GMIME_TYPE_MESSAGE_PART));
end;

function GMIME_IS_MESSAGE_PART(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_MESSAGE_PART);
end;

function GMIME_IS_MESSAGE_PART_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_MESSAGE_PART);
end;

function GMIME_MESSAGE_PART_GET_CLASS(obj: Pointer): PGMimeMessagePartClass;
begin
  Result := PGMimeMessagePartClass(PGTypeInstance(obj)^.g_class);
end;



end.
