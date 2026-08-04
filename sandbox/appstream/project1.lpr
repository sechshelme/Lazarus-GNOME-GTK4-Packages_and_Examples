program project1;

uses
  fp_appstream,
  fp_glib2,
  fp_GTK4,
  ColumnViewWidget;

  procedure LoadAppList(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    cv: PColumnViewWidget absolute Data;
    pool: PAsPool;
    err: PGError = nil;
    cbox: PAsComponentBox;
    total_apps: Tgint;
    comp: PAsComponent;
    name, kind_str, homepage: Pgchar;
    kind: TAsComponentKind;
    i: integer;
  begin
    pool := as_pool_new;

//    as_pool_add_extra_data_location(pool, '/var/cache/appstream', AS_FORMAT_STYLE_CATALOG);
//    as_pool_add_extra_data_location(pool, '/var/lib/flatpak/appstream', AS_FORMAT_STYLE_CATALOG);
//    as_pool_add_extra_data_location(pool, '/usr/share/appstream', AS_FORMAT_STYLE_CATALOG);

    as_pool_set_flags(pool, AS_POOL_FLAG_LOAD_FLATPAK or AS_POOL_FLAG_LOAD_OS_CATALOG);

    as_pool_load(pool, nil, @err);

    if err <> nil then begin
      g_printf('Fehler: %s'#10, err^.message);
      g_error_free(err);
      g_object_unref(pool);
      Exit;
    end;

    cbox := as_pool_get_components(pool);
    total_apps := as_component_box_len(cbox);

    for  i := 0 to total_apps - 1 do begin
      comp := as_component_box_index_safe(cbox, i);
      name := as_component_get_name(comp);
      kind := as_component_get_kind(comp);
      kind_str := as_component_kind_to_string(kind);

      homepage := as_component_get_url(comp, AS_URL_KIND_HOMEPAGE);
      if homepage = nil then  begin
        homepage := 'Keine Homepage hinterlegt';
      end;

      column_view_sortet_widget_add_item(cv, name, kind_str, homepage);
    end;
    g_object_unref(cbox);
    g_object_unref(pool);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, cv: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);

    gtk_window_set_child(GTK_WINDOW(window), box);

    cv := column_view_sortet_widget_new;
    gtk_box_append(GTK_BOX(box), cv);

    button := gtk_button_new_with_label('Hello World');
    g_signal_connect(button, 'clicked', G_CALLBACK(@LoadAppList), cv);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
