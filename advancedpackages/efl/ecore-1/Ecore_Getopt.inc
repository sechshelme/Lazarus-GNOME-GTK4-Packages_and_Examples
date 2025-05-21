{$IFDEF read_interface}


type
  PEcore_Getopt_Action = ^TEcore_Getopt_Action;
  TEcore_Getopt_Action = longint;

const
  ECORE_GETOPT_ACTION_STORE = 0;
  ECORE_GETOPT_ACTION_STORE_CONST = 1;
  ECORE_GETOPT_ACTION_STORE_TRUE = 2;
  ECORE_GETOPT_ACTION_STORE_FALSE = 3;
  ECORE_GETOPT_ACTION_CHOICE = 4;
  ECORE_GETOPT_ACTION_APPEND = 5;
  ECORE_GETOPT_ACTION_COUNT = 6;
  ECORE_GETOPT_ACTION_CALLBACK = 7;
  ECORE_GETOPT_ACTION_HELP = 8;
  ECORE_GETOPT_ACTION_VERSION = 9;
  ECORE_GETOPT_ACTION_COPYRIGHT = 10;
  ECORE_GETOPT_ACTION_LICENSE = 11;
  ECORE_GETOPT_ACTION_BREAK = 12;
  ECORE_GETOPT_ACTION_CATEGORY = 13;

type
  PEcore_Getopt_Type = ^TEcore_Getopt_Type;
  TEcore_Getopt_Type = longint;

const
  ECORE_GETOPT_TYPE_STR = 0;
  ECORE_GETOPT_TYPE_BOOL = 1;
  ECORE_GETOPT_TYPE_SHORT = 2;
  ECORE_GETOPT_TYPE_INT = 3;
  ECORE_GETOPT_TYPE_LONG = 4;
  ECORE_GETOPT_TYPE_USHORT = 5;
  ECORE_GETOPT_TYPE_UINT = 6;
  ECORE_GETOPT_TYPE_ULONG = 7;
  ECORE_GETOPT_TYPE_DOUBLE = 8;

type
  PEcore_Getopt_Desc_Arg_Requirement = ^TEcore_Getopt_Desc_Arg_Requirement;
  TEcore_Getopt_Desc_Arg_Requirement = longint;

const
  ECORE_GETOPT_DESC_ARG_REQUIREMENT_NO = 0;
  ECORE_GETOPT_DESC_ARG_REQUIREMENT_YES = 1;
  ECORE_GETOPT_DESC_ARG_REQUIREMENT_OPTIONAL = 3;

const
  _ECORE_GETOPT_PREDEF = 1;
  _ECORE_GETOPT_DESC_PREDEF = 1;
  _ECORE_GETOPT_VALUE_PREDEF = 1;

type
  TEcore_Getopt_Value = record
    case longint of
      0: (strp: ^pchar);
      1: (boolp: pbyte);
      2: (shortp: Psmallint);
      3: (intp: Plongint);
      4: (longp: Plongint);
      5: (ushortp: Pword);
      6: (uintp: Pdword);
      7: (ulongp: Pdword);
      8: (doublep: Pdouble);
      9: (listp: ^PEina_List);
      10: (ptrp: ^pointer);
  end;
  PEcore_Getopt_Value = ^TEcore_Getopt_Value;

  TEcore_Getopt_Desc_Store = record
    _type: TEcore_Getopt_Type;
    arg_req: TEcore_Getopt_Desc_Arg_Requirement;
    def: record
      case longint of
        0: (strv: pchar);
        1: (boolv: TEina_Bool);
        2: (shortv: smallint);
        3: (intv: longint);
        4: (longv: longint);
        5: (ushortv: word);
        6: (uintv: dword);
        7: (ulongv: dword);
        8: (doublev: double);
      end;
  end;
  PEcore_Getopt_Desc_Store = ^TEcore_Getopt_Desc_Store;

  PEcore_Getopt = ^TEcore_Getopt;
  PEcore_Getopt_Desc = ^TEcore_Getopt_Desc;

  TEcore_Getopt_Desc_Callback = record
    func: function(parser: PEcore_Getopt; desc: PEcore_Getopt_Desc; str: pchar; data: pointer; storage: PEcore_Getopt_Value): TEina_Bool; cdecl;
    data: pointer;
    arg_req: TEcore_Getopt_Desc_Arg_Requirement;
    def: pchar;
  end;
  PEcore_Getopt_Desc_Callback = ^TEcore_Getopt_Desc_Callback;

  TEcore_Getopt_Desc = record
    shortname: char;
    longname: pchar;
    help: pchar;
    metavar: pchar;
    action: TEcore_Getopt_Action;
    action_param: record
      case longint of
        0: (store: TEcore_Getopt_Desc_Store);
        1: (store_const: pointer);
        2: (choices: ^pchar);
        3: (append_type: TEcore_Getopt_Type);
        4: (callback: TEcore_Getopt_Desc_Callback);
        5: (dummy: pointer);
      end;
  end;

  TEcore_Getopt = bitpacked record
    prog: pchar;
    usage: pchar;
    version: pchar;
    copyright: pchar;
    license: pchar;
    description: pchar;
    strict : 0..1;
    descs: PEcore_Getopt_Desc;
  end;

procedure ecore_getopt_help(fp: PFILE; info: PEcore_Getopt); cdecl; external libencore;
function ecore_getopt_help_category(fp: PFILE; info: PEcore_Getopt; category: pchar): TEina_Bool; cdecl; external libencore;
function ecore_getopt_parser_has_duplicates(parser: PEcore_Getopt): TEina_Bool; cdecl; external libencore;
function ecore_getopt_parse(parser: PEcore_Getopt; values: PEcore_Getopt_Value; argc: longint; argv: PPchar): longint; cdecl; external libencore;
function ecore_getopt_parse_positional(parser: PEcore_Getopt; values: PEcore_Getopt_Value; argc: longint; argv: PPchar; start: longint): longint; cdecl; external libencore;
function ecore_getopt_list_free(list: PEina_List): PEina_List; cdecl; external libencore;
function ecore_getopt_callback_geometry_parse(parser: PEcore_Getopt; desc: PEcore_Getopt_Desc; str: pchar; data: pointer; storage: PEcore_Getopt_Value): TEina_Bool; cdecl; external libencore;
function ecore_getopt_callback_size_parse(parser: PEcore_Getopt; desc: PEcore_Getopt_Desc; str: pchar; data: pointer; storage: PEcore_Getopt_Value): TEina_Bool; cdecl; external libencore;

// === Konventiert am: 21-5-25 13:42:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
