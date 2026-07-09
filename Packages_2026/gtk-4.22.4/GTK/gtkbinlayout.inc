

  {$IFDEF read_struct}
type
  PGtkBinLayout = type Pointer;

  TGtkBinLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkBinLayoutClass = ^TGtkBinLayoutClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_bin_layout_get_type: TGType; cdecl; external libgtk4;
function gtk_bin_layout_new: PGtkLayoutManager; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 19:15:53 ===

function GTK_TYPE_BIN_LAYOUT: TGType;
function GTK_BIN_LAYOUT(obj: Pointer): PGtkBinLayout;
function GTK_IS_BIN_LAYOUT(obj: Pointer): Tgboolean;
{$ENDIF read_struct}


{$IFDEF read_implementation}

function GTK_TYPE_BIN_LAYOUT: TGType;
begin
  Result := gtk_bin_layout_get_type;
end;

function GTK_BIN_LAYOUT(obj: Pointer): PGtkBinLayout;
begin
  Result := PGtkBinLayout(g_type_check_instance_cast(obj, GTK_TYPE_BIN_LAYOUT));
end;

function GTK_IS_BIN_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BIN_LAYOUT);
end;

{$ENDIF read_implementation}
