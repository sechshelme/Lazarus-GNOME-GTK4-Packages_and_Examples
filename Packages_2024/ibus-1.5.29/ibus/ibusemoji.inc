{$IFDEF read_interface}


type
  PIBusEmojiDataPrivate = type Pointer;

  TIBusEmojiData = record
    parent: TIBusSerializable;
    priv: PIBusEmojiDataPrivate;
  end;
  PIBusEmojiData = ^TIBusEmojiData;

  TIBusEmojiDataClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusEmojiDataClass = ^TIBusEmojiDataClass;


function ibus_emoji_data_get_type: TGType; cdecl; external libibus;
function ibus_emoji_data_new(first_property_name: Pgchar): PIBusEmojiData; cdecl; varargs; external libibus;
function ibus_emoji_data_get_emoji(emoji: PIBusEmojiData): Pgchar; cdecl; external libibus;
function ibus_emoji_data_get_annotations(emoji: PIBusEmojiData): PGSList; cdecl; external libibus;
procedure ibus_emoji_data_set_annotations(emoji: PIBusEmojiData; annotations: PGSList); cdecl; external libibus;
function ibus_emoji_data_get_description(emoji: PIBusEmojiData): Pgchar; cdecl; external libibus;
procedure ibus_emoji_data_set_description(emoji: PIBusEmojiData; description: Pgchar); cdecl; external libibus;
function ibus_emoji_data_get_category(emoji: PIBusEmojiData): Pgchar; cdecl; external libibus;
procedure ibus_emoji_dict_save(path: Pgchar; dict: PGHashTable); cdecl; external libibus;
function ibus_emoji_dict_load(path: Pgchar): PGHashTable; cdecl; external libibus;
function ibus_emoji_dict_lookup(dict: PGHashTable; emoji: Pgchar): PIBusEmojiData; cdecl; external libibus;
procedure ibus_emoji_data_save(path: Pgchar; list: PGSList); cdecl; external libibus;
function ibus_emoji_data_load(path: Pgchar): PGSList; cdecl; external libibus;

// === Konventiert am: 26-7-25 15:53:49 ===

function IBUS_TYPE_EMOJI_DATA: TGType;
function IBUS_EMOJI_DATA(obj: Pointer): PIBusEmojiData;
function IBUS_EMOJI_DATA_CLASS(klass: Pointer): PIBusEmojiDataClass;
function IBUS_IS_EMOJI_DATA(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_EMOJI_DATA: TGType;
begin
  IBUS_TYPE_EMOJI_DATA := ibus_emoji_data_get_type;
end;

function IBUS_EMOJI_DATA(obj: Pointer): PIBusEmojiData;
begin
  Result := PIBusEmojiData(g_type_check_instance_cast(obj, IBUS_TYPE_EMOJI_DATA));
end;

function IBUS_EMOJI_DATA_CLASS(klass: Pointer): PIBusEmojiDataClass;
begin
  Result := PIBusEmojiDataClass(g_type_check_class_cast(klass, IBUS_TYPE_EMOJI_DATA));
end;

function IBUS_IS_EMOJI_DATA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_EMOJI_DATA);
end;



{$ENDIF read_implementation}
