{$IFDEF read_interface}

type
  TWebKitOptionMenuItem = record
  end;
  PWebKitOptionMenuItem = ^TWebKitOptionMenuItem;

function webkit_option_menu_item_get_type: TGType; cdecl; external libwebkit;
function webkit_option_menu_item_copy(item: PWebKitOptionMenuItem): PWebKitOptionMenuItem; cdecl; external libwebkit;
procedure webkit_option_menu_item_free(item: PWebKitOptionMenuItem); cdecl; external libwebkit;
function webkit_option_menu_item_get_label(item: PWebKitOptionMenuItem): Pgchar; cdecl; external libwebkit;
function webkit_option_menu_item_get_tooltip(item: PWebKitOptionMenuItem): Pgchar; cdecl; external libwebkit;
function webkit_option_menu_item_is_group_label(item: PWebKitOptionMenuItem): Tgboolean; cdecl; external libwebkit;
function webkit_option_menu_item_is_group_child(item: PWebKitOptionMenuItem): Tgboolean; cdecl; external libwebkit;
function webkit_option_menu_item_is_enabled(item: PWebKitOptionMenuItem): Tgboolean; cdecl; external libwebkit;
function webkit_option_menu_item_is_selected(item: PWebKitOptionMenuItem): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 16:41:23 ===

function WEBKIT_TYPE_OPTION_MENU_ITEM: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_OPTION_MENU_ITEM: TGType;
begin
  WEBKIT_TYPE_OPTION_MENU_ITEM := webkit_option_menu_item_get_type;
end;



{$ENDIF read_implementation}
