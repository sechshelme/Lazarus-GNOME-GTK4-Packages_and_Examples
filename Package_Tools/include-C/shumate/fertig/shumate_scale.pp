
unit shumate_scale;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_scale.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_scale.h
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
PShumateScale  = ^ShumateScale;
PShumateUnit  = ^ShumateUnit;
PShumateViewport  = ^ShumateViewport;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2011-2013 Jiri Techet <techet@gmail.com>
 * Copyright (C) 2019 Marcus Lundblad <ml@update.uu.se>
 * Copyright (C) 2020 Collabora Ltd. (https://www.collabora.com)
 * Copyright (C) 2020 Corentin Noël <corentin.noel@collabora.com>
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$if !defined (__SHUMATE_SHUMATE_H_INSIDE__) && !defined (SHUMATE_COMPILATION)}
{$error "Only <shumate/shumate.h> can be included directly."}
{$endif}
{$ifndef SHUMATE_SCALE_H}
{$define SHUMATE_SCALE_H}
{$include <shumate/shumate-viewport.h>}
{$include <glib-object.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_SCALE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateScale, shumate_scale, SHUMATE, SCALE, GtkWidget) }
{*
 * ShumateUnit:
 * @SHUMATE_UNIT_BOTH: Both metric and imperial units
 * @SHUMATE_UNIT_METRIC: Metric units (meters)
 * @SHUMATE_UNIT_IMPERIAL: Imperial units (miles)
 *
 * Units used by the scale.
  }
type
  PShumateUnit = ^TShumateUnit;
  TShumateUnit =  Longint;
  Const
    SHUMATE_UNIT_BOTH = 0;
    SHUMATE_UNIT_METRIC = 1;
    SHUMATE_UNIT_IMPERIAL = 2;
;

function shumate_scale_new(viewport:PShumateViewport):PShumateScale;cdecl;external;
function shumate_scale_get_max_width(scale:PShumateScale):Tguint;cdecl;external;
procedure shumate_scale_set_max_width(scale:PShumateScale; value:Tguint);cdecl;external;
function shumate_scale_get_unit(scale:PShumateScale):TShumateUnit;cdecl;external;
procedure shumate_scale_set_unit(scale:PShumateScale; unit:TShumateUnit);cdecl;external;
function shumate_scale_get_viewport(scale:PShumateScale):PShumateViewport;cdecl;external;
procedure shumate_scale_set_viewport(scale:PShumateScale; viewport:PShumateViewport);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_SCALE : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_SCALE:=shumate_scale_get_type;
  end;


end.
