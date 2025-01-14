{$IFDEF read_interface}


  {G_DECLARE_DERIVABLE_TYPE (AdwExpanderRow, adw_expander_row, ADW, EXPANDER_ROW, AdwPreferencesRow) }
type
  TAdwExpanderRow = record
    parent_instance: TAdwPreferencesRow;
  end;
  PAdwExpanderRow = ^TAdwExpanderRow;

  TAdwExpanderRowClass = record
    parent_class: TAdwPreferencesRowClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwExpanderRowClass = ^TAdwExpanderRowClass;

function adw_expander_row_get_type: TGType; cdecl; external libadwaita;
function adw_expander_row_new: PGtkWidget; cdecl; external libadwaita;
procedure adw_expander_row_add_action(self: PAdwExpanderRow; widget: PGtkWidget); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4_FOR (adw_expander_row_add_suffix)
procedure adw_expander_row_add_prefix(self: PAdwExpanderRow; widget: PGtkWidget); cdecl; external libadwaita;
procedure adw_expander_row_add_suffix(self: PAdwExpanderRow; widget: PGtkWidget); cdecl; external libadwaita;
procedure adw_expander_row_add_row(self: PAdwExpanderRow; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_expander_row_remove(self: PAdwExpanderRow; child: PGtkWidget); cdecl; external libadwaita;
function adw_expander_row_get_subtitle(self: PAdwExpanderRow): pchar; cdecl; external libadwaita;
procedure adw_expander_row_set_subtitle(self: PAdwExpanderRow; subtitle: pchar); cdecl; external libadwaita;
function adw_expander_row_get_icon_name(self: PAdwExpanderRow): pchar; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_3_FOR (adw_expander_row_add_prefix)
procedure adw_expander_row_set_icon_name(self: PAdwExpanderRow; icon_name: pchar); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_3_FOR (adw_expander_row_add_prefix)
function adw_expander_row_get_expanded(self: PAdwExpanderRow): Tgboolean; cdecl; external libadwaita;
procedure adw_expander_row_set_expanded(self: PAdwExpanderRow; expanded: Tgboolean); cdecl; external libadwaita;
function adw_expander_row_get_enable_expansion(self: PAdwExpanderRow): Tgboolean; cdecl; external libadwaita;
procedure adw_expander_row_set_enable_expansion(self: PAdwExpanderRow; enable_expansion: Tgboolean); cdecl; external libadwaita;
function adw_expander_row_get_show_enable_switch(self: PAdwExpanderRow): Tgboolean; cdecl; external libadwaita;
procedure adw_expander_row_set_show_enable_switch(self: PAdwExpanderRow; show_enable_switch: Tgboolean); cdecl; external libadwaita;
function adw_expander_row_get_title_lines(self: PAdwExpanderRow): Tgboolean; cdecl; external libadwaita;
procedure adw_expander_row_set_title_lines(self: PAdwExpanderRow; title_lines: longint); cdecl; external libadwaita;
function adw_expander_row_get_subtitle_lines(self: PAdwExpanderRow): Tgboolean; cdecl; external libadwaita;
procedure adw_expander_row_set_subtitle_lines(self: PAdwExpanderRow; subtitle_lines: longint); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:46:28 ===

function ADW_TYPE_EXPANDER_ROW: TGType;
function ADW_EXPANDER_ROW(obj: Pointer): PAdwExpanderRow;
function ADW_IS_EXPANDER_ROW(obj: Pointer): Tgboolean;
function ADW_EXPANDER_ROW_CLASS(klass: Pointer): PAdwExpanderRowClass;
function ADW_IS_EXPANDER_ROW_CLASS(klass: Pointer): Tgboolean;
function ADW_EXPANDER_ROW_GET_CLASS(obj: Pointer): PAdwExpanderRowClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_EXPANDER_ROW: TGType;
begin
  Result := adw_expander_row_get_type;
end;

function ADW_EXPANDER_ROW(obj: Pointer): PAdwExpanderRow;
begin
  Result := PAdwExpanderRow(g_type_check_instance_cast(obj, ADW_TYPE_EXPANDER_ROW));
end;

function ADW_IS_EXPANDER_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_EXPANDER_ROW);
end;

function ADW_EXPANDER_ROW_CLASS(klass: Pointer): PAdwExpanderRowClass;
begin
  Result := PAdwExpanderRowClass(g_type_check_class_cast(klass, ADW_TYPE_EXPANDER_ROW));
end;

function ADW_IS_EXPANDER_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_EXPANDER_ROW);
end;

function ADW_EXPANDER_ROW_GET_CLASS(obj: Pointer): PAdwExpanderRowClass;
begin
  Result := PAdwExpanderRowClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
