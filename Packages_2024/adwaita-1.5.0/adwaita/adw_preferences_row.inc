{$IFDEF read_interface}


  {G_DECLARE_DERIVABLE_TYPE (AdwPreferencesRow, adw_preferences_row, ADW, PREFERENCES_ROW, GtkListBoxRow) }
type
  TAdwPreferencesRow = record
    parent_instance: TGtkListBoxRow;
  end;
  PAdwPreferencesRow = ^TAdwPreferencesRow;

  TAdwPreferencesRowClass = record
    parent_class: TGtkListBoxRowClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwPreferencesRowClass = ^TAdwPreferencesRowClass;

function adw_preferences_row_get_type: TGType; cdecl; external libadwaita;
function adw_preferences_row_new: PGtkWidget; cdecl; external libadwaita;
function adw_preferences_row_get_title(self: PAdwPreferencesRow): pchar; cdecl; external libadwaita;
procedure adw_preferences_row_set_title(self: PAdwPreferencesRow; title: pchar); cdecl; external libadwaita;
function adw_preferences_row_get_use_underline(self: PAdwPreferencesRow): Tgboolean; cdecl; external libadwaita;
procedure adw_preferences_row_set_use_underline(self: PAdwPreferencesRow; use_underline: Tgboolean); cdecl; external libadwaita;
function adw_preferences_row_get_title_selectable(self: PAdwPreferencesRow): Tgboolean; cdecl; external libadwaita;
procedure adw_preferences_row_set_title_selectable(self: PAdwPreferencesRow; title_selectable: Tgboolean); cdecl; external libadwaita;
function adw_preferences_row_get_use_markup(self: PAdwPreferencesRow): Tgboolean; cdecl; external libadwaita;
procedure adw_preferences_row_set_use_markup(self: PAdwPreferencesRow; use_markup: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:50:34 ===

function ADW_TYPE_PREFERENCES_ROW: TGType;
function ADW_PREFERENCES_ROW(obj: Pointer): PAdwPreferencesRow;
function ADW_IS_PREFERENCES_ROW(obj: Pointer): Tgboolean;
function ADW_PREFERENCES_ROW_CLASS(klass: Pointer): PAdwPreferencesRowClass;
function ADW_IS_PREFERENCES_ROW_CLASS(klass: Pointer): Tgboolean;
function ADW_PREFERENCES_ROW_GET_CLASS(obj: Pointer): PAdwPreferencesRowClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_PREFERENCES_ROW: TGType;
begin
  Result := adw_preferences_row_get_type;
end;

function ADW_PREFERENCES_ROW(obj: Pointer): PAdwPreferencesRow;
begin
  Result := PAdwPreferencesRow(g_type_check_instance_cast(obj, ADW_TYPE_PREFERENCES_ROW));
end;

function ADW_IS_PREFERENCES_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_PREFERENCES_ROW);
end;

function ADW_PREFERENCES_ROW_CLASS(klass: Pointer): PAdwPreferencesRowClass;
begin
  Result := PAdwPreferencesRowClass(g_type_check_class_cast(klass, ADW_TYPE_PREFERENCES_ROW));
end;

function ADW_IS_PREFERENCES_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_PREFERENCES_ROW);
end;

function ADW_PREFERENCES_ROW_GET_CLASS(obj: Pointer): PAdwPreferencesRowClass;
begin
  Result := PAdwPreferencesRowClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
