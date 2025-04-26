{$IFDEF read_interface}



  {G_DECLARE_DERIVABLE_TYPE (AdwBin, adw_bin, ADW, BIN, GtkWidget) }
type
  TAdwBinClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwBinClass = ^TAdwBinClass;

  TAdwBin = record
    parent_instance: TGtkWidget;
  end;
  PAdwBin = ^TAdwBin;

function adw_bin_get_type: TGType; cdecl; external libadwaita;
function adw_bin_new: PGtkWidget; cdecl; external libadwaita;
function adw_bin_get_child(self: PAdwBin): PGtkWidget; cdecl; external libadwaita;
procedure adw_bin_set_child(self: PAdwBin; child: PGtkWidget); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 15:01:26 ===

function ADW_TYPE_BIN: TGType;
function ADW_BIN(obj: Pointer): PAdwBin;
function ADW_IS_BIN(obj: Pointer): Tgboolean;
function ADW_BIN_CLASS(klass: Pointer): PAdwBinClass;
function ADW_IS_BIN_CLASS(klass: Pointer): Tgboolean;
function ADW_BIN_GET_CLASS(obj: Pointer): PAdwBinClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_BIN: TGType;
begin
  Result := adw_bin_get_type;
end;

function ADW_BIN(obj: Pointer): PAdwBin;
begin
  Result := PAdwBin(g_type_check_instance_cast(obj, ADW_TYPE_BIN));
end;

function ADW_IS_BIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_BIN);
end;

function ADW_BIN_CLASS(klass: Pointer): PAdwBinClass;
begin
  Result := PAdwBinClass(g_type_check_class_cast(klass, ADW_TYPE_BIN));
end;

function ADW_IS_BIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_BIN);
end;

function ADW_BIN_GET_CLASS(obj: Pointer): PAdwBinClass;
begin
  Result := PAdwBinClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
