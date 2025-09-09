program project1;

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  fp_pango,
  fp_GTK4;

const
  LabelText = 'Ich bin ein wirklich übergrosses endloses Label, das nicht hören will !';


  function CreateLabelBox: PGtkWidget;
  var
    lab: PGtkWidget;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);

    lab := gtk_label_new(LabelText);
    gtk_widget_set_hexpand(lab, True);
    gtk_label_set_xalign(GTK_LABEL(lab), 0.0);
    gtk_label_set_ellipsize(GTK_LABEL(lab), PANGO_ELLIPSIZE_END);
    gtk_box_append(GTK_BOX(Result), lab);
  end;

procedure entry_text_changed(edit: PGtkEditable; user_data: Tgpointer);
var
  p: longint;
  len: Tguint;
  buffer: PGtkEntryBuffer;
  size: Tgsize;
begin
  p := gtk_editable_get_position(edit);

  buffer := gtk_entry_get_buffer(GTK_ENTRY(edit));

  len := gtk_entry_buffer_get_length(buffer);
  size := gtk_entry_buffer_get_bytes(buffer);
  WriteLn('pos: ', p, '  len: ', len, '  size: ', size);
end;

procedure entry_text_notify(entry: PGtkEntry;pspec:PGParamSpec; user_data: Tgpointer);
var
  cp:Tgint;
begin
//  GSignalShow(GTK_TYPE_ENTRY);

//  GObjectShowProperty(entry);
  WriteLn('spec: ',pspec^.name);

  g_object_get(entry, 'cursor-position',@cp,nil);
  WriteLn('cursorpos: ',cp);
end;

  function CreateEntryBox: PGtkWidget;
  var
    entry: PGtkWidget;
    buffer: PGtkEntryBuffer;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);

    buffer := gtk_entry_buffer_new(LabelText, -1);

    entry := gtk_entry_new;
    gtk_entry_set_buffer(GTK_ENTRY(entry), buffer);
    gtk_widget_set_hexpand(entry, True);
    g_signal_connect(entry, 'changed', G_CALLBACK(@entry_text_changed), nil);
//    g_signal_connect(entry, 'notify::cursor-position', G_CALLBACK(@entry_text_notify), nil);
    g_signal_connect(entry, 'notify', G_CALLBACK(@entry_text_notify), nil);

    gtk_box_append(GTK_BOX(Result), entry);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, box: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Label');
    gtk_window_set_default_size(GTK_WINDOW(window), 320, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    gtk_box_append(GTK_BOX(box), CreateLabelBox);

    gtk_box_append(GTK_BOX(box), CreateEntryBox);

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
