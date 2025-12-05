unit adap_switch_row;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_action_row;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapSwitchRow = record
  end;
  PAdapSwitchRow = ^TAdapSwitchRow;

  TAdapSwitchRowClass = record
    parent_class: TAdapActionRowClass;
  end;
  PAdapSwitchRowClass = ^TAdapSwitchRowClass;

function adap_switch_row_get_type: TGType; cdecl; external libadapta;
function adap_switch_row_new: PGtkWidget; cdecl; external libadapta;
function adap_switch_row_get_active(self: PAdapSwitchRow): Tgboolean; cdecl; external libadapta;
procedure adap_switch_row_set_active(self: PAdapSwitchRow; is_active: Tgboolean); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:28:02 ===

function ADAP_TYPE_SWITCH_ROW: TGType;
function ADAP_SWITCH_ROW(obj: Pointer): PAdapSwitchRow;
function ADAP_IS_SWITCH_ROW(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_SWITCH_ROW: TGType;
begin
  Result := adap_switch_row_get_type;
end;

function ADAP_SWITCH_ROW(obj: Pointer): PAdapSwitchRow;
begin
  Result := PAdapSwitchRow(g_type_check_instance_cast(obj, ADAP_TYPE_SWITCH_ROW));
end;

function ADAP_IS_SWITCH_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_SWITCH_ROW);
end;


end.
