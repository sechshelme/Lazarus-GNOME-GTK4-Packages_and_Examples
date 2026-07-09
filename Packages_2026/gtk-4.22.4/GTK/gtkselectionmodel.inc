

  {$IFDEF read_struct}
type
  PGtkSelectionModel = type Pointer;

  PGtkSelectionModelInterface = ^TGtkSelectionModelInterface;
  TGtkSelectionModelInterface = record
    g_iface: TGTypeInterface;
    is_selected: function(model: PGtkSelectionModel; position: Tguint): Tgboolean; cdecl;
    get_selection_in_range: function(model: PGtkSelectionModel; position: Tguint; n_items: Tguint): PGtkBitset; cdecl;
    select_item: function(model: PGtkSelectionModel; position: Tguint; unselect_rest: Tgboolean): Tgboolean; cdecl;
    unselect_item: function(model: PGtkSelectionModel; position: Tguint): Tgboolean; cdecl;
    select_range: function(model: PGtkSelectionModel; position: Tguint; n_items: Tguint; unselect_rest: Tgboolean): Tgboolean; cdecl;
    unselect_range: function(model: PGtkSelectionModel; position: Tguint; n_items: Tguint): Tgboolean; cdecl;
    select_all: function(model: PGtkSelectionModel): Tgboolean; cdecl;
    unselect_all: function(model: PGtkSelectionModel): Tgboolean; cdecl;
    set_selection: function(model: PGtkSelectionModel; selected: PGtkBitset; mask: PGtkBitset): Tgboolean; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_selection_model_get_type: TGType; cdecl; external libgtk4;
function gtk_selection_model_is_selected(model: PGtkSelectionModel; position: Tguint): Tgboolean; cdecl; external libgtk4;
function gtk_selection_model_get_selection(model: PGtkSelectionModel): PGtkBitset; cdecl; external libgtk4;
function gtk_selection_model_get_selection_in_range(model: PGtkSelectionModel; position: Tguint; n_items: Tguint): PGtkBitset; cdecl; external libgtk4;
function gtk_selection_model_select_item(model: PGtkSelectionModel; position: Tguint; unselect_rest: Tgboolean): Tgboolean; cdecl; external libgtk4;
function gtk_selection_model_unselect_item(model: PGtkSelectionModel; position: Tguint): Tgboolean; cdecl; external libgtk4;
function gtk_selection_model_select_range(model: PGtkSelectionModel; position: Tguint; n_items: Tguint; unselect_rest: Tgboolean): Tgboolean; cdecl; external libgtk4;
function gtk_selection_model_unselect_range(model: PGtkSelectionModel; position: Tguint; n_items: Tguint): Tgboolean; cdecl; external libgtk4;
function gtk_selection_model_select_all(model: PGtkSelectionModel): Tgboolean; cdecl; external libgtk4;
function gtk_selection_model_unselect_all(model: PGtkSelectionModel): Tgboolean; cdecl; external libgtk4;
function gtk_selection_model_set_selection(model: PGtkSelectionModel; selected: PGtkBitset; mask: PGtkBitset): Tgboolean; cdecl; external libgtk4;
procedure gtk_selection_model_selection_changed(model: PGtkSelectionModel; position: Tguint; n_items: Tguint); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:06:49 ===

function GTK_TYPE_SELECTION_MODEL: TGType;
function GTK_SELECTION_MODEL(obj: Pointer): PGtkSelectionModel;
function GTK_IS_SELECTION_MODEL(obj: Pointer): Tgboolean;
function GTK_SELECTION_MODEL_GET_IFACE(obj: Pointer): PGtkSelectionModelInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_SELECTION_MODEL: TGType;
begin
  Result := gtk_selection_model_get_type;
end;

function GTK_SELECTION_MODEL(obj: Pointer): PGtkSelectionModel;
begin
  Result := PGtkSelectionModel(g_type_check_instance_cast(obj, GTK_TYPE_SELECTION_MODEL));
end;

function GTK_IS_SELECTION_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SELECTION_MODEL);
end;

function GTK_SELECTION_MODEL_GET_IFACE(obj: Pointer): PGtkSelectionModelInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_SELECTION_MODEL);
end;

{$ENDIF read_implementation}
