unit gmime_references;

interface

uses
  fp_glib2, fp_gmime3, gmime_parser_options;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeReferences = record
    arr: PGPtrArray;
  end;
  PGMimeReferences = ^TGMimeReferences;

function g_mime_references_get_type: TGType; cdecl; external libgmime3;
function g_mime_references_new: PGMimeReferences; cdecl; external libgmime3;
procedure g_mime_references_free(refs: PGMimeReferences); cdecl; external libgmime3;
function g_mime_references_parse(options: PGMimeParserOptions; text: pchar): PGMimeReferences; cdecl; external libgmime3;
function g_mime_references_copy(refs: PGMimeReferences): PGMimeReferences; cdecl; external libgmime3;
function g_mime_references_length(refs: PGMimeReferences): longint; cdecl; external libgmime3;
procedure g_mime_references_append(refs: PGMimeReferences; msgid: pchar); cdecl; external libgmime3;
procedure g_mime_references_clear(refs: PGMimeReferences); cdecl; external libgmime3;
function g_mime_references_get_message_id(refs: PGMimeReferences; index: longint): pchar; cdecl; external libgmime3;
procedure g_mime_references_set_message_id(refs: PGMimeReferences; index: longint; msgid: pchar); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:33:21 ===

function GMIME_TYPE_REFERENCES: TGType;

implementation

function GMIME_TYPE_REFERENCES: TGType;
begin
  GMIME_TYPE_REFERENCES := g_mime_references_get_type;
end;



end.
