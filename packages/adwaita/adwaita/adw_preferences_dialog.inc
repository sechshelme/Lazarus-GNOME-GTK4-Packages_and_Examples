{$IFDEF read_interface}


  {G_DECLARE_DERIVABLE_TYPE (AdwPreferencesDialog, adw_preferences_dialog, ADW, PREFERENCES_DIALOG, AdwDialog) }
type
  TAdwPreferencesDialogClass = record
    parent_class: TAdwDialogClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwPreferencesDialogClass = ^TAdwPreferencesDialogClass;

  TAdwPreferencesDialog = record
    parent_instance: TAdwDialog;
  end;
  PAdwPreferencesDialog = ^TAdwPreferencesDialog;

function adw_preferences_dialog_get_type: TGType; cdecl; external libadwaita;
function adw_preferences_dialog_new: PAdwDialog; cdecl; external libadwaita;
procedure adw_preferences_dialog_add(self: PAdwPreferencesDialog; page: PAdwPreferencesPage); cdecl; external libadwaita;
procedure adw_preferences_dialog_remove(self: PAdwPreferencesDialog; page: PAdwPreferencesPage); cdecl; external libadwaita;
function adw_preferences_dialog_get_visible_page(self: PAdwPreferencesDialog): PAdwPreferencesPage; cdecl; external libadwaita;
procedure adw_preferences_dialog_set_visible_page(self: PAdwPreferencesDialog; page: PAdwPreferencesPage); cdecl; external libadwaita;
function adw_preferences_dialog_get_visible_page_name(self: PAdwPreferencesDialog): pchar; cdecl; external libadwaita;
procedure adw_preferences_dialog_set_visible_page_name(self: PAdwPreferencesDialog; Name: pchar); cdecl; external libadwaita;
function adw_preferences_dialog_get_search_enabled(self: PAdwPreferencesDialog): Tgboolean; cdecl; external libadwaita;
procedure adw_preferences_dialog_set_search_enabled(self: PAdwPreferencesDialog; search_enabled: Tgboolean); cdecl; external libadwaita;
procedure adw_preferences_dialog_push_subpage(self: PAdwPreferencesDialog; page: PAdwNavigationPage); cdecl; external libadwaita;
function adw_preferences_dialog_pop_subpage(self: PAdwPreferencesDialog): Tgboolean; cdecl; external libadwaita;
procedure adw_preferences_dialog_add_toast(self: PAdwPreferencesDialog; toast: PAdwToast); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 13:43:22 ===

function ADW_TYPE_PREFERENCES_DIALOG: TGType;
function ADW_PREFERENCES_DIALOG(obj: Pointer): PAdwPreferencesDialog;
function ADW_IS_PREFERENCES_DIALOG(obj: Pointer): Tgboolean;
function ADW_PREFERENCES_DIALOG_CLASS(klass: Pointer): PAdwPreferencesDialogClass;
function ADW_IS_PREFERENCES_DIALOG_CLASS(klass: Pointer): Tgboolean;
function ADW_PREFERENCES_DIALOG_GET_CLASS(obj: Pointer): PAdwPreferencesDialogClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_PREFERENCES_DIALOG: TGType;
begin
  Result := adw_preferences_dialog_get_type;
end;

function ADW_PREFERENCES_DIALOG(obj: Pointer): PAdwPreferencesDialog;
begin
  Result := PAdwPreferencesDialog(g_type_check_instance_cast(obj, ADW_TYPE_PREFERENCES_DIALOG));
end;

function ADW_IS_PREFERENCES_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_PREFERENCES_DIALOG);
end;

function ADW_PREFERENCES_DIALOG_CLASS(klass: Pointer): PAdwPreferencesDialogClass;
begin
  Result := PAdwPreferencesDialogClass(g_type_check_class_cast(klass, ADW_TYPE_PREFERENCES_DIALOG));
end;

function ADW_IS_PREFERENCES_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_PREFERENCES_DIALOG);
end;

function ADW_PREFERENCES_DIALOG_GET_CLASS(obj: Pointer): PAdwPreferencesDialogClass;
begin
  Result := PAdwPreferencesDialogClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
