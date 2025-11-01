unit cd_sample_window;

interface

uses
  fp_glib2, fp_GTK4, fp_colord;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010-2012 Richard Hughes <richard@hughsie.com>
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
{$ifndef __CD_SAMPLE_WINDOW_H}
{$define __CD_SAMPLE_WINDOW_H}
{$include <glib-object.h>}
{$include <gtk/gtk.h>}
{$include <colord.h>}

type
  PCdSampleWindow = ^TCdSampleWindow;
  TCdSampleWindow = record
      parent : TGtkWindow;
      priv : PCdSampleWindowPrivate;
    end;

  PCdSampleWindowClass = ^TCdSampleWindowClass;
  TCdSampleWindowClass = record
      parent_class : TGtkWindowClass;
    end;


function cd_sample_window_get_type:TGType;cdecl;external libcolord_gtk;
function cd_sample_window_new:PGtkWindow;cdecl;external libcolord_gtk;
procedure cd_sample_window_set_color(sample_window:PCdSampleWindow; color:PCdColorRGB);cdecl;external libcolord_gtk;
procedure cd_sample_window_set_fraction(sample_window:PCdSampleWindow; fraction:Tgdouble);cdecl;external libcolord_gtk;
{$endif}
{ __CD_SAMPLE_WINDOW_H  }

// === Konventiert am: 1-11-25 14:58:04 ===

function CD_TYPE_SAMPLE_WINDOW : TGType;
function CD_SAMPLE_WINDOW(obj : Pointer) : PCdSampleWindow;
function CD_IS_SAMPLE_WINDOW(obj : Pointer) : Tgboolean;

implementation

function CD_TYPE_SAMPLE_WINDOW : TGType;
  begin
    CD_TYPE_SAMPLE_WINDOW:=cd_sample_window_get_type;
  end;

function CD_SAMPLE_WINDOW(obj : Pointer) : PCdSampleWindow;
begin
  Result := PCdSampleWindow(g_type_check_instance_cast(obj, CD_TYPE_SAMPLE_WINDOW));
end;

function CD_IS_SAMPLE_WINDOW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  CD_TYPE_SAMPLE_WINDOW);
end;



end.
