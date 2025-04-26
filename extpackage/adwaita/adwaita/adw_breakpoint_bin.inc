{$IFDEF read_interface}


  {G_DECLARE_DERIVABLE_TYPE (AdwBreakpointBin, adw_breakpoint_bin, ADW, BREAKPOINT_BIN, GtkWidget) }
  {< private > }
type
  TAdwBreakpointBinClass = record
    parent_class: TGtkWidgetClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdwBreakpointBinClass = ^TAdwBreakpointBinClass;

  TAdwBreakpointBin = record
    parent_instance: TGtkWidget;
  end;
  PAdwBreakpointBin = ^TAdwBreakpointBin;

function adw_breakpoint_bin_get_type: TGType; cdecl; external libadwaita;
function adw_breakpoint_bin_new: PGtkWidget; cdecl; external libadwaita;
function adw_breakpoint_bin_get_child(self: PAdwBreakpointBin): PGtkWidget; cdecl; external libadwaita;
procedure adw_breakpoint_bin_set_child(self: PAdwBreakpointBin; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_breakpoint_bin_add_breakpoint(self: PAdwBreakpointBin; breakpoint: PAdwBreakpoint); cdecl; external libadwaita;
procedure adw_breakpoint_bin_remove_breakpoint(self: PAdwBreakpointBin; breakpoint: PAdwBreakpoint); cdecl; external libadwaita;
function adw_breakpoint_bin_get_current_breakpoint(self: PAdwBreakpointBin): PAdwBreakpoint; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 14:39:52 ===

function ADW_TYPE_BREAKPOINT_BIN: TGType;
function ADW_BREAKPOINT_BIN(obj: Pointer): PAdwBreakpointBin;
function ADW_IS_BREAKPOINT_BIN(obj: Pointer): Tgboolean;
function ADW_BREAKPOINT_BIN_CLASS(klass: Pointer): PAdwBreakpointBinClass;
function ADW_IS_BREAKPOINT_BIN_CLASS(klass: Pointer): Tgboolean;
function ADW_BREAKPOINT_BIN_GET_CLASS(obj: Pointer): PAdwBreakpointBinClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_BREAKPOINT_BIN: TGType;
begin
  Result := adw_breakpoint_bin_get_type;
end;

function ADW_BREAKPOINT_BIN(obj: Pointer): PAdwBreakpointBin;
begin
  Result := PAdwBreakpointBin(g_type_check_instance_cast(obj, ADW_TYPE_BREAKPOINT_BIN));
end;

function ADW_IS_BREAKPOINT_BIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_BREAKPOINT_BIN);
end;

function ADW_BREAKPOINT_BIN_CLASS(klass: Pointer): PAdwBreakpointBinClass;
begin
  Result := PAdwBreakpointBinClass(g_type_check_class_cast(klass, ADW_TYPE_BREAKPOINT_BIN));
end;

function ADW_IS_BREAKPOINT_BIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADW_TYPE_BREAKPOINT_BIN);
end;

function ADW_BREAKPOINT_BIN_GET_CLASS(obj: Pointer): PAdwBreakpointBinClass;
begin
  Result := PAdwBreakpointBinClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
