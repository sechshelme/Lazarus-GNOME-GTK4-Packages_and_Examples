unit EntryDialog;

interface

uses
  fp_glib2, fp_GTK4,
  ButtonBox;

type
  TEntryDialog = record
    parent_instance: TGtkWindow;
    n_Datas: Tgint;
    entrys: PPGtkWidget;
  end;
  PEntryDialog = ^TEntryDialog;

  TEntryDialogClass = record
    parent_class: TGtkWindowClass;
  end;
  PEntryDialogClass = ^TEntryDialogClass;

function entry_dialog_get_type: TGType;
function entry_dialog_new(labels: Pgchar): PGTKWidget;

implementation

// ==== private

var
  parent_class: PEntryDialogClass = nil;
  signal_id: Tguint = 0;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PEntryDialog absolute obj;
begin
  with self^ do begin
    if entrys <> nil then begin
      g_free(entrys);
    end;
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init(g_class: Tgpointer; {%H-}class_data: Tgpointer); cdecl;
begin
  parent_class := g_type_class_peek_parent(g_class);
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  signal_id := g_signal_new('button-clicked', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST or G_SIGNAL_DETAILED, 0, nil, nil, nil, G_TYPE_NONE, 1, G_TYPE_STRV);
end;

procedure init_cp(instance: PGTypeInstance; {%H-}g_class: Tgpointer); cdecl;
var
  self: PGtkWindow absolute instance;
begin
  gtk_window_set_title(self, 'Daten eingeben');
  gtk_window_set_default_size(self, 300, 200);
end;

// ====

procedure emit(self: PEntryDialog);
var
  datas: PPgchar;
  i: Tgint;
begin
  with self^ do begin
    datas := g_new0(SizeOf(Pgchar), n_Datas + 1);
    for i := 0 to n_Datas - 1 do begin
      datas[i] := gtk_editable_get_text(GTK_EDITABLE(entrys[i]));
    end;
    g_signal_emit(self, signal_id, 0, datas);
    g_free(datas);
  end;
end;

procedure button_clicked_cp({%H-}widget: PGtkWidget; index: Tgint; user_data: Tgpointer); cdecl;
var
  self: PEntryDialog absolute user_data;
begin
  case index of
    0: begin
      g_printf('Hilfe....'#10);
    end;
    1: begin
      emit(self);
      gtk_window_destroy(GTK_WINDOW(self));
    end;
    2: begin
      emit(self);
    end;
    3: begin
      gtk_window_destroy(GTK_WINDOW(self));
    end;
  end;
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

function entry_dialog_new(labels: Pgchar): PGTKWidget;
var
  self: PEntryDialog absolute Result;
  contentBox, mainBox, button_box: PGtkWidget;
  lab: PPgchar;
  i: integer;
begin
  self := g_object_new(entry_dialog_get_type, nil);

  mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
  gtk_window_set_child(GTK_WINDOW(Result), mainBox);

  // --- Contens
  contentBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
  gtk_widget_set_vexpand(contentBox, True);
  gtk_box_append(GTK_BOX(mainBox), contentBox);

  with self^ do begin
    if labels <> nil then begin
      n_Datas := 0;
      lab := g_strsplit(labels, ',', -1);
      while lab[n_Datas] <> nil do begin
        Inc(n_Datas);
      end;
      entrys := g_new0(SizeOf(PGtkEntry), n_Datas + 1);

      for i := 0 to n_Datas - 1 do begin
        entrys[i] := CreateEntry(contentBox, lab[i]);
      end;
      g_strfreev(lab);
    end;
  end;

  // --- Buttons
  button_box := button_box_new('Help...,Ok,Apply,Cancel');
  g_signal_connect(button_box, 'button-clicked', G_CALLBACK(@button_clicked_cp), self);
  gtk_box_append(GTK_BOX(mainBox), button_box);
end;

end.
