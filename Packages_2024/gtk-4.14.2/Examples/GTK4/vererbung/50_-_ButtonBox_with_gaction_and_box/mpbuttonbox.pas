unit MPButtonBox;

interface

uses
  fp_glib2, fp_GTK4;

type
  PMPButtonBox = type Pointer;
  PMPButtonBoxClass = type Pointer;

function mp_button_box_get_type: TGType;
function mp_button_box_new: PGTKWidget;
procedure mp_button_box_add_item(box: PMPButtonBox; lab, id, icon_name: Pgchar);

implementation

// ==== private

var
  signal_id: Tguint = 0;

procedure on_action_activated(widget: PGtkWidget; action_name: pchar; parameter: PGVariant); cdecl;
var
  button_id: Pgchar;
begin
  button_id := g_variant_get_string(parameter, nil);
  g_signal_emit(widget, signal_id, 0, button_id);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  gtk_widget_class_install_action(GTK_WIDGET_CLASS(g_class), 'box.click', 's', @on_action_activated);
  signal_id := g_signal_new('action-triggered', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST, 0, nil, nil, nil, G_TYPE_NONE, 1, G_TYPE_STRING);
end;

// ==== public

function mp_button_box_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_BOX, @query);

    id := g_type_register_static_simple(GTK_TYPE_BOX, 'MyButtonBox',
      query.class_size, @class_init_cp,
      query.instance_size, nil, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_button_box_new: PGTKWidget;
begin
  Result := g_object_new(mp_button_box_get_type, nil);
end;

procedure mp_button_box_add_item(box: PMPButtonBox; lab, id, icon_name: Pgchar);
var
  btn, b, image, label_: PGtkWidget;
  spec: Pgchar;
begin
  b := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
  gtk_widget_set_halign(b, GTK_ALIGN_CENTER);

  if icon_name <> nil then begin;
    image := gtk_image_new_from_icon_name(icon_name);
    gtk_box_append(GTK_BOX(b), image);
  end;

  if lab <> nil then begin
    label_ := gtk_label_new(lab);
    gtk_box_append(GTK_BOX(b), label_);
  end;

  btn := gtk_button_new;
  gtk_button_set_child(GTK_BUTTON(btn), b);

  spec := g_strdup_printf('box.click(''%s'')', id);
  gtk_actionable_set_detailed_action_name(GTK_ACTIONABLE(btn), spec);
  g_free(spec);

  gtk_box_append(GTK_BOX(box), btn);
end;

end.
