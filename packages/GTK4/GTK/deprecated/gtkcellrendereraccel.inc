
{$IFDEF read_interface}

type
  PGtkCellRendererAccelMode = ^TGtkCellRendererAccelMode;
  TGtkCellRendererAccelMode = longint;

const
  GTK_CELL_RENDERER_ACCEL_MODE_GTK = 0;
  GTK_CELL_RENDERER_ACCEL_MODE_OTHER = 1;

type
  TGtkCellRendererAccel = record
  end;
  PGtkCellRendererAccel = ^TGtkCellRendererAccel;


function gtk_cell_renderer_accel_get_type: TGType; cdecl; external libgtk4;
function gtk_cell_renderer_accel_new: PGtkCellRenderer; cdecl; external libgtk4;

// === Konventiert am: 29-7-24 17:00:02 ===

function GTK_TYPE_CELL_RENDERER_ACCEL: TGType;
function GTK_CELL_RENDERER_ACCEL(obj: Pointer): PGtkCellRendererAccel;
function GTK_IS_CELL_RENDERER_ACCEL(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_CELL_RENDERER_ACCEL: TGType;
begin
  GTK_TYPE_CELL_RENDERER_ACCEL := gtk_cell_renderer_accel_get_type;
end;

function GTK_CELL_RENDERER_ACCEL(obj: Pointer): PGtkCellRendererAccel;
begin
  Result := PGtkCellRendererAccel(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER_ACCEL));
end;

function GTK_IS_CELL_RENDERER_ACCEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CELL_RENDERER_ACCEL);
end;



{$ENDIF read_implementation}
