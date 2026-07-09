

  {$IFDEF read_struct}
type
  PGtkNoSelection = type Pointer;

  TGtkNoSelectionClass = record
    parent_class: TGObjectClass;
  end;
  PGtkNoSelectionClass = ^TGtkNoSelectionClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_no_selection_get_type: TGType; cdecl; external libgtk4;
function gtk_no_selection_new(model: PGListModel): PGtkNoSelection; cdecl; external libgtk4;
function gtk_no_selection_get_model(self: PGtkNoSelection): PGListModel; cdecl; external libgtk4;
procedure gtk_no_selection_set_model(self: PGtkNoSelection; model: PGListModel); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:18:19 ===

function GTK_TYPE_NO_SELECTION: TGType;
function GTK_NO_SELECTION(obj: Pointer): PGtkNoSelection;
function GTK_IS_NO_SELECTION(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_NO_SELECTION: TGType;
begin
  Result := gtk_no_selection_get_type;
end;

function GTK_NO_SELECTION(obj: Pointer): PGtkNoSelection;
begin
  Result := PGtkNoSelection(g_type_check_instance_cast(obj, GTK_TYPE_NO_SELECTION));
end;

function GTK_IS_NO_SELECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_NO_SELECTION);
end;

{$ENDIF read_implementation}
