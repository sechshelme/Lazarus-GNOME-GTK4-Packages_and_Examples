
unit elm_code_line;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_line.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_line.h
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
PEina_List  = ^Eina_List;
PElm_Code_File  = ^Elm_Code_File;
PElm_Code_Line  = ^Elm_Code_Line;
PElm_Code_Token  = ^Elm_Code_Token;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_CODE_LINE_H_}
{$define ELM_CODE_LINE_H_}
{ C++ extern C conditionnal removed }
{*
 * @file
 * @brief These routines are used for interacting with lines of content using Elm Code.
  }
type
  PElm_Code_Token = ^TElm_Code_Token;
  TElm_Code_Token = record
      start : longint;
      end : longint;
      continues : TEina_Bool;
      _type : TElm_Code_Token_Type;
    end;
(* Const before type ignored *)

  PElm_Code_Line = ^TElm_Code_Line;
  TElm_Code_Line = record
      file : PElm_Code_File;
      content : Pchar;
      length : dword;
      number : dword;
      modified : Pchar;
      status : TElm_Code_Status_Type;
      tokens : PEina_List;
      scope : dword;
      data : pointer;
      status_text : Pchar;
    end;

procedure elm_code_line_free(line:PElm_Code_Line);cdecl;external;
{*
 * @brief Line manipulation functions.
 * @defgroup Elm_Code_Line_Content Elementary Code Line
 * @
 *
 * Functions for changing the content of lines in an Elm_Code_File
  }
{*
 * Split the given line into two at the specified character position.
 * The additional line will be inserted into the file immediately below the specified line.
 *
 * @param line The line to split
 * @param position The character position to split at
 *
 * @ingroup Content
  }
procedure elm_code_line_split_at(line:PElm_Code_Line; position:dword);cdecl;external;
{*
 * Merge the specified line with the line above.
 * The content of the specified line will be added to the end of the previous line.
 * The specified line will then be removed from the file.
 *
 * If there is no previous line this method does nothing.
 *
 * @param line The line to merge with the previous line.
 *
 * @ingroup Content
  }
procedure elm_code_line_merge_up(line:PElm_Code_Line);cdecl;external;
{*
 * Merge the specified line with the line below.
 * The content of the specified line will have the contents of the next line added to the end.
 * The next line will then be removed from the file.
 *
 * If there is no next line this method does nothing.
 *
 * @param line The line to merge with the next line.
 *
 * @ingroup Content
  }
procedure elm_code_line_merge_down(line:PElm_Code_Line);cdecl;external;
{*
 * @
 *
 * @brief Line markup functions.
 * @defgroup Highlighting Elementary Code Highlighting
 *
 * @
 *
 * Functions for handling styling and marking up lines within elm code.
 *
  }
procedure elm_code_line_status_set(line:PElm_Code_Line; status:TElm_Code_Status_Type);cdecl;external;
(* Const before type ignored *)
procedure elm_code_line_status_text_set(line:PElm_Code_Line; text:Pchar);cdecl;external;
procedure elm_code_line_status_clear(line:PElm_Code_Line);cdecl;external;
procedure elm_code_line_token_add(line:PElm_Code_Line; start:longint; end:longint; lines:longint; _type:TElm_Code_Token_Type);cdecl;external;
procedure elm_code_line_tokens_clear(line:PElm_Code_Line);cdecl;external;
function elm_code_line_scope_get(line:PElm_Code_Line):dword;cdecl;external;
function elm_code_line_contains_widget_cursor(line:PElm_Code_Line):TEina_Bool;cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ELM_CODE_LINE_H_  }

implementation


end.
