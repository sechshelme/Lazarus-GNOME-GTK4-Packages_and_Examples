unit adw_preferences_page;

interface

uses
  fp_glib2, fp_GTK4, adw_preferences_group;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {G_DECLARE_DERIVABLE_TYPE (AdwPreferencesPage, adw_preferences_page, ADW, PREFERENCES_PAGE, GtkWidget) }
type
  TAdwPreferencesPageClass = record
    parent_class: TGtkWidgetClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwPreferencesPageClass = ^TAdwPreferencesPageClass;

  TAdwPreferencesPage = record
    parent_instance: TGtkWidget;
  end;
  PAdwPreferencesPage = ^TAdwPreferencesPage;

function adw_preferences_page_get_type: TGType; cdecl; external libadwaita;
function adw_preferences_page_new: PGtkWidget; cdecl; external libadwaita;
procedure adw_preferences_page_add(self: PAdwPreferencesPage; group: PAdwPreferencesGroup); cdecl; external libadwaita;
procedure adw_preferences_page_remove(self: PAdwPreferencesPage; group: PAdwPreferencesGroup); cdecl; external libadwaita;
function adw_preferences_page_get_icon_name(self: PAdwPreferencesPage): pchar; cdecl; external libadwaita;
procedure adw_preferences_page_set_icon_name(self: PAdwPreferencesPage; icon_name: pchar); cdecl; external libadwaita;
function adw_preferences_page_get_title(self: PAdwPreferencesPage): pchar; cdecl; external libadwaita;
procedure adw_preferences_page_set_title(self: PAdwPreferencesPage; title: pchar); cdecl; external libadwaita;
function adw_preferences_page_get_description(self: PAdwPreferencesPage): pchar; cdecl; external libadwaita;
procedure adw_preferences_page_set_description(self: PAdwPreferencesPage; description: pchar); cdecl; external libadwaita;
function adw_preferences_page_get_name(self: PAdwPreferencesPage): pchar; cdecl; external libadwaita;
procedure adw_preferences_page_set_name(self: PAdwPreferencesPage; Name: pchar); cdecl; external libadwaita;
function adw_preferences_page_get_use_underline(self: PAdwPreferencesPage): Tgboolean; cdecl; external libadwaita;
procedure adw_preferences_page_set_use_underline(self: PAdwPreferencesPage; use_underline: Tgboolean); cdecl; external libadwaita;
procedure adw_preferences_page_scroll_to_top(self: PAdwPreferencesPage); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 20:04:48 ===

function ADW_TYPE_PREFERENCES_PAGE: TGType;
function ADW_PREFERENCES_PAGE(obj: Pointer): PAdwPreferencesPage;
function ADW_IS_PREFERENCES_PAGE(obj: Pointer): Tgboolean;
function ADW_PREFERENCES_PAGE_CLASS(klass: Pointer): PAdwPreferencesPageClass;
function ADW_IS_PREFERENCES_PAGE_CLASS(klass: Pointer): Tgboolean;
function ADW_PREFERENCES_PAGE_GET_CLASS(obj: Pointer): PAdwPreferencesPageClass;

implementation

function ADW_TYPE_PREFERENCES_PAGE: TGType;
begin
  Result := adw_preferences_page_get_type;
end;

function ADW_PREFERENCES_PAGE(obj: Pointer): PAdwPreferencesPage;
begin
  Result := PAdwPreferencesPage(g_type_check_instance_cast(obj, ADW_TYPE_PREFERENCES_PAGE));
end;

function ADW_IS_PREFERENCES_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_PREFERENCES_PAGE);
end;

function ADW_PREFERENCES_PAGE_CLASS(klass: Pointer): PAdwPreferencesPageClass;
begin
  Result := PAdwPreferencesPageClass(g_type_check_class_cast(klass, ADW_TYPE_PREFERENCES_PAGE));
end;

function ADW_IS_PREFERENCES_PAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_PREFERENCES_PAGE);
end;

function ADW_PREFERENCES_PAGE_GET_CLASS(obj: Pointer): PAdwPreferencesPageClass;
begin
  Result := PAdwPreferencesPageClass(PGTypeInstance(obj)^.g_class);
end;


end.
