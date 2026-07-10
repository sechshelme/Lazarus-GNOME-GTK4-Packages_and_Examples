unit gtkcellrendereraccel;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkcellrenderer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGtkCellRendererAccelMode = ^TGtkCellRendererAccelMode;
  TGtkCellRendererAccelMode = longint;
const
  GTK_CELL_RENDERER_ACCEL_MODE_GTK = 0;
  GTK_CELL_RENDERER_ACCEL_MODE_OTHER = 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkCellRendererAccel = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_cell_renderer_accel_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_cell_renderer_accel_new: PGtkCellRenderer; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:39:14 ===

function GTK_TYPE_CELL_RENDERER_ACCEL: TGType;
function GTK_CELL_RENDERER_ACCEL(obj: Pointer): PGtkCellRendererAccel;
function GTK_IS_CELL_RENDERER_ACCEL(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

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



end.
