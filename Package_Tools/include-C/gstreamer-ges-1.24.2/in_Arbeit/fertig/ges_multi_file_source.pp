
unit ges_multi_file_source;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_multi_file_source.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_multi_file_source.h
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
Pgchar  = ^gchar;
PGESMultiFileSource  = ^GESMultiFileSource;
PGESMultiFileSourceClass  = ^GESMultiFileSourceClass;
PGESMultiFileSourcePrivate  = ^GESMultiFileSourcePrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2013 Lubosz Sarnecki <lubosz@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-video-source.h>}

{ was #define dname def_expr }
function GES_TYPE_MULTI_FILE_SOURCE : longint; { return type might be wrong }

{GES_DECLARE_TYPE (MultiFileSource, multi_file_source, MULTI_FILE_SOURCE); }
{*
 * GESMultiFileSource:
  }
{< private >  }
{ Padding for API extension  }
type
  PGESMultiFileSource = ^TGESMultiFileSource;
  TGESMultiFileSource = record
      parent : TGESVideoSource;
      uri : Pgchar;
      priv : PGESMultiFileSourcePrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{ Padding for API extension  }
  PGESMultiFileSourceClass = ^TGESMultiFileSourceClass;
  TGESMultiFileSourceClass = record
      parent_class : TGESVideoSourceClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_multi_file_source_new(uri:Pgchar):PGESMultiFileSource;cdecl;external;
const
  GES_MULTI_FILE_URI_PREFIX = 'multifile://';  

implementation

{ was #define dname def_expr }
function GES_TYPE_MULTI_FILE_SOURCE : longint; { return type might be wrong }
  begin
    GES_TYPE_MULTI_FILE_SOURCE:=ges_multi_file_source_get_type;
  end;


end.
