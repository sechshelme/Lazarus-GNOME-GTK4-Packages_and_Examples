unit soup_message_body;

interface

uses
  fp_glib2, fp_soup;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSoupMemoryUse = ^TSoupMemoryUse;
  TSoupMemoryUse = longint;

const
  SOUP_MEMORY_STATIC = 0;
  SOUP_MEMORY_TAKE = 1;
  SOUP_MEMORY_COPY = 2;

type
  TSoupMessageBody = record
    data: pchar;
    length: Tgoffset;
  end;
  PSoupMessageBody = ^TSoupMessageBody;

function soup_message_body_get_type: TGType; cdecl; external libsoup;

function SOUP_TYPE_MESSAGE_BODY: TGType;

function soup_message_body_new: PSoupMessageBody; cdecl; external libsoup;
function soup_message_body_ref(body: PSoupMessageBody): PSoupMessageBody; cdecl; external libsoup;
procedure soup_message_body_unref(body: PSoupMessageBody); cdecl; external libsoup;
procedure soup_message_body_set_accumulate(body: PSoupMessageBody; accumulate: Tgboolean); cdecl; external libsoup;
function soup_message_body_get_accumulate(body: PSoupMessageBody): Tgboolean; cdecl; external libsoup;
procedure soup_message_body_append(body: PSoupMessageBody; use: TSoupMemoryUse; data: Tgconstpointer; length: Tgsize); cdecl; external libsoup;
procedure soup_message_body_append_take(body: PSoupMessageBody; data: Pguchar; length: Tgsize); cdecl; external libsoup;
procedure soup_message_body_append_bytes(body: PSoupMessageBody; buffer: PGBytes); cdecl; external libsoup;
procedure soup_message_body_truncate(body: PSoupMessageBody); cdecl; external libsoup;
procedure soup_message_body_complete(body: PSoupMessageBody); cdecl; external libsoup;
function soup_message_body_flatten(body: PSoupMessageBody): PGBytes; cdecl; external libsoup;
function soup_message_body_get_chunk(body: PSoupMessageBody; offset: Tgoffset): PGBytes; cdecl; external libsoup;
procedure soup_message_body_got_chunk(body: PSoupMessageBody; chunk: PGBytes); cdecl; external libsoup;
procedure soup_message_body_wrote_chunk(body: PSoupMessageBody; chunk: PGBytes); cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:30 ===


implementation


function SOUP_TYPE_MESSAGE_BODY: TGType;
begin
  SOUP_TYPE_MESSAGE_BODY := soup_message_body_get_type;
end;


end.
