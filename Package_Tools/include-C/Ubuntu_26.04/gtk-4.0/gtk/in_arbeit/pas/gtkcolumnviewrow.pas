unit gtkcolumnviewrow;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkColumnViewRow = type Pointer;
  PGtkColumnViewRowClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_column_view_row_get_type: TGType; cdecl; external libgtk4;
function gtk_column_view_row_get_item(self: PGtkColumnViewRow): Tgpointer; cdecl; external libgtk4;
function gtk_column_view_row_get_position(self: PGtkColumnViewRow): Tguint; cdecl; external libgtk4;
function gtk_column_view_row_get_selected(self: PGtkColumnViewRow): Tgboolean; cdecl; external libgtk4;
function gtk_column_view_row_get_selectable(self: PGtkColumnViewRow): Tgboolean; cdecl; external libgtk4;
procedure gtk_column_view_row_set_selectable(self: PGtkColumnViewRow; selectable: Tgboolean); cdecl; external libgtk4;
function gtk_column_view_row_get_activatable(self: PGtkColumnViewRow): Tgboolean; cdecl; external libgtk4;
procedure gtk_column_view_row_set_activatable(self: PGtkColumnViewRow; activatable: Tgboolean); cdecl; external libgtk4;
function gtk_column_view_row_get_focusable(self: PGtkColumnViewRow): Tgboolean; cdecl; external libgtk4;
procedure gtk_column_view_row_set_focusable(self: PGtkColumnViewRow; focusable: Tgboolean); cdecl; external libgtk4;
function gtk_column_view_row_get_accessible_description(self: PGtkColumnViewRow): pchar; cdecl; external libgtk4;
procedure gtk_column_view_row_set_accessible_description(self: PGtkColumnViewRow; description: pchar); cdecl; external libgtk4;
function gtk_column_view_row_get_accessible_label(self: PGtkColumnViewRow): pchar; cdecl; external libgtk4;
procedure gtk_column_view_row_set_accessible_label(self: PGtkColumnViewRow; _label: pchar); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:02:03 ===

function GTK_TYPE_COLUMN_VIEW_ROW: TGType;
function GTK_COLUMN_VIEW_ROW(obj: Pointer): PGtkColumnViewRow;
function GTK_IS_COLUMN_VIEW_ROW(obj: Pointer): Tgboolean;
function GTK_COLUMN_VIEW_ROW_CLASS(klass: Pointer): PGtkColumnViewRowClass;
function GTK_IS_COLUMN_VIEW_ROW_CLASS(klass: Pointer): Tgboolean;
function GTK_COLUMN_VIEW_ROW_GET_CLASS(obj: Pointer): PGtkColumnViewRowClass;
{$ENDIF read_struct}

implementation

function GTK_TYPE_COLUMN_VIEW_ROW: TGType;
begin
  Result := gtk_column_view_row_get_type;
end;

function GTK_COLUMN_VIEW_ROW(obj: Pointer): PGtkColumnViewRow;
begin
  Result := PGtkColumnViewRow(g_type_check_instance_cast(obj, GTK_TYPE_COLUMN_VIEW_ROW));
end;

function GTK_IS_COLUMN_VIEW_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLUMN_VIEW_ROW);
end;

function GTK_COLUMN_VIEW_ROW_CLASS(klass: Pointer): PGtkColumnViewRowClass;
begin
  Result := PGtkColumnViewRowClass(g_type_check_class_cast(klass, GTK_TYPE_COLUMN_VIEW_ROW));
end;

function GTK_IS_COLUMN_VIEW_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_COLUMN_VIEW_ROW);
end;

function GTK_COLUMN_VIEW_ROW_GET_CLASS(obj: Pointer): PGtkColumnViewRowClass;
begin
  Result := PGtkColumnViewRowClass(PGTypeInstance(obj)^.g_class);
end;

end.
