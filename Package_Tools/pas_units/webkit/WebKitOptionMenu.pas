unit WebKitOptionMenu;

interface

uses
  fp_glib2, fp_GDK4, fp_GTK4, WebKit, WebKitOptionMenuItem;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitOptionMenu, webkit_option_menu, WEBKIT, OPTION_MENU, GObject) }
type
  TWebKitOptionMenu = record
  end;
  PWebKitOptionMenu = ^TWebKitOptionMenu;

  TWebKitOptionMenuClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitOptionMenuClass = ^TWebKitOptionMenuClass;

function webkit_option_menu_get_type: TGType; cdecl; external libwebkit;
function webkit_option_menu_get_n_items(menu: PWebKitOptionMenu): Tguint; cdecl; external libwebkit;
function webkit_option_menu_get_item(menu: PWebKitOptionMenu; index: Tguint): PWebKitOptionMenuItem; cdecl; external libwebkit;
procedure webkit_option_menu_select_item(menu: PWebKitOptionMenu; index: Tguint); cdecl; external libwebkit;
procedure webkit_option_menu_activate_item(menu: PWebKitOptionMenu; index: Tguint); cdecl; external libwebkit;
procedure webkit_option_menu_close(menu: PWebKitOptionMenu); cdecl; external libwebkit;
function webkit_option_menu_get_event(menu: PWebKitOptionMenu): PGdkEvent; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 16:41:30 ===

function WEBKIT_TYPE_OPTION_MENU: TGType;
function WEBKIT_OPTION_MENU(obj: Pointer): PWebKitOptionMenu;
function WEBKIT_IS_OPTION_MENU(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_OPTION_MENU: TGType;
begin
  Result := webkit_option_menu_get_type;
end;

function WEBKIT_OPTION_MENU(obj: Pointer): PWebKitOptionMenu;
begin
  Result := PWebKitOptionMenu(g_type_check_instance_cast(obj, WEBKIT_TYPE_OPTION_MENU));
end;

function WEBKIT_IS_OPTION_MENU(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_OPTION_MENU);
end;


end.
