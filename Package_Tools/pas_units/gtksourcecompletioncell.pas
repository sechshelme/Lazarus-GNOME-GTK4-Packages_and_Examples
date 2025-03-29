unit gtksourcecompletioncell;

interface

uses
  fp_glib2, fp_pango, fp_GDK4, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGtkSourceCompletionColumn = ^TGtkSourceCompletionColumn;
  TGtkSourceCompletionColumn = longint;

const
  GTK_SOURCE_COMPLETION_COLUMN_ICON = 0;
  GTK_SOURCE_COMPLETION_COLUMN_BEFORE = 1;
  GTK_SOURCE_COMPLETION_COLUMN_TYPED_TEXT = 2;
  GTK_SOURCE_COMPLETION_COLUMN_AFTER = 3;
  GTK_SOURCE_COMPLETION_COLUMN_COMMENT = 4;
  GTK_SOURCE_COMPLETION_COLUMN_DETAILS = 5;

  {G_DECLARE_FINAL_TYPE (GtkSourceCompletionCell, gtk_source_completion_cell, GTK_SOURCE, COMPLETION_CELL, GtkWidget) }

type
  TGtkSourceCompletionCell = record
  end;
  PGtkSourceCompletionCell = ^TGtkSourceCompletionCell;

  TGtkSourceCompletionCellClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkSourceCompletionCellClass = ^TGtkSourceCompletionCellClass;

function gtk_source_completion_cell_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_completion_cell_get_column(self: PGtkSourceCompletionCell): TGtkSourceCompletionColumn; cdecl; external libgtksourceview5;
function gtk_source_completion_cell_get_widget(self: PGtkSourceCompletionCell): PGtkWidget; cdecl; external libgtksourceview5;
procedure gtk_source_completion_cell_set_widget(self: PGtkSourceCompletionCell; child: PGtkWidget); cdecl; external libgtksourceview5;
procedure gtk_source_completion_cell_set_markup(self: PGtkSourceCompletionCell; markup: pchar); cdecl; external libgtksourceview5;
procedure gtk_source_completion_cell_set_icon_name(self: PGtkSourceCompletionCell; icon_name: pchar); cdecl; external libgtksourceview5;
procedure gtk_source_completion_cell_set_gicon(self: PGtkSourceCompletionCell; gicon: PGIcon); cdecl; external libgtksourceview5;
procedure gtk_source_completion_cell_set_paintable(self: PGtkSourceCompletionCell; paintable: PGdkPaintable); cdecl; external libgtksourceview5;
procedure gtk_source_completion_cell_set_text(self: PGtkSourceCompletionCell; Text: pchar); cdecl; external libgtksourceview5;
procedure gtk_source_completion_cell_set_text_with_attributes(self: PGtkSourceCompletionCell; Text: pchar; attrs: PPangoAttrList); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:40:19 ===

function GTK_SOURCE_TYPE_COMPLETION_CELL: TGType;
function GTK_SOURCE_COMPLETION_CELL(obj: Pointer): PGtkSourceCompletionCell;
function GTK_SOURCE_IS_COMPLETION_CELL(obj: Pointer): Tgboolean;

implementation

function GTK_SOURCE_TYPE_COMPLETION_CELL: TGType;
begin
  Result := gtk_source_completion_cell_get_type;
end;

function GTK_SOURCE_COMPLETION_CELL(obj: Pointer): PGtkSourceCompletionCell;
begin
  Result := PGtkSourceCompletionCell(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_COMPLETION_CELL));
end;

function GTK_SOURCE_IS_COMPLETION_CELL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_COMPLETION_CELL);
end;


end.
