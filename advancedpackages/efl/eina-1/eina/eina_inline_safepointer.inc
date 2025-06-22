{$IFDEF read_interface}


type
  TEina_Sp_Id = PtrUInt;
  TEina_Table_Index = int16;
  TEina_Generation_Counter = uint16;

const
  {$IF SIZEOF(TEina_Sp_Id) = 4}
  // 32 bits
  EINA_BITS_MID_TABLE_ID = 5;
  EINA_BITS_TABLE_ID = 5;
  EINA_BITS_ENTRY_ID = 12;
  EINA_BITS_GENERATION_COUNTER = 8;
  EINA_BITS_FREE_COUNTER = 2;
  EINA_DROPPED_TABLES = 0;
  EINA_DROPPED_ENTRIES = 3;
  {$ELSE}
  EINA_BITS_MID_TABLE_ID = 11;
  EINA_BITS_TABLE_ID = 11;
  EINA_BITS_ENTRY_ID = 12;
  EINA_BITS_GENERATION_COUNTER = 11;
  EINA_BITS_FREE_COUNTER = 2;
  EINA_DROPPED_TABLES = 2;
  EINA_DROPPED_ENTRIES = 2;
  {$ENDIF}

const
  EINA_SHIFT_GENERATION = EINA_BITS_FREE_COUNTER;
  EINA_SHIFT_ENTRY_ID = EINA_SHIFT_GENERATION + EINA_BITS_GENERATION_COUNTER;
  EINA_SHIFT_TABLE_ID = EINA_SHIFT_ENTRY_ID + EINA_BITS_ENTRY_ID;
  EINA_SHIFT_MID_TABLE_ID = EINA_SHIFT_TABLE_ID + EINA_BITS_TABLE_ID;

  EINA_MAX_MID_TABLE_ID = 1 shl EINA_BITS_MID_TABLE_ID;
  EINA_MAX_TABLE_ID = (1 shl EINA_BITS_TABLE_ID) - EINA_DROPPED_TABLES;
  EINA_MAX_ENTRY_ID = (1 shl EINA_BITS_ENTRY_ID) - EINA_DROPPED_ENTRIES;
  EINA_MAX_GENERATIONS = 1 shl EINA_BITS_GENERATION_COUNTER;

  EINA_MASK_MID_TABLE_ID = EINA_MAX_MID_TABLE_ID - 1;
  EINA_MASK_TABLE_ID = (1 shl EINA_BITS_TABLE_ID) - 1;
  EINA_MASK_ENTRY_ID = (1 shl EINA_BITS_ENTRY_ID) - 1;
  EINA_MASK_GENERATIONS = EINA_MAX_GENERATIONS - 1;

type
  TEina_Memory_Entry = bitpacked record
    ptr: Pointer;
    active: 0..1;
    generation: 0..1 shl EINA_BITS_GENERATION_COUNTER;
  end;
  PEina_Memory_Entry = ^TEina_Memory_Entry;

  TEina_Memory_Table = record
    trash: PEina_Trash;
    partial_id: TEina_Sp_Id;
    start: TEina_Table_Index;
    entries: array[0..EINA_MAX_ENTRY_ID - 1] of TEina_Memory_Entry;
  end;
  PEina_Memory_Table = ^TEina_Memory_Table;
  PPEina_Memory_Table = ^PEina_Memory_Table;

//  TEina_Safepointer = TEina_Sp_Id;

var
  _eina_sp_ids_tables: array[0..EINA_MAX_MID_TABLE_ID - 1] of PPEina_Memory_Table; cvar;external libeina;
  _eina_sp_log_dom: longint; cvar;external libeina;

function _eina_safepointer_entry_get(Safe: TEina_Safepointer; rtable: PPEina_Memory_Table): PEina_Memory_Entry;
function eina_safepointer_get(Safe: TEina_Safepointer): Pointer;

{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure EINA_SP_DECOMPOSE_ID(ID: TEina_Sp_Id; out MidTable, Table, Entry: TEina_Table_Index; out Generation: TEina_Generation_Counter);
begin
  MidTable := (ID shr EINA_SHIFT_MID_TABLE_ID) and EINA_MASK_MID_TABLE_ID;
  Table := (ID shr EINA_SHIFT_TABLE_ID) and EINA_MASK_TABLE_ID;
  Entry := (ID shr EINA_SHIFT_ENTRY_ID) and EINA_MASK_ENTRY_ID;
  Generation := (ID shr EINA_SHIFT_GENERATION) and EINA_MASK_GENERATIONS;
end;

function _eina_safepointer_entry_get(Safe: TEina_Safepointer; rtable: PPEina_Memory_Table): PEina_Memory_Entry;
var
  mid_table_id, table_id, entry_id: TEina_Table_Index;
  generation: TEina_Generation_Counter;
  id: TEina_Sp_Id;
  table: PEina_Memory_Table;
  entry: PEina_Memory_Entry;
begin
  id := TEina_Sp_Id(safe);

  EINA_SP_DECOMPOSE_ID(id, mid_table_id, table_id, entry_id, generation);

  if (Assigned(_eina_sp_ids_tables[mid_table_id])) and
    (Assigned(_eina_sp_ids_tables[mid_table_id][table_id])) and
    (entry_id < EINA_MAX_ENTRY_ID) then begin
    table := _eina_sp_ids_tables[mid_table_id][table_id];
    entry := @table^.entries[entry_id];

    if (entry^.active <> 0) and (entry^.generation = generation) then begin
      if rtable <> nil then begin
        rtable^ := table;
      end;
      Exit(entry);
    end;
  end;

  printf('Pointer %p is not a pointer to a valid object.', Pointer(safe));
  Result := nil;
end;

function eina_safepointer_get(Safe: TEina_Safepointer): Pointer;
var
  Entry: PEina_Memory_Entry;
begin
  if Safe = 0 then begin
    Exit(nil);
  end;

  Entry := _eina_safepointer_entry_get(Safe, nil);
  if Entry = nil then  begin
    Exit(nil);
  end;
  Result := Entry^.ptr;
end;

{$ENDIF read_implementation}
