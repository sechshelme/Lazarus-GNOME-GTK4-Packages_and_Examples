unit gdkcolorstate;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gdkcolorstate.h
 *
 * Copyright 2024 Red Hat, Inc.
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

function gdk_color_state_get_type:TGType;cdecl;external libgtk4;
function gdk_color_state_ref(self:PGdkColorState):PGdkColorState;cdecl;external libgtk4;
procedure gdk_color_state_unref(self:PGdkColorState);cdecl;external libgtk4;
function gdk_color_state_get_srgb:PGdkColorState;cdecl;external libgtk4;
function gdk_color_state_get_srgb_linear:PGdkColorState;cdecl;external libgtk4;
function gdk_color_state_get_rec2100_pq:PGdkColorState;cdecl;external libgtk4;
function gdk_color_state_get_rec2100_linear:PGdkColorState;cdecl;external libgtk4;
function gdk_color_state_get_oklab:PGdkColorState;cdecl;external libgtk4;
function gdk_color_state_get_oklch:PGdkColorState;cdecl;external libgtk4;
function gdk_color_state_equal(self:PGdkColorState; other:PGdkColorState):Tgboolean;cdecl;external libgtk4;
function gdk_color_state_equivalent(self:PGdkColorState; other:PGdkColorState):Tgboolean;cdecl;external libgtk4;
function gdk_color_state_create_cicp_params(self:PGdkColorState):PGdkCicpParams;cdecl;external libgtk4;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkColorState, gdk_color_state_unref) }

// === Konventiert am: 2-7-26 17:35:04 ===

function GDK_TYPE_COLOR_STATE : TGType;

implementation

function GDK_TYPE_COLOR_STATE : TGType;
  begin
    GDK_TYPE_COLOR_STATE:=gdk_color_state_get_type;
  end;



end.
