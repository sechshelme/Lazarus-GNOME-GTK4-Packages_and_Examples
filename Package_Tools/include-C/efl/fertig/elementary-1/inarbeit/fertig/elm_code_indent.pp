
unit elm_code_indent;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_indent.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_indent.h
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
Pdword  = ^dword;
PElm_Code_Line  = ^Elm_Code_Line;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_CODE_INDENT_H_}
{$define ELM_CODE_INDENT_H_}
{ C++ extern C conditionnal removed }
{*
 * @file
 * @brief These routines are used for calculating text indentation of lines in Elm Code.
  }
{*
 * @brief Line indent handling functions.
 * @defgroup Indent management of indentation of lines
 *
 * @
 *
 * Functions for calculation indentation of lines within elm code.
 *
  }

function elm_code_line_indent_get(line:PElm_Code_Line):Pchar;cdecl;external;
(* Const before type ignored *)
function elm_code_line_indent_matching_braces_get(line:PElm_Code_Line; length:Pdword):Pchar;cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ELM_CODE_INDENT_H_  }

implementation


end.
