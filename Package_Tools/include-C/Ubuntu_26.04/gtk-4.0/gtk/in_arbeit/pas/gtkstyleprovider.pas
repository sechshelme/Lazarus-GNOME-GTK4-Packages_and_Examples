unit gtkstyleprovider;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2010 Carlos Garnacho <carlosg@gnome.org>
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
{$include <gdk/gdk.h>}
{$include <gtk/gtkenums.h>}
{$include <gtk/gtktypes.h>}

{*
 * GTK_STYLE_PROVIDER_PRIORITY_FALLBACK:
 *
 * The priority used for default style information
 * that is used in the absence of themes.
 *
 * Note that this is not very useful for providing default
 * styling for custom style classes - themes are likely to
 * override styling provided at this priority with
 * catch-all `* ...` rules.
  }
const
  GTK_STYLE_PROVIDER_PRIORITY_FALLBACK = 1;  
{*
 * GTK_STYLE_PROVIDER_PRIORITY_THEME:
 *
 * The priority used for style information provided
 * by themes.
  }
  GTK_STYLE_PROVIDER_PRIORITY_THEME = 200;  
{*
 * GTK_STYLE_PROVIDER_PRIORITY_SETTINGS:
 *
 * The priority used for style information provided
 * via `GtkSettings`.
 *
 * This priority is higher than %GTK_STYLE_PROVIDER_PRIORITY_THEME
 * to let settings override themes.
  }
  GTK_STYLE_PROVIDER_PRIORITY_SETTINGS = 400;  
{*
 * GTK_STYLE_PROVIDER_PRIORITY_APPLICATION:
 *
 * A priority that can be used when adding a `GtkStyleProvider`
 * for application-specific style information.
  }
  GTK_STYLE_PROVIDER_PRIORITY_APPLICATION = 600;  
{*
 * GTK_STYLE_PROVIDER_PRIORITY_USER:
 *
 * The priority used for the style information from
 * `$XDG_CONFIG_HOME/gtk-4.0/gtk.css`.
 *
 * You should not use priorities higher than this, to
 * give the user the last word.
  }
  GTK_STYLE_PROVIDER_PRIORITY_USER = 800;  
type
{ dummy typedef  }

function gtk_style_provider_get_type:TGType;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkStyleProvider, g_object_unref) }
procedure gtk_style_context_add_provider_for_display(display:PGdkDisplay; provider:PGtkStyleProvider; priority:Tguint);cdecl;external libgtk4;
procedure gtk_style_context_remove_provider_for_display(display:PGdkDisplay; provider:PGtkStyleProvider);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:33:07 ===

function GTK_TYPE_STYLE_PROVIDER : TGType;
function GTK_STYLE_PROVIDER(obj : Pointer) : PGtkStyleProvider;
function GTK_IS_STYLE_PROVIDER(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_STYLE_PROVIDER : TGType;
  begin
    GTK_TYPE_STYLE_PROVIDER:=gtk_style_provider_get_type;
  end;

function GTK_STYLE_PROVIDER(obj : Pointer) : PGtkStyleProvider;
begin
  Result := PGtkStyleProvider(g_type_check_instance_cast(obj, GTK_TYPE_STYLE_PROVIDER));
end;

function GTK_IS_STYLE_PROVIDER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_STYLE_PROVIDER);
end;



end.
