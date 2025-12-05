unit adap_navigation_view;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapNavigationPage = record
    parent_instance: TGtkWidget;
  end;
  PAdapNavigationPage = ^TAdapNavigationPage;
  PPAdapNavigationPage = ^PAdapNavigationPage;

  TAdapNavigationPageClass = record
    parent_class: TGtkWidgetClass;
    showing: procedure(self: PAdapNavigationPage); cdecl;
    shown: procedure(self: PAdapNavigationPage); cdecl;
    hiding: procedure(self: PAdapNavigationPage); cdecl;
    hidden: procedure(self: PAdapNavigationPage); cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  PAdapNavigationPageClass = ^TAdapNavigationPageClass;

function adap_navigation_page_get_type: TGType; cdecl; external libadapta;
function adap_navigation_page_new(child: PGtkWidget; title: pchar): PAdapNavigationPage; cdecl; external libadapta;
function adap_navigation_page_new_with_tag(child: PGtkWidget; title: pchar; tag: pchar): PAdapNavigationPage; cdecl; external libadapta;
function adap_navigation_page_get_child(self: PAdapNavigationPage): PGtkWidget; cdecl; external libadapta;
procedure adap_navigation_page_set_child(self: PAdapNavigationPage; child: PGtkWidget); cdecl; external libadapta;
function adap_navigation_page_get_tag(self: PAdapNavigationPage): pchar; cdecl; external libadapta;
procedure adap_navigation_page_set_tag(self: PAdapNavigationPage; tag: pchar); cdecl; external libadapta;
function adap_navigation_page_get_title(self: PAdapNavigationPage): pchar; cdecl; external libadapta;
procedure adap_navigation_page_set_title(self: PAdapNavigationPage; title: pchar); cdecl; external libadapta;
function adap_navigation_page_get_can_pop(self: PAdapNavigationPage): Tgboolean; cdecl; external libadapta;
procedure adap_navigation_page_set_can_pop(self: PAdapNavigationPage; can_pop: Tgboolean); cdecl; external libadapta;

type
  TAdapNavigationView = record
  end;
  PAdapNavigationView = ^TAdapNavigationView;

  TAdapNavigationViewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapNavigationViewClass = ^TAdapNavigationViewClass;

function adap_navigation_view_get_type: TGType; cdecl; external libadapta;

function adap_navigation_view_new: PGtkWidget; cdecl; external libadapta;
procedure adap_navigation_view_add(self: PAdapNavigationView; page: PAdapNavigationPage); cdecl; external libadapta;
procedure adap_navigation_view_remove(self: PAdapNavigationView; page: PAdapNavigationPage); cdecl; external libadapta;
function adap_navigation_view_find_page(self: PAdapNavigationView; tag: pchar): PAdapNavigationPage; cdecl; external libadapta;
procedure adap_navigation_view_push(self: PAdapNavigationView; page: PAdapNavigationPage); cdecl; external libadapta;
procedure adap_navigation_view_push_by_tag(self: PAdapNavigationView; tag: pchar); cdecl; external libadapta;
function adap_navigation_view_pop(self: PAdapNavigationView): Tgboolean; cdecl; external libadapta;
function adap_navigation_view_pop_to_page(self: PAdapNavigationView; page: PAdapNavigationPage): Tgboolean; cdecl; external libadapta;
function adap_navigation_view_pop_to_tag(self: PAdapNavigationView; tag: pchar): Tgboolean; cdecl; external libadapta;
procedure adap_navigation_view_replace(self: PAdapNavigationView; pages: PPAdapNavigationPage; n_pages: longint); cdecl; external libadapta;
procedure adap_navigation_view_replace_with_tags(self: PAdapNavigationView; tags: PPchar; n_tags: longint); cdecl; external libadapta;
function adap_navigation_view_get_visible_page(self: PAdapNavigationView): PAdapNavigationPage; cdecl; external libadapta;
function adap_navigation_view_get_previous_page(self: PAdapNavigationView; page: PAdapNavigationPage): PAdapNavigationPage; cdecl; external libadapta;
function adap_navigation_view_get_animate_transitions(self: PAdapNavigationView): Tgboolean; cdecl; external libadapta;
procedure adap_navigation_view_set_animate_transitions(self: PAdapNavigationView; animate_transitions: Tgboolean); cdecl; external libadapta;
function adap_navigation_view_get_pop_on_escape(self: PAdapNavigationView): Tgboolean; cdecl; external libadapta;
procedure adap_navigation_view_set_pop_on_escape(self: PAdapNavigationView; pop_on_escape: Tgboolean); cdecl; external libadapta;
function adap_navigation_view_get_navigation_stack(self: PAdapNavigationView): PGListModel; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:16 ===

function ADAP_TYPE_NAVIGATION_PAGE: TGType;
function ADAP_NAVIGATION_PAGE(obj: Pointer): PAdapNavigationPage;
function ADAP_IS_NAVIGATION_PAGE(obj: Pointer): Tgboolean;
function ADAP_NAVIGATION_PAGE_CLASS(klass: Pointer): PAdapNavigationPageClass;
function ADAP_IS_NAVIGATION_PAGE_CLASS(klass: Pointer): Tgboolean;
function ADAP_NAVIGATION_PAGE_GET_CLASS(obj: Pointer): PAdapNavigationPageClass;

function ADAP_TYPE_NAVIGATION_VIEW: TGType;
function ADAP_NAVIGATION_VIEW(obj: Pointer): PAdapNavigationView;
function ADAP_IS_NAVIGATION_VIEW(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_NAVIGATION_PAGE: TGType;
begin
  Result := adap_navigation_page_get_type;
end;

function ADAP_NAVIGATION_PAGE(obj: Pointer): PAdapNavigationPage;
begin
  Result := PAdapNavigationPage(g_type_check_instance_cast(obj, ADAP_TYPE_NAVIGATION_PAGE));
end;

function ADAP_IS_NAVIGATION_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_NAVIGATION_PAGE);
end;

function ADAP_NAVIGATION_PAGE_CLASS(klass: Pointer): PAdapNavigationPageClass;
begin
  Result := PAdapNavigationPageClass(g_type_check_class_cast(klass, ADAP_TYPE_NAVIGATION_PAGE));
end;

function ADAP_IS_NAVIGATION_PAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_NAVIGATION_PAGE);
end;

function ADAP_NAVIGATION_PAGE_GET_CLASS(obj: Pointer): PAdapNavigationPageClass;
begin
  Result := PAdapNavigationPageClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function ADAP_TYPE_NAVIGATION_VIEW: TGType;
begin
  Result := adap_navigation_view_get_type;
end;

function ADAP_NAVIGATION_VIEW(obj: Pointer): PAdapNavigationView;
begin
  Result := PAdapNavigationView(g_type_check_instance_cast(obj, ADAP_TYPE_NAVIGATION_VIEW));
end;

function ADAP_IS_NAVIGATION_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_NAVIGATION_VIEW);
end;

end.
