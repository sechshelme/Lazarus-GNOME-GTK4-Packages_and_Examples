
  {$IFDEF read_struct}
type
  PGtkAccessibleRange = type Pointer;

  PGtkAccessibleRangeInterface = ^TGtkAccessibleRangeInterface;
  TGtkAccessibleRangeInterface = record
    g_iface: TGTypeInterface;
    set_current_value: function(self: PGtkAccessibleRange; value: double): Tgboolean; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_accessible_range_get_type: TGType; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 16:28:35 ===

function GTK_TYPE_ACCESSIBLE_RANGE: TGType;
function GTK_ACCESSIBLE_RANGE(obj: Pointer): PGtkAccessibleRange;
function GTK_IS_ACCESSIBLE_RANGE(obj: Pointer): Tgboolean;
function GTK_ACCESSIBLE_RANGE_GET_IFACE(obj: Pointer): PGtkAccessibleRangeInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_ACCESSIBLE_RANGE: TGType;
begin
  Result := gtk_accessible_range_get_type;
end;

function GTK_ACCESSIBLE_RANGE(obj: Pointer): PGtkAccessibleRange;
begin
  Result := PGtkAccessibleRange(g_type_check_instance_cast(obj, GTK_TYPE_ACCESSIBLE_RANGE));
end;

function GTK_IS_ACCESSIBLE_RANGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ACCESSIBLE_RANGE);
end;

function GTK_ACCESSIBLE_RANGE_GET_IFACE(obj: Pointer): PGtkAccessibleRangeInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ACCESSIBLE_RANGE);
end;


{$ENDIF read_implementation}
