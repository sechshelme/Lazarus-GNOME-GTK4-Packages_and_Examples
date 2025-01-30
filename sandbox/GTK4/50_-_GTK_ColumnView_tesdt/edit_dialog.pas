unit Edit_Dialog;

interface

uses
  fp_glib2, fp_GTK4,
  Common;

procedure AddHuman(selection_model: PGtkSelectionModel);

implementation

procedure item_object_free_cp(Data: Tgpointer); cdecl;
var
  obj: PHuman absolute Data;
begin
  WriteLn(obj^.FirstName, ' ', obj^.LastName, '  (freed)');
  g_free(obj^.FirstName);
  g_free(obj^.LastName);
  g_free(obj);
end;

procedure on_clicked(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
var
  mainWindow, FirstName_entry, LastName_entry: PGtkWidget;
  dialogWindow:PGtkWindow;
  vorname, nachname: pchar;
  selection_model: PGtkSelectionModel absolute user_data;
  FirstNameLabel, LastNameLabel: PGtkWidget;
  FirstName_text, LastName_text: Pgchar;
  cmd: Tgint;
  store: PGListStore;
  human: PHuman;
  obj: Tgpointer;
const
  index: integer = 0;

begin
  cmd := GPOINTER_TO_INT(g_object_get_data(G_OBJECT(selection_model), cmd_Key));
  dialogWindow := g_object_get_data(G_OBJECT(selection_model), dialogWindows_Key);

  if (cmd = cmdOk) or (cmd = cmdApply) then begin
  end;

  if (cmd = cmdOk) or (cmd = cmdCancel) then begin
    gtk_window_destroy(GTK_WINDOW(dialogWindow));
  end;

  if cmd = cmHelp then begin
    g_printf('help....'#10);
  end;

           /////////////////////

    store := g_object_get_data(G_OBJECT(selection_model), store_Key);

    human := g_malloc(SizeOf(THuman));
    human^.Index := index;
    //human^.FirstName := g_strdup(FirstName);
    //human^.LastName := g_strdup(LastName);
    //human^.Age := Age;
    //human^.Size := Size;
    Inc(index);

    obj := g_object_new(G_TYPE_OBJECT, nil);
    g_object_set_data_full(obj, humanObjectKey, human, @item_object_free_cp);
    g_list_store_append(store, obj);
    g_object_unref(obj);

    Inc(index);
end;



procedure AddHuman(selection_model: PGtkSelectionModel);
var
  store: PGListStore;
  obj: PGObject;
  human: PHuman;
  dialgWindow, mainBox, contentBox, lab, FirstName_entry,
    LastName_entry, button_box, help_button, ok_button,
    apply_button, cancel_button: PGtkWidget;
  mainWindow: Tgpointer;
begin
    mainWindow := g_object_get_data(G_OBJECT(selection_model), mainWindows_Key);
    WriteLn('dialog: ':20,PtrUInt(mainWindow));

    dialgWindow := gtk_window_new;

    g_object_set_data(G_OBJECT(selection_model), dialogWindows_Key, dialgWindow);


    gtk_window_set_title(GTK_WINDOW(dialgWindow), 'Daten eingeben');
    gtk_window_set_default_size(GTK_WINDOW(dialgWindow), 300, 200);

    //    gtk_window_set_modal(GTK_WINDOW(dialgWindow), TRUE);
    gtk_window_set_transient_for(GTK_WINDOW(dialgWindow), mainWindow);

    mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(dialgWindow), mainBox);

    // --- Contens
    contentBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_vexpand(contentBox, True);
    gtk_box_append(GTK_BOX(mainBox), contentBox);

    lab := gtk_label_new('Vorname:');
    gtk_widget_set_halign(lab, GTK_ALIGN_START);
    gtk_box_append(GTK_BOX(contentBox), lab);

    FirstName_entry := gtk_entry_new;
    g_object_set_data(G_OBJECT(dialgWindow), FirstName_Entry_Key, FirstName_entry);
    gtk_box_append(GTK_BOX(contentBox), FirstName_entry);

    lab := gtk_label_new('Nachname:');
    gtk_widget_set_halign(lab, GTK_ALIGN_START);
    gtk_box_append(GTK_BOX(contentBox), lab);

    LastName_entry := gtk_entry_new;
    g_object_set_data(G_OBJECT(dialgWindow), LastName_Entry_Key, LastName_entry);
    gtk_box_append(GTK_BOX(contentBox), LastName_entry);

    // --- Buttons
    button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_widget_set_halign(button_box, GTK_ALIGN_END);
    gtk_widget_set_margin_top(button_box, 10);
    gtk_widget_set_margin_end(button_box, 10);
    gtk_widget_set_margin_bottom(button_box, 10);

    help_button := gtk_button_new_with_label('Hilfe');
    g_object_set_data(G_OBJECT(help_button), cmd_Key, GINT_TO_POINTER(cmHelp));
    gtk_box_append(GTK_BOX(button_box), help_button);
    g_signal_connect(help_button, 'clicked', G_CALLBACK(@on_clicked), selection_model);

    ok_button := gtk_button_new_with_label('OK');
    g_object_set_data(G_OBJECT(ok_button), cmd_Key, GINT_TO_POINTER(cmdOk));
    gtk_box_append(GTK_BOX(button_box), ok_button);
    g_signal_connect(ok_button, 'clicked', G_CALLBACK(@on_clicked), selection_model);

    apply_button := gtk_button_new_with_label('Apply');
    g_object_set_data(G_OBJECT(apply_button), cmd_Key, GINT_TO_POINTER(cmdApply));
    gtk_box_append(GTK_BOX(button_box), apply_button);
    g_signal_connect(apply_button, 'clicked', G_CALLBACK(@on_clicked), selection_model);

    cancel_button := gtk_button_new_with_label('Abbrechen');
    g_object_set_data(G_OBJECT(cancel_button), cmd_Key, GINT_TO_POINTER(cmdCancel));
    gtk_box_append(GTK_BOX(button_box), cancel_button);
    g_signal_connect(cancel_button, 'clicked', G_CALLBACK(@on_clicked), selection_model);

    gtk_box_append(GTK_BOX(mainBox), button_box);

    gtk_window_present(GTK_WINDOW(dialgWindow));
end;


end.
