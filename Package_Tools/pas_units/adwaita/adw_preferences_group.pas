unit adw_preferences_group;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {G_DECLARE_DERIVABLE_TYPE (AdwPreferencesGroup, adw_preferences_group, ADW, PREFERENCES_GROUP, GtkWidget) }
type
  TAdwPreferencesGroupClass = record
    parent_class: TGtkWidgetClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwPreferencesGroupClass = ^TAdwPreferencesGroupClass;

  TAdwPreferencesGroup = record
    parent_instance: TGtkWidget;
  end;
  PAdwPreferencesGroup = ^TAdwPreferencesGroup;

function adw_preferences_group_get_type: TGType; cdecl; external libadwaita;
function adw_preferences_group_new: PGtkWidget; cdecl; external libadwaita;
procedure adw_preferences_group_add(self: PAdwPreferencesGroup; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_preferences_group_remove(self: PAdwPreferencesGroup; child: PGtkWidget); cdecl; external libadwaita;
function adw_preferences_group_get_title(self: PAdwPreferencesGroup): pchar; cdecl; external libadwaita;
procedure adw_preferences_group_set_title(self: PAdwPreferencesGroup; title: pchar); cdecl; external libadwaita;
function adw_preferences_group_get_description(self: PAdwPreferencesGroup): pchar; cdecl; external libadwaita;
procedure adw_preferences_group_set_description(self: PAdwPreferencesGroup; description: pchar); cdecl; external libadwaita;
function adw_preferences_group_get_header_suffix(self: PAdwPreferencesGroup): PGtkWidget; cdecl; external libadwaita;
procedure adw_preferences_group_set_header_suffix(self: PAdwPreferencesGroup; suffix: PGtkWidget); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 20:06:34 ===

function ADW_TYPE_PREFERENCES_GROUP: TGType;
function ADW_PREFERENCES_GROUP(obj: Pointer): PAdwPreferencesGroup;
function ADW_IS_PREFERENCES_GROUP(obj: Pointer): Tgboolean;
function ADW_PREFERENCES_GROUP_CLASS(klass: Pointer): PAdwPreferencesGroupClass;
function ADW_IS_PREFERENCES_GROUP_CLASS(klass: Pointer): Tgboolean;
function ADW_PREFERENCES_GROUP_GET_CLASS(obj: Pointer): PAdwPreferencesGroupClass;

implementation

function ADW_TYPE_PREFERENCES_GROUP: TGType;
begin
  Result := adw_preferences_group_get_type;
end;

function ADW_PREFERENCES_GROUP(obj: Pointer): PAdwPreferencesGroup;
begin
  Result := PAdwPreferencesGroup(g_type_check_instance_cast(obj, ADW_TYPE_PREFERENCES_GROUP));
end;

function ADW_IS_PREFERENCES_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_PREFERENCES_GROUP);
end;

function ADW_PREFERENCES_GROUP_CLASS(klass: Pointer): PAdwPreferencesGroupClass;
begin
  Result := PAdwPreferencesGroupClass(g_type_check_class_cast(klass, ADW_TYPE_PREFERENCES_GROUP));
end;

function ADW_IS_PREFERENCES_GROUP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_PREFERENCES_GROUP);
end;

function ADW_PREFERENCES_GROUP_GET_CLASS(obj: Pointer): PAdwPreferencesGroupClass;
begin
  Result := PAdwPreferencesGroupClass(PGTypeInstance(obj)^.g_class);
end;


end.
