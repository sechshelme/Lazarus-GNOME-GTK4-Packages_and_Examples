{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwSpinRow, adw_spin_row, ADW, SPIN_ROW, AdwActionRow) }
type
  TAdwSpinRow = record
  end;
  PAdwSpinRow = ^TAdwSpinRow;

  TAdwSpinRowClass = record
    parent_class: TAdwActionRowClass;
  end;
  PAdwSpinRowClass = ^TAdwSpinRowClass;

function adw_spin_row_get_type: TGType; cdecl; external libadwaita;
function adw_spin_row_new(adjustment: PGtkAdjustment; climb_rate: double; digits: Tguint): PGtkWidget; cdecl; external libadwaita;
function adw_spin_row_new_with_range(min: double; max: double; step: double): PGtkWidget; cdecl; external libadwaita;
procedure adw_spin_row_configure(self: PAdwSpinRow; adjustment: PGtkAdjustment; climb_rate: double; digits: Tguint); cdecl; external libadwaita;
function adw_spin_row_get_adjustment(self: PAdwSpinRow): PGtkAdjustment; cdecl; external libadwaita;
procedure adw_spin_row_set_adjustment(self: PAdwSpinRow; adjustment: PGtkAdjustment); cdecl; external libadwaita;
function adw_spin_row_get_climb_rate(self: PAdwSpinRow): double; cdecl; external libadwaita;
procedure adw_spin_row_set_climb_rate(self: PAdwSpinRow; climb_rate: double); cdecl; external libadwaita;
function adw_spin_row_get_digits(self: PAdwSpinRow): Tguint; cdecl; external libadwaita;
procedure adw_spin_row_set_digits(self: PAdwSpinRow; digits: Tguint); cdecl; external libadwaita;
function adw_spin_row_get_numeric(self: PAdwSpinRow): Tgboolean; cdecl; external libadwaita;
procedure adw_spin_row_set_numeric(self: PAdwSpinRow; numeric: Tgboolean); cdecl; external libadwaita;
function adw_spin_row_get_snap_to_ticks(self: PAdwSpinRow): Tgboolean; cdecl; external libadwaita;
procedure adw_spin_row_set_snap_to_ticks(self: PAdwSpinRow; snap_to_ticks: Tgboolean); cdecl; external libadwaita;
function adw_spin_row_get_update_policy(self: PAdwSpinRow): TGtkSpinButtonUpdatePolicy; cdecl; external libadwaita;
procedure adw_spin_row_set_update_policy(self: PAdwSpinRow; policy: TGtkSpinButtonUpdatePolicy); cdecl; external libadwaita;
function adw_spin_row_get_value(self: PAdwSpinRow): double; cdecl; external libadwaita;
procedure adw_spin_row_set_value(self: PAdwSpinRow; Value: double); cdecl; external libadwaita;
function adw_spin_row_get_wrap(self: PAdwSpinRow): Tgboolean; cdecl; external libadwaita;
procedure adw_spin_row_set_wrap(self: PAdwSpinRow; wrap: Tgboolean); cdecl; external libadwaita;
procedure adw_spin_row_update(self: PAdwSpinRow); cdecl; external libadwaita;
procedure adw_spin_row_set_range(self: PAdwSpinRow; min: double; max: double); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:57:32 ===

function ADW_TYPE_SPIN_ROW: TGType;
function ADW_SPIN_ROW(obj: Pointer): PAdwSpinRow;
function ADW_IS_SPIN_ROW(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_SPIN_ROW: TGType;
begin
  Result := adw_spin_row_get_type;
end;

function ADW_SPIN_ROW(obj: Pointer): PAdwSpinRow;
begin
  Result := PAdwSpinRow(g_type_check_instance_cast(obj, ADW_TYPE_SPIN_ROW));
end;

function ADW_IS_SPIN_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_SPIN_ROW);
end;


{$ENDIF read_implementation}
