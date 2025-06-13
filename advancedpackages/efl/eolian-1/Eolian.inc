{$IFDEF read_interface}


const
  EOLIAN_FILE_FORMAT_VERSION = 1;

type
  TEolian_State = record
  end;
  PEolian_State = ^TEolian_State;

  TEolian_Object = record
  end;
  PEolian_Object = ^TEolian_Object;
  PPEolian_Object = ^PEolian_Object;

  TEolian_Class = record
  end;
  PEolian_Class = ^TEolian_Class;

  TEolian_Function = record
  end;
  PEolian_Function = ^TEolian_Function;

  TEolian_Part = record
  end;
  PEolian_Part = ^TEolian_Part;

  TEolian_Type = record
  end;
  PEolian_Type = ^TEolian_Type;

  TEolian_Typedecl = record
  end;
  PEolian_Typedecl = ^TEolian_Typedecl;

  TEolian_Function_Parameter = record
  end;
  PEolian_Function_Parameter = ^TEolian_Function_Parameter;

  TEolian_Implement = record
  end;
  PEolian_Implement = ^TEolian_Implement;

  TEolian_Constructor = record
  end;
  PEolian_Constructor = ^TEolian_Constructor;

  TEolian_Event = record
  end;
  PEolian_Event = ^TEolian_Event;

  TEolian_Expression = record
  end;
  PEolian_Expression = ^TEolian_Expression;

  TEolian_Constant = record
  end;
  PEolian_Constant = ^TEolian_Constant;

  TEolian_Error = record
  end;
  PEolian_Error = ^TEolian_Error;

  TEolian_Struct_Type_Field = record
  end;
  PEolian_Struct_Type_Field = ^TEolian_Struct_Type_Field;

  TEolian_Enum_Type_Field = record
  end;
  PEolian_Enum_Type_Field = ^TEolian_Enum_Type_Field;

  TEolian_Documentation = record
  end;
  PEolian_Documentation = ^TEolian_Documentation;

  TEolian_Unit = record
  end;
  PEolian_Unit = ^TEolian_Unit;


type
  TEolian_Panic_Cb = procedure(state: PEolian_State; msg: PEina_Stringshare); cdecl;
  TEolian_Error_Cb = procedure(obj: PEolian_Object; msg: pchar; data: pointer); cdecl;

type
  PEolian_Object_Type = ^TEolian_Object_Type;
  TEolian_Object_Type = longint;

const
  EOLIAN_OBJECT_UNKNOWN = 0;
  EOLIAN_OBJECT_CLASS = 1;
  EOLIAN_OBJECT_TYPEDECL = 2;
  EOLIAN_OBJECT_STRUCT_FIELD = 3;
  EOLIAN_OBJECT_ENUM_FIELD = 4;
  EOLIAN_OBJECT_TYPE = 5;
  EOLIAN_OBJECT_CONSTANT = 6;
  EOLIAN_OBJECT_EXPRESSION = 7;
  EOLIAN_OBJECT_FUNCTION = 8;
  EOLIAN_OBJECT_FUNCTION_PARAMETER = 9;
  EOLIAN_OBJECT_EVENT = 10;
  EOLIAN_OBJECT_PART = 11;
  EOLIAN_OBJECT_IMPLEMENT = 12;
  EOLIAN_OBJECT_CONSTRUCTOR = 13;
  EOLIAN_OBJECT_DOCUMENTATION = 14;
  EOLIAN_OBJECT_ERROR = 15;

type
  PEolian_Function_Type = ^TEolian_Function_Type;
  TEolian_Function_Type = longint;

const
  EOLIAN_UNRESOLVED = 0;
  EOLIAN_PROPERTY = 1;
  EOLIAN_PROP_SET = 2;
  EOLIAN_PROP_GET = 3;
  EOLIAN_METHOD = 4;
  EOLIAN_FUNCTION_POINTER = 5;

type
  PEolian_Parameter_Direction = ^TEolian_Parameter_Direction;
  TEolian_Parameter_Direction = longint;

const
  EOLIAN_PARAMETER_UNKNOWN = 0;
  EOLIAN_PARAMETER_IN = 1;
  EOLIAN_PARAMETER_OUT = 2;
  EOLIAN_PARAMETER_INOUT = 3;

type
  PEolian_Class_Type = ^TEolian_Class_Type;
  TEolian_Class_Type = longint;

const
  EOLIAN_CLASS_UNKNOWN_TYPE = 0;
  EOLIAN_CLASS_REGULAR = 1;
  EOLIAN_CLASS_ABSTRACT = 2;
  EOLIAN_CLASS_MIXIN = 3;
  EOLIAN_CLASS_INTERFACE = 4;

type
  PEolian_Object_Scope = ^TEolian_Object_Scope;
  TEolian_Object_Scope = longint;

const
  EOLIAN_SCOPE_UNKNOWN = 0;
  EOLIAN_SCOPE_PUBLIC = 1;
  EOLIAN_SCOPE_PRIVATE = 2;
  EOLIAN_SCOPE_PROTECTED = 3;

type
  PEolian_Typedecl_Type = ^TEolian_Typedecl_Type;
  TEolian_Typedecl_Type = longint;

const
  EOLIAN_TYPEDECL_UNKNOWN = 0;
  EOLIAN_TYPEDECL_STRUCT = 1;
  EOLIAN_TYPEDECL_STRUCT_OPAQUE = 2;
  EOLIAN_TYPEDECL_ENUM = 3;
  EOLIAN_TYPEDECL_ALIAS = 4;
  EOLIAN_TYPEDECL_FUNCTION_POINTER = 5;

type
  PEolian_Type_Type = ^TEolian_Type_Type;
  TEolian_Type_Type = longint;

const
  EOLIAN_TYPE_UNKNOWN_TYPE = 0;
  EOLIAN_TYPE_VOID = 1;
  EOLIAN_TYPE_REGULAR = 2;
  EOLIAN_TYPE_CLASS = 3;
  EOLIAN_TYPE_ERROR = 4;
  EOLIAN_TYPE_UNDEFINED = 5;

type
  PEolian_Type_Builtin_Type = ^TEolian_Type_Builtin_Type;
  TEolian_Type_Builtin_Type = longint;

const
  EOLIAN_TYPE_BUILTIN_INVALID = 0;
  EOLIAN_TYPE_BUILTIN_BYTE = 1;
  EOLIAN_TYPE_BUILTIN_UBYTE = 2;
  EOLIAN_TYPE_BUILTIN_CHAR = 3;
  EOLIAN_TYPE_BUILTIN_SHORT = 4;
  EOLIAN_TYPE_BUILTIN_USHORT = 5;
  EOLIAN_TYPE_BUILTIN_INT = 6;
  EOLIAN_TYPE_BUILTIN_UINT = 7;
  EOLIAN_TYPE_BUILTIN_LONG = 8;
  EOLIAN_TYPE_BUILTIN_ULONG = 9;
  EOLIAN_TYPE_BUILTIN_LLONG = 10;
  EOLIAN_TYPE_BUILTIN_ULLONG = 11;
  EOLIAN_TYPE_BUILTIN_INT8 = 12;
  EOLIAN_TYPE_BUILTIN_UINT8 = 13;
  EOLIAN_TYPE_BUILTIN_INT16 = 14;
  EOLIAN_TYPE_BUILTIN_UINT16 = 15;
  EOLIAN_TYPE_BUILTIN_INT32 = 16;
  EOLIAN_TYPE_BUILTIN_UINT32 = 17;
  EOLIAN_TYPE_BUILTIN_INT64 = 18;
  EOLIAN_TYPE_BUILTIN_UINT64 = 19;
  EOLIAN_TYPE_BUILTIN_INT128 = 20;
  EOLIAN_TYPE_BUILTIN_UINT128 = 21;
  EOLIAN_TYPE_BUILTIN_SIZE = 22;
  EOLIAN_TYPE_BUILTIN_SSIZE = 23;
  EOLIAN_TYPE_BUILTIN_INTPTR = 24;
  EOLIAN_TYPE_BUILTIN_UINTPTR = 25;
  EOLIAN_TYPE_BUILTIN_PTRDIFF = 26;
  EOLIAN_TYPE_BUILTIN_TIME = 27;
  EOLIAN_TYPE_BUILTIN_FLOAT = 28;
  EOLIAN_TYPE_BUILTIN_DOUBLE = 29;
  EOLIAN_TYPE_BUILTIN_BOOL = 30;
  EOLIAN_TYPE_BUILTIN_SLICE = 31;
  EOLIAN_TYPE_BUILTIN_RW_SLICE = 32;
  EOLIAN_TYPE_BUILTIN_VOID = 33;
  EOLIAN_TYPE_BUILTIN_ACCESSOR = 34;
  EOLIAN_TYPE_BUILTIN_ARRAY = 35;
  EOLIAN_TYPE_BUILTIN_FUTURE = 36;
  EOLIAN_TYPE_BUILTIN_ITERATOR = 37;
  EOLIAN_TYPE_BUILTIN_LIST = 38;
  EOLIAN_TYPE_BUILTIN_BETA_PLACEHOLDER1 = 39;
  EOLIAN_TYPE_BUILTIN_ANY_VALUE = 40;
  EOLIAN_TYPE_BUILTIN_ANY_VALUE_REF = 41;
  EOLIAN_TYPE_BUILTIN_BINBUF = 42;
  EOLIAN_TYPE_BUILTIN_EVENT = 43;
  EOLIAN_TYPE_BUILTIN_MSTRING = 44;
  EOLIAN_TYPE_BUILTIN_STRING = 45;
  EOLIAN_TYPE_BUILTIN_STRINGSHARE = 46;
  EOLIAN_TYPE_BUILTIN_STRBUF = 47;
  EOLIAN_TYPE_BUILTIN_HASH = 48;
  EOLIAN_TYPE_BUILTIN_VOID_PTR = 49;

type
  PEolian_Expression_Type = ^TEolian_Expression_Type;
  TEolian_Expression_Type = longint;

const
  EOLIAN_EXPR_UNKNOWN = 0;
  EOLIAN_EXPR_INT = 1;
  EOLIAN_EXPR_UINT = 2;
  EOLIAN_EXPR_LONG = 3;
  EOLIAN_EXPR_ULONG = 4;
  EOLIAN_EXPR_LLONG = 5;
  EOLIAN_EXPR_ULLONG = 6;
  EOLIAN_EXPR_FLOAT = 7;
  EOLIAN_EXPR_DOUBLE = 8;
  EOLIAN_EXPR_STRING = 9;
  EOLIAN_EXPR_CHAR = 10;
  EOLIAN_EXPR_NULL = 11;
  EOLIAN_EXPR_BOOL = 12;
  EOLIAN_EXPR_NAME = 13;
  EOLIAN_EXPR_UNARY = 14;
  EOLIAN_EXPR_BINARY = 15;

type
  PEolian_Expression_Mask = ^TEolian_Expression_Mask;
  TEolian_Expression_Mask = longint;

const
  EOLIAN_MASK_SINT = 1 shl 0;
  EOLIAN_MASK_UINT = 1 shl 1;
  EOLIAN_MASK_INT = EOLIAN_MASK_SINT or EOLIAN_MASK_UINT;
  EOLIAN_MASK_FLOAT = 1 shl 2;
  EOLIAN_MASK_BOOL = 1 shl 3;
  EOLIAN_MASK_STRING = 1 shl 4;
  EOLIAN_MASK_CHAR = 1 shl 5;
  EOLIAN_MASK_NULL = 1 shl 6;
  EOLIAN_MASK_SIGNED = EOLIAN_MASK_SINT or EOLIAN_MASK_FLOAT;
  EOLIAN_MASK_NUMBER = EOLIAN_MASK_INT or EOLIAN_MASK_FLOAT;
  EOLIAN_MASK_ALL = (((EOLIAN_MASK_NUMBER or EOLIAN_MASK_BOOL) or EOLIAN_MASK_STRING) or EOLIAN_MASK_CHAR) or EOLIAN_MASK_NULL;

type
  TEolian_Value_Union = record
    case longint of
      0: (c: char);
      1: (b: TEina_Bool);
      2: (s: pchar);
      3: (i: longint);
      4: (u: dword);
      5: (l: longint);
      6: (ul: dword);
      7: (ll: int64);
      8: (ull: qword);
      9: (f: single);
      10: (d: double);
  end;
  PEolian_Value_Union = ^TEolian_Value_Union;

  TEolian_Value = record
    _type: TEolian_Expression_Type;
    value: TEolian_Value_Union;
  end;
  PEolian_Value = ^TEolian_Value;

  PEolian_Binary_Operator = ^TEolian_Binary_Operator;
  TEolian_Binary_Operator = longint;

const
  EOLIAN_BINOP_INVALID = 0;
  EOLIAN_BINOP_ADD = 1;
  EOLIAN_BINOP_SUB = 2;
  EOLIAN_BINOP_MUL = 3;
  EOLIAN_BINOP_DIV = 4;
  EOLIAN_BINOP_MOD = 5;
  EOLIAN_BINOP_EQ = 6;
  EOLIAN_BINOP_NQ = 7;
  EOLIAN_BINOP_GT = 8;
  EOLIAN_BINOP_LT = 9;
  EOLIAN_BINOP_GE = 10;
  EOLIAN_BINOP_LE = 11;
  EOLIAN_BINOP_AND = 12;
  EOLIAN_BINOP_OR = 13;
  EOLIAN_BINOP_BAND = 14;
  EOLIAN_BINOP_BOR = 15;
  EOLIAN_BINOP_BXOR = 16;
  EOLIAN_BINOP_LSH = 17;
  EOLIAN_BINOP_RSH = 18;

type
  PEolian_Unary_Operator = ^TEolian_Unary_Operator;
  TEolian_Unary_Operator = longint;

const
  EOLIAN_UNOP_INVALID = 0;
  EOLIAN_UNOP_UNM = 1;
  EOLIAN_UNOP_UNP = 2;
  EOLIAN_UNOP_NOT = 3;
  EOLIAN_UNOP_BNOT = 4;

type
  PEolian_Doc_Token_Type = ^TEolian_Doc_Token_Type;
  TEolian_Doc_Token_Type = longint;

const
  EOLIAN_DOC_TOKEN_UNKNOWN = 0;
  EOLIAN_DOC_TOKEN_TEXT = 1;
  EOLIAN_DOC_TOKEN_REF = 2;
  EOLIAN_DOC_TOKEN_MARK_NOTE = 3;
  EOLIAN_DOC_TOKEN_MARK_WARNING = 4;
  EOLIAN_DOC_TOKEN_MARK_REMARK = 5;
  EOLIAN_DOC_TOKEN_MARK_TODO = 6;
  EOLIAN_DOC_TOKEN_MARKUP_MONOSPACE = 7;

type
  TEolian_Doc_Token = record
    _type: TEolian_Doc_Token_Type;
    text: pchar;
    text_end: pchar;
  end;
  PEolian_Doc_Token = ^TEolian_Doc_Token;

function eolian_init: longint; cdecl; external libeolian;
function eolian_shutdown: longint; cdecl; external libeolian;
function eolian_file_format_version_get: word; cdecl; external libeolian;
function eolian_state_new: PEolian_State; cdecl; external libeolian;
procedure eolian_state_free(state: PEolian_State); cdecl; external libeolian;
function eolian_state_panic_cb_set(state: PEolian_State; cb: TEolian_Panic_Cb): TEolian_Panic_Cb; cdecl; external libeolian;
function eolian_state_error_cb_set(state: PEolian_State; cb: TEolian_Error_Cb): TEolian_Error_Cb; cdecl; external libeolian;
function eolian_state_error_data_set(state: PEolian_State; data: pointer): pointer; cdecl; external libeolian;
function eolian_object_type_get(obj: PEolian_Object): TEolian_Object_Type; cdecl; external libeolian;
function eolian_object_unit_get(obj: PEolian_Object): PEolian_Unit; cdecl; external libeolian;
function eolian_object_file_get(obj: PEolian_Object): pchar; cdecl; external libeolian;
function eolian_object_line_get(obj: PEolian_Object): longint; cdecl; external libeolian;
function eolian_object_column_get(obj: PEolian_Object): longint; cdecl; external libeolian;
function eolian_object_name_get(obj: PEolian_Object): pchar; cdecl; external libeolian;
function eolian_object_c_name_get(obj: PEolian_Object): pchar; cdecl; external libeolian;
function eolian_object_short_name_get(obj: PEolian_Object): pchar; cdecl; external libeolian;
function eolian_object_namespaces_get(obj: PEolian_Object): PEina_Iterator; cdecl; external libeolian;
function eolian_object_is_beta(obj: PEolian_Object): TEina_Bool; cdecl; external libeolian;
function eolian_state_directory_add(state: PEolian_State; dir: pchar): TEina_Bool; cdecl; external libeolian;
function eolian_state_system_directory_add(state: PEolian_State): TEina_Bool; cdecl; external libeolian;
function eolian_state_eo_file_paths_get(state: PEolian_State): PEina_Iterator; cdecl; external libeolian;
function eolian_state_eot_file_paths_get(state: PEolian_State): PEina_Iterator; cdecl; external libeolian;
function eolian_state_eo_files_get(state: PEolian_State): PEina_Iterator; cdecl; external libeolian;
function eolian_state_eot_files_get(state: PEolian_State): PEina_Iterator; cdecl; external libeolian;
function eolian_state_file_parse(state: PEolian_State; filename: pchar): PEolian_Unit; cdecl; external libeolian;
function eolian_state_file_path_parse(state: PEolian_State; filepath: pchar): PEolian_Unit; cdecl; external libeolian;
function eolian_state_all_eo_files_parse(state: PEolian_State): TEina_Bool; cdecl; external libeolian;
function eolian_state_all_eot_files_parse(state: PEolian_State): TEina_Bool; cdecl; external libeolian;
function eolian_state_check(state: PEolian_State): TEina_Bool; cdecl; external libeolian;
function eolian_state_unit_by_file_get(state: PEolian_State; file_name: pchar): PEolian_Unit; cdecl; external libeolian;
function eolian_state_units_get(state: PEolian_State): PEina_Iterator; cdecl; external libeolian;
function eolian_unit_state_get(unit_: PEolian_Unit): PEolian_State; cdecl; external libeolian;
function eolian_unit_children_get(unit_: PEolian_Unit): PEina_Iterator; cdecl; external libeolian;
function eolian_unit_file_get(unit_: PEolian_Unit): pchar; cdecl; external libeolian;
function eolian_unit_file_path_get(unit_: PEolian_Unit): pchar; cdecl; external libeolian;
function eolian_unit_version_get(unit_: PEolian_Unit): word; cdecl; external libeolian;
function eolian_unit_object_by_name_get(unit_: PEolian_Unit; name: pchar): PEolian_Object; cdecl; external libeolian;
function eolian_unit_objects_get(unit_: PEolian_Unit): PEina_Iterator; cdecl; external libeolian;
function eolian_unit_class_by_name_get(unit_: PEolian_Unit; class_name: pchar): PEolian_Class; cdecl; external libeolian;
function eolian_unit_classes_get(unit_: PEolian_Unit): PEina_Iterator; cdecl; external libeolian;
function eolian_unit_constant_by_name_get(unit_: PEolian_Unit; name: pchar): PEolian_Constant; cdecl; external libeolian;
function eolian_unit_error_by_name_get(unit_: PEolian_Unit; name: pchar): PEolian_Error; cdecl; external libeolian;
function eolian_unit_constants_get(unit_: PEolian_Unit): PEina_Iterator; cdecl; external libeolian;
function eolian_unit_errors_get(unit_: PEolian_Unit): PEina_Iterator; cdecl; external libeolian;
function eolian_unit_alias_by_name_get(unit_: PEolian_Unit; name: pchar): PEolian_Typedecl; cdecl; external libeolian;
function eolian_unit_struct_by_name_get(unit_: PEolian_Unit; name: pchar): PEolian_Typedecl; cdecl; external libeolian;
function eolian_unit_enum_by_name_get(unit_: PEolian_Unit; name: pchar): PEolian_Typedecl; cdecl; external libeolian;
function eolian_unit_aliases_get(unit_: PEolian_Unit): PEina_Iterator; cdecl; external libeolian;
function eolian_unit_structs_get(unit_: PEolian_Unit): PEina_Iterator; cdecl; external libeolian;
function eolian_unit_enums_get(unit_: PEolian_Unit): PEina_Iterator; cdecl; external libeolian;
function eolian_state_objects_by_file_get(state: PEolian_State; file_name: pchar): PEina_Iterator; cdecl; external libeolian;
function eolian_state_class_by_file_get(state: PEolian_State; file_name: pchar): PEolian_Class; cdecl; external libeolian;
function eolian_state_constants_by_file_get(state: PEolian_State; file_name: pchar): PEina_Iterator; cdecl; external libeolian;
function eolian_state_errors_by_file_get(state: PEolian_State; file_name: pchar): PEina_Iterator; cdecl; external libeolian;
function eolian_state_aliases_by_file_get(state: PEolian_State; file_name: pchar): PEina_Iterator; cdecl; external libeolian;
function eolian_state_structs_by_file_get(state: PEolian_State; file_name: pchar): PEina_Iterator; cdecl; external libeolian;
function eolian_state_enums_by_file_get(state: PEolian_State; file_name: pchar): PEina_Iterator; cdecl; external libeolian;
function eolian_class_type_get(klass: PEolian_Class): TEolian_Class_Type; cdecl; external libeolian;
function eolian_class_documentation_get(klass: PEolian_Class): PEolian_Documentation; cdecl; external libeolian;
function eolian_class_c_prefix_get(klass: PEolian_Class): pchar; cdecl; external libeolian;
function eolian_class_event_c_prefix_get(klass: PEolian_Class): pchar; cdecl; external libeolian;
function eolian_class_data_type_get(klass: PEolian_Class): pchar; cdecl; external libeolian;
function eolian_class_parent_get(klass: PEolian_Class): PEolian_Class; cdecl; external libeolian;
function eolian_class_requires_get(klass: PEolian_Class): PEina_Iterator; cdecl; external libeolian;
function eolian_class_extensions_get(klass: PEolian_Class): PEina_Iterator; cdecl; external libeolian;
function eolian_class_functions_get(klass: PEolian_Class; func_type: TEolian_Function_Type): PEina_Iterator; cdecl; external libeolian;
function eolian_function_type_get(function_id: PEolian_Function): TEolian_Function_Type; cdecl; external libeolian;
function eolian_function_scope_get(function_id: PEolian_Function; ftype: TEolian_Function_Type): TEolian_Object_Scope; cdecl; external libeolian;
function eolian_function_full_c_name_get(function_id: PEolian_Function; ftype: TEolian_Function_Type): PEina_Stringshare; cdecl; external libeolian;
function eolian_class_function_by_name_get(klass: PEolian_Class; func_name: pchar; f_type: TEolian_Function_Type): PEolian_Function; cdecl; external libeolian;
function eolian_function_implement_get(function_id: PEolian_Function): PEolian_Implement; cdecl; external libeolian;
function eolian_function_is_static(function_id: PEolian_Function): TEina_Bool; cdecl; external libeolian;
function eolian_function_is_constructor(function_id: PEolian_Function; klass: PEolian_Class): TEina_Bool; cdecl; external libeolian;
function eolian_function_parameters_get(function_id: PEolian_Function): PEina_Iterator; cdecl; external libeolian;
function eolian_property_keys_get(foo_id: PEolian_Function; ftype: TEolian_Function_Type): PEina_Iterator; cdecl; external libeolian;
function eolian_property_values_get(foo_id: PEolian_Function; ftype: TEolian_Function_Type): PEina_Iterator; cdecl; external libeolian;
function eolian_parameter_direction_get(param: PEolian_Function_Parameter): TEolian_Parameter_Direction; cdecl; external libeolian;
function eolian_parameter_type_get(param: PEolian_Function_Parameter): PEolian_Type; cdecl; external libeolian;
function eolian_parameter_default_value_get(param: PEolian_Function_Parameter): PEolian_Expression; cdecl; external libeolian;
function eolian_parameter_documentation_get(param: PEolian_Function_Parameter): PEolian_Documentation; cdecl; external libeolian;
function eolian_parameter_is_optional(param_desc: PEolian_Function_Parameter): TEina_Bool; cdecl; external libeolian;
function eolian_parameter_is_by_ref(param_desc: PEolian_Function_Parameter): TEina_Bool; cdecl; external libeolian;
function eolian_parameter_is_move(param_desc: PEolian_Function_Parameter): TEina_Bool; cdecl; external libeolian;
function eolian_parameter_c_type_get(param_desc: PEolian_Function_Parameter; as_return: TEina_Bool): PEina_Stringshare; cdecl; external libeolian;
function eolian_function_return_type_get(function_id: PEolian_Function; ftype: TEolian_Function_Type): PEolian_Type; cdecl; external libeolian;
function eolian_function_return_default_value_get(foo_id: PEolian_Function; ftype: TEolian_Function_Type): PEolian_Expression; cdecl; external libeolian;
function eolian_function_return_documentation_get(foo_id: PEolian_Function; ftype: TEolian_Function_Type): PEolian_Documentation; cdecl; external libeolian;
function eolian_function_return_allow_unused(foo_id: PEolian_Function; ftype: TEolian_Function_Type): TEina_Bool; cdecl; external libeolian;
function eolian_function_return_is_by_ref(foo_id: PEolian_Function; ftype: TEolian_Function_Type): TEina_Bool; cdecl; external libeolian;
function eolian_function_return_is_move(foo_id: PEolian_Function; ftype: TEolian_Function_Type): TEina_Bool; cdecl; external libeolian;
function eolian_function_return_c_type_get(foo_id: PEolian_Function; ftype: TEolian_Function_Type): PEina_Stringshare; cdecl; external libeolian;
function eolian_function_object_is_const(function_id: PEolian_Function): TEina_Bool; cdecl; external libeolian;
function eolian_function_class_get(function_id: PEolian_Function): PEolian_Class; cdecl; external libeolian;
function eolian_implement_class_get(impl: PEolian_Implement): PEolian_Class; cdecl; external libeolian;
function eolian_implement_implementing_class_get(impl: PEolian_Implement): PEolian_Class; cdecl; external libeolian;
function eolian_implement_function_get(impl: PEolian_Implement; func_type: PEolian_Function_Type): PEolian_Function; cdecl; external libeolian;
function eolian_implement_documentation_get(impl: PEolian_Implement; f_type: TEolian_Function_Type): PEolian_Documentation; cdecl; external libeolian;
function eolian_implement_is_auto(impl: PEolian_Implement; f_type: TEolian_Function_Type): TEina_Bool; cdecl; external libeolian;
function eolian_implement_is_empty(impl: PEolian_Implement; f_type: TEolian_Function_Type): TEina_Bool; cdecl; external libeolian;
function eolian_implement_is_pure_virtual(impl: PEolian_Implement; f_type: TEolian_Function_Type): TEina_Bool; cdecl; external libeolian;
function eolian_implement_is_prop_get(impl: PEolian_Implement): TEina_Bool; cdecl; external libeolian;
function eolian_implement_is_prop_set(impl: PEolian_Implement): TEina_Bool; cdecl; external libeolian;
function eolian_class_implements_get(klass: PEolian_Class): PEina_Iterator; cdecl; external libeolian;
function eolian_constructor_class_get(ctor: PEolian_Constructor): PEolian_Class; cdecl; external libeolian;
function eolian_constructor_function_get(ctor: PEolian_Constructor): PEolian_Function; cdecl; external libeolian;
function eolian_constructor_is_optional(ctor: PEolian_Constructor): TEina_Bool; cdecl; external libeolian;
function eolian_class_constructors_get(klass: PEolian_Class): PEina_Iterator; cdecl; external libeolian;
function eolian_class_events_get(klass: PEolian_Class): PEina_Iterator; cdecl; external libeolian;
function eolian_event_type_get(event: PEolian_Event): PEolian_Type; cdecl; external libeolian;
function eolian_event_class_get(event: PEolian_Event): PEolian_Class; cdecl; external libeolian;
function eolian_event_documentation_get(event: PEolian_Event): PEolian_Documentation; cdecl; external libeolian;
function eolian_event_scope_get(event: PEolian_Event): TEolian_Object_Scope; cdecl; external libeolian;
function eolian_event_is_hot(event: PEolian_Event): TEina_Bool; cdecl; external libeolian;
function eolian_event_is_restart(event: PEolian_Event): TEina_Bool; cdecl; external libeolian;
function eolian_class_parts_get(klass: PEolian_Class): PEina_Iterator; cdecl; external libeolian;
function eolian_event_c_macro_get(event: PEolian_Event): PEina_Stringshare; cdecl; external libeolian;
function eolian_part_class_get(part: PEolian_Part): PEolian_Class; cdecl; external libeolian;
function eolian_part_documentation_get(part: PEolian_Part): PEolian_Documentation; cdecl; external libeolian;
function eolian_class_event_by_name_get(klass: PEolian_Class; event_name: pchar): PEolian_Event; cdecl; external libeolian;
function eolian_class_ctor_enable_get(klass: PEolian_Class): TEina_Bool; cdecl; external libeolian;
function eolian_class_dtor_enable_get(klass: PEolian_Class): TEina_Bool; cdecl; external libeolian;
function eolian_class_c_get_function_name_get(klass: PEolian_Class): PEina_Stringshare; cdecl; external libeolian;
function eolian_class_c_macro_get(klass: PEolian_Class): PEina_Stringshare; cdecl; external libeolian;
function eolian_class_c_data_type_get(klass: PEolian_Class): PEina_Stringshare; cdecl; external libeolian;
function eolian_typedecl_type_get(tp: PEolian_Typedecl): TEolian_Typedecl_Type; cdecl; external libeolian;
function eolian_typedecl_struct_fields_get(tp: PEolian_Typedecl): PEina_Iterator; cdecl; external libeolian;
function eolian_typedecl_struct_field_get(tp: PEolian_Typedecl; field: pchar): PEolian_Struct_Type_Field; cdecl; external libeolian;
function eolian_typedecl_struct_field_documentation_get(fl: PEolian_Struct_Type_Field): PEolian_Documentation; cdecl; external libeolian;
function eolian_typedecl_struct_field_type_get(fl: PEolian_Struct_Type_Field): PEolian_Type; cdecl; external libeolian;
function eolian_typedecl_struct_field_is_by_ref(fl: PEolian_Struct_Type_Field): TEina_Bool; cdecl; external libeolian;
function eolian_typedecl_struct_field_is_move(fl: PEolian_Struct_Type_Field): TEina_Bool; cdecl; external libeolian;
function eolian_typedecl_struct_field_c_type_get(fl: PEolian_Struct_Type_Field): PEina_Stringshare; cdecl; external libeolian;
function eolian_typedecl_enum_fields_get(tp: PEolian_Typedecl): PEina_Iterator; cdecl; external libeolian;
function eolian_typedecl_enum_field_get(tp: PEolian_Typedecl; field: pchar): PEolian_Enum_Type_Field; cdecl; external libeolian;
function eolian_typedecl_enum_field_c_constant_get(fl: PEolian_Enum_Type_Field): PEina_Stringshare; cdecl; external libeolian;
function eolian_typedecl_enum_field_documentation_get(fl: PEolian_Enum_Type_Field): PEolian_Documentation; cdecl; external libeolian;
function eolian_typedecl_enum_field_value_get(fl: PEolian_Enum_Type_Field; force: TEina_Bool): PEolian_Expression; cdecl; external libeolian;
function eolian_typedecl_documentation_get(tp: PEolian_Typedecl): PEolian_Documentation; cdecl; external libeolian;
function eolian_typedecl_base_type_get(tp: PEolian_Typedecl): PEolian_Type; cdecl; external libeolian;
function eolian_typedecl_aliased_base_get(tp: PEolian_Typedecl): PEolian_Type; cdecl; external libeolian;
function eolian_typedecl_is_extern(tp: PEolian_Typedecl): TEina_Bool; cdecl; external libeolian;
function eolian_typedecl_c_type_get(tp: PEolian_Typedecl): PEina_Stringshare; cdecl; external libeolian;
function eolian_typedecl_free_func_get(tp: PEolian_Typedecl): pchar; cdecl; external libeolian;
function eolian_typedecl_function_pointer_get(tp: PEolian_Typedecl): PEolian_Function; cdecl; external libeolian;
function eolian_type_type_get(tp: PEolian_Type): TEolian_Type_Type; cdecl; external libeolian;
function eolian_type_builtin_type_get(tp: PEolian_Type): TEolian_Type_Builtin_Type; cdecl; external libeolian;
function eolian_type_base_type_get(tp: PEolian_Type): PEolian_Type; cdecl; external libeolian;
function eolian_type_next_type_get(tp: PEolian_Type): PEolian_Type; cdecl; external libeolian;
function eolian_type_typedecl_get(tp: PEolian_Type): PEolian_Typedecl; cdecl; external libeolian;
function eolian_type_aliased_base_get(tp: PEolian_Type): PEolian_Type; cdecl; external libeolian;
function eolian_type_class_get(tp: PEolian_Type): PEolian_Class; cdecl; external libeolian;
function eolian_type_error_get(tp: PEolian_Type): PEolian_Error; cdecl; external libeolian;
function eolian_type_is_move(tp: PEolian_Type): TEina_Bool; cdecl; external libeolian;
function eolian_type_is_const(tp: PEolian_Type): TEina_Bool; cdecl; external libeolian;
function eolian_type_c_type_get(tp: PEolian_Type): PEina_Stringshare; cdecl; external libeolian;
function eolian_expression_eval(expr: PEolian_Expression; m: TEolian_Expression_Mask): TEolian_Value; cdecl; external libeolian;
function eolian_expression_eval_fill(expr: PEolian_Expression; m: TEolian_Expression_Mask; val: PEolian_Value): TEina_Bool; cdecl; external libeolian;
function eolian_expression_value_to_literal(v: PEolian_Value): PEina_Stringshare; cdecl; external libeolian;
function eolian_expression_serialize(expr: PEolian_Expression): PEina_Stringshare; cdecl; external libeolian;
function eolian_expression_type_get(expr: PEolian_Expression): TEolian_Expression_Type; cdecl; external libeolian;
function eolian_expression_binary_operator_get(expr: PEolian_Expression): TEolian_Binary_Operator; cdecl; external libeolian;
function eolian_expression_binary_lhs_get(expr: PEolian_Expression): PEolian_Expression; cdecl; external libeolian;
function eolian_expression_binary_rhs_get(expr: PEolian_Expression): PEolian_Expression; cdecl; external libeolian;
function eolian_expression_unary_operator_get(expr: PEolian_Expression): TEolian_Unary_Operator; cdecl; external libeolian;
function eolian_expression_unary_expression_get(expr: PEolian_Expression): PEolian_Expression; cdecl; external libeolian;
function eolian_expression_value_get(expr: PEolian_Expression): TEolian_Value; cdecl; external libeolian;
function eolian_expression_value_get_fill(expr: PEolian_Expression; val: PEolian_Value): TEina_Bool; cdecl; external libeolian;
function eolian_constant_documentation_get(var_: PEolian_Constant): PEolian_Documentation; cdecl; external libeolian;
function eolian_constant_type_get(var_: PEolian_Constant): PEolian_Type; cdecl; external libeolian;
function eolian_constant_value_get(var_: PEolian_Constant): PEolian_Expression; cdecl; external libeolian;
function eolian_constant_is_extern(var_: PEolian_Constant): TEina_Bool; cdecl; external libeolian;
function eolian_error_message_get(err: PEolian_Error): pchar; cdecl; external libeolian;
function eolian_error_documentation_get(err: PEolian_Error): PEolian_Documentation; cdecl; external libeolian;
function eolian_error_is_extern(err: PEolian_Error): TEina_Bool; cdecl; external libeolian;
function eolian_documentation_summary_get(doc: PEolian_Documentation): pchar; cdecl; external libeolian;
function eolian_documentation_description_get(doc: PEolian_Documentation): pchar; cdecl; external libeolian;
function eolian_documentation_since_get(doc: PEolian_Documentation): pchar; cdecl; external libeolian;
function eolian_documentation_string_split(doc: pchar): PEina_List; cdecl; external libeolian;
function eolian_documentation_tokenize(doc: pchar; ret: PEolian_Doc_Token): pchar; cdecl; external libeolian;
procedure eolian_doc_token_init(tok: PEolian_Doc_Token); cdecl; external libeolian;
function eolian_doc_token_type_get(tok: PEolian_Doc_Token): TEolian_Doc_Token_Type; cdecl; external libeolian;
function eolian_doc_token_text_get(tok: PEolian_Doc_Token): pchar; cdecl; external libeolian;
function eolian_doc_token_ref_resolve(tok: PEolian_Doc_Token; state: PEolian_State; data: PPEolian_Object; data2: PPEolian_Object): TEolian_Object_Type; cdecl; external libeolian;

{$ifdef EFL_BETA_API_SUPPORT}
function eolian_typedecl_enum_legacy_prefix_get(tp: PEolian_Typedecl): pchar; cdecl; external libeolian;
function eolian_type_is_ptr(tp: PEolian_Type): TEina_Bool; cdecl; external libeolian;
{$endif}

// === Konventiert am: 12-6-25 19:16:37 ===

// --- Static Inline Functions from Eolian.h ---

function eolian_state_object_by_name_get(state: PEolian_State; name: pchar): PEolian_Object;
function eolian_state_objects_get(state: PEolian_State): PEina_Iterator;
function eolian_state_class_by_name_get(state: PEolian_State; class_name: pchar): PEolian_Class;
function eolian_state_classes_get(state: PEolian_State): PEina_Iterator;
function eolian_state_constant_by_name_get(state: PEolian_State; name: pchar): PEolian_Constant;
function eolian_state_error_by_name_get(state: PEolian_State; name: pchar): PEolian_Error;
function eolian_state_constants_get(state: PEolian_State): PEina_Iterator;
function eolian_state_errors_get(state: PEolian_State): PEina_Iterator;
function eolian_state_alias_by_name_get(state: PEolian_State; name: pchar): PEolian_Typedecl;
function eolian_state_struct_by_name_get(state: PEolian_State; name: pchar): PEolian_Typedecl;
function eolian_state_enum_by_name_get(state: PEolian_State; name: pchar): PEolian_Typedecl;
function eolian_state_aliases_get(state: PEolian_State): PEina_Iterator;
function eolian_state_structs_get(state: PEolian_State): PEina_Iterator;
function eolian_state_enums_get(state: PEolian_State): PEina_Iterator;

function eolian_class_name_get(klass: PEolian_Class): pchar;
function eolian_class_c_name_get(klass: PEolian_Class): pchar;
function eolian_class_short_name_get(klass: PEolian_Class): pchar;
function eolian_class_namespaces_get(klass: PEolian_Class): PEina_Iterator;
function eolian_class_is_beta(klass: PEolian_Class): TEina_Bool;

function eolian_function_name_get(fid: PEolian_Function): pchar;
function eolian_function_is_beta(function_id: PEolian_Function): TEina_Bool;

function eolian_parameter_name_get(param: PEolian_Function_Parameter): pchar;

function eolian_implement_name_get(impl: PEolian_Implement): pchar;

function eolian_constructor_name_get(ctor: PEolian_Constructor): pchar;

function eolian_event_name_get(event: PEolian_Event): pchar;
function eolian_event_is_beta(event: PEolian_Event): TEina_Bool;

function eolian_part_name_get(part: PEolian_Part): pchar;
function eolian_part_is_beta(part: PEolian_Part): TEina_Bool;

function eolian_typedecl_struct_field_name_get(field: PEolian_Struct_Type_Field): pchar;
function eolian_typedecl_enum_field_name_get(field: PEolian_Enum_Type_Field): pchar;
function eolian_typedecl_is_beta(tp: PEolian_Typedecl): TEina_Bool;
function eolian_typedecl_name_get(tp: PEolian_Typedecl): pchar;
function eolian_typedecl_c_name_get(tp: PEolian_Typedecl): pchar;
function eolian_typedecl_short_name_get(tp: PEolian_Typedecl): pchar;
function eolian_typedecl_namespaces_get(tp: PEolian_Typedecl): PEina_Iterator;

function eolian_type_name_get(tp: PEolian_Type): pchar;
function eolian_type_c_name_get(tp: PEolian_Type): pchar;
function eolian_type_short_name_get(tp: PEolian_Type): pchar;
function eolian_type_namespaces_get(tp: PEolian_Type): PEina_Iterator;

function eolian_constant_name_get(tp: PEolian_Constant): pchar;
function eolian_constant_c_name_get(tp: PEolian_Constant): pchar;
function eolian_constant_short_name_get(tp: PEolian_Constant): pchar;
function eolian_constant_namespaces_get(tp: PEolian_Constant): PEina_Iterator;
function eolian_constant_is_beta(var_const: PEolian_Constant): TEina_Bool;

function eolian_error_name_get(err: PEolian_Error): pchar;
function eolian_error_c_name_get(err: PEolian_Error): pchar;
function eolian_error_short_name_get(err: PEolian_Error): pchar;
function eolian_error_namespaces_get(err: PEolian_Error): PEina_Iterator;
function eolian_error_is_beta(err: PEolian_Error): TEina_Bool;

{$ENDIF read_interface}


{$IFDEF read_implementation}

type
  EOLIAN_UNIT = PEolian_Unit;
  EOLIAN_OBJECT = PEolian_Object;

function eolian_state_object_by_name_get(state: PEolian_State; name: pchar): PEolian_Object;
begin
  Result := eolian_unit_object_by_name_get(EOLIAN_UNIT(state), name);
end;

function eolian_state_objects_get(state: PEolian_State): PEina_Iterator;
begin
  Result := eolian_unit_objects_get(EOLIAN_UNIT(state));
end;

function eolian_state_class_by_name_get(state: PEolian_State; class_name: pchar): PEolian_Class;
begin
  Result := eolian_unit_class_by_name_get(EOLIAN_UNIT(state), class_name);
end;

function eolian_state_classes_get(state: PEolian_State): PEina_Iterator;
begin
  Result := eolian_unit_classes_get(EOLIAN_UNIT(state));
end;

function eolian_state_constant_by_name_get(state: PEolian_State; name: pchar): PEolian_Constant;
begin
  Result := eolian_unit_constant_by_name_get(EOLIAN_UNIT(state), name);
end;

function eolian_state_error_by_name_get(state: PEolian_State; name: pchar): PEolian_Error;
begin
  Result := eolian_unit_error_by_name_get(EOLIAN_UNIT(state), name);
end;

function eolian_state_constants_get(state: PEolian_State): PEina_Iterator;
begin
  Result := eolian_unit_constants_get(EOLIAN_UNIT(state));
end;

function eolian_state_errors_get(state: PEolian_State): PEina_Iterator;
begin
  Result := eolian_unit_errors_get(EOLIAN_UNIT(state));
end;

function eolian_state_alias_by_name_get(state: PEolian_State; name: pchar): PEolian_Typedecl;
begin
  Result := eolian_unit_alias_by_name_get(EOLIAN_UNIT(state), name);
end;

function eolian_state_struct_by_name_get(state: PEolian_State; name: pchar): PEolian_Typedecl;
begin
  Result := eolian_unit_struct_by_name_get(EOLIAN_UNIT(state), name);
end;

function eolian_state_enum_by_name_get(state: PEolian_State; name: pchar): PEolian_Typedecl;
begin
  Result := eolian_unit_enum_by_name_get(EOLIAN_UNIT(state), name);
end;

function eolian_state_aliases_get(state: PEolian_State): PEina_Iterator;
begin
  Result := eolian_unit_aliases_get(EOLIAN_UNIT(state));
end;

function eolian_state_structs_get(state: PEolian_State): PEina_Iterator;
begin
  Result := eolian_unit_structs_get(EOLIAN_UNIT(state));
end;

function eolian_state_enums_get(state: PEolian_State): PEina_Iterator;
begin
  Result := eolian_unit_enums_get(EOLIAN_UNIT(state));
end;

function eolian_class_name_get(klass: PEolian_Class): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(klass));
end;

function eolian_class_c_name_get(klass: PEolian_Class): pchar;
begin
  Result := eolian_object_c_name_get(EOLIAN_OBJECT(klass));
end;

function eolian_class_short_name_get(klass: PEolian_Class): pchar;
begin
  Result := eolian_object_short_name_get(EOLIAN_OBJECT(klass));
end;

function eolian_class_namespaces_get(klass: PEolian_Class): PEina_Iterator;
begin
  Result := eolian_object_namespaces_get(EOLIAN_OBJECT(klass));
end;

function eolian_function_name_get(fid: PEolian_Function): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(fid));
end;

function eolian_function_is_beta(function_id: PEolian_Function): TEina_Bool;
begin
  Result := eolian_object_is_beta(EOLIAN_OBJECT(function_id));
end;

function eolian_parameter_name_get(param: PEolian_Function_Parameter): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(param));
end;

function eolian_implement_name_get(impl: PEolian_Implement): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(impl));
end;

function eolian_constructor_name_get(ctor: PEolian_Constructor): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(ctor));
end;

function eolian_event_name_get(event: PEolian_Event): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(event));
end;

function eolian_event_is_beta(event: PEolian_Event): TEina_Bool;
begin
  Result := eolian_object_is_beta(EOLIAN_OBJECT(event));
end;

function eolian_part_name_get(part: PEolian_Part): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(part));
end;

function eolian_part_is_beta(part: PEolian_Part): TEina_Bool;
begin
  Result := eolian_object_is_beta(EOLIAN_OBJECT(part));
end;

function eolian_class_is_beta(klass: PEolian_Class): TEina_Bool;
begin
  Result := eolian_object_is_beta(EOLIAN_OBJECT(klass));
end;

function eolian_typedecl_struct_field_name_get(field: PEolian_Struct_Type_Field): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(field));
end;

function eolian_typedecl_enum_field_name_get(field: PEolian_Enum_Type_Field): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(field));
end;

function eolian_typedecl_is_beta(tp: PEolian_Typedecl): TEina_Bool;
begin
  Result := eolian_object_is_beta(EOLIAN_OBJECT(tp));
end;

function eolian_typedecl_name_get(tp: PEolian_Typedecl): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(tp));
end;

function eolian_typedecl_c_name_get(tp: PEolian_Typedecl): pchar;
begin
  Result := eolian_object_c_name_get(EOLIAN_OBJECT(tp));
end;

function eolian_typedecl_short_name_get(tp: PEolian_Typedecl): pchar;
begin
  Result := eolian_object_short_name_get(EOLIAN_OBJECT(tp));
end;

function eolian_typedecl_namespaces_get(tp: PEolian_Typedecl): PEina_Iterator;
begin
  Result := eolian_object_namespaces_get(EOLIAN_OBJECT(tp));
end;

function eolian_type_name_get(tp: PEolian_Type): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(tp));
end;

function eolian_type_c_name_get(tp: PEolian_Type): pchar;
begin
  Result := eolian_object_c_name_get(EOLIAN_OBJECT(tp));
end;

function eolian_type_short_name_get(tp: PEolian_Type): pchar;
begin
  Result := eolian_object_short_name_get(EOLIAN_OBJECT(tp));
end;

function eolian_type_namespaces_get(tp: PEolian_Type): PEina_Iterator;
begin
  Result := eolian_object_namespaces_get(EOLIAN_OBJECT(tp));
end;

function eolian_constant_name_get(tp: PEolian_Constant): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(tp));
end;

function eolian_constant_c_name_get(tp: PEolian_Constant): pchar;
begin
  Result := eolian_object_c_name_get(EOLIAN_OBJECT(tp));
end;

function eolian_constant_short_name_get(tp: PEolian_Constant): pchar;
begin
  Result := eolian_object_short_name_get(EOLIAN_OBJECT(tp));
end;

function eolian_constant_namespaces_get(tp: PEolian_Constant): PEina_Iterator;
begin
  Result := eolian_object_namespaces_get(EOLIAN_OBJECT(tp));
end;

function eolian_constant_is_beta(var_const: PEolian_Constant): TEina_Bool;
begin
  Result := eolian_object_is_beta(EOLIAN_OBJECT(var_const));
end;

function eolian_error_name_get(err: PEolian_Error): pchar;
begin
  Result := eolian_object_name_get(EOLIAN_OBJECT(err));
end;

function eolian_error_c_name_get(err: PEolian_Error): pchar;
begin
  Result := eolian_object_c_name_get(EOLIAN_OBJECT(err));
end;

function eolian_error_short_name_get(err: PEolian_Error): pchar;
begin
  Result := eolian_object_short_name_get(EOLIAN_OBJECT(err));
end;

function eolian_error_namespaces_get(err: PEolian_Error): PEina_Iterator;
begin
  Result := eolian_object_namespaces_get(EOLIAN_OBJECT(err));
end;

function eolian_error_is_beta(err: PEolian_Error): TEina_Bool;
begin
  Result := eolian_object_is_beta(EOLIAN_OBJECT(err));
end;

{$ENDIF read_implementation}
