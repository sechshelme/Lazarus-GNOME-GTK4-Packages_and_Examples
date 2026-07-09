

  {$IFDEF read_struct}
type
  PGtkColumnViewColumn = type Pointer;
  PGtkColumnViewColumnClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_column_view_column_get_type: TGType; cdecl; external libgtk4;
function gtk_column_view_column_new(title: pchar; factory: PGtkListItemFactory): PGtkColumnViewColumn; cdecl; external libgtk4;
function gtk_column_view_column_get_column_view(self: PGtkColumnViewColumn): PGtkColumnView; cdecl; external libgtk4;
procedure gtk_column_view_column_set_factory(self: PGtkColumnViewColumn; factory: PGtkListItemFactory); cdecl; external libgtk4;
function gtk_column_view_column_get_factory(self: PGtkColumnViewColumn): PGtkListItemFactory; cdecl; external libgtk4;
procedure gtk_column_view_column_set_title(self: PGtkColumnViewColumn; title: pchar); cdecl; external libgtk4;
function gtk_column_view_column_get_title(self: PGtkColumnViewColumn): pchar; cdecl; external libgtk4;
procedure gtk_column_view_column_set_sorter(self: PGtkColumnViewColumn; sorter: PGtkSorter); cdecl; external libgtk4;
function gtk_column_view_column_get_sorter(self: PGtkColumnViewColumn): PGtkSorter; cdecl; external libgtk4;
procedure gtk_column_view_column_set_visible(self: PGtkColumnViewColumn; visible: Tgboolean); cdecl; external libgtk4;
function gtk_column_view_column_get_visible(self: PGtkColumnViewColumn): Tgboolean; cdecl; external libgtk4;
procedure gtk_column_view_column_set_header_menu(self: PGtkColumnViewColumn; menu: PGMenuModel); cdecl; external libgtk4;
function gtk_column_view_column_get_header_menu(self: PGtkColumnViewColumn): PGMenuModel; cdecl; external libgtk4;
procedure gtk_column_view_column_set_fixed_width(self: PGtkColumnViewColumn; fixed_width: longint); cdecl; external libgtk4;
function gtk_column_view_column_get_fixed_width(self: PGtkColumnViewColumn): longint; cdecl; external libgtk4;
procedure gtk_column_view_column_set_resizable(self: PGtkColumnViewColumn; resizable: Tgboolean); cdecl; external libgtk4;
function gtk_column_view_column_get_resizable(self: PGtkColumnViewColumn): Tgboolean; cdecl; external libgtk4;
procedure gtk_column_view_column_set_expand(self: PGtkColumnViewColumn; expand: Tgboolean); cdecl; external libgtk4;
function gtk_column_view_column_get_expand(self: PGtkColumnViewColumn): Tgboolean; cdecl; external libgtk4;
procedure gtk_column_view_column_set_id(self: PGtkColumnViewColumn; id: pchar); cdecl; external libgtk4;
function gtk_column_view_column_get_id(self: PGtkColumnViewColumn): pchar; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:02:13 ===

function GTK_TYPE_COLUMN_VIEW_COLUMN: TGType;
function GTK_COLUMN_VIEW_COLUMN(obj: Pointer): PGtkColumnViewColumn;
function GTK_COLUMN_VIEW_COLUMN_CLASS(klass: Pointer): PGtkColumnViewColumnClass;
function GTK_IS_COLUMN_VIEW_COLUMN(obj: Pointer): Tgboolean;
function GTK_IS_COLUMN_VIEW_COLUMN_CLASS(klass: Pointer): Tgboolean;
function GTK_COLUMN_VIEW_COLUMN_GET_CLASS(obj: Pointer): PGtkColumnViewColumnClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_COLUMN_VIEW_COLUMN: TGType;
begin
  GTK_TYPE_COLUMN_VIEW_COLUMN := gtk_column_view_column_get_type;
end;

function GTK_COLUMN_VIEW_COLUMN(obj: Pointer): PGtkColumnViewColumn;
begin
  Result := PGtkColumnViewColumn(g_type_check_instance_cast(obj, GTK_TYPE_COLUMN_VIEW_COLUMN));
end;

function GTK_COLUMN_VIEW_COLUMN_CLASS(klass: Pointer): PGtkColumnViewColumnClass;
begin
  Result := PGtkColumnViewColumnClass(g_type_check_class_cast(klass, GTK_TYPE_COLUMN_VIEW_COLUMN));
end;

function GTK_IS_COLUMN_VIEW_COLUMN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLUMN_VIEW_COLUMN);
end;

function GTK_IS_COLUMN_VIEW_COLUMN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_COLUMN_VIEW_COLUMN);
end;

function GTK_COLUMN_VIEW_COLUMN_GET_CLASS(obj: Pointer): PGtkColumnViewColumnClass;
begin
  Result := PGtkColumnViewColumnClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
