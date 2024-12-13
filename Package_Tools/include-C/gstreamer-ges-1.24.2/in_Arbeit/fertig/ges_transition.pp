
unit ges_transition;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_transition.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_transition.h
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
PGESTransition  = ^GESTransition;
PGESTransitionClass  = ^GESTransitionClass;
PGESTransitionPrivate  = ^GESTransitionPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon@collabora.co.uk>
 *               2010 Nokia Corporation
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
{$include <gst/controller/gstinterpolationcontrolsource.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-operation.h>}

{ was #define dname def_expr }
function GES_TYPE_TRANSITION : longint; { return type might be wrong }

{GES_DECLARE_TYPE (Transition, transition, TRANSITION); }
{*
 * GESTransition:
 *
 * Base class for media transitions.
  }
{< private > }
{ Padding for API extension  }
type
  PGESTransition = ^TGESTransition;
  TGESTransition = record
      parent : TGESOperation;
      priv : PGESTransitionPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESTransitionClass:
  }
{< private > }
{< private > }
{ Padding for API extension  }
  PGESTransitionClass = ^TGESTransitionClass;
  TGESTransitionClass = record
      parent_class : TGESOperationClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


implementation

{ was #define dname def_expr }
function GES_TYPE_TRANSITION : longint; { return type might be wrong }
  begin
    GES_TYPE_TRANSITION:=ges_transition_get_type;
  end;


end.
