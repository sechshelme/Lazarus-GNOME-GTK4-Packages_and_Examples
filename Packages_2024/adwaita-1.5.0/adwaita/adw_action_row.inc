{$IFDEF read_interface}

  {G_DECLARE_DERIVABLE_TYPE (AdwActionRow, adw_action_row, ADW, ACTION_ROW, AdwPreferencesRow) }
type
  TAdwActionRow = record
    parent_instance: TAdwPreferencesRow;
  end;
  PAdwActionRow = ^TAdwActionRow;

  TAdwActionRowClass = record
    parent_class: TAdwPreferencesRowClass;
    activate: procedure(self: PAdwActionRow); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwActionRowClass = ^TAdwActionRowClass;

function adw_action_row_get_type: TGType; cdecl; external libadwaita;
function adw_action_row_new: PGtkWidget; cdecl; external libadwaita;
procedure adw_action_row_add_prefix(self: PAdwActionRow; widget: PGtkWidget); cdecl; external libadwaita;
procedure adw_action_row_add_suffix(self: PAdwActionRow; widget: PGtkWidget); cdecl; external libadwaita;
procedure adw_action_row_remove(self: PAdwActionRow; widget: PGtkWidget); cdecl; external libadwaita;
function adw_action_row_get_subtitle(self: PAdwActionRow): pchar; cdecl; external libadwaita;
procedure adw_action_row_set_subtitle(self: PAdwActionRow; subtitle: pchar); cdecl; external libadwaita;
function adw_action_row_get_icon_name(self: PAdwActionRow): pchar; cdecl; external libadwaita; deprecated 'ADW_DEPRECATED_IN_1_3_FOR (adw_action_row_add_prefix)';
procedure adw_action_row_set_icon_name(self: PAdwActionRow; icon_name: pchar); cdecl; external libadwaita; deprecated 'ADW_DEPRECATED_IN_1_3_FOR (adw_action_row_add_prefix)';
function adw_action_row_get_activatable_widget(self: PAdwActionRow): PGtkWidget; cdecl; external libadwaita;
procedure adw_action_row_set_activatable_widget(self: PAdwActionRow; widget: PGtkWidget); cdecl; external libadwaita;
function adw_action_row_get_title_lines(self: PAdwActionRow): longint; cdecl; external libadwaita;
procedure adw_action_row_set_title_lines(self: PAdwActionRow; title_lines: longint); cdecl; external libadwaita;
function adw_action_row_get_subtitle_lines(self: PAdwActionRow): longint; cdecl; external libadwaita;
procedure adw_action_row_set_subtitle_lines(self: PAdwActionRow; subtitle_lines: longint); cdecl; external libadwaita;
function adw_action_row_get_subtitle_selectable(self: PAdwActionRow): Tgboolean; cdecl; external libadwaita;
procedure adw_action_row_set_subtitle_selectable(self: PAdwActionRow; subtitle_selectable: Tgboolean); cdecl; external libadwaita;
procedure adw_action_row_activate(self: PAdwActionRow); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 20:01:25 ===

function ADW_TYPE_ACTION_ROW: TGType;
function ADW_ACTION_ROW(obj: Pointer): PAdwActionRow;
function ADW_IS_ACTION_ROW(obj: Pointer): Tgboolean;
function ADW_ACTION_ROW_CLASS(klass: Pointer): PAdwActionRowClass;
function ADW_IS_ACTION_ROW_CLASS(klass: Pointer): Tgboolean;
function ADW_ACTION_ROW_GET_CLASS(obj: Pointer): PAdwActionRowClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_ACTION_ROW: TGType;
begin
  Result := adw_action_row_get_type;
end;

function ADW_ACTION_ROW(obj: Pointer): PAdwActionRow;
begin
  Result := PAdwActionRow(g_type_check_instance_cast(obj, ADW_TYPE_ACTION_ROW));
end;

function ADW_IS_ACTION_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_ACTION_ROW);
end;

function ADW_ACTION_ROW_CLASS(klass: Pointer): PAdwActionRowClass;
begin
  Result := PAdwActionRowClass(g_type_check_class_cast(klass, ADW_TYPE_ACTION_ROW));
end;

function ADW_IS_ACTION_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_ACTION_ROW);
end;

function ADW_ACTION_ROW_GET_CLASS(obj: Pointer): PAdwActionRowClass;
begin
  Result := PAdwActionRowClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
