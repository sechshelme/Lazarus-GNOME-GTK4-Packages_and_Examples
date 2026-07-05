unit gskglshadernode;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GSK - The GTK Scene Kit
 *
 * Copyright 2016  Endless
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
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{$include <gsk/gsktypes.h>}
{$include <gsk/gskglshader.h>}
type

{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_node_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_node_new(shader:PGskGLShader; bounds:Pgraphene_rect_t; args:PGBytes; children:PPGskRenderNode; n_children:Tguint):PGskRenderNode;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_node_get_n_children(node:PGskRenderNode):Tguint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_node_get_child(node:PGskRenderNode; idx:Tguint):PGskRenderNode;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_node_get_args(node:PGskRenderNode):PGBytes;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_16_FOR(GtkGLArea) }
function gsk_gl_shader_node_get_shader(node:PGskRenderNode):PGskGLShader;cdecl;external libgtk4;

// === Konventiert am: 5-7-26 13:24:29 ===

function GSK_TYPE_GL_SHADER_NODE : TGType;

implementation

function GSK_TYPE_GL_SHADER_NODE : TGType;
  begin
    GSK_TYPE_GL_SHADER_NODE:=gsk_gl_shader_node_get_type;
  end;



end.
