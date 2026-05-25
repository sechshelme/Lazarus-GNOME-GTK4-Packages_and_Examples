unit MPMainWindow;

interface

uses
  fp_glib2, fp_GTK4,

  Common,

  MPStreamer,
  MPTimerLoop,
  MPVUMeterWidget,
  MPColumnViewBox,
  MPSongItem,
  MPDurationBox,
  MPaction,
  MPButtonBox,
  MPMenuButton,
  MPPlayerButtonBox,
  MPColumnViewControl;

type
  PMPMainWindow = type Pointer;
  PMPMainWindowClass = type Pointer;


function mp_main_window_get_type: TGType;
function mp_main_window_new(sw: PSharedWidget): PGTKWidget;
procedure mp_main_window_add_item(button: PMPMainWindow; lab, id: Pgchar);

implementation

// ==== private

type
  TInstPriv = record
    sharedWidgets: PSharedWidget; // ????
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  instance_size: integer = 0;
  parent_class: PMPMainWindowClass = nil;

function GetPriv(w: Tgpointer): PInstPriv; inline;
begin
  Result := PInstPriv(w + instance_size);
end;

procedure finalize_cp(obj: PGObject); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(obj);
  with priv^ do begin
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  parent_class := g_type_class_peek_parent(g_class);
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
  with priv^ do begin
  end;
end;




// ==== public

function mp_main_window_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_WINDOW, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_WINDOW, 'MyMainWindow',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_main_window_new(sw: PSharedWidget): PGTKWidget;
var
  priv: PInstPriv;
  header_bar, menubutton: PGtkWidget;
begin
  Result := g_object_new(mp_main_window_get_type, nil);
  priv := GetPriv(Result);

  with priv^ do begin
    sharedWidgets := sw;

    // === Self
    gtk_window_set_title(GTK_WINDOW(Result), 'Media Player');
    gtk_window_set_default_size(GTK_WINDOW(Result), 1024, 768);

    // === headerbar
    header_bar := gtk_header_bar_new;
    gtk_window_set_titlebar(GTK_WINDOW(Result), header_bar);

    menubutton := mp_menu_button_new;
    g_signal_connect(menubutton, 'action-triggered', G_CALLBACK(@on_box_action_received), sharedWidgets);
    gtk_header_bar_pack_end(GTK_HEADER_BAR(header_bar), menubutton);
  end;
end;

procedure mp_main_window_add_item(button: PMPMainWindow; lab, id: Pgchar);
var
  priv: PInstPriv;
begin
  priv := GetPriv(button);
  with priv^ do begin
  end;
end;

end.
