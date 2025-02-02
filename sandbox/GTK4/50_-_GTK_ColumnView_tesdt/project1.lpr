program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
//  fp_GLIBTools,
  fp_GDK4,
  fp_GTK4,
  culumn_view, Edit_Dialog, Common;

procedure CreateBtnButton(parent:PGtkWidget; label_, icon_name, action_name: Pgchar);
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
    gtk_actionable_set_action_name(GTK_ACTIONABLE(Button),action_name);

    gtk_box_append(GTK_BOX(parent), button);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    mainWindow, panedBox, buttonBox, label1, ColumnViewBox: PGtkWidget;
  begin
    mainWindow := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(mainWindow), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(mainWindow), 600, 400);

    panedBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(panedBox, 10);
    gtk_widget_set_margin_end(panedBox, 10);
    gtk_widget_set_margin_top(panedBox, 10);
    gtk_widget_set_margin_bottom(panedBox, 10);

    ColumnViewBox := Create_ListBoxWidget(GTK_WINDOW( mainWindow));
    gtk_widget_set_vexpand(ColumnViewBox, True);
    gtk_box_append(GTK_BOX(panedBox), ColumnViewBox);

    // Box2

    buttonBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_append(GTK_BOX(panedBox), buttonBox);

    label1 := gtk_label_new('box2');
    gtk_box_append(GTK_BOX(buttonBox), label1);

    CreateBtnButton(buttonBox,'Print', '', 'app.listbox.print');
    CreateBtnButton(buttonBox,'Next', 'go-down', 'app.listbox.next');
    CreateBtnButton(buttonBox,'Prev', 'go-up', 'app.listbox.prev');
    CreateBtnButton(buttonBox,'Append', 'list-add', 'app.listbox.append');
    CreateBtnButton(buttonBox,'Rename', '', 'app.listbox.rename');
    CreateBtnButton(buttonBox,'Remove', 'list-remove', 'app.listbox.remove');
    CreateBtnButton(buttonBox,'Remove All', 'list-remove-all', 'app.listbox.removeall');
    CreateBtnButton(buttonBox,'Down', 'view-sort-ascending', 'app.listbox.down');
    CreateBtnButton(buttonBox,'Up', 'view-sort-descending', 'app.listbox.up');

    gtk_window_set_child(GTK_WINDOW(mainWindow), panedBox);

    gtk_window_present(GTK_WINDOW(mainWindow));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
//    GSignalShow(G_TYPE_OBJECT);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
