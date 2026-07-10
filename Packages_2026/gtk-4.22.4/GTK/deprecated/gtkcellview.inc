

  {$IFDEF read_enum}
type
  PGtkCellView = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_cell_view_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_cell_view_new: PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_cell_view_new_with_context(area: PGtkCellArea; context: PGtkCellAreaContext): PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_cell_view_new_with_text(text: pchar): PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_cell_view_new_with_markup(markup: pchar): PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_cell_view_new_with_texture(texture: PGdkTexture): PGtkWidget; cdecl; external libgtk4; deprecated;
procedure gtk_cell_view_set_model(cell_view: PGtkCellView; model: PGtkTreeModel); cdecl; external libgtk4; deprecated;
function gtk_cell_view_get_model(cell_view: PGtkCellView): PGtkTreeModel; cdecl; external libgtk4; deprecated;
procedure gtk_cell_view_set_displayed_row(cell_view: PGtkCellView; path: PGtkTreePath); cdecl; external libgtk4; deprecated;
function gtk_cell_view_get_displayed_row(cell_view: PGtkCellView): PGtkTreePath; cdecl; external libgtk4; deprecated;
function gtk_cell_view_get_draw_sensitive(cell_view: PGtkCellView): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_cell_view_set_draw_sensitive(cell_view: PGtkCellView; draw_sensitive: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_cell_view_get_fit_model(cell_view: PGtkCellView): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_cell_view_set_fit_model(cell_view: PGtkCellView; fit_model: Tgboolean); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:38:29 ===

function GTK_TYPE_CELL_VIEW: TGType;
function GTK_CELL_VIEW(obj: Pointer): PGtkCellView;
function GTK_IS_CELL_VIEW(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_CELL_VIEW: TGType;
begin
  GTK_TYPE_CELL_VIEW := gtk_cell_view_get_type;
end;

function GTK_CELL_VIEW(obj: Pointer): PGtkCellView;
begin
  Result := PGtkCellView(g_type_check_instance_cast(obj, GTK_TYPE_CELL_VIEW));
end;

function GTK_IS_CELL_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CELL_VIEW);
end;



{$ENDIF read_implementation}
