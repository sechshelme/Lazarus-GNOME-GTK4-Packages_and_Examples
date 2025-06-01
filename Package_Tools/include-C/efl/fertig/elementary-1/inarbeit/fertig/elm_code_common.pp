
unit elm_code_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_common.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PEina_List  = ^Eina_List;
PElm_Code  = ^Elm_Code;
PElm_Code_Config  = ^Elm_Code_Config;
PElm_Code_File  = ^Elm_Code_File;
PElm_Code_Status_Type  = ^Elm_Code_Status_Type;
PElm_Code_Token_Type  = ^Elm_Code_Token_Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_CODE_COMMON_H_}
{$define ELM_CODE_COMMON_H_}
type
{* Event marking that a single line has loaded or changed  }
(* Const before type ignored *)
  var
    ELM_CODE_EVENT_LINE_LOAD_DONE : TEfl_Event_Description;cvar;external;
{* Event that marks a file load has been completed  }
(* Const before type ignored *)
    ELM_CODE_EVENT_FILE_LOAD_DONE : TEfl_Event_Description;cvar;external;
type
  PElm_Code_Status_Type = ^TElm_Code_Status_Type;
  TElm_Code_Status_Type =  Longint;
  Const
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
;
type
  PElm_Code_Token_Type = ^TElm_Code_Token_Type;
  TElm_Code_Token_Type =  Longint;
  Const
    ELM_CODE_TOKEN_TYPE_DEFAULT = ELM_CODE_STATUS_TYPE_COUNT;
    ELM_CODE_TOKEN_TYPE_COMMENT = (ELM_CODE_STATUS_TYPE_COUNT)+1;
    ELM_CODE_TOKEN_TYPE_STRING = (ELM_CODE_STATUS_TYPE_COUNT)+2;
    ELM_CODE_TOKEN_TYPE_NUMBER = (ELM_CODE_STATUS_TYPE_COUNT)+3;
    ELM_CODE_TOKEN_TYPE_BRACE = (ELM_CODE_STATUS_TYPE_COUNT)+4;
    ELM_CODE_TOKEN_TYPE_TYPE = (ELM_CODE_STATUS_TYPE_COUNT)+5;
    ELM_CODE_TOKEN_TYPE_CLASS = (ELM_CODE_STATUS_TYPE_COUNT)+6;
    ELM_CODE_TOKEN_TYPE_FUNCTION = (ELM_CODE_STATUS_TYPE_COUNT)+7;
    ELM_CODE_TOKEN_TYPE_PARAM = (ELM_CODE_STATUS_TYPE_COUNT)+8;
    ELM_CODE_TOKEN_TYPE_KEYWORD = (ELM_CODE_STATUS_TYPE_COUNT)+9;
    ELM_CODE_TOKEN_TYPE_PREPROCESSOR = (ELM_CODE_STATUS_TYPE_COUNT)+10;
    ELM_CODE_TOKEN_TYPE_ADDED = (ELM_CODE_STATUS_TYPE_COUNT)+11;
    ELM_CODE_TOKEN_TYPE_REMOVED = (ELM_CODE_STATUS_TYPE_COUNT)+12;
    ELM_CODE_TOKEN_TYPE_CHANGED = (ELM_CODE_STATUS_TYPE_COUNT)+13;
    ELM_CODE_TOKEN_TYPE_MATCH = (ELM_CODE_STATUS_TYPE_COUNT)+14;
    ELM_CODE_TOKEN_TYPE_COUNT = (ELM_CODE_STATUS_TYPE_COUNT)+15;
;
{ C++ extern C conditionnal removed }
{*
 * @file
 * @brief Common data structures and constants.
  }
type
  PElm_Code_Config = ^TElm_Code_Config;
  TElm_Code_Config = record
      trim_whitespace : TEina_Bool;
      indent_style_efl : TEina_Bool;
    end;

  PElm_Code = ^TElm_Code;
  TElm_Code = record
      file : PElm_Code_File;
      widgets : PEina_List;
      parsers : PEina_List;
      config : TElm_Code_Config;
    end;

{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ELM_CODE_COMMON_H_  }

implementation


end.
