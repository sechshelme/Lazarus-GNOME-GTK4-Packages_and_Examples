
unit elm_code_file;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_code_file.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_code_file.h
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
PEina_File  = ^Eina_File;
PEina_List  = ^Eina_List;
PElm_Code  = ^Elm_Code;
PElm_Code_File  = ^Elm_Code_File;
PElm_Code_File_Line_Ending  = ^Elm_Code_File_Line_Ending;
PElm_Code_Line  = ^Elm_Code_Line;
Psmallint  = ^smallint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_CODE_FILE_H_}
{$define ELM_CODE_FILE_H_}
{ C++ extern C conditionnal removed }
{*
 * @file
 * @brief These routines are used for interacting with files using Elm Code.
  }
type
  PElm_Code_File_Line_Ending = ^TElm_Code_File_Line_Ending;
  TElm_Code_File_Line_Ending =  Longint;
  Const
    ELM_CODE_FILE_LINE_ENDING_UNIX = 0;
    ELM_CODE_FILE_LINE_ENDING_WINDOWS = 1;
;
(* Const before type ignored *)
type
  PElm_Code_File = ^TElm_Code_File;
  TElm_Code_File = record
      parent : pointer;
      lines : PEina_List;
      file : PEina_File;
      map : pointer;
      mime : Pchar;
      line_ending : TElm_Code_File_Line_Ending;
    end;

{*
 * @brief File handling functions.
 * @defgroup File  I/O at a file level
 *
 * @
 *
 * Functions for file handling within elm code.
 *
  }

function elm_code_file_new(code:PElm_Code):PElm_Code_File;cdecl;external;
(* Const before type ignored *)
function elm_code_file_open(code:PElm_Code; path:Pchar):PElm_Code_File;cdecl;external;
procedure elm_code_file_save(file:PElm_Code_File);cdecl;external;
procedure elm_code_file_free(file:PElm_Code_File);cdecl;external;
procedure elm_code_file_close(file:PElm_Code_File);cdecl;external;
{*
 * Get the filename for the file specified.
 *
 * @return the filename or NULL if it is an in-memory file
  }
(* Const before type ignored *)
function elm_code_file_filename_get(file:PElm_Code_File):Pchar;cdecl;external;
{*
 * Get the file path for the file specified.
 *
 * @return the file's path or NULL if it is an in-memory file
  }
(* Const before type ignored *)
function elm_code_file_path_get(file:PElm_Code_File):Pchar;cdecl;external;
function elm_code_file_line_ending_get(file:PElm_Code_File):TElm_Code_File_Line_Ending;cdecl;external;
(* Const before type ignored *)
function elm_code_file_line_ending_chars_get(file:PElm_Code_File; length:Psmallint):Pchar;cdecl;external;
{*
 * @
 *
 * @brief Content functions.
 * @defgroup Content  Functions for accessing file content
 *
 * @
 *
 * File content handling functions.
 *
  }
procedure elm_code_file_clear(file:PElm_Code_File);cdecl;external;
function elm_code_file_lines_get(file:PElm_Code_File):dword;cdecl;external;
(* Const before type ignored *)
procedure elm_code_file_line_append(file:PElm_Code_File; line:Pchar; length:longint; data:pointer);cdecl;external;
(* Const before type ignored *)
procedure elm_code_file_line_insert(file:PElm_Code_File; row:dword; line:Pchar; length:longint; data:pointer);cdecl;external;
procedure elm_code_file_line_remove(file:PElm_Code_File; row:dword);cdecl;external;
function elm_code_file_line_get(file:PElm_Code_File; line:dword):PElm_Code_Line;cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ELM_CODE_FILE_H_  }

implementation


end.
