unit gtkentrycompletion;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TGtkEntryCompletionMatchFunc = function(completion: PGtkEntryCompletion; key: pchar; iter: PGtkTreeIter; user_data: Tgpointer): Tgboolean; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_entry_completion_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_entry_completion_new: PGtkEntryCompletion; cdecl; external libgtk4; deprecated;
function gtk_entry_completion_new_with_area(area: PGtkCellArea): PGtkEntryCompletion; cdecl; external libgtk4; deprecated;
function gtk_entry_completion_get_entry(completion: PGtkEntryCompletion): PGtkWidget; cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_set_model(completion: PGtkEntryCompletion; model: PGtkTreeModel); cdecl; external libgtk4; deprecated;
function gtk_entry_completion_get_model(completion: PGtkEntryCompletion): PGtkTreeModel; cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_set_match_func(completion: PGtkEntryCompletion; func: TGtkEntryCompletionMatchFunc; func_data: Tgpointer; func_notify: TGDestroyNotify); cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_set_minimum_key_length(completion: PGtkEntryCompletion; length: longint); cdecl; external libgtk4; deprecated;
function gtk_entry_completion_get_minimum_key_length(completion: PGtkEntryCompletion): longint; cdecl; external libgtk4; deprecated;
function gtk_entry_completion_compute_prefix(completion: PGtkEntryCompletion; key: pchar): pchar; cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_complete(completion: PGtkEntryCompletion); cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_insert_prefix(completion: PGtkEntryCompletion); cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_set_inline_completion(completion: PGtkEntryCompletion; inline_completion: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_entry_completion_get_inline_completion(completion: PGtkEntryCompletion): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_set_inline_selection(completion: PGtkEntryCompletion; inline_selection: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_entry_completion_get_inline_selection(completion: PGtkEntryCompletion): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_set_popup_completion(completion: PGtkEntryCompletion; popup_completion: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_entry_completion_get_popup_completion(completion: PGtkEntryCompletion): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_set_popup_set_width(completion: PGtkEntryCompletion; popup_set_width: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_entry_completion_get_popup_set_width(completion: PGtkEntryCompletion): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_set_popup_single_match(completion: PGtkEntryCompletion; popup_single_match: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_entry_completion_get_popup_single_match(completion: PGtkEntryCompletion): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_entry_completion_get_completion_prefix(completion: PGtkEntryCompletion): pchar; cdecl; external libgtk4; deprecated;
procedure gtk_entry_completion_set_text_column(completion: PGtkEntryCompletion; column: longint); cdecl; external libgtk4; deprecated;
function gtk_entry_completion_get_text_column(completion: PGtkEntryCompletion): longint; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:42:13 ===

function GTK_TYPE_ENTRY_COMPLETION: TGType;
function GTK_ENTRY_COMPLETION(obj: Pointer): PGtkEntryCompletion;
function GTK_IS_ENTRY_COMPLETION(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_ENTRY_COMPLETION: TGType;
begin
  GTK_TYPE_ENTRY_COMPLETION := gtk_entry_completion_get_type;
end;

function GTK_ENTRY_COMPLETION(obj: Pointer): PGtkEntryCompletion;
begin
  Result := PGtkEntryCompletion(g_type_check_instance_cast(obj, GTK_TYPE_ENTRY_COMPLETION));
end;

function GTK_IS_ENTRY_COMPLETION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ENTRY_COMPLETION);
end;

end.
