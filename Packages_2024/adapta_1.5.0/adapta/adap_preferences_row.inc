{$IFDEF read_interface}


type
  TAdapPreferencesRowClass = record
    parent_class: TGtkListBoxRowClass;
    padding: array[0..3] of Tgpointer;
  end;
  PAdapPreferencesRowClass = ^TAdapPreferencesRowClass;

  TAdapPreferencesRow = record
    parent_instance: TGtkListBoxRow;
  end;
  PAdapPreferencesRow = ^TAdapPreferencesRow;

function adap_preferences_row_get_type: TGType; cdecl; external libadapta;
function adap_preferences_row_new: PGtkWidget; cdecl; external libadapta;
function adap_preferences_row_get_title(self: PAdapPreferencesRow): pchar; cdecl; external libadapta;
procedure adap_preferences_row_set_title(self: PAdapPreferencesRow; title: pchar); cdecl; external libadapta;
function adap_preferences_row_get_use_underline(self: PAdapPreferencesRow): Tgboolean; cdecl; external libadapta;
procedure adap_preferences_row_set_use_underline(self: PAdapPreferencesRow; use_underline: Tgboolean); cdecl; external libadapta;
function adap_preferences_row_get_title_selectable(self: PAdapPreferencesRow): Tgboolean; cdecl; external libadapta;
procedure adap_preferences_row_set_title_selectable(self: PAdapPreferencesRow; title_selectable: Tgboolean); cdecl; external libadapta;
function adap_preferences_row_get_use_markup(self: PAdapPreferencesRow): Tgboolean; cdecl; external libadapta;
procedure adap_preferences_row_set_use_markup(self: PAdapPreferencesRow; use_markup: Tgboolean); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:32 ===

function ADAP_TYPE_PREFERENCES_ROW: TGType;
function ADAP_PREFERENCES_ROW(obj: Pointer): PAdapPreferencesRow;
function ADAP_IS_PREFERENCES_ROW(obj: Pointer): Tgboolean;
function ADAP_PREFERENCES_ROW_CLASS(klass: Pointer): PAdapPreferencesRowClass;
function ADAP_IS_PREFERENCES_ROW_CLASS(klass: Pointer): Tgboolean;
function ADAP_PREFERENCES_ROW_GET_CLASS(obj: Pointer): PAdapPreferencesRowClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_PREFERENCES_ROW: TGType;
begin
  Result := adap_preferences_row_get_type;
end;

function ADAP_PREFERENCES_ROW(obj: Pointer): PAdapPreferencesRow;
begin
  Result := PAdapPreferencesRow(g_type_check_instance_cast(obj, ADAP_TYPE_PREFERENCES_ROW));
end;

function ADAP_IS_PREFERENCES_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_PREFERENCES_ROW);
end;

function ADAP_PREFERENCES_ROW_CLASS(klass: Pointer): PAdapPreferencesRowClass;
begin
  Result := PAdapPreferencesRowClass(g_type_check_class_cast(klass, ADAP_TYPE_PREFERENCES_ROW));
end;

function ADAP_IS_PREFERENCES_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_PREFERENCES_ROW);
end;

function ADAP_PREFERENCES_ROW_GET_CLASS(obj: Pointer): PAdapPreferencesRowClass;
begin
  Result := PAdapPreferencesRowClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
