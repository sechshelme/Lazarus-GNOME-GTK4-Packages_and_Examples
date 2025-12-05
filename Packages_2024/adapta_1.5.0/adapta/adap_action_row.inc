{$IFDEF read_interface}


type
  TAdapActionRow = record
    parent_instance: TAdapPreferencesRow;
  end;
  PAdapActionRow = ^TAdapActionRow;

  TAdapActionRowClass = record
    parent_class: TAdapPreferencesRowClass;
    activate: procedure(self: PAdapActionRow); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PAdapActionRowClass = ^TAdapActionRowClass;

function adap_action_row_get_type: TGType; cdecl; external libadapta;
function adap_action_row_new: PGtkWidget; cdecl; external libadapta;
procedure adap_action_row_add_prefix(self: PAdapActionRow; widget: PGtkWidget); cdecl; external libadapta;
procedure adap_action_row_add_suffix(self: PAdapActionRow; widget: PGtkWidget); cdecl; external libadapta;
procedure adap_action_row_remove(self: PAdapActionRow; widget: PGtkWidget); cdecl; external libadapta;
function adap_action_row_get_subtitle(self: PAdapActionRow): pchar; cdecl; external libadapta;
procedure adap_action_row_set_subtitle(self: PAdapActionRow; subtitle: pchar); cdecl; external libadapta;
function adap_action_row_get_icon_name(self: PAdapActionRow): pchar; cdecl; external libadapta; deprecated'adap_action_row_add_prefix';
procedure adap_action_row_set_icon_name(self: PAdapActionRow; icon_name: pchar); cdecl; external libadapta; deprecated'adap_action_row_add_prefix';
function adap_action_row_get_activatable_widget(self: PAdapActionRow): PGtkWidget; cdecl; external libadapta;
procedure adap_action_row_set_activatable_widget(self: PAdapActionRow; widget: PGtkWidget); cdecl; external libadapta;
function adap_action_row_get_title_lines(self: PAdapActionRow): longint; cdecl; external libadapta;
procedure adap_action_row_set_title_lines(self: PAdapActionRow; title_lines: longint); cdecl; external libadapta;
function adap_action_row_get_subtitle_lines(self: PAdapActionRow): longint; cdecl; external libadapta;
procedure adap_action_row_set_subtitle_lines(self: PAdapActionRow; subtitle_lines: longint); cdecl; external libadapta;
function adap_action_row_get_subtitle_selectable(self: PAdapActionRow): Tgboolean; cdecl; external libadapta;
procedure adap_action_row_set_subtitle_selectable(self: PAdapActionRow; subtitle_selectable: Tgboolean); cdecl; external libadapta;
procedure adap_action_row_activate(self: PAdapActionRow); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:00:00 ===

function ADAP_TYPE_ACTION_ROW: TGType;
function ADAP_ACTION_ROW(obj: Pointer): PAdapActionRow;
function ADAP_IS_ACTION_ROW(obj: Pointer): Tgboolean;
function ADAP_ACTION_ROW_CLASS(klass: Pointer): PAdapActionRowClass;
function ADAP_IS_ACTION_ROW_CLASS(klass: Pointer): Tgboolean;
function ADAP_ACTION_ROW_GET_CLASS(obj: Pointer): PAdapActionRowClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_ACTION_ROW: TGType;
begin
  Result := adap_action_row_get_type;
end;

function ADAP_ACTION_ROW(obj: Pointer): PAdapActionRow;
begin
  Result := PAdapActionRow(g_type_check_instance_cast(obj, ADAP_TYPE_ACTION_ROW));
end;

function ADAP_IS_ACTION_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ACTION_ROW);
end;

function ADAP_ACTION_ROW_CLASS(klass: Pointer): PAdapActionRowClass;
begin
  Result := PAdapActionRowClass(g_type_check_class_cast(klass, ADAP_TYPE_ACTION_ROW));
end;

function ADAP_IS_ACTION_ROW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_ACTION_ROW);
end;

function ADAP_ACTION_ROW_GET_CLASS(obj: Pointer): PAdapActionRowClass;
begin
  Result := PAdapActionRowClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
