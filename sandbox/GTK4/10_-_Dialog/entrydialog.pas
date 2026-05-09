unit EntryDialog;

interface

uses
  fp_glib2, fp_GTK4;

type
  TEntryDialog = record
    parent_instance: TGtkWindow;
    FirstName_entry, LastName_entry: PGtkWidget;
  end;
  PEntryDialog = ^TEntryDialog;

  TEntryDialogClass = record
    parent_class: TGtkWindowClass;
  end;
  PEntryDialogClass = ^TEntryDialogClass;

function entry_dialog_get_type: TGType;
function entry_dialog_new: PGTKWidget;

implementation

// ==== private

var
  parent_class: PEntryDialogClass = nil;
  signal_id: Tguint = 0;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  parent_class := g_type_class_peek_parent(g_class);
  signal_id := g_signal_new('button-clicked', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST or G_SIGNAL_DETAILED, 0, nil, nil, nil, G_TYPE_NONE, 2, G_TYPE_STRING, G_TYPE_STRING);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PGtkWindow absolute instance;
begin
  gtk_window_set_title(self, 'Daten eingeben');
  gtk_window_set_default_size(self, 300, 200);
end;

// ====

procedure on_help_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
begin
  g_printf('Hilfe....'#10);
end;

procedure on_apply_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  self: PEntryDialog absolute user_data;
  vorname, lastname: pchar;
begin
  with self^ do begin
    vorname := gtk_editable_get_text(GTK_EDITABLE(FirstName_entry));
    lastname := gtk_editable_get_text(GTK_EDITABLE(LastName_entry));
    g_signal_emit(self, signal_id, 0, vorname, lastname);
  end;
end;

procedure on_close_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  self: PEntryDialog absolute user_data;
begin
  gtk_window_destroy(GTK_WINDOW(self));
end;

procedure on_ok_clicked_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  self: PEntryDialog absolute user_data;
  vorname, lastname: PChar;
begin
  with self^ do begin
    vorname := gtk_editable_get_text(GTK_EDITABLE(FirstName_entry));
    lastname := gtk_editable_get_text(GTK_EDITABLE(LastName_entry));
    g_signal_emit(self, signal_id, 0, vorname, lastname);
  end;
  gtk_window_destroy(GTK_WINDOW(self));
end;


// ==== public

function entry_dialog_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WINDOW, 'EntryDialog', SizeOf(TEntryDialogClass), @class_init, SizeOf(TEntryDialog), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function CreateEntry(contentBox: PGtkWidget; titel: Pgchar): PGtkWidget;
var
  lab, box: PGtkWidget;
begin
  box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

  lab := gtk_label_new(titel);
  gtk_widget_set_halign(lab, GTK_ALIGN_START);
  gtk_box_append(GTK_BOX(box), lab);

  Result := gtk_entry_new;
  gtk_box_append(GTK_BOX(box), Result);

  gtk_box_append(GTK_BOX(contentBox), box);
end;

function entry_dialog_new: PGTKWidget;
var
  self: PEntryDialog absolute Result;
  contentBox, mainBox, button_box, help_button, ok_button, apply_button,
  cancel_button: PGtkWidget;
begin
  self := g_object_new(entry_dialog_get_type, nil);

  mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
  gtk_window_set_child(GTK_WINDOW(Result), mainBox);

  // --- Contens
  contentBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
  gtk_widget_set_vexpand(contentBox, True);
  gtk_box_append(GTK_BOX(mainBox), contentBox);

  self^.FirstName_entry := CreateEntry(contentBox, 'Vorname');
  self^.LastName_entry := CreateEntry(contentBox, 'Nachname');

  // --- Buttons
  button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
  gtk_widget_set_halign(button_box, GTK_ALIGN_END);
  gtk_widget_set_margin_top(button_box, 10);
  gtk_widget_set_margin_end(button_box, 10);
  gtk_widget_set_margin_bottom(button_box, 10);

  help_button := gtk_button_new_with_label('Hilfe');
  gtk_box_append(GTK_BOX(button_box), help_button);
  g_signal_connect(help_button, 'clicked', G_CALLBACK(@on_help_clicked_cp), self);

  ok_button := gtk_button_new_with_label('OK');
  gtk_box_append(GTK_BOX(button_box), ok_button);
  g_signal_connect(ok_button, 'clicked', G_CALLBACK(@on_ok_clicked_cp), self);

  apply_button := gtk_button_new_with_label('Apply');
  gtk_box_append(GTK_BOX(button_box), apply_button);
  g_signal_connect(apply_button, 'clicked', G_CALLBACK(@on_apply_clicked_cp), self);

  cancel_button := gtk_button_new_with_label('Abbrechen');
  gtk_box_append(GTK_BOX(button_box), cancel_button);
  g_signal_connect(cancel_button, 'clicked', G_CALLBACK(@on_close_clicked_cp), self);

  gtk_box_append(GTK_BOX(mainBox), button_box);
end;


end.
