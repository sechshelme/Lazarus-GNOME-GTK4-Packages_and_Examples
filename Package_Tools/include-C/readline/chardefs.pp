
unit chardefs;
interface

{
  Automatically converted by H2Pas 1.0.0 from chardefs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    chardefs.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ chardefs.h -- Character definitions for readline.  }
{ Copyright (C) 1994-2021 Free Software Foundation, Inc.

   This file is part of the GNU Readline Library (Readline), a library
   for reading lines of text with interactive input and history editing.

   Readline is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   Readline is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with Readline.  If not, see <http://www.gnu.org/licenses/>.
 }
{$ifndef _CHARDEFS_H_}
{$define _CHARDEFS_H_}
{$include <ctype.h>}
{$include <string.h>}
{$ifndef whitespace}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function whitespace(c : longint) : longint;

{$endif}
{ Some character stuff.  }
{ Smaller than this is control.  }

const
  control_character_threshold = $020;  
{ 0x20 - 1  }
  control_character_mask = $1f;  
{ Larger than this is Meta.  }
  meta_character_threshold = $07f;  
{ 0x000000, must be off.  }
  control_character_bit = $40;  
{ x0000000, must be on.  }
  meta_character_bit = $080;  
{ Largest character value.  }
  largest_char = 255;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function CTRL_CHAR(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function META_CHAR(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function CTRL(c : longint) : Tc;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function META(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function UNMETA(c : longint) : Tc;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function UNCTRL(c : longint) : longint;

{$ifndef UCHAR_MAX}

const
  UCHAR_MAX = 255;  
{$endif}
{$ifndef CHAR_MAX}

const
  CHAR_MAX = 127;  
{$endif}
{ use this as a proxy for C89  }
{$if defined (HAVE_STDLIB_H) && defined (HAVE_STRING_H)}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IN_CTYPE_DOMAIN(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NON_NEGATIVE(c : longint) : longint;

{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IN_CTYPE_DOMAIN(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NON_NEGATIVE(c : longint) : longint;

{$endif}
{$if !defined (isxdigit) && !defined (HAVE_ISXDIGIT) && !defined (__cplusplus)}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function isxdigit(c : longint) : longint;

{$endif}
{ Some systems define these; we want our definitions.  }
{$undef ISPRINT}
{ Beware:  these only work with single-byte ASCII characters.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ISALNUM(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISALPHA(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISDIGIT(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISLOWER(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISPRINT(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISUPPER(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISXDIGIT(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_lowercase_p(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_uppercase_p(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_digit_p(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_alphabetic_p(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_pure_alphabetic(c : longint) : longint;

{$ifndef _rl_to_upper}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function _rl_to_upper(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_to_lower(c : longint) : longint;

{$endif}
{$ifndef _rl_digit_value}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function _rl_digit_value(x : longint) : Tx;

{$endif}
{$ifndef _rl_isident}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function _rl_isident(c : longint) : longint;

{$endif}
{$ifndef ISOCTAL}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ISOCTAL(c : longint) : longint;

{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function OCTVALUE(c : longint) : Tc;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HEXVALUE(c : longint) : longint;

{$ifndef NEWLINE}

const
  NEWLINE = '\n';  
{$endif}
{$ifndef RETURN}

{ was #define dname def_expr }
function RETURN : longint; { return type might be wrong }

{$endif}
{$ifndef RUBOUT}

const
  RUBOUT = $7f;  
{$endif}
{$ifndef TAB}

const
  TAB = '\t';  
{$endif}
{$ifdef ABORT_CHAR}
{$undef ABORT_CHAR}
{$endif}

{ was #define dname def_expr }
function ABORT_CHAR : longint; { return type might be wrong }

{$ifdef PAGE}
{$undef PAGE}
{$endif}

{ was #define dname def_expr }
function PAGE : longint; { return type might be wrong }

{$ifdef SPACE}
{$undef SPACE}
{$endif}
{ XXX - was 0x20  }

const
  SPACE = ' ';  
{$ifdef ESC}
{$undef ESC}
{$endif}

{ was #define dname def_expr }
function ESC : longint; { return type might be wrong }

{$endif}
{ _CHARDEFS_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function whitespace(c : longint) : longint;
begin
  whitespace:=(c=' ') or (c='\t');
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CTRL_CHAR(c : longint) : longint;
begin
  CTRL_CHAR:=c<(control_character_threshold and (@((Tc(@($80)))=0)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function META_CHAR(c : longint) : longint;
begin
  META_CHAR:=(c>(meta_character_threshold and (@(c))))<=largest_char;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function CTRL(c : longint) : Tc;
begin
  CTRL:=Tc(@(control_character_mask));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function META(c : longint) : longint;
begin
  META:=c or meta_character_bit;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function UNMETA(c : longint) : Tc;
begin
  UNMETA:=Tc(@( not (meta_character_bit)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function UNCTRL(c : longint) : longint;
begin
  UNCTRL:=_rl_to_upper(c or control_character_bit);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_CTYPE_DOMAIN(c : longint) : longint;
begin
  IN_CTYPE_DOMAIN:=1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NON_NEGATIVE(c : longint) : longint;
begin
  NON_NEGATIVE:=1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_CTYPE_DOMAIN(c : longint) : longint;
begin
  IN_CTYPE_DOMAIN:=(c>=(0 and (@(c))))<=CHAR_MAX;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NON_NEGATIVE(c : longint) : longint;
begin
  NON_NEGATIVE:=(byte(c))=c;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function isxdigit(c : longint) : longint;
begin
  isxdigit:=((isdigit(byte(c))) or ((c>=('a' and (@(c))))<='f')) or ((c>=('A' and (@(c))))<='F');
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISALNUM(c : longint) : longint;
begin
  ISALNUM:=(IN_CTYPE_DOMAIN(c)) and (@(isalnum(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISALPHA(c : longint) : longint;
begin
  ISALPHA:=(IN_CTYPE_DOMAIN(c)) and (@(isalpha(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISDIGIT(c : longint) : longint;
begin
  ISDIGIT:=(IN_CTYPE_DOMAIN(c)) and (@(isdigit(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISLOWER(c : longint) : longint;
begin
  ISLOWER:=(IN_CTYPE_DOMAIN(c)) and (@(islower(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISPRINT(c : longint) : longint;
begin
  ISPRINT:=(IN_CTYPE_DOMAIN(c)) and (@(isprint(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISUPPER(c : longint) : longint;
begin
  ISUPPER:=(IN_CTYPE_DOMAIN(c)) and (@(isupper(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISXDIGIT(c : longint) : longint;
begin
  ISXDIGIT:=(IN_CTYPE_DOMAIN(c)) and (@(isxdigit(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_lowercase_p(c : longint) : longint;
begin
  _rl_lowercase_p:=(NON_NEGATIVE(c)) and (@(ISLOWER(c)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_uppercase_p(c : longint) : longint;
begin
  _rl_uppercase_p:=(NON_NEGATIVE(c)) and (@(ISUPPER(c)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_digit_p(c : longint) : longint;
begin
  _rl_digit_p:=(c>=('0' and (@(c))))<='9';
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_alphabetic_p(c : longint) : longint;
begin
  _rl_alphabetic_p:=(NON_NEGATIVE(c)) and (@(ISALNUM(c)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_pure_alphabetic(c : longint) : longint;
begin
  _rl_pure_alphabetic:=(NON_NEGATIVE(c)) and (@(ISALPHA(c)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_to_upper(c : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if _rl_lowercase_p(c) then
    if_local1:=toupper(byte(c))
  else
    if_local1:=c;
  _rl_to_upper:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_to_lower(c : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if _rl_uppercase_p(c) then
    if_local1:=tolower(byte(c))
  else
    if_local1:=c;
  _rl_to_lower:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function _rl_digit_value(x : longint) : Tx;
begin
  _rl_digit_value:=Tx(-('0'));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_isident(c : longint) : longint;
begin
  _rl_isident:=((ISALNUM(c)) or c)='_';
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISOCTAL(c : longint) : longint;
begin
  ISOCTAL:=(c>=('0' and (@(c))))<='7';
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function OCTVALUE(c : longint) : Tc;
begin
  OCTVALUE:=Tc(-('0'));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HEXVALUE(c : longint) : longint;
var
   if_local1, if_local2 : longint;
(* result types are not known *)
begin
  if (c>=('a' and (@(c))))<='f' then
    if_local1:=(Tc(-('a')))+10
  else
    if_local1:=c;
  if 'F' then
    if_local2:=(Tc(-('A')))+10
  else
    if_local2:=Tc(-('0'));
  HEXVALUE:=((if_local1)>=('A' and (@(c))))<=(if_local2);
end;

{ was #define dname def_expr }
function RETURN : longint; { return type might be wrong }
  begin
    RETURN:=CTRL('M');
  end;

{ was #define dname def_expr }
function ABORT_CHAR : longint; { return type might be wrong }
  begin
    ABORT_CHAR:=CTRL('G');
  end;

{ was #define dname def_expr }
function PAGE : longint; { return type might be wrong }
  begin
    PAGE:=CTRL('L');
  end;

{ was #define dname def_expr }
function ESC : longint; { return type might be wrong }
  begin
    ESC:=CTRL('[');
  end;


end.
