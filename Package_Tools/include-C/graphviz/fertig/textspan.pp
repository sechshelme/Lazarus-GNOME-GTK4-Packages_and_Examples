
unit textspan;
interface

{
  Automatically converted by H2Pas 1.0.0 from textspan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    textspan.h
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
PPostscriptAlias  = ^PostscriptAlias;
Ptextfont_t  = ^textfont_t;
Ptextspan_t  = ^textspan_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $Id$ $Revision$  }
{ vim:set shiftwidth=4 ts=8:  }
{************************************************************************
 * Copyright (c) 2011 AT&T Intellectual Property 
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors: See CVS logs. Details at http://www.graphviz.org/
 ************************************************************************ }
{$ifndef TEXTSPAN_H}
{$define TEXTSPAN_H}
{ C++ extern C conditionnal removed }
{ Bold, Italic, Underline, Sup, Sub, Strike  }
{ Stored in textfont_t.flags, which is 7 bits, so full  }
{ Probably should be moved to textspan_t  }

const
  HTML_BF = 1 shl 0;  
  HTML_IF = 1 shl 1;  
  HTML_UL = 1 shl 2;  
  HTML_SUP = 1 shl 3;  
  HTML_SUB = 1 shl 4;  
  HTML_S = 1 shl 5;  
  HTML_OL = 1 shl 6;  
type
  PPostscriptAlias = ^TPostscriptAlias;
  TPostscriptAlias = record
      name : Pchar;
      family : Pchar;
      weight : Pchar;
      stretch : Pchar;
      style : Pchar;
      xfig_code : longint;
      svg_font_family : Pchar;
      svg_font_weight : Pchar;
      svg_font_style : Pchar;
    end;
{ font information
     * If name or color is NULL, or size < 0, that attribute
     * is unspecified. 
      }
{ HTML_UL, HTML_IF, HTML_BF, etc.  }
{ reference count  }

  Ptextfont_t = ^Ttextfont_t;
  Ttextfont_t = record
      name : Pchar;
      color : Pchar;
      postscript_alias : PPostscriptAlias;
      size : Tdouble;
      flag0 : word;
    end;

const
  bm_textfont_t_flags = $7F;
  bp_textfont_t_flags = 0;

function flags(var a : textfont_t) : dword;
procedure set_flags(var a : textfont_t; __flags : dword);
function cnt(var a : textfont_t) : dword;
procedure set_cnt(var a : textfont_t; __cnt : dword);
{ atomic unit of text emitted using a single htmlfont_t  }
{ stored in utf-8  }
{ FIXME - this is ugly  }
{ 'l' 'n' 'r'  }{ FIXME  }
type
  Ptextspan_t = ^Ttextspan_t;
  Ttextspan_t = record
      str : Pchar;
      font : Ptextfont_t;
      layout : pointer;
      free_layout : procedure (layout:pointer);cdecl;
      yoffset_layout : Tdouble;
      yoffset_centerline : Tdouble;
      size : Tpointf;
      just : char;
    end;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

function flags(var a : textfont_t) : dword;
begin
  flags:=(a.flag0 and bm_textfont_t_flags) shr bp_textfont_t_flags;
end;

procedure set_flags(var a : textfont_t; __flags : dword);
begin
  a.flag0:=a.flag0 or ((__flags shl bp_textfont_t_flags) and bm_textfont_t_flags);
end;

function cnt(var a : textfont_t) : dword;
begin
  cnt:=(a.flag0 and bm_textfont_t_cnt) shr bp_textfont_t_cnt;
end;

procedure set_cnt(var a : textfont_t; __cnt : dword);
begin
  a.flag0:=a.flag0 or ((__cnt shl bp_textfont_t_cnt) and bm_textfont_t_cnt);
end;


end.
