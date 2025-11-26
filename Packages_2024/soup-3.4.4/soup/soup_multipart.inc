{$IFDEF read_interface}


type
  PSoupMultipart = type Pointer;

function soup_multipart_get_type: TGType; cdecl; external libsoup;

function SOUP_TYPE_MULTIPART: TGType;

function soup_multipart_new(mime_type: pchar): PSoupMultipart; cdecl; external libsoup;
function soup_multipart_new_from_message(headers: PSoupMessageHeaders; body: PGBytes): PSoupMultipart; cdecl; external libsoup;
function soup_multipart_get_length(multipart: PSoupMultipart): longint; cdecl; external libsoup;
function soup_multipart_get_part(multipart: PSoupMultipart; part: longint; headers: PPSoupMessageHeaders; body: PPGBytes): Tgboolean; cdecl; external libsoup;
procedure soup_multipart_append_part(multipart: PSoupMultipart; headers: PSoupMessageHeaders; body: PGBytes); cdecl; external libsoup;
procedure soup_multipart_append_form_string(multipart: PSoupMultipart; control_name: pchar; data: pchar); cdecl; external libsoup;
procedure soup_multipart_append_form_file(multipart: PSoupMultipart; control_name: pchar; filename: pchar; content_type: pchar; body: PGBytes); cdecl; external libsoup;
procedure soup_multipart_to_message(multipart: PSoupMultipart; dest_headers: PSoupMessageHeaders; dest_body: PPGBytes); cdecl; external libsoup;
procedure soup_multipart_free(multipart: PSoupMultipart); cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function SOUP_TYPE_MULTIPART: TGType;
begin
  SOUP_TYPE_MULTIPART := soup_multipart_get_type;
end;


{$ENDIF read_implementation}
