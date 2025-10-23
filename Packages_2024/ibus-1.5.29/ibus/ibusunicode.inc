{$IFDEF read_interface}


type
  TIBusUnicodeDataLoadAsyncFinish = procedure(data_list: PGSList; user_data: Tgpointer); cdecl;

  PIBusUnicodeDataPrivate = type Pointer;

  TIBusUnicodeData = record
    parent: TIBusSerializable;
    priv: PIBusUnicodeDataPrivate;
  end;
  PIBusUnicodeData = ^TIBusUnicodeData;

  TIBusUnicodeDataClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusUnicodeDataClass = ^TIBusUnicodeDataClass;

  PIBusUnicodeBlockPrivate = type Pointer;

  TIBusUnicodeBlock = record
    parent: TIBusSerializable;
    priv: PIBusUnicodeBlockPrivate;
  end;
  PIBusUnicodeBlock = ^TIBusUnicodeBlock;

  TIBusUnicodeBlockClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusUnicodeBlockClass = ^TIBusUnicodeBlockClass;

function ibus_unicode_data_get_type: TGType; cdecl; external libibus;
function ibus_unicode_block_get_type: TGType; cdecl; external libibus;
function ibus_unicode_data_new(first_property_name: Pgchar): PIBusUnicodeData; cdecl; varargs; external libibus;
function ibus_unicode_data_get_code(unicode: PIBusUnicodeData): Tgunichar; cdecl; external libibus;
function ibus_unicode_data_get_name(unicode: PIBusUnicodeData): Pgchar; cdecl; external libibus;
function ibus_unicode_data_get_alias(unicode: PIBusUnicodeData): Pgchar; cdecl; external libibus;
function ibus_unicode_data_get_block_name(unicode: PIBusUnicodeData): Pgchar; cdecl; external libibus;
procedure ibus_unicode_data_set_block_name(unicode: PIBusUnicodeData; block_name: Pgchar); cdecl; external libibus;
procedure ibus_unicode_data_save(path: Pgchar; list: PGSList); cdecl; external libibus;
function ibus_unicode_data_load(path: Pgchar; obj: PGObject): PGSList; cdecl; external libibus;
procedure ibus_unicode_data_load_async(path: Pgchar; obj: PGObject; cancellable: PGCancellable; callback: TIBusUnicodeDataLoadAsyncFinish; user_data: Tgpointer); cdecl; external libibus;
function ibus_unicode_block_new(first_property_name: Pgchar): PIBusUnicodeBlock; cdecl; varargs; external libibus;
function ibus_unicode_block_get_start(block: PIBusUnicodeBlock): Tgunichar; cdecl; external libibus;
function ibus_unicode_block_get_end(block: PIBusUnicodeBlock): Tgunichar; cdecl; external libibus;
function ibus_unicode_block_get_name(block: PIBusUnicodeBlock): Pgchar; cdecl; external libibus;
procedure ibus_unicode_block_save(path: Pgchar; list: PGSList); cdecl; external libibus;
function ibus_unicode_block_load(path: Pgchar): PGSList; cdecl; external libibus;

// === Konventiert am: 26-7-25 15:33:58 ===

function IBUS_TYPE_UNICODE_DATA: TGType;
function IBUS_UNICODE_DATA(obj: Pointer): PIBusUnicodeData;
function IBUS_UNICODE_DATA_CLASS(klass: Pointer): PIBusUnicodeDataClass;
function IBUS_IS_UNICODE_DATA(obj: Pointer): Tgboolean;

function IBUS_TYPE_UNICODE_BLOCK: TGType;
function IBUS_UNICODE_BLOCK(obj: Pointer): PIBusUnicodeBlock;
function IBUS_UNICODE_BLOCK_CLASS(klass: Pointer): PIBusUnicodeBlockClass;
function IBUS_IS_UNICODE_BLOCK(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_UNICODE_DATA: TGType;
begin
  IBUS_TYPE_UNICODE_DATA := ibus_unicode_data_get_type;
end;

function IBUS_UNICODE_DATA(obj: Pointer): PIBusUnicodeData;
begin
  Result := PIBusUnicodeData(g_type_check_instance_cast(obj, IBUS_TYPE_UNICODE_DATA));
end;

function IBUS_UNICODE_DATA_CLASS(klass: Pointer): PIBusUnicodeDataClass;
begin
  Result := PIBusUnicodeDataClass(g_type_check_class_cast(klass, IBUS_TYPE_UNICODE_DATA));
end;

function IBUS_IS_UNICODE_DATA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_UNICODE_DATA);
end;

// =====

function IBUS_TYPE_UNICODE_BLOCK: TGType;
begin
  IBUS_TYPE_UNICODE_BLOCK := ibus_unicode_block_get_type;
end;

function IBUS_UNICODE_BLOCK(obj: Pointer): PIBusUnicodeBlock;
begin
  Result := PIBusUnicodeBlock(g_type_check_instance_cast(obj, IBUS_TYPE_UNICODE_BLOCK));
end;

function IBUS_UNICODE_BLOCK_CLASS(klass: Pointer): PIBusUnicodeBlockClass;
begin
  Result := PIBusUnicodeBlockClass(g_type_check_class_cast(klass, IBUS_TYPE_UNICODE_BLOCK));
end;

function IBUS_IS_UNICODE_BLOCK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_UNICODE_BLOCK);
end;

{$ENDIF read_implementation}
