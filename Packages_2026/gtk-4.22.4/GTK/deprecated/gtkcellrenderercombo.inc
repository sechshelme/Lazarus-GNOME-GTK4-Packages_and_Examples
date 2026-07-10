

  {$IFDEF read_struct}
type
  PGtkCellRendererCombo = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_cell_renderer_combo_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_cell_renderer_combo_new: PGtkCellRenderer; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:39:10 ===

function GTK_TYPE_CELL_RENDERER_COMBO: TGType;
function GTK_CELL_RENDERER_COMBO(obj: Pointer): PGtkCellRendererCombo;
function GTK_IS_CELL_RENDERER_COMBO(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_CELL_RENDERER_COMBO: TGType;
begin
  GTK_TYPE_CELL_RENDERER_COMBO := gtk_cell_renderer_combo_get_type;
end;

function GTK_CELL_RENDERER_COMBO(obj: Pointer): PGtkCellRendererCombo;
begin
  Result := PGtkCellRendererCombo(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER_COMBO));
end;

function GTK_IS_CELL_RENDERER_COMBO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CELL_RENDERER_COMBO);
end;



{$ENDIF read_implementation}
