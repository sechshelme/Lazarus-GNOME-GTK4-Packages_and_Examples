{$IFDEF read_interface}


type
  TAdapEntryRow = record
    parent_instance: TAdapPreferencesRow;
  end;
  PAdapEntryRow = ^TAdapEntryRow;

  TAdapEntryRowClass = record
    parent_class: TAdapPreferencesRowClass;
  end;
  PAdapEntryRowClass = ^TAdapEntryRowClass;

function adap_entry_row_get_type: TGType; cdecl; external libadapta;
function adap_entry_row_new: PGtkWidget; cdecl; external libadapta;
procedure adap_entry_row_add_prefix(self: PAdapEntryRow; widget: PGtkWidget); cdecl; external libadapta;
procedure adap_entry_row_add_suffix(self: PAdapEntryRow; widget: PGtkWidget); cdecl; external libadapta;
procedure adap_entry_row_remove(self: PAdapEntryRow; widget: PGtkWidget); cdecl; external libadapta;
function adap_entry_row_get_show_apply_button(self: PAdapEntryRow): Tgboolean; cdecl; external libadapta;
procedure adap_entry_row_set_show_apply_button(self: PAdapEntryRow; show_apply_button: Tgboolean); cdecl; external libadapta;
function adap_entry_row_get_input_hints(self: PAdapEntryRow): TGtkInputHints; cdecl; external libadapta;
procedure adap_entry_row_set_input_hints(self: PAdapEntryRow; hints: TGtkInputHints); cdecl; external libadapta;
function adap_entry_row_get_input_purpose(self: PAdapEntryRow): TGtkInputPurpose; cdecl; external libadapta;
procedure adap_entry_row_set_input_purpose(self: PAdapEntryRow; purpose: TGtkInputPurpose); cdecl; external libadapta;
function adap_entry_row_get_enable_emoji_completion(self: PAdapEntryRow): Tgboolean; cdecl; external libadapta;
procedure adap_entry_row_set_enable_emoji_completion(self: PAdapEntryRow; enable_emoji_completion: Tgboolean); cdecl; external libadapta;
function adap_entry_row_get_attributes(self: PAdapEntryRow): PPangoAttrList; cdecl; external libadapta;
procedure adap_entry_row_set_attributes(self: PAdapEntryRow; attributes: PPangoAttrList); cdecl; external libadapta;
function adap_entry_row_get_activates_default(self: PAdapEntryRow): Tgboolean; cdecl; external libadapta;
procedure adap_entry_row_set_activates_default(self: PAdapEntryRow; activates: Tgboolean); cdecl; external libadapta;
function adap_entry_row_get_text_length(self: PAdapEntryRow): Tguint; cdecl; external libadapta;
function adap_entry_row_grab_focus_without_selecting(self: PAdapEntryRow): Tgboolean; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:09:07 ===

function ADAP_TYPE_ENTRY_ROW: TGType;
function ADAP_ENTRY_ROW(obj: Pointer): PAdapEntryRow;
function ADAP_IS_ENTRY_ROW(obj: Pointer): Tgboolean;
function ADAP_ENTRY_ROW_CLASS(klass: Pointer): PAdapEntryRowClass;
function ADAP_IS_ENTRY_ROW_CLASS(klass: Pointer): Tgboolean;
function ADAP_ENTRY_ROW_GET_CLASS(obj: Pointer): PAdapEntryRowClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_ENTRY_ROW: TGType;
begin
  Result := adap_entry_row_get_type;
end;

function ADAP_ENTRY_ROW(obj: Pointer): PAdapEntryRow;
begin
  Result := PAdapEntryRow(g_type_check_instance_cast(obj, ADAP_TYPE_ENTRY_ROW));
end;

function ADAP_IS_ENTRY_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ENTRY_ROW);
end;

function ADAP_ENTRY_ROW_CLASS(klass: Pointer): PAdapEntryRowClass;
begin
  Result := PAdapEntryRowClass(g_type_check_class_cast(klass, ADAP_TYPE_ENTRY_ROW));
end;

function ADAP_IS_ENTRY_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_ENTRY_ROW);
end;

function ADAP_ENTRY_ROW_GET_CLASS(obj: Pointer): PAdapEntryRowClass;
begin
  Result := PAdapEntryRowClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
