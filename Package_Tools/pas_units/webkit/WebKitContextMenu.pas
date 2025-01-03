unit WebKitContextMenu;

interface

uses
  fp_glib2, fp_GDK4, fp_GTK4, web_common, WebKitContextMenuItem;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitContextMenu, webkit_context_menu, WEBKIT, CONTEXT_MENU, GObject) }

function webkit_context_menu_get_type: TGType; cdecl; external libwebkit;
function webkit_context_menu_new: PWebKitContextMenu; cdecl; external libwebkit;
function webkit_context_menu_new_with_items(items: PGList): PWebKitContextMenu; cdecl; external libwebkit;
procedure webkit_context_menu_prepend(menu: PWebKitContextMenu; item: PWebKitContextMenuItem); cdecl; external libwebkit;
procedure webkit_context_menu_append(menu: PWebKitContextMenu; item: PWebKitContextMenuItem); cdecl; external libwebkit;
procedure webkit_context_menu_insert(menu: PWebKitContextMenu; item: PWebKitContextMenuItem; position: Tgint); cdecl; external libwebkit;
procedure webkit_context_menu_move_item(menu: PWebKitContextMenu; item: PWebKitContextMenuItem; position: Tgint); cdecl; external libwebkit;
function webkit_context_menu_get_items(menu: PWebKitContextMenu): PGList; cdecl; external libwebkit;
function webkit_context_menu_get_n_items(menu: PWebKitContextMenu): Tguint; cdecl; external libwebkit;
function webkit_context_menu_first(menu: PWebKitContextMenu): PWebKitContextMenuItem; cdecl; external libwebkit;
function webkit_context_menu_last(menu: PWebKitContextMenu): PWebKitContextMenuItem; cdecl; external libwebkit;
function webkit_context_menu_get_item_at_position(menu: PWebKitContextMenu; position: Tguint): PWebKitContextMenuItem; cdecl; external libwebkit;
procedure webkit_context_menu_remove(menu: PWebKitContextMenu; item: PWebKitContextMenuItem); cdecl; external libwebkit;
procedure webkit_context_menu_remove_all(menu: PWebKitContextMenu); cdecl; external libwebkit;
procedure webkit_context_menu_set_user_data(menu: PWebKitContextMenu; user_data: PGVariant); cdecl; external libwebkit;
function webkit_context_menu_get_user_data(menu: PWebKitContextMenu): PGVariant; cdecl; external libwebkit;
function webkit_context_menu_get_event(menu: PWebKitContextMenu): PGdkEvent; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:43:11 ===

function WEBKIT_TYPE_CONTEXT_MENU: TGType;
function WEBKIT_CONTEXT_MENU(obj: Pointer): PWebKitContextMenu;
function WEBKIT_IS_CONTEXT_MENU(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_CONTEXT_MENU: TGType;
begin
  Result := webkit_context_menu_get_type;
end;

function WEBKIT_CONTEXT_MENU(obj: Pointer): PWebKitContextMenu;
begin
  Result := PWebKitContextMenu(g_type_check_instance_cast(obj, WEBKIT_TYPE_CONTEXT_MENU));
end;

function WEBKIT_IS_CONTEXT_MENU(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_CONTEXT_MENU);
end;




end.
