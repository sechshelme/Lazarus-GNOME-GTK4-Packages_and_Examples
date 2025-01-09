unit adw_leaflet;

interface

uses
  fp_glib2, fp_GTK4, adw_fold_threshold_policy, adw_spring_params, adw_navigation_direction;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (AdwLeafletPage, adw_leaflet_page, ADW, LEAFLET_PAGE, GObject) }
type
  TAdwLeafletPage = record
  end;
  PAdwLeafletPage = ^TAdwLeafletPage;

  TAdwLeafletPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdwLeafletPageClass = ^TAdwLeafletPageClass;

function adw_leaflet_page_get_type: TGType; cdecl; external libadwaita;
function adw_leaflet_page_get_child(self: PAdwLeafletPage): PGtkWidget; cdecl; external libadwaita;
function adw_leaflet_page_get_name(self: PAdwLeafletPage): pchar; cdecl; external libadwaita;
procedure adw_leaflet_page_set_name(self: PAdwLeafletPage; Name: pchar); cdecl; external libadwaita;
function adw_leaflet_page_get_navigatable(self: PAdwLeafletPage): Tgboolean; cdecl; external libadwaita;
procedure adw_leaflet_page_set_navigatable(self: PAdwLeafletPage; navigatable: Tgboolean); cdecl; external libadwaita;

{G_DECLARE_FINAL_TYPE (AdwLeaflet, adw_leaflet, ADW, LEAFLET, GtkWidget) }
type
  PAdwLeafletTransitionType = ^TAdwLeafletTransitionType;
  TAdwLeafletTransitionType = longint;

const
  ADW_LEAFLET_TRANSITION_TYPE_OVER = 0;
  ADW_LEAFLET_TRANSITION_TYPE_UNDER = 1;
  ADW_LEAFLET_TRANSITION_TYPE_SLIDE = 2;

type
  TAdwLeaflet = record
  end;
  PAdwLeaflet = ^TAdwLeaflet;

  TAdwLeafletClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwLeafletClass = ^TAdwLeafletClass;

function adw_leaflet_get_type: TGType; cdecl; external libadwaita;
function adw_leaflet_new: PGtkWidget; cdecl; external libadwaita;
function adw_leaflet_append(self: PAdwLeaflet; child: PGtkWidget): PAdwLeafletPage; cdecl; external libadwaita;
function adw_leaflet_prepend(self: PAdwLeaflet; child: PGtkWidget): PAdwLeafletPage; cdecl; external libadwaita;
function adw_leaflet_insert_child_after(self: PAdwLeaflet; child: PGtkWidget; sibling: PGtkWidget): PAdwLeafletPage; cdecl; external libadwaita;
procedure adw_leaflet_reorder_child_after(self: PAdwLeaflet; child: PGtkWidget; sibling: PGtkWidget); cdecl; external libadwaita;
procedure adw_leaflet_remove(self: PAdwLeaflet; child: PGtkWidget); cdecl; external libadwaita;
function adw_leaflet_get_page(self: PAdwLeaflet; child: PGtkWidget): PAdwLeafletPage; cdecl; external libadwaita;
function adw_leaflet_get_can_unfold(self: PAdwLeaflet): Tgboolean; cdecl; external libadwaita;
procedure adw_leaflet_set_can_unfold(self: PAdwLeaflet; can_unfold: Tgboolean); cdecl; external libadwaita;
function adw_leaflet_get_folded(self: PAdwLeaflet): Tgboolean; cdecl; external libadwaita;
function adw_leaflet_get_fold_threshold_policy(self: PAdwLeaflet): TAdwFoldThresholdPolicy; cdecl; external libadwaita;
procedure adw_leaflet_set_fold_threshold_policy(self: PAdwLeaflet; policy: TAdwFoldThresholdPolicy); cdecl; external libadwaita;
function adw_leaflet_get_homogeneous(self: PAdwLeaflet): Tgboolean; cdecl; external libadwaita;
procedure adw_leaflet_set_homogeneous(self: PAdwLeaflet; homogeneous: Tgboolean); cdecl; external libadwaita;
function adw_leaflet_get_visible_child(self: PAdwLeaflet): PGtkWidget; cdecl; external libadwaita;
procedure adw_leaflet_set_visible_child(self: PAdwLeaflet; visible_child: PGtkWidget); cdecl; external libadwaita;
function adw_leaflet_get_visible_child_name(self: PAdwLeaflet): pchar; cdecl; external libadwaita;
procedure adw_leaflet_set_visible_child_name(self: PAdwLeaflet; Name: pchar); cdecl; external libadwaita;
function adw_leaflet_get_transition_type(self: PAdwLeaflet): TAdwLeafletTransitionType; cdecl; external libadwaita;
procedure adw_leaflet_set_transition_type(self: PAdwLeaflet; transition: TAdwLeafletTransitionType); cdecl; external libadwaita;
function adw_leaflet_get_mode_transition_duration(self: PAdwLeaflet): Tguint; cdecl; external libadwaita;
procedure adw_leaflet_set_mode_transition_duration(self: PAdwLeaflet; duration: Tguint); cdecl; external libadwaita;
function adw_leaflet_get_child_transition_params(self: PAdwLeaflet): PAdwSpringParams; cdecl; external libadwaita;
procedure adw_leaflet_set_child_transition_params(self: PAdwLeaflet; params: PAdwSpringParams); cdecl; external libadwaita;
function adw_leaflet_get_child_transition_running(self: PAdwLeaflet): Tgboolean; cdecl; external libadwaita;
function adw_leaflet_get_can_navigate_back(self: PAdwLeaflet): Tgboolean; cdecl; external libadwaita;
procedure adw_leaflet_set_can_navigate_back(self: PAdwLeaflet; can_navigate_back: Tgboolean); cdecl; external libadwaita;
function adw_leaflet_get_can_navigate_forward(self: PAdwLeaflet): Tgboolean; cdecl; external libadwaita;
procedure adw_leaflet_set_can_navigate_forward(self: PAdwLeaflet; can_navigate_forward: Tgboolean); cdecl; external libadwaita;
function adw_leaflet_get_adjacent_child(self: PAdwLeaflet; direction: TAdwNavigationDirection): PGtkWidget; cdecl; external libadwaita;
function adw_leaflet_navigate(self: PAdwLeaflet; direction: TAdwNavigationDirection): Tgboolean; cdecl; external libadwaita;
function adw_leaflet_get_child_by_name(self: PAdwLeaflet; Name: pchar): PGtkWidget; cdecl; external libadwaita;
function adw_leaflet_get_pages(self: PAdwLeaflet): PGtkSelectionModel; cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:15:00 ===

function ADW_TYPE_LEAFLET_PAGE: TGType;
function ADW_LEAFLET_PAGE(obj: Pointer): PAdwLeafletPage;
function ADW_IS_LEAFLET_PAGE(obj: Pointer): Tgboolean;

function ADW_TYPE_LEAFLET: TGType;
function ADW_LEAFLET(obj: Pointer): PAdwLeaflet;
function ADW_IS_LEAFLET(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_LEAFLET_PAGE: TGType;
begin
  Result := adw_leaflet_page_get_type;
end;

function ADW_LEAFLET_PAGE(obj: Pointer): PAdwLeafletPage;
begin
  Result := PAdwLeafletPage(g_type_check_instance_cast(obj, ADW_TYPE_LEAFLET_PAGE));
end;

function ADW_IS_LEAFLET_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_LEAFLET_PAGE);
end;

// ====

function ADW_TYPE_LEAFLET: TGType;
begin
  Result := adw_leaflet_get_type;
end;

function ADW_LEAFLET(obj: Pointer): PAdwLeaflet;
begin
  Result := PAdwLeaflet(g_type_check_instance_cast(obj, ADW_TYPE_LEAFLET));
end;

function ADW_IS_LEAFLET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_LEAFLET);
end;

end.
