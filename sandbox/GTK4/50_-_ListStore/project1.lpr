program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_GDK4,
  fp_GTK4,
  ListBox;

  procedure btn_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    listBox: PGtkWidget absolute Data;
  begin
    ListBoxRemoveItem(listBox);
  end;

  procedure new_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    listBox: PGtkWidget absolute Data;
  const
    index: integer = 0;
  begin
    ListBoxAppendItem(listBox, 'Daniel', 'Maier', index, Random * 2);
    Inc(index);
  end;

procedure btn_up_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
var
  listBox: PGtkWidget absolute Data;
begin
  ListBoxUp(listBox);
end;

procedure btn_down_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
var
  listBox: PGtkWidget absolute Data;
begin
  ListBoxDown(listBox);
end;

function CreateButton(label_, icon_name:Pgchar):PGtkWidget;
var
  box, image, lab: PGtkWidget;
begin
  box:=gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
  image:=gtk_image_new_from_icon_name(icon_name);
  lab:=gtk_label_new(label_);

  gtk_box_append(GTK_BOX(box), image);
  gtk_box_append(GTK_BOX(box), lab)   ;

  Result:=gtk_button_new;
  gtk_button_set_child(GTK_BUTTON(Result),box);
  end;



  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, button, panedBox, buttonBox, label1, lb1, lb2, paned: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 400);

    panedBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(panedBox, 10);
    gtk_widget_set_margin_end(panedBox, 10);
    gtk_widget_set_margin_top(panedBox, 10);
    gtk_widget_set_margin_bottom(panedBox, 10);

    // Paned

    paned := gtk_paned_new(GTK_ORIENTATION_VERTICAL);
    gtk_paned_set_wide_handle(GTK_PANED(paned), True);
    gtk_box_append(GTK_BOX(panedBox), paned);


    lb1 := Create_ListBoxWidget;
    gtk_widget_set_vexpand(lb1, True);
    gtk_paned_set_start_child(GTK_PANED(paned), lb1);
    ListBoxAppendItem(lb1, 'Max', 'Hugentobler', 45, 1.76);
    ListBoxAppendItem(lb1, 'Werner', 'Huber', 42, 1.86);
    ListBoxAppendItem(lb1, 'Hans', 'Ulrich', 56, 1.78);
    ListBoxAppendItem(lb1, 'Peter', 'Meier', 52, 1.74);

    lb2 := Create_ListBoxWidget;
    gtk_widget_set_vexpand(lb2, True);
    gtk_paned_set_end_child(GTK_PANED(paned), lb2);

    // Box2

    buttonBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_append(GTK_BOX(panedBox), buttonBox);

    label1 := gtk_label_new('box2');
    gtk_box_append(GTK_BOX(buttonBox), label1);

    button := CreateButton('Append', 'list-add-symbolic');
    g_signal_connect(button, 'clicked', G_CALLBACK(@new_click_cp), lb1);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := CreateButton('Remove','list-remove-symbolic');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), lb1);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := CreateButton('Remove All','list-remove-all-symbolic');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), lb1);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := CreateButton('Up','go-up-symbolic');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_up_click_cp), lb1);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := CreateButton('Down','go-down-symbolic');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_down_click_cp), lb1);
    gtk_box_append(GTK_BOX(buttonBox), button);

    gtk_window_set_child(GTK_WINDOW(window), panedBox);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    GSignalShow(G_TYPE_OBJECT);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
