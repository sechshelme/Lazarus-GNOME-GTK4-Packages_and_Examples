unit gtkboolfilter;

interface

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

uses
  fp_glib2, fp_gtk4, gtkfilter, gtkexpression;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkBoolFilter = type Pointer;

  TGtkBoolFilterClass = record
    parent_class: TGtkFilterClass;
  end;
  PGtkBoolFilterClass = ^TGtkBoolFilterClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_bool_filter_get_type: TGType; cdecl; external libgtk4;
function gtk_bool_filter_new(expression: PGtkExpression): PGtkBoolFilter; cdecl; external libgtk4;
function gtk_bool_filter_get_expression(self: PGtkBoolFilter): PGtkExpression; cdecl; external libgtk4;
procedure gtk_bool_filter_set_expression(self: PGtkBoolFilter; expression: PGtkExpression); cdecl; external libgtk4;
function gtk_bool_filter_get_invert(self: PGtkBoolFilter): Tgboolean; cdecl; external libgtk4;
procedure gtk_bool_filter_set_invert(self: PGtkBoolFilter; invert: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 5-7-26 19:15:37 ===

function GTK_TYPE_BOOL_FILTER: TGType;
function GTK_BOOL_FILTER(obj: Pointer): PGtkBoolFilter;
function GTK_IS_BOOL_FILTER(obj: Pointer): Tgboolean;
{$ENDIF read_struct}

implementation

function GTK_TYPE_BOOL_FILTER: TGType;
begin
  Result := gtk_bool_filter_get_type;
end;

function GTK_BOOL_FILTER(obj: Pointer): PGtkBoolFilter;
begin
  Result := PGtkBoolFilter(g_type_check_instance_cast(obj, GTK_TYPE_BOOL_FILTER));
end;

function GTK_IS_BOOL_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BOOL_FILTER);
end;

end.
