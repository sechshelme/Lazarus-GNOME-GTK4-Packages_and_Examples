unit gmime_filter_best;

interface

uses
  fp_glib2, fp_gmime3;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
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
{$ifndef __GMIME_FILTER_BEST_H__}
{$define __GMIME_FILTER_BEST_H__}
{$include <gmime/gmime-encodings.h>}
{$include <gmime/gmime-filter.h>}
{$include <gmime/gmime-charset.h>}
{$include <gmime/gmime-utils.h>}

type
{*
 * GMimeFilterBestFlags:
 * @GMIME_FILTER_BEST_CHARSET: Enable best-charset detection.
 * @GMIME_FILTER_BEST_ENCODING: Enable best-encoding detection.
 *
 * Bit flags to enable charset and/or encoding scanning to make
 * educated guesses as to what the best charset and/or encodings to
 * use for the content passed through the filter.
 * }

  PGMimeFilterBestFlags = ^TGMimeFilterBestFlags;
  TGMimeFilterBestFlags =  Longint;
  Const
    GMIME_FILTER_BEST_CHARSET = 1 shl 0;
    GMIME_FILTER_BEST_ENCODING = 1 shl 1;
;
{*
 * GMimeFilterBest:
 * @parent_object: parent #GMimeFilter
 * @flags: #GMimeFilterBestFlags
 * @charset: #GMimeCharset state
 * @count0: count of nul-bytes passed through the filter
 * @count8: count of 8bit bytes passed through the filter
 * @total: total number of bytes passed through the filter
 * @maxline: the length of the longest line passed through the filter
 * @linelen: current line length
 * @frombuf: buffer for checking From_ lines
 * @fromlen: length of bytes in @frombuf
 * @hadfrom: %TRUE if any line started with "From "
 * @startline: start line state
 * @midline: mid-line state
 *
 * A filter for calculating the best encoding and/or charset to encode
 * the data passed through it.
 * }
{ for best charset detection  }
{ for best encoding detection  }
{ count of null bytes  }
{ count of 8bit bytes  }
{ total octets  }
{ longest line length  }
{ current line length  }
type
  PGMimeFilterBest = ^TGMimeFilterBest;
  TGMimeFilterBest = record
      parent_object : TGMimeFilter;
      flags : TGMimeFilterBestFlags;
      charset : TGMimeCharset;
      count0 : dword;
      count8 : dword;
      total : dword;
      maxline : dword;
      linelen : dword;
      frombuf : array[0..5] of byte;
      flag0 : word;
    end;


const
  bm_TGMimeFilterBest_fromlen = $F;
  bp_TGMimeFilterBest_fromlen = 0;
  bm_TGMimeFilterBest_hadfrom = $10;
  bp_TGMimeFilterBest_hadfrom = 4;
  bm_TGMimeFilterBest_startline = $20;
  bp_TGMimeFilterBest_startline = 5;
  bm_TGMimeFilterBest_midline = $40;
  bp_TGMimeFilterBest_midline = 6;

function fromlen(var a : TGMimeFilterBest) : dword;
procedure set_fromlen(var a : TGMimeFilterBest; __fromlen : dword);
function hadfrom(var a : TGMimeFilterBest) : dword;
procedure set_hadfrom(var a : TGMimeFilterBest; __hadfrom : dword);
function startline(var a : TGMimeFilterBest) : dword;
procedure set_startline(var a : TGMimeFilterBest; __startline : dword);
function midline(var a : TGMimeFilterBest) : dword;
procedure set_midline(var a : TGMimeFilterBest; __midline : dword);
type
  PGMimeFilterBestClass = ^TGMimeFilterBestClass;
  TGMimeFilterBestClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_best_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_best_new(flags:TGMimeFilterBestFlags):PGMimeFilter;cdecl;external libgmime3;
function g_mime_filter_best_charset(best:PGMimeFilterBest):Pchar;cdecl;external libgmime3;
function g_mime_filter_best_encoding(best:PGMimeFilterBest; constraint:TGMimeEncodingConstraint):TGMimeContentEncoding;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_BEST_H__  }

// === Konventiert am: 18-9-25 15:27:13 ===

function GMIME_TYPE_FILTER_BEST : TGType;
function GMIME_FILTER_BEST(obj : Pointer) : PGMimeFilterBest;
function GMIME_FILTER_BEST_CLASS(klass : Pointer) : PGMimeFilterBestClass;
function GMIME_IS_FILTER_BEST(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_BEST_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_BEST_GET_CLASS(obj : Pointer) : PGMimeFilterBestClass;

implementation

function GMIME_TYPE_FILTER_BEST : TGType;
  begin
    GMIME_TYPE_FILTER_BEST:=g_mime_filter_best_get_type;
  end;

function GMIME_FILTER_BEST(obj : Pointer) : PGMimeFilterBest;
begin
  Result := PGMimeFilterBest(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_BEST));
end;

function GMIME_FILTER_BEST_CLASS(klass : Pointer) : PGMimeFilterBestClass;
begin
  Result := PGMimeFilterBestClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_BEST));
end;

function GMIME_IS_FILTER_BEST(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_BEST);
end;

function GMIME_IS_FILTER_BEST_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_BEST);
end;

function GMIME_FILTER_BEST_GET_CLASS(obj : Pointer) : PGMimeFilterBestClass;
begin
  Result := PGMimeFilterBestClass(PGTypeInstance(obj)^.g_class);
end;


function fromlen(var a : TGMimeFilterBest) : dword;
begin
  fromlen:=(a.flag0 and bm_TGMimeFilterBest_fromlen) shr bp_TGMimeFilterBest_fromlen;
end;

procedure set_fromlen(var a : TGMimeFilterBest; __fromlen : dword);
begin
  a.flag0:=a.flag0 or ((__fromlen shl bp_TGMimeFilterBest_fromlen) and bm_TGMimeFilterBest_fromlen);
end;

function hadfrom(var a : TGMimeFilterBest) : dword;
begin
  hadfrom:=(a.flag0 and bm_TGMimeFilterBest_hadfrom) shr bp_TGMimeFilterBest_hadfrom;
end;

procedure set_hadfrom(var a : TGMimeFilterBest; __hadfrom : dword);
begin
  a.flag0:=a.flag0 or ((__hadfrom shl bp_TGMimeFilterBest_hadfrom) and bm_TGMimeFilterBest_hadfrom);
end;

function startline(var a : TGMimeFilterBest) : dword;
begin
  startline:=(a.flag0 and bm_TGMimeFilterBest_startline) shr bp_TGMimeFilterBest_startline;
end;

procedure set_startline(var a : TGMimeFilterBest; __startline : dword);
begin
  a.flag0:=a.flag0 or ((__startline shl bp_TGMimeFilterBest_startline) and bm_TGMimeFilterBest_startline);
end;

function midline(var a : TGMimeFilterBest) : dword;
begin
  midline:=(a.flag0 and bm_TGMimeFilterBest_midline) shr bp_TGMimeFilterBest_midline;
end;

procedure set_midline(var a : TGMimeFilterBest; __midline : dword);
begin
  a.flag0:=a.flag0 or ((__midline shl bp_TGMimeFilterBest_midline) and bm_TGMimeFilterBest_midline);
end;


end.
