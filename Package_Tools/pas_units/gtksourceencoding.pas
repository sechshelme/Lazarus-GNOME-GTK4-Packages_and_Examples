unit gtksourceencoding;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGtkSourceEncoding = record
  end;
  PGtkSourceEncoding = ^TGtkSourceEncoding;

function gtk_source_encoding_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_encoding_get_from_charset(charset: Pgchar): PGtkSourceEncoding; cdecl; external libgtksourceview5;
function gtk_source_encoding_to_string(enc: PGtkSourceEncoding): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_encoding_get_name(enc: PGtkSourceEncoding): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_encoding_get_charset(enc: PGtkSourceEncoding): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_encoding_get_utf8: PGtkSourceEncoding; cdecl; external libgtksourceview5;
function gtk_source_encoding_get_current: PGtkSourceEncoding; cdecl; external libgtksourceview5;
function gtk_source_encoding_get_all: PGSList; cdecl; external libgtksourceview5;
function gtk_source_encoding_get_default_candidates: PGSList; cdecl; external libgtksourceview5;
function gtk_source_encoding_copy(enc: PGtkSourceEncoding): PGtkSourceEncoding; cdecl; external libgtksourceview5;
procedure gtk_source_encoding_free(enc: PGtkSourceEncoding); cdecl; external libgtksourceview5;

function GTK_SOURCE_TYPE_ENCODING: TGType;

// === Konventiert am: 29-3-25 17:02:23 ===


implementation

function GTK_SOURCE_TYPE_ENCODING: TGType;
begin
  GTK_SOURCE_TYPE_ENCODING := gtk_source_encoding_get_type;
end;


end.
