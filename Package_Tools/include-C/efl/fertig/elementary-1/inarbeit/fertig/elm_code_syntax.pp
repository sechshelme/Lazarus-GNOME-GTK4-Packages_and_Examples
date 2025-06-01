
unit elm_code_syntax;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_syntax.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_syntax.h
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
Pchar  = ^char;
PElm_Code_File  = ^Elm_Code_File;
PElm_Code_Line  = ^Elm_Code_Line;
PElm_Code_Syntax  = ^Elm_Code_Syntax;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_CODE_SYNTAX_H_}
{$define ELM_CODE_SYNTAX_H_}
{ C++ extern C conditionnal removed }
{*
 * @file
 * @brief These routines are used for handling the parsing of Elm Code content.
  }
type
{*
 * @brief Syntax highlighting helper functions.
 * @defgroup Syntax Parsing and marking up syntax in files
 *
 * @
 *
 * Syntax functions for adding syntax highlighting to elm code.
 *
  }
{*
 * Lookup a syntax definition from a mime type.
 * If there is no syntax known NULL will be returned.
 *
 * @param mime The mime type to be looked up for a matching syntax definition
 * @return A syntax definition, if one is found, or NULL
 *
 * @ingroup Syntax
  }
(* Const before type ignored *)

function elm_code_syntax_for_mime_get(mime:Pchar):PElm_Code_Syntax;cdecl;external;
{*
 * Parse a line and apply the syntax definition by inserting Elm_Code_Token into the line.
 *
 * @param syntax The syntax definition to use (from elm_code_syntax_for_mime_get)
 * @param line The line that contains the content to parse and will receive the tokens
 *
 * @ingroup Syntax
  }
procedure elm_code_syntax_parse_line(syntax:PElm_Code_Syntax; line:PElm_Code_Line);cdecl;external;
{*
 * Parse a file and apply the syntax definition one line at a time.
 *
 * @param syntax The syntax definition to use (from elm_code_syntax_for_mime_get)
 * @param file The file to parse - each line in the file will be processed
 *
 * @ingroup Syntax
  }
procedure elm_code_syntax_parse_file(syntax:PElm_Code_Syntax; file:PElm_Code_File);cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ELM_CODE_SYNTAX_H_  }

implementation


end.
