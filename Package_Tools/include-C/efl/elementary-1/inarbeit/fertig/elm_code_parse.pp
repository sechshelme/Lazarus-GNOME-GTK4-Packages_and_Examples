
unit elm_code_parse;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_parse.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_parse.h
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
PElm_Code  = ^Elm_Code;
PElm_Code_File  = ^Elm_Code_File;
PElm_Code_Line  = ^Elm_Code_Line;
PElm_Code_Parser  = ^Elm_Code_Parser;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_CODE_PARSE_H_}
{$define ELM_CODE_PARSE_H_}
{ C++ extern C conditionnal removed }
{*
 * @file
 * @brief These routines are used for handling the parsing of Elm Code content.
  }
type
  var
    ELM_CODE_PARSER_STANDARD_SYNTAX : PElm_Code_Parser;cvar;external;
{*< A provided parser to provide syntax highlighting  }
    ELM_CODE_PARSER_STANDARD_DIFF : PElm_Code_Parser;cvar;external;
{*< A provided parser that will mark up diff text  }
    ELM_CODE_PARSER_STANDARD_TODO : PElm_Code_Parser;cvar;external;
{*< A provided parser that will highlight TODO and FIXME lines  }
{*
 * @brief Parser helper functions.
 * @defgroup Parser  Hooking in and launching parsers
 *
 * @
 *
 * Parser functions for marking up elm code.
 *
  }

procedure elm_code_parser_add(code:PElm_Code; parse_line:procedure (para1:PElm_Code_Line; para2:pointer); parse_file:procedure (para1:PElm_Code_File; para2:pointer); data:pointer);cdecl;external;
procedure elm_code_parser_standard_add(code:PElm_Code; parser:PElm_Code_Parser);cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ELM_CODE_PARSE_H_  }

implementation


end.
