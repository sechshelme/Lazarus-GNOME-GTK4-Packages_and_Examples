unit gtksource_enumtypes;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function gtk_source_bracket_match_type_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_BRACKET_MATCH_TYPE: TGType;

function gtk_source_change_case_type_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_CHANGE_CASE_TYPE: TGType;

function gtk_source_sort_flags_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_SORT_FLAGS: TGType;

function gtk_source_completion_column_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_COMPLETION_COLUMN: TGType;

function gtk_source_completion_activation_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_COMPLETION_ACTIVATION: TGType;

function gtk_source_newline_type_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_NEWLINE_TYPE: TGType;

function gtk_source_compression_type_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_COMPRESSION_TYPE: TGType;

function gtk_source_file_loader_error_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_FILE_LOADER_ERROR: TGType;

function gtk_source_file_saver_error_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_FILE_SAVER_ERROR: TGType;

function gtk_source_file_saver_flags_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_FILE_SAVER_FLAGS: TGType;

function gtk_source_gutter_renderer_alignment_mode_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_GUTTER_RENDERER_ALIGNMENT_MODE: TGType;

function gtk_source_space_type_flags_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_SPACE_TYPE_FLAGS: TGType;

function gtk_source_space_location_flags_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_SPACE_LOCATION_FLAGS: TGType;

function gtk_source_view_gutter_position_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_VIEW_GUTTER_POSITION: TGType;

function gtk_source_smart_home_end_type_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_SMART_HOME_END_TYPE: TGType;

function gtk_source_background_pattern_type_get_type: TGType; cdecl; external libgtksourceview5;
function GTK_SOURCE_TYPE_BACKGROUND_PATTERN_TYPE: TGType;


// === Konventiert am: 29-3-25 17:13:45 ===


implementation


function GTK_SOURCE_TYPE_BRACKET_MATCH_TYPE: TGType;
begin
  GTK_SOURCE_TYPE_BRACKET_MATCH_TYPE := gtk_source_bracket_match_type_get_type;
end;

function GTK_SOURCE_TYPE_CHANGE_CASE_TYPE: TGType;
begin
  GTK_SOURCE_TYPE_CHANGE_CASE_TYPE := gtk_source_change_case_type_get_type;
end;

function GTK_SOURCE_TYPE_SORT_FLAGS: TGType;
begin
  GTK_SOURCE_TYPE_SORT_FLAGS := gtk_source_sort_flags_get_type;
end;

function GTK_SOURCE_TYPE_COMPLETION_COLUMN: TGType;
begin
  GTK_SOURCE_TYPE_COMPLETION_COLUMN := gtk_source_completion_column_get_type;
end;

function GTK_SOURCE_TYPE_COMPLETION_ACTIVATION: TGType;
begin
  GTK_SOURCE_TYPE_COMPLETION_ACTIVATION := gtk_source_completion_activation_get_type;
end;

function GTK_SOURCE_TYPE_NEWLINE_TYPE: TGType;
begin
  GTK_SOURCE_TYPE_NEWLINE_TYPE := gtk_source_newline_type_get_type;
end;

function GTK_SOURCE_TYPE_COMPRESSION_TYPE: TGType;
begin
  GTK_SOURCE_TYPE_COMPRESSION_TYPE := gtk_source_compression_type_get_type;
end;

function GTK_SOURCE_TYPE_FILE_LOADER_ERROR: TGType;
begin
  GTK_SOURCE_TYPE_FILE_LOADER_ERROR := gtk_source_file_loader_error_get_type;
end;

function GTK_SOURCE_TYPE_FILE_SAVER_ERROR: TGType;
begin
  GTK_SOURCE_TYPE_FILE_SAVER_ERROR := gtk_source_file_saver_error_get_type;
end;

function GTK_SOURCE_TYPE_FILE_SAVER_FLAGS: TGType;
begin
  GTK_SOURCE_TYPE_FILE_SAVER_FLAGS := gtk_source_file_saver_flags_get_type;
end;

function GTK_SOURCE_TYPE_GUTTER_RENDERER_ALIGNMENT_MODE: TGType;
begin
  GTK_SOURCE_TYPE_GUTTER_RENDERER_ALIGNMENT_MODE := gtk_source_gutter_renderer_alignment_mode_get_type;
end;

function GTK_SOURCE_TYPE_SPACE_TYPE_FLAGS: TGType;
begin
  GTK_SOURCE_TYPE_SPACE_TYPE_FLAGS := gtk_source_space_type_flags_get_type;
end;

function GTK_SOURCE_TYPE_SPACE_LOCATION_FLAGS: TGType;
begin
  GTK_SOURCE_TYPE_SPACE_LOCATION_FLAGS := gtk_source_space_location_flags_get_type;
end;

function GTK_SOURCE_TYPE_VIEW_GUTTER_POSITION: TGType;
begin
  GTK_SOURCE_TYPE_VIEW_GUTTER_POSITION := gtk_source_view_gutter_position_get_type;
end;

function GTK_SOURCE_TYPE_SMART_HOME_END_TYPE: TGType;
begin
  GTK_SOURCE_TYPE_SMART_HOME_END_TYPE := gtk_source_smart_home_end_type_get_type;
end;

function GTK_SOURCE_TYPE_BACKGROUND_PATTERN_TYPE: TGType;
begin
  GTK_SOURCE_TYPE_BACKGROUND_PATTERN_TYPE := gtk_source_background_pattern_type_get_type;
end;


end.
