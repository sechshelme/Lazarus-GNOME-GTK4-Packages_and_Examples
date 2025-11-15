
unit geocode_forward;
interface

{
  Automatically converted by H2Pas 1.0.0 from geocode_forward.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    geocode_forward.h
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
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGeocodeBackend  = ^GeocodeBackend;
PGeocodeBoundingBox  = ^GeocodeBoundingBox;
PGeocodeForward  = ^GeocodeForward;
PGeocodeForwardClass  = ^GeocodeForwardClass;
PGeocodeForwardPrivate  = ^GeocodeForwardPrivate;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGList  = ^GList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
   Copyright 2012 Bastien Nocera

   The Gnome Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public License as
   published by the Free Software Foundation; either version 2 of the
   License, or (at your option) any later version.

   The Gnome Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with the Gnome Library; see the file COPYING.LIB.  If not,
   write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301  USA.

   Authors: Bastien Nocera <hadess@hadess.net>

  }
{$ifndef GEOCODE_FORWARD_H}
{$define GEOCODE_FORWARD_H}
{$include <glib.h>}
{$include <gio/gio.h>}
{$include <geocode-glib/geocode-glib.h>}
{$include <geocode-glib/geocode-backend.h>}
{$include <geocode-glib/geocode-bounding-box.h>}

function geocode_forward_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GEOCODE_TYPE_FORWARD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_FORWARD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_FORWARD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_FORWARD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_FORWARD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_FORWARD_GET_CLASS(obj : longint) : longint;

{*
 * GeocodeForward:
 *
 * All the fields in the #GeocodeForward structure are private and should never be accessed directly.
* }
type
{ <private>  }
  PGeocodeForward = ^TGeocodeForward;
  TGeocodeForward = record
      parent_instance : TGObject;
      priv : PGeocodeForwardPrivate;
    end;

{*
 * GeocodeForwardClass:
 *
 * All the fields in the #GeocodeForwardClass structure are private and should never be accessed directly.
* }
{ <private>  }
  PGeocodeForwardClass = ^TGeocodeForwardClass;
  TGeocodeForwardClass = record
      parent_class : TGObjectClass;
    end;

(* Const before type ignored *)

function geocode_forward_new_for_string(str:Pchar):PGeocodeForward;cdecl;external;
function geocode_forward_new_for_params(params:PGHashTable):PGeocodeForward;cdecl;external;
function geocode_forward_get_answer_count(forward:PGeocodeForward):Tguint;cdecl;external;
procedure geocode_forward_set_answer_count(forward:PGeocodeForward; count:Tguint);cdecl;external;
function geocode_forward_get_search_area(forward:PGeocodeForward):PGeocodeBoundingBox;cdecl;external;
procedure geocode_forward_set_search_area(forward:PGeocodeForward; box:PGeocodeBoundingBox);cdecl;external;
function geocode_forward_get_bounded(forward:PGeocodeForward):Tgboolean;cdecl;external;
procedure geocode_forward_set_bounded(forward:PGeocodeForward; bounded:Tgboolean);cdecl;external;
procedure geocode_forward_search_async(forward:PGeocodeForward; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function geocode_forward_search_finish(forward:PGeocodeForward; res:PGAsyncResult; error:PPGError):PGList;cdecl;external;
function geocode_forward_search(forward:PGeocodeForward; error:PPGError):PGList;cdecl;external;
procedure geocode_forward_set_backend(forward:PGeocodeForward; backend:PGeocodeBackend);cdecl;external;
{$endif}
{ GEOCODE_FORWARD_H  }

implementation

{ was #define dname def_expr }
function GEOCODE_TYPE_FORWARD : longint; { return type might be wrong }
  begin
    GEOCODE_TYPE_FORWARD:=geocode_forward_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_FORWARD(obj : longint) : longint;
begin
  GEOCODE_FORWARD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEOCODE_TYPE_FORWARD,GeocodeForward);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_FORWARD_CLASS(klass : longint) : longint;
begin
  GEOCODE_FORWARD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEOCODE_TYPE_FORWARD,GeocodeForwardClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_FORWARD(obj : longint) : longint;
begin
  GEOCODE_IS_FORWARD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEOCODE_TYPE_FORWARD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_FORWARD_CLASS(klass : longint) : longint;
begin
  GEOCODE_IS_FORWARD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEOCODE_TYPE_FORWARD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_FORWARD_GET_CLASS(obj : longint) : longint;
begin
  GEOCODE_FORWARD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEOCODE_TYPE_FORWARD,GeocodeForwardClass);
end;


end.
