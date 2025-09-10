{$IFDEF read_interface}


type
  PTCOD_value_type_t = ^TTCOD_value_type_t;
  TTCOD_value_type_t = longint;

const
  TCOD_TYPE_NONE = 0;
  TCOD_TYPE_BOOL = 1;
  TCOD_TYPE_CHAR = 2;
  TCOD_TYPE_INT = 3;
  TCOD_TYPE_FLOAT = 4;
  TCOD_TYPE_STRING = 5;
  TCOD_TYPE_COLOR = 6;
  TCOD_TYPE_DICE = 7;
  TCOD_TYPE_VALUELIST00 = 8;
  TCOD_TYPE_VALUELIST01 = 9;
  TCOD_TYPE_VALUELIST02 = 10;
  TCOD_TYPE_VALUELIST03 = 11;
  TCOD_TYPE_VALUELIST04 = 12;
  TCOD_TYPE_VALUELIST05 = 13;
  TCOD_TYPE_VALUELIST06 = 14;
  TCOD_TYPE_VALUELIST07 = 15;
  TCOD_TYPE_VALUELIST08 = 16;
  TCOD_TYPE_VALUELIST09 = 17;
  TCOD_TYPE_VALUELIST10 = 18;
  TCOD_TYPE_VALUELIST11 = 19;
  TCOD_TYPE_VALUELIST12 = 20;
  TCOD_TYPE_VALUELIST13 = 21;
  TCOD_TYPE_VALUELIST14 = 22;
  TCOD_TYPE_VALUELIST15 = 23;
  TCOD_TYPE_CUSTOM00 = 24;
  TCOD_TYPE_CUSTOM01 = 25;
  TCOD_TYPE_CUSTOM02 = 26;
  TCOD_TYPE_CUSTOM03 = 27;
  TCOD_TYPE_CUSTOM04 = 28;
  TCOD_TYPE_CUSTOM05 = 29;
  TCOD_TYPE_CUSTOM06 = 30;
  TCOD_TYPE_CUSTOM07 = 31;
  TCOD_TYPE_CUSTOM08 = 32;
  TCOD_TYPE_CUSTOM09 = 33;
  TCOD_TYPE_CUSTOM10 = 34;
  TCOD_TYPE_CUSTOM11 = 35;
  TCOD_TYPE_CUSTOM12 = 36;
  TCOD_TYPE_CUSTOM13 = 37;
  TCOD_TYPE_CUSTOM14 = 38;
  TCOD_TYPE_CUSTOM15 = 39;
  TCOD_TYPE_LIST = 1024;

type
  PTCOD_ParserStruct = ^TTCOD_ParserStruct;
  PTCOD_Parser = ^TTCOD_Parser;

  TTCOD_value_t = record
    case longint of
      0: (b: Tbool);
      1: (c: char);
      2: (i: Tint32_t);
      3: (f: single);
      4: (s: pchar);
      5: (col: TTCOD_color_t);
      6: (dice: TTCOD_dice_t);
      7: (list: TTCOD_list_t);
      8: (custom: pointer);
  end;
  PTCOD_value_t = ^TTCOD_value_t;

  PTCOD_parser_struct_t = ^TTCOD_parser_struct_t;
  TTCOD_parser_struct_t = PTCOD_ParserStruct;

  TTCOD_parser_listener_t = record
    new_struct: function(str: TTCOD_parser_struct_t; name: pchar): Tbool; cdecl;
    new_flag: function(name: pchar): Tbool; cdecl;
    new_property: function(propname: pchar; _type: TTCOD_value_type_t; value: TTCOD_value_t): Tbool; cdecl;
    end_struct: function(str: TTCOD_parser_struct_t; name: pchar): Tbool; cdecl;
    error: procedure(msg: pchar); cdecl;
  end;
  PTCOD_parser_listener_t = ^TTCOD_parser_listener_t;

  TTCOD_parser_custom_t = function(lex: PTCOD_lex_t; listener: PTCOD_parser_listener_t; str: TTCOD_parser_struct_t; propname: pchar): TTCOD_value_t; cdecl;

  PTCOD_parser_t = ^TTCOD_parser_t;
  TTCOD_parser_t = PTCOD_Parser;

  TTCOD_ParserStruct = record
    name: pchar;
    flags: TTCOD_list_t;
    props: TTCOD_list_t;
    lists: TTCOD_list_t;
    structs: TTCOD_list_t;
  end;
  PTCOD_struct_int_t = ^TTCOD_ParserStruct;

  TTCOD_Parser = record
    structs: TTCOD_list_t;
    customs: array[0..15] of TTCOD_parser_custom_t;
    fatal: Tbool;
    props: TTCOD_list_t;
  end;
  PTCOD_parser_int_t = ^TTCOD_parser;


function TCOD_struct_get_name(def: TTCOD_parser_struct_t): pchar; cdecl; external libtcod;
procedure TCOD_struct_add_property(def: TTCOD_parser_struct_t; name: pchar; _type: TTCOD_value_type_t; mandatory: Tbool); cdecl; external libtcod;
procedure TCOD_struct_add_list_property(def: TTCOD_parser_struct_t; name: pchar; _type: TTCOD_value_type_t; mandatory: Tbool); cdecl; external libtcod;
procedure TCOD_struct_add_value_list(def: TTCOD_parser_struct_t; name: pchar; value_list: PPchar; mandatory: Tbool); cdecl; external libtcod;
procedure TCOD_struct_add_value_list_sized(def: TTCOD_parser_struct_t; name: pchar; value_list: PPchar; size: longint; mandatory: Tbool); cdecl; external libtcod;
procedure TCOD_struct_add_flag(def: TTCOD_parser_struct_t; propname: pchar); cdecl; external libtcod;
procedure TCOD_struct_add_structure(def: TTCOD_parser_struct_t; sub_structure: TTCOD_parser_struct_t); cdecl; external libtcod;
function TCOD_struct_is_mandatory(def: TTCOD_parser_struct_t; propname: pchar): Tbool; cdecl; external libtcod;
function TCOD_struct_get_type(def: TTCOD_parser_struct_t; propname: pchar): TTCOD_value_type_t; cdecl; external libtcod;

function TCOD_parser_new: TTCOD_parser_t; cdecl; external libtcod;
function TCOD_parser_new_struct(parser: TTCOD_parser_t; name: pchar): TTCOD_parser_struct_t; cdecl; external libtcod;
function TCOD_parser_new_custom_type(parser: TTCOD_parser_t; custom_type_parser: TTCOD_parser_custom_t): TTCOD_value_type_t; cdecl; external libtcod;
procedure TCOD_parser_run(parser: TTCOD_parser_t; filename: pchar; listener: PTCOD_parser_listener_t); cdecl; external libtcod;
procedure TCOD_parser_delete(parser: TTCOD_parser_t); cdecl; external libtcod;
procedure TCOD_parser_error(msg: pchar; args: array of const); cdecl; external libtcod;
procedure TCOD_parser_error(msg: pchar); cdecl; external libtcod;
function TCOD_parser_has_property(parser: TTCOD_parser_t; name: pchar): Tbool; cdecl; external libtcod;
function TCOD_parser_get_bool_property(parser: TTCOD_parser_t; name: pchar): Tbool; cdecl; external libtcod;
function TCOD_parser_get_char_property(parser: TTCOD_parser_t; name: pchar): longint; cdecl; external libtcod;
function TCOD_parser_get_int_property(parser: TTCOD_parser_t; name: pchar): longint; cdecl; external libtcod;
function TCOD_parser_get_float_property(parser: TTCOD_parser_t; name: pchar): single; cdecl; external libtcod;
function TCOD_parser_get_string_property(parser: TTCOD_parser_t; name: pchar): pchar; cdecl; external libtcod;
function TCOD_parser_get_color_property(parser: TTCOD_parser_t; name: pchar): TTCOD_color_t; cdecl; external libtcod;
function TCOD_parser_get_dice_property(parser: TTCOD_parser_t; name: pchar): TTCOD_dice_t; cdecl; external libtcod;
procedure TCOD_parser_get_dice_property_py(parser: TTCOD_parser_t; name: pchar; dice: PTCOD_dice_t); cdecl; external libtcod;
function TCOD_parser_get_custom_property(parser: TTCOD_parser_t; name: pchar): pointer; cdecl; external libtcod;
function TCOD_parser_get_list_property(parser: TTCOD_parser_t; name: pchar; _type: TTCOD_value_type_t): TTCOD_list_t; cdecl; external libtcod;

function TCOD_parse_bool_value: TTCOD_value_t; cdecl; external libtcod;
function TCOD_parse_char_value: TTCOD_value_t; cdecl; external libtcod;
function TCOD_parse_integer_value: TTCOD_value_t; cdecl; external libtcod;
function TCOD_parse_float_value: TTCOD_value_t; cdecl; external libtcod;
function TCOD_parse_string_value: TTCOD_value_t; cdecl; external libtcod;
function TCOD_parse_color_value: TTCOD_value_t; cdecl; external libtcod;
function TCOD_parse_dice_value: TTCOD_value_t; cdecl; external libtcod;
function TCOD_parse_value_list_value(def: PTCOD_struct_int_t; listnum: longint): TTCOD_value_t; cdecl; external libtcod;
function TCOD_parse_property_value(parser: PTCOD_parser_int_t; def: TTCOD_parser_struct_t; propname: pchar; list: Tbool): TTCOD_value_t; cdecl; external libtcod;

// === Konventiert am: 10-9-25 15:53:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
