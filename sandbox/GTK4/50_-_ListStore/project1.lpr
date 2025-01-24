program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_GDK4,
  fp_GTK4,
  ListBox;

const
  cmdKey='cmdKey';
type
  TCmd = (cmdRemove, cmdRemoveAll, cmdAppend, cmdUp, cmdDown);

  procedure btn_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  const
    index: integer = 0;
  var
    listBox: PGtkWidget absolute Data;
    cmd: TCmd;
  begin
    cmd := TCmd(PtrInt(g_object_get_data(G_OBJECT(widget), cmdKey)));
    WriteLn(cmd);
    case cmd of
      cmdRemove: begin
        ListBoxRemoveItem(listBox);
      end;
      cmdRemoveAll: begin
        ListBoxRemoveAllItem(listBox);
      end;
      cmdAppend: begin
        ListBoxAppendItem(listBox, 'Daniel', 'Maier', index, Random * 2);
      end;
      cmdUp: begin
        ListBoxUp(listBox);
      end;
      cmdDown: begin
        ListBoxDown(listBox);
      end;
    end;
    Inc(index);
  end;

  function CreateBtnButton(label_, icon_name: Pgchar; cmd: TCmd; listBox: PGtkWidget): PGtkWidget;
  var
    box, image, lab: PGtkWidget;
  begin
    box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    image := gtk_image_new_from_icon_name(icon_name);
    lab := gtk_label_new(label_);

    gtk_box_append(GTK_BOX(box), image);
    gtk_box_append(GTK_BOX(box), lab);

    Result := gtk_button_new;
    gtk_button_set_child(GTK_BUTTON(Result), box);
    g_object_set_data(G_OBJECT(Result), cmdKey, Pointer(PtrInt(cmd)));
    g_signal_connect(Result, 'clicked', G_CALLBACK(@btn_click_cp), listBox);
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

    button := CreateBtnButton('Append', 'list-add-symbolic', cmdAppend, lb1);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := CreateBtnButton('Remove', 'list-remove-symbolic', cmdRemove, lb1);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := CreateBtnButton('Remove All', 'list-remove-all-symbolic', cmdRemoveAll, lb1);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := CreateBtnButton('Up', 'go-up-symbolic', cmdUp, lb1);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := CreateBtnButton('Down', 'go-down-symbolic', cmdDown, lb1);
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
