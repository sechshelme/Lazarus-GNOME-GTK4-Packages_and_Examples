
unit chafa_term_info;
interface

{
  Automatically converted by H2Pas 1.0.0 from chafa_term_info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    chafa_term_info.h
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
PChafaParseResult  = ^ChafaParseResult;
PChafaTermInfo  = ^ChafaTermInfo;
PChafaTermInfoError  = ^ChafaTermInfoError;
PChafaTermSeq  = ^ChafaTermSeq;
Pgchar  = ^gchar;
PGError  = ^GError;
Pgint  = ^gint;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{ Copyright (C) 2020-2023 Hans Petter Jansson
 *
 * This file is part of Chafa, a program that shows pictures on text terminals.
 *
 * Chafa is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Chafa is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Chafa.  If not, see <http://www.gnu.org/licenses/>.  }
{$ifndef __CHAFA_TERM_INFO_H__}
{$define __CHAFA_TERM_INFO_H__}
{$if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)}
{$error "Only <chafa.h> can be included directly."}
{$endif}

const
  CHAFA_TERM_SEQ_LENGTH_MAX = 96;  
{ Maximum number of arguments + 1 for sentinel  }
  CHAFA_TERM_SEQ_ARGS_MAX = 8;  
{$ifndef __GTK_DOC_IGNORE__}
{ This declares the enum for CHAFA_TERM_SEQ_*. See chafa-term-seq-def.h
 * for more information, or look up the canonical documentation at
 * https://hpjansson.org/chafa/ref/ for verbose definitions.  }
{#define CHAFA_TERM_SEQ_DEF(name, NAME, n_args, arg_proc, arg_type, ...) CHAFA_TERM_SEQ_##NAME, }
{#include <chafa-term-seq-def.h> }
{#undef CHAFA_TERM_SEQ_DEF }
type
  PChafaTermSeq = ^TChafaTermSeq;
  TChafaTermSeq =  Longint;
  Const
    CHAFA_TERM_SEQ_MAX = 0;
;
{$endif}
{ __GTK_DOC_IGNORE__  }
type
{*
 * CHAFA_TERM_INFO_ERROR:
 * 
 * Error domain for #ChafaTermInfo. Errors in this domain will
 * be from the #ChafaTermInfoError enumeration. See #GError for information on 
 * error domains.
 * }

{ was #define dname def_expr }
function CHAFA_TERM_INFO_ERROR : longint; { return type might be wrong }

{*
 * ChafaTermInfoError:
 * @CHAFA_TERM_INFO_ERROR_SEQ_TOO_LONG: A control sequence could exceed
 *  #CHAFA_TERM_SEQ_LENGTH_MAX bytes if formatted with maximum argument lengths.
 * @CHAFA_TERM_INFO_ERROR_BAD_ESCAPE: An illegal escape sequence was used.
 * @CHAFA_TERM_INFO_ERROR_BAD_ARGUMENTS: A control sequence specified
 *  more than the maximum number of arguments, or an argument index was out
 *  of range.
 * 
 * Error codes returned by control sequence parsing.
 * }
type
  PChafaTermInfoError = ^TChafaTermInfoError;
  TChafaTermInfoError =  Longint;
  Const
    CHAFA_TERM_INFO_ERROR_SEQ_TOO_LONG = 0;
    CHAFA_TERM_INFO_ERROR_BAD_ESCAPE = 1;
    CHAFA_TERM_INFO_ERROR_BAD_ARGUMENTS = 2;
;
{*
 * ChafaParseResult:
 * @CHAFA_PARSE_SUCCESS: Parsed successfully
 * @CHAFA_PARSE_FAILURE: Data mismatch
 * @CHAFA_PARSE_AGAIN: Partial success, but not enough input
 *
 * An enumeration of the possible return values from the parsing function.
 * }
type
  PChafaParseResult = ^TChafaParseResult;
  TChafaParseResult =  Longint;
  Const
    CHAFA_PARSE_SUCCESS = 0;
    CHAFA_PARSE_FAILURE = 1;
    CHAFA_PARSE_AGAIN = 2;
;

function chafa_term_info_error_quark:TGQuark;cdecl;external;
function chafa_term_info_new:PChafaTermInfo;cdecl;external;
(* Const before type ignored *)
function chafa_term_info_copy(term_info:PChafaTermInfo):PChafaTermInfo;cdecl;external;
procedure chafa_term_info_ref(term_info:PChafaTermInfo);cdecl;external;
procedure chafa_term_info_unref(term_info:PChafaTermInfo);cdecl;external;
(* Const before type ignored *)
function chafa_term_info_get_seq(term_info:PChafaTermInfo; seq:TChafaTermSeq):Pgchar;cdecl;external;
(* Const before type ignored *)
function chafa_term_info_set_seq(term_info:PChafaTermInfo; seq:TChafaTermSeq; str:Pgchar; error:PPGError):Tgint;cdecl;external;
(* Const before type ignored *)
function chafa_term_info_have_seq(term_info:PChafaTermInfo; seq:TChafaTermSeq):Tgboolean;cdecl;external;
function chafa_term_info_emit_seq(term_info:PChafaTermInfo; seq:TChafaTermSeq; args:array of const):Pgchar;cdecl;external;
function chafa_term_info_emit_seq(term_info:PChafaTermInfo; seq:TChafaTermSeq):Pgchar;cdecl;external;
function chafa_term_info_parse_seq(term_info:PChafaTermInfo; seq:TChafaTermSeq; input:PPgchar; input_len:Pgint; args_out:Pguint):TChafaParseResult;cdecl;external;
procedure chafa_term_info_supplement(term_info:PChafaTermInfo; source:PChafaTermInfo);cdecl;external;
{ This declares the prototypes for chafa_term_info_emit_*(). See
 * chafa-term-seq-def.h for more information, or look up the canonical
 * documentation at https://hpjansson.org/chafa/ref/ for verbose
 * function prototypes.  }
{$endif}
{ __CHAFA_TERM_INFO_H__  }

implementation

{ was #define dname def_expr }
function CHAFA_TERM_INFO_ERROR : longint; { return type might be wrong }
  begin
    CHAFA_TERM_INFO_ERROR:=chafa_term_info_error_quark;
  end;


end.
