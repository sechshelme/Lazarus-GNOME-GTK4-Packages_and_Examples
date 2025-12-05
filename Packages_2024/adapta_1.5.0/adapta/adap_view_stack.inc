{$IFDEF read_interface}


type
  TAdapViewStackPage = record
  end;
  PAdapViewStackPage = ^TAdapViewStackPage;

  TAdapViewStackPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdapViewStackPageClass = ^TAdapViewStackPageClass;

function adap_view_stack_page_get_type: TGType; cdecl; external libadapta;
function adap_view_stack_page_get_child(self: PAdapViewStackPage): PGtkWidget; cdecl; external libadapta;
function adap_view_stack_page_get_name(self: PAdapViewStackPage): pchar; cdecl; external libadapta;
procedure adap_view_stack_page_set_name(self: PAdapViewStackPage; name: pchar); cdecl; external libadapta;
function adap_view_stack_page_get_title(self: PAdapViewStackPage): pchar; cdecl; external libadapta;
procedure adap_view_stack_page_set_title(self: PAdapViewStackPage; title: pchar); cdecl; external libadapta;
function adap_view_stack_page_get_use_underline(self: PAdapViewStackPage): Tgboolean; cdecl; external libadapta;
procedure adap_view_stack_page_set_use_underline(self: PAdapViewStackPage; use_underline: Tgboolean); cdecl; external libadapta;
function adap_view_stack_page_get_icon_name(self: PAdapViewStackPage): pchar; cdecl; external libadapta;
procedure adap_view_stack_page_set_icon_name(self: PAdapViewStackPage; icon_name: pchar); cdecl; external libadapta;
function adap_view_stack_page_get_needs_attention(self: PAdapViewStackPage): Tgboolean; cdecl; external libadapta;
procedure adap_view_stack_page_set_needs_attention(self: PAdapViewStackPage; needs_attention: Tgboolean); cdecl; external libadapta;
function adap_view_stack_page_get_badge_number(self: PAdapViewStackPage): Tguint; cdecl; external libadapta;
procedure adap_view_stack_page_set_badge_number(self: PAdapViewStackPage; badge_number: Tguint); cdecl; external libadapta;
function adap_view_stack_page_get_visible(self: PAdapViewStackPage): Tgboolean; cdecl; external libadapta;
procedure adap_view_stack_page_set_visible(self: PAdapViewStackPage; visible: Tgboolean); cdecl; external libadapta;

type
  TAdapViewStack = record
  end;
  PAdapViewStack = ^TAdapViewStack;

  TAdapViewStackClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapViewStackClass = ^TAdapViewStackClass;

function adap_view_stack_get_type: TGType; cdecl; external libadapta;
function adap_view_stack_new: PGtkWidget; cdecl; external libadapta;
function adap_view_stack_add(self: PAdapViewStack; child: PGtkWidget): PAdapViewStackPage; cdecl; external libadapta;
function adap_view_stack_add_named(self: PAdapViewStack; child: PGtkWidget; name: pchar): PAdapViewStackPage; cdecl; external libadapta;
function adap_view_stack_add_titled(self: PAdapViewStack; child: PGtkWidget; name: pchar; title: pchar): PAdapViewStackPage; cdecl; external libadapta;
function adap_view_stack_add_titled_with_icon(self: PAdapViewStack; child: PGtkWidget; name: pchar; title: pchar; icon_name: pchar): PAdapViewStackPage; cdecl; external libadapta;
procedure adap_view_stack_remove(self: PAdapViewStack; child: PGtkWidget); cdecl; external libadapta;
function adap_view_stack_get_page(self: PAdapViewStack; child: PGtkWidget): PAdapViewStackPage; cdecl; external libadapta;
function adap_view_stack_get_child_by_name(self: PAdapViewStack; name: pchar): PGtkWidget; cdecl; external libadapta;
function adap_view_stack_get_visible_child(self: PAdapViewStack): PGtkWidget; cdecl; external libadapta;
procedure adap_view_stack_set_visible_child(self: PAdapViewStack; child: PGtkWidget); cdecl; external libadapta;
function adap_view_stack_get_visible_child_name(self: PAdapViewStack): pchar; cdecl; external libadapta;
procedure adap_view_stack_set_visible_child_name(self: PAdapViewStack; name: pchar); cdecl; external libadapta;
function adap_view_stack_get_hhomogeneous(self: PAdapViewStack): Tgboolean; cdecl; external libadapta;
procedure adap_view_stack_set_hhomogeneous(self: PAdapViewStack; hhomogeneous: Tgboolean); cdecl; external libadapta;
function adap_view_stack_get_vhomogeneous(self: PAdapViewStack): Tgboolean; cdecl; external libadapta;
procedure adap_view_stack_set_vhomogeneous(self: PAdapViewStack; vhomogeneous: Tgboolean); cdecl; external libadapta;
function adap_view_stack_get_pages(self: PAdapViewStack): PGtkSelectionModel; cdecl; external libadapta;

type
  TAdapViewStackPages = record
  end;
  PAdapViewStackPages = ^TAdapViewStackPages;

  TAdapViewStackPagesClass = record
    parent_class: TGObjectClass;
  end;
  PAdapViewStackPagesClass = ^TAdapViewStackPagesClass;

function adap_view_stack_pages_get_type: TGType; cdecl; external libadapta;
function adap_view_stack_pages_get_selected_page(self: PAdapViewStackPages): PAdapViewStackPage; cdecl; external libadapta;
procedure adap_view_stack_pages_set_selected_page(self: PAdapViewStackPages; page: PAdapViewStackPage); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:27:33 ===

function ADAP_TYPE_VIEW_STACK_PAGE: TGType;
function ADAP_VIEW_STACK_PAGE(obj: Pointer): PAdapViewStackPage;
function ADAP_IS_VIEW_STACK_PAGE(obj: Pointer): Tgboolean;

function ADAP_TYPE_VIEW_STACK: TGType;
function ADAP_VIEW_STACK(obj: Pointer): PAdapViewStack;
function ADAP_IS_VIEW_STACK(obj: Pointer): Tgboolean;

function ADAP_TYPE_VIEW_STACK_PAGES: TGType;
function ADAP_VIEW_STACK_PAGES(obj: Pointer): PAdapViewStackPages;
function ADAP_IS_VIEW_STACK_PAGES(obj: Pointer): Tgboolean;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_VIEW_STACK_PAGE: TGType;
begin
  Result := adap_view_stack_page_get_type;
end;

function ADAP_VIEW_STACK_PAGE(obj: Pointer): PAdapViewStackPage;
begin
  Result := PAdapViewStackPage(g_type_check_instance_cast(obj, ADAP_TYPE_VIEW_STACK_PAGE));
end;

function ADAP_IS_VIEW_STACK_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_VIEW_STACK_PAGE);
end;

// ====

function ADAP_TYPE_VIEW_STACK: TGType;
begin
  Result := adap_view_stack_get_type;
end;

function ADAP_VIEW_STACK(obj: Pointer): PAdapViewStack;
begin
  Result := PAdapViewStack(g_type_check_instance_cast(obj, ADAP_TYPE_VIEW_STACK));
end;

function ADAP_IS_VIEW_STACK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_VIEW_STACK);
end;

// ====

function ADAP_TYPE_VIEW_STACK_PAGES: TGType;
begin
  Result := adap_view_stack_pages_get_type;
end;

function ADAP_VIEW_STACK_PAGES(obj: Pointer): PAdapViewStackPages;
begin
  Result := PAdapViewStackPages(g_type_check_instance_cast(obj, ADAP_TYPE_VIEW_STACK_PAGES));
end;

function ADAP_IS_VIEW_STACK_PAGES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_VIEW_STACK_PAGES);
end;


{$ENDIF read_implementation}
