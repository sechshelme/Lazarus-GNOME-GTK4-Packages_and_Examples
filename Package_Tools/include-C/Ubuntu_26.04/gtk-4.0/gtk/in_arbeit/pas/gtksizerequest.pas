unit gtksizerequest;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2007-2010 Openismus GmbH
 *
 * Authors:
 *      Mathias Hasselmann <mathias@openismus.com>
 *      Tristan Van Berkom <tristan.van.berkom@gmail.com>
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtkwidget.h>}
type
{*
 * GtkRequestedSize:
 * @data: A client pointer
 * @minimum_size: The minimum size needed for allocation in a given orientation
 * @natural_size: The natural size for allocation in a given orientation
 *
 * Represents a request of a screen object in a given orientation.
 *
 * These are primarily used in container implementations when allocating
 * a natural size for children. See [func@distribute_natural_allocation].
  }
  PGtkRequestedSize = ^TGtkRequestedSize;
  TGtkRequestedSize = record
      data : Tgpointer;
      minimum_size : longint;
      natural_size : longint;
    end;

{ General convenience function to aid in allocating natural sizes  }

function gtk_distribute_natural_allocation(extra_space:longint; n_requested_sizes:Tguint; sizes:PGtkRequestedSize):longint;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 17:10:18 ===


implementation



end.
