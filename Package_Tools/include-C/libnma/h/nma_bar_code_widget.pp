
unit nma_bar_code_widget;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_bar_code_widget.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_bar_code_widget.h
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
PGtkWidget  = ^GtkWidget;
PNMConnection  = ^NMConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ nma-bar-code.h - Widget that renders a "QR" code
 *
 * Lubomir Rintel <lkundrak@v3.sk>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public License as
 * published by the ree Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * Copyright (C) 2018, 2019 Red Hat, Inc.
  }
{$ifndef __NMA_BAR_CODE_WIDGET_H__}
{$define __NMA_BAR_CODE_WIDGET_H__}
{$include <glib-object.h>}
{$include <gtk/gtk.h>}
{$include <NetworkManager.h>}
{$include "nma-version.h"}

{ was #define dname def_expr }
function NMA_TYPE_BAR_CODE_WIDGET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_BAR_CODE_WIDGET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_BAR_CODE_WIDGET_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_BAR_CODE_WIDGET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_BAR_CODE_WIDGET_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_BAR_CODE_WIDGET_GET_CLASS(obj : longint) : longint;

const
  NMA_BAR_CODE_WIDGET_CONNECTION = 'connection';  
type

function nma_bar_code_widget_get_type:TGType;cdecl;external;
function nma_bar_code_widget_new(connection:PNMConnection):PGtkWidget;cdecl;external;
{$endif}
{ __NMA_BAR_CODE_WIDGET_H__  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_BAR_CODE_WIDGET : longint; { return type might be wrong }
  begin
    NMA_TYPE_BAR_CODE_WIDGET:=nma_bar_code_widget_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_BAR_CODE_WIDGET(obj : longint) : longint;
begin
  NMA_BAR_CODE_WIDGET:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_BAR_CODE_WIDGET,NMABarCodeWidget);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_BAR_CODE_WIDGET_CLASS(klass : longint) : longint;
begin
  NMA_BAR_CODE_WIDGET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_TYPE_BAR_CODE_WIDGET,NMABarCodeWidgetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_BAR_CODE_WIDGET(obj : longint) : longint;
begin
  NMA_IS_BAR_CODE_WIDGET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_BAR_CODE_WIDGET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_BAR_CODE_WIDGET_CLASS(klass : longint) : longint;
begin
  NMA_IS_BAR_CODE_WIDGET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_TYPE_BAR_CODE_WIDGET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_BAR_CODE_WIDGET_GET_CLASS(obj : longint) : longint;
begin
  NMA_BAR_CODE_WIDGET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NMA_TYPE_BAR_CODE_WIDGET,NMABarCodeWidgetClass);
end;


end.
