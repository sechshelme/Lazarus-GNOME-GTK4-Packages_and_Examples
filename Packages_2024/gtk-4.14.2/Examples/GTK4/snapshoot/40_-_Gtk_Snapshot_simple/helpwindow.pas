unit HelpWindow;

interface

uses
  fp_glib2, fp_GTK4;

type
  THelpWindow = record
    parent_instance: TGtkWindow;
  end;
  PHelpWindow = ^THelpWindow;

  THelpWindowClass = record
    parent_class: TGtkWindowClass;
  end;
  PHelpWindowClass = ^THelpWindowClass;

function help_window_get_type: TGType;
function help_window_new: PGTKWidget;

implementation

// ==== private

var
  parent_class: PHelpWindowClass = nil;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure button_click_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  self: PGtkWindow absolute user_data;
begin
  gtk_window_destroy(GTK_WINDOW(self));
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PGtkWindow absolute instance;
  box, lab, button: PGtkWidget;
begin
  box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
  gtk_window_set_child(self, box);
  gtk_window_set_default_size(self, 400, 300);

  lab := gtk_label_new('Ich bin eine Hilfe');
  gtk_widget_set_vexpand(lab, True);
  gtk_widget_set_hexpand(lab, True);
  gtk_box_append(GTK_BOX(box), lab);

  button := gtk_button_new_with_label('close');
  gtk_box_append(GTK_BOX(box), button);
  g_signal_connect(button, 'clicked', G_CALLBACK(@button_click_cp), self);
end;


// ==== public

function help_window_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WINDOW, 'HelpWindow', SizeOf(THelpWindowClass), @class_init, SizeOf(THelpWindow), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function help_window_new: PGTKWidget;
begin
  Result := g_object_new(help_window_get_type, nil);
end;


end.
