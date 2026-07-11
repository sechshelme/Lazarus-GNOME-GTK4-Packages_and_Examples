unit gsturi;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2014 David Waring, British Broadcasting Corporation
 *                             <david.waring@rd.bbc.co.uk>
 *
 * gsturi.h: Header for uri to element mappings and URI manipulation.
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
{$ifndef __GST_URI_H__}
{$define __GST_URI_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gst/gstconfig.h>}
{*
 * gst_uri_error_quark: (attributes doc.skip=true)
  }

function gst_uri_error_quark:TGQuark;cdecl;external libgstreamer;
{*
 * GST_URI_ERROR:
 *
 * Get access to the error quark of the uri subsystem.
  }
{ was #define dname def_expr }
function GST_URI_ERROR : longint; { return type might be wrong }

{*
 * GstURIError:
 * @GST_URI_ERROR_UNSUPPORTED_PROTOCOL: The protocol is not supported
 * @GST_URI_ERROR_BAD_URI: There was a problem with the URI
 * @GST_URI_ERROR_BAD_STATE: Could not set or change the URI because the
 *     URI handler was in a state where that is not possible or not permitted
 * @GST_URI_ERROR_BAD_REFERENCE: There was a problem with the entity that
 *     the URI references
 *
 * Different URI-related errors that can occur.
  }
type
  PGstURIError = ^TGstURIError;
  TGstURIError =  Longint;
  Const
    GST_URI_ERROR_UNSUPPORTED_PROTOCOL = 0;
    GST_URI_ERROR_BAD_URI = 1;
    GST_URI_ERROR_BAD_STATE = 2;
    GST_URI_ERROR_BAD_REFERENCE = 3;
;
{*
 * GstURIType:
 * @GST_URI_UNKNOWN: The URI direction is unknown
 * @GST_URI_SINK: The URI is a consumer.
 * @GST_URI_SRC: The URI is a producer.
 *
 * The different types of URI direction.
  }
type
  PGstURIType = ^TGstURIType;
  TGstURIType =  Longint;
  Const
    GST_URI_UNKNOWN = 0;
    GST_URI_SINK = 1;
    GST_URI_SRC = 2;
;
{*
 * GST_URI_TYPE_IS_VALID:
 * @type: A #GstURIType
 *
 * Tests if the type direction is valid.
  }
{ uri handler functions  }

{ was #define dname def_expr }
function GST_TYPE_URI_HANDLER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_URI_HANDLER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_URI_HANDLER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_URI_HANDLER_GET_INTERFACE(obj : longint) : longint;

{*
 * GstURIHandler:
 *
 * Opaque #GstURIHandler structure.
  }
type
{$include <gst/gstelement.h>}
{$include "gstminiobject.h"}
{*
 * GstURIHandlerInterface:
 * @parent: The parent interface type
 * @get_type: Method to tell whether the element handles source or sink URI.
 * @get_protocols: Method to return the list of protocols handled by the element.
 * @get_uri: Method to return the URI currently handled by the element.
 * @set_uri: Method to set a new URI.
 *
 * Any #GstElement using this interface should implement these methods.
  }
{ vtable  }
{< public > }
{ querying capabilities  }
{ using the interface  }
type
  PGstURIHandlerInterface = ^TGstURIHandlerInterface;
  TGstURIHandlerInterface = record
      parent : TGTypeInterface;
      get_type : function (_type:TGType):TGstURIType;cdecl;
      get_protocols : function (_type:TGType):PPgchar;cdecl;
      get_uri : function (handler:PGstURIHandler):Pgchar;cdecl;
      set_uri : function (handler:PGstURIHandler; uri:Pgchar; error:PPGError):Tgboolean;cdecl;
    end;

{ general URI functions  }

function gst_uri_protocol_is_valid(protocol:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_protocol_is_supported(_type:TGstURIType; protocol:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_is_valid(uri:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_protocol(uri:Pgchar):Pgchar;cdecl;external libgstreamer;
function gst_uri_has_protocol(uri:Pgchar; protocol:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_location(uri:Pgchar):Pgchar;cdecl;external libgstreamer;
{xxxxxGLIB_DEPRECATED_IN(gst_uri_new) }
function gst_uri_construct(protocol:Pgchar; location:Pgchar):Pgchar;cdecl;external libgstreamer;
function gst_filename_to_uri(filename:Pgchar; error:PPGError):Pgchar;cdecl;external libgstreamer;
function gst_element_make_from_uri(_type:TGstURIType; uri:Pgchar; elementname:Pgchar; error:PPGError):PGstElement;cdecl;external libgstreamer;
{ accessing the interface  }
function gst_uri_handler_get_type:TGType;cdecl;external libgstreamer;
function gst_uri_handler_get_uri_type(handler:PGstURIHandler):TGstURIType;cdecl;external libgstreamer;
function gst_uri_handler_get_protocols(handler:PGstURIHandler):^Pgchar;cdecl;external libgstreamer;
function gst_uri_handler_get_uri(handler:PGstURIHandler):Pgchar;cdecl;external libgstreamer;
function gst_uri_handler_set_uri(handler:PGstURIHandler; uri:Pgchar; error:PPGError):Tgboolean;cdecl;external libgstreamer;
{
 * GstUri Type macros.
  }
{ was #define dname def_expr }
function GST_TYPE_URI : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_URI(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_URI_CAST(obj : longint) : PGstUri;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_URI_CONST_CAST(obj : longint) : PGstUri;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_URI(obj : longint) : longint;

{*
 * GstUri:
 *
 * This is a private structure that holds the various parts of a parsed URI.
  }
type
  PGstUri = ^TGstUri;
  TGstUri = record
      {undefined structure}
    end;

{*
 * GST_URI_NO_PORT:
 *
 * Value for #GstUri<!-- -->.port to indicate no port number.
  }

const
  GST_URI_NO_PORT = 0;  
{ used by GST_TYPE_URI  }

function gst_uri_get_type:TGType;cdecl;external libgstreamer;
{
 * Method definitions.
  }
function gst_uri_new(scheme:Pgchar; userinfo:Pgchar; host:Pgchar; port:Tguint; path:Pgchar; 
           query:Pgchar; fragment:Pgchar):PGstUri;cdecl;external libgstreamer;
function gst_uri_new_with_base(base:PGstUri; scheme:Pgchar; userinfo:Pgchar; host:Pgchar; port:Tguint; 
           path:Pgchar; query:Pgchar; fragment:Pgchar):PGstUri;cdecl;external libgstreamer;
function gst_uri_from_string(uri:Pgchar):PGstUri;cdecl;external libgstreamer;
function gst_uri_from_string_escaped(uri:Pgchar):PGstUri;cdecl;external libgstreamer;
function gst_uri_from_string_with_base(base:PGstUri; uri:Pgchar):PGstUri;cdecl;external libgstreamer;
function gst_uri_equal(first:PGstUri; second:PGstUri):Tgboolean;cdecl;external libgstreamer;
function gst_uri_join(base_uri:PGstUri; ref_uri:PGstUri):PGstUri;cdecl;external libgstreamer;
function gst_uri_join_strings(base_uri:Pgchar; ref_uri:Pgchar):Pgchar;cdecl;external libgstreamer;
function gst_uri_is_writable(uri:PGstUri):Tgboolean;cdecl;external libgstreamer;
function gst_uri_make_writable(uri:PGstUri):PGstUri;cdecl;external libgstreamer;
function gst_uri_to_string(uri:PGstUri):Pgchar;cdecl;external libgstreamer;
function gst_uri_to_string_with_keys(uri:PGstUri; keys:PGList):Pgchar;cdecl;external libgstreamer;
function gst_uri_is_normalized(uri:PGstUri):Tgboolean;cdecl;external libgstreamer;
function gst_uri_normalize(uri:PGstUri):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_scheme(uri:PGstUri):Pgchar;cdecl;external libgstreamer;
function gst_uri_set_scheme(uri:PGstUri; scheme:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_userinfo(uri:PGstUri):Pgchar;cdecl;external libgstreamer;
function gst_uri_set_userinfo(uri:PGstUri; userinfo:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_host(uri:PGstUri):Pgchar;cdecl;external libgstreamer;
function gst_uri_set_host(uri:PGstUri; host:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_port(uri:PGstUri):Tguint;cdecl;external libgstreamer;
function gst_uri_set_port(uri:PGstUri; port:Tguint):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_path(uri:PGstUri):Pgchar;cdecl;external libgstreamer;
function gst_uri_set_path(uri:PGstUri; path:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_path_string(uri:PGstUri):Pgchar;cdecl;external libgstreamer;
function gst_uri_set_path_string(uri:PGstUri; path:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_path_segments(uri:PGstUri):PGList;cdecl;external libgstreamer;
function gst_uri_set_path_segments(uri:PGstUri; path_segments:PGList):Tgboolean;cdecl;external libgstreamer;
function gst_uri_append_path(uri:PGstUri; relative_path:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_append_path_segment(uri:PGstUri; path_segment:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_query_string(uri:PGstUri):Pgchar;cdecl;external libgstreamer;
function gst_uri_get_query_string_ordered(uri:PGstUri; keys:PGList):Pgchar;cdecl;external libgstreamer;
function gst_uri_set_query_string(uri:PGstUri; query:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_query_table(uri:PGstUri):PGHashTable;cdecl;external libgstreamer;
function gst_uri_set_query_table(uri:PGstUri; query_table:PGHashTable):Tgboolean;cdecl;external libgstreamer;
function gst_uri_set_query_value(uri:PGstUri; query_key:Pgchar; query_value:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_remove_query_key(uri:PGstUri; query_key:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_query_has_key(uri:PGstUri; query_key:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_query_value(uri:PGstUri; query_key:Pgchar):Pgchar;cdecl;external libgstreamer;
function gst_uri_get_query_keys(uri:PGstUri):PGList;cdecl;external libgstreamer;
function gst_uri_get_fragment(uri:PGstUri):Pgchar;cdecl;external libgstreamer;
function gst_uri_set_fragment(uri:PGstUri; fragment:Pgchar):Tgboolean;cdecl;external libgstreamer;
function gst_uri_get_media_fragment_table(uri:PGstUri):PGHashTable;cdecl;external libgstreamer;
function gst_uri_copy(uri:PGstUri):PGstUri;cdecl;external libgstreamer;
function gst_uri_ref(uri:PGstUri):PGstUri;cdecl;external libgstreamer;
procedure gst_uri_unref(uri:PGstUri);cdecl;external libgstreamer;
procedure gst_clear_uri(uri_ptr:PPGstUri);cdecl;external libgstreamer;
{$endif}
{ __GST_URI_H__  }

// === Konventiert am: 11-7-26 15:54:06 ===


implementation


{ was #define dname def_expr }
function GST_URI_ERROR : longint; { return type might be wrong }
  begin
    GST_URI_ERROR:=gst_uri_error_quark;
  end;

{ was #define dname def_expr }
function GST_TYPE_URI_HANDLER : longint; { return type might be wrong }
  begin
    GST_TYPE_URI_HANDLER:=gst_uri_handler_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_URI_HANDLER(obj : longint) : longint;
begin
  GST_URI_HANDLER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_URI_HANDLER,GstURIHandler);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_URI_HANDLER(obj : longint) : longint;
begin
  GST_IS_URI_HANDLER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_URI_HANDLER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_URI_HANDLER_GET_INTERFACE(obj : longint) : longint;
begin
  GST_URI_HANDLER_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,GST_TYPE_URI_HANDLER,GstURIHandlerInterface);
end;

{ was #define dname def_expr }
function GST_TYPE_URI : longint; { return type might be wrong }
  begin
    GST_TYPE_URI:=gst_uri_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_URI(obj : longint) : longint;
begin
  GST_IS_URI:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_URI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_URI_CAST(obj : longint) : PGstUri;
begin
  GST_URI_CAST:=PGstUri(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_URI_CONST_CAST(obj : longint) : PGstUri;
begin
  GST_URI_CONST_CAST:=PGstUri(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_URI(obj : longint) : longint;
begin
  GST_URI:=GST_URI_CAST(obj);
end;


end.
