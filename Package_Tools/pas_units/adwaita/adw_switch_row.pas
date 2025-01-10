unit adw_switch_row;

interface

uses
  fp_glib2, fp_GTK4, adw_action_row;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {G_DECLARE_FINAL_TYPE (AdwSwitchRow, adw_switch_row, ADW, SWITCH_ROW, AdwActionRow) }
type
  TAdwSwitchRow = record
  end;
  PAdwSwitchRow = ^TAdwSwitchRow;

  TAdwSwitchRowClass = record
    parent_class: TAdwActionRowClass;
  end;
  PAdwSwitchRowClass = ^TAdwSwitchRowClass;

function adw_switch_row_get_type: TGType; cdecl; external libadwaita;
function adw_switch_row_new: PGtkWidget; cdecl; external libadwaita;
function adw_switch_row_get_active(self: PAdwSwitchRow): Tgboolean; cdecl; external libadwaita;
procedure adw_switch_row_set_active(self: PAdwSwitchRow; is_active: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 15:07:09 ===

function ADW_TYPE_SWITCH_ROW: TGType;
function ADW_SWITCH_ROW(obj: Pointer): PAdwSwitchRow;
function ADW_IS_SWITCH_ROW(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_SWITCH_ROW: TGType;
begin
  Result := adw_switch_row_get_type;
end;

function ADW_SWITCH_ROW(obj: Pointer): PAdwSwitchRow;
begin
  Result := PAdwSwitchRow(g_type_check_instance_cast(obj, ADW_TYPE_SWITCH_ROW));
end;

function ADW_IS_SWITCH_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_SWITCH_ROW);
end;


end.
