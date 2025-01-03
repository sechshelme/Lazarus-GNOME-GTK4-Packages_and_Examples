unit WebKitBackForwardList;

interface

uses
  fp_glib2, fp_GTK4, web_common, WebKitBackForwardListItem;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitBackForwardList, webkit_back_forward_list, WEBKIT, BACK_FORWARD_LIST, GObject) }
type
  TWebKitBackForwardList = record
  end;
  PWebKitBackForwardList = ^TWebKitBackForwardList;

  TWebKitBackForwardListClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitBackForwardListClass = ^TWebKitBackForwardListClass;

function webkit_back_forward_list_get_type: TGType; cdecl; external libwebkit;
function webkit_back_forward_list_get_current_item(back_forward_list: PWebKitBackForwardList): PWebKitBackForwardListItem; cdecl; external libwebkit;
function webkit_back_forward_list_get_back_item(back_forward_list: PWebKitBackForwardList): PWebKitBackForwardListItem; cdecl; external libwebkit;
function webkit_back_forward_list_get_forward_item(back_forward_list: PWebKitBackForwardList): PWebKitBackForwardListItem; cdecl; external libwebkit;
function webkit_back_forward_list_get_nth_item(back_forward_list: PWebKitBackForwardList; index: Tgint): PWebKitBackForwardListItem; cdecl; external libwebkit;
function webkit_back_forward_list_get_length(back_forward_list: PWebKitBackForwardList): Tguint; cdecl; external libwebkit;
function webkit_back_forward_list_get_back_list(back_forward_list: PWebKitBackForwardList): PGList; cdecl; external libwebkit;
function webkit_back_forward_list_get_back_list_with_limit(back_forward_list: PWebKitBackForwardList; limit: Tguint): PGList; cdecl; external libwebkit;
function webkit_back_forward_list_get_forward_list(back_forward_list: PWebKitBackForwardList): PGList; cdecl; external libwebkit;
function webkit_back_forward_list_get_forward_list_with_limit(back_forward_list: PWebKitBackForwardList; limit: Tguint): PGList; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:39:19 ===

function WEBKIT_TYPE_BACK_FORWARD_LIST: TGType;
function WEBKIT_BACK_FORWARD_LIST(obj: Pointer): PWebKitBackForwardList;
function WEBKIT_IS_BACK_FORWARD_LIST(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_BACK_FORWARD_LIST: TGType;
begin
  Result := webkit_back_forward_list_get_type;
end;

function WEBKIT_BACK_FORWARD_LIST(obj: Pointer): PWebKitBackForwardList;
begin
  Result := PWebKitBackForwardList(g_type_check_instance_cast(obj, WEBKIT_TYPE_BACK_FORWARD_LIST));
end;

function WEBKIT_IS_BACK_FORWARD_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_BACK_FORWARD_LIST);
end;


end.
