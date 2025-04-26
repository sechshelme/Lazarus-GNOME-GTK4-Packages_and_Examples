{$IFDEF read_interface}



  {G_DECLARE_FINAL_TYPE (AdwViewStackPage, adw_view_stack_page, ADW, VIEW_STACK_PAGE, GObject) }
type
  TAdwViewStackPage = record
  end;
  PAdwViewStackPage = ^TAdwViewStackPage;

  TAdwViewStackPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdwViewStackPageClass = ^TAdwViewStackPageClass;

function adw_view_stack_page_get_type: TGType; cdecl; external libadwaita;
function adw_view_stack_page_get_child(self: PAdwViewStackPage): PGtkWidget; cdecl; external libadwaita;
function adw_view_stack_page_get_name(self: PAdwViewStackPage): pchar; cdecl; external libadwaita;
procedure adw_view_stack_page_set_name(self: PAdwViewStackPage; Name: pchar); cdecl; external libadwaita;
function adw_view_stack_page_get_title(self: PAdwViewStackPage): pchar; cdecl; external libadwaita;
procedure adw_view_stack_page_set_title(self: PAdwViewStackPage; title: pchar); cdecl; external libadwaita;
function adw_view_stack_page_get_use_underline(self: PAdwViewStackPage): Tgboolean; cdecl; external libadwaita;
procedure adw_view_stack_page_set_use_underline(self: PAdwViewStackPage; use_underline: Tgboolean); cdecl; external libadwaita;
function adw_view_stack_page_get_icon_name(self: PAdwViewStackPage): pchar; cdecl; external libadwaita;
procedure adw_view_stack_page_set_icon_name(self: PAdwViewStackPage; icon_name: pchar); cdecl; external libadwaita;
function adw_view_stack_page_get_needs_attention(self: PAdwViewStackPage): Tgboolean; cdecl; external libadwaita;
procedure adw_view_stack_page_set_needs_attention(self: PAdwViewStackPage; needs_attention: Tgboolean); cdecl; external libadwaita;
function adw_view_stack_page_get_badge_number(self: PAdwViewStackPage): Tguint; cdecl; external libadwaita;
procedure adw_view_stack_page_set_badge_number(self: PAdwViewStackPage; badge_number: Tguint); cdecl; external libadwaita;
function adw_view_stack_page_get_visible(self: PAdwViewStackPage): Tgboolean; cdecl; external libadwaita;
procedure adw_view_stack_page_set_visible(self: PAdwViewStackPage; Visible: Tgboolean); cdecl; external libadwaita;

{G_DECLARE_FINAL_TYPE (AdwViewStack, adw_view_stack, ADW, VIEW_STACK, GtkWidget) }
type
  TAdwViewStack = record
  end;
  PAdwViewStack = ^TAdwViewStack;

  TAdwViewStackClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwViewStackClass = ^TAdwViewStackClass;

function adw_view_stack_get_type: TGType; cdecl; external libadwaita;
function adw_view_stack_new: PGtkWidget; cdecl; external libadwaita;
function adw_view_stack_add(self: PAdwViewStack; child: PGtkWidget): PAdwViewStackPage; cdecl; external libadwaita;
function adw_view_stack_add_named(self: PAdwViewStack; child: PGtkWidget; Name: pchar): PAdwViewStackPage; cdecl; external libadwaita;
function adw_view_stack_add_titled(self: PAdwViewStack; child: PGtkWidget; Name: pchar; title: pchar): PAdwViewStackPage; cdecl; external libadwaita;
function adw_view_stack_add_titled_with_icon(self: PAdwViewStack; child: PGtkWidget; Name: pchar; title: pchar; icon_name: pchar): PAdwViewStackPage; cdecl; external libadwaita;
procedure adw_view_stack_remove(self: PAdwViewStack; child: PGtkWidget); cdecl; external libadwaita;
function adw_view_stack_get_page(self: PAdwViewStack; child: PGtkWidget): PAdwViewStackPage; cdecl; external libadwaita;
function adw_view_stack_get_child_by_name(self: PAdwViewStack; Name: pchar): PGtkWidget; cdecl; external libadwaita;
function adw_view_stack_get_visible_child(self: PAdwViewStack): PGtkWidget; cdecl; external libadwaita;
procedure adw_view_stack_set_visible_child(self: PAdwViewStack; child: PGtkWidget); cdecl; external libadwaita;
function adw_view_stack_get_visible_child_name(self: PAdwViewStack): pchar; cdecl; external libadwaita;
procedure adw_view_stack_set_visible_child_name(self: PAdwViewStack; Name: pchar); cdecl; external libadwaita;
function adw_view_stack_get_hhomogeneous(self: PAdwViewStack): Tgboolean; cdecl; external libadwaita;
procedure adw_view_stack_set_hhomogeneous(self: PAdwViewStack; hhomogeneous: Tgboolean); cdecl; external libadwaita;
function adw_view_stack_get_vhomogeneous(self: PAdwViewStack): Tgboolean; cdecl; external libadwaita;
procedure adw_view_stack_set_vhomogeneous(self: PAdwViewStack; vhomogeneous: Tgboolean); cdecl; external libadwaita;
function adw_view_stack_get_pages(self: PAdwViewStack): PGtkSelectionModel; cdecl; external libadwaita;

{G_DECLARE_FINAL_TYPE (AdwViewStackPages, adw_view_stack_pages, ADW, VIEW_STACK_PAGES, GObject) }
type
  TAdwViewStackPages = record
  end;
  PAdwViewStackPages = ^TAdwViewStackPages;

  TAdwViewStackPagesClass = record
    parent_class: TGObjectClass;
  end;
  PAdwViewStackPagesClass = ^TAdwViewStackPagesClass;

function adw_view_stack_pages_get_type: TGType; cdecl; external libadwaita;
function adw_view_stack_pages_get_selected_page(self: PAdwViewStackPages): PAdwViewStackPage; cdecl; external libadwaita;
procedure adw_view_stack_pages_set_selected_page(self: PAdwViewStackPages; page: PAdwViewStackPage); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:34:36 ===

function ADW_TYPE_VIEW_STACK_PAGE: TGType;
function ADW_VIEW_STACK_PAGE(obj: Pointer): PAdwViewStackPage;
function ADW_IS_VIEW_STACK_PAGE(obj: Pointer): Tgboolean;

function ADW_TYPE_VIEW_STACK: TGType;
function ADW_VIEW_STACK(obj: Pointer): PAdwViewStack;
function ADW_IS_VIEW_STACK(obj: Pointer): Tgboolean;

function ADW_TYPE_VIEW_STACK_PAGES: TGType;
function ADW_VIEW_STACK_PAGES(obj: Pointer): PAdwViewStackPages;
function ADW_IS_VIEW_STACK_PAGES(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_VIEW_STACK_PAGE: TGType;
begin
  Result := adw_view_stack_page_get_type;
end;

function ADW_VIEW_STACK_PAGE(obj: Pointer): PAdwViewStackPage;
begin
  Result := PAdwViewStackPage(g_type_check_instance_cast(obj, ADW_TYPE_VIEW_STACK_PAGE));
end;

function ADW_IS_VIEW_STACK_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_VIEW_STACK_PAGE);
end;

// ====

function ADW_TYPE_VIEW_STACK: TGType;
begin
  Result := adw_view_stack_get_type;
end;

function ADW_VIEW_STACK(obj: Pointer): PAdwViewStack;
begin
  Result := PAdwViewStack(g_type_check_instance_cast(obj, ADW_TYPE_VIEW_STACK));
end;

function ADW_IS_VIEW_STACK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_VIEW_STACK);
end;

// ====

function ADW_TYPE_VIEW_STACK_PAGES: TGType;
begin
  Result := adw_view_stack_pages_get_type;
end;

function ADW_VIEW_STACK_PAGES(obj: Pointer): PAdwViewStackPages;
begin
  Result := PAdwViewStackPages(g_type_check_instance_cast(obj, ADW_TYPE_VIEW_STACK_PAGES));
end;

function ADW_IS_VIEW_STACK_PAGES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_VIEW_STACK_PAGES);
end;


{$ENDIF read_implementation}
