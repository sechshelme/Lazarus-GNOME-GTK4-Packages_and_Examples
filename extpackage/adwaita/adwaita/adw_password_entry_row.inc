{$IFDEF read_interface}



  {G_DECLARE_FINAL_TYPE (AdwPasswordEntryRow, adw_password_entry_row, ADW, PASSWORD_ENTRY_ROW, AdwEntryRow) }
type
  TAdwPasswordEntryRow = record
  end;
  PAdwPasswordEntryRow = ^TAdwPasswordEntryRow;

  TAdwPasswordEntryRowClass = record
    parent_class: TAdwEntryRowClass;
  end;
  PAdwPasswordEntryRowClass = ^TAdwPasswordEntryRowClass;

function adw_password_entry_row_get_type: TGType; cdecl; external libadwaita;
function adw_password_entry_row_new: PGtkWidget; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 15:07:06 ===

function ADW_TYPE_PASSWORD_ENTRY_ROW: TGType;
function ADW_PASSWORD_ENTRY_ROW(obj: Pointer): PAdwPasswordEntryRow;
function ADW_IS_PASSWORD_ENTRY_ROW(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_PASSWORD_ENTRY_ROW: TGType;
begin
  Result := adw_password_entry_row_get_type;
end;

function ADW_PASSWORD_ENTRY_ROW(obj: Pointer): PAdwPasswordEntryRow;
begin
  Result := PAdwPasswordEntryRow(g_type_check_instance_cast(obj, ADW_TYPE_PASSWORD_ENTRY_ROW));
end;

function ADW_IS_PASSWORD_ENTRY_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_PASSWORD_ENTRY_ROW);
end;


{$ENDIF read_implementation}
