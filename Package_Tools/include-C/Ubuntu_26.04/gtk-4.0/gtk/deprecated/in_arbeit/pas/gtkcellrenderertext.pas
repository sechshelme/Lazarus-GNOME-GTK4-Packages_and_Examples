unit gtkcellrenderertext;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkcellrenderer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkCellRendererText = ^TGtkCellRendererText;
  TGtkCellRendererText = record
    parent: TGtkCellRenderer;
  end;

  PGtkCellRendererTextClass = ^TGtkCellRendererTextClass;
  TGtkCellRendererTextClass = record
    parent_class: TGtkCellRendererClass;
    edited: procedure(cell_renderer_text: PGtkCellRendererText; path: pchar; new_text: pchar); cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_cell_renderer_text_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_cell_renderer_text_new: PGtkCellRenderer; cdecl; external libgtk4; deprecated;
procedure gtk_cell_renderer_text_set_fixed_height_from_font(renderer: PGtkCellRendererText; number_of_rows: longint); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:38:41 ===

function GTK_TYPE_CELL_RENDERER_TEXT: TGType;
function GTK_CELL_RENDERER_TEXT(obj: Pointer): PGtkCellRendererText;
function GTK_CELL_RENDERER_TEXT_CLASS(klass: Pointer): PGtkCellRendererTextClass;
function GTK_IS_CELL_RENDERER_TEXT(obj: Pointer): Tgboolean;
function GTK_IS_CELL_RENDERER_TEXT_CLASS(klass: Pointer): Tgboolean;
function GTK_CELL_RENDERER_TEXT_GET_CLASS(obj: Pointer): PGtkCellRendererTextClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_CELL_RENDERER_TEXT: TGType;
begin
  GTK_TYPE_CELL_RENDERER_TEXT := gtk_cell_renderer_text_get_type;
end;

function GTK_CELL_RENDERER_TEXT(obj: Pointer): PGtkCellRendererText;
begin
  Result := PGtkCellRendererText(g_type_check_instance_cast(obj, GTK_TYPE_CELL_RENDERER_TEXT));
end;

function GTK_CELL_RENDERER_TEXT_CLASS(klass: Pointer): PGtkCellRendererTextClass;
begin
  Result := PGtkCellRendererTextClass(g_type_check_class_cast(klass, GTK_TYPE_CELL_RENDERER_TEXT));
end;

function GTK_IS_CELL_RENDERER_TEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CELL_RENDERER_TEXT);
end;

function GTK_IS_CELL_RENDERER_TEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_CELL_RENDERER_TEXT);
end;

function GTK_CELL_RENDERER_TEXT_GET_CLASS(obj: Pointer): PGtkCellRendererTextClass;
begin
  Result := PGtkCellRendererTextClass(PGTypeInstance(obj)^.g_class);
end;



end.
