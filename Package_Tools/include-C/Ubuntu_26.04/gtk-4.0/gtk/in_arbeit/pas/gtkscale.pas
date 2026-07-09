unit gtkscale;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_pango, fp_gtk4, gtkenums, gtkwidget, gtkrange, gtkadjustment;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkScale = ^TGtkScale;
  TGtkScale = record
    parent_instance: TGtkRange;
  end;

  PGtkScaleClass = ^TGtkScaleClass;
  TGtkScaleClass = record
    parent_class: TGtkRangeClass;
    get_layout_offsets: procedure(scale: PGtkScale; x: Plongint; y: Plongint); cdecl;
    padding: array[0..7] of Tgpointer;
  end;

  TGtkScaleFormatValueFunc = function(scale: PGtkScale; value: double; user_data: Tgpointer): pchar; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_scale_get_type: TGType; cdecl; external libgtk4;
function gtk_scale_new(orientation: TGtkOrientation; adjustment: PGtkAdjustment): PGtkWidget; cdecl; external libgtk4;
function gtk_scale_new_with_range(orientation: TGtkOrientation; min: double; max: double; step: double): PGtkWidget; cdecl; external libgtk4;
procedure gtk_scale_set_digits(scale: PGtkScale; digits: longint); cdecl; external libgtk4;
function gtk_scale_get_digits(scale: PGtkScale): longint; cdecl; external libgtk4;
procedure gtk_scale_set_draw_value(scale: PGtkScale; draw_value: Tgboolean); cdecl; external libgtk4;
function gtk_scale_get_draw_value(scale: PGtkScale): Tgboolean; cdecl; external libgtk4;
procedure gtk_scale_set_has_origin(scale: PGtkScale; has_origin: Tgboolean); cdecl; external libgtk4;
function gtk_scale_get_has_origin(scale: PGtkScale): Tgboolean; cdecl; external libgtk4;
procedure gtk_scale_set_value_pos(scale: PGtkScale; pos: TGtkPositionType); cdecl; external libgtk4;
function gtk_scale_get_value_pos(scale: PGtkScale): TGtkPositionType; cdecl; external libgtk4;
function gtk_scale_get_layout(scale: PGtkScale): PPangoLayout; cdecl; external libgtk4;
procedure gtk_scale_get_layout_offsets(scale: PGtkScale; x: Plongint; y: Plongint); cdecl; external libgtk4;
procedure gtk_scale_add_mark(scale: PGtkScale; value: double; position: TGtkPositionType; markup: pchar); cdecl; external libgtk4;
procedure gtk_scale_clear_marks(scale: PGtkScale); cdecl; external libgtk4;
procedure gtk_scale_set_format_value_func(scale: PGtkScale; func: TGtkScaleFormatValueFunc; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:20:29 ===

function GTK_TYPE_SCALE: TGType;
function GTK_SCALE(obj: Pointer): PGtkScale;
function GTK_SCALE_CLASS(klass: Pointer): PGtkScaleClass;
function GTK_IS_SCALE(obj: Pointer): Tgboolean;
function GTK_IS_SCALE_CLASS(klass: Pointer): Tgboolean;
function GTK_SCALE_GET_CLASS(obj: Pointer): PGtkScaleClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_SCALE: TGType;
begin
  GTK_TYPE_SCALE := gtk_scale_get_type;
end;

function GTK_SCALE(obj: Pointer): PGtkScale;
begin
  Result := PGtkScale(g_type_check_instance_cast(obj, GTK_TYPE_SCALE));
end;

function GTK_SCALE_CLASS(klass: Pointer): PGtkScaleClass;
begin
  Result := PGtkScaleClass(g_type_check_class_cast(klass, GTK_TYPE_SCALE));
end;

function GTK_IS_SCALE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SCALE);
end;

function GTK_IS_SCALE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_SCALE);
end;

function GTK_SCALE_GET_CLASS(obj: Pointer): PGtkScaleClass;
begin
  Result := PGtkScaleClass(PGTypeInstance(obj)^.g_class);
end;



end.
