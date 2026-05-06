
unit shumate_viewport;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_viewport.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_viewport.h
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
Pdouble  = ^double;
PGtkWidget  = ^GtkWidget;
PShumateMapSource  = ^ShumateMapSource;
PShumateViewport  = ^ShumateViewport;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ shumate-viewport.h: Viewport actor
 *
 * Copyright (C) 2008 OpenedHand
 * Copyright (C) 2011-2013 Jiri Techet <techet@gmail.com>
 * Copyright (C) 2019 Marcus Lundblad <ml@update.uu.se>
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
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *
 * Written by: Chris Lord <chris@openedhand.com>
  }
{$ifndef __SHUMATE_VIEWPORT_H__}
{$define __SHUMATE_VIEWPORT_H__}
{$include <glib-object.h>}
{$include <shumate/shumate-location.h>}
{$include <shumate/shumate-map-source.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_VIEWPORT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateViewport, shumate_viewport, SHUMATE, VIEWPORT, GObject) }
function shumate_viewport_new:PShumateViewport;cdecl;external;
procedure shumate_viewport_set_zoom_level(self:PShumateViewport; zoom_level:Tdouble);cdecl;external;
function shumate_viewport_get_zoom_level(self:PShumateViewport):Tdouble;cdecl;external;
procedure shumate_viewport_set_max_zoom_level(self:PShumateViewport; max_zoom_level:Tguint);cdecl;external;
function shumate_viewport_get_max_zoom_level(self:PShumateViewport):Tguint;cdecl;external;
procedure shumate_viewport_set_min_zoom_level(self:PShumateViewport; min_zoom_level:Tguint);cdecl;external;
function shumate_viewport_get_min_zoom_level(self:PShumateViewport):Tguint;cdecl;external;
procedure shumate_viewport_set_reference_map_source(self:PShumateViewport; map_source:PShumateMapSource);cdecl;external;
function shumate_viewport_get_reference_map_source(self:PShumateViewport):PShumateMapSource;cdecl;external;
procedure shumate_viewport_set_rotation(self:PShumateViewport; rotation:Tdouble);cdecl;external;
function shumate_viewport_get_rotation(self:PShumateViewport):Tdouble;cdecl;external;
procedure shumate_viewport_widget_coords_to_location(self:PShumateViewport; widget:PGtkWidget; x:Tdouble; y:Tdouble; latitude:Pdouble; 
            longitude:Pdouble);cdecl;external;
procedure shumate_viewport_location_to_widget_coords(self:PShumateViewport; widget:PGtkWidget; latitude:Tdouble; longitude:Tdouble; x:Pdouble; 
            y:Pdouble);cdecl;external;
{$endif}
{ __SHUMATE_VIEWPORT_H__  }

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_VIEWPORT : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_VIEWPORT:=shumate_viewport_get_type;
  end;


end.
