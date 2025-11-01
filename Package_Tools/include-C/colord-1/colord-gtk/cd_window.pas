unit cd_window;

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
{$ifndef __CD_WINDOW_H}
{$define __CD_WINDOW_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function CD_WINDOW_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function CD_WINDOW_TYPE_ERROR : longint; { return type might be wrong }

type

  PCdWindow = ^TCdWindow;
  TCdWindow = record
      parent : TGObject;
      priv : PCdWindowPrivate;
    end;
{< private > }
{ Padding for future expansion  }

  PCdWindowClass = ^TCdWindowClass;
  TCdWindowClass = record
      parent_class : TGObjectClass;
      changed : procedure (window:PCdWindow; profile:PCdProfile);cdecl;
      _cd_window_reserved1 : procedure ;cdecl;
      _cd_window_reserved2 : procedure ;cdecl;
      _cd_window_reserved3 : procedure ;cdecl;
      _cd_window_reserved4 : procedure ;cdecl;
      _cd_window_reserved5 : procedure ;cdecl;
      _cd_window_reserved6 : procedure ;cdecl;
      _cd_window_reserved7 : procedure ;cdecl;
      _cd_window_reserved8 : procedure ;cdecl;
    end;
{*
 * CdWindowError:
 * @CD_WINDOW_ERROR_FAILED: the transaction failed for an unknown reason
 *
 * Errors that can be thrown
  }

  PCdWindowError = ^TCdWindowError;
  TCdWindowError =  Longint;
  Const
    CD_WINDOW_ERROR_FAILED = 0;
    CD_WINDOW_ERROR_LAST = 1;
;

function cd_window_get_type:TGType;cdecl;external libcolord_gtk;
function cd_window_error_quark:TGQuark;cdecl;external libcolord_gtk;
function cd_window_new:PCdWindow;cdecl;external libcolord_gtk;
{ async  }
procedure cd_window_get_profile(window:PCdWindow; widget:PGtkWidget; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libcolord_gtk;
function cd_window_get_profile_finish(window:PCdWindow; res:PGAsyncResult; error:PPGError):PCdProfile;cdecl;external libcolord_gtk;
{ getters  }
function cd_window_get_last_profile(window:PCdWindow):PCdProfile;cdecl;external libcolord_gtk;
{$endif}
{ __CD_WINDOW_H  }

// === Konventiert am: 1-11-25 14:58:28 ===

function CD_TYPE_WINDOW : TGType;
function CD_WINDOW(obj : Pointer) : PCdWindow;
function CD_WINDOW_CLASS(klass : Pointer) : PCdWindowClass;
function CD_IS_WINDOW(obj : Pointer) : Tgboolean;
function CD_IS_WINDOW_CLASS(klass : Pointer) : Tgboolean;
function CD_WINDOW_GET_CLASS(obj : Pointer) : PCdWindowClass;

implementation

function CD_TYPE_WINDOW : TGType;
  begin
    CD_TYPE_WINDOW:=cd_window_get_type;
  end;

function CD_WINDOW(obj : Pointer) : PCdWindow;
begin
  Result := PCdWindow(g_type_check_instance_cast(obj, CD_TYPE_WINDOW));
end;

function CD_WINDOW_CLASS(klass : Pointer) : PCdWindowClass;
begin
  Result := PCdWindowClass(g_type_check_class_cast(klass, CD_TYPE_WINDOW));
end;

function CD_IS_WINDOW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  CD_TYPE_WINDOW);
end;

function CD_IS_WINDOW_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  CD_TYPE_WINDOW);
end;

function CD_WINDOW_GET_CLASS(obj : Pointer) : PCdWindowClass;
begin
  Result := PCdWindowClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function CD_WINDOW_ERROR : longint; { return type might be wrong }
  begin
    CD_WINDOW_ERROR:=cd_window_error_quark;
  end;

{ was #define dname def_expr }
function CD_WINDOW_TYPE_ERROR : longint; { return type might be wrong }
  begin
    CD_WINDOW_TYPE_ERROR:=cd_window_error_get_type;
  end;


end.
