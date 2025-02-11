
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkNumericSorter, gtk_numeric_sorter, GTK, NUMERIC_SORTER, GtkSorter) }
type
  TGtkNumericSorter = record
  end;
  PGtkNumericSorter = ^TGtkNumericSorter;

  TGtkNumericSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkNumericSorterClass = ^TGtkNumericSorterClass;

function gtk_numeric_sorter_get_type: TGType; cdecl; external libgtk4;
function gtk_numeric_sorter_new(expression: PGtkExpression): PGtkNumericSorter; cdecl; external libgtk4;
function gtk_numeric_sorter_get_expression(self: PGtkNumericSorter): PGtkExpression; cdecl; external libgtk4;
procedure gtk_numeric_sorter_set_expression(self: PGtkNumericSorter; expression: PGtkExpression); cdecl; external libgtk4;
function gtk_numeric_sorter_get_sort_order(self: PGtkNumericSorter): TGtkSortType; cdecl; external libgtk4;
procedure gtk_numeric_sorter_set_sort_order(self: PGtkNumericSorter; sort_order: TGtkSortType); cdecl; external libgtk4;

// === Konventiert am: 28-7-24 15:01:34 ===

function GTK_TYPE_NUMERIC_SORTER: TGType;
function GTK_NUMERIC_SORTER(obj: Pointer): PGtkNumericSorter;
function GTK_IS_NUMERIC_SORTER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_NUMERIC_SORTER: TGType;
begin
  Result := gtk_numeric_sorter_get_type;
end;

function GTK_NUMERIC_SORTER(obj: Pointer): PGtkNumericSorter;
begin
  Result := PGtkNumericSorter(g_type_check_instance_cast(obj, GTK_TYPE_NUMERIC_SORTER));
end;

function GTK_IS_NUMERIC_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_NUMERIC_SORTER);
end;




{$ENDIF read_implementation}
