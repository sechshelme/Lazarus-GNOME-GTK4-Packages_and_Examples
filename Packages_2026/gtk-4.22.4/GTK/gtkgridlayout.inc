

  {$IFDEF read_struct}
type
  PGtkGridLayout = type Pointer;

  TGtkGridLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkGridLayoutClass = ^TGtkGridLayoutClass;

type
  PGtkGridLayoutChild = type Pointer;

  TGtkGridLayoutChildClass = record
    parent_class: TGtkLayoutChildClass;
  end;
  PGtkGridLayoutChildClass = ^TGtkGridLayoutChildClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_grid_layout_get_type: TGType; cdecl; external libgtk4;
function gtk_grid_layout_child_get_type: TGType; cdecl; external libgtk4;
function gtk_grid_layout_new: PGtkLayoutManager; cdecl; external libgtk4;
procedure gtk_grid_layout_set_row_homogeneous(grid: PGtkGridLayout; homogeneous: Tgboolean); cdecl; external libgtk4;
function gtk_grid_layout_get_row_homogeneous(grid: PGtkGridLayout): Tgboolean; cdecl; external libgtk4;
procedure gtk_grid_layout_set_row_spacing(grid: PGtkGridLayout; spacing: Tguint); cdecl; external libgtk4;
function gtk_grid_layout_get_row_spacing(grid: PGtkGridLayout): Tguint; cdecl; external libgtk4;
procedure gtk_grid_layout_set_column_homogeneous(grid: PGtkGridLayout; homogeneous: Tgboolean); cdecl; external libgtk4;
function gtk_grid_layout_get_column_homogeneous(grid: PGtkGridLayout): Tgboolean; cdecl; external libgtk4;
procedure gtk_grid_layout_set_column_spacing(grid: PGtkGridLayout; spacing: Tguint); cdecl; external libgtk4;
function gtk_grid_layout_get_column_spacing(grid: PGtkGridLayout): Tguint; cdecl; external libgtk4;
procedure gtk_grid_layout_set_row_baseline_position(grid: PGtkGridLayout; row: longint; pos: TGtkBaselinePosition); cdecl; external libgtk4;
function gtk_grid_layout_get_row_baseline_position(grid: PGtkGridLayout; row: longint): TGtkBaselinePosition; cdecl; external libgtk4;
procedure gtk_grid_layout_set_baseline_row(grid: PGtkGridLayout; row: longint); cdecl; external libgtk4;
function gtk_grid_layout_get_baseline_row(grid: PGtkGridLayout): longint; cdecl; external libgtk4;
procedure gtk_grid_layout_child_set_row(child: PGtkGridLayoutChild; row: longint); cdecl; external libgtk4;
function gtk_grid_layout_child_get_row(child: PGtkGridLayoutChild): longint; cdecl; external libgtk4;
procedure gtk_grid_layout_child_set_column(child: PGtkGridLayoutChild; column: longint); cdecl; external libgtk4;
function gtk_grid_layout_child_get_column(child: PGtkGridLayoutChild): longint; cdecl; external libgtk4;
procedure gtk_grid_layout_child_set_column_span(child: PGtkGridLayoutChild; span: longint); cdecl; external libgtk4;
function gtk_grid_layout_child_get_column_span(child: PGtkGridLayoutChild): longint; cdecl; external libgtk4;
procedure gtk_grid_layout_child_set_row_span(child: PGtkGridLayoutChild; span: longint); cdecl; external libgtk4;
function gtk_grid_layout_child_get_row_span(child: PGtkGridLayoutChild): longint; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:20:51 ===

function GTK_TYPE_GRID_LAYOUT: TGType;
function GTK_GRID_LAYOUT(obj: Pointer): PGtkGridLayout;
function GTK_IS_GRID_LAYOUT(obj: Pointer): Tgboolean;

function GTK_TYPE_GRID_LAYOUT_CHILD: TGType;
function GTK_GRID_LAYOUT_CHILD(obj: Pointer): PGtkGridLayoutChild;
function GTK_IS_GRID_LAYOUT_CHILD(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_GRID_LAYOUT: TGType;
begin
  Result := gtk_grid_layout_get_type;
end;

function GTK_GRID_LAYOUT(obj: Pointer): PGtkGridLayout;
begin
  Result := PGtkGridLayout(g_type_check_instance_cast(obj, GTK_TYPE_GRID_LAYOUT));
end;

function GTK_IS_GRID_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GRID_LAYOUT);
end;


function GTK_TYPE_GRID_LAYOUT_CHILD: TGType;
begin
  Result := gtk_grid_layout_child_get_type;
end;

function GTK_GRID_LAYOUT_CHILD(obj: Pointer): PGtkGridLayoutChild;
begin
  Result := PGtkGridLayoutChild(g_type_check_instance_cast(obj, GTK_TYPE_GRID_LAYOUT_CHILD));
end;

function GTK_IS_GRID_LAYOUT_CHILD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GRID_LAYOUT_CHILD);
end;

{$ENDIF read_implementation}
