program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4;

procedure quit_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  window: PGtkWindow absolute user_data;
begin
  gtk_window_destroy(window);
end;

function createStringList:PGtkStringList;
         const s:array of Pgchar=('eins','zwei','drei','vier','fünf',nil);
begin
  Result:=gtk_string_list_new(PPgchar( s));
  end;

  procedure setup_stars_listitem_cb(factory: PGtkListItemFactory; list_item: PGtkListItem); cdecl;
var
  widget: PGtkWidget;
begin
  widget := gtk_label_new('');
  gtk_list_item_set_child(list_item, widget);
end;

procedure bind_stars_listitem_cb(factory: PGtkListItemFactory; list_item: PGtkListItem); cdecl;
var
  widget: PGtkWidget;
  stringObj: PGtkStringObject;
begin
  widget := gtk_list_item_get_child(list_item);
  stringObj := PGtkStringObject(gtk_list_item_get_item(list_item));
  gtk_label_set_text(GTK_LABEL(widget), gtk_string_object_get_string(stringObj));
end;

function createComboBox:PGtkWidget;
var
  starsList: PGtkStringList;
  starsSelection: PGtkMultiSelection;
  entry, starsDropDown: PGtkWidget;
  starsFactory: PGtkListItemFactory;
begin
  Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);

  entry:=gtk_entry_new;
  gtk_box_append(GTK_BOX(Result), entry);


  starsList:=createStringList;
  starsSelection:=gtk_multi_selection_new(G_LIST_MODEL(starsList));
  starsFactory:=gtk_signal_list_item_factory_new;

  g_signal_connect (starsFactory, 'setup', G_CALLBACK(@setup_stars_listitem_cb), nil);
  g_signal_connect (starsFactory, 'bind', G_CALLBACK(@bind_stars_listitem_cb), nil);


  starsDropDown:=gtk_drop_down_new(G_LIST_MODEL(starsSelection),nil);
  gtk_box_append(GTK_BOX(Result), starsDropDown);



//  GObjectShowProperty(starsList);

  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, main_box, button, cb: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Drop Down Demo');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    main_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), main_box);


    cb:=createComboBox;
    gtk_box_append(GTK_BOX(main_box), cb);


    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_clicked_cp), window);
    gtk_box_append(GTK_BOX(main_box), button);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.dropdown', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
