unit ges_operation;

interface

uses
  fp_glib2, fp_gst, ges_enums;

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

{GES_DECLARE_TYPE(Operation, operation, OPERATION); }
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


// === Konventiert am: 28-7-26 13:06:11 ===

function GES_TYPE_OPERATION: TGType;
function GES_OPERATION(obj: Pointer): PGESOperation;
function GES_IS_OPERATION(obj: Pointer): Tgboolean;
function GES_OPERATION_CLASS(klass: Pointer): PGESOperationClass;
function GES_IS_OPERATION_CLASS(klass: Pointer): Tgboolean;
function GES_OPERATION_GET_CLASS(obj: Pointer): PGESOperationClass;

implementation

function GES_TYPE_OPERATION: TGType;
begin
  Result := ges_operation_get_type;
end;

function GES_OPERATION(obj: Pointer): PGESOperation;
begin
  Result := PGESOperation(g_type_check_instance_cast(obj, GES_TYPE_OPERATION));
end;

function GES_IS_OPERATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_OPERATION);
end;

function GES_OPERATION_CLASS(klass: Pointer): PGESOperationClass;
begin
  Result := PGESOperationClass(g_type_check_class_cast(klass, GES_TYPE_OPERATION));
end;

function GES_IS_OPERATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_OPERATION);
end;

function GES_OPERATION_GET_CLASS(obj: Pointer): PGESOperationClass;
begin
  Result := PGESOperationClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESOperationPrivate = type Pointer

function ges_operation_get_type: TGType; cdecl; external libgxxxxxxx;



end.
