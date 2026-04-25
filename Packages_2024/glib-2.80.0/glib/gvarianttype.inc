
{$IFDEF read_interface}

type
  PGVariantType = PChar;
  PPGVariantType = ^PGVariantType;

function g_variant_type_string_is_valid(type_string: Pgchar): Tgboolean; cdecl; external libglib2;
function g_variant_type_string_scan(_string: Pgchar; limit: Pgchar; endptr: PPgchar): Tgboolean; cdecl; external libglib2;
procedure g_variant_type_free(_type: PGVariantType); cdecl; external libglib2;
function g_variant_type_copy(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_new(type_string: Pgchar): PGVariantType; cdecl; external libglib2;
function g_variant_type_get_string_length(_type: PGVariantType): Tgsize; cdecl; external libglib2;
function g_variant_type_peek_string(_type: PGVariantType): Pgchar; cdecl; external libglib2;
function g_variant_type_dup_string(_type: PGVariantType): Pgchar; cdecl; external libglib2;
function g_variant_type_is_definite(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_container(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_basic(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_maybe(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_array(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_tuple(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_dict_entry(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_variant(_type: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_hash(_type: Tgconstpointer): Tguint; cdecl; external libglib2;
function g_variant_type_equal(type1: Tgconstpointer; type2: Tgconstpointer): Tgboolean; cdecl; external libglib2;
function g_variant_type_is_subtype_of(_type: PGVariantType; supertype: PGVariantType): Tgboolean; cdecl; external libglib2;
function g_variant_type_element(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_first(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_next(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_n_items(_type: PGVariantType): Tgsize; cdecl; external libglib2;
function g_variant_type_key(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_value(_type: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_new_array(element: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_new_maybe(element: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_new_tuple(items: PPGVariantType; length: Tgint): PGVariantType; cdecl; external libglib2;
function g_variant_type_new_dict_entry(key: PGVariantType; Value: PGVariantType): PGVariantType; cdecl; external libglib2;
function g_variant_type_checked_(type_string: Pgchar): PGVariantType; cdecl; external libglib2;
function g_variant_type_string_get_depth_(type_string: Pgchar): Tgsize; cdecl; external libglib2;

const
  G_VARIANT_TYPE_BOOLEAN: pchar = 'b' + '';
  G_VARIANT_TYPE_BYTE: pchar = 'y' + '';
  G_VARIANT_TYPE_INT16: pchar = 'n' + '';
  G_VARIANT_TYPE_UINT16: pchar = 'q' + '';
  G_VARIANT_TYPE_INT32: pchar = 'i' + '';
  G_VARIANT_TYPE_UINT32: pchar = 'u' + '';
  G_VARIANT_TYPE_INT64: pchar = 'x' + '';
  G_VARIANT_TYPE_UINT64: pchar = 't' + '';
  G_VARIANT_TYPE_DOUBLE: pchar = 'd' + '';
  G_VARIANT_TYPE_STRING: pchar = 's' + '';
  G_VARIANT_TYPE_OBJECT_PATH: pchar = 'o' + '';
  G_VARIANT_TYPE_SIGNATURE: pchar = 'g' + '';
  G_VARIANT_TYPE_VARIANT: pchar = 'v' + '';
  G_VARIANT_TYPE_HANDLE: pchar = 'h' + '';
  G_VARIANT_TYPE_UNIT: pchar = '()' + '';
  G_VARIANT_TYPE_ANY: pchar = '*' + '';
  G_VARIANT_TYPE_BASIC: pchar = '?' + '';
  G_VARIANT_TYPE_MAYBE: pchar = 'm*' + '';
  G_VARIANT_TYPE_ARRAY: pchar = 'a*' + '';
  G_VARIANT_TYPE_TUPLE: pchar = 'r' + '';
  G_VARIANT_TYPE_DICT_ENTRY: pchar = '{?*}' + '';
  G_VARIANT_TYPE_DICTIONARY: pchar = 'a{?*}' + '';
  G_VARIANT_TYPE_STRING_ARRAY: pchar = 'as' + '';
  G_VARIANT_TYPE_OBJECT_PATH_ARRAY: pchar = 'ao' + '';
  G_VARIANT_TYPE_BYTESTRING: pchar = 'ay' + '';
  G_VARIANT_TYPE_BYTESTRING_ARRAY: pchar = 'aay' + '';
  G_VARIANT_TYPE_VARDICT: pchar = 'a{sv}' + '';

  function G_VARIANT_TYPE(type_string: Pgchar): PGVariantType;


// === Konventiert am: 6-8-24 16:12:48 ===


{$ENDIF read_interface}

{$IFDEF read_implementation}

function G_VARIANT_TYPE(type_string: Pgchar): PGVariantType;
begin
  G_VARIANT_TYPE := g_variant_type_checked_(type_string);
end;

{$ENDIF read_implementation}
