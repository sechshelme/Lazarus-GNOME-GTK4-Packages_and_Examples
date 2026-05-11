unit IndexButton;

interface

uses
  fp_glib2, fp_GTK4;

type
  TIndexButton = record
    parent_instance: TGtkButton;
    index: Tguint;
  end;
  PIndexButton = ^TIndexButton;

function index_button_get_type: TGType;
function index_button_new(_label: pchar; index: Tguint): PGtkWidget;
function index_button_get_index(self: PGtkWidget): Tguint;


implementation

// ==== public

function index_button_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_BUTTON, 'IndexButton', SizeOf(TGtkButtonClass), nil, SizeOf(TIndexButton), nil, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function index_button_new(_label: pchar; index: Tguint): PGtkWidget;
var
  self: PIndexButton absolute Result;
begin
  Result := GTK_WIDGET(g_object_new(index_button_get_type, nil));
  gtk_button_set_label(GTK_BUTTON(Result), _label);
  self^.index := index;
end;

function index_button_get_index(self: PGtkWidget): Tguint;
begin
  Result := PIndexButton(self)^.index;
end;

end.
