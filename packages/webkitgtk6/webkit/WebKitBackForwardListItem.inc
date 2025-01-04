{$IFDEF read_interface}



  {WEBKIT_DECLARE_FINAL_TYPE (WebKitBackForwardListItem, webkit_back_forward_list_item, WEBKIT, BACK_FORWARD_LIST_ITEM, GInitiallyUnowned) }
type
  TWebKitBackForwardListItem = record
  end;
  PWebKitBackForwardListItem = ^TWebKitBackForwardListItem;

  TWebKitBackForwardListItemClass = record
    parent_class: TGInitiallyUnownedClass;
  end;
  PWebKitBackForwardListItemClass = ^TWebKitBackForwardListItemClass;

function webkit_back_forward_list_item_get_type: TGType; cdecl; external libwebkit;
function webkit_back_forward_list_item_get_uri(list_item: PWebKitBackForwardListItem): Pgchar; cdecl; external libwebkit;
function webkit_back_forward_list_item_get_title(list_item: PWebKitBackForwardListItem): Pgchar; cdecl; external libwebkit;
function webkit_back_forward_list_item_get_original_uri(list_item: PWebKitBackForwardListItem): Pgchar; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:40:55 ===

function WEBKIT_TYPE_BACK_FORWARD_LIST_ITEM: TGType;
function WEBKIT_BACK_FORWARD_LIST_ITEM(obj: Pointer): PWebKitBackForwardListItem;
function WEBKIT_IS_BACK_FORWARD_LIST_ITEM(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_BACK_FORWARD_LIST_ITEM: TGType;
begin
  Result := webkit_back_forward_list_item_get_type;
end;

function WEBKIT_BACK_FORWARD_LIST_ITEM(obj: Pointer): PWebKitBackForwardListItem;
begin
  Result := PWebKitBackForwardListItem(g_type_check_instance_cast(obj, WEBKIT_TYPE_BACK_FORWARD_LIST_ITEM));
end;

function WEBKIT_IS_BACK_FORWARD_LIST_ITEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_BACK_FORWARD_LIST_ITEM);
end;


{$ENDIF read_implementation}
