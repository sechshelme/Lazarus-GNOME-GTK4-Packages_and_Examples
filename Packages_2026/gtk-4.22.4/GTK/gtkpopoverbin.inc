

  {$IFDEF read_struct}
type
  PGtkPopoverBin = type Pointer;

  TGtkPopoverBinClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkPopoverBinClass = ^TGtkPopoverBinClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_popover_bin_get_type: TGType; cdecl; external libgtk4;
function gtk_popover_bin_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_popover_bin_set_child(self: PGtkPopoverBin; child: PGtkWidget); cdecl; external libgtk4;
function gtk_popover_bin_get_child(self: PGtkPopoverBin): PGtkWidget; cdecl; external libgtk4;
procedure gtk_popover_bin_set_menu_model(self: PGtkPopoverBin; model: PGMenuModel); cdecl; external libgtk4;
function gtk_popover_bin_get_menu_model(self: PGtkPopoverBin): PGMenuModel; cdecl; external libgtk4;
procedure gtk_popover_bin_set_popover(self: PGtkPopoverBin; popover: PGtkWidget); cdecl; external libgtk4;
function gtk_popover_bin_get_popover(self: PGtkPopoverBin): PGtkWidget; cdecl; external libgtk4;
procedure gtk_popover_bin_popup(self: PGtkPopoverBin); cdecl; external libgtk4;
procedure gtk_popover_bin_popdown(self: PGtkPopoverBin); cdecl; external libgtk4;
procedure gtk_popover_bin_set_handle_input(self: PGtkPopoverBin; handle_input: Tgboolean); cdecl; external libgtk4;
function gtk_popover_bin_get_handle_input(self: PGtkPopoverBin): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:14:27 ===

function GTK_TYPE_POPOVER_BIN: TGType;
function GTK_POPOVER_BIN(obj: Pointer): PGtkPopoverBin;
function GTK_IS_POPOVER_BIN(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_POPOVER_BIN: TGType;
begin
  Result := gtk_popover_bin_get_type;
end;

function GTK_POPOVER_BIN(obj: Pointer): PGtkPopoverBin;
begin
  Result := PGtkPopoverBin(g_type_check_instance_cast(obj, GTK_TYPE_POPOVER_BIN));
end;

function GTK_IS_POPOVER_BIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_POPOVER_BIN);
end;

{$ENDIF read_implementation}
