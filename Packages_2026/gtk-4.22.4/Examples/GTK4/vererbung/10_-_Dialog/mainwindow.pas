unit MainWindow;

interface

uses
  fp_glib2, fp_GTK4,
  EntryDialog;

type
  TMainWindow = record
    parent_instance: TGtkWindow;
    labels: PPGtkWidget;
    n_Datas: integer;
  end;
  PMainWindow = ^TMainWindow;

  TMainWindowClass = record
    parent_class: TGtkWindowClass;
  end;
  PMainWindowClass = ^TMainWindowClass;

function main_window_get_type: TGType;
function main_window_new: PGTKWidget;

const
  Titles = 'Firstname,Lastname,Adress,City,dfdsf dfdsf sdf fsd fsdf dsf sdf dsf';

implementation

// ==== private

var
  parent_class: PMainWindowClass = nil;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMainWindow absolute obj;
begin
  with self^ do begin
    if labels <> nil then begin
      g_free(labels);
    end;
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init(g_class: Tgpointer; {%H-}class_data: Tgpointer); cdecl;
begin
  parent_class := g_type_class_peek_parent(g_class);
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
end;

// ====

procedure entry_button_clicked_cp({%H-}widget: PGtkWidget; datas: PPgchar; {%H-}user_data: Tgpointer); cdecl;
var
  self: PMainWindow absolute user_data;
  i: integer;
begin
  if datas <> nil then begin
    i := 0;
    while datas[i] <> nil do begin
      gtk_label_set_label(GTK_LABEL(self^.labels[i]), datas[i]);
      Inc(i);
    end;
  end;
end;

procedure button_dialog_clicked_neu_cp({%H-}widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
var
  self: PMainWindow absolute user_data;
const
  entry_dialog: PGtkWidget = nil;
begin
  if entry_dialog = nil then begin
    entry_dialog := entry_dialog_new(Titles);
    g_signal_connect_swapped(entry_dialog, 'destroy', G_CALLBACK(@g_nullify_pointer), @entry_dialog);
    g_signal_connect(entry_dialog, 'button-clicked', G_CALLBACK(@entry_button_clicked_cp), self);
  end;
  gtk_window_present(GTK_WINDOW(entry_dialog));
end;

procedure init_cp(instance: PGTypeInstance; {%H-}g_class: Tgpointer); cdecl;
var
  self: PMainWindow absolute instance;
  mainBox, button: PGtkWidget;
  lab: PPgchar;
  i: Integer;
begin
  gtk_window_set_title(GTK_WINDOW(self), 'Data Entry Demo');
  gtk_window_set_default_size(GTK_WINDOW(self), 320, 200);

  mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
  gtk_window_set_child(GTK_WINDOW(self), mainBox);

  with self^ do begin
    n_Datas := 0;
    lab := g_strsplit(Titles, ',', -1);
    while lab[n_Datas] <> nil do begin
      Inc(n_Datas);
    end;
    labels := g_new0(SizeOf(PGtkLabel), n_Datas + 1);

    for i := 0 to n_Datas - 1 do begin
      WriteLn(lab[i]);
      labels[i] := gtk_label_new(lab[i]);
      gtk_box_append(GTK_BOX(mainBox), labels[i]);
    end;
    g_strfreev(lab);
  end;

  button := gtk_button_new_with_label('Daten eingeben neu');
  g_signal_connect(button, 'clicked', G_CALLBACK(@button_dialog_clicked_neu_cp), self);
  gtk_box_append(GTK_BOX(mainBox), button);
end;

// ==== public

function main_window_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WINDOW, 'MainWindow', SizeOf(TMainWindowClass), @class_init, SizeOf(TMainWindow), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function main_window_new: PGTKWidget;
begin
  Result := g_object_new(main_window_get_type, nil);
end;


end.
