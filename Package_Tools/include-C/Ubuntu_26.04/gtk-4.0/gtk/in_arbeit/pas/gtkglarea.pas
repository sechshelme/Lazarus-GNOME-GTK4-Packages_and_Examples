unit gtkglarea;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * gtkglarea.h: A GL drawing area
 *
 * Copyright © 2014  Emmanuele Bassi
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
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type
{< private > }
  PGtkGLArea = ^TGtkGLArea;
  TGtkGLArea = record
      parent_instance : TGtkWidget;
    end;

{*
 * GtkGLAreaClass:
 * @render: class closure for the `GtkGLArea::render` signal
 * @resize: class closeure for the `GtkGLArea::resize` signal
 * @create_context: class closure for the `GtkGLArea::create-context` signal
 *
 * The `GtkGLAreaClass` structure contains only private data.
  }
{< private > }
{< public > }
{< private > }
  PGtkGLAreaClass = ^TGtkGLAreaClass;
  TGtkGLAreaClass = record
      parent_class : TGtkWidgetClass;
      render : function (area:PGtkGLArea; context:PGdkGLContext):Tgboolean;cdecl;
      resize : procedure (area:PGtkGLArea; width:longint; height:longint);cdecl;
      create_context : function (area:PGtkGLArea):PGdkGLContext;cdecl;
      _padding : array[0..7] of Tgpointer;
    end;


function gtk_gl_area_get_type:TGType;cdecl;external libgtk4;
function gtk_gl_area_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_gl_area_set_allowed_apis(area:PGtkGLArea; apis:TGdkGLAPI);cdecl;external libgtk4;
function gtk_gl_area_get_allowed_apis(area:PGtkGLArea):TGdkGLAPI;cdecl;external libgtk4;
function gtk_gl_area_get_api(area:PGtkGLArea):TGdkGLAPI;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(gtk_gl_area_set_allowed_apis) }
procedure gtk_gl_area_set_use_es(area:PGtkGLArea; use_es:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(gtk_gl_area_get_api) }
function gtk_gl_area_get_use_es(area:PGtkGLArea):Tgboolean;cdecl;external libgtk4;
procedure gtk_gl_area_set_required_version(area:PGtkGLArea; major:longint; minor:longint);cdecl;external libgtk4;
procedure gtk_gl_area_get_required_version(area:PGtkGLArea; major:Plongint; minor:Plongint);cdecl;external libgtk4;
function gtk_gl_area_get_has_depth_buffer(area:PGtkGLArea):Tgboolean;cdecl;external libgtk4;
procedure gtk_gl_area_set_has_depth_buffer(area:PGtkGLArea; has_depth_buffer:Tgboolean);cdecl;external libgtk4;
function gtk_gl_area_get_has_stencil_buffer(area:PGtkGLArea):Tgboolean;cdecl;external libgtk4;
procedure gtk_gl_area_set_has_stencil_buffer(area:PGtkGLArea; has_stencil_buffer:Tgboolean);cdecl;external libgtk4;
function gtk_gl_area_get_auto_render(area:PGtkGLArea):Tgboolean;cdecl;external libgtk4;
procedure gtk_gl_area_set_auto_render(area:PGtkGLArea; auto_render:Tgboolean);cdecl;external libgtk4;
procedure gtk_gl_area_queue_render(area:PGtkGLArea);cdecl;external libgtk4;
function gtk_gl_area_get_context(area:PGtkGLArea):PGdkGLContext;cdecl;external libgtk4;
procedure gtk_gl_area_make_current(area:PGtkGLArea);cdecl;external libgtk4;
procedure gtk_gl_area_attach_buffers(area:PGtkGLArea);cdecl;external libgtk4;
procedure gtk_gl_area_set_error(area:PGtkGLArea; error:PGError);cdecl;external libgtk4;
function gtk_gl_area_get_error(area:PGtkGLArea):PGError;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkGLArea, g_object_unref) }

// === Konventiert am: 6-7-26 16:21:02 ===

function GTK_TYPE_GL_AREA : TGType;
function GTK_GL_AREA(obj : Pointer) : PGtkGLArea;
function GTK_IS_GL_AREA(obj : P;) : longint;
function GTK_GL_AREA_CLASS(klass : Tgboolean) : longint;
function GTK_IS_GL_AREA_CLASS(klass : Pointer) : Tgboolean;
function GTK_GL_AREA_GET_CLASS(obj : Pointer) : P;;

implementation

function GTK_TYPE_GL_AREA : TGType;
  begin
    GTK_TYPE_GL_AREA:=gtk_gl_area_get_type;
  end;

function GTK_GL_AREA(obj : Pointer) : PGtkGLArea;
begin
  Result := PGtkGLArea(g_type_check_instance_cast(obj, GTK_TYPE_GL_AREA));
end;

function GTK_IS_GL_AREA(obj : P;) : longint;
begin
  Result := P;(g_type_check_class_cast(klass, GTK_TYPE_GL_AREA));
end;

function GTK_GL_AREA_CLASS(klass : Tgboolean) : longint;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_GL_AREA);
end;

function GTK_IS_GL_AREA_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_GL_AREA);
end;

function GTK_GL_AREA_GET_CLASS(obj : Pointer) : P;;
begin
  Result := P;(PGTypeInstance(obj)^.g_class);
end;



end.
