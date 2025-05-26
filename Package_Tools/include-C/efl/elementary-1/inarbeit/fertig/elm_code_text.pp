
unit elm_code_text;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_text.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_text.h
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
Psmallint  = ^smallint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_CODE_TEXT_H_}
{$define ELM_CODE_TEXT_H_}

const
  ELM_CODE_TEXT_NOT_FOUND = -(1);  
{ C++ extern C conditionnal removed }
{*
 * @file
 * @brief These routines are used for interacting with the textual content of files/lines in Elm Code.
  }
{*
 * @brief Line text handling functions.
 * @defgroup Elm_Code_Text access and manipulation within lines
 *
 * @
 *
 * Functions for handling content of lines within elm code.
 *
  }
(* Const before type ignored *)

function elm_code_line_text_get(line:PElm_Code_Line; length:Pdword):Pchar;cdecl;external;
(* Const before type ignored *)
procedure elm_code_line_text_set(line:PElm_Code_Line; chars:Pchar; length:dword);cdecl;external;
(* Const before type ignored *)
function elm_code_line_text_strpos(line:PElm_Code_Line; search:Pchar; offset:longint):longint;cdecl;external;
(* Const before type ignored *)
function elm_code_line_text_contains(line:PElm_Code_Line; search:Pchar):TEina_Bool;cdecl;external;
function elm_code_line_text_substr(line:PElm_Code_Line; position:dword; length:longint):Pchar;cdecl;external;
(* Const before type ignored *)
procedure elm_code_line_text_insert(line:PElm_Code_Line; position:dword; _string:Pchar; length:longint);cdecl;external;
procedure elm_code_line_text_remove(line:PElm_Code_Line; position:dword; length:longint);cdecl;external;
procedure elm_code_line_text_leading_whitespace_strip(line:PElm_Code_Line);cdecl;external;
procedure elm_code_line_text_trailing_whitespace_strip(line:PElm_Code_Line);cdecl;external;
{*
 * @
 *
 * @brief Generic text handling functions.
 * @defgroup Text helper functions
 *
 * @
 *
 * Functions for managing unicode text.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_code_text_strnpos(text:Pchar; length:dword; search:Pchar; offset:longint):longint;cdecl;external;
(* Const before type ignored *)
function elm_code_text_newlinenpos(text:Pchar; length:dword; nllen:Psmallint):longint;cdecl;external;
(* Const before type ignored *)
function elm_code_text_is_whitespace(text:Pchar; length:dword):dword;cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ELM_CODE_TEXT_H_  }

implementation


end.
