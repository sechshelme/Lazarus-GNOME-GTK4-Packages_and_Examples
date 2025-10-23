{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwBanner, adw_banner, ADW, BANNER, GtkWidget) }
type
  TAdwBanner = record
  end;
  PAdwBanner = ^TAdwBanner;

  TAdwBannerClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwBannerClass = ^TAdwBannerClass;

function adw_banner_get_type: TGType; cdecl; external libadwaita;
function adw_banner_new(title: pchar): PGtkWidget; cdecl; external libadwaita;
function adw_banner_get_title(self: PAdwBanner): pchar; cdecl; external libadwaita;
procedure adw_banner_set_title(self: PAdwBanner; title: pchar); cdecl; external libadwaita;
function adw_banner_get_button_label(self: PAdwBanner): pchar; cdecl; external libadwaita;
procedure adw_banner_set_button_label(self: PAdwBanner; _label: pchar); cdecl; external libadwaita;
function adw_banner_get_revealed(self: PAdwBanner): Tgboolean; cdecl; external libadwaita;
procedure adw_banner_set_revealed(self: PAdwBanner; revealed: Tgboolean); cdecl; external libadwaita;
function adw_banner_get_use_markup(self: PAdwBanner): Tgboolean; cdecl; external libadwaita;
procedure adw_banner_set_use_markup(self: PAdwBanner; use_markup: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 14:39:49 ===

function ADW_TYPE_BANNER: TGType;
function ADW_BANNER(obj: Pointer): PAdwBanner;
function ADW_IS_BANNER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_BANNER: TGType;
begin
  Result := adw_banner_get_type;
end;

function ADW_BANNER(obj: Pointer): PAdwBanner;
begin
  Result := PAdwBanner(g_type_check_instance_cast(obj, ADW_TYPE_BANNER));
end;

function ADW_IS_BANNER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_BANNER);
end;


{$ENDIF read_implementation}
