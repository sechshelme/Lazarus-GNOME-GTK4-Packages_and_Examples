program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_GTK4;

  procedure on_quit_response_cp(widget: PGtkWidget; response_id: Tgint; {%H-}Data: Tgpointer); cdecl;
  var
    app: PGApplication;
  begin
    app := g_application_get_default;
    case response_id of
      GTK_RESPONSE_YES: begin
        g_printf('YES'#10);
        g_application_quit(G_APPLICATION(app));
      end;
      GTK_RESPONSE_NO: begin
        g_printf('NO'#10);
      end;
      GTK_RESPONSE_CANCEL: begin
        g_printf('CANCEL'#10);
      end;
      GTK_RESPONSE_HELP: begin
        g_printf('HELP'#10);
      end;
      99: begin
        g_printf('test'#10);
      end;
    end;
    gtk_window_destroy(GTK_WINDOW(widget));
  end;


  procedure quit_dialog_cp(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
  var
    dialog: PGtkWidget;
  begin
    widget := GTK_WIDGET(gtk_widget_get_root(widget));
    if GTK_IS_WINDOW(widget) then begin
      dialog := gtk_message_dialog_new(GTK_WINDOW(widget), GTK_DIALOG_MODAL, GTK_MESSAGE_WARNING, GTK_BUTTONS_NONE,
        'Möchten sie das Programm wirklich beenden ?');

      gtk_dialog_add_buttons(GTK_DIALOG(dialog),
        'Ja', GTK_RESPONSE_YES,
        'Nein', GTK_RESPONSE_NO,
        'Abbrechen', GTK_RESPONSE_CANCEL,
        'Hilfe', GTK_RESPONSE_HELP,
        'Test', 99,
        nil);

      g_signal_connect(dialog, 'response', G_CALLBACK(@on_quit_response_cp), nil);
//      gtk_widget_show(dialog);

      gtk_widget_set_visible(dialog, True);
//      gtk_window_present(GTK_WINDOW(dialog));
    end;
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer);
  var
    window, box, button, lab: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    gtk_window_set_child(GTK_WINDOW(window), box);

    lab := gtk_label_new('YES / NO Dialog Example');
    gtk_widget_set_size_request(lab, 300, 300);
    gtk_box_append(GTK_BOX(box), lab);

    button := gtk_button_new_with_label('Beenden');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_dialog_cp), app);

    gtk_box_append(GTK_BOX(box), button);

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
