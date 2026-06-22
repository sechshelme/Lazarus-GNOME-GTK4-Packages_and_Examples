unit gscanner;

interface

uses
  common_GLIB, gtypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
  }
{$ifndef __G_SCANNER_H__}
{$define __G_SCANNER_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gdataset.h>}
{$include <glib/ghash.h>}
type

  PGTokenValue = ^TGTokenValue;
  TGTokenValue = TGTokenValue;

  TGScannerMsgFunc = procedure (scanner:PGScanner; message:Pgchar; error:Tgboolean);cdecl;
{ GScanner: Flexible lexical scanner for general purpose.
  }
{ Character sets  }

const
  G_CSET_A_2_Z = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';  
  G_CSET_a_2_z = 'abcdefghijklmnopqrstuvwxyz';  
  G_CSET_DIGITS = '0123456789';  
{xxxxxxxxxxxxxxxxxx
#define G_CSET_LATINC	"\300\301\302\303\304\305\306"\
			"\307\310\311\312\313\314\315\316\317\320"\
			"\321\322\323\324\325\326"\
			"\330\331\332\333\334\335\336"
#define G_CSET_LATINS	"\337\340\341\342\343\344\345\346"\
			"\347\350\351\352\353\354\355\356\357\360"\
			"\361\362\363\364\365\366"\
			"\370\371\372\373\374\375\376\377"

  }
type
  PGErrorType = ^TGErrorType;
  TGErrorType =  Longint;
  Const
    G_ERR_UNKNOWN = 0;
    G_ERR_UNEXP_EOF = 1;
    G_ERR_UNEXP_EOF_IN_STRING = 2;
    G_ERR_UNEXP_EOF_IN_COMMENT = 3;
    G_ERR_NON_DIGIT_IN_CONST = 4;
    G_ERR_DIGIT_RADIX = 5;
    G_ERR_FLOAT_RADIX = 6;
    G_ERR_FLOAT_MALFORMED = 7;
;
{ Token types  }
{< private > }
type
  PGTokenType = ^TGTokenType;
  TGTokenType =  Longint;
  Const
    G_TOKEN_EOF = 0;
    G_TOKEN_LEFT_PAREN = '(';
    G_TOKEN_RIGHT_PAREN = ')';
    G_TOKEN_LEFT_CURLY = '{';
    G_TOKEN_RIGHT_CURLY = '}';
    G_TOKEN_LEFT_BRACE = '[';
    G_TOKEN_RIGHT_BRACE = ']';
    G_TOKEN_EQUAL_SIGN = '=';
    G_TOKEN_COMMA = ',';
    G_TOKEN_NONE = 256;
    G_TOKEN_ERROR = 257;
    G_TOKEN_CHAR = 258;
    G_TOKEN_BINARY = 259;
    G_TOKEN_OCTAL = 260;
    G_TOKEN_INT = 261;
    G_TOKEN_HEX = 262;
    G_TOKEN_FLOAT = 263;
    G_TOKEN_STRING = 264;
    G_TOKEN_SYMBOL = 265;
    G_TOKEN_IDENTIFIER = 266;
    G_TOKEN_IDENTIFIER_NULL = 267;
    G_TOKEN_COMMENT_SINGLE = 268;
    G_TOKEN_COMMENT_MULTI = 269;
    G_TOKEN_LAST = 270;
;
type
  PGTokenValue = ^TGTokenValue;
  TGTokenValue = record
      case longint of
        0 : ( v_symbol : Tgpointer );
        1 : ( v_identifier : Pgchar );
        2 : ( v_binary : Tgulong );
        3 : ( v_octal : Tgulong );
        4 : ( v_int : Tgulong );
        5 : ( v_int64 : Tguint64 );
        6 : ( v_float : Tgdouble );
        7 : ( v_hex : Tgulong );
        8 : ( v_string : Pgchar );
        9 : ( v_comment : Pgchar );
        10 : ( v_char : Tguchar );
        11 : ( v_error : Tguint );
      end;

{ Character sets
    }
{ default: " \t\n"  }
{ default: "#\n"  }
{ Should symbol lookup work case sensitive?
    }
{ Boolean values to be adjusted "on the fly"
   * to configure scanning behaviour.
    }
{ C like comment  }
{ single line comment  }
{ scan multi line comments?  }
{ '0x0ff0'  }
{ '$0ff0'  }
{ string: 'anything'  }
{ string: "\\-escapes!\n"  }
{ bin, octal, hex => int  }
{ int => G_TOKEN_FLOAT?  }
{ return G_TOKEN_CHAR?  }
{ try scope 0 on lookups?  }
{ use value.v_int64 rather than v_int  }
{< private > }
  PGScannerConfig = ^TGScannerConfig;
  TGScannerConfig = record
      cset_skip_characters : Pgchar;
      cset_identifier_first : Pgchar;
      cset_identifier_nth : Pgchar;
      cpair_comment_single : Pgchar;
      flag0 : longint;
      padding_dummy : Tguint;
    end;


const
  bm_TGScannerConfig_case_sensitive = $1;
  bp_TGScannerConfig_case_sensitive = 0;
  bm_TGScannerConfig_skip_comment_multi = $2;
  bp_TGScannerConfig_skip_comment_multi = 1;
  bm_TGScannerConfig_skip_comment_single = $4;
  bp_TGScannerConfig_skip_comment_single = 2;
  bm_TGScannerConfig_scan_comment_multi = $8;
  bp_TGScannerConfig_scan_comment_multi = 3;
  bm_TGScannerConfig_scan_identifier = $10;
  bp_TGScannerConfig_scan_identifier = 4;
  bm_TGScannerConfig_scan_identifier_1char = $20;
  bp_TGScannerConfig_scan_identifier_1char = 5;
  bm_TGScannerConfig_scan_identifier_NULL = $40;
  bp_TGScannerConfig_scan_identifier_NULL = 6;
  bm_TGScannerConfig_scan_symbols = $80;
  bp_TGScannerConfig_scan_symbols = 7;
  bm_TGScannerConfig_scan_binary = $100;
  bp_TGScannerConfig_scan_binary = 8;
  bm_TGScannerConfig_scan_octal = $200;
  bp_TGScannerConfig_scan_octal = 9;
  bm_TGScannerConfig_scan_float = $400;
  bp_TGScannerConfig_scan_float = 10;
  bm_TGScannerConfig_scan_hex = $800;
  bp_TGScannerConfig_scan_hex = 11;
  bm_TGScannerConfig_scan_hex_dollar = $1000;
  bp_TGScannerConfig_scan_hex_dollar = 12;
  bm_TGScannerConfig_scan_string_sq = $2000;
  bp_TGScannerConfig_scan_string_sq = 13;
  bm_TGScannerConfig_scan_string_dq = $4000;
  bp_TGScannerConfig_scan_string_dq = 14;
  bm_TGScannerConfig_numbers_2_int = $8000;
  bp_TGScannerConfig_numbers_2_int = 15;
  bm_TGScannerConfig_int_2_float = $10000;
  bp_TGScannerConfig_int_2_float = 16;
  bm_TGScannerConfig_identifier_2_string = $20000;
  bp_TGScannerConfig_identifier_2_string = 17;
  bm_TGScannerConfig_char_2_token = $40000;
  bp_TGScannerConfig_char_2_token = 18;
  bm_TGScannerConfig_symbol_2_token = $80000;
  bp_TGScannerConfig_symbol_2_token = 19;
  bm_TGScannerConfig_scope_0_fallback = $100000;
  bp_TGScannerConfig_scope_0_fallback = 20;
  bm_TGScannerConfig_store_int64 = $200000;
  bp_TGScannerConfig_store_int64 = 21;

function case_sensitive(var a : TGScannerConfig) : Tguint;
procedure set_case_sensitive(var a : TGScannerConfig; __case_sensitive : Tguint);
function skip_comment_multi(var a : TGScannerConfig) : Tguint;
procedure set_skip_comment_multi(var a : TGScannerConfig; __skip_comment_multi : Tguint);
function skip_comment_single(var a : TGScannerConfig) : Tguint;
procedure set_skip_comment_single(var a : TGScannerConfig; __skip_comment_single : Tguint);
function scan_comment_multi(var a : TGScannerConfig) : Tguint;
procedure set_scan_comment_multi(var a : TGScannerConfig; __scan_comment_multi : Tguint);
function scan_identifier(var a : TGScannerConfig) : Tguint;
procedure set_scan_identifier(var a : TGScannerConfig; __scan_identifier : Tguint);
function scan_identifier_1char(var a : TGScannerConfig) : Tguint;
procedure set_scan_identifier_1char(var a : TGScannerConfig; __scan_identifier_1char : Tguint);
function scan_identifier_NULL(var a : TGScannerConfig) : Tguint;
procedure set_scan_identifier_NULL(var a : TGScannerConfig; __scan_identifier_NULL : Tguint);
function scan_symbols(var a : TGScannerConfig) : Tguint;
procedure set_scan_symbols(var a : TGScannerConfig; __scan_symbols : Tguint);
function scan_binary(var a : TGScannerConfig) : Tguint;
procedure set_scan_binary(var a : TGScannerConfig; __scan_binary : Tguint);
function scan_octal(var a : TGScannerConfig) : Tguint;
procedure set_scan_octal(var a : TGScannerConfig; __scan_octal : Tguint);
function scan_float(var a : TGScannerConfig) : Tguint;
procedure set_scan_float(var a : TGScannerConfig; __scan_float : Tguint);
function scan_hex(var a : TGScannerConfig) : Tguint;
procedure set_scan_hex(var a : TGScannerConfig; __scan_hex : Tguint);
function scan_hex_dollar(var a : TGScannerConfig) : Tguint;
procedure set_scan_hex_dollar(var a : TGScannerConfig; __scan_hex_dollar : Tguint);
function scan_string_sq(var a : TGScannerConfig) : Tguint;
procedure set_scan_string_sq(var a : TGScannerConfig; __scan_string_sq : Tguint);
function scan_string_dq(var a : TGScannerConfig) : Tguint;
procedure set_scan_string_dq(var a : TGScannerConfig; __scan_string_dq : Tguint);
function numbers_2_int(var a : TGScannerConfig) : Tguint;
procedure set_numbers_2_int(var a : TGScannerConfig; __numbers_2_int : Tguint);
function int_2_float(var a : TGScannerConfig) : Tguint;
procedure set_int_2_float(var a : TGScannerConfig; __int_2_float : Tguint);
function identifier_2_string(var a : TGScannerConfig) : Tguint;
procedure set_identifier_2_string(var a : TGScannerConfig; __identifier_2_string : Tguint);
function char_2_token(var a : TGScannerConfig) : Tguint;
procedure set_char_2_token(var a : TGScannerConfig; __char_2_token : Tguint);
function symbol_2_token(var a : TGScannerConfig) : Tguint;
procedure set_symbol_2_token(var a : TGScannerConfig; __symbol_2_token : Tguint);
function scope_0_fallback(var a : TGScannerConfig) : Tguint;
procedure set_scope_0_fallback(var a : TGScannerConfig; __scope_0_fallback : Tguint);
function store_int64(var a : TGScannerConfig) : Tguint;
procedure set_store_int64(var a : TGScannerConfig; __store_int64 : Tguint);
{ unused fields  }
{ g_scanner_error() increments this field  }
{ name of input stream, featured by the default message handler  }
{ quarked data  }
{ link into the scanner configuration  }
{ fields filled in after g_scanner_get_next_token()  }
{ fields filled in after g_scanner_peek_next_token()  }
{< private > }
{ to be considered private  }
{< public > }
{ handler function for _warn and _error  }
type
  PGScanner = ^TGScanner;
  TGScanner = record
      user_data : Tgpointer;
      max_parse_errors : Tguint;
      parse_errors : Tguint;
      input_name : Pgchar;
      qdata : PGData;
      config : PGScannerConfig;
      token : TGTokenType;
      value : TGTokenValue;
      line : Tguint;
      position : Tguint;
      next_token : TGTokenType;
      next_value : TGTokenValue;
      next_line : Tguint;
      next_position : Tguint;
      symbol_table : PGHashTable;
      input_fd : Tgint;
      text : Pgchar;
      text_end : Pgchar;
      buffer : Pgchar;
      scope_id : Tguint;
      msg_handler : TGScannerMsgFunc;
    end;


function g_scanner_new(config_templ:PGScannerConfig):PGScanner;cdecl;external libglib2;
procedure g_scanner_destroy(scanner:PGScanner);cdecl;external libglib2;
procedure g_scanner_input_file(scanner:PGScanner; input_fd:Tgint);cdecl;external libglib2;
procedure g_scanner_sync_file_offset(scanner:PGScanner);cdecl;external libglib2;
procedure g_scanner_input_text(scanner:PGScanner; text:Pgchar; text_len:Tguint);cdecl;external libglib2;
function g_scanner_get_next_token(scanner:PGScanner):TGTokenType;cdecl;external libglib2;
function g_scanner_peek_next_token(scanner:PGScanner):TGTokenType;cdecl;external libglib2;
function g_scanner_cur_token(scanner:PGScanner):TGTokenType;cdecl;external libglib2;
function g_scanner_cur_value(scanner:PGScanner):TGTokenValue;cdecl;external libglib2;
function g_scanner_cur_line(scanner:PGScanner):Tguint;cdecl;external libglib2;
function g_scanner_cur_position(scanner:PGScanner):Tguint;cdecl;external libglib2;
function g_scanner_eof(scanner:PGScanner):Tgboolean;cdecl;external libglib2;
function g_scanner_set_scope(scanner:PGScanner; scope_id:Tguint):Tguint;cdecl;external libglib2;
procedure g_scanner_scope_add_symbol(scanner:PGScanner; scope_id:Tguint; symbol:Pgchar; value:Tgpointer);cdecl;external libglib2;
procedure g_scanner_scope_remove_symbol(scanner:PGScanner; scope_id:Tguint; symbol:Pgchar);cdecl;external libglib2;
function g_scanner_scope_lookup_symbol(scanner:PGScanner; scope_id:Tguint; symbol:Pgchar):Tgpointer;cdecl;external libglib2;
procedure g_scanner_scope_foreach_symbol(scanner:PGScanner; scope_id:Tguint; func:TGHFunc; user_data:Tgpointer);cdecl;external libglib2;
function g_scanner_lookup_symbol(scanner:PGScanner; symbol:Pgchar):Tgpointer;cdecl;external libglib2;
procedure g_scanner_unexp_token(scanner:PGScanner; expected_token:TGTokenType; identifier_spec:Pgchar; symbol_spec:Pgchar; symbol_name:Pgchar; 
            message:Pgchar; is_error:Tgint);cdecl;external libglib2;
procedure g_scanner_error(scanner:PGScanner; format:Pgchar; args:array of const);cdecl;external libglib2;
procedure g_scanner_error(scanner:PGScanner; format:Pgchar);cdecl;external libglib2;
procedure g_scanner_warn(scanner:PGScanner; format:Pgchar; args:array of const);cdecl;external libglib2;
procedure g_scanner_warn(scanner:PGScanner; format:Pgchar);cdecl;external libglib2;
{$endif}
{ __G_SCANNER_H__  }

// === Konventiert am: 22-6-26 19:22:47 ===


implementation


function case_sensitive(var a : TGScannerConfig) : Tguint;
begin
  case_sensitive:=(a.flag0 and bm_TGScannerConfig_case_sensitive) shr bp_TGScannerConfig_case_sensitive;
end;

procedure set_case_sensitive(var a : TGScannerConfig; __case_sensitive : Tguint);
begin
  a.flag0:=a.flag0 or ((__case_sensitive shl bp_TGScannerConfig_case_sensitive) and bm_TGScannerConfig_case_sensitive);
end;

function skip_comment_multi(var a : TGScannerConfig) : Tguint;
begin
  skip_comment_multi:=(a.flag0 and bm_TGScannerConfig_skip_comment_multi) shr bp_TGScannerConfig_skip_comment_multi;
end;

procedure set_skip_comment_multi(var a : TGScannerConfig; __skip_comment_multi : Tguint);
begin
  a.flag0:=a.flag0 or ((__skip_comment_multi shl bp_TGScannerConfig_skip_comment_multi) and bm_TGScannerConfig_skip_comment_multi);
end;

function skip_comment_single(var a : TGScannerConfig) : Tguint;
begin
  skip_comment_single:=(a.flag0 and bm_TGScannerConfig_skip_comment_single) shr bp_TGScannerConfig_skip_comment_single;
end;

procedure set_skip_comment_single(var a : TGScannerConfig; __skip_comment_single : Tguint);
begin
  a.flag0:=a.flag0 or ((__skip_comment_single shl bp_TGScannerConfig_skip_comment_single) and bm_TGScannerConfig_skip_comment_single);
end;

function scan_comment_multi(var a : TGScannerConfig) : Tguint;
begin
  scan_comment_multi:=(a.flag0 and bm_TGScannerConfig_scan_comment_multi) shr bp_TGScannerConfig_scan_comment_multi;
end;

procedure set_scan_comment_multi(var a : TGScannerConfig; __scan_comment_multi : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_comment_multi shl bp_TGScannerConfig_scan_comment_multi) and bm_TGScannerConfig_scan_comment_multi);
end;

function scan_identifier(var a : TGScannerConfig) : Tguint;
begin
  scan_identifier:=(a.flag0 and bm_TGScannerConfig_scan_identifier) shr bp_TGScannerConfig_scan_identifier;
end;

procedure set_scan_identifier(var a : TGScannerConfig; __scan_identifier : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_identifier shl bp_TGScannerConfig_scan_identifier) and bm_TGScannerConfig_scan_identifier);
end;

function scan_identifier_1char(var a : TGScannerConfig) : Tguint;
begin
  scan_identifier_1char:=(a.flag0 and bm_TGScannerConfig_scan_identifier_1char) shr bp_TGScannerConfig_scan_identifier_1char;
end;

procedure set_scan_identifier_1char(var a : TGScannerConfig; __scan_identifier_1char : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_identifier_1char shl bp_TGScannerConfig_scan_identifier_1char) and bm_TGScannerConfig_scan_identifier_1char);
end;

function scan_identifier_NULL(var a : TGScannerConfig) : Tguint;
begin
  scan_identifier_NULL:=(a.flag0 and bm_TGScannerConfig_scan_identifier_NULL) shr bp_TGScannerConfig_scan_identifier_NULL;
end;

procedure set_scan_identifier_NULL(var a : TGScannerConfig; __scan_identifier_NULL : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_identifier_NULL shl bp_TGScannerConfig_scan_identifier_NULL) and bm_TGScannerConfig_scan_identifier_NULL);
end;

function scan_symbols(var a : TGScannerConfig) : Tguint;
begin
  scan_symbols:=(a.flag0 and bm_TGScannerConfig_scan_symbols) shr bp_TGScannerConfig_scan_symbols;
end;

procedure set_scan_symbols(var a : TGScannerConfig; __scan_symbols : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_symbols shl bp_TGScannerConfig_scan_symbols) and bm_TGScannerConfig_scan_symbols);
end;

function scan_binary(var a : TGScannerConfig) : Tguint;
begin
  scan_binary:=(a.flag0 and bm_TGScannerConfig_scan_binary) shr bp_TGScannerConfig_scan_binary;
end;

procedure set_scan_binary(var a : TGScannerConfig; __scan_binary : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_binary shl bp_TGScannerConfig_scan_binary) and bm_TGScannerConfig_scan_binary);
end;

function scan_octal(var a : TGScannerConfig) : Tguint;
begin
  scan_octal:=(a.flag0 and bm_TGScannerConfig_scan_octal) shr bp_TGScannerConfig_scan_octal;
end;

procedure set_scan_octal(var a : TGScannerConfig; __scan_octal : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_octal shl bp_TGScannerConfig_scan_octal) and bm_TGScannerConfig_scan_octal);
end;

function scan_float(var a : TGScannerConfig) : Tguint;
begin
  scan_float:=(a.flag0 and bm_TGScannerConfig_scan_float) shr bp_TGScannerConfig_scan_float;
end;

procedure set_scan_float(var a : TGScannerConfig; __scan_float : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_float shl bp_TGScannerConfig_scan_float) and bm_TGScannerConfig_scan_float);
end;

function scan_hex(var a : TGScannerConfig) : Tguint;
begin
  scan_hex:=(a.flag0 and bm_TGScannerConfig_scan_hex) shr bp_TGScannerConfig_scan_hex;
end;

procedure set_scan_hex(var a : TGScannerConfig; __scan_hex : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_hex shl bp_TGScannerConfig_scan_hex) and bm_TGScannerConfig_scan_hex);
end;

function scan_hex_dollar(var a : TGScannerConfig) : Tguint;
begin
  scan_hex_dollar:=(a.flag0 and bm_TGScannerConfig_scan_hex_dollar) shr bp_TGScannerConfig_scan_hex_dollar;
end;

procedure set_scan_hex_dollar(var a : TGScannerConfig; __scan_hex_dollar : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_hex_dollar shl bp_TGScannerConfig_scan_hex_dollar) and bm_TGScannerConfig_scan_hex_dollar);
end;

function scan_string_sq(var a : TGScannerConfig) : Tguint;
begin
  scan_string_sq:=(a.flag0 and bm_TGScannerConfig_scan_string_sq) shr bp_TGScannerConfig_scan_string_sq;
end;

procedure set_scan_string_sq(var a : TGScannerConfig; __scan_string_sq : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_string_sq shl bp_TGScannerConfig_scan_string_sq) and bm_TGScannerConfig_scan_string_sq);
end;

function scan_string_dq(var a : TGScannerConfig) : Tguint;
begin
  scan_string_dq:=(a.flag0 and bm_TGScannerConfig_scan_string_dq) shr bp_TGScannerConfig_scan_string_dq;
end;

procedure set_scan_string_dq(var a : TGScannerConfig; __scan_string_dq : Tguint);
begin
  a.flag0:=a.flag0 or ((__scan_string_dq shl bp_TGScannerConfig_scan_string_dq) and bm_TGScannerConfig_scan_string_dq);
end;

function numbers_2_int(var a : TGScannerConfig) : Tguint;
begin
  numbers_2_int:=(a.flag0 and bm_TGScannerConfig_numbers_2_int) shr bp_TGScannerConfig_numbers_2_int;
end;

procedure set_numbers_2_int(var a : TGScannerConfig; __numbers_2_int : Tguint);
begin
  a.flag0:=a.flag0 or ((__numbers_2_int shl bp_TGScannerConfig_numbers_2_int) and bm_TGScannerConfig_numbers_2_int);
end;

function int_2_float(var a : TGScannerConfig) : Tguint;
begin
  int_2_float:=(a.flag0 and bm_TGScannerConfig_int_2_float) shr bp_TGScannerConfig_int_2_float;
end;

procedure set_int_2_float(var a : TGScannerConfig; __int_2_float : Tguint);
begin
  a.flag0:=a.flag0 or ((__int_2_float shl bp_TGScannerConfig_int_2_float) and bm_TGScannerConfig_int_2_float);
end;

function identifier_2_string(var a : TGScannerConfig) : Tguint;
begin
  identifier_2_string:=(a.flag0 and bm_TGScannerConfig_identifier_2_string) shr bp_TGScannerConfig_identifier_2_string;
end;

procedure set_identifier_2_string(var a : TGScannerConfig; __identifier_2_string : Tguint);
begin
  a.flag0:=a.flag0 or ((__identifier_2_string shl bp_TGScannerConfig_identifier_2_string) and bm_TGScannerConfig_identifier_2_string);
end;

function char_2_token(var a : TGScannerConfig) : Tguint;
begin
  char_2_token:=(a.flag0 and bm_TGScannerConfig_char_2_token) shr bp_TGScannerConfig_char_2_token;
end;

procedure set_char_2_token(var a : TGScannerConfig; __char_2_token : Tguint);
begin
  a.flag0:=a.flag0 or ((__char_2_token shl bp_TGScannerConfig_char_2_token) and bm_TGScannerConfig_char_2_token);
end;

function symbol_2_token(var a : TGScannerConfig) : Tguint;
begin
  symbol_2_token:=(a.flag0 and bm_TGScannerConfig_symbol_2_token) shr bp_TGScannerConfig_symbol_2_token;
end;

procedure set_symbol_2_token(var a : TGScannerConfig; __symbol_2_token : Tguint);
begin
  a.flag0:=a.flag0 or ((__symbol_2_token shl bp_TGScannerConfig_symbol_2_token) and bm_TGScannerConfig_symbol_2_token);
end;

function scope_0_fallback(var a : TGScannerConfig) : Tguint;
begin
  scope_0_fallback:=(a.flag0 and bm_TGScannerConfig_scope_0_fallback) shr bp_TGScannerConfig_scope_0_fallback;
end;

procedure set_scope_0_fallback(var a : TGScannerConfig; __scope_0_fallback : Tguint);
begin
  a.flag0:=a.flag0 or ((__scope_0_fallback shl bp_TGScannerConfig_scope_0_fallback) and bm_TGScannerConfig_scope_0_fallback);
end;

function store_int64(var a : TGScannerConfig) : Tguint;
begin
  store_int64:=(a.flag0 and bm_TGScannerConfig_store_int64) shr bp_TGScannerConfig_store_int64;
end;

procedure set_store_int64(var a : TGScannerConfig; __store_int64 : Tguint);
begin
  a.flag0:=a.flag0 or ((__store_int64 shl bp_TGScannerConfig_store_int64) and bm_TGScannerConfig_store_int64);
end;


end.
