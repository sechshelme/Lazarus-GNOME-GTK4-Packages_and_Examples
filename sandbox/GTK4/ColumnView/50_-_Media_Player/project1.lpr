program project1;

uses
  ctypes,
  fp_glib2,
  //  fp_GLIBTools,
  fp_GDK4,
  fp_GTK4,
  culumn_view;

  function FindAllFiles(path: Pgchar): PGtkStringList;
    // https://www.perplexity.ai/search/wie-kriege-ich-den-inhalt-eine-DYkUj_baSWuI.DL7SOKpQQ
  var
    sl: PGtkStringList;
    dir: PGDir;
    entryName: Pgchar;
  begin
    dir := g_dir_open(path, 0, nil);
    if dir = nil then begin
      WriteLn('Konnte Ordner nicht öffnen !');
      exit(nil);
    end;

    sl := gtk_string_list_new(nil);

    repeat
      entryName := g_dir_read_name(dir);
      if entryName <> nil then begin
        if g_str_has_suffix(entryName, '.flac') then  begin
          gtk_string_list_append(sl, entryName);
        end;
      end;
    until entryName = nil;

    g_dir_close(dir);
    Result := sl;
  end;

  procedure LoadTitel(cl: PGtkWidget);
  const
    folder_path = '/n4800/Multimedia/Music/Disco/Boney M/1981 - Boonoonoonoos';
  var
    sl: PGtkStringList;
    n_item: Tguint;
    so: PGtkStringObject;
    i: integer;
    s: pchar;
  begin
    sl := FindAllFiles(folder_path);

    n_item := g_list_model_get_n_items(G_LIST_MODEL(sl));
    WriteLn('count: ', n_item);

    for i := 0 to n_item do begin
      so := GTK_STRING_OBJECT(g_list_model_get_item(G_LIST_MODEL(sl), i));
      s := gtk_string_object_get_string(so);
      WriteLn(s);
      g_object_unref(so);
    end;
    g_object_unref(sl);
  end;

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

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, panedBox, buttonBox, label1, ColumnViewBox: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 400);

    panedBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(panedBox, 10);
    gtk_widget_set_margin_end(panedBox, 10);
    gtk_widget_set_margin_top(panedBox, 10);
    gtk_widget_set_margin_bottom(panedBox, 10);

    ColumnViewBox := Create_ListBoxWidget;
    gtk_widget_set_vexpand(ColumnViewBox, True);
    gtk_box_append(GTK_BOX(panedBox), ColumnViewBox);

    LoadTitel(ColumnViewBox);

    // Box2

    buttonBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_append(GTK_BOX(panedBox), buttonBox);

    label1 := gtk_label_new('box2');
    gtk_box_append(GTK_BOX(buttonBox), label1);

    CreateBtnButton(buttonBox, 'Next', 'go-down', 'app.listbox.next');
    CreateBtnButton(buttonBox, 'Prev', 'go-up', 'app.listbox.prev');
    CreateBtnButton(buttonBox, 'Append', 'list-add', 'app.listbox.append');
    CreateBtnButton(buttonBox, 'Remove', 'list-remove', 'app.listbox.remove');
    CreateBtnButton(buttonBox, 'Remove All', 'list-remove-all', 'app.listbox.removeall');
    CreateBtnButton(buttonBox, 'Down', 'view-sort-descending', 'app.listbox.down');
    CreateBtnButton(buttonBox, 'Up', 'view-sort-descending', 'app.listbox.up');

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
    //    GSignalShow(G_TYPE_OBJECT);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
