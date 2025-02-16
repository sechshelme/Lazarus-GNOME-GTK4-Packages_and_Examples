unit MenuBar;

interface

uses
  fp_glib2, fp_pango, fp_GTK4, fp_gst;

function CreateMenu: PGMenu;
procedure CreateBtnButton(parent: PGtkWidget; label_, icon_name, action_name: Pgchar);

implementation

procedure CreateBtnButton(parent: PGtkWidget; label_, icon_name, action_name: Pgchar);
var
  box, image, lab, Button: PGtkWidget;
begin
  box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
  image := gtk_image_new_from_icon_name(icon_name);
  lab := gtk_label_new(label_);

  gtk_box_append(GTK_BOX(box), image);
  gtk_box_append(GTK_BOX(box), lab);

  Button := gtk_button_new;
  gtk_button_set_child(GTK_BUTTON(Button), box);
  gtk_actionable_set_action_name(GTK_ACTIONABLE(Button), action_name);

  gtk_box_append(GTK_BOX(parent), button);
end;



procedure add(parent:PGMenu; label_,icon_name,action:Pgchar);
var
  item: PGMenuItem;
  icon: PGIcon;
begin
  item:=g_menu_item_new(label_,action);
  icon:=g_themed_icon_new(icon_name);
  g_menu_item_set_icon(item,icon);
//  g_menu_item_set_attribute(item, G_MENU_ATTRIBUTE_LABEL, 's', 'blublu');
//  g_menu_item_set_attribute(item, G_MENU_ATTRIBUTE_ICON, 's', icon);
  g_object_unref(icon);

  g_menu_append_item(parent, item);
  g_object_unref(item);
end;

function CreateMenu: PGMenu;
var
  mainMenu, optionMenu, colorSubMenu, fileMenu, helpMenu, playMenu: PGMenu;
  quit_item: PGMenuItem;
begin
  // --- Datei
  fileMenu := g_menu_new;
  g_menu_append(fileMenu, '_Neu', 'app.new');

  g_menu_append(fileMenu, '_oeffnen', 'app.open');
  g_menu_append(fileMenu, '_speichern', 'app.save');
  g_menu_append(fileMenu, '-', nil);

  quit_item := g_menu_item_new('Beenden...', 'app.quit');
  g_menu_item_set_attribute(quit_item, 'accel', 's', '<Ctrl>q');
  g_menu_append_item(fileMenu, quit_item);
  g_object_unref(quit_item);

  // --- Play
  playMenu := g_menu_new;

  add(playMenu, 'Previous', 'media-skip-backward-symbolic', 'app.listbox.prev');
  add(playMenu, 'Rewind', 'media-seek-backward-symbolic', 'app.listbox.backward');
  add(playMenu, 'Play', 'media-playback-start-symbolic', 'app.listbox.play');
  add(playMenu, 'Pause', 'media-playback-pause-symbolic', 'app.listbox.pause');
  add(playMenu, 'Stop', 'media-playback-stop-symbolic', 'app.listbox.stop');
  add(playMenu, 'Forward', 'media-seek-forward-symbolic', 'app.listbox.forward');
  add(playMenu, 'Next', 'media-skip-forward-symbolic', 'app.listbox.next');

  // --- Optionen
  colorSubMenu := g_menu_new;
  g_menu_append(colorSubMenu, '_Rot', 'app.red');
  g_menu_append(colorSubMenu, '_Gruen', 'app.green');
  g_menu_append(colorSubMenu, '_Blau', 'app.blue');

  optionMenu := g_menu_new;
  g_menu_append(optionMenu, '_Optionen..', 'app.option');
  g_menu_append_submenu(optionMenu, '_Farben', G_MENU_MODEL(colorSubMenu));
  g_object_unref(colorSubMenu);

  // --- Hilfe
  helpMenu := g_menu_new;
  g_menu_append(helpMenu, '_Hilfe...', 'app.help');
  g_menu_append(helpMenu, '_About...', 'app.about');

  // --- Main Menu
  mainMenu := g_menu_new;

  g_menu_append_submenu(mainMenu, '_Datei', G_MENU_MODEL(fileMenu));
  g_object_unref(fileMenu);

  g_menu_append_submenu(mainMenu, '_Play', G_MENU_MODEL(playMenu));
  g_object_unref(playMenu);

  g_menu_append_submenu(mainMenu, '_Optionen', G_MENU_MODEL(optionMenu));
  g_object_unref(optionMenu);

  g_menu_append_submenu(mainMenu, '_Hilfe', G_MENU_MODEL(helpMenu));
  g_object_unref(helpMenu);

  Result := mainMenu;
end;

end.

