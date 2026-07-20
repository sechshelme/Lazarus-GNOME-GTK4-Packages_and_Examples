
unit rtsp_session;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_session.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_session
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
Pgint  = ^gint;
PGList  = ^GList;
PGstRTSPFilterResult  = ^GstRTSPFilterResult;
PGstRTSPMedia  = ^GstRTSPMedia;
PGstRTSPSession  = ^GstRTSPSession;
PGstRTSPSessionClass  = ^GstRTSPSessionClass;
PGstRTSPSessionMedia  = ^GstRTSPSessionMedia;
PGstRTSPSessionPrivate  = ^GstRTSPSessionPrivate;
PGTimeVal  = ^GTimeVal;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2008 Wim Taymans <wim.taymans at gmail.com>
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
{$include <gst/rtsp/gstrtsptransport.h>}
{$include "rtsp-server-prelude.h" /* for GST_RTSP_SERVER_DEPRECATED_FOR */}
{$ifndef __GST_RTSP_SESSION_H__}
{$define __GST_RTSP_SESSION_H__}

{ was #define dname def_expr }
function GST_TYPE_RTSP_SESSION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_CAST(obj : longint) : PGstRTSPSession;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_CLASS_CAST(klass : longint) : PGstRTSPSessionClass;

type
{*
 * GstRTSPFilterResult:
 * @GST_RTSP_FILTER_REMOVE: Remove session
 * @GST_RTSP_FILTER_KEEP: Keep session in the pool
 * @GST_RTSP_FILTER_REF: Ref session in the result list
 *
 * Possible return values for gst_rtsp_session_pool_filter().
  }

  PGstRTSPFilterResult = ^TGstRTSPFilterResult;
  TGstRTSPFilterResult =  Longint;
  Const
    GST_RTSP_FILTER_REMOVE = 0;
    GST_RTSP_FILTER_KEEP = 1;
    GST_RTSP_FILTER_REF = 2;
;
{$include "rtsp-media.h"}
{$include "rtsp-session-media.h"}
{*
 * GstRTSPSession:
 *
 * Session information kept by the server for a specific client.
 * One client session, identified with a session id, can handle multiple medias
 * identified with the url of a media.
  }
{< private > }
type
  PGstRTSPSession = ^TGstRTSPSession;
  TGstRTSPSession = record
      parent : TGObject;
      priv : PGstRTSPSessionPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstRTSPSessionClass = ^TGstRTSPSessionClass;
  TGstRTSPSessionClass = record
      parent_class : TGObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_session_get_type:TGType;cdecl;external;
{ create a new session  }
(* Const before type ignored *)
function gst_rtsp_session_new(sessionid:Pgchar):PGstRTSPSession;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_session_get_sessionid(session:PGstRTSPSession):Pgchar;cdecl;external;
function gst_rtsp_session_get_header(session:PGstRTSPSession):Pgchar;cdecl;external;
procedure gst_rtsp_session_set_timeout(session:PGstRTSPSession; timeout:Tguint);cdecl;external;
function gst_rtsp_session_get_timeout(session:PGstRTSPSession):Tguint;cdecl;external;
{ session timeout stuff  }
procedure gst_rtsp_session_touch(session:PGstRTSPSession);cdecl;external;
procedure gst_rtsp_session_prevent_expire(session:PGstRTSPSession);cdecl;external;
procedure gst_rtsp_session_allow_expire(session:PGstRTSPSession);cdecl;external;
function gst_rtsp_session_next_timeout_usec(session:PGstRTSPSession; now:Tgint64):Tgint;cdecl;external;
function gst_rtsp_session_is_expired_usec(session:PGstRTSPSession; now:Tgint64):Tgboolean;cdecl;external;
{GST_RTSP_SERVER_DEPRECATED_FOR(gst_rtsp_session_next_timeout_usec) }
function gst_rtsp_session_next_timeout(session:PGstRTSPSession; now:PGTimeVal):Tgint;cdecl;external;
{GST_RTSP_SERVER_DEPRECATED_FOR(gst_rtsp_session_is_expired_usec) }
function gst_rtsp_session_is_expired(session:PGstRTSPSession; now:PGTimeVal):Tgboolean;cdecl;external;
{ handle media in a session  }
(* Const before type ignored *)
function gst_rtsp_session_manage_media(sess:PGstRTSPSession; path:Pgchar; media:PGstRTSPMedia):PGstRTSPSessionMedia;cdecl;external;
function gst_rtsp_session_release_media(sess:PGstRTSPSession; media:PGstRTSPSessionMedia):Tgboolean;cdecl;external;
{ get media in a session  }
(* Const before type ignored *)
function gst_rtsp_session_get_media(sess:PGstRTSPSession; path:Pgchar; matched:Pgint):PGstRTSPSessionMedia;cdecl;external;
{ get media in a session, increasing its reference count  }
(* Const before type ignored *)
function gst_rtsp_session_dup_media(sess:PGstRTSPSession; path:Pgchar; matched:Pgint):PGstRTSPSessionMedia;cdecl;external;
{*
 * GstRTSPSessionFilterFunc:
 * @sess: a #GstRTSPSession object
 * @media: a #GstRTSPSessionMedia in @sess
 * @user_data: user data that has been given to gst_rtsp_session_filter()
 *
 * This function will be called by the gst_rtsp_session_filter(). An
 * implementation should return a value of #GstRTSPFilterResult.
 *
 * When this function returns #GST_RTSP_FILTER_REMOVE, @media will be removed
 * from @sess.
 *
 * A return value of #GST_RTSP_FILTER_KEEP will leave @media untouched in
 * @sess.
 *
 * A value of GST_RTSP_FILTER_REF will add @media to the result #GList of
 * gst_rtsp_session_filter().
 *
 * Returns: a #GstRTSPFilterResult.
  }
type

  TGstRTSPSessionFilterFunc = function (sess:PGstRTSPSession; media:PGstRTSPSessionMedia; user_data:Tgpointer):TGstRTSPFilterResult;cdecl;

function gst_rtsp_session_filter(sess:PGstRTSPSession; func:TGstRTSPSessionFilterFunc; user_data:Tgpointer):PGList;cdecl;external;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPSession, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_SESSION_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_SESSION : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_SESSION:=gst_rtsp_session_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION(obj : longint) : longint;
begin
  GST_IS_RTSP_SESSION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_SESSION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_SESSION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_SESSION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_SESSION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_SESSION,GstRTSPSessionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION(obj : longint) : longint;
begin
  GST_RTSP_SESSION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_SESSION,GstRTSPSession);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_CLASS(klass : longint) : longint;
begin
  GST_RTSP_SESSION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_SESSION,GstRTSPSessionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_CAST(obj : longint) : PGstRTSPSession;
begin
  GST_RTSP_SESSION_CAST:=PGstRTSPSession(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_CLASS_CAST(klass : longint) : PGstRTSPSessionClass;
begin
  GST_RTSP_SESSION_CLASS_CAST:=PGstRTSPSessionClass(klass);
end;


end.
