unit gmime_message_partial;

interface

uses
  fp_glib2, fp_gmime3, gmime_part, gmime_message;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeMessagePartial = record
    parent_object: TGMimePart;
    number: longint;
    total: longint;
    id: pchar;
  end;
  PGMimeMessagePartial = ^TGMimeMessagePartial;
  PPGMimeMessagePartial = ^PGMimeMessagePartial;

  TGMimeMessagePartialClass = record
    parent_class: TGMimePartClass;
  end;
  PGMimeMessagePartialClass = ^TGMimeMessagePartialClass;

function g_mime_message_partial_get_type: TGType; cdecl; external libgmime3;
function g_mime_message_partial_new(id: pchar; number: longint; total: longint): PGMimeMessagePartial; cdecl; external libgmime3;
function g_mime_message_partial_get_id(partial: PGMimeMessagePartial): pchar; cdecl; external libgmime3;
function g_mime_message_partial_get_number(partial: PGMimeMessagePartial): longint; cdecl; external libgmime3;
function g_mime_message_partial_get_total(partial: PGMimeMessagePartial): longint; cdecl; external libgmime3;
function g_mime_message_partial_reconstruct_message(partials: PPGMimeMessagePartial; num: Tsize_t): PGMimeMessage; cdecl; external libgmime3;
function g_mime_message_partial_split_message(message: PGMimeMessage; max_size: Tsize_t; nparts: Psize_t): PPGMimeMessage; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:29:43 ===

function GMIME_TYPE_MESSAGE_PARTIAL: TGType;
function GMIME_MESSAGE_PARTIAL(obj: Pointer): PGMimeMessagePartial;
function GMIME_MESSAGE_PARTIAL_CLASS(klass: Pointer): PGMimeMessagePartialClass;
function GMIME_IS_MESSAGE_PARTIAL(obj: Pointer): Tgboolean;
function GMIME_IS_MESSAGE_PARTIAL_CLASS(klass: Pointer): Tgboolean;
function GMIME_MESSAGE_PARTIAL_GET_CLASS(obj: Pointer): PGMimeMessagePartialClass;

implementation

function GMIME_TYPE_MESSAGE_PARTIAL: TGType;
begin
  GMIME_TYPE_MESSAGE_PARTIAL := g_mime_message_partial_get_type;
end;

function GMIME_MESSAGE_PARTIAL(obj: Pointer): PGMimeMessagePartial;
begin
  Result := PGMimeMessagePartial(g_type_check_instance_cast(obj, GMIME_TYPE_MESSAGE_PARTIAL));
end;

function GMIME_MESSAGE_PARTIAL_CLASS(klass: Pointer): PGMimeMessagePartialClass;
begin
  Result := PGMimeMessagePartialClass(g_type_check_class_cast(klass, GMIME_TYPE_MESSAGE_PARTIAL));
end;

function GMIME_IS_MESSAGE_PARTIAL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_MESSAGE_PARTIAL);
end;

function GMIME_IS_MESSAGE_PARTIAL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_MESSAGE_PARTIAL);
end;

function GMIME_MESSAGE_PARTIAL_GET_CLASS(obj: Pointer): PGMimeMessagePartialClass;
begin
  Result := PGMimeMessagePartialClass(PGTypeInstance(obj)^.g_class);
end;



end.
