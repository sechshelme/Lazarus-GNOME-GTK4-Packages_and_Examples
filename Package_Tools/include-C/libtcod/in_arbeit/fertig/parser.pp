
unit parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    parser.h
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
PTCOD_dice_t  = ^TCOD_dice_t;
PTCOD_lex_t  = ^TCOD_lex_t;
PTCOD_Parser  = ^TCOD_Parser;
PTCOD_parser_int_t  = ^TCOD_parser_int_t;
PTCOD_parser_listener_t  = ^TCOD_parser_listener_t;
PTCOD_parser_struct_t  = ^TCOD_parser_struct_t;
PTCOD_parser_t  = ^TCOD_parser_t;
PTCOD_ParserStruct  = ^TCOD_ParserStruct;
PTCOD_struct_int_t  = ^TCOD_struct_int_t;
PTCOD_value_t  = ^TCOD_value_t;
PTCOD_value_type_t  = ^TCOD_value_type_t;
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
{$ifndef _TCOD_PARSER_H}
{$define _TCOD_PARSER_H}
{$include "color.h"}
{$include "lex.h"}
{$include "list.h"}
{$include "mersenne.h"}
{$include "portability.h"}
{ C++ extern C conditionnal removed }
{ generic type  }
type
  PTCOD_value_type_t = ^TTCOD_value_type_t;
  TTCOD_value_type_t =  Longint;
  Const
    TCOD_TYPE_NONE = 0;
    TCOD_TYPE_BOOL = 1;
    TCOD_TYPE_CHAR = 2;
    TCOD_TYPE_INT = 3;
    TCOD_TYPE_FLOAT = 4;
    TCOD_TYPE_STRING = 5;
    TCOD_TYPE_COLOR = 6;
    TCOD_TYPE_DICE = 7;
    TCOD_TYPE_VALUELIST00 = 8;
    TCOD_TYPE_VALUELIST01 = 9;
    TCOD_TYPE_VALUELIST02 = 10;
    TCOD_TYPE_VALUELIST03 = 11;
    TCOD_TYPE_VALUELIST04 = 12;
    TCOD_TYPE_VALUELIST05 = 13;
    TCOD_TYPE_VALUELIST06 = 14;
    TCOD_TYPE_VALUELIST07 = 15;
    TCOD_TYPE_VALUELIST08 = 16;
    TCOD_TYPE_VALUELIST09 = 17;
    TCOD_TYPE_VALUELIST10 = 18;
    TCOD_TYPE_VALUELIST11 = 19;
    TCOD_TYPE_VALUELIST12 = 20;
    TCOD_TYPE_VALUELIST13 = 21;
    TCOD_TYPE_VALUELIST14 = 22;
    TCOD_TYPE_VALUELIST15 = 23;
    TCOD_TYPE_CUSTOM00 = 24;
    TCOD_TYPE_CUSTOM01 = 25;
    TCOD_TYPE_CUSTOM02 = 26;
    TCOD_TYPE_CUSTOM03 = 27;
    TCOD_TYPE_CUSTOM04 = 28;
    TCOD_TYPE_CUSTOM05 = 29;
    TCOD_TYPE_CUSTOM06 = 30;
    TCOD_TYPE_CUSTOM07 = 31;
    TCOD_TYPE_CUSTOM08 = 32;
    TCOD_TYPE_CUSTOM09 = 33;
    TCOD_TYPE_CUSTOM10 = 34;
    TCOD_TYPE_CUSTOM11 = 35;
    TCOD_TYPE_CUSTOM12 = 36;
    TCOD_TYPE_CUSTOM13 = 37;
    TCOD_TYPE_CUSTOM14 = 38;
    TCOD_TYPE_CUSTOM15 = 39;
    TCOD_TYPE_LIST = 1024;
;
{ generic value  }
type
  PTCOD_value_t = ^TTCOD_value_t;
  TTCOD_value_t = record
      case longint of
        0 : ( b : Tbool );
        1 : ( c : char );
        2 : ( i : Tint32_t );
        3 : ( f : single );
        4 : ( s : Pchar );
        5 : ( col : TTCOD_color_t );
        6 : ( dice : TTCOD_dice_t );
        7 : ( list : TTCOD_list_t );
        8 : ( custom : pointer );
      end;
{ parser structures  }
  PTCOD_ParserStruct = ^TTCOD_ParserStruct;
  TTCOD_ParserStruct = record
      {undefined structure}
    end;


  PTCOD_parser_struct_t = ^TTCOD_parser_struct_t;
  TTCOD_parser_struct_t = PTCOD_ParserStruct;
(* Const before type ignored *)

function TCOD_struct_get_name(def:TTCOD_parser_struct_t):Pchar;cdecl;external;
(* Const before type ignored *)
procedure TCOD_struct_add_property(def:TTCOD_parser_struct_t; name:Pchar; _type:TTCOD_value_type_t; mandatory:Tbool);cdecl;external;
(* Const before type ignored *)
procedure TCOD_struct_add_list_property(def:TTCOD_parser_struct_t; name:Pchar; _type:TTCOD_value_type_t; mandatory:Tbool);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure TCOD_struct_add_value_list(def:TTCOD_parser_struct_t; name:Pchar; value_list:PPchar; mandatory:Tbool);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure TCOD_struct_add_value_list_sized(def:TTCOD_parser_struct_t; name:Pchar; value_list:PPchar; size:longint; mandatory:Tbool);cdecl;external;
(* Const before type ignored *)
procedure TCOD_struct_add_flag(def:TTCOD_parser_struct_t; propname:Pchar);cdecl;external;
procedure TCOD_struct_add_structure(def:TTCOD_parser_struct_t; sub_structure:TTCOD_parser_struct_t);cdecl;external;
(* Const before type ignored *)
function TCOD_struct_is_mandatory(def:TTCOD_parser_struct_t; propname:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function TCOD_struct_get_type(def:TTCOD_parser_struct_t; propname:Pchar):TTCOD_value_type_t;cdecl;external;
{ parser listener  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  PTCOD_parser_listener_t = ^TTCOD_parser_listener_t;
  TTCOD_parser_listener_t = record
      new_struct : function (str:TTCOD_parser_struct_t; name:Pchar):Tbool;cdecl;
      new_flag : function (name:Pchar):Tbool;cdecl;
      new_property : function (propname:Pchar; _type:TTCOD_value_type_t; value:TTCOD_value_t):Tbool;cdecl;
      end_struct : function (str:TTCOD_parser_struct_t; name:Pchar):Tbool;cdecl;
      error : procedure (msg:Pchar);cdecl;
    end;
{ a custom type parser  }

  TTCOD_parser_custom_t = function (lex:PTCOD_lex_t; listener:PTCOD_parser_listener_t; str:TTCOD_parser_struct_t; propname:Pchar):TTCOD_value_t;cdecl;
{ the parser  }
  PTCOD_Parser = ^TTCOD_Parser;
  TTCOD_Parser = record
      {undefined structure}
    end;


  PTCOD_parser_t = ^TTCOD_parser_t;
  TTCOD_parser_t = PTCOD_Parser;

function TCOD_parser_new:TTCOD_parser_t;cdecl;external;
(* Const before type ignored *)
function TCOD_parser_new_struct(parser:TTCOD_parser_t; name:Pchar):TTCOD_parser_struct_t;cdecl;external;
function TCOD_parser_new_custom_type(parser:TTCOD_parser_t; custom_type_parser:TTCOD_parser_custom_t):TTCOD_value_type_t;cdecl;external;
(* Const before type ignored *)
procedure TCOD_parser_run(parser:TTCOD_parser_t; filename:Pchar; listener:PTCOD_parser_listener_t);cdecl;external;
procedure TCOD_parser_delete(parser:TTCOD_parser_t);cdecl;external;
{ error during parsing. can be called by the parser listener  }
(* Const before type ignored *)
procedure TCOD_parser_error(msg:Pchar; args:array of const);cdecl;external;
procedure TCOD_parser_error(msg:Pchar);cdecl;external;
{ default parser listener  }
(* Const before type ignored *)
function TCOD_parser_has_property(parser:TTCOD_parser_t; name:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function TCOD_parser_get_bool_property(parser:TTCOD_parser_t; name:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function TCOD_parser_get_char_property(parser:TTCOD_parser_t; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function TCOD_parser_get_int_property(parser:TTCOD_parser_t; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function TCOD_parser_get_float_property(parser:TTCOD_parser_t; name:Pchar):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TCOD_parser_get_string_property(parser:TTCOD_parser_t; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function TCOD_parser_get_color_property(parser:TTCOD_parser_t; name:Pchar):TTCOD_color_t;cdecl;external;
(* Const before type ignored *)
function TCOD_parser_get_dice_property(parser:TTCOD_parser_t; name:Pchar):TTCOD_dice_t;cdecl;external;
(* Const before type ignored *)
procedure TCOD_parser_get_dice_property_py(parser:TTCOD_parser_t; name:Pchar; dice:PTCOD_dice_t);cdecl;external;
(* Const before type ignored *)
function TCOD_parser_get_custom_property(parser:TTCOD_parser_t; name:Pchar):pointer;cdecl;external;
(* Const before type ignored *)
function TCOD_parser_get_list_property(parser:TTCOD_parser_t; name:Pchar; _type:TTCOD_value_type_t):TTCOD_list_t;cdecl;external;
{ parser internals (may be used by custom type parsers)  }
{ parser structures  }
{ entity type name  }
{ list of flags  }
{ list of properties (name, type, mandatory)  }
{ list of value lists  }
{ list of sub-structures  }
type
  PTCOD_ParserStruct = ^TTCOD_ParserStruct;
  TTCOD_ParserStruct = record
      name : Pchar;
      flags : TTCOD_list_t;
      props : TTCOD_list_t;
      lists : TTCOD_list_t;
      structs : TTCOD_list_t;
    end;
  TTCOD_struct_int_t = TTCOD_ParserStruct;
  PTCOD_struct_int_t = ^TTCOD_struct_int_t;
{ the parser  }
{ list of structures  }
{ list of custom type parsers  }
{ fatal error occurred  }
{ list of properties if default listener is used  }

  PTCOD_Parser = ^TTCOD_Parser;
  TTCOD_Parser = record
      structs : TTCOD_list_t;
      customs : array[0..15] of TTCOD_parser_custom_t;
      fatal : Tbool;
      props : TTCOD_list_t;
    end;
  TTCOD_parser_int_t = TTCOD_Parser;
  PTCOD_parser_int_t = ^TTCOD_parser_int_t;

function TCOD_parse_bool_value:TTCOD_value_t;cdecl;external;
function TCOD_parse_char_value:TTCOD_value_t;cdecl;external;
function TCOD_parse_integer_value:TTCOD_value_t;cdecl;external;
function TCOD_parse_float_value:TTCOD_value_t;cdecl;external;
function TCOD_parse_string_value:TTCOD_value_t;cdecl;external;
function TCOD_parse_color_value:TTCOD_value_t;cdecl;external;
function TCOD_parse_dice_value:TTCOD_value_t;cdecl;external;
function TCOD_parse_value_list_value(def:PTCOD_struct_int_t; listnum:longint):TTCOD_value_t;cdecl;external;
function TCOD_parse_property_value(parser:PTCOD_parser_int_t; def:TTCOD_parser_struct_t; propname:Pchar; list:Tbool):TTCOD_value_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
