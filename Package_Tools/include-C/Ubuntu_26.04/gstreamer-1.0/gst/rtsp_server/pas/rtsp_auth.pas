unit rtsp_auth;

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
{$ifndef __GST_RTSP_AUTH_H__}
{$define __GST_RTSP_AUTH_H__}
type
{$include "rtsp-server-prelude.h"}
{$include "rtsp-client.h"}
{$include "rtsp-token.h"}

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_AUTH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_AUTH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_AUTH_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_AUTH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_AUTH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_AUTH_CAST(obj : longint) : PGstRTSPAuth;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_AUTH_CLASS_CAST(klass : longint) : PGstRTSPAuthClass;

{*
 * GstRTSPAuth:
 *
 * The authentication structure.
  }
{< private > }
type
  PGstRTSPAuth = ^TGstRTSPAuth;
  TGstRTSPAuth = record
      parent : TGObject;
      priv : PGstRTSPAuthPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstRTSPAuthClass:
 * @authenticate: check the authentication of a client. The default implementation
 *         checks if the authentication in the header matches one of the basic
 *         authentication tokens. This function should set the authgroup field
 *         in the context.
 * @check: check if a resource can be accessed. this function should
 *         call authenticate to authenticate the client when needed. The method
 *         should also construct and send an appropriate response message on
 *         error.
 *
 * The authentication class.
  }
{< private > }
  PGstRTSPAuthClass = ^TGstRTSPAuthClass;
  TGstRTSPAuthClass = record
      parent_class : TGObjectClass;
      authenticate : function (auth:PGstRTSPAuth; ctx:PGstRTSPContext):Tgboolean;cdecl;
      check : function (auth:PGstRTSPAuth; ctx:PGstRTSPContext; check:Pgchar):Tgboolean;cdecl;
      generate_authenticate_header : procedure (auth:PGstRTSPAuth; ctx:PGstRTSPContext);cdecl;
      accept_certificate : function (auth:PGstRTSPAuth; connection:PGTlsConnection; peer_cert:PGTlsCertificate; errors:TGTlsCertificateFlags):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;


function gst_rtsp_auth_get_type:TGType;cdecl;external libgstrtsp;
function gst_rtsp_auth_new:PGstRTSPAuth;cdecl;external libgstrtsp;
procedure gst_rtsp_auth_set_tls_certificate(auth:PGstRTSPAuth; cert:PGTlsCertificate);cdecl;external libgstrtsp;
function gst_rtsp_auth_get_tls_certificate(auth:PGstRTSPAuth):PGTlsCertificate;cdecl;external libgstrtsp;
procedure gst_rtsp_auth_set_tls_database(auth:PGstRTSPAuth; database:PGTlsDatabase);cdecl;external libgstrtsp;
function gst_rtsp_auth_get_tls_database(auth:PGstRTSPAuth):PGTlsDatabase;cdecl;external libgstrtsp;
procedure gst_rtsp_auth_set_tls_authentication_mode(auth:PGstRTSPAuth; mode:TGTlsAuthenticationMode);cdecl;external libgstrtsp;
function gst_rtsp_auth_get_tls_authentication_mode(auth:PGstRTSPAuth):TGTlsAuthenticationMode;cdecl;external libgstrtsp;
procedure gst_rtsp_auth_set_default_token(auth:PGstRTSPAuth; token:PGstRTSPToken);cdecl;external libgstrtsp;
function gst_rtsp_auth_get_default_token(auth:PGstRTSPAuth):PGstRTSPToken;cdecl;external libgstrtsp;
procedure gst_rtsp_auth_add_basic(auth:PGstRTSPAuth; basic:Pgchar; token:PGstRTSPToken);cdecl;external libgstrtsp;
procedure gst_rtsp_auth_remove_basic(auth:PGstRTSPAuth; basic:Pgchar);cdecl;external libgstrtsp;
procedure gst_rtsp_auth_add_digest(auth:PGstRTSPAuth; user:Pgchar; pass:Pgchar; token:PGstRTSPToken);cdecl;external libgstrtsp;
procedure gst_rtsp_auth_remove_digest(auth:PGstRTSPAuth; user:Pgchar);cdecl;external libgstrtsp;
procedure gst_rtsp_auth_set_supported_methods(auth:PGstRTSPAuth; methods:TGstRTSPAuthMethod);cdecl;external libgstrtsp;
function gst_rtsp_auth_get_supported_methods(auth:PGstRTSPAuth):TGstRTSPAuthMethod;cdecl;external libgstrtsp;
function gst_rtsp_auth_check(check:Pgchar):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_auth_parse_htdigest(auth:PGstRTSPAuth; path:Pgchar; token:PGstRTSPToken):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_auth_set_realm(auth:PGstRTSPAuth; realm:Pgchar);cdecl;external libgstrtsp;
function gst_rtsp_auth_get_realm(auth:PGstRTSPAuth):Pgchar;cdecl;external libgstrtsp;
{ helpers  }
function gst_rtsp_auth_make_basic(user:Pgchar; pass:Pgchar):Pgchar;cdecl;external libgstrtsp;
{ checks  }
{*
 * GST_RTSP_AUTH_CHECK_CONNECT:
 *
 * Check a new connection
  }
const
  GST_RTSP_AUTH_CHECK_CONNECT = 'auth.check.connect';  
{*
 * GST_RTSP_AUTH_CHECK_URL:
 *
 * Check the URL and methods
  }
  GST_RTSP_AUTH_CHECK_URL = 'auth.check.url';  
{*
 * GST_RTSP_AUTH_CHECK_MEDIA_FACTORY_ACCESS:
 *
 * Check if access is allowed to a factory.
 * When access is not allowed an 404 Not Found is sent in the response.
  }
  GST_RTSP_AUTH_CHECK_MEDIA_FACTORY_ACCESS = 'auth.check.media.factory.access';  
{*
 * GST_RTSP_AUTH_CHECK_MEDIA_FACTORY_CONSTRUCT:
 *
 * Check if media can be constructed from a media factory
 * A response should be sent on error.
  }
  GST_RTSP_AUTH_CHECK_MEDIA_FACTORY_CONSTRUCT = 'auth.check.media.factory.construct';  
{*
 * GST_RTSP_AUTH_CHECK_TRANSPORT_CLIENT_SETTINGS:
 *
 * Check if the client can specify TTL, destination and
 * port pair in multicast. No response is sent when the check returns
 * %FALSE.
  }
  GST_RTSP_AUTH_CHECK_TRANSPORT_CLIENT_SETTINGS = 'auth.check.transport.client-settings';  
{ tokens  }
{*
 * GST_RTSP_TOKEN_MEDIA_FACTORY_ROLE:
 *
 * G_TYPE_STRING, the role to use when dealing with media factories
 *
 * The default #GstRTSPAuth object uses this string in the token to find the
 * role of the media factory. It will then retrieve the #GstRTSPPermissions of
 * the media factory and retrieve the role with the same name.
  }
  GST_RTSP_TOKEN_MEDIA_FACTORY_ROLE = 'media.factory.role';  
{*
 * GST_RTSP_TOKEN_TRANSPORT_CLIENT_SETTINGS:
 *
 * G_TYPE_BOOLEAN, %TRUE if the client can specify TTL, destination and
 *     port pair in multicast.
  }
  GST_RTSP_TOKEN_TRANSPORT_CLIENT_SETTINGS = 'transport.client-settings';  
{ permissions  }
{*
 * GST_RTSP_PERM_MEDIA_FACTORY_ACCESS:
 *
 * G_TYPE_BOOLEAN, %TRUE if the media can be accessed, %FALSE will
 * return a 404 Not Found error when trying to access the media.
  }
  GST_RTSP_PERM_MEDIA_FACTORY_ACCESS = 'media.factory.access';  
{*
 * GST_RTSP_PERM_MEDIA_FACTORY_CONSTRUCT:
 *
 * G_TYPE_BOOLEAN, %TRUE if the media can be constructed, %FALSE will
 * return a 404 Not Found error when trying to access the media.
  }
  GST_RTSP_PERM_MEDIA_FACTORY_CONSTRUCT = 'media.factory.construct';  
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPAuth, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_AUTH_H__  }

// === Konventiert am: 20-7-26 13:45:51 ===

function GST_TYPE_RTSP_AUTH : TGType;

implementation

function GST_TYPE_RTSP_AUTH : TGType;
  begin
    GST_TYPE_RTSP_AUTH:=gst_rtsp_auth_get_type;
  end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_AUTH(obj : longint) : longint;
begin
  GST_IS_RTSP_AUTH:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_AUTH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_AUTH_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_AUTH_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_AUTH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_AUTH_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_AUTH_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_AUTH,GstRTSPAuthClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_AUTH(obj : longint) : longint;
begin
  GST_RTSP_AUTH:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_AUTH,GstRTSPAuth);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_AUTH_CLASS(klass : longint) : longint;
begin
  GST_RTSP_AUTH_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_AUTH,GstRTSPAuthClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_AUTH_CAST(obj : longint) : PGstRTSPAuth;
begin
  GST_RTSP_AUTH_CAST:=PGstRTSPAuth(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_AUTH_CLASS_CAST(klass : longint) : PGstRTSPAuthClass;
begin
  GST_RTSP_AUTH_CLASS_CAST:=PGstRTSPAuthClass(klass);
end;


end.
