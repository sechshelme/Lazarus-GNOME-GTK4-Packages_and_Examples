program project1;

uses
  ctypes,
  fp_glib2,
  fp_pango,
  fp_GTK4;

const
  LabelText = 'Ich bin ein wirklich übergrosses endloses Label, das nicht hören will !';

  function CreateLabelBox(mode: TPangoEllipsizeMode): PGtkWidget;
  var
    lab: PGtkWidget;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);

    lab := gtk_label_new(LabelText);
    gtk_widget_set_hexpand(lab, True);
    gtk_label_set_xalign(GTK_LABEL(lab), 0.0);
    gtk_label_set_ellipsize(GTK_LABEL(lab), mode);
    gtk_box_append(GTK_BOX(Result), lab);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, webView, box, toolbar_box, button, lab: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Label');
    gtk_window_set_default_size(GTK_WINDOW(window), 320, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    gtk_box_append(GTK_BOX(box), CreateLabelBox(PANGO_ELLIPSIZE_START));
    gtk_box_append(GTK_BOX(box), CreateLabelBox(PANGO_ELLIPSIZE_MIDDLE));
    gtk_box_append(GTK_BOX(box), CreateLabelBox(PANGO_ELLIPSIZE_END));
    //    gtk_box_append(GTK_BOX(box), CreateLabelBox(PANGO_ELLIPSIZE_NONE));

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
