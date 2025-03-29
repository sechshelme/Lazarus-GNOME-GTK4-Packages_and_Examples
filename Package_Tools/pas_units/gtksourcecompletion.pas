unit gtksourcecompletion;

interface

uses
  fp_glib2, fp_GTK4, fp_pango, gtksourcetypes, gtksourcebuffer, gtksourcecompletionprovider;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{G_DECLARE_FINAL_TYPE (GtkSourceCompletion, gtk_source_completion, GTK_SOURCE, COMPLETION, GObject) }
type
  TGtkSourceCompletionClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceCompletionClass = ^TGtkSourceCompletionClass;

function gtk_source_completion_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_completion_get_view(self:PGtkSourceCompletion):PGtkSourceView;cdecl;external libgtksourceview5;
function gtk_source_completion_get_buffer(self:PGtkSourceCompletion):PGtkSourceBuffer;cdecl;external libgtksourceview5;
procedure gtk_source_completion_show(self:PGtkSourceCompletion);cdecl;external libgtksourceview5;
procedure gtk_source_completion_hide(self:PGtkSourceCompletion);cdecl;external libgtksourceview5;
procedure gtk_source_completion_add_provider(self:PGtkSourceCompletion; provider:PGtkSourceCompletionProvider);cdecl;external libgtksourceview5;
procedure gtk_source_completion_remove_provider(self:PGtkSourceCompletion; provider:PGtkSourceCompletionProvider);cdecl;external libgtksourceview5;
procedure gtk_source_completion_block_interactive(self:PGtkSourceCompletion);cdecl;external libgtksourceview5;
procedure gtk_source_completion_unblock_interactive(self:PGtkSourceCompletion);cdecl;external libgtksourceview5;
function gtk_source_completion_get_page_size(self:PGtkSourceCompletion):Tguint;cdecl;external libgtksourceview5;
procedure gtk_source_completion_set_page_size(self:PGtkSourceCompletion; page_size:Tguint);cdecl;external libgtksourceview5;
function gtk_source_completion_fuzzy_match(haystack:Pchar; casefold_needle:Pchar; priority:Pguint):Tgboolean;cdecl;external libgtksourceview5;
function gtk_source_completion_fuzzy_highlight(haystack:Pchar; casefold_query:Pchar):PPangoAttrList;cdecl;external libgtksourceview5;

// === Konventiert am: 29-3-25 15:24:11 ===

function GTK_SOURCE_TYPE_COMPLETION: TGType;
function GTK_SOURCE_COMPLETION(obj: Pointer): PGtkSourceCompletion;
function GTK_SOURCE_IS_COMPLETION(obj: Pointer): Tgboolean;

implementation

function GTK_SOURCE_TYPE_COMPLETION: TGType;
begin
  Result := gtk_source_completion_get_type;
end;

function GTK_SOURCE_COMPLETION(obj: Pointer): PGtkSourceCompletion;
begin
  Result := PGtkSourceCompletion(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_COMPLETION));
end;

function GTK_SOURCE_IS_COMPLETION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_COMPLETION);
end;


end.
