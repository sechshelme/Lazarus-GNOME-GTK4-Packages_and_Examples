unit adw_style_manager;

interface

uses
  fp_glib2, fp_GDK4, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PAdwColorScheme = ^TAdwColorScheme;
  TAdwColorScheme = longint;

const
  ADW_COLOR_SCHEME_DEFAULT = 0;
  ADW_COLOR_SCHEME_FORCE_LIGHT = 1;
  ADW_COLOR_SCHEME_PREFER_LIGHT = 2;
  ADW_COLOR_SCHEME_PREFER_DARK = 3;
  ADW_COLOR_SCHEME_FORCE_DARK = 4;


  {G_DECLARE_FINAL_TYPE (AdwStyleManager, adw_style_manager, ADW, STYLE_MANAGER, GObject) }
type
  TAdwStyleManager = record
  end;
  PAdwStyleManager = ^TAdwStyleManager;

  TAdwStyleManagerClass = record
    parent_class: TGObjectClass;
  end;
  PAdwStyleManagerClass = ^TAdwStyleManagerClass;

function adw_style_manager_get_type: TGType; cdecl; external libadwaita;
function adw_style_manager_get_default: PAdwStyleManager; cdecl; external libadwaita;
function adw_style_manager_get_for_display(display: PGdkDisplay): PAdwStyleManager; cdecl; external libadwaita;
function adw_style_manager_get_display(self: PAdwStyleManager): PGdkDisplay; cdecl; external libadwaita;
function adw_style_manager_get_color_scheme(self: PAdwStyleManager): TAdwColorScheme; cdecl; external libadwaita;
procedure adw_style_manager_set_color_scheme(self: PAdwStyleManager; color_scheme: TAdwColorScheme); cdecl; external libadwaita;
function adw_style_manager_get_system_supports_color_schemes(self: PAdwStyleManager): Tgboolean; cdecl; external libadwaita;
function adw_style_manager_get_dark(self: PAdwStyleManager): Tgboolean; cdecl; external libadwaita;
function adw_style_manager_get_high_contrast(self: PAdwStyleManager): Tgboolean; cdecl; external libadwaita;

// === Konventiert am: 8-1-25 19:36:59 ===

function ADW_TYPE_STYLE_MANAGER: TGType;
function ADW_STYLE_MANAGER(obj: Pointer): PAdwStyleManager;
function ADW_IS_STYLE_MANAGER(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_STYLE_MANAGER: TGType;
begin
  Result := adw_style_manager_get_type;
end;

function ADW_STYLE_MANAGER(obj: Pointer): PAdwStyleManager;
begin
  Result := PAdwStyleManager(g_type_check_instance_cast(obj, ADW_TYPE_STYLE_MANAGER));
end;

function ADW_IS_STYLE_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_STYLE_MANAGER);
end;


end.
