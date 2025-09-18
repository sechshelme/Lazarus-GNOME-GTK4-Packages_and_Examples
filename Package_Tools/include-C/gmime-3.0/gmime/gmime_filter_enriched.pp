
unit gmime_filter_enriched;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_filter_enriched.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_filter_enriched.h
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
PGMimeFilter  = ^GMimeFilter;
PGMimeFilterEnriched  = ^GMimeFilterEnriched;
PGMimeFilterEnrichedClass  = ^GMimeFilterEnrichedClass;
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

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_ENRICHED : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_ENRICHED(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_ENRICHED_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_ENRICHED(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_ENRICHED_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_ENRICHED_GET_CLASS(obj : longint) : longint;

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


function g_mime_filter_enriched_get_type:TGType;cdecl;external;
function g_mime_filter_enriched_new(flags:Tguint32):PGMimeFilter;cdecl;external;
{$endif}
{ __GMIME_FILTER_ENRICHED_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_FILTER_ENRICHED : longint; { return type might be wrong }
  begin
    GMIME_TYPE_FILTER_ENRICHED:=g_mime_filter_enriched_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_ENRICHED(obj : longint) : longint;
begin
  GMIME_FILTER_ENRICHED:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_FILTER_ENRICHED,GMimeFilterEnriched);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_ENRICHED_CLASS(klass : longint) : longint;
begin
  GMIME_FILTER_ENRICHED_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_FILTER_ENRICHED,GMimeFilterEnrichedClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_ENRICHED(obj : longint) : longint;
begin
  GMIME_IS_FILTER_ENRICHED:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_FILTER_ENRICHED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_ENRICHED_CLASS(klass : longint) : longint;
begin
  GMIME_IS_FILTER_ENRICHED_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_FILTER_ENRICHED);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_ENRICHED_GET_CLASS(obj : longint) : longint;
begin
  GMIME_FILTER_ENRICHED_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_FILTER_ENRICHED,GMimeFilterEnrichedClass);
end;


end.
