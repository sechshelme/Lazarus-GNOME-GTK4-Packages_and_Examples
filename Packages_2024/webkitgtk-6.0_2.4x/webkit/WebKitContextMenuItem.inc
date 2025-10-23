{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitContextMenuItem, webkit_context_menu_item, WEBKIT, CONTEXT_MENU_ITEM, GInitiallyUnowned) }
type
  TWebKitContextMenuItem = record
  end;
  PWebKitContextMenuItem = ^TWebKitContextMenuItem;

  TWebKitContextMenuItemClass = record
    parent_class: TGInitiallyUnownedClass;
  end;
  PWebKitContextMenuItemClass = ^TWebKitContextMenuItemClass;

function webkit_context_menu_item_get_type: TGType; cdecl; external libwebkit;
function webkit_context_menu_item_new_from_gaction(action: PGAction; _label: Pgchar; target: PGVariant): PWebKitContextMenuItem; cdecl; external libwebkit;
function webkit_context_menu_item_new_from_stock_action(action: TWebKitContextMenuAction): PWebKitContextMenuItem; cdecl; external libwebkit;
function webkit_context_menu_item_new_from_stock_action_with_label(action: TWebKitContextMenuAction; _label: Pgchar): PWebKitContextMenuItem; cdecl; external libwebkit;
function webkit_context_menu_item_new_with_submenu(_label: Pgchar; submenu: PWebKitContextMenu): PWebKitContextMenuItem; cdecl; external libwebkit;
function webkit_context_menu_item_new_separator: PWebKitContextMenuItem; cdecl; external libwebkit;
function webkit_context_menu_item_get_gaction(item: PWebKitContextMenuItem): PGAction; cdecl; external libwebkit;
function webkit_context_menu_item_get_stock_action(item: PWebKitContextMenuItem): TWebKitContextMenuAction; cdecl; external libwebkit;
function webkit_context_menu_item_is_separator(item: PWebKitContextMenuItem): Tgboolean; cdecl; external libwebkit;
procedure webkit_context_menu_item_set_submenu(item: PWebKitContextMenuItem; submenu: PWebKitContextMenu); cdecl; external libwebkit;
function webkit_context_menu_item_get_submenu(item: PWebKitContextMenuItem): PWebKitContextMenu; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:46:18 ===

function WEBKIT_TYPE_CONTEXT_MENU_ITEM: TGType;
function WEBKIT_CONTEXT_MENU_ITEM(obj: Pointer): PWebKitContextMenuItem;
function WEBKIT_IS_CONTEXT_MENU_ITEM(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_CONTEXT_MENU_ITEM: TGType;
begin
  Result := webkit_context_menu_item_get_type;
end;

function WEBKIT_CONTEXT_MENU_ITEM(obj: Pointer): PWebKitContextMenuItem;
begin
  Result := PWebKitContextMenuItem(g_type_check_instance_cast(obj, WEBKIT_TYPE_CONTEXT_MENU_ITEM));
end;

function WEBKIT_IS_CONTEXT_MENU_ITEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_CONTEXT_MENU_ITEM);
end;


{$ENDIF read_implementation}
