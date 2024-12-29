unit ListBox;

{$mode ObjFPC}{$H+}

interface

uses
  fp_glib2, fp_GTK4;

function Create_ListBox(app: PGtkApplication): PGtkWidget;

implementation

procedure btn_click_cp(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer);
var
  action_name: Pgchar;
  ch: Pgchar absolute user_data;
begin
  action_name := g_action_get_name(G_ACTION(action));
  g_printf('Action Name: "%s"'#10, action_name);
  g_printf('Es wurde: "%s" geklickt'#10, ch);
end;

function CreateMenu(app: PGtkApplication): PGMenu;
var
  action: PGSimpleAction;
  menuItem: PGMenuItem;
begin
  Result := g_menu_new;

  g_menu_append(Result, 'Option 1', 'app.option1');
  action := g_simple_action_new('option1', nil);
  g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
  g_signal_connect(action, 'activate', G_CALLBACK(@btn_click_cp), Pgchar('Button 1'));

  g_menu_append(Result, 'Option 2', 'app.option2');
  action := g_simple_action_new('option2', nil);
  g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
  g_signal_connect(action, 'activate', G_CALLBACK(@btn_click_cp), Pgchar('Button 2'));

  menuItem := g_menu_item_new('Option 3', 'app.option3');
  g_menu_append_item(Result, menuItem);
  g_object_unref(menuItem);
  action := g_simple_action_new('option3', nil);
  g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
  g_signal_connect(action, 'activate', G_CALLBACK(@btn_click_cp), Pgchar('Button 3'));
end;

function CreateMenuButton(app: PGtkApplication): PGtkWidget;
var
  menu: PGMenu;
begin
  Result := gtk_menu_button_new;

  gtk_widget_set_size_request(Result, 20, 20);
  gtk_widget_set_valign(Result, GTK_ALIGN_CENTER);

  menu := CreateMenu(app);
  gtk_menu_button_set_menu_model(GTK_MENU_BUTTON(Result), G_MENU_MODEL(menu));
end;


function Create_Items(nr: integer; app: PGtkApplication): PGtkWidget;
var
  lb, menuButton, button_box: PGtkWidget;
  label_text: Pgchar;
begin
  Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
 // gtk_widget_set_hexpand(Result, True);

  label_text := g_strdup_printf('Eintrag: %d'#10 +
    '<span foreground="blue">Erste Zeile</span>'#10 +
    '<span foreground="black"><b>Zweite Zeile</b></span>'#10 +
    '<span foreground="gray">Dritte Zeile</span>', nr);

  lb := gtk_label_new(nil);
  gtk_label_set_markup(GTK_LABEL(lb), label_text);
  g_free(label_text);
  gtk_box_append(GTK_BOX(Result), lb);

  button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
  gtk_widget_set_hexpand(button_box, True);
  gtk_widget_set_halign(button_box, GTK_ALIGN_END);
  gtk_widget_set_margin_end(button_box, 10);

  menuButton := CreateMenuButton(app);
  gtk_box_append(GTK_BOX(button_box), menuButton);

  gtk_box_append(GTK_BOX(Result), button_box);
end;

function Create_ListBox(app: PGtkApplication): PGtkWidget;
var
  i: integer;
  lb, sw: PGtkWidget;
begin
  sw := gtk_scrolled_window_new;
  gtk_widget_set_vexpand(sw, True);

  lb := gtk_list_box_new;
  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(sw), lb);

  for i := 0 to 50 do begin
    gtk_list_box_append(GTK_LIST_BOX(lb), Create_Items(i, app));
  end;
  Result := sw;
end;




end.
