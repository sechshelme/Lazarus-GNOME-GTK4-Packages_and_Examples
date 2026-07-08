unit gtkstringsorter;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtksorter, gtkexpression;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkStringSorter = type Pointer;

  TGtkStringSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkStringSorterClass = ^TGtkStringSorterClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_string_sorter_get_type: TGType; cdecl; external libgtk4;
function gtk_string_sorter_new(expression: PGtkExpression): PGtkStringSorter; cdecl; external libgtk4;
function gtk_string_sorter_get_expression(self: PGtkStringSorter): PGtkExpression; cdecl; external libgtk4;
procedure gtk_string_sorter_set_expression(self: PGtkStringSorter; expression: PGtkExpression); cdecl; external libgtk4;
function gtk_string_sorter_get_ignore_case(self: PGtkStringSorter): Tgboolean; cdecl; external libgtk4;
procedure gtk_string_sorter_set_ignore_case(self: PGtkStringSorter; ignore_case: Tgboolean); cdecl; external libgtk4;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PGtkCollation = ^TGtkCollation;
  TGtkCollation = longint;
const
  GTK_COLLATION_NONE = 0;
  GTK_COLLATION_UNICODE = 1;
  GTK_COLLATION_FILENAME = 2;
  {$ENDIF read_enum}

{$IFDEF read_function}
procedure gtk_string_sorter_set_collation(self: PGtkStringSorter; collation: TGtkCollation); cdecl; external libgtk4;
function gtk_string_sorter_get_collation(self: PGtkStringSorter): TGtkCollation; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:55:19 ===

function GTK_TYPE_STRING_SORTER: TGType;
function GTK_STRING_SORTER(obj: Pointer): PGtkStringSorter;
function GTK_IS_STRING_SORTER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_STRING_SORTER: TGType;
begin
  Result := gtk_string_sorter_get_type;
end;

function GTK_STRING_SORTER(obj: Pointer): PGtkStringSorter;
begin
  Result := PGtkStringSorter(g_type_check_instance_cast(obj, GTK_TYPE_STRING_SORTER));
end;

function GTK_IS_STRING_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STRING_SORTER);
end;




end.
