
unit gdkcicpparams;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkcicpparams.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkcicpparams.h
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
PGdkCicpParams  = ^GdkCicpParams;
PGdkCicpRange  = ^GdkCicpRange;
PGdkColorState  = ^GdkColorState;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gdkcicpparams.h
 *
 * Copyright 2024 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

{ was #define dname def_expr }
function GDK_TYPE_CICP_PARAMS : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GdkCicpParams, gdk_cicp_params, GDK, CICP_PARAMS, GObject) }
function gdk_cicp_params_new:PGdkCicpParams;cdecl;external;
function gdk_cicp_params_get_color_primaries(self:PGdkCicpParams):Tguint;cdecl;external;
procedure gdk_cicp_params_set_color_primaries(self:PGdkCicpParams; color_primaries:Tguint);cdecl;external;
function gdk_cicp_params_get_transfer_function(self:PGdkCicpParams):Tguint;cdecl;external;
procedure gdk_cicp_params_set_transfer_function(self:PGdkCicpParams; transfer_function:Tguint);cdecl;external;
function gdk_cicp_params_get_matrix_coefficients(self:PGdkCicpParams):Tguint;cdecl;external;
procedure gdk_cicp_params_set_matrix_coefficients(self:PGdkCicpParams; matrix_coefficients:Tguint);cdecl;external;
{*
 * GdkCicpRange:
 * @GDK_CICP_RANGE_NARROW: The values use the range of 16-235 (for Y) and 16-240 for u and v.
 * @GDK_CICP_RANGE_FULL: The values use the full range.
 *
 * The values of this enumeration describe whether image data uses
 * the full range of 8-bit values.
 *
 * In digital broadcasting, it is common to reserve the lowest and
 * highest values. Typically the allowed values for the narrow range
 * are 16-235 for Y and 16-240 for u,v (when dealing with YUV data).
 *
 * Since: 4.16
  }
type
  PGdkCicpRange = ^TGdkCicpRange;
  TGdkCicpRange =  Longint;
  Const
    GDK_CICP_RANGE_NARROW = 0;
    GDK_CICP_RANGE_FULL = 1;
;

function gdk_cicp_params_get_range(self:PGdkCicpParams):TGdkCicpRange;cdecl;external;
procedure gdk_cicp_params_set_range(self:PGdkCicpParams; range:TGdkCicpRange);cdecl;external;
function gdk_cicp_params_build_color_state(self:PGdkCicpParams; error:PPGError):PGdkColorState;cdecl;external;

implementation

{ was #define dname def_expr }
function GDK_TYPE_CICP_PARAMS : longint; { return type might be wrong }
  begin
    GDK_TYPE_CICP_PARAMS:=gdk_cicp_params_get_type;
  end;


end.
