unit MPColumnViewControl;

interface

uses
  fp_glib2, fp_GTK4,
  MPButtonBox;

type
  PMPColumnViewControl = type Pointer;
  PMPColumnViewControlClass = type Pointer;

function mp_column_view_control_get_type: TGType;
function mp_column_view_control_new: PGTKWidget;

implementation

// ==== private

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
begin
  mp_button_box_add_item(PMPButtonBox(instance), 'Append', 'listbox.add', 'list-add');
  mp_button_box_add_item(PMPButtonBox(instance), 'Remove', 'listbox.remove', 'list-remove');
  mp_button_box_add_item(PMPButtonBox(instance), 'Remove listbox.All', 'removeall', 'list-remove-all');
  mp_button_box_add_item(PMPButtonBox(instance), 'Up', 'listbox.up', 'go-up');
  mp_button_box_add_item(PMPButtonBox(instance), 'Down', 'listbox.down', 'go-down');
  gtk_box_set_spacing(GTK_BOX(instance), 10);
end;


// ==== public

function mp_column_view_control_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(mp_button_box_get_type, @query);

    id := g_type_register_static_simple(mp_button_box_get_type, 'MyColumnnViewControl',
      query.class_size, nil,
      query.instance_size, @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_column_view_control_new: PGTKWidget;
begin
  Result := g_object_new(mp_column_view_control_get_type, nil);
end;

end.
