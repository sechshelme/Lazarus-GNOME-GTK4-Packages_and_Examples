unit adap_preferences_dialog;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_dialog, adap_preferences_page, adap_navigation_view, adap_toast;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapPreferencesDialog = record
    parent_instance: TAdapDialog;
  end;
  PAdapPreferencesDialog = ^TAdapPreferencesDialog;

  TAdapPreferencesDialogClass = record
    parent_class: TAdapDialogClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdapPreferencesDialogClass = ^TAdapPreferencesDialogClass;

function adap_preferences_dialog_get_type: TGType; cdecl; external libadapta;
function adap_preferences_dialog_new: PAdapDialog; cdecl; external libadapta;
procedure adap_preferences_dialog_add(self: PAdapPreferencesDialog; page: PAdapPreferencesPage); cdecl; external libadapta;
procedure adap_preferences_dialog_remove(self: PAdapPreferencesDialog; page: PAdapPreferencesPage); cdecl; external libadapta;
function adap_preferences_dialog_get_visible_page(self: PAdapPreferencesDialog): PAdapPreferencesPage; cdecl; external libadapta;
procedure adap_preferences_dialog_set_visible_page(self: PAdapPreferencesDialog; page: PAdapPreferencesPage); cdecl; external libadapta;
function adap_preferences_dialog_get_visible_page_name(self: PAdapPreferencesDialog): pchar; cdecl; external libadapta;
procedure adap_preferences_dialog_set_visible_page_name(self: PAdapPreferencesDialog; name: pchar); cdecl; external libadapta;
function adap_preferences_dialog_get_search_enabled(self: PAdapPreferencesDialog): Tgboolean; cdecl; external libadapta;
procedure adap_preferences_dialog_set_search_enabled(self: PAdapPreferencesDialog; search_enabled: Tgboolean); cdecl; external libadapta;
procedure adap_preferences_dialog_push_subpage(self: PAdapPreferencesDialog; page: PAdapNavigationPage); cdecl; external libadapta;
function adap_preferences_dialog_pop_subpage(self: PAdapPreferencesDialog): Tgboolean; cdecl; external libadapta;
procedure adap_preferences_dialog_add_toast(self: PAdapPreferencesDialog; toast: PAdapToast); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:24 ===

function ADAP_TYPE_PREFERENCES_DIALOG: TGType;
function ADAP_PREFERENCES_DIALOG(obj: Pointer): PAdapPreferencesDialog;
function ADAP_IS_PREFERENCES_DIALOG(obj: Pointer): Tgboolean;
function ADAP_PREFERENCES_DIALOG_CLASS(klass: Pointer): PAdapPreferencesDialogClass;
function ADAP_IS_PREFERENCES_DIALOG_CLASS(klass: Pointer): Tgboolean;
function ADAP_PREFERENCES_DIALOG_GET_CLASS(obj: Pointer): PAdapPreferencesDialogClass;

implementation

function ADAP_TYPE_PREFERENCES_DIALOG: TGType;
begin
  Result := adap_preferences_dialog_get_type;
end;

function ADAP_PREFERENCES_DIALOG(obj: Pointer): PAdapPreferencesDialog;
begin
  Result := PAdapPreferencesDialog(g_type_check_instance_cast(obj, ADAP_TYPE_PREFERENCES_DIALOG));
end;

function ADAP_IS_PREFERENCES_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_PREFERENCES_DIALOG);
end;

function ADAP_PREFERENCES_DIALOG_CLASS(klass: Pointer): PAdapPreferencesDialogClass;
begin
  Result := PAdapPreferencesDialogClass(g_type_check_class_cast(klass, ADAP_TYPE_PREFERENCES_DIALOG));
end;

function ADAP_IS_PREFERENCES_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_PREFERENCES_DIALOG);
end;

function ADAP_PREFERENCES_DIALOG_GET_CLASS(obj: Pointer): PAdapPreferencesDialogClass;
begin
  Result := PAdapPreferencesDialogClass(PGTypeInstance(obj)^.g_class);
end;


end.
