

  {$IFDEF read_struct}
type
  PGtkAdjustment = ^TGtkAdjustment;
  TGtkAdjustment = record
    parent_instance: TGInitiallyUnowned;
  end;

  PGtkAdjustmentClass = ^TGtkAdjustmentClass;
  TGtkAdjustmentClass = record
    parent_class: TGInitiallyUnownedClass;
    changed: procedure(adjustment: PGtkAdjustment); cdecl;
    value_changed: procedure(adjustment: PGtkAdjustment); cdecl;
    _gtk_reserved1: procedure; cdecl;
    _gtk_reserved2: procedure; cdecl;
    _gtk_reserved3: procedure; cdecl;
    _gtk_reserved4: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_adjustment_get_type: TGType; cdecl; external libgtk4;
function gtk_adjustment_new(value: double; lower: double; upper: double; step_increment: double; page_increment: double;
  page_size: double): PGtkAdjustment; cdecl; external libgtk4;
procedure gtk_adjustment_clamp_page(adjustment: PGtkAdjustment; lower: double; upper: double); cdecl; external libgtk4;
function gtk_adjustment_get_value(adjustment: PGtkAdjustment): double; cdecl; external libgtk4;
procedure gtk_adjustment_set_value(adjustment: PGtkAdjustment; value: double); cdecl; external libgtk4;
function gtk_adjustment_get_lower(adjustment: PGtkAdjustment): double; cdecl; external libgtk4;
procedure gtk_adjustment_set_lower(adjustment: PGtkAdjustment; lower: double); cdecl; external libgtk4;
function gtk_adjustment_get_upper(adjustment: PGtkAdjustment): double; cdecl; external libgtk4;
procedure gtk_adjustment_set_upper(adjustment: PGtkAdjustment; upper: double); cdecl; external libgtk4;
function gtk_adjustment_get_step_increment(adjustment: PGtkAdjustment): double; cdecl; external libgtk4;
procedure gtk_adjustment_set_step_increment(adjustment: PGtkAdjustment; step_increment: double); cdecl; external libgtk4;
function gtk_adjustment_get_page_increment(adjustment: PGtkAdjustment): double; cdecl; external libgtk4;
procedure gtk_adjustment_set_page_increment(adjustment: PGtkAdjustment; page_increment: double); cdecl; external libgtk4;
function gtk_adjustment_get_page_size(adjustment: PGtkAdjustment): double; cdecl; external libgtk4;
procedure gtk_adjustment_set_page_size(adjustment: PGtkAdjustment; page_size: double); cdecl; external libgtk4;
procedure gtk_adjustment_configure(adjustment: PGtkAdjustment; value: double; lower: double; upper: double; step_increment: double;
  page_increment: double; page_size: double); cdecl; external libgtk4;
function gtk_adjustment_get_minimum_increment(adjustment: PGtkAdjustment): double; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 16:28:01 ===

function GTK_TYPE_ADJUSTMENT: TGType;
function GTK_ADJUSTMENT(obj: Pointer): PGtkAdjustment;
function GTK_ADJUSTMENT_CLASS(klass: Pointer): PGtkAdjustmentClass;
function GTK_IS_ADJUSTMENT(obj: Pointer): Tgboolean;
function GTK_IS_ADJUSTMENT_CLASS(klass: Pointer): Tgboolean;
function GTK_ADJUSTMENT_GET_CLASS(obj: Pointer): PGtkAdjustmentClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_ADJUSTMENT: TGType;
begin
  GTK_TYPE_ADJUSTMENT := gtk_adjustment_get_type;
end;

function GTK_ADJUSTMENT(obj: Pointer): PGtkAdjustment;
begin
  Result := PGtkAdjustment(g_type_check_instance_cast(obj, GTK_TYPE_ADJUSTMENT));
end;

function GTK_ADJUSTMENT_CLASS(klass: Pointer): PGtkAdjustmentClass;
begin
  Result := PGtkAdjustmentClass(g_type_check_class_cast(klass, GTK_TYPE_ADJUSTMENT));
end;

function GTK_IS_ADJUSTMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ADJUSTMENT);
end;

function GTK_IS_ADJUSTMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_ADJUSTMENT);
end;

function GTK_ADJUSTMENT_GET_CLASS(obj: Pointer): PGtkAdjustmentClass;
begin
  Result := PGtkAdjustmentClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
