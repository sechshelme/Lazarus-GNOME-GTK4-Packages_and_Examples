unit ButtonBox;

interface

uses
  fp_glib2, fp_GTK4;

type
  TButtonBox = record
    parent_instance: TGtkBox;
  end;
  PButtonBox = ^TButtonBox;

  TButtonBoxClass = record
    parent_class: TGtkBoxClass;
  end;
  PButtonBoxClass = ^TButtonBoxClass;

function button_box_get_type: TGType;
function button_box_new(labels: Pgchar): PGTKWidget;

implementation

// ==== private

var
  parent_class: PButtonBoxClass = nil;
  signal_id: Tguint = 0;

procedure class_init(g_class: Tgpointer; {%H-}class_data: Tgpointer); cdecl;
begin
  parent_class := g_type_class_peek_parent(g_class);
  signal_id := g_signal_new('button-clicked', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST or G_SIGNAL_DETAILED, 0, nil, nil, nil, G_TYPE_NONE, 1, G_TYPE_INT);
end;

procedure button_click_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  index: Pointer absolute user_data;
begin
  g_signal_emit(gtk_widget_get_parent(widget), signal_id, 0, index);
end;

procedure init_cp(instance: PGTypeInstance; {%H-}g_class: Tgpointer); cdecl;
var
  self: PGtkWidget absolute instance;
begin
  gtk_orientable_set_orientation(GTK_ORIENTABLE(self), GTK_ORIENTATION_HORIZONTAL);
  gtk_widget_set_halign(self, GTK_ALIGN_END);
  gtk_box_set_spacing(GTK_BOX(self), 5);
  gtk_widget_set_margin_end(self, 10);
  gtk_widget_set_margin_bottom(self, 10);
end;


// ==== public

function button_box_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_BOX, 'ButtonBox', SizeOf(TButtonBoxClass), @class_init, SizeOf(TButtonBox), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function button_box_new(labels: Pgchar): PGTKWidget;
var
  lab: PPgchar;
  i: integer = 0;
  button: PGtkWidget;
  index: Tgint = 0;
begin
  Result := g_object_new(button_box_get_type, nil);
  if labels <> nil then begin
    lab := g_strsplit(labels, ',', -1);
    while lab[i] <> nil do begin
      button := gtk_button_new_with_label(lab[i]);
      gtk_box_append(GTK_BOX(Result), button);
      g_signal_connect(button, 'clicked', G_CALLBACK(@button_click_cp), GINT_TO_POINTER(index));
      inc(index);
      Inc(i);
    end;
    g_strfreev(lab);
  end;
end;


end.
