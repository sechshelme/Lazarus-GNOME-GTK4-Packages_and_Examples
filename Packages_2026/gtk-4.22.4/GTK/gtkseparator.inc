

  {$IFDEF read_struct}
type
  PGtkSeparator = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_separator_get_type: TGType; cdecl; external libgtk4;
function gtk_separator_new(orientation: TGtkOrientation): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:14:17 ===

function GTK_TYPE_SEPARATOR: TGType;
function GTK_SEPARATOR(obj: Pointer): PGtkSeparator;
function GTK_IS_SEPARATOR(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_SEPARATOR: TGType;
begin
  GTK_TYPE_SEPARATOR := gtk_separator_get_type;
end;

function GTK_SEPARATOR(obj: Pointer): PGtkSeparator;
begin
  Result := PGtkSeparator(g_type_check_instance_cast(obj, GTK_TYPE_SEPARATOR));
end;

function GTK_IS_SEPARATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SEPARATOR);
end;

{$ENDIF read_implementation}
