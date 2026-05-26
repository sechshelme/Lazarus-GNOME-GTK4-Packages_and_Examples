unit MPMenuButton;

interface

uses
  fp_glib2, fp_GTK4;

type
  PMPMenuButton = type Pointer;
  PMPMenuButtonClass = type Pointer;

function mp_menu_button_get_type: TGType;
function mp_menu_button_new: PGTKWidget;

implementation

// ==== private

type
  TInstPriv = record
    menu: PGMenu;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  signal_id: Tguint = 0;
  instance_size: integer = 0;

function GetPriv(w: Tgpointer): PInstPriv; inline;
begin
  Result := PInstPriv(w + instance_size);
end;

procedure on_action_activated(widget: PGtkWidget; action_name: pchar; parameter: PGVariant); cdecl;
var
  button_id: Pgchar;
begin
  button_id := g_variant_get_string(parameter, nil);
  g_signal_emit(widget, signal_id, 0, button_id);
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(obj);
  with priv^ do begin
    if menu <> nil then  begin
      g_object_unref(menu);
    end;
  end;
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  gtk_widget_class_install_action(GTK_WIDGET_CLASS(g_class), 'menu.click', 's', @on_action_activated);
  signal_id := g_signal_new('action-triggered', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST, 0, nil, nil, nil, G_TYPE_NONE, 1, G_TYPE_STRING);
end;

procedure add_item(button: PMPMenuButton; lab, id: Pgchar);
var
  priv: PInstPriv;
  item: PGMenuItem;
  detailed_action: Pgchar;
begin
  priv := GetPriv(button);
  with priv^ do begin
    if menu <> nil then begin
      item := g_menu_item_new(lab, nil);
      detailed_action := g_strdup_printf('menu.click(''%s'')', id);
      g_menu_item_set_detailed_action(item, detailed_action);
      g_menu_append_item(menu, item);
      g_free(detailed_action);
      g_object_unref(item);
    end;
  end;
end;



procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
    menu := g_menu_new;
    gtk_menu_button_set_icon_name(PGtkMenuButton(instance), 'open-menu-symbolic');
    gtk_menu_button_set_menu_model(PGtkMenuButton(instance), PGMenuModel(menu));

    add_item(PMPMenuButton(instance), 'Speichern', 'listbox.save');
    add_item(PMPMenuButton(instance), 'Öffnen', 'listbox.open');
    add_item(PMPMenuButton(instance), 'Hilfe', 'help');
    add_item(PMPMenuButton(instance), 'Beenden', 'listbox.quit');
    add_item(PMPMenuButton(instance), 'Flac 1', 'listbox.default.flac1');
    add_item(PMPMenuButton(instance), 'Flac 2', 'listbox.default.flac2');
    add_item(PMPMenuButton(instance), 'Flac 3', 'listbox.default.flac3');
    add_item(PMPMenuButton(instance), 'MP3', 'listbox.default.mp3');
    add_item(PMPMenuButton(instance), 'MOD', 'listbox.default.mod');
    add_item(PMPMenuButton(instance), 'MIDI', 'listbox.default.midi');
  end;
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
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_MENU_BUTTON, 'MyMenuButton',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_menu_button_new: PGTKWidget;
begin
  Result := g_object_new(mp_menu_button_get_type, nil);
end;

end.
