unit geocode_reverse;

interface

uses
  fp_glib2;

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

function geocode_reverse_get_type:TGType;cdecl;external geocode_glib;
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


function geocode_reverse_new_for_location(location:PGeocodeLocation):PGeocodeReverse;cdecl;external geocode_glib;
procedure geocode_reverse_set_backend(object:PGeocodeReverse; backend:PGeocodeBackend);cdecl;external geocode_glib;
procedure geocode_reverse_resolve_async(object:PGeocodeReverse; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external geocode_glib;
function geocode_reverse_resolve_finish(object:PGeocodeReverse; res:PGAsyncResult; error:PPGError):PGeocodePlace;cdecl;external geocode_glib;
function geocode_reverse_resolve(object:PGeocodeReverse; error:PPGError):PGeocodePlace;cdecl;external geocode_glib;
{$endif}
{ GEOCODE_REVERSE_H  }

// === Konventiert am: 15-11-25 16:53:08 ===

function GEOCODE_TYPE_REVERSE : TGType;
function GEOCODE_REVERSE(obj : Pointer) : PGeocodeReverse;
function GEOCODE_REVERSE_CLASS(klass : Pointer) : PGeocodeReverseClass;
function GEOCODE_IS_REVERSE(obj : Pointer) : Tgboolean;
function GEOCODE_IS_REVERSE_CLASS(klass : Pointer) : Tgboolean;
function GEOCODE_REVERSE_GET_CLASS(obj : Pointer) : PGeocodeReverseClass;

implementation

function GEOCODE_TYPE_REVERSE : TGType;
  begin
    GEOCODE_TYPE_REVERSE:=geocode_reverse_get_type;
  end;

function GEOCODE_REVERSE(obj : Pointer) : PGeocodeReverse;
begin
  Result := PGeocodeReverse(g_type_check_instance_cast(obj, GEOCODE_TYPE_REVERSE));
end;

function GEOCODE_REVERSE_CLASS(klass : Pointer) : PGeocodeReverseClass;
begin
  Result := PGeocodeReverseClass(g_type_check_class_cast(klass, GEOCODE_TYPE_REVERSE));
end;

function GEOCODE_IS_REVERSE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GEOCODE_TYPE_REVERSE);
end;

function GEOCODE_IS_REVERSE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GEOCODE_TYPE_REVERSE);
end;

function GEOCODE_REVERSE_GET_CLASS(obj : Pointer) : PGeocodeReverseClass;
begin
  Result := PGeocodeReverseClass(PGTypeInstance(obj)^.g_class);
end;



end.
