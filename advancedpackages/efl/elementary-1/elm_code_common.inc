{$IFDEF read_interface}

var
  ELM_CODE_EVENT_LINE_LOAD_DONE: TEfl_Event_Description; cvar;external libelementary;
  ELM_CODE_EVENT_FILE_LOAD_DONE: TEfl_Event_Description; cvar;external libelementary;

type
  PElm_Code_Status_Type = ^TElm_Code_Status_Type;
  TElm_Code_Status_Type = longint;

const
  ELM_CODE_STATUS_TYPE_DEFAULT = 0;
  ELM_CODE_STATUS_TYPE_CURRENT = 1;
  ELM_CODE_STATUS_TYPE_IGNORED = 2;
  ELM_CODE_STATUS_TYPE_NOTE = 3;
  ELM_CODE_STATUS_TYPE_WARNING = 4;
  ELM_CODE_STATUS_TYPE_ERROR = 5;
  ELM_CODE_STATUS_TYPE_FATAL = 6;
  ELM_CODE_STATUS_TYPE_ADDED = 7;
  ELM_CODE_STATUS_TYPE_REMOVED = 8;
  ELM_CODE_STATUS_TYPE_CHANGED = 9;
  ELM_CODE_STATUS_TYPE_PASSED = 10;
  ELM_CODE_STATUS_TYPE_FAILED = 11;
  ELM_CODE_STATUS_TYPE_TODO = 12;
  ELM_CODE_STATUS_TYPE_COUNT = 13;

type
  PElm_Code_Token_Type = ^TElm_Code_Token_Type;
  TElm_Code_Token_Type = longint;

const
  ELM_CODE_TOKEN_TYPE_DEFAULT = ELM_CODE_STATUS_TYPE_COUNT;
  ELM_CODE_TOKEN_TYPE_COMMENT = (ELM_CODE_STATUS_TYPE_COUNT) + 1;
  ELM_CODE_TOKEN_TYPE_STRING = (ELM_CODE_STATUS_TYPE_COUNT) + 2;
  ELM_CODE_TOKEN_TYPE_NUMBER = (ELM_CODE_STATUS_TYPE_COUNT) + 3;
  ELM_CODE_TOKEN_TYPE_BRACE = (ELM_CODE_STATUS_TYPE_COUNT) + 4;
  ELM_CODE_TOKEN_TYPE_TYPE = (ELM_CODE_STATUS_TYPE_COUNT) + 5;
  ELM_CODE_TOKEN_TYPE_CLASS = (ELM_CODE_STATUS_TYPE_COUNT) + 6;
  ELM_CODE_TOKEN_TYPE_FUNCTION = (ELM_CODE_STATUS_TYPE_COUNT) + 7;
  ELM_CODE_TOKEN_TYPE_PARAM = (ELM_CODE_STATUS_TYPE_COUNT) + 8;
  ELM_CODE_TOKEN_TYPE_KEYWORD = (ELM_CODE_STATUS_TYPE_COUNT) + 9;
  ELM_CODE_TOKEN_TYPE_PREPROCESSOR = (ELM_CODE_STATUS_TYPE_COUNT) + 10;
  ELM_CODE_TOKEN_TYPE_ADDED = (ELM_CODE_STATUS_TYPE_COUNT) + 11;
  ELM_CODE_TOKEN_TYPE_REMOVED = (ELM_CODE_STATUS_TYPE_COUNT) + 12;
  ELM_CODE_TOKEN_TYPE_CHANGED = (ELM_CODE_STATUS_TYPE_COUNT) + 13;
  ELM_CODE_TOKEN_TYPE_MATCH = (ELM_CODE_STATUS_TYPE_COUNT) + 14;
  ELM_CODE_TOKEN_TYPE_COUNT = (ELM_CODE_STATUS_TYPE_COUNT) + 15;

type
  PElm_Code_File_Line_Ending = ^TElm_Code_File_Line_Ending;
  TElm_Code_File_Line_Ending = longint;

const
  ELM_CODE_FILE_LINE_ENDING_UNIX = 0;
  ELM_CODE_FILE_LINE_ENDING_WINDOWS = 1;

type
  TElm_Code_File = record
    parent: pointer;
    lines: PEina_List;
    file_: PEina_File;
    map: pointer;
    mime: pchar;
    line_ending: TElm_Code_File_Line_Ending;
  end;
  PElm_Code_File = ^TElm_Code_File;

  TElm_Code_Config = record
    trim_whitespace: TEina_Bool;
    indent_style_efl: TEina_Bool;
  end;
  PElm_Code_Config = ^TElm_Code_Config;

  TElm_Code = record
    file_: PElm_Code_File;
    widgets: PEina_List;
    parsers: PEina_List;
    config: TElm_Code_Config;
  end;
  PElm_Code = ^TElm_Code;


  // === Konventiert am: 26-5-25 13:47:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
