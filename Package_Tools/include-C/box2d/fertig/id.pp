
unit id;
interface

{
  Automatically converted by H2Pas 1.0.0 from id.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    id.h
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
Pb2BodyId  = ^b2BodyId;
Pb2ChainId  = ^b2ChainId;
Pb2ContactId  = ^b2ContactId;
Pb2JointId  = ^b2JointId;
Pb2ShapeId  = ^b2ShapeId;
Pb2WorldId  = ^b2WorldId;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-FileCopyrightText: 2023 Erin Catto }
{ SPDX-License-Identifier: MIT }
(** unsupported pragma#pragma once*)
{$include <stdint.h>}
{ Note: this file should be stand-alone }
{*
 * @defgroup id Ids
 * These ids serve as handles to internal Box2D objects.
 * These should be considered opaque data and passed by value.
 * Include this header if you need the id types and not the whole Box2D API.
 * All ids are considered null if initialized to zero.
 *
 * For example in C++:
 *
 * @code.cxx
 * b2WorldId worldId = ;
 * @endcode
 *
 * Or in C:
 *
 * @code.c
 * b2WorldId worldId = 0;
 * @endcode
 *
 * These are both considered null.
 *
 * @warning Do not use the internals of these ids. They are subject to change. Ids should be treated as opaque objects.
 * @warning You should use ids to access objects in Box2D. Do not access files within the src folder. Such usage is unsupported.
 * @
  }
{/ World id references a world instance. This should be treated as an opaque handle. }
type
  Pb2WorldId = ^Tb2WorldId;
  Tb2WorldId = record
      index1 : Tuint16_t;
      generation : Tuint16_t;
    end;
{/ Body id references a body instance. This should be treated as an opaque handle. }

  Pb2BodyId = ^Tb2BodyId;
  Tb2BodyId = record
      index1 : Tint32_t;
      world0 : Tuint16_t;
      generation : Tuint16_t;
    end;
{/ Shape id references a shape instance. This should be treated as an opaque handle. }

  Pb2ShapeId = ^Tb2ShapeId;
  Tb2ShapeId = record
      index1 : Tint32_t;
      world0 : Tuint16_t;
      generation : Tuint16_t;
    end;
{/ Chain id references a chain instances. This should be treated as an opaque handle. }

  Pb2ChainId = ^Tb2ChainId;
  Tb2ChainId = record
      index1 : Tint32_t;
      world0 : Tuint16_t;
      generation : Tuint16_t;
    end;
{/ Joint id references a joint instance. This should be treated as an opaque handle. }

  Pb2JointId = ^Tb2JointId;
  Tb2JointId = record
      index1 : Tint32_t;
      world0 : Tuint16_t;
      generation : Tuint16_t;
    end;
{/ Contact id references a contact instance. This should be treated as an opaque handled. }

  Pb2ContactId = ^Tb2ContactId;
  Tb2ContactId = record
      index1 : Tint32_t;
      world0 : Tuint16_t;
      padding : Tint16_t;
      generation : Tuint32_t;
    end;
{/ Use these to make your identifiers null. }
{/ You may also use zero initialization to get null. }
{ xxxxxxxxxxx 
static const b2WorldId b2_nullWorldId = B2_NULL_ID;
static const b2BodyId b2_nullBodyId = B2_NULL_ID;
static const b2ShapeId b2_nullShapeId = B2_NULL_ID;
static const b2ChainId b2_nullChainId = B2_NULL_ID;
static const b2JointId b2_nullJointId = B2_NULL_ID;
static const b2ContactId b2_nullContactId = B2_NULL_ID;
 }
{/ Macro to determine if any id is null. }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function B2_IS_NULL(id : longint) : longint;

{/ Macro to determine if any id is non-null. }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function B2_IS_NON_NULL(id : longint) : longint;

{/ Compare two ids for equality. Doesn't work for b2WorldId. Don't mix types. }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function B2_ID_EQUALS(id1,id2 : longint) : longint;

{/ Store a world id into a uint32_t. }
function b2StoreWorldId(id:Tb2WorldId):Tuint32_t;cdecl;external;
function b2LoadWorldId(x:Tuint32_t):Tb2WorldId;cdecl;external;
function b2StoreBodyId(id:Tb2BodyId):Tuint64_t;cdecl;external;
function b2LoadBodyId(x:Tuint64_t):Tb2BodyId;cdecl;external;
function b2StoreShapeId(id:Tb2ShapeId):Tuint64_t;cdecl;external;
function b2LoadShapeId(x:Tuint64_t):Tb2ShapeId;cdecl;external;
function b2StoreChainId(id:Tb2ChainId):Tuint64_t;cdecl;external;
function b2LoadChainId(x:Tuint64_t):Tb2ChainId;cdecl;external;
function b2StoreJointId(id:Tb2JointId):Tuint64_t;cdecl;external;
function b2LoadJointId(x:Tuint64_t):Tb2JointId;cdecl;external;
procedure b2StoreContactId(id:Tb2ContactId; values:array[0..2] of Tuint32_t);cdecl;external;
function b2LoadContactId(values:array[0..2] of Tuint32_t):Tb2ContactId;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function B2_IS_NULL(id : longint) : longint;
begin
  B2_IS_NULL:=(id.index1)=0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function B2_IS_NON_NULL(id : longint) : longint;
begin
  B2_IS_NON_NULL:=(id.index1)<>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function B2_ID_EQUALS(id1,id2 : longint) : longint;
begin
  B2_ID_EQUALS:=(((id1.index1)=((id2.index1) and (@(id1.world0))))=((id2.world0) and (@(id1.generation))))=(id2.generation);
end;


end.
