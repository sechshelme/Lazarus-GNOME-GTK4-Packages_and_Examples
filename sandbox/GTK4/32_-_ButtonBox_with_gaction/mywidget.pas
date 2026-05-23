unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene;

type
  TButtonBoxData = record
    lab, id, icon_name: Pgchar;
  end;
  PButtonBoxData = ^TButtonBoxData;

  PMButtonBox = type Pointer;
  PMButtonBoxClass = type Pointer;

function mp_button_box_get_type: TGType;
function mp_button_box_new(buttons: PButtonBoxData; count: Tgint): PGTKWidget;

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
var
  widget_class: PGtkWidgetClass;
begin
  widget_class := GTK_WIDGET_CLASS(g_class);
  gtk_widget_class_install_action(widget_class, 'box.click', 's', @on_action_activated);

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

    id := g_type_register_static_simple(GTK_TYPE_BOX, 'MPButtonBox',
      query.class_size, @class_init_cp,
      query.instance_size, nil, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_button_box_new(buttons: PButtonBoxData; count: Tgint): PGTKWidget;
var
  btn: PGtkWidget;
  spec: Pgchar;
  i: integer;
begin
  Result := g_object_new(mp_button_box_get_type, nil);
  for i := 0 to count - 1 do begin
    if buttons[i].icon_name <> nil then begin
      btn := gtk_button_new_from_icon_name(buttons[i].icon_name);
      gtk_widget_set_tooltip_text(btn, buttons[i].lab);
    end else begin
      btn := gtk_button_new_with_label(buttons[i].lab);
    end;

    spec := g_strdup_printf('box.click(''%s'')', buttons[i].id);
    gtk_actionable_set_detailed_action_name(GTK_ACTIONABLE(btn), spec);
    g_free(spec);
    gtk_box_append(GTK_BOX(Result), btn);
  end;
end;

end.
