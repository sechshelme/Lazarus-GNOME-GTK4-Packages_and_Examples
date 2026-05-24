unit MyPlayerButtonBox;

interface

uses
  fp_glib2, fp_GTK4,
  MyButtonBox;

type
  PMyPlayerButtonBox = type Pointer;
  PMyPlayerButtonBoxClass = type Pointer;

function my_player_button_box_get_type: TGType;
function my_player_button_box_new: PGTKWidget;

implementation

// ==== private

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
begin
  my_button_box_add_item(PMyButtonBox(instance), 'Aufnahme', 'record', 'media-record-symbolic');
  my_button_box_add_item(PMyButtonBox(instance), 'Play', 'play', 'media-playback-start-symbolic');
  my_button_box_add_item(PMyButtonBox(instance), 'Stop', 'stop', 'media-playback-stop-symbolic');
  gtk_box_set_spacing(GTK_BOX(instance), 10);
end;


// ==== public

function my_player_button_box_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(my_button_box_get_type, @query);

    id := g_type_register_static_simple(my_button_box_get_type, 'MyPlayerButtonBox',
      query.class_size, @class_init_cp,
      query.instance_size, @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_player_button_box_new: PGTKWidget;
begin
  Result := g_object_new(my_player_button_box_get_type, nil);
end;

end.
