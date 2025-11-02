program project1;

uses
  ctypes,
  fp_glib2,
  fp_pango,
  fp_GTK4;

const
  NUM_OPTIONS = 20;

  procedure on_row_selected(box: PGtkListBox; row: PGtkListBoxRow; user_data: Tgpointer); cdecl;
  var
    entry: PGtkEntry absolute user_data;
    lab: PGtkWidget;
    Text: pchar;
  begin
    if row <> nil then begin
      lab := gtk_widget_get_first_child(GTK_WIDGET(row));
      Text := gtk_label_get_text(GTK_LABEL(lab));
      gtk_editable_set_text(GTK_EDITABLE(entry), Text);
    end;
  end;

  procedure adjust_popover_size(popover: PGtkPopover; list_box: PGtkListBox); cdecl;
  var
    child: PGtkWidget;
    num_rows: Tgint = 0;
    row_height: Tgint = 21;
    max_height: Tgint = 300;
    calculated_height: Tgint;
  begin
    child := gtk_widget_get_first_child(GTK_WIDGET(list_box));
    while child <> nil do begin
      Inc(num_rows);
      child := gtk_widget_get_next_sibling(child);
    end;
    calculated_height := num_rows * row_height + 12;

    if calculated_height > max_height then begin
      calculated_height := max_height;
    end;

    gtk_widget_set_size_request(GTK_WIDGET(popover), -1, calculated_height);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, vbox, lab, hbox, entry,
    menu_button, popover, scrolled_window, list_box, row: PGtkWidget;
    item_text: Pgchar;
    i: integer;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Label');
    gtk_window_set_default_size(GTK_WINDOW(window), 320, 200);

    vbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_window_set_child(GTK_WINDOW(window), vbox);

    hbox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
    gtk_box_append(GTK_BOX(vbox), hbox);

    entry := gtk_entry_new;
    gtk_box_append(GTK_BOX(hbox), entry);

    menu_button := gtk_menu_button_new;
    gtk_box_append(GTK_BOX(hbox), menu_button);

    popover := gtk_popover_new;
    gtk_menu_button_set_popover(GTK_MENU_BUTTON(menu_button), popover);

    scrolled_window := gtk_scrolled_window_new;
    gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(scrolled_window), GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
    gtk_popover_set_child(GTK_POPOVER(popover), scrolled_window);

    list_box := gtk_list_box_new;
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), list_box);

    for  i := 0 to NUM_OPTIONS - 1 do begin
      item_text := g_strdup_printf('Option %d', i + 1);
      row := gtk_list_box_row_new;
      lab := gtk_label_new(item_text);
      g_free(item_text);
      gtk_list_box_row_set_child(GTK_LIST_BOX_ROW(row), lab);
      gtk_list_box_append(GTK_LIST_BOX(list_box), row);
    end;

    adjust_popover_size(GTK_POPOVER(popover), GTK_LIST_BOX(list_box));
    g_signal_connect(list_box, 'row-selected', G_CALLBACK(@on_row_selected), entry);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
