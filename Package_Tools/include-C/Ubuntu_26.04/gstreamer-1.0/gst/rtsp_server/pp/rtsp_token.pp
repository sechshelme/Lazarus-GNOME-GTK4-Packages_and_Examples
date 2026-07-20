
unit rtsp_token;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_token.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_token.h
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
PGstRTSPToken  = ^GstRTSPToken;
PGstStructure  = ^GstStructure;
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
{$ifndef __GST_RTSP_TOKEN_H__}
{$define __GST_RTSP_TOKEN_H__}
type
{$include "rtsp-auth.h"}

function gst_rtsp_token_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_RTSP_TOKEN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_TOKEN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_TOKEN_CAST(obj : longint) : PGstRTSPToken;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_TOKEN(obj : longint) : longint;

{*
 * GstRTSPToken:
 *
 * An opaque object used for checking authorisations.
 * It is generated after successful authentication.
  }
type
  PGstRTSPToken = ^TGstRTSPToken;
  TGstRTSPToken = record
      mini_object : TGstMiniObject;
    end;

{*cccccccc
static inline GstRTSPToken *
gst_rtsp_token_ref (GstRTSPToken * token)

  return (GstRTSPToken *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (token));


static inline void
gst_rtsp_token_unref (GstRTSPToken * token)

  gst_mini_object_unref (GST_MINI_OBJECT_CAST (token));

  }

function gst_rtsp_token_new_empty:PGstRTSPToken;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_token_new(firstfield:Pgchar; args:array of const):PGstRTSPToken;cdecl;external;
function gst_rtsp_token_new(firstfield:Pgchar):PGstRTSPToken;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_token_new_valist(firstfield:Pgchar; var_args:Tva_list):PGstRTSPToken;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_token_get_structure(token:PGstRTSPToken):PGstStructure;cdecl;external;
function gst_rtsp_token_writable_structure(token:PGstRTSPToken):PGstStructure;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gst_rtsp_token_set_string(token:PGstRTSPToken; field:Pgchar; string_value:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_token_get_string(token:PGstRTSPToken; field:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gst_rtsp_token_set_bool(token:PGstRTSPToken; field:Pgchar; bool_value:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gst_rtsp_token_is_allowed(token:PGstRTSPToken; field:Pgchar):Tgboolean;cdecl;external;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPToken, gst_rtsp_token_unref) }
{$endif}
{$endif}
{ __GST_RTSP_TOKEN_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_TOKEN : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_TOKEN:=gst_rtsp_token_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_TOKEN(obj : longint) : longint;
begin
  GST_IS_RTSP_TOKEN:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_RTSP_TOKEN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_TOKEN_CAST(obj : longint) : PGstRTSPToken;
begin
  GST_RTSP_TOKEN_CAST:=PGstRTSPToken(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_TOKEN(obj : longint) : longint;
begin
  GST_RTSP_TOKEN:=GST_RTSP_TOKEN_CAST(obj);
end;


end.
