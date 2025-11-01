unit cd_sample_widget;

interface

uses
  fp_glib2, fp_GTK4, fp_colord;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
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
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__COLORD_GTK_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord-gtk.h> can be included directly."}
{$endif}
{$ifndef __CD_SAMPLE_WIDGET_H__}
{$define __CD_SAMPLE_WIDGET_H__}
{$include <gtk/gtk.h>}
{$include <colord.h>}

type
  PCdSampleWidget = ^TCdSampleWidget;
  TCdSampleWidget = record
      parent : TGtkDrawingArea;
      priv : PCdSampleWidgetPrivate;
    end;

  PCdSampleWidgetClass = ^TCdSampleWidgetClass;
  TCdSampleWidgetClass = record
      parent_class : TGtkDrawingAreaClass;
    end;


function cd_sample_widget_get_type:TGType;cdecl;external libcolord_gtk;
function cd_sample_widget_new:PGtkWidget;cdecl;external libcolord_gtk;
procedure cd_sample_widget_set_color(sample:PCdSampleWidget; color:PCdColorRGB);cdecl;external libcolord_gtk;
{$endif}

// === Konventiert am: 1-11-25 14:57:20 ===

function CD_TYPE_SAMPLE_WIDGET : TGType;
function CD_SAMPLE_WIDGET(obj : Pointer) : PCdSampleWidget;
function CD_SAMPLE_WIDGET_CLASS(klass : Pointer) : PCdSampleWidgetClass;
function CD_IS_SAMPLE_WIDGET(obj : Pointer) : Tgboolean;
function CD_IS_SAMPLE_WIDGET_CLASS(klass : Pointer) : Tgboolean;
function CD_SAMPLE_WIDGET_GET_CLASS(obj : Pointer) : PCdSampleWidgetClass;

implementation

function CD_TYPE_SAMPLE_WIDGET : TGType;
  begin
    CD_TYPE_SAMPLE_WIDGET:=cd_sample_widget_get_type;
  end;

function CD_SAMPLE_WIDGET(obj : Pointer) : PCdSampleWidget;
begin
  Result := PCdSampleWidget(g_type_check_instance_cast(obj, CD_TYPE_SAMPLE_WIDGET));
end;

function CD_SAMPLE_WIDGET_CLASS(klass : Pointer) : PCdSampleWidgetClass;
begin
  Result := PCdSampleWidgetClass(g_type_check_class_cast(klass, CD_TYPE_SAMPLE_WIDGET));
end;

function CD_IS_SAMPLE_WIDGET(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  CD_TYPE_SAMPLE_WIDGET);
end;

function CD_IS_SAMPLE_WIDGET_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  CD_TYPE_SAMPLE_WIDGET);
end;

function CD_SAMPLE_WIDGET_GET_CLASS(obj : Pointer) : PCdSampleWidgetClass;
begin
  Result := PCdSampleWidgetClass(PGTypeInstance(obj)^.g_class);
end;



end.
