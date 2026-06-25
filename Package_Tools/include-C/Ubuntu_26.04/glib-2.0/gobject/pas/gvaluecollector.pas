unit gvaluecollector;

interface

uses
  fp_glib;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 1998-1999, 2000-2001 Tim Janik and Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * gvaluecollector.h: GValue varargs stubs
  }
{$ifndef __G_VALUE_COLLECTOR_H__}
{$define __G_VALUE_COLLECTOR_H__}
{$include <glib-object.h>}
{ we may want to add aggregate types here some day, if requested
 * by users. the basic C types are covered already, everything
 * smaller than an int is promoted to an integer and floats are
 * always promoted to doubles for varargs call constructions.
  }
{< skip > }
type
  Txxxxxxxxxxxxx =  Longint;
  Const
    G_VALUE_COLLECT_INT = 'i';
    G_VALUE_COLLECT_LONG = 'l';
    G_VALUE_COLLECT_INT64 = 'q';
    G_VALUE_COLLECT_DOUBLE = 'd';
    G_VALUE_COLLECT_POINTER = 'p';

{ vararg union holding actual values collected
  }
{*
 * GTypeCValue:
 * @v_int: the field for holding integer values
 * @v_long: the field for holding long integer values
 * @v_int64: the field for holding 64 bit integer values
 * @v_double: the field for holding floating point values
 * @v_pointer: the field for holding pointers
 * 
 * A union holding one collected value.
  }
type
  PGTypeCValue = ^TGTypeCValue;
  TGTypeCValue = record
      case longint of
        0 : ( v_int : Tgint );
        1 : ( v_long : Tglong );
        2 : ( v_int64 : Tgint64 );
        3 : ( v_double : Tgdouble );
        4 : ( v_pointer : Tgpointer );
      end;


const
  G_VALUE_COLLECT_FORMAT_MAX_LENGTH = 8;  
{$endif}
{ __G_VALUE_COLLECTOR_H__  }

// === Konventiert am: 25-6-26 15:14:31 ===


implementation



end.
