

  {$IFDEF read_enum}
type
  PGtkStringFilterMatchMode = ^TGtkStringFilterMatchMode;
  TGtkStringFilterMatchMode = longint;
const
  GTK_STRING_FILTER_MATCH_MODE_EXACT = 0;
  GTK_STRING_FILTER_MATCH_MODE_SUBSTRING = 1;
  GTK_STRING_FILTER_MATCH_MODE_PREFIX = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}

type
  PGtkStringFilter = type Pointer;

  TGtkStringFilterClass = record
    parent_class: TGtkFilterClass;
  end;
  PGtkStringFilterClass = ^TGtkStringFilterClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_string_filter_get_type: TGType; cdecl; external libgtk4;
function gtk_string_filter_new(expression: PGtkExpression): PGtkStringFilter; cdecl; external libgtk4;
function gtk_string_filter_get_search(self: PGtkStringFilter): pchar; cdecl; external libgtk4;
procedure gtk_string_filter_set_search(self: PGtkStringFilter; search: pchar); cdecl; external libgtk4;
function gtk_string_filter_get_expression(self: PGtkStringFilter): PGtkExpression; cdecl; external libgtk4;
procedure gtk_string_filter_set_expression(self: PGtkStringFilter; expression: PGtkExpression); cdecl; external libgtk4;
function gtk_string_filter_get_ignore_case(self: PGtkStringFilter): Tgboolean; cdecl; external libgtk4;
procedure gtk_string_filter_set_ignore_case(self: PGtkStringFilter; ignore_case: Tgboolean); cdecl; external libgtk4;
function gtk_string_filter_get_match_mode(self: PGtkStringFilter): TGtkStringFilterMatchMode; cdecl; external libgtk4;
procedure gtk_string_filter_set_match_mode(self: PGtkStringFilter; mode: TGtkStringFilterMatchMode); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:36:30 ===

function GTK_TYPE_STRING_FILTER: TGType;
function GTK_STRING_FILTER(obj: Pointer): PGtkStringFilter;
function GTK_IS_STRING_FILTER(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_STRING_FILTER: TGType;
begin
  Result := gtk_string_filter_get_type;
end;

function GTK_STRING_FILTER(obj: Pointer): PGtkStringFilter;
begin
  Result := PGtkStringFilter(g_type_check_instance_cast(obj, GTK_TYPE_STRING_FILTER));
end;

function GTK_IS_STRING_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STRING_FILTER);
end;

{$ENDIF read_implementation}
