program project1;

uses
  ctypes,
  fp_glib2,
  //  fp_GLIBTools,
  fp_GDK4,
  fp_GTK4,
  culumn_view,
  LoadTitle;

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

procedure on_scale_changed_cp(range: PGtkRange; user_data: Tgpointer); cdecl;
var
  Value: Tdouble;
begin
  IsChange:=True;
//  Value := gtk_range_get_value(range);
//  g_printf('Value: %.2f'#10, Value);
end;

  function CreateMediaControlsPanel: PGtkWidget;
  var
    buttonBox, scale: PGtkWidget;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    scale := gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0.0, 100.0, 1.0);
    gtk_scale_set_draw_value(GTK_SCALE(scale), True);

    gtk_scale_add_mark(GTK_SCALE(scale), 0, GTK_POS_BOTTOM, 'Min');
    gtk_scale_add_mark(GTK_SCALE(scale), 50, GTK_POS_BOTTOM, 'mit');
    gtk_scale_add_mark(GTK_SCALE(scale), 100, GTK_POS_BOTTOM, 'Max');

    gtk_scale_set_value_pos(GTK_SCALE(scale), GTK_POS_TOP);
    gtk_range_set_value(GTK_RANGE(scale), 0.0);
    changed_handler_id := g_signal_connect(scale, 'value-changed', G_CALLBACK(@on_scale_changed_cp), nil);
    gtk_box_append(GTK_BOX(Result), scale);

    buttonBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    createBtnButton(buttonBox, 'Previous', 'media-skip-backward-symbolic', 'app.listbox.prev');
    createBtnButton(buttonBox, 'Rewind', 'media-seek-backward-symbolic', 'app.listbox.backward');
    createBtnButton(buttonBox, 'Play', 'media-playback-start-symbolic', 'app.listbox.play');
    createBtnButton(buttonBox, 'Pause', 'media-playback-pause-symbolic', 'app.listbox.pause');
    createBtnButton(buttonBox, 'Stop', 'media-playback-stop-symbolic', 'app.listbox.stop');
    createBtnButton(buttonBox, 'Forward', 'media-seek-forward-symbolic', 'app.listbox.forward');
    createBtnButton(buttonBox, 'Next', 'media-skip-forward-symbolic', 'app.listbox.next');

    g_object_set_data(G_OBJECT(Result), scaleObjectKey, scale);

    gtk_box_append(GTK_BOX(Result), buttonBox);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, panedBox, buttonBox, label1, columnView, scrolled_window: PGtkWidget;
    scale, mediaControlPanel: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 400);

    panedBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(panedBox, 10);
    gtk_widget_set_margin_end(panedBox, 10);
    gtk_widget_set_margin_top(panedBox, 10);
    gtk_widget_set_margin_bottom(panedBox, 10);

    mediaControlPanel:=CreateMediaControlsPanel;
    gtk_box_append(GTK_BOX(panedBox), mediaControlPanel);
    scale:=g_object_get_data(G_OBJECT(mediaControlPanel), scaleObjectKey);

    scrolled_window := gtk_scrolled_window_new;
    columnView := Create_ListBoxWidget;
    gtk_widget_set_vexpand(scrolled_window, True);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), columnView);
    gtk_box_append(GTK_BOX(panedBox), scrolled_window);
    g_object_set_data(G_OBJECT(columnView), scaleObjectKey,scale);

    //    OpenTitel(GTK_COLUMN_VIEW(columnView));

    // ButtonBox

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
