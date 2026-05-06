
unit shumate_layer;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_layer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_layer.h
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
Pchar  = ^char;
PShumateLayer  = ^ShumateLayer;
PShumateLayerClass  = ^ShumateLayerClass;
PShumateViewport  = ^ShumateViewport;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2011-2013 Jiri Techet <techet@gmail.com>
 * Copyright (C) 2019 Marcus Lundblad <ml@update.uu.se>
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
{$ifndef __SHUMATE_LAYER_H__}
{$define __SHUMATE_LAYER_H__}
{$include <shumate/shumate-viewport.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_LAYER : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (ShumateLayer, shumate_layer, SHUMATE, LAYER, GtkWidget) }
{*
   * ShumateLayerClass::get_debug_text:
   * @self: a [class@Layer]
   *
   * Returns a string to show in the debug overlay, which can be
   * enabled in the GTK inspector.
   *
   * Returns: (transfer full) (nullable): a string with debug text
    }
{< private > }
type
  PShumateLayerClass = ^TShumateLayerClass;
  TShumateLayerClass = record
      parent_class : TGtkWidgetClass;
      get_debug_text : function (self:PShumateLayer):Pchar;cdecl;
      padding : array[0..14] of Tgpointer;
    end;


function shumate_layer_get_viewport(self:PShumateLayer):PShumateViewport;cdecl;external;
{$endif}
{ __SHUMATE_LAYER_H__  }

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_LAYER : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_LAYER:=shumate_layer_get_type;
  end;


end.
