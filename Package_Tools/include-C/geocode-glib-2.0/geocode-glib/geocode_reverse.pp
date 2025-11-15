
unit geocode_reverse;
interface

{
  Automatically converted by H2Pas 1.0.0 from geocode_reverse.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    geocode_reverse.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGeocodeBackend  = ^GeocodeBackend;
PGeocodeLocation  = ^GeocodeLocation;
PGeocodePlace  = ^GeocodePlace;
PGeocodeReverse  = ^GeocodeReverse;
PGeocodeReverseClass  = ^GeocodeReverseClass;
PGeocodeReversePrivate  = ^GeocodeReversePrivate;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
   Copyright 2011 Bastien Nocera

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
{$ifndef GEOCODE_REVERSE_H}
{$define GEOCODE_REVERSE_H}
{$include <glib.h>}
{$include <gio/gio.h>}
{$include "geocode-place.h"}
{$include "geocode-backend.h"}

function geocode_reverse_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GEOCODE_TYPE_REVERSE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_REVERSE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_REVERSE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_REVERSE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_REVERSE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_REVERSE_GET_CLASS(obj : longint) : longint;

{*
 * GeocodeReverse:
 *
 * All the fields in the #GeocodeReverse structure are private and should never be accessed directly.
* }
type
{ <private>  }
  PGeocodeReverse = ^TGeocodeReverse;
  TGeocodeReverse = record
      parent_instance : TGObject;
      priv : PGeocodeReversePrivate;
    end;

{*
 * GeocodeReverseClass:
 *
 * All the fields in the #GeocodeReverseClass structure are private and should never be accessed directly.
* }
{ <private>  }
  PGeocodeReverseClass = ^TGeocodeReverseClass;
  TGeocodeReverseClass = record
      parent_class : TGObjectClass;
    end;


function geocode_reverse_new_for_location(location:PGeocodeLocation):PGeocodeReverse;cdecl;external;
procedure geocode_reverse_set_backend(object:PGeocodeReverse; backend:PGeocodeBackend);cdecl;external;
procedure geocode_reverse_resolve_async(object:PGeocodeReverse; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function geocode_reverse_resolve_finish(object:PGeocodeReverse; res:PGAsyncResult; error:PPGError):PGeocodePlace;cdecl;external;
function geocode_reverse_resolve(object:PGeocodeReverse; error:PPGError):PGeocodePlace;cdecl;external;
{$endif}
{ GEOCODE_REVERSE_H  }

implementation

{ was #define dname def_expr }
function GEOCODE_TYPE_REVERSE : longint; { return type might be wrong }
  begin
    GEOCODE_TYPE_REVERSE:=geocode_reverse_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_REVERSE(obj : longint) : longint;
begin
  GEOCODE_REVERSE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEOCODE_TYPE_REVERSE,GeocodeReverse);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_REVERSE_CLASS(klass : longint) : longint;
begin
  GEOCODE_REVERSE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEOCODE_TYPE_REVERSE,GeocodeReverseClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_REVERSE(obj : longint) : longint;
begin
  GEOCODE_IS_REVERSE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEOCODE_TYPE_REVERSE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_REVERSE_CLASS(klass : longint) : longint;
begin
  GEOCODE_IS_REVERSE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEOCODE_TYPE_REVERSE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_REVERSE_GET_CLASS(obj : longint) : longint;
begin
  GEOCODE_REVERSE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEOCODE_TYPE_REVERSE,GeocodeReverseClass);
end;


end.
