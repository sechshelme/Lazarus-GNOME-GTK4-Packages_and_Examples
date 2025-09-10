
unit lex;
interface

{
  Automatically converted by H2Pas 1.0.0 from lex.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lex.h
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
PTCOD_lex_t  = ^TCOD_lex_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ BSD 3-Clause License
 *
 * Copyright © 2008-2021, Jice and the libtcod contributors.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
  }
{
 * This is a libtcod internal module.
 * Use at your own risks...
  }
{$ifndef _TCOD_LEX_H}
{$define _TCOD_LEX_H}
{$include "portability.h"}
{ C++ extern C conditionnal removed }

const
  TCOD_LEX_FLAG_NOCASE = 1;  
  TCOD_LEX_FLAG_NESTING_COMMENT = 2;  
  TCOD_LEX_FLAG_TOKENIZE_COMMENTS = 4;  
  TCOD_LEX_ERROR = -(1);  
  TCOD_LEX_UNKNOWN = 0;  
  TCOD_LEX_SYMBOL = 1;  
  TCOD_LEX_KEYWORD = 2;  
  TCOD_LEX_IDEN = 3;  
  TCOD_LEX_STRING = 4;  
  TCOD_LEX_INTEGER = 5;  
  TCOD_LEX_FLOAT = 6;  
  TCOD_LEX_CHAR = 7;  
  TCOD_LEX_EOF = 8;  
  TCOD_LEX_COMMENT = 9;  
  TCOD_LEX_MAX_SYMBOLS = 100;  
  TCOD_LEX_SYMBOL_SIZE = 5;  
  TCOD_LEX_MAX_KEYWORDS = 100;  
  TCOD_LEX_KEYWORD_SIZE = 20;  
{ private stuff  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ is this object a savepoint (no free in destructor)  }
type
  PTCOD_lex_t = ^TTCOD_lex_t;
  TTCOD_lex_t = record
      file_line : longint;
      token_type : longint;
      token_int_val : longint;
      token_idx : longint;
      token_float_val : single;
      tok : Pchar;
      toklen : longint;
      lastStringDelim : char;
      pos : Pchar;
      buf : Pchar;
      filename : Pchar;
      last_javadoc_comment : Pchar;
      nb_symbols : longint;
      nb_keywords : longint;
      flags : longint;
      symbols : array[0..(TCOD_LEX_MAX_SYMBOLS)-1] of array[0..(TCOD_LEX_SYMBOL_SIZE)-1] of char;
      keywords : array[0..(TCOD_LEX_MAX_KEYWORDS)-1] of array[0..(TCOD_LEX_KEYWORD_SIZE)-1] of char;
      simpleCmt : Pchar;
      cmtStart : Pchar;
      cmtStop : Pchar;
      javadocCmtStart : Pchar;
      stringDelim : Pchar;
      javadoc_read : Tbool;
      allocBuf : Tbool;
      savept : Tbool;
    end;

function TCOD_lex_new_intern:PTCOD_lex_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_lex_new(symbols:PPchar; keywords:PPchar; simpleComment:Pchar; commentStart:Pchar; commentStop:Pchar; 
           javadocCommentStart:Pchar; stringDelim:Pchar; flags:longint):PTCOD_lex_t;cdecl;external;
procedure TCOD_lex_delete(lex:PTCOD_lex_t);cdecl;external;
procedure TCOD_lex_set_data_buffer(lex:PTCOD_lex_t; dat:Pchar);cdecl;external;
(* Const before type ignored *)
function TCOD_lex_set_data_file(lex:PTCOD_lex_t; filename:Pchar):Tbool;cdecl;external;
function TCOD_lex_parse(lex:PTCOD_lex_t):longint;cdecl;external;
function TCOD_lex_parse_until_token_type(lex:PTCOD_lex_t; token_type:longint):longint;cdecl;external;
(* Const before type ignored *)
function TCOD_lex_parse_until_token_value(lex:PTCOD_lex_t; token_value:Pchar):longint;cdecl;external;
function TCOD_lex_expect_token_type(lex:PTCOD_lex_t; token_type:longint):Tbool;cdecl;external;
(* Const before type ignored *)
function TCOD_lex_expect_token_value(lex:PTCOD_lex_t; token_type:longint; token_value:Pchar):Tbool;cdecl;external;
procedure TCOD_lex_savepoint(lex:PTCOD_lex_t; savept:PTCOD_lex_t);cdecl;external;
procedure TCOD_lex_restore(lex:PTCOD_lex_t; savept:PTCOD_lex_t);cdecl;external;
function TCOD_lex_get_last_javadoc(lex:PTCOD_lex_t):Pchar;cdecl;external;
(* Const before type ignored *)
function TCOD_lex_get_token_name(token_type:longint):Pchar;cdecl;external;
function TCOD_lex_get_last_error:Pchar;cdecl;external;
function TCOD_lex_hextoint(c:char):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
