program project1;

// https://www.freedesktop.org/software/colord/
// https://github.com/hughsie/colord-gtk

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GTK4,
  fp_colord_gtk4,
  fp_colord;

  //  path = '/usr/share/color/icc/colord/sRGB.icc';
  procedure printProfile(path: Pgchar);
  var
    icc: PCdIcc;
    f: PGFile;
    err: PGError = nil;
    ret: Tgboolean;
    locale: Pgchar;
  begin
    icc := cd_icc_new;
    f := g_file_new_for_path(path);
    ret := cd_icc_load_file(icc, f,
      CD_ICC_LOAD_FLAGS_METADATA,
      nil,
      @err);
    if not ret then begin
      g_print('failed to parse %s: %s'#10, path, err^.message);
      g_error_free(err);
    end else begin
      g_print('Filename:%s'#10, cd_icc_get_filename(icc));
      g_print('License:%s'#10, cd_icc_get_metadata_item(icc, 'License'));
      g_print('LCMS hProfile:%p'#10, cd_icc_get_handle(icc));

      locale := g_getenv('LANG');
      locale := nil;;
      g_print('Description:%s'#10, cd_icc_get_description(icc, locale, nil));
      g_print('Model:%s'#10, cd_icc_get_model(icc, locale, nil));
      g_print('Copyright:%s'#10, cd_icc_get_copyright(icc, locale, nil));
    end;
    if f <> nil then  begin
      g_object_unref(f);
    end;
    if icc <> nil then  begin
      g_object_unref(icc);
    end;
  end;


  procedure cd_window_get_profile_cb(source_object: PGObject; res: PGAsyncResult; Data: Tgpointer); cdecl;
  var
    window: PCdWindow;
    err: PGError = nil;
    profile: PCdProfile;
    path: Pgchar;
  begin
    window := CD_WINDOW(source_object);
    profile := cd_window_get_profile_finish(window, res, @err);
    if profile = nil then begin
      g_printf('failed to get output profile: %s'#10, err^.message);
      g_error_free(err);
      exit;
    end;

    path := cd_profile_get_filename(profile);
    printProfile(path);

    g_printf('screen profile to use %s'#10, cd_profile_get_filename(profile));
    g_object_unref(profile);
  end;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer);
  var
    window: PCdWindow absolute Data;
    cdwindow: PCdWindow;
  begin
    cdwindow := cd_window_new;
    WriteLn(CD_IS_WINDOW(cdwindow));
    cd_window_get_profile(cdwindow, widget, nil, @cd_window_get_profile_cb, widget);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button, cdsamplewidget: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    button := gtk_button_new_with_label('Hello World');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), window);
    gtk_box_append(GTK_BOX(box), button);

    cdsamplewidget := cd_sample_widget_new;
    gtk_widget_set_size_request(cdsamplewidget, 150, 50);
    gtk_box_append(GTK_BOX(box), cdsamplewidget);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
