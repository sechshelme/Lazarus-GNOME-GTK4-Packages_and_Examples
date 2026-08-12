unit gegl_types;

interface

uses
  fp_glib2, fp_gegl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2003 Calvin Williamson
 *           2006 Øyvind Kolås
  }
{$ifndef __GEGL_TYPES_H__}
{$define __GEGL_TYPES_H__}
{$include <glib-object.h>}
{$include "gegl-enums.h"}

const
  GEGL_AUTO_ROWSTRIDE = 0;  
type
  PGeglPadType = ^TGeglPadType;
  TGeglPadType =  Longint;
  Const
    GEGL_PARAM_PAD_OUTPUT = 1 shl G_PARAM_USER_SHIFT;
    GEGL_PARAM_PAD_INPUT = 1 shl (G_PARAM_USER_SHIFT+1);
;
type
  PGeglBlitFlags = ^TGeglBlitFlags;
  TGeglBlitFlags =  Longint;
  Const
    GEGL_BLIT_DEFAULT = 0;
    GEGL_BLIT_CACHE = 1 shl 0;
    GEGL_BLIT_DIRTY = 1 shl 1;
;
type
  PGeglSplitStrategy = ^TGeglSplitStrategy;
  TGeglSplitStrategy =  Longint;
  Const
    GEGL_SPLIT_STRATEGY_AUTO = 0;
    GEGL_SPLIT_STRATEGY_HORIZONTAL = 1;
    GEGL_SPLIT_STRATEGY_VERTICAL = 2;
;
type

function gegl_config_get_type:TGType;cdecl;external libgegl;
type

function gegl_stats_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_STATS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_STATS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_STATS(obj : longint) : longint;

type

function gegl_operation_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_OPERATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_OPERATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_OPERATION(obj : longint) : longint;

{G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GeglOperation, g_object_unref) }
type

function gegl_node_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_NODE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_NODE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_NODE(obj : longint) : longint;

{G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GeglNode, g_object_unref) }
type

function gegl_processor_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_PROCESSOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PROCESSOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PROCESSOR(obj : longint) : longint;

{G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GeglProcessor, g_object_unref) }
type

function gegl_random_get_type:TGType;cdecl;external libgegl;
{ was #define dname def_expr }
function GEGL_TYPE_RANDOM : longint; { return type might be wrong }

{$include <gegl-buffer.h>}
{$endif}
{ __GEGL_TYPES_H__  }

// === Konventiert am: 12-8-26 17:16:31 ===

function GEGL_TYPE_CONFIG : TGType;
function GEGL_CONFIG(obj : Pointer) : PGeglConfig;
function GEGL_IS_CONFIG(obj : Pointer) : Tgboolean;

implementation

function GEGL_TYPE_CONFIG : TGType;
  begin
    GEGL_TYPE_CONFIG:=gegl_config_get_type;
  end;

function GEGL_CONFIG(obj : Pointer) : PGeglConfig;
begin
  Result := PGeglConfig(g_type_check_instance_cast(obj, GEGL_TYPE_CONFIG));
end;

function GEGL_IS_CONFIG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GEGL_TYPE_CONFIG);
end;


{ was #define dname def_expr }
function GEGL_TYPE_STATS : longint; { return type might be wrong }
  begin
    GEGL_TYPE_STATS:=gegl_stats_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_STATS(obj : longint) : longint;
begin
  GEGL_STATS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEGL_TYPE_STATS,GeglStats);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_STATS(obj : longint) : longint;
begin
  GEGL_IS_STATS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEGL_TYPE_STATS);
end;

{ was #define dname def_expr }
function GEGL_TYPE_OPERATION : longint; { return type might be wrong }
  begin
    GEGL_TYPE_OPERATION:=gegl_operation_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_OPERATION(obj : longint) : longint;
begin
  GEGL_OPERATION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEGL_TYPE_OPERATION,GeglOperation);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_OPERATION(obj : longint) : longint;
begin
  GEGL_IS_OPERATION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEGL_TYPE_OPERATION);
end;

{ was #define dname def_expr }
function GEGL_TYPE_NODE : longint; { return type might be wrong }
  begin
    GEGL_TYPE_NODE:=gegl_node_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_NODE(obj : longint) : longint;
begin
  GEGL_NODE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEGL_TYPE_NODE,GeglNode);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_NODE(obj : longint) : longint;
begin
  GEGL_IS_NODE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEGL_TYPE_NODE);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PROCESSOR : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PROCESSOR:=gegl_processor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PROCESSOR(obj : longint) : longint;
begin
  GEGL_PROCESSOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEGL_TYPE_PROCESSOR,GeglProcessor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PROCESSOR(obj : longint) : longint;
begin
  GEGL_IS_PROCESSOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEGL_TYPE_PROCESSOR);
end;

{ was #define dname def_expr }
function GEGL_TYPE_RANDOM : longint; { return type might be wrong }
  begin
    GEGL_TYPE_RANDOM:=gegl_random_get_type;
  end;


end.
