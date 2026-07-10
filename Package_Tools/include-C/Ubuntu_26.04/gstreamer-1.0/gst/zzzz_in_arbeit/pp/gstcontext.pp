
unit gstcontext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcontext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcontext.h
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
PGstContext  = ^GstContext;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2013 Collabora Ltd.
 *   Author: Sebastian Dröge <sebastian.droege@collabora.co.uk>
 * Copyright (C) 2013 Sebastian Dröge <slomo@circular-chaos.org>
 *
 * gstcontext.h: Header for GstContext subsystem
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
{$ifndef __GST_CONTEXT_H__}
{$define __GST_CONTEXT_H__}
{$include <glib.h>}
type
{$include <gst/gstminiobject.h>}
{$include <gst/gststructure.h>}
  var
    _gst_context_type : TGType;cvar;external;

const
  GST_TYPE_CONTEXT = _gst_context_type;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_IS_CONTEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CONTEXT_CAST(obj : longint) : PGstContext;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CONTEXT(obj : longint) : longint;

function gst_context_get_type:TGType;cdecl;external;
function gst_context_ref(context:PGstContext):PGstContext;cdecl;external;
procedure gst_context_unref(context:PGstContext);cdecl;external;
procedure gst_clear_context(context_ptr:PPGstContext);cdecl;external;
(* Const before type ignored *)
function gst_context_copy(context:PGstContext):PGstContext;cdecl;external;
function gst_context_make_writable(context:PGstContext):PGstContext;cdecl;external;
(* Const before type ignored *)
function gst_context_is_writable(context:PGstContext):Tgboolean;cdecl;external;
function gst_context_replace(old_context:PPGstContext; new_context:PGstContext):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_context_new(context_type:Pgchar; persistent:Tgboolean):PGstContext;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_context_get_context_type(context:PGstContext):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_context_has_context_type(context:PGstContext; context_type:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_context_get_structure(context:PGstContext):PGstStructure;cdecl;external;
function gst_context_writable_structure(context:PGstContext):PGstStructure;cdecl;external;
(* Const before type ignored *)
function gst_context_is_persistent(context:PGstContext):Tgboolean;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstContext, gst_context_unref) }
{$endif}
{ __GST_CONTEXT_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_CONTEXT(obj : longint) : longint;
begin
  GST_IS_CONTEXT:=GST_IS_MINI_OBJECT_TYPE(obj,GST_TYPE_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_CONTEXT_CAST(obj : longint) : PGstContext;
begin
  GST_CONTEXT_CAST:=PGstContext(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_CONTEXT(obj : longint) : longint;
begin
  GST_CONTEXT:=GST_CONTEXT_CAST(obj);
end;


end.
