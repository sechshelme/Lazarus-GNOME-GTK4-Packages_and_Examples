{$IFDEF read_interface}


type
  TElm_Code_Parser = record
  end;
  PElm_Code_Parser = ^TElm_Code_Parser;

var
  ELM_CODE_PARSER_STANDARD_SYNTAX: PElm_Code_Parser; cvar;external libelementary;
  ELM_CODE_PARSER_STANDARD_DIFF: PElm_Code_Parser; cvar;external libelementary;
  ELM_CODE_PARSER_STANDARD_TODO: PElm_Code_Parser; cvar;external libelementary;

type
  Tparse_line_cp = procedure(para1: PElm_Code_Line; para2: pointer); cdecl;

procedure elm_code_parser_add(code: PElm_Code; parse_line: Tparse_line_cp; parse_file: Tparse_line_cp; data: pointer); cdecl; external libelementary;
procedure elm_code_parser_standard_add(code: PElm_Code; parser: PElm_Code_Parser); cdecl; external libelementary;

// === Konventiert am: 26-5-25 16:41:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
