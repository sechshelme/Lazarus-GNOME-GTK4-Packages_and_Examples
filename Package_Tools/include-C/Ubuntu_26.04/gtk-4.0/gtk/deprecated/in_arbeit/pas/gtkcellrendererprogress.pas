unit gtkcellrendererprogress;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkcellrenderer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkCellRendererProgress = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_cell_renderer_progress_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_cell_renderer_progress_new: PGtkCellRenderer; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:39:02 ===

function GTK_TYPE_CELL_RENDERER_PROGRESS: TGType;
function GTK_CELL_RENDERER_PROGRESS(obj: Pointer): PGtkCellRendererProgress;
function GTK_IS_CELL_RENDERER_PROGRESS(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_CELL_RENDERER_PROGRESS: TGType;
begin
  GTK_TYPE_CELL_RENDERER_PROGRESS := gtk_cell_renderer_progress_get_type;
end;

function GTK_CELL_RENDERER_PROGRESS(obj: Pointer): PGtkCellRendererProgress;
begin
  Result := PGtkCellRendererProgress(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER_PROGRESS));
end;

function GTK_IS_CELL_RENDERER_PROGRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CELL_RENDERER_PROGRESS);
end;



end.
