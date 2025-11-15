unit geocode_forward;

interface

uses
  fp_glib2;

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

function geocode_forward_get_type:TGType;cdecl;external geocode_glib;
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


function geocode_forward_new_for_string(str:Pchar):PGeocodeForward;cdecl;external geocode_glib;
function geocode_forward_new_for_params(params:PGHashTable):PGeocodeForward;cdecl;external geocode_glib;
function geocode_forward_get_answer_count(forward:PGeocodeForward):Tguint;cdecl;external geocode_glib;
procedure geocode_forward_set_answer_count(forward:PGeocodeForward; count:Tguint);cdecl;external geocode_glib;
function geocode_forward_get_search_area(forward:PGeocodeForward):PGeocodeBoundingBox;cdecl;external geocode_glib;
procedure geocode_forward_set_search_area(forward:PGeocodeForward; box:PGeocodeBoundingBox);cdecl;external geocode_glib;
function geocode_forward_get_bounded(forward:PGeocodeForward):Tgboolean;cdecl;external geocode_glib;
procedure geocode_forward_set_bounded(forward:PGeocodeForward; bounded:Tgboolean);cdecl;external geocode_glib;
procedure geocode_forward_search_async(forward:PGeocodeForward; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external geocode_glib;
function geocode_forward_search_finish(forward:PGeocodeForward; res:PGAsyncResult; error:PPGError):PGList;cdecl;external geocode_glib;
function geocode_forward_search(forward:PGeocodeForward; error:PPGError):PGList;cdecl;external geocode_glib;
procedure geocode_forward_set_backend(forward:PGeocodeForward; backend:PGeocodeBackend);cdecl;external geocode_glib;
{$endif}
{ GEOCODE_FORWARD_H  }

// === Konventiert am: 15-11-25 16:51:48 ===

function GEOCODE_TYPE_FORWARD : TGType;
function GEOCODE_FORWARD(obj : Pointer) : PGeocodeForward;
function GEOCODE_FORWARD_CLASS(klass : Pointer) : PGeocodeForwardClass;
function GEOCODE_IS_FORWARD(obj : Pointer) : Tgboolean;
function GEOCODE_IS_FORWARD_CLASS(klass : Pointer) : Tgboolean;
function GEOCODE_FORWARD_GET_CLASS(obj : Pointer) : PGeocodeForwardClass;

implementation

function GEOCODE_TYPE_FORWARD : TGType;
  begin
    GEOCODE_TYPE_FORWARD:=geocode_forward_get_type;
  end;

function GEOCODE_FORWARD(obj : Pointer) : PGeocodeForward;
begin
  Result := PGeocodeForward(g_type_check_instance_cast(obj, GEOCODE_TYPE_FORWARD));
end;

function GEOCODE_FORWARD_CLASS(klass : Pointer) : PGeocodeForwardClass;
begin
  Result := PGeocodeForwardClass(g_type_check_class_cast(klass, GEOCODE_TYPE_FORWARD));
end;

function GEOCODE_IS_FORWARD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GEOCODE_TYPE_FORWARD);
end;

function GEOCODE_IS_FORWARD_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GEOCODE_TYPE_FORWARD);
end;

function GEOCODE_FORWARD_GET_CLASS(obj : Pointer) : PGeocodeForwardClass;
begin
  Result := PGeocodeForwardClass(PGTypeInstance(obj)^.g_class);
end;



end.
