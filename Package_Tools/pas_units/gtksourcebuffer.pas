unit gtksourcebuffer;

interface

uses
  fp_glib2, fp_GTK4, gtksourcelanguage, gtksourcestylescheme, gtksourcemark;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_DERIVABLE_TYPE (GtkSourceBuffer, gtk_source_buffer, GTK_SOURCE, BUFFER, GtkTextBuffer) }
type
  PGtkSourceBracketMatchType = ^TGtkSourceBracketMatchType;
  TGtkSourceBracketMatchType = longint;

const
  GTK_SOURCE_BRACKET_MATCH_NONE = 0;
  GTK_SOURCE_BRACKET_MATCH_OUT_OF_RANGE = 1;
  GTK_SOURCE_BRACKET_MATCH_NOT_FOUND = 2;
  GTK_SOURCE_BRACKET_MATCH_FOUND = 3;

type
  PGtkSourceChangeCaseType = ^TGtkSourceChangeCaseType;
  TGtkSourceChangeCaseType = longint;

const
  GTK_SOURCE_CHANGE_CASE_LOWER = 0;
  GTK_SOURCE_CHANGE_CASE_UPPER = 1;
  GTK_SOURCE_CHANGE_CASE_TOGGLE = 2;
  GTK_SOURCE_CHANGE_CASE_TITLE = 3;

type
  PGtkSourceSortFlags = ^TGtkSourceSortFlags;
  TGtkSourceSortFlags = longint;

const
  GTK_SOURCE_SORT_FLAGS_NONE = 0;
  GTK_SOURCE_SORT_FLAGS_CASE_SENSITIVE = 1 shl 0;
  GTK_SOURCE_SORT_FLAGS_REVERSE_ORDER = 1 shl 1;
  GTK_SOURCE_SORT_FLAGS_REMOVE_DUPLICATES = 1 shl 2;

type
  TGtkSourceBuffer = record
    parent_instance: TGtkTextBuffer;
  end;
  PGtkSourceBuffer = ^TGtkSourceBuffer;

  TGtkSourceBufferClass = record
    parent_class: TGtkTextBufferClass;
    bracket_matched: procedure(buffer: PGtkSourceBuffer; iter: PGtkTextIter; state: TGtkSourceBracketMatchType); cdecl;
    _reserved: array[0..19] of Tgpointer;
  end;
  PGtkSourceBufferClass = ^TGtkSourceBufferClass;


function gtk_source_buffer_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_buffer_new(table: PGtkTextTagTable): PGtkSourceBuffer; cdecl; external libgtksourceview5;
function gtk_source_buffer_new_with_language(language: PGtkSourceLanguage): PGtkSourceBuffer; cdecl; external libgtksourceview5;
function gtk_source_buffer_get_highlight_syntax(buffer: PGtkSourceBuffer): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_buffer_set_highlight_syntax(buffer: PGtkSourceBuffer; highlight: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_buffer_get_highlight_matching_brackets(buffer: PGtkSourceBuffer): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_buffer_set_highlight_matching_brackets(buffer: PGtkSourceBuffer; highlight: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_buffer_get_language(buffer: PGtkSourceBuffer): PGtkSourceLanguage; cdecl; external libgtksourceview5;
procedure gtk_source_buffer_set_language(buffer: PGtkSourceBuffer; language: PGtkSourceLanguage); cdecl; external libgtksourceview5;
function gtk_source_buffer_get_loading(buffer: PGtkSourceBuffer): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_buffer_get_style_scheme(buffer: PGtkSourceBuffer): PGtkSourceStyleScheme; cdecl; external libgtksourceview5;
procedure gtk_source_buffer_set_style_scheme(buffer: PGtkSourceBuffer; scheme: PGtkSourceStyleScheme); cdecl; external libgtksourceview5;
procedure gtk_source_buffer_ensure_highlight(buffer: PGtkSourceBuffer; start: PGtkTextIter; end_: PGtkTextIter); cdecl; external libgtksourceview5;
function gtk_source_buffer_create_source_mark(buffer: PGtkSourceBuffer; Name: Pgchar; category: Pgchar; where: PGtkTextIter): PGtkSourceMark; cdecl; external libgtksourceview5;
function gtk_source_buffer_forward_iter_to_source_mark(buffer: PGtkSourceBuffer; iter: PGtkTextIter; category: Pgchar): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_buffer_backward_iter_to_source_mark(buffer: PGtkSourceBuffer; iter: PGtkTextIter; category: Pgchar): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_buffer_get_source_marks_at_iter(buffer: PGtkSourceBuffer; iter: PGtkTextIter; category: Pgchar): PGSList; cdecl; external libgtksourceview5;
function gtk_source_buffer_get_source_marks_at_line(buffer: PGtkSourceBuffer; line: Tgint; category: Pgchar): PGSList; cdecl; external libgtksourceview5;
procedure gtk_source_buffer_remove_source_marks(buffer: PGtkSourceBuffer; start: PGtkTextIter; end_: PGtkTextIter; category: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_buffer_iter_has_context_class(buffer: PGtkSourceBuffer; iter: PGtkTextIter; context_class: Pgchar): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_buffer_get_context_classes_at_iter(buffer: PGtkSourceBuffer; iter: PGtkTextIter): PPgchar; cdecl; external libgtksourceview5;
function gtk_source_buffer_iter_forward_to_context_class_toggle(buffer: PGtkSourceBuffer; iter: PGtkTextIter; context_class: Pgchar): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_buffer_iter_backward_to_context_class_toggle(buffer: PGtkSourceBuffer; iter: PGtkTextIter; context_class: Pgchar): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_buffer_change_case(buffer: PGtkSourceBuffer; case_type: TGtkSourceChangeCaseType; start: PGtkTextIter; end_: PGtkTextIter); cdecl; external libgtksourceview5;
procedure gtk_source_buffer_join_lines(buffer: PGtkSourceBuffer; start: PGtkTextIter; end_: PGtkTextIter); cdecl; external libgtksourceview5;
procedure gtk_source_buffer_sort_lines(buffer: PGtkSourceBuffer; start: PGtkTextIter; end_: PGtkTextIter; flags: TGtkSourceSortFlags; column: Tgint); cdecl; external libgtksourceview5;
procedure gtk_source_buffer_set_implicit_trailing_newline(buffer: PGtkSourceBuffer; implicit_trailing_newline: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_buffer_get_implicit_trailing_newline(buffer: PGtkSourceBuffer): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_buffer_create_source_tag(buffer: PGtkSourceBuffer; tag_name: Pgchar; first_property_name: Pgchar; args: array of const): PGtkTextTag; cdecl; external libgtksourceview5;
function gtk_source_buffer_create_source_tag(buffer: PGtkSourceBuffer; tag_name: Pgchar; first_property_name: Pgchar): PGtkTextTag; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 13:52:38 ===

function GTK_SOURCE_TYPE_BUFFER: TGType;
function GTK_SOURCE_BUFFER(obj: Pointer): PGtkSourceBuffer;
function GTK_SOURCE_IS_BUFFER(obj: Pointer): Tgboolean;
function GTK_SOURCE_BUFFER_CLASS(klass: Pointer): PGtkSourceBufferClass;
function GTK_SOURCE_IS_BUFFER_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_BUFFER_GET_CLASS(obj: Pointer): PGtkSourceBufferClass;

implementation

function GTK_SOURCE_TYPE_BUFFER: TGType;
begin
  Result := gtk_source_buffer_get_type;
end;

function GTK_SOURCE_BUFFER(obj: Pointer): PGtkSourceBuffer;
begin
  Result := PGtkSourceBuffer(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_BUFFER));
end;

function GTK_SOURCE_IS_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_BUFFER);
end;

function GTK_SOURCE_BUFFER_CLASS(klass: Pointer): PGtkSourceBufferClass;
begin
  Result := PGtkSourceBufferClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_BUFFER));
end;

function GTK_SOURCE_IS_BUFFER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_BUFFER);
end;

function GTK_SOURCE_BUFFER_GET_CLASS(obj: Pointer): PGtkSourceBufferClass;
begin
  Result := PGtkSourceBufferClass(PGTypeInstance(obj)^.g_class);
end;



end.
