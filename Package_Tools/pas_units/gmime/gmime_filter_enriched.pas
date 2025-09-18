unit gmime_filter_enriched;

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
{$ifndef __GMIME_FILTER_ENRICHED_H__}
{$define __GMIME_FILTER_ENRICHED_H__}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMIME_FILTER_ENRICHED_IS_RICHTEXT:
 *
 * A bit flag for g_mime_filter_enriched_new() which signifies that
 * the filter should expect Rich Text (aka RTF).
 * }

const
  GMIME_FILTER_ENRICHED_IS_RICHTEXT = 1 shl 0;  
{*
 * GMimeFilterEnriched:
 * @parent_object: parent #GMimeFilter
 * @flags: bit flags
 * @nofill: nofill tag state
 *
 * A filter for converting text/enriched or text/richtext textual
 * streams into text/html.
 * }
type
  PGMimeFilterEnriched = ^TGMimeFilterEnriched;
  TGMimeFilterEnriched = record
      parent_object : TGMimeFilter;
      flags : Tguint32;
      nofill : longint;
    end;

  PGMimeFilterEnrichedClass = ^TGMimeFilterEnrichedClass;
  TGMimeFilterEnrichedClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_enriched_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_enriched_new(flags:Tguint32):PGMimeFilter;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_ENRICHED_H__  }

// === Konventiert am: 18-9-25 15:27:34 ===

function GMIME_TYPE_FILTER_ENRICHED : TGType;
function GMIME_FILTER_ENRICHED(obj : Pointer) : PGMimeFilterEnriched;
function GMIME_FILTER_ENRICHED_CLASS(klass : Pointer) : PGMimeFilterEnrichedClass;
function GMIME_IS_FILTER_ENRICHED(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_ENRICHED_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_ENRICHED_GET_CLASS(obj : Pointer) : PGMimeFilterEnrichedClass;

implementation

function GMIME_TYPE_FILTER_ENRICHED : TGType;
  begin
    GMIME_TYPE_FILTER_ENRICHED:=g_mime_filter_enriched_get_type;
  end;

function GMIME_FILTER_ENRICHED(obj : Pointer) : PGMimeFilterEnriched;
begin
  Result := PGMimeFilterEnriched(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_ENRICHED));
end;

function GMIME_FILTER_ENRICHED_CLASS(klass : Pointer) : PGMimeFilterEnrichedClass;
begin
  Result := PGMimeFilterEnrichedClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_ENRICHED));
end;

function GMIME_IS_FILTER_ENRICHED(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_ENRICHED);
end;

function GMIME_IS_FILTER_ENRICHED_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_ENRICHED);
end;

function GMIME_FILTER_ENRICHED_GET_CLASS(obj : Pointer) : PGMimeFilterEnrichedClass;
begin
  Result := PGMimeFilterEnrichedClass(PGTypeInstance(obj)^.g_class);
end;



end.
