unit myMenu;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene,
  MPButtonBox;

type
  PMMenuButton = type Pointer;
  PMMenuButtonClass = type Pointer;

function mp_menu_button_get_type: TGType;
function mp_menu_button_new(items: PButtonBoxData; count: Tgint): PGTKWidget;

implementation

// ==== private

var
  signal_id: Tguint = 0;

procedure on_action_activated(widget: PGtkWidget; action_name: pchar; parameter: PGVariant); cdecl;
var
  button_id: Pgchar;
begin
  button_id := g_variant_get_string(parameter, nil);
  g_signal_emit(widget, signal_id, 0, button_id);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  gtk_widget_class_install_action(GTK_WIDGET_CLASS(g_class), 'menu.click', 's', @on_action_activated);
  signal_id := g_signal_new('action-triggered', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST, 0, nil, nil, nil, G_TYPE_NONE, 1, G_TYPE_STRING);
end;

// ==== public

function mp_menu_button_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_MENU_BUTTON, @query);

    id := g_type_register_static_simple(GTK_TYPE_MENU_BUTTON, 'MPMenuButton',
      query.class_size, @class_init_cp,
      query.instance_size, nil, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_menu_button_new(items: PButtonBoxData; count: Tgint): PGTKWidget;
var
  menu: PGMenu;
  item: PGMenuItem;
  i: integer;
  detailed_action: pchar;
begin
  Result := g_object_new(mp_menu_button_get_type, nil);

  menu := g_menu_new();
  for i := 0 to count - 1 do begin
    item := g_menu_item_new(items[i].lab, nil);
    detailed_action := g_strdup_printf('menu.click(''%s'')', items[i].id);
    g_menu_item_set_detailed_action(item, detailed_action);
    g_menu_append_item(menu, item);
    g_free(detailed_action);
    g_object_unref(item);
  end;

  gtk_menu_button_set_icon_name(PGtkMenuButton(Result), 'open-menu-symbolic');
  gtk_menu_button_set_menu_model(PGtkMenuButton(Result), PGMenuModel(menu));

  g_object_unref(menu);
end;

end.
