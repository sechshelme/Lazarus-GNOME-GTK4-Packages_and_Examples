unit adw_navigation_view;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_DERIVABLE_TYPE (AdwNavigationPage, adw_navigation_page, ADW, NAVIGATION_PAGE, GtkWidget) }
type
  TAdwNavigationPage = record
    parent_instance: TGtkWidget;
  end;
  PAdwNavigationPage = ^TAdwNavigationPage;
  PPAdwNavigationPage = ^PAdwNavigationPage;

  TAdwNavigationPageClass = record
    parent_class: TGtkWidgetClass;
    showing: procedure(self: PAdwNavigationPage); cdecl;
    shown: procedure(self: PAdwNavigationPage); cdecl;
    hiding: procedure(self: PAdwNavigationPage); cdecl;
    hidden: procedure(self: PAdwNavigationPage); cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  PAdwNavigationPageClass = ^TAdwNavigationPageClass;

function adw_navigation_page_get_type: TGType; cdecl; external libadwaita;
function adw_navigation_page_new(child: PGtkWidget; title: pchar): PAdwNavigationPage; cdecl; external libadwaita;
function adw_navigation_page_new_with_tag(child: PGtkWidget; title: pchar; tag: pchar): PAdwNavigationPage; cdecl; external libadwaita;
function adw_navigation_page_get_child(self: PAdwNavigationPage): PGtkWidget; cdecl; external libadwaita;
procedure adw_navigation_page_set_child(self: PAdwNavigationPage; child: PGtkWidget); cdecl; external libadwaita;
function adw_navigation_page_get_tag(self: PAdwNavigationPage): pchar; cdecl; external libadwaita;
procedure adw_navigation_page_set_tag(self: PAdwNavigationPage; tag: pchar); cdecl; external libadwaita;
function adw_navigation_page_get_title(self: PAdwNavigationPage): pchar; cdecl; external libadwaita;
procedure adw_navigation_page_set_title(self: PAdwNavigationPage; title: pchar); cdecl; external libadwaita;
function adw_navigation_page_get_can_pop(self: PAdwNavigationPage): Tgboolean; cdecl; external libadwaita;
procedure adw_navigation_page_set_can_pop(self: PAdwNavigationPage; can_pop: Tgboolean); cdecl; external libadwaita;

{G_DECLARE_FINAL_TYPE (AdwNavigationView, adw_navigation_view, ADW, NAVIGATION_VIEW, GtkWidget) }
type
  TAdwNavigationView = record
  end;
  PAdwNavigationView = ^TAdwNavigationView;

  TAdwNavigationViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwNavigationViewClass = ^TAdwNavigationViewClass;

function adw_navigation_view_get_type: TGType; cdecl; external libadwaita;
function adw_navigation_view_new: PGtkWidget; cdecl; external libadwaita;
procedure adw_navigation_view_add(self: PAdwNavigationView; page: PAdwNavigationPage); cdecl; external libadwaita;
procedure adw_navigation_view_remove(self: PAdwNavigationView; page: PAdwNavigationPage); cdecl; external libadwaita;
function adw_navigation_view_find_page(self: PAdwNavigationView; tag: pchar): PAdwNavigationPage; cdecl; external libadwaita;
procedure adw_navigation_view_push(self: PAdwNavigationView; page: PAdwNavigationPage); cdecl; external libadwaita;
procedure adw_navigation_view_push_by_tag(self: PAdwNavigationView; tag: pchar); cdecl; external libadwaita;
function adw_navigation_view_pop(self: PAdwNavigationView): Tgboolean; cdecl; external libadwaita;
function adw_navigation_view_pop_to_page(self: PAdwNavigationView; page: PAdwNavigationPage): Tgboolean; cdecl; external libadwaita;
function adw_navigation_view_pop_to_tag(self: PAdwNavigationView; tag: pchar): Tgboolean; cdecl; external libadwaita;
procedure adw_navigation_view_replace(self: PAdwNavigationView; pages: PPAdwNavigationPage; n_pages: longint); cdecl; external libadwaita;
procedure adw_navigation_view_replace_with_tags(self: PAdwNavigationView; tags: PPchar; n_tags: longint); cdecl; external libadwaita;
function adw_navigation_view_get_visible_page(self: PAdwNavigationView): PAdwNavigationPage; cdecl; external libadwaita;
function adw_navigation_view_get_previous_page(self: PAdwNavigationView; page: PAdwNavigationPage): PAdwNavigationPage; cdecl; external libadwaita;
function adw_navigation_view_get_animate_transitions(self: PAdwNavigationView): Tgboolean; cdecl; external libadwaita;
procedure adw_navigation_view_set_animate_transitions(self: PAdwNavigationView; animate_transitions: Tgboolean); cdecl; external libadwaita;
function adw_navigation_view_get_pop_on_escape(self: PAdwNavigationView): Tgboolean; cdecl; external libadwaita;
procedure adw_navigation_view_set_pop_on_escape(self: PAdwNavigationView; pop_on_escape: Tgboolean); cdecl; external libadwaita;
function adw_navigation_view_get_navigation_stack(self: PAdwNavigationView): PGListModel; cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:34:30 ===

function ADW_TYPE_NAVIGATION_PAGE: TGType;
function ADW_NAVIGATION_PAGE(obj: Pointer): PAdwNavigationPage;
function ADW_IS_NAVIGATION_PAGE(obj: Pointer): Tgboolean;
function ADW_NAVIGATION_PAGE_CLASS(klass: Pointer): PAdwNavigationPageClass;
function ADW_IS_NAVIGATION_PAGE_CLASS(klass: Pointer): Tgboolean;
function ADW_NAVIGATION_PAGE_GET_CLASS(obj: Pointer): PAdwNavigationPageClass;

function ADW_TYPE_NAVIGATION_VIEW: TGType;
function ADW_NAVIGATION_VIEW(obj: Pointer): PAdwNavigationView;
function ADW_IS_NAVIGATION_VIEW(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_NAVIGATION_PAGE: TGType;
begin
  Result := adw_navigation_page_get_type;
end;

function ADW_NAVIGATION_PAGE(obj: Pointer): PAdwNavigationPage;
begin
  Result := PAdwNavigationPage(g_type_check_instance_cast(obj, ADW_TYPE_NAVIGATION_PAGE));
end;

function ADW_IS_NAVIGATION_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_NAVIGATION_PAGE);
end;

function ADW_NAVIGATION_PAGE_CLASS(klass: Pointer): PAdwNavigationPageClass;
begin
  Result := PAdwNavigationPageClass(g_type_check_class_cast(klass, ADW_TYPE_NAVIGATION_PAGE));
end;

function ADW_IS_NAVIGATION_PAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_NAVIGATION_PAGE);
end;

function ADW_NAVIGATION_PAGE_GET_CLASS(obj: Pointer): PAdwNavigationPageClass;
begin
  Result := PAdwNavigationPageClass(PGTypeInstance(obj)^.g_class);
end;

// =====

function ADW_TYPE_NAVIGATION_VIEW: TGType;
begin
  Result := adw_navigation_view_get_type;
end;

function ADW_NAVIGATION_VIEW(obj: Pointer): PAdwNavigationView;
begin
  Result := PAdwNavigationView(g_type_check_instance_cast(obj, ADW_TYPE_NAVIGATION_VIEW));
end;

function ADW_IS_NAVIGATION_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_NAVIGATION_VIEW);
end;

end.
