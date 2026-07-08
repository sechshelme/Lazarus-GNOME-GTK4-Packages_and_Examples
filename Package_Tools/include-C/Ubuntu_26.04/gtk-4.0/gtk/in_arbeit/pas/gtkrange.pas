unit gtkrange;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkenums, gtkborder, gtkwidget, gtkadjustment;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkRange = ^TGtkRange;
  TGtkRange = record
    parent_instance: TGtkWidget;
  end;

  PGtkRangeClass = ^TGtkRangeClass;
  TGtkRangeClass = record
    parent_class: TGtkWidgetClass;
    value_changed: procedure(range: PGtkRange); cdecl;
    adjust_bounds: procedure(range: PGtkRange; new_value: double); cdecl;
    move_slider: procedure(range: PGtkRange; scroll: TGtkScrollType); cdecl;
    get_range_border: procedure(range: PGtkRange; border_: PGtkBorder); cdecl;
    change_value: function(range: PGtkRange; scroll: TGtkScrollType; new_value: double): Tgboolean; cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_range_get_type: TGType; cdecl; external libgtk4;
procedure gtk_range_set_adjustment(range: PGtkRange; adjustment: PGtkAdjustment); cdecl; external libgtk4;
function gtk_range_get_adjustment(range: PGtkRange): PGtkAdjustment; cdecl; external libgtk4;
procedure gtk_range_set_inverted(range: PGtkRange; setting: Tgboolean); cdecl; external libgtk4;
function gtk_range_get_inverted(range: PGtkRange): Tgboolean; cdecl; external libgtk4;
procedure gtk_range_set_flippable(range: PGtkRange; flippable: Tgboolean); cdecl; external libgtk4;
function gtk_range_get_flippable(range: PGtkRange): Tgboolean; cdecl; external libgtk4;
procedure gtk_range_set_slider_size_fixed(range: PGtkRange; size_fixed: Tgboolean); cdecl; external libgtk4;
function gtk_range_get_slider_size_fixed(range: PGtkRange): Tgboolean; cdecl; external libgtk4;
procedure gtk_range_get_range_rect(range: PGtkRange; range_rect: PGdkRectangle); cdecl; external libgtk4;
procedure gtk_range_get_slider_range(range: PGtkRange; slider_start: Plongint; slider_end: Plongint); cdecl; external libgtk4;
procedure gtk_range_set_increments(range: PGtkRange; step: double; page: double); cdecl; external libgtk4;
procedure gtk_range_set_range(range: PGtkRange; min: double; max: double); cdecl; external libgtk4;
procedure gtk_range_set_value(range: PGtkRange; value: double); cdecl; external libgtk4;
function gtk_range_get_value(range: PGtkRange): double; cdecl; external libgtk4;
procedure gtk_range_set_show_fill_level(range: PGtkRange; show_fill_level: Tgboolean); cdecl; external libgtk4;
function gtk_range_get_show_fill_level(range: PGtkRange): Tgboolean; cdecl; external libgtk4;
procedure gtk_range_set_restrict_to_fill_level(range: PGtkRange; restrict_to_fill_level: Tgboolean); cdecl; external libgtk4;
function gtk_range_get_restrict_to_fill_level(range: PGtkRange): Tgboolean; cdecl; external libgtk4;
procedure gtk_range_set_fill_level(range: PGtkRange; fill_level: double); cdecl; external libgtk4;
function gtk_range_get_fill_level(range: PGtkRange): double; cdecl; external libgtk4;
procedure gtk_range_set_round_digits(range: PGtkRange; round_digits: longint); cdecl; external libgtk4;
function gtk_range_get_round_digits(range: PGtkRange): longint; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:14:02 ===

function GTK_TYPE_RANGE: TGType;
function GTK_RANGE(obj: Pointer): PGtkRange;
function GTK_RANGE_CLASS(klass: Pointer): PGtkRangeClass;
function GTK_IS_RANGE(obj: Pointer): Tgboolean;
function GTK_IS_RANGE_CLASS(klass: Pointer): Tgboolean;
function GTK_RANGE_GET_CLASS(obj: Pointer): PGtkRangeClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_RANGE: TGType;
begin
  GTK_TYPE_RANGE := gtk_range_get_type;
end;

function GTK_RANGE(obj: Pointer): PGtkRange;
begin
  Result := PGtkRange(g_type_check_instance_cast(obj, GTK_TYPE_RANGE));
end;

function GTK_RANGE_CLASS(klass: Pointer): PGtkRangeClass;
begin
  Result := PGtkRangeClass(g_type_check_class_cast(klass, GTK_TYPE_RANGE));
end;

function GTK_IS_RANGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_RANGE);
end;

function GTK_IS_RANGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_RANGE);
end;

function GTK_RANGE_GET_CLASS(obj: Pointer): PGtkRangeClass;
begin
  Result := PGtkRangeClass(PGTypeInstance(obj)^.g_class);
end;



end.
