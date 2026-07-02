unit gdkcontentprovider;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 *
 * Copyright (C) 2017 Benjamin Otte <otte@gnome.org>
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

type
  PGdkContentProvider = ^TGdkContentProvider;
  TGdkContentProvider = record
      parent : TGObject;
    end;

{*
 * GdkContentProviderClass:
 * @content_changed: Signal class closure for `GdkContentProvider::content-changed`
 *
 * Class structure for `GdkContentProvider`.
  }
{ signals  }
{< private > }
{ vfuncs  }
{< private > }
  PGdkContentProviderClass = ^TGdkContentProviderClass;
  TGdkContentProviderClass = record
      parent_class : TGObjectClass;
      content_changed : procedure (provider:PGdkContentProvider);cdecl;
      attach_clipboard : procedure (provider:PGdkContentProvider; clipboard:PGdkClipboard);cdecl;
      detach_clipboard : procedure (provider:PGdkContentProvider; clipboard:PGdkClipboard);cdecl;
      ref_formats : function (provider:PGdkContentProvider):PGdkContentFormats;cdecl;
      ref_storable_formats : function (provider:PGdkContentProvider):PGdkContentFormats;cdecl;
      write_mime_type_async : procedure (provider:PGdkContentProvider; mime_type:Pchar; stream:PGOutputStream; io_priority:longint; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      write_mime_type_finish : function (provider:PGdkContentProvider; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;
      get_value : function (provider:PGdkContentProvider; value:PGValue; error:PPGError):Tgboolean;cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gdk_content_provider_get_type:TGType;cdecl;external libgtk4;
function gdk_content_provider_ref_formats(provider:PGdkContentProvider):PGdkContentFormats;cdecl;external libgtk4;
function gdk_content_provider_ref_storable_formats(provider:PGdkContentProvider):PGdkContentFormats;cdecl;external libgtk4;
procedure gdk_content_provider_content_changed(provider:PGdkContentProvider);cdecl;external libgtk4;
procedure gdk_content_provider_write_mime_type_async(provider:PGdkContentProvider; mime_type:Pchar; stream:PGOutputStream; io_priority:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gdk_content_provider_write_mime_type_finish(provider:PGdkContentProvider; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external libgtk4;
function gdk_content_provider_get_value(provider:PGdkContentProvider; value:PGValue; error:PPGError):Tgboolean;cdecl;external libgtk4;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkContentProvider, g_object_unref) }

// === Konventiert am: 2-7-26 17:33:21 ===

function GDK_TYPE_CONTENT_PROVIDER : TGType;
function GDK_CONTENT_PROVIDER(obj : Pointer) : PGdkContentProvider;
function GDK_CONTENT_PROVIDER_CLASS(klass : Pointer) : PGdkContentProviderClass;
function GDK_IS_CONTENT_PROVIDER(obj : Pointer) : Tgboolean;
function GDK_IS_CONTENT_PROVIDER_CLASS(klass : Pointer) : Tgboolean;
function GDK_CONTENT_PROVIDER_GET_CLASS(obj : Pointer) : PGdkContentProviderClass;

implementation

function GDK_TYPE_CONTENT_PROVIDER : TGType;
  begin
    GDK_TYPE_CONTENT_PROVIDER:=gdk_content_provider_get_type;
  end;

function GDK_CONTENT_PROVIDER(obj : Pointer) : PGdkContentProvider;
begin
  Result := PGdkContentProvider(g_type_check_instance_cast(obj, GDK_TYPE_CONTENT_PROVIDER));
end;

function GDK_CONTENT_PROVIDER_CLASS(klass : Pointer) : PGdkContentProviderClass;
begin
  Result := PGdkContentProviderClass(g_type_check_class_cast(klass, GDK_TYPE_CONTENT_PROVIDER));
end;

function GDK_IS_CONTENT_PROVIDER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_CONTENT_PROVIDER);
end;

function GDK_IS_CONTENT_PROVIDER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GDK_TYPE_CONTENT_PROVIDER);
end;

function GDK_CONTENT_PROVIDER_GET_CLASS(obj : Pointer) : PGdkContentProviderClass;
begin
  Result := PGdkContentProviderClass(PGTypeInstance(obj)^.g_class);
end;



end.
