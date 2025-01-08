unit adw_header_bar;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (AdwHeaderBar, adw_header_bar, ADW, HEADER_BAR, GtkWidget) }
type
  PAdwCenteringPolicy = ^TAdwCenteringPolicy;
  TAdwCenteringPolicy = longint;

const
  ADW_CENTERING_POLICY_LOOSE = 0;
  ADW_CENTERING_POLICY_STRICT = 1;


type
  TAdwHeaderBar = record
  end;
  PAdwHeaderBar = ^TAdwHeaderBar;

  TAdwHeaderBarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwHeaderBarClass = ^TAdwHeaderBarClass;

function adw_header_bar_get_type: TGType; cdecl; external libadwaita;
function adw_header_bar_new: PGtkWidget; cdecl; external libadwaita;
procedure adw_header_bar_pack_start(self: PAdwHeaderBar; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_header_bar_pack_end(self: PAdwHeaderBar; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_header_bar_remove(self: PAdwHeaderBar; child: PGtkWidget); cdecl; external libadwaita;
function adw_header_bar_get_title_widget(self: PAdwHeaderBar): PGtkWidget; cdecl; external libadwaita;
procedure adw_header_bar_set_title_widget(self: PAdwHeaderBar; title_widget: PGtkWidget); cdecl; external libadwaita;
function adw_header_bar_get_show_start_title_buttons(self: PAdwHeaderBar): Tgboolean; cdecl; external libadwaita;
procedure adw_header_bar_set_show_start_title_buttons(self: PAdwHeaderBar; setting: Tgboolean); cdecl; external libadwaita;
function adw_header_bar_get_show_end_title_buttons(self: PAdwHeaderBar): Tgboolean; cdecl; external libadwaita;
procedure adw_header_bar_set_show_end_title_buttons(self: PAdwHeaderBar; setting: Tgboolean); cdecl; external libadwaita;
function adw_header_bar_get_show_back_button(self: PAdwHeaderBar): Tgboolean; cdecl; external libadwaita;
procedure adw_header_bar_set_show_back_button(self: PAdwHeaderBar; show_back_button: Tgboolean); cdecl; external libadwaita;
function adw_header_bar_get_decoration_layout(self: PAdwHeaderBar): pchar; cdecl; external libadwaita;
procedure adw_header_bar_set_decoration_layout(self: PAdwHeaderBar; layout: pchar); cdecl; external libadwaita;
function adw_header_bar_get_centering_policy(self: PAdwHeaderBar): TAdwCenteringPolicy; cdecl; external libadwaita;
procedure adw_header_bar_set_centering_policy(self: PAdwHeaderBar; centering_policy: TAdwCenteringPolicy); cdecl; external libadwaita;
function adw_header_bar_get_show_title(self: PAdwHeaderBar): Tgboolean; cdecl; external libadwaita;
procedure adw_header_bar_set_show_title(self: PAdwHeaderBar; show_title: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 8-1-25 19:23:44 ===

function ADW_TYPE_HEADER_BAR: TGType;
function ADW_HEADER_BAR(obj: Pointer): PAdwHeaderBar;
function ADW_IS_HEADER_BAR(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_HEADER_BAR: TGType;
begin
  Result := adw_header_bar_get_type;
end;

function ADW_HEADER_BAR(obj: Pointer): PAdwHeaderBar;
begin
  Result := PAdwHeaderBar(g_type_check_instance_cast(obj, ADW_TYPE_HEADER_BAR));
end;

function ADW_IS_HEADER_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_HEADER_BAR);
end;


end.
