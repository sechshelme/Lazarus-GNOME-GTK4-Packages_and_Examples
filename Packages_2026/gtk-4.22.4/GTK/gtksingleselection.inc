

  {$IFDEF read_struct}
type
  PGtkSingleSelection = type Pointer;

  TGtkSingleSelectionClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSingleSelectionClass = ^TGtkSingleSelectionClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_single_selection_get_type: TGType; cdecl; external libgtk4;
function gtk_single_selection_new(model: PGListModel): PGtkSingleSelection; cdecl; external libgtk4;
function gtk_single_selection_get_model(self: PGtkSingleSelection): PGListModel; cdecl; external libgtk4;
procedure gtk_single_selection_set_model(self: PGtkSingleSelection; model: PGListModel); cdecl; external libgtk4;
function gtk_single_selection_get_selected(self: PGtkSingleSelection): Tguint; cdecl; external libgtk4;
procedure gtk_single_selection_set_selected(self: PGtkSingleSelection; position: Tguint); cdecl; external libgtk4;
function gtk_single_selection_get_selected_item(self: PGtkSingleSelection): Tgpointer; cdecl; external libgtk4;
function gtk_single_selection_get_autoselect(self: PGtkSingleSelection): Tgboolean; cdecl; external libgtk4;
procedure gtk_single_selection_set_autoselect(self: PGtkSingleSelection; autoselect: Tgboolean); cdecl; external libgtk4;
function gtk_single_selection_get_can_unselect(self: PGtkSingleSelection): Tgboolean; cdecl; external libgtk4;
procedure gtk_single_selection_set_can_unselect(self: PGtkSingleSelection; can_unselect: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:00:10 ===

function GTK_TYPE_SINGLE_SELECTION: TGType;
function GTK_SINGLE_SELECTION(obj: Pointer): PGtkSingleSelection;
function GTK_IS_SINGLE_SELECTION(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_SINGLE_SELECTION: TGType;
begin
  Result := gtk_single_selection_get_type;
end;

function GTK_SINGLE_SELECTION(obj: Pointer): PGtkSingleSelection;
begin
  Result := PGtkSingleSelection(g_type_check_instance_cast(obj, GTK_TYPE_SINGLE_SELECTION));
end;

function GTK_IS_SINGLE_SELECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SINGLE_SELECTION);
end;

{$ENDIF read_implementation}
