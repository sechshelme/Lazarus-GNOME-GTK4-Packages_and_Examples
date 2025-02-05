unit Edit_Dialog;

interface

uses
  fp_glib2, fp_GTK4,
  Common;

procedure item_object_free_cp(Data: Tgpointer); cdecl;
procedure AddItem(store: PGListStore; FirstName: Pgchar; LastName: Pgchar; Age: Tgint; size: Tgfloat);
procedure AddHumanDialog(selection_model: PGtkSelectionModel);

implementation


const
  cmd_Key = 'cmd';
  cmdOk = 1000;
  cmdCancel = 1001;
  cmdAdd = 1002;
  cmHelp = 1003;

type
  TDialogData = record
    selection_model: PGtkSelectionModel;
    dialogWindow,
    FirstName_entry, LastName_entry: PGtkWidget;
  end;
  PDialogData = ^TDialogData;

procedure item_object_free_cp(Data: Tgpointer); cdecl;
var
  obj: PHuman absolute Data;
begin
  WriteLn(obj^.FirstName, ' ', obj^.LastName, '  (freed)');
  g_free(obj^.FirstName);
  g_free(obj^.LastName);
  g_free(obj);
end;


procedure AddItem(store: PGListStore; FirstName: Pgchar; LastName: Pgchar; Age: Tgint; size: Tgfloat);
var
  obj: PGObject;
  human: PHuman;
const
  index: integer = 0;
begin
  human := g_malloc(SizeOf(THuman));
  human^.Index := index;
  human^.FirstName := g_strdup(FirstName);
  human^.LastName := g_strdup(LastName);
  human^.Age := Age;
  human^.Size := Size;
  Inc(index);

  obj := g_object_new(G_TYPE_OBJECT, nil);
  g_object_set_data_full(obj, humanObjectKey, human, @item_object_free_cp);
  g_list_store_append(store, obj);
  g_object_unref(obj);
end;


procedure on_clicked(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
var
  FirstName_text, LastName_text: Pgchar;
  cmd: Tgint;
  store: PGListStore;
  dialogData: PDialogData absolute user_data;
begin
  cmd := GPOINTER_TO_INT(g_object_get_data(G_OBJECT(widget), cmd_Key));
  store := g_object_get_data(G_OBJECT(dialogData^.selection_model), store_Key);

  if (cmd = cmdOk) or (cmd = cmdAdd) then begin
    FirstName_text := gtk_editable_get_text(GTK_EDITABLE(dialogData^.FirstName_entry));
    LastName_text := gtk_editable_get_text(GTK_EDITABLE(dialogData^.LastName_entry));

    AddItem(store, FirstName_text, LastName_text, Random(90) + 10, Random * 1.5 + 0.5);
  end;

  if (cmd = cmdOk) or (cmd = cmdCancel) then begin
    gtk_window_destroy(GTK_WINDOW(dialogData^.dialogWindow));
  end;

  if cmd = cmHelp then begin
    g_printf('help....'#10);
  end;
end;

procedure destroy_Dialog_cp({%H-}widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  dialogData: PDialogData absolute user_data;
begin
  g_free(dialogData);
end;

procedure AddHumanDialog(selection_model: PGtkSelectionModel);
var
  mainBox, contentBox, lab,
  button_box, help_button, ok_button,
  add_button, cancel_button: PGtkWidget;
  mainWindow: PGtkWindow;
  dialogData: PDialogData;
begin
  mainWindow := g_object_get_data(G_OBJECT(selection_model), mainWindows_Key);

  dialogData := g_malloc(SizeOf(TDialogData));
  dialogData^.selection_model := selection_model;

  dialogData^.dialogWindow := gtk_window_new;

  gtk_window_set_title(GTK_WINDOW(dialogData^.dialogWindow), 'Daten eingeben');
  gtk_window_set_default_size(GTK_WINDOW(dialogData^.dialogWindow), 300, 200);

  //    gtk_window_set_modal(GTK_WINDOW(dialgWindow), TRUE);
  gtk_window_set_transient_for(GTK_WINDOW(dialogData^.dialogWindow), mainWindow);

  mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
  gtk_window_set_child(GTK_WINDOW(dialogData^.dialogWindow), mainBox);

  // --- Contens
  contentBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
  gtk_widget_set_vexpand(contentBox, True);
  gtk_box_append(GTK_BOX(mainBox), contentBox);

  lab := gtk_label_new('Vorname:');
  gtk_widget_set_halign(lab, GTK_ALIGN_START);
  gtk_box_append(GTK_BOX(contentBox), lab);

  dialogData^.FirstName_entry := gtk_entry_new;
  gtk_box_append(GTK_BOX(contentBox), dialogData^.FirstName_entry);

  lab := gtk_label_new('Nachname:');
  gtk_widget_set_halign(lab, GTK_ALIGN_START);
  gtk_box_append(GTK_BOX(contentBox), lab);

  dialogData^.LastName_entry := gtk_entry_new;
  gtk_box_append(GTK_BOX(contentBox), dialogData^.LastName_entry);

  // --- Buttons
  button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
  gtk_widget_set_halign(button_box, GTK_ALIGN_END);
  gtk_widget_set_margin_top(button_box, 10);
  gtk_widget_set_margin_end(button_box, 10);
  gtk_widget_set_margin_bottom(button_box, 10);

  help_button := gtk_button_new_with_label('Hilfe');
  g_object_set_data(G_OBJECT(help_button), cmd_Key, GINT_TO_POINTER(cmHelp));
  gtk_box_append(GTK_BOX(button_box), help_button);
  g_signal_connect(help_button, 'clicked', G_CALLBACK(@on_clicked), dialogData);

  ok_button := gtk_button_new_with_label('OK');
  g_object_set_data(G_OBJECT(ok_button), cmd_Key, GINT_TO_POINTER(cmdOk));
  gtk_box_append(GTK_BOX(button_box), ok_button);
  g_signal_connect(ok_button, 'clicked', G_CALLBACK(@on_clicked), dialogData);

  add_button := gtk_button_new_with_label('Add');
  g_object_set_data(G_OBJECT(add_button), cmd_Key, GINT_TO_POINTER(cmdAdd));
  gtk_box_append(GTK_BOX(button_box), add_button);
  g_signal_connect(add_button, 'clicked', G_CALLBACK(@on_clicked), dialogData);

  cancel_button := gtk_button_new_with_label('Abbrechen');
  g_object_set_data(G_OBJECT(cancel_button), cmd_Key, GINT_TO_POINTER(cmdCancel));
  gtk_box_append(GTK_BOX(button_box), cancel_button);
  g_signal_connect(cancel_button, 'clicked', G_CALLBACK(@on_clicked), dialogData);

  gtk_box_append(GTK_BOX(mainBox), button_box);

  //  g_free(dialogData);

  g_signal_connect(dialogData^.dialogWindow, 'destroy', G_CALLBACK(@destroy_Dialog_cp), dialogData);
  gtk_window_present(GTK_WINDOW(dialogData^.dialogWindow));
end;


end.
