
unit ges_operation;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_operation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_operation.h
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
PGESOperation  = ^GESOperation;
PGESOperationClass  = ^GESOperationClass;
PGESOperationPrivate  = ^GESOperationPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2009 Edward Hervey <edward.hervey@collabora.co.uk>
 *               2009 Nokia Corporation
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
{$include <gst/gst.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-track-element.h>}

{ was #define dname def_expr }
function GES_TYPE_OPERATION : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Operation, operation, OPERATION); }
{*
 * GESOperation:
 *
 * Base class for overlays, transitions, and effects
  }
{< private > }
{ Padding for API extension  }
type
  PGESOperation = ^TGESOperation;
  TGESOperation = record
      parent : TGESTrackElement;
      priv : PGESOperationPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESOperationClass:
  }
{< private > }
{< private > }
{ Padding for API extension  }
  PGESOperationClass = ^TGESOperationClass;
  TGESOperationClass = record
      parent_class : TGESTrackElementClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


implementation

{ was #define dname def_expr }
function GES_TYPE_OPERATION : longint; { return type might be wrong }
  begin
    GES_TYPE_OPERATION:=ges_operation_get_type;
  end;


end.
