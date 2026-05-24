unit MPPlayerButtonBox;

interface

uses
  fp_glib2, fp_GTK4,
  MPButtonBox;

type
  PMPPlayerButtonBox = type Pointer;
  PMPPlayerButtonBoxClass = type Pointer;

function mp_player_button_box_get_type: TGType;
function mp_player_button_box_new: PGTKWidget;

implementation

// ==== private

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
begin
  mp_button_box_add_item(PMPButtonBox(instance), nil, 'listbox.prev', 'media-skip-backward-symbolic');
  mp_button_box_add_item(PMPButtonBox(instance), nil, 'listbox.backward', 'media-seek-backward-symbolic');
  mp_button_box_add_item(PMPButtonBox(instance), nil, 'listbox.play', 'media-playback-start-symbolic');
  mp_button_box_add_item(PMPButtonBox(instance), nil, 'listbox.pause', 'media-playback-pause-symbolic');
  mp_button_box_add_item(PMPButtonBox(instance), nil, 'listbox.stop', 'media-playback-stop-symbolic');
  mp_button_box_add_item(PMPButtonBox(instance), nil, 'listbox.forward', 'media-seek-forward-symbolic');
  mp_button_box_add_item(PMPButtonBox(instance), nil, 'listbox.next', 'media-skip-forward-symbolic');
  gtk_box_set_spacing(GTK_BOX(instance), 10);
end;


// ==== public

function mp_player_button_box_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(mp_button_box_get_type, @query);

    id := g_type_register_static_simple(mp_button_box_get_type, 'MyPlayerButtonBox',
      query.class_size, nil,
      query.instance_size, @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_player_button_box_new: PGTKWidget;
begin
  Result := g_object_new(mp_player_button_box_get_type, nil);
end;

end.
