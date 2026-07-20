unit rtsp_permissions;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2010 Wim Taymans <wim.taymans at gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$include <gst/gst.h>}
{$ifndef __GST_RTSP_PERMISSIONS_H__}
{$define __GST_RTSP_PERMISSIONS_H__}
{$include "rtsp-server-prelude.h"}
type

function gst_rtsp_permissions_get_type:TGType;cdecl;external libgstrtsp;
{ was #define dname def_expr }
function GST_TYPE_RTSP_PERMISSIONS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_PERMISSIONS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_PERMISSIONS_CAST(obj : longint) : PGstRTSPPermissions;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_PERMISSIONS(obj : longint) : longint;

{*
 * GstRTSPPermissions:
 *
 * The opaque permissions structure. It is used to define the permissions
 * of objects in different roles.
  }
type
  PGstRTSPPermissions = ^TGstRTSPPermissions;
  TGstRTSPPermissions = record
      mini_object : TGstMiniObject;
    end;

{* xxxx
static inline GstRTSPPermissions *
gst_rtsp_permissions_ref (GstRTSPPermissions * permissions)

  return (GstRTSPPermissions *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (permissions));


static inline void
gst_rtsp_permissions_unref (GstRTSPPermissions * permissions)

  gst_mini_object_unref (GST_MINI_OBJECT_CAST (permissions));

  }

function gst_rtsp_permissions_new:PGstRTSPPermissions;cdecl;external libgstrtsp;
procedure gst_rtsp_permissions_add_role(permissions:PGstRTSPPermissions; role:Pgchar; fieldname:Pgchar; args:array of const);cdecl;external libgstrtsp;
procedure gst_rtsp_permissions_add_role(permissions:PGstRTSPPermissions; role:Pgchar; fieldname:Pgchar);cdecl;external libgstrtsp;
procedure gst_rtsp_permissions_add_role_valist(permissions:PGstRTSPPermissions; role:Pgchar; fieldname:Pgchar; var_args:Tva_list);cdecl;external libgstrtsp;
procedure gst_rtsp_permissions_add_role_empty(permissions:PGstRTSPPermissions; role:Pgchar);cdecl;external libgstrtsp;
procedure gst_rtsp_permissions_add_role_from_structure(permissions:PGstRTSPPermissions; structure:PGstStructure);cdecl;external libgstrtsp;
procedure gst_rtsp_permissions_add_permission_for_role(permissions:PGstRTSPPermissions; role:Pgchar; permission:Pgchar; allowed:Tgboolean);cdecl;external libgstrtsp;
procedure gst_rtsp_permissions_remove_role(permissions:PGstRTSPPermissions; role:Pgchar);cdecl;external libgstrtsp;
function gst_rtsp_permissions_get_role(permissions:PGstRTSPPermissions; role:Pgchar):PGstStructure;cdecl;external libgstrtsp;
function gst_rtsp_permissions_is_allowed(permissions:PGstRTSPPermissions; role:Pgchar; permission:Pgchar):Tgboolean;cdecl;external libgstrtsp;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPPermissions, gst_rtsp_permissions_unref) }
{$endif}
{$endif}
{ __GST_RTSP_PERMISSIONS_H__  }

// === Konventiert am: 20-7-26 13:44:34 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_RTSP_PERMISSIONS : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_PERMISSIONS:=gst_rtsp_permissions_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_PERMISSIONS(obj : longint) : longint;
begin
  GST_IS_RTSP_PERMISSIONS:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_RTSP_PERMISSIONS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_PERMISSIONS_CAST(obj : longint) : PGstRTSPPermissions;
begin
  GST_RTSP_PERMISSIONS_CAST:=PGstRTSPPermissions(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_PERMISSIONS(obj : longint) : longint;
begin
  GST_RTSP_PERMISSIONS:=GST_RTSP_PERMISSIONS_CAST(obj);
end;


end.
