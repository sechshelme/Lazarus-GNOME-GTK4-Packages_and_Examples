unit ibusobject;

interface

uses
  fp_glib2, ibus;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ ibus - The Input Bus
 * Copyright (C) 2008-2013 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2008-2013 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
 * USA
  }
{ define GOBJECT macros  }

{*
 * IBusObjectFlags:
 * @IBUS_IN_DESTRUCTION: Used in GObjectClass::dispose
 * @IBUS_DESTROYED: Used during emitting IBusObject::destroy signal.
 * @IBUS_RESERVED_1: Reserved.
 * @IBUS_RESERVED_2: Reserved.
 *
 * The flags are used internally.
  }
type
  PIBusObjectFlags = ^TIBusObjectFlags;
  TIBusObjectFlags =  Longint;
  Const
    IBUS_IN_DESTRUCTION = 1 shl 0;
    IBUS_DESTROYED = 1 shl 1;
    IBUS_RESERVED_1 = 1 shl 2;
    IBUS_RESERVED_2 = 1 shl 3;
;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IBUS_OBJECT_FLAGS(obj : longint) : longint;

{ xxxxxxxxxxx }
{#define IBUS_OBJECT_SET_FLAGS(obj,flag)     (IBUS_OBJECT_FLAGS (obj) |= (flag))  }
{#define IBUS_OBJECT_UNSET_FLAGS(obj,flag)   (IBUS_OBJECT_FLAGS (obj) &= ~(flag)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_OBJECT_IN_DESTRUCTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_OBJECT_DESTROYED(obj : longint) : longint;

type
{*
 * IBusObject:
 *
 * All the fields in the <structname>IBusObject</structname> structure are
 * private to the #IBusObject and should never be accessed directly.
  }
{ instance members  }
  PIBusObject = ^TIBusObject;
  TIBusObject = record
      parent : TGInitiallyUnowned;
      flags : Tguint32;
      priv : PIBusObjectPrivate;
    end;


  TIBusObjectDestroyFunc = procedure (object:PIBusObject);cdecl;
{ signals  }
{< private > }
{ padding  }
  PIBusObjectClass = ^TIBusObjectClass;
  TIBusObjectClass = record
      parent : TGInitiallyUnownedClass;cdecl;
      destroy : procedure (object:PIBusObject);cdecl;
      pdummy : array[0..6] of Tgpointer;
    end;


function ibus_object_get_type:TGType;cdecl;external libibus;
{*
 * ibus_object_new:
 *
 * Creates  a new #IBusObject.
 *
 * Returns: A newly allocated #IBusObject
  }
function ibus_object_new:PIBusObject;cdecl;external libibus;
{*
 * ibus_object_destroy:
 * @object: an #IBusObject to destroy.
 *
 * Emit the "destroy" signal notifying all reference holders that they should
 * release the #IBusObject.
 *
 * The memory for the object itself won't be deleted until its reference count
 * actually drops to 0; ibus_object_destroy merely asks reference holders to
 * release their references. It does not free the object.
  }
procedure ibus_object_destroy(object:PIBusObject);cdecl;external libibus;
{$endif}

// === Konventiert am: 25-7-25 15:02:10 ===


implementation

function IBUS_TYPE_OBJECT : TGType;
  begin
    IBUS_TYPE_OBJECT:=ibus_object_get_type;
  end;

function IBUS_OBJECT(obj : Pointer) : PIBusObject;
begin
  Result := PIBusObject(g_type_check_instance_cast(obj, IBUS_TYPE_OBJECT));
end;

function IBUS_OBJECT_CLASS(klass : Pointer) : PIBusObjectClass;
begin
  Result := PIBusObjectClass(g_type_check_class_cast(klass, IBUS_TYPE_OBJECT));
end;

function IBUS_IS_OBJECT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  IBUS_TYPE_OBJECT);
end;

function IBUS_IS_OBJECT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  IBUS_TYPE_OBJECT);
end;

function IBUS_OBJECT_GET_CLASS(obj : Pointer) : PIBusObjectClass;
begin
  Result := PIBusObjectClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_OBJECT_FLAGS(obj : longint) : longint;
begin
  IBUS_OBJECT_FLAGS:=(IBUS_OBJECT(obj))^.flags;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_OBJECT_IN_DESTRUCTION(obj : longint) : longint;
begin
  IBUS_OBJECT_IN_DESTRUCTION:=(IBUS_OBJECT_FLAGS(obj)) and IBUS_IN_DESTRUCTION;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IBUS_OBJECT_DESTROYED(obj : longint) : longint;
begin
  IBUS_OBJECT_DESTROYED:=(IBUS_OBJECT_FLAGS(obj)) and IBUS_DESTROYED;
end;


end.
