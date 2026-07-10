

  {$IFDEF read_struct}
type
  PGtkCellRendererPixbuf = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_cell_renderer_pixbuf_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_cell_renderer_pixbuf_new: PGtkCellRenderer; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:39:06 ===

function GTK_TYPE_CELL_RENDERER_PIXBUF: TGType;
function GTK_CELL_RENDERER_PIXBUF(obj: Pointer): PGtkCellRendererPixbuf;
function GTK_IS_CELL_RENDERER_PIXBUF(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_CELL_RENDERER_PIXBUF: TGType;
begin
  GTK_TYPE_CELL_RENDERER_PIXBUF := gtk_cell_renderer_pixbuf_get_type;
end;

function GTK_CELL_RENDERER_PIXBUF(obj: Pointer): PGtkCellRendererPixbuf;
begin
  Result := PGtkCellRendererPixbuf(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER_PIXBUF));
end;

function GTK_IS_CELL_RENDERER_PIXBUF(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CELL_RENDERER_PIXBUF);
end;



{$ENDIF read_implementation}
