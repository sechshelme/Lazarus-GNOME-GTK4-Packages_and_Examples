unit adap_password_entry_row;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_entry_row;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAdapPasswordEntryRow = record
  end;
  PAdapPasswordEntryRow = ^TAdapPasswordEntryRow;

  TAdapPasswordEntryRowClass = record
    parent_class: TAdapEntryRowClass;
  end;
  PAdapPasswordEntryRowClass = ^TAdapPasswordEntryRowClass;

function adap_password_entry_row_get_type: TGType; cdecl; external libadapta;
function adap_password_entry_row_new: PGtkWidget; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:22 ===

function ADAP_TYPE_PASSWORD_ENTRY_ROW: TGType;
function ADAP_PASSWORD_ENTRY_ROW(obj: Pointer): PAdapPasswordEntryRow;
function ADAP_IS_PASSWORD_ENTRY_ROW(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_PASSWORD_ENTRY_ROW: TGType;
begin
  Result := adap_password_entry_row_get_type;
end;

function ADAP_PASSWORD_ENTRY_ROW(obj: Pointer): PAdapPasswordEntryRow;
begin
  Result := PAdapPasswordEntryRow(g_type_check_instance_cast(obj, ADAP_TYPE_PASSWORD_ENTRY_ROW));
end;

function ADAP_IS_PASSWORD_ENTRY_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_PASSWORD_ENTRY_ROW);
end;


end.
