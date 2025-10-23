{$IFDEF read_interface}


type
  TIBusLookupTable = record
    parent: TIBusSerializable;
    page_size: Tguint;
    cursor_pos: Tguint;
    cursor_visible: Tgboolean;
    round: Tgboolean;
    orientation: Tgint;
    candidates: PGArray;
    labels: PGArray;
  end;
  PIBusLookupTable = ^TIBusLookupTable;

  TIBusLookupTableClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusLookupTableClass = ^TIBusLookupTableClass;

function ibus_lookup_table_get_type: TGType; cdecl; external libibus;
function ibus_lookup_table_new(page_size: Tguint; cursor_pos: Tguint; cursor_visible: Tgboolean; round: Tgboolean): PIBusLookupTable; cdecl; external libibus;
procedure ibus_lookup_table_append_candidate(table: PIBusLookupTable; text: PIBusText); cdecl; external libibus;
function ibus_lookup_table_get_number_of_candidates(table: PIBusLookupTable): Tguint; cdecl; external libibus;
function ibus_lookup_table_get_candidate(table: PIBusLookupTable; index: Tguint): PIBusText; cdecl; external libibus;
procedure ibus_lookup_table_append_label(table: PIBusLookupTable; text: PIBusText); cdecl; external libibus;
procedure ibus_lookup_table_set_label(table: PIBusLookupTable; index: Tguint; text: PIBusText); cdecl; external libibus;
function ibus_lookup_table_get_label(table: PIBusLookupTable; index: Tguint): PIBusText; cdecl; external libibus;
procedure ibus_lookup_table_set_cursor_pos(table: PIBusLookupTable; cursor_pos: Tguint); cdecl; external libibus;
function ibus_lookup_table_get_cursor_pos(table: PIBusLookupTable): Tguint; cdecl; external libibus;
procedure ibus_lookup_table_set_cursor_visible(table: PIBusLookupTable; visible: Tgboolean); cdecl; external libibus;
function ibus_lookup_table_is_cursor_visible(table: PIBusLookupTable): Tgboolean; cdecl; external libibus;
function ibus_lookup_table_get_cursor_in_page(table: PIBusLookupTable): Tguint; cdecl; external libibus;
procedure ibus_lookup_table_set_page_size(table: PIBusLookupTable; page_size: Tguint); cdecl; external libibus;
function ibus_lookup_table_get_page_size(table: PIBusLookupTable): Tguint; cdecl; external libibus;
procedure ibus_lookup_table_set_round(table: PIBusLookupTable; round: Tgboolean); cdecl; external libibus;
function ibus_lookup_table_is_round(table: PIBusLookupTable): Tgboolean; cdecl; external libibus;
procedure ibus_lookup_table_set_orientation(table: PIBusLookupTable; orientation: Tgint); cdecl; external libibus;
function ibus_lookup_table_get_orientation(table: PIBusLookupTable): Tgint; cdecl; external libibus;
procedure ibus_lookup_table_clear(table: PIBusLookupTable); cdecl; external libibus;
function ibus_lookup_table_page_up(table: PIBusLookupTable): Tgboolean; cdecl; external libibus;
function ibus_lookup_table_page_down(table: PIBusLookupTable): Tgboolean; cdecl; external libibus;
function ibus_lookup_table_cursor_up(table: PIBusLookupTable): Tgboolean; cdecl; external libibus;
function ibus_lookup_table_cursor_down(table: PIBusLookupTable): Tgboolean; cdecl; external libibus;

// === Konventiert am: 25-7-25 19:42:41 ===

function IBUS_TYPE_LOOKUP_TABLE: TGType;
function IBUS_LOOKUP_TABLE(obj: Pointer): PIBusLookupTable;
function IBUS_LOOKUP_TABLE_CLASS(klass: Pointer): PIBusLookupTableClass;
function IBUS_IS_LOOKUP_TABLE(obj: Pointer): Tgboolean;
function IBUS_IS_LOOKUP_TABLE_CLASS(klass: Pointer): Tgboolean;
function IBUS_LOOKUP_TABLE_GET_CLASS(obj: Pointer): PIBusLookupTableClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_LOOKUP_TABLE: TGType;
begin
  IBUS_TYPE_LOOKUP_TABLE := ibus_lookup_table_get_type;
end;

function IBUS_LOOKUP_TABLE(obj: Pointer): PIBusLookupTable;
begin
  Result := PIBusLookupTable(g_type_check_instance_cast(obj, IBUS_TYPE_LOOKUP_TABLE));
end;

function IBUS_LOOKUP_TABLE_CLASS(klass: Pointer): PIBusLookupTableClass;
begin
  Result := PIBusLookupTableClass(g_type_check_class_cast(klass, IBUS_TYPE_LOOKUP_TABLE));
end;

function IBUS_IS_LOOKUP_TABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_LOOKUP_TABLE);
end;

function IBUS_IS_LOOKUP_TABLE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_LOOKUP_TABLE);
end;

function IBUS_LOOKUP_TABLE_GET_CLASS(obj: Pointer): PIBusLookupTableClass;
begin
  Result := PIBusLookupTableClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
