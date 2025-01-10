unit adw_entry_row;

interface

uses
  fp_glib2, fp_pango, fp_GTK4, adw_preferences_row;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {G_DECLARE_DERIVABLE_TYPE (AdwEntryRow, adw_entry_row, ADW, ENTRY_ROW, AdwPreferencesRow) }
type
  TAdwEntryRowClass = record
    parent_class: TAdwPreferencesRowClass;
  end;
  PAdwEntryRowClass = ^TAdwEntryRowClass;

  TAdwEntryRow = record
    parent_instance: TAdwPreferencesRow;
  end;
  PAdwEntryRow = ^TAdwEntryRow;

function adw_entry_row_get_type: TGType; cdecl; external libadwaita;
function adw_entry_row_new: PGtkWidget; cdecl; external libadwaita;
procedure adw_entry_row_add_prefix(self: PAdwEntryRow; widget: PGtkWidget); cdecl; external libadwaita;
procedure adw_entry_row_add_suffix(self: PAdwEntryRow; widget: PGtkWidget); cdecl; external libadwaita;
procedure adw_entry_row_remove(self: PAdwEntryRow; widget: PGtkWidget); cdecl; external libadwaita;
function adw_entry_row_get_show_apply_button(self: PAdwEntryRow): Tgboolean; cdecl; external libadwaita;
procedure adw_entry_row_set_show_apply_button(self: PAdwEntryRow; show_apply_button: Tgboolean); cdecl; external libadwaita;
function adw_entry_row_get_input_hints(self: PAdwEntryRow): TGtkInputHints; cdecl; external libadwaita;
procedure adw_entry_row_set_input_hints(self: PAdwEntryRow; hints: TGtkInputHints); cdecl; external libadwaita;
function adw_entry_row_get_input_purpose(self: PAdwEntryRow): TGtkInputPurpose; cdecl; external libadwaita;
procedure adw_entry_row_set_input_purpose(self: PAdwEntryRow; purpose: TGtkInputPurpose); cdecl; external libadwaita;
function adw_entry_row_get_enable_emoji_completion(self: PAdwEntryRow): Tgboolean; cdecl; external libadwaita;
procedure adw_entry_row_set_enable_emoji_completion(self: PAdwEntryRow; enable_emoji_completion: Tgboolean); cdecl; external libadwaita;
function adw_entry_row_get_attributes(self: PAdwEntryRow): PPangoAttrList; cdecl; external libadwaita;
procedure adw_entry_row_set_attributes(self: PAdwEntryRow; attributes: PPangoAttrList); cdecl; external libadwaita;
function adw_entry_row_get_activates_default(self: PAdwEntryRow): Tgboolean; cdecl; external libadwaita;
procedure adw_entry_row_set_activates_default(self: PAdwEntryRow; activates: Tgboolean); cdecl; external libadwaita;
function adw_entry_row_get_text_length(self: PAdwEntryRow): Tguint; cdecl; external libadwaita;
function adw_entry_row_grab_focus_without_selecting(self: PAdwEntryRow): Tgboolean; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:04:09 ===

function ADW_TYPE_ENTRY_ROW: TGType;
function ADW_ENTRY_ROW(obj: Pointer): PAdwEntryRow;
function ADW_IS_ENTRY_ROW(obj: Pointer): Tgboolean;
function ADW_ENTRY_ROW_CLASS(klass: Pointer): PAdwEntryRowClass;
function ADW_IS_ENTRY_ROW_CLASS(klass: Pointer): Tgboolean;
function ADW_ENTRY_ROW_GET_CLASS(obj: Pointer): PAdwEntryRowClass;

implementation

function ADW_TYPE_ENTRY_ROW: TGType;
begin
  Result := adw_entry_row_get_type;
end;

function ADW_ENTRY_ROW(obj: Pointer): PAdwEntryRow;
begin
  Result := PAdwEntryRow(g_type_check_instance_cast(obj, ADW_TYPE_ENTRY_ROW));
end;

function ADW_IS_ENTRY_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_ENTRY_ROW);
end;

function ADW_ENTRY_ROW_CLASS(klass: Pointer): PAdwEntryRowClass;
begin
  Result := PAdwEntryRowClass(g_type_check_class_cast(klass, ADW_TYPE_ENTRY_ROW));
end;

function ADW_IS_ENTRY_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_ENTRY_ROW);
end;

function ADW_ENTRY_ROW_GET_CLASS(obj: Pointer): PAdwEntryRowClass;
begin
  Result := PAdwEntryRowClass(PGTypeInstance(obj)^.g_class);
end;


end.
