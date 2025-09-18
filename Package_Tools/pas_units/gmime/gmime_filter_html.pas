unit gmime_filter_html;

interface

uses
  fp_glib2, fp_gmime3;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *  Copyright (C) 2016      Gaute Hope
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_FILTER_HTML_H__}
{$define __GMIME_FILTER_HTML_H__}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMIME_FILTER_HTML_PRE:
 *
 * Wrap stream in &lt;pre&gt; and &lt;/pre&gt; tags.
 * }

const
  GMIME_FILTER_HTML_PRE = 1 shl 0;  
{*
 * GMIME_FILTER_HTML_CONVERT_NL:
 *
 * Convert new-lines ('\n') into &lt;br&gt; tags.
 * }
  GMIME_FILTER_HTML_CONVERT_NL = 1 shl 1;  
{*
 * GMIME_FILTER_HTML_CONVERT_SPACES:
 *
 * Preserve whitespace by converting spaces into their appropriate
 * html entities.
 * }
  GMIME_FILTER_HTML_CONVERT_SPACES = 1 shl 2;  
{*
 * GMIME_FILTER_HTML_CONVERT_URLS:
 *
 * Wrap detected URLs in &lt;a href=...&gt; tags.
 * }
  GMIME_FILTER_HTML_CONVERT_URLS = 1 shl 3;  
{*
 * GMIME_FILTER_HTML_MARK_CITATION:
 *
 * Change the colour of citation text.
 * }
  GMIME_FILTER_HTML_MARK_CITATION = 1 shl 4;  
{*
 * GMIME_FILTER_HTML_CONVERT_ADDRESSES:
 *
 * Wrap email addresses in "mailto:" href tags.
 * }
  GMIME_FILTER_HTML_CONVERT_ADDRESSES = 1 shl 5;  
{*
 * GMIME_FILTER_HTML_ESCAPE_8BIT:
 *
 * Converts 8bit characters to '?'.
 * }
  GMIME_FILTER_HTML_ESCAPE_8BIT = 1 shl 6;  
{*
 * GMIME_FILTER_HTML_CITE:
 *
 * Cites text by prepending "&gt; " to each cited line.
 * }
  GMIME_FILTER_HTML_CITE = 1 shl 7;  
{*
 * GMIME_FILTER_HTML_BLOCKQUOTE_CITATION:
 *
 * Enclose citation text in blockquotes.
 * }
  GMIME_FILTER_HTML_BLOCKQUOTE_CITATION = 1 shl 8;  
{*
 * GMimeFilterHTML:
 * @parent_object: parent #GMimeFilter
 * @scanner: URL scanner state
 * @flags: flags specifying HTML conversion rules
 * @colour: cite colour
 * @column: current column
 * @pre_open: currently inside of a 'pre' tag.
 * @citation_depth: current citation depth level.
 *
 * A filter for converting text/plain into text/html.
 * }
type
  PGMimeFilterHTML = ^TGMimeFilterHTML;
  TGMimeFilterHTML = record
      parent_object : TGMimeFilter;
      scanner : PUrlScanner;
      flags : Tguint32;
      colour : Tguint32;
      flag0 : longint;
      citation_depth : Tguint32;
    end;


const
  bm_TGMimeFilterHTML_column = $7FFFFFFF;
  bp_TGMimeFilterHTML_column = 0;
  bm_TGMimeFilterHTML_pre_open = $80000000;
  bp_TGMimeFilterHTML_pre_open = 31;

function column(var a : TGMimeFilterHTML) : Tguint32;
procedure set_column(var a : TGMimeFilterHTML; __column : Tguint32);
function pre_open(var a : TGMimeFilterHTML) : Tguint32;
procedure set_pre_open(var a : TGMimeFilterHTML; __pre_open : Tguint32);
type
  PGMimeFilterHTMLClass = ^TGMimeFilterHTMLClass;
  TGMimeFilterHTMLClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_html_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_html_new(flags:Tguint32; colour:Tguint32):PGMimeFilter;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_HTML_H__  }

// === Konventiert am: 18-9-25 15:27:52 ===

function GMIME_TYPE_FILTER_HTML : TGType;
function GMIME_FILTER_HTML(obj : Pointer) : PGMimeFilterHTML;
function GMIME_FILTER_HTML_CLASS(klass : Pointer) : PGMimeFilterHTMLClass;
function GMIME_IS_FILTER_HTML(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_HTML_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_HTML_GET_CLASS(obj : Pointer) : PGMimeFilterHTMLClass;

implementation

function GMIME_TYPE_FILTER_HTML : TGType;
  begin
    GMIME_TYPE_FILTER_HTML:=g_mime_filter_html_get_type;
  end;

function GMIME_FILTER_HTML(obj : Pointer) : PGMimeFilterHTML;
begin
  Result := PGMimeFilterHTML(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_HTML));
end;

function GMIME_FILTER_HTML_CLASS(klass : Pointer) : PGMimeFilterHTMLClass;
begin
  Result := PGMimeFilterHTMLClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_HTML));
end;

function GMIME_IS_FILTER_HTML(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_HTML);
end;

function GMIME_IS_FILTER_HTML_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_HTML);
end;

function GMIME_FILTER_HTML_GET_CLASS(obj : Pointer) : PGMimeFilterHTMLClass;
begin
  Result := PGMimeFilterHTMLClass(PGTypeInstance(obj)^.g_class);
end;


function column(var a : TGMimeFilterHTML) : Tguint32;
begin
  column:=(a.flag0 and bm_TGMimeFilterHTML_column) shr bp_TGMimeFilterHTML_column;
end;

procedure set_column(var a : TGMimeFilterHTML; __column : Tguint32);
begin
  a.flag0:=a.flag0 or ((__column shl bp_TGMimeFilterHTML_column) and bm_TGMimeFilterHTML_column);
end;

function pre_open(var a : TGMimeFilterHTML) : Tguint32;
begin
  pre_open:=(a.flag0 and bm_TGMimeFilterHTML_pre_open) shr bp_TGMimeFilterHTML_pre_open;
end;

procedure set_pre_open(var a : TGMimeFilterHTML; __pre_open : Tguint32);
begin
  a.flag0:=a.flag0 or ((__pre_open shl bp_TGMimeFilterHTML_pre_open) and bm_TGMimeFilterHTML_pre_open);
end;


end.
