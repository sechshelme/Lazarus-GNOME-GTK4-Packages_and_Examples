
unit collision;
interface

{
  Automatically converted by H2Pas 1.0.0 from collision.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    collision.h
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
Pbyte  = ^byte;
PdAABBTestFn  = ^dAABBTestFn;
PdColliderFn  = ^dColliderFn;
PdContactGeom  = ^dContactGeom;
PdGeomClass  = ^dGeomClass;
PdGeomDtorFn  = ^dGeomDtorFn;
PdGetAABBFn  = ^dGetAABBFn;
PdGetColliderFnFn  = ^dGetColliderFnFn;
PdHeightfieldDataID  = ^dHeightfieldDataID;
PdHeightfieldGetHeight  = ^dHeightfieldGetHeight;
PdNearCallback  = ^dNearCallback;
Pdouble  = ^double;
PdReal  = ^dReal;
Pdword  = ^dword;
PdxHeightfieldData  = ^dxHeightfieldData;
Plongint  = ^longint;
Psingle  = ^single;
Psmallint  = ^smallint;
Pxxxx  = ^xxxx;
Pxxxxxx  = ^xxxxxx;
Pxxxxxxx  = ^xxxxxxx;
Pxxxxxxxxx  = ^xxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001-2003 Russell L. Smith.       *
 * All rights reserved.  Email: russ@q12.org   Web: www.q12.org          *
 *                                                                       *
 * This library is free software; you can redistribute it and/or         *
 * modify it under the terms of EITHER:                                  *
 *   (1) The GNU Lesser General Public License as published by the Free  *
 *       Software Foundation; either version 2.1 of the License, or (at  *
 *       your option) any later version. The text of the GNU Lesser      *
 *       General Public License is included with this library in the     *
 *       file LICENSE.TXT.                                               *
 *   (2) The BSD-style license that is included with this library in     *
 *       the file LICENSE-BSD.TXT.                                       *
 *                                                                       *
 * This library is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the files    *
 * LICENSE.TXT and LICENSE-BSD.TXT for more details.                     *
 *                                                                       *
 ************************************************************************ }
{$ifndef _ODE_COLLISION_H_}
{$define _ODE_COLLISION_H_}
{$include <ode/common.h>}
{$include <ode/collision_space.h>}
{$include <ode/contact.h>}
{ C++ extern C conditionnal removed }
{*
 * @defgroup collide Collision Detection
 *
 * ODE has two main components: a dynamics simulation engine and a collision
 * detection engine. The collision engine is given information about the
 * shape of each body. At each time step it figures out which bodies touch
 * each other and passes the resulting contact point information to the user.
 * The user in turn creates contact joints between bodies.
 *
 * Using ODE's collision detection is optional - an alternative collision
 * detection system can be used as long as it can supply the right kinds of
 * contact information.
  }
{ ************************************************************************  }
{ general functions  }
{*
 * @brief Destroy a geom, removing it from any space.
 *
 * Destroy a geom, removing it from any space it is in first. This one
 * function destroys a geom of any type, but to create a geom you must call
 * a creation function for that type.
 *
 * When a space is destroyed, if its cleanup mode is 1 (the default) then all
 * the geoms in that space are automatically destroyed as well.
 *
 * @param geom the geom to be destroyed.
 * @ingroup collide
  }

procedure dGeomDestroy(geom:TdGeomID);cdecl;external;
{*
 * @brief Set the user-defined data pointer stored in the geom.
 *
 * @param geom the geom to hold the data
 * @param data the data pointer to be stored
 * @ingroup collide
  }
procedure dGeomSetData(geom:TdGeomID; data:pointer);cdecl;external;
{*
 * @brief Get the user-defined data pointer stored in the geom.
 *
 * @param geom the geom containing the data
 * @ingroup collide
  }
function dGeomGetData(geom:TdGeomID):pointer;cdecl;external;
{*
 * @brief Set the body associated with a placeable geom.
 *
 * Setting a body on a geom automatically combines the position vector and
 * rotation matrix of the body and geom, so that setting the position or
 * orientation of one will set the value for both objects. Setting a body
 * ID of zero gives the geom its own position and rotation, independent
 * from any body. If the geom was previously connected to a body then its
 * new independent position/rotation is set to the current position/rotation
 * of the body.
 *
 * Calling these functions on a non-placeable geom results in a runtime
 * error in the debug build of ODE.
 *
 * @param geom the geom to connect
 * @param body the body to attach to the geom
 * @ingroup collide
  }
procedure dGeomSetBody(geom:TdGeomID; body:TdBodyID);cdecl;external;
{*
 * @brief Get the body associated with a placeable geom.
 * @param geom the geom to query.
 * @sa dGeomSetBody
 * @ingroup collide
  }
function dGeomGetBody(geom:TdGeomID):TdBodyID;cdecl;external;
{*
 * @brief Set the position vector of a placeable geom.
 *
 * If the geom is attached to a body, the body's position will also be changed.
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to set.
 * @param x the new X coordinate.
 * @param y the new Y coordinate.
 * @param z the new Z coordinate.
 * @sa dBodySetPosition
 * @ingroup collide
  }
procedure dGeomSetPosition(geom:TdGeomID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the rotation matrix of a placeable geom.
 *
 * If the geom is attached to a body, the body's rotation will also be changed.
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to set.
 * @param R the new rotation matrix.
 * @sa dBodySetRotation
 * @ingroup collide
  }
(* Const before type ignored *)
procedure dGeomSetRotation(geom:TdGeomID; R:TdMatrix3);cdecl;external;
{*
 * @brief Set the rotation of a placeable geom.
 *
 * If the geom is attached to a body, the body's rotation will also be changed.
 *
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to set.
 * @param Q the new rotation.
 * @sa dBodySetQuaternion
 * @ingroup collide
  }
(* Const before type ignored *)
procedure dGeomSetQuaternion(geom:TdGeomID; Q:TdQuaternion);cdecl;external;
{*
 * @brief Get the position vector of a placeable geom.
 *
 * If the geom is attached to a body, the body's position will be returned.
 *
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to query.
 * @returns A pointer to the geom's position vector.
 * @remarks The returned value is a pointer to the geom's internal
 *          data structure. It is valid until any changes are made
 *          to the geom.
 * @sa dBodyGetPosition
 * @ingroup collide
  }
(* Const before type ignored *)
function dGeomGetPosition(geom:TdGeomID):PdReal;cdecl;external;
{*
 * @brief Copy the position of a geom into a vector.
 * @ingroup collide
 * @param geom  the geom to query
 * @param pos   a copy of the geom position
 * @sa dGeomGetPosition
  }
procedure dGeomCopyPosition(geom:TdGeomID; pos:TdVector3);cdecl;external;
{*
 * @brief Get the rotation matrix of a placeable geom.
 *
 * If the geom is attached to a body, the body's rotation will be returned.
 *
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to query.
 * @returns A pointer to the geom's rotation matrix.
 * @remarks The returned value is a pointer to the geom's internal
 *          data structure. It is valid until any changes are made
 *          to the geom.
 * @sa dBodyGetRotation
 * @ingroup collide
  }
(* Const before type ignored *)
function dGeomGetRotation(geom:TdGeomID):PdReal;cdecl;external;
{*
 * @brief Get the rotation matrix of a placeable geom.
 *
 * If the geom is attached to a body, the body's rotation will be returned.
 *
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom   the geom to query.
 * @param R      a copy of the geom rotation
 * @sa dGeomGetRotation
 * @ingroup collide
  }
procedure dGeomCopyRotation(geom:TdGeomID; R:TdMatrix3);cdecl;external;
{*
 * @brief Get the rotation quaternion of a placeable geom.
 *
 * If the geom is attached to a body, the body's quaternion will be returned.
 *
 * Calling this function on a non-placeable geom results in a runtime error in
 * the debug build of ODE.
 *
 * @param geom the geom to query.
 * @param result a copy of the rotation quaternion.
 * @sa dBodyGetQuaternion
 * @ingroup collide
  }
procedure dGeomGetQuaternion(geom:TdGeomID; result:TdQuaternion);cdecl;external;
{*
 * @brief Return the axis-aligned bounding box.
 *
 * Return in aabb an axis aligned bounding box that surrounds the given geom.
 * The aabb array has elements (minx, maxx, miny, maxy, minz, maxz). If the
 * geom is a space, a bounding box that surrounds all contained geoms is
 * returned.
 *
 * This function may return a pre-computed cached bounding box, if it can
 * determine that the geom has not moved since the last time the bounding
 * box was computed.
 *
 * @param geom the geom to query
 * @param aabb the returned bounding box
 * @ingroup collide
  }
procedure dGeomGetAABB(geom:TdGeomID; aabb:array[0..5] of TdReal);cdecl;external;
{*
 * @brief Determing if a geom is a space.
 * @param geom the geom to query
 * @returns Non-zero if the geom is a space, zero otherwise.
 * @ingroup collide
  }
function dGeomIsSpace(geom:TdGeomID):longint;cdecl;external;
{*
 * @brief Query for the space containing a particular geom.
 * @param geom the geom to query
 * @returns The space that contains the geom, or NULL if the geom is
 *          not contained by a space.
 * @ingroup collide
  }
function dGeomGetSpace(para1:TdGeomID):TdSpaceID;cdecl;external;
{*
 * @brief Given a geom, this returns its class.
 *
 * The ODE classes are:
 *  @li dSphereClass
 *  @li dBoxClass
 *  @li dCylinderClass
 *  @li dPlaneClass
 *  @li dRayClass
 *  @li dConvexClass
 *  @li dGeomTransformClass
 *  @li dTriMeshClass
 *  @li dSimpleSpaceClass
 *  @li dHashSpaceClass
 *  @li dQuadTreeSpaceClass
 *  @li dFirstUserClass
 *  @li dLastUserClass
 *
 * User-defined class will return their own number.
 *
 * @param geom the geom to query
 * @returns The geom class ID.
 * @ingroup collide
  }
function dGeomGetClass(geom:TdGeomID):longint;cdecl;external;
{*
 * @brief Set the "category" bitfield for the given geom.
 *
 * The category bitfield is used by spaces to govern which geoms will
 * interact with each other. The bitfield is guaranteed to be at least
 * 32 bits wide. The default category values for newly created geoms
 * have all bits set.
 *
 * @param geom the geom to set
 * @param bits the new bitfield value
 * @ingroup collide
  }
procedure dGeomSetCategoryBits(geom:TdGeomID; bits:dword);cdecl;external;
{*
 * @brief Set the "collide" bitfield for the given geom.
 *
 * The collide bitfield is used by spaces to govern which geoms will
 * interact with each other. The bitfield is guaranteed to be at least
 * 32 bits wide. The default category values for newly created geoms
 * have all bits set.
 *
 * @param geom the geom to set
 * @param bits the new bitfield value
 * @ingroup collide
  }
procedure dGeomSetCollideBits(geom:TdGeomID; bits:dword);cdecl;external;
{*
 * @brief Get the "category" bitfield for the given geom.
 *
 * @param geom the geom to set
 * @param bits the new bitfield value
 * @sa dGeomSetCategoryBits
 * @ingroup collide
  }
function dGeomGetCategoryBits(para1:TdGeomID):dword;cdecl;external;
{*
 * @brief Get the "collide" bitfield for the given geom.
 *
 * @param geom the geom to set
 * @param bits the new bitfield value
 * @sa dGeomSetCollideBits
 * @ingroup collide
  }
function dGeomGetCollideBits(para1:TdGeomID):dword;cdecl;external;
{*
 * @brief Enable a geom.
 *
 * Disabled geoms are completely ignored by dSpaceCollide and dSpaceCollide2,
 * although they can still be members of a space. New geoms are created in
 * the enabled state.
 *
 * @param geom   the geom to enable
 * @sa dGeomDisable
 * @sa dGeomIsEnabled
 * @ingroup collide
  }
procedure dGeomEnable(geom:TdGeomID);cdecl;external;
{*
 * @brief Disable a geom.
 *
 * Disabled geoms are completely ignored by dSpaceCollide and dSpaceCollide2,
 * although they can still be members of a space. New geoms are created in
 * the enabled state.
 *
 * @param geom   the geom to disable
 * @sa dGeomDisable
 * @sa dGeomIsEnabled
 * @ingroup collide
  }
procedure dGeomDisable(geom:TdGeomID);cdecl;external;
{*
 * @brief Check to see if a geom is enabled.
 *
 * Disabled geoms are completely ignored by dSpaceCollide and dSpaceCollide2,
 * although they can still be members of a space. New geoms are created in
 * the enabled state.
 *
 * @param geom   the geom to query
 * @returns Non-zero if the geom is enabled, zero otherwise.
 * @sa dGeomDisable
 * @sa dGeomIsEnabled
 * @ingroup collide
  }
function dGeomIsEnabled(geom:TdGeomID):longint;cdecl;external;
type
  Txxxx =  Longint;
  Const
    dGeomCommonControlClass = 0;
    dGeomColliderControlClass = 1;

type
  Txxxxxxx =  Longint;
  Const
    dGeomCommonAnyControlCode = 0;
    dGeomColliderSetMergeSphereContactsControlCode = 1;
    dGeomColliderGetMergeSphereContactsControlCode = 2;

{ Used with Set... to restore default value }
type
  Txxxxxxxxx =  Longint;
  Const
    dGeomColliderMergeContactsValue__Default = 0;
    dGeomColliderMergeContactsValue_None = 1;
    dGeomColliderMergeContactsValue_Normals = 2;
    dGeomColliderMergeContactsValue_Full = 3;

{*
 * @brief Execute low level control operation for geometry.
 *
 * The variable the dataSize points to must be initialized before the call.
 * If the size does not match the one expected for the control class/code function
 * changes it to the size expected and returns failure. This implies the function 
 * can be called with NULL data and zero size to test if control class/code is supported
 * and obtain required data size for it.
 *
 * dGeomCommonAnyControlCode applies to any control class and returns success if 
 * at least one control code is available for the given class with given geom.
 *
 * Currently there are the folliwing control classes supported:
 *  @li dGeomColliderControlClass
 *
 * For dGeomColliderControlClass there are the following codes available:
 *  @li dGeomColliderSetMergeSphereContactsControlCode (arg of type int, dGeomColliderMergeContactsValue_*)
 *  @li dGeomColliderGetMergeSphereContactsControlCode (arg of type int, dGeomColliderMergeContactsValue_*)
 *
 * @param geom   the geom to control
 * @param controlClass   the control class
 * @param controlCode   the control code for the class
 * @param dataValue   the control argument pointer
 * @param dataSize   the control argument size provided or expected
 * @returns Boolean execution status
 * @ingroup collide
  }

function dGeomLowLevelControl(geom:TdGeomID; controlClass:longint; controlCode:longint; dataValue:pointer; dataSize:Plongint):longint;cdecl;external;
{*
 * @brief Get world position of a relative point on geom.
 *
 * Calling this function on a non-placeable geom results in the same point being
 * returned.
 *
 * @ingroup collide
 * @param result will contain the result.
  }
procedure dGeomGetRelPointPos(geom:TdGeomID; px:TdReal; py:TdReal; pz:TdReal; result:TdVector3);cdecl;external;
{*
 * @brief takes a point in global coordinates and returns
 * the point's position in geom-relative coordinates.
 *
 * Calling this function on a non-placeable geom results in the same point being
 * returned.
 *
 * @remarks
 * This is the inverse of dGeomGetRelPointPos()
 * @ingroup collide
 * @param result will contain the result.
  }
procedure dGeomGetPosRelPoint(geom:TdGeomID; px:TdReal; py:TdReal; pz:TdReal; result:TdVector3);cdecl;external;
{*
 * @brief Convert from geom-local to world coordinates.
 *
 * Calling this function on a non-placeable geom results in the same vector being
 * returned.
 *
 * @ingroup collide
 * @param result will contain the result.
  }
procedure dGeomVectorToWorld(geom:TdGeomID; px:TdReal; py:TdReal; pz:TdReal; result:TdVector3);cdecl;external;
{*
 * @brief Convert from world to geom-local coordinates.
 *
 * Calling this function on a non-placeable geom results in the same vector being
 * returned.
 *
 * @ingroup collide
 * @param result will contain the result.
  }
procedure dGeomVectorFromWorld(geom:TdGeomID; px:TdReal; py:TdReal; pz:TdReal; result:TdVector3);cdecl;external;
{ ************************************************************************  }
{ geom offset from body  }
{*
 * @brief Set the local offset position of a geom from its body.
 *
 * Sets the geom's positional offset in local coordinates.
 * After this call, the geom will be at a new position determined from the
 * body's position and the offset.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param x the new X coordinate.
 * @param y the new Y coordinate.
 * @param z the new Z coordinate.
 * @ingroup collide
  }
procedure dGeomSetOffsetPosition(geom:TdGeomID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the local offset rotation matrix of a geom from its body.
 *
 * Sets the geom's rotational offset in local coordinates.
 * After this call, the geom will be at a new position determined from the
 * body's position and the offset.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param R the new rotation matrix.
 * @ingroup collide
  }
(* Const before type ignored *)
procedure dGeomSetOffsetRotation(geom:TdGeomID; R:TdMatrix3);cdecl;external;
{*
 * @brief Set the local offset rotation of a geom from its body.
 *
 * Sets the geom's rotational offset in local coordinates.
 * After this call, the geom will be at a new position determined from the
 * body's position and the offset.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param Q the new rotation.
 * @ingroup collide
  }
(* Const before type ignored *)
procedure dGeomSetOffsetQuaternion(geom:TdGeomID; Q:TdQuaternion);cdecl;external;
{*
 * @brief Set the offset position of a geom from its body.
 *
 * Sets the geom's positional offset to move it to the new world
 * coordinates.
 * After this call, the geom will be at the world position passed in,
 * and the offset will be the difference from the current body position.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param x the new X coordinate.
 * @param y the new Y coordinate.
 * @param z the new Z coordinate.
 * @ingroup collide
  }
procedure dGeomSetOffsetWorldPosition(geom:TdGeomID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the offset rotation of a geom from its body.
 *
 * Sets the geom's rotational offset to orient it to the new world
 * rotation matrix.
 * After this call, the geom will be at the world orientation passed in,
 * and the offset will be the difference from the current body orientation.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param R the new rotation matrix.
 * @ingroup collide
  }
(* Const before type ignored *)
procedure dGeomSetOffsetWorldRotation(geom:TdGeomID; R:TdMatrix3);cdecl;external;
{*
 * @brief Set the offset rotation of a geom from its body.
 *
 * Sets the geom's rotational offset to orient it to the new world
 * rotation matrix.
 * After this call, the geom will be at the world orientation passed in,
 * and the offset will be the difference from the current body orientation.
 * The geom must be attached to a body.
 * If the geom did not have an offset, it is automatically created.
 *
 * @param geom the geom to set.
 * @param Q the new rotation.
 * @ingroup collide
  }
(* Const before type ignored *)
procedure dGeomSetOffsetWorldQuaternion(geom:TdGeomID; para2:TdQuaternion);cdecl;external;
{*
 * @brief Clear any offset from the geom.
 *
 * If the geom has an offset, it is eliminated and the geom is
 * repositioned at the body's position.  If the geom has no offset,
 * this function does nothing.
 * This is more efficient than calling dGeomSetOffsetPosition(zero)
 * and dGeomSetOffsetRotation(identiy), because this function actually
 * eliminates the offset, rather than leaving it as the identity transform.
 *
 * @param geom the geom to have its offset destroyed.
 * @ingroup collide
  }
procedure dGeomClearOffset(geom:TdGeomID);cdecl;external;
{*
 * @brief Check to see whether the geom has an offset.
 *
 * This function will return non-zero if the offset has been created.
 * Note that there is a difference between a geom with no offset,
 * and a geom with an offset that is the identity transform.
 * In the latter case, although the observed behaviour is identical,
 * there is a unnecessary computation involved because the geom will
 * be applying the transform whenever it needs to recalculate its world
 * position.
 *
 * @param geom the geom to query.
 * @returns Non-zero if the geom has an offset, zero otherwise.
 * @ingroup collide
  }
function dGeomIsOffset(geom:TdGeomID):longint;cdecl;external;
{*
 * @brief Get the offset position vector of a geom.
 *
 * Returns the positional offset of the geom in local coordinates.
 * If the geom has no offset, this function returns the zero vector.
 *
 * @param geom the geom to query.
 * @returns A pointer to the geom's offset vector.
 * @remarks The returned value is a pointer to the geom's internal
 *          data structure. It is valid until any changes are made
 *          to the geom.
 * @ingroup collide
  }
(* Const before type ignored *)
function dGeomGetOffsetPosition(geom:TdGeomID):PdReal;cdecl;external;
{*
 * @brief Copy the offset position vector of a geom.
 *
 * Returns the positional offset of the geom in local coordinates.
 * If the geom has no offset, this function returns the zero vector.
 *
 * @param geom   the geom to query.
 * @param pos    returns the offset position
 * @ingroup collide
  }
procedure dGeomCopyOffsetPosition(geom:TdGeomID; pos:TdVector3);cdecl;external;
{*
 * @brief Get the offset rotation matrix of a geom.
 *
 * Returns the rotational offset of the geom in local coordinates.
 * If the geom has no offset, this function returns the identity
 * matrix.
 *
 * @param geom the geom to query.
 * @returns A pointer to the geom's offset rotation matrix.
 * @remarks The returned value is a pointer to the geom's internal
 *          data structure. It is valid until any changes are made
 *          to the geom.
 * @ingroup collide
  }
(* Const before type ignored *)
function dGeomGetOffsetRotation(geom:TdGeomID):PdReal;cdecl;external;
{*
 * @brief Copy the offset rotation matrix of a geom.
 *
 * Returns the rotational offset of the geom in local coordinates.
 * If the geom has no offset, this function returns the identity
 * matrix.
 *
 * @param geom   the geom to query.
 * @param R      returns the rotation matrix.
 * @ingroup collide
  }
procedure dGeomCopyOffsetRotation(geom:TdGeomID; R:TdMatrix3);cdecl;external;
{*
 * @brief Get the offset rotation quaternion of a geom.
 *
 * Returns the rotation offset of the geom as a quaternion.
 * If the geom has no offset, the identity quaternion is returned.
 *
 * @param geom the geom to query.
 * @param result a copy of the rotation quaternion.
 * @ingroup collide
  }
procedure dGeomGetOffsetQuaternion(geom:TdGeomID; result:TdQuaternion);cdecl;external;
{ ************************************************************************  }
{ collision detection  }
{
 *	Just generate any contacts (disables any contact refining).
  }
const
  CONTACTS_UNIMPORTANT = $80000000;  
{*
 *
 * @brief Given two geoms o1 and o2 that potentially intersect,
 * generate contact information for them.
 *
 * Internally, this just calls the correct class-specific collision
 * functions for o1 and o2.
 *
 * @param o1 The first geom to test.
 * @param o2 The second geom to test.
 *
 * @param flags The flags specify how contacts should be generated if
 * the geoms touch. The lower 16 bits of flags is an integer that
 * specifies the maximum number of contact points to generate. You must
 * ask for at least one contact. 
 * Additionally, following bits may be set:
 * CONTACTS_UNIMPORTANT -- just generate any contacts (skip contact refining).
 * All other bits in flags must be set to zero. In the future the other bits 
 * may be used to select from different contact generation strategies.
 *
 * @param contact Points to an array of dContactGeom structures. The array
 * must be able to hold at least the maximum number of contacts. These
 * dContactGeom structures may be embedded within larger structures in the
 * array -- the skip parameter is the byte offset from one dContactGeom to
 * the next in the array. If skip is sizeof(dContactGeom) then contact
 * points to a normal (C-style) array. It is an error for skip to be smaller
 * than sizeof(dContactGeom).
 *
 * @returns If the geoms intersect, this function returns the number of contact
 * points generated (and updates the contact array), otherwise it returns 0
 * (and the contact array is not touched).
 *
 * @remarks If a space is passed as o1 or o2 then this function will collide
 * all objects contained in o1 with all objects contained in o2, and return
 * the resulting contact points. This method for colliding spaces with geoms
 * (or spaces with spaces) provides no user control over the individual
 * collisions. To get that control, use dSpaceCollide or dSpaceCollide2 instead.
 *
 * @remarks If o1 and o2 are the same geom then this function will do nothing
 * and return 0. Technically speaking an object intersects with itself, but it
 * is not useful to find contact points in this case.
 *
 * @remarks This function does not care if o1 and o2 are in the same space or not
 * (or indeed if they are in any space at all).
 *
 * @ingroup collide
  }

function dCollide(o1:TdGeomID; o2:TdGeomID; flags:longint; contact:PdContactGeom; skip:longint):longint;cdecl;external;
{*
 * @brief Determines which pairs of geoms in a space may potentially intersect,
 * and calls the callback function for each candidate pair.
 *
 * @param space The space to test.
 *
 * @param data Passed from dSpaceCollide directly to the callback
 * function. Its meaning is user defined. The o1 and o2 arguments are the
 * geoms that may be near each other.
 *
 * @param callback A callback function is of type @ref dNearCallback.
 *
 * @remarks Other spaces that are contained within the colliding space are
 * not treated specially, i.e. they are not recursed into. The callback
 * function may be passed these contained spaces as one or both geom
 * arguments.
 *
 * @remarks dSpaceCollide() is guaranteed to pass all intersecting geom
 * pairs to the callback function, but may also pass close but
 * non-intersecting pairs. The number of these calls depends on the
 * internal algorithms used by the space. Thus you should not expect
 * that dCollide will return contacts for every pair passed to the
 * callback.
 *
 * @sa dSpaceCollide2
 * @ingroup collide
  }
procedure dSpaceCollide(space:TdSpaceID; data:pointer; callback:PdNearCallback);cdecl;external;
{*
 * @brief Determines which geoms from one space may potentially intersect with 
 * geoms from another space, and calls the callback function for each candidate 
 * pair. 
 *
 * @param space1 The first space to test.
 *
 * @param space2 The second space to test.
 *
 * @param data Passed from dSpaceCollide directly to the callback
 * function. Its meaning is user defined. The o1 and o2 arguments are the
 * geoms that may be near each other.
 *
 * @param callback A callback function is of type @ref dNearCallback.
 *
 * @remarks This function can also test a single non-space geom against a 
 * space. This function is useful when there is a collision hierarchy, i.e. 
 * when there are spaces that contain other spaces.
 *
 * @remarks Other spaces that are contained within the colliding space are
 * not treated specially, i.e. they are not recursed into. The callback
 * function may be passed these contained spaces as one or both geom
 * arguments.
 *
 * @remarks Sublevel value of space affects how the spaces are iterated.
 * Both spaces are recursed only if their sublevels match. Otherwise, only
 * the space with greater sublevel is recursed and the one with lesser sublevel
 * is used as a geom itself.
 *
 * @remarks dSpaceCollide2() is guaranteed to pass all intersecting geom
 * pairs to the callback function, but may also pass close but
 * non-intersecting pairs. The number of these calls depends on the
 * internal algorithms used by the space. Thus you should not expect
 * that dCollide will return contacts for every pair passed to the
 * callback.
 *
 * @sa dSpaceCollide
 * @sa dSpaceSetSublevel
 * @ingroup collide
  }
procedure dSpaceCollide2(space1:TdGeomID; space2:TdGeomID; data:pointer; callback:PdNearCallback);cdecl;external;
{ ************************************************************************  }
{ standard classes  }
{ the maximum number of user classes that are supported  }
type
  Txxxx =  Longint;
  Const
    dMaxUserClasses = 4;

{ class numbers - each geometry object needs a unique number  }
{ SAP  }
type
  Txxxxxx =  Longint;
  Const
    dSphereClass = 0;
    dBoxClass = 1;
    dCapsuleClass = 2;
    dCylinderClass = 3;
    dPlaneClass = 4;
    dRayClass = 5;
    dConvexClass = 6;
    dGeomTransformClass = 7;
    dTriMeshClass = 8;
    dHeightfieldClass = 9;
    dFirstSpaceClass = 10;
    dSimpleSpaceClass = dFirstSpaceClass;
    dHashSpaceClass = (dFirstSpaceClass)+1;
    dSweepAndPruneSpaceClass = (dFirstSpaceClass)+2;
    dQuadTreeSpaceClass = (dFirstSpaceClass)+3;
    dLastSpaceClass = dQuadTreeSpaceClass;
    dFirstUserClass = (dQuadTreeSpaceClass)+1;
    dLastUserClass = (dFirstUserClass+dMaxUserClasses)-1;
    dGeomNumClasses = ((dFirstUserClass+dMaxUserClasses)-1)+1;

{*
 * @defgroup collide_sphere Sphere Class
 * @ingroup collide
  }
{*
 * @brief Create a sphere geom of the given radius, and return its ID. 
 *
 * @param space   a space to contain the new geom. May be null.
 * @param radius  the radius of the sphere.
 *
 * @returns A new sphere geom.
 *
 * @remarks The point of reference for a sphere is its center.
 *
 * @sa dGeomDestroy
 * @sa dGeomSphereSetRadius
 * @ingroup collide_sphere
  }

function dCreateSphere(space:TdSpaceID; radius:TdReal):TdGeomID;cdecl;external;
{*
 * @brief Set the radius of a sphere geom.
 *
 * @param sphere  the sphere to set.
 * @param radius  the new radius.
 *
 * @sa dGeomSphereGetRadius
 * @ingroup collide_sphere
  }
procedure dGeomSphereSetRadius(sphere:TdGeomID; radius:TdReal);cdecl;external;
{*
 * @brief Retrieves the radius of a sphere geom.
 *
 * @param sphere  the sphere to query.
 *
 * @sa dGeomSphereSetRadius
 * @ingroup collide_sphere
  }
function dGeomSphereGetRadius(sphere:TdGeomID):TdReal;cdecl;external;
{*
 * @brief Calculate the depth of the a given point within a sphere.
 *
 * @param sphere  the sphere to query.
 * @param x       the X coordinate of the point.
 * @param y       the Y coordinate of the point.
 * @param z       the Z coordinate of the point.
 *
 * @returns The depth of the point. Points inside the sphere will have a 
 * positive depth, points outside it will have a negative depth, and points
 * on the surface will have a depth of zero.
 *
 * @ingroup collide_sphere
  }
function dGeomSpherePointDepth(sphere:TdGeomID; x:TdReal; y:TdReal; z:TdReal):TdReal;cdecl;external;
{--> Convex Functions }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function dCreateConvex(space:TdSpaceID; _planes:PdReal; _planecount:dword; _points:PdReal; _pointcount:dword; 
           _polygons:Pdword):TdGeomID;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure dGeomSetConvex(g:TdGeomID; _planes:PdReal; _count:dword; _points:PdReal; _pointcount:dword; 
            _polygons:Pdword);cdecl;external;
{<-- Convex Functions }
{*
 * @defgroup collide_box Box Class
 * @ingroup collide
  }
{*
 * @brief Create a box geom with the provided side lengths.
 *
 * @param space   a space to contain the new geom. May be null.
 * @param lx      the length of the box along the X axis
 * @param ly      the length of the box along the Y axis
 * @param lz      the length of the box along the Z axis
 *
 * @returns A new box geom.
 *
 * @remarks The point of reference for a box is its center.
 *
 * @sa dGeomDestroy
 * @sa dGeomBoxSetLengths
 * @ingroup collide_box
  }
function dCreateBox(space:TdSpaceID; lx:TdReal; ly:TdReal; lz:TdReal):TdGeomID;cdecl;external;
{*
 * @brief Set the side lengths of the given box.
 *
 * @param box  the box to set
 * @param lx      the length of the box along the X axis
 * @param ly      the length of the box along the Y axis
 * @param lz      the length of the box along the Z axis
 *
 * @sa dGeomBoxGetLengths
 * @ingroup collide_box
  }
procedure dGeomBoxSetLengths(box:TdGeomID; lx:TdReal; ly:TdReal; lz:TdReal);cdecl;external;
{*
 * @brief Get the side lengths of a box.
 *
 * @param box     the box to query
 * @param result  the returned side lengths
 *
 * @sa dGeomBoxSetLengths
 * @ingroup collide_box
  }
procedure dGeomBoxGetLengths(box:TdGeomID; result:TdVector3);cdecl;external;
{*
 * @brief Return the depth of a point in a box.
 * 
 * @param box  the box to query
 * @param x    the X coordinate of the point to test.
 * @param y    the Y coordinate of the point to test.
 * @param z    the Z coordinate of the point to test.
 *
 * @returns The depth of the point. Points inside the box will have a 
 * positive depth, points outside it will have a negative depth, and points
 * on the surface will have a depth of zero.
  }
function dGeomBoxPointDepth(box:TdGeomID; x:TdReal; y:TdReal; z:TdReal):TdReal;cdecl;external;
function dCreatePlane(space:TdSpaceID; a:TdReal; b:TdReal; c:TdReal; d:TdReal):TdGeomID;cdecl;external;
procedure dGeomPlaneSetParams(plane:TdGeomID; a:TdReal; b:TdReal; c:TdReal; d:TdReal);cdecl;external;
procedure dGeomPlaneGetParams(plane:TdGeomID; result:TdVector4);cdecl;external;
function dGeomPlanePointDepth(plane:TdGeomID; x:TdReal; y:TdReal; z:TdReal):TdReal;cdecl;external;
function dCreateCapsule(space:TdSpaceID; radius:TdReal; length:TdReal):TdGeomID;cdecl;external;
procedure dGeomCapsuleSetParams(ccylinder:TdGeomID; radius:TdReal; length:TdReal);cdecl;external;
procedure dGeomCapsuleGetParams(ccylinder:TdGeomID; radius:PdReal; length:PdReal);cdecl;external;
function dGeomCapsulePointDepth(ccylinder:TdGeomID; x:TdReal; y:TdReal; z:TdReal):TdReal;cdecl;external;
function dCreateCylinder(space:TdSpaceID; radius:TdReal; length:TdReal):TdGeomID;cdecl;external;
procedure dGeomCylinderSetParams(cylinder:TdGeomID; radius:TdReal; length:TdReal);cdecl;external;
procedure dGeomCylinderGetParams(cylinder:TdGeomID; radius:PdReal; length:PdReal);cdecl;external;
function dCreateRay(space:TdSpaceID; length:TdReal):TdGeomID;cdecl;external;
procedure dGeomRaySetLength(ray:TdGeomID; length:TdReal);cdecl;external;
function dGeomRayGetLength(ray:TdGeomID):TdReal;cdecl;external;
procedure dGeomRaySet(ray:TdGeomID; px:TdReal; py:TdReal; pz:TdReal; dx:TdReal; 
            dy:TdReal; dz:TdReal);cdecl;external;
procedure dGeomRayGet(ray:TdGeomID; start:TdVector3; dir:TdVector3);cdecl;external;
{
 * Set/get ray flags that influence ray collision detection.
 * These flags are currently only noticed by the trimesh collider, because
 * they can make a major differences there.
  }
{extern_DEPRECATED }procedure dGeomRaySetParams(g:TdGeomID; FirstContact:longint; BackfaceCull:longint);cdecl;external;
{extern_DEPRECATED }procedure dGeomRayGetParams(g:TdGeomID; FirstContact:Plongint; BackfaceCull:Plongint);cdecl;external;
procedure dGeomRaySetFirstContact(g:TdGeomID; firstContact:longint);cdecl;external;
function dGeomRayGetFirstContact(g:TdGeomID):longint;cdecl;external;
procedure dGeomRaySetBackfaceCull(g:TdGeomID; backfaceCull:longint);cdecl;external;
function dGeomRayGetBackfaceCull(g:TdGeomID):longint;cdecl;external;
procedure dGeomRaySetClosestHit(g:TdGeomID; closestHit:longint);cdecl;external;
function dGeomRayGetClosestHit(g:TdGeomID):longint;cdecl;external;
{$include "collision_trimesh.h"}
{extern_DEPRECATED }
function dCreateGeomTransform(space:TdSpaceID):TdGeomID;cdecl;external;
{extern_DEPRECATED }procedure dGeomTransformSetGeom(g:TdGeomID; obj:TdGeomID);cdecl;external;
{extern_DEPRECATED }function dGeomTransformGetGeom(g:TdGeomID):TdGeomID;cdecl;external;
{extern_DEPRECATED }procedure dGeomTransformSetCleanup(g:TdGeomID; mode:longint);cdecl;external;
{extern_DEPRECATED }function dGeomTransformGetCleanup(g:TdGeomID):longint;cdecl;external;
{extern_DEPRECATED }procedure dGeomTransformSetInfo(g:TdGeomID; mode:longint);cdecl;external;
{extern_DEPRECATED }function dGeomTransformGetInfo(g:TdGeomID):longint;cdecl;external;
{ ************************************************************************  }
{ heightfield functions  }
{ Data storage for heightfield data. }
type
  PdxHeightfieldData = ^TdxHeightfieldData;
  TdxHeightfieldData = record
      {undefined structure}
    end;


  PdHeightfieldDataID = ^TdHeightfieldDataID;
  TdHeightfieldDataID = PdxHeightfieldData;
{*
 * @brief Callback prototype
 *
 * Used by the callback heightfield data type to sample a height for a
 * given cell position.
 *
 * @param p_user_data User data specified when creating the dHeightfieldDataID
 * @param x The index of a sample in the local x axis. It is a value
 * in the range zero to ( nWidthSamples - 1 ).
 * @param x The index of a sample in the local z axis. It is a value
 * in the range zero to ( nDepthSamples - 1 ).
 *
 * @return The sample height which is then scaled and offset using the
 * values specified when the heightfield data was created.
 *
 * @ingroup collide
  }
{ xxxxxxxxxxxxxxx }

  TdHeightfieldGetHeight = function (p_user_data:pointer; x:longint; z:longint):TdReal;cdecl;
{*
 * @brief Creates a heightfield geom.
 *
 * Uses the information in the given dHeightfieldDataID to construct
 * a geom representing a heightfield in a collision space.
 *
 * @param space The space to add the geom to.
 * @param data The dHeightfieldDataID created by dGeomHeightfieldDataCreate and
 * setup by dGeomHeightfieldDataBuildCallback, dGeomHeightfieldDataBuildByte,
 * dGeomHeightfieldDataBuildShort or dGeomHeightfieldDataBuildFloat.
 * @param bPlaceable If non-zero this geom can be transformed in the world using the
 * usual functions such as dGeomSetPosition and dGeomSetRotation. If the geom is
 * not set as placeable, then it uses a fixed orientation where the global y axis
 * represents the dynamic 'height' of the heightfield.
 *
 * @return A geom id to reference this geom in other calls.
 *
 * @ingroup collide
  }

function dCreateHeightfield(space:TdSpaceID; data:TdHeightfieldDataID; bPlaceable:longint):TdGeomID;cdecl;external;
{*
 * @brief Creates a new empty dHeightfieldDataID.
 *
 * Allocates a new dHeightfieldDataID and returns it. You must call
 * dGeomHeightfieldDataDestroy to destroy it after the geom has been removed.
 * The dHeightfieldDataID value is used when specifying a data format type.
 *
 * @return A dHeightfieldDataID for use with dGeomHeightfieldDataBuildCallback,
 * dGeomHeightfieldDataBuildByte, dGeomHeightfieldDataBuildShort or
 * dGeomHeightfieldDataBuildFloat.
 * @ingroup collide
  }
function dGeomHeightfieldDataCreate:TdHeightfieldDataID;cdecl;external;
{*
 * @brief Destroys a dHeightfieldDataID.
 *
 * Deallocates a given dHeightfieldDataID and all managed resources.
 *
 * @param d A dHeightfieldDataID created by dGeomHeightfieldDataCreate
 * @ingroup collide
  }
procedure dGeomHeightfieldDataDestroy(d:TdHeightfieldDataID);cdecl;external;
{*
 * @brief Configures a dHeightfieldDataID to use a callback to
 * retrieve height data.
 *
 * Before a dHeightfieldDataID can be used by a geom it must be
 * configured to specify the format of the height data.
 * This call specifies that the heightfield data is computed by
 * the user and it should use the given callback when determining
 * the height of a given element of it's shape.
 *
 * @param d A new dHeightfieldDataID created by dGeomHeightfieldDataCreate
 *
 * @param width Specifies the total 'width' of the heightfield along
 * the geom's local x axis.
 * @param depth Specifies the total 'depth' of the heightfield along
 * the geom's local z axis.
 *
 * @param widthSamples Specifies the number of vertices to sample
 * along the width of the heightfield. Each vertex has a corresponding
 * height value which forms the overall shape.
 * Naturally this value must be at least two or more.
 * @param depthSamples Specifies the number of vertices to sample
 * along the depth of the heightfield.
 *
 * @param scale A uniform scale applied to all raw height data.
 * @param offset An offset applied to the scaled height data.
 *
 * @param thickness A value subtracted from the lowest height
 * value which in effect adds an additional cuboid to the base of the
 * heightfield. This is used to prevent geoms from looping under the
 * desired terrain and not registering as a collision. Note that the
 * thickness is not affected by the scale or offset parameters.
 *
 * @param bWrap If non-zero the heightfield will infinitely tile in both
 * directions along the local x and z axes. If zero the heightfield is
 * bounded from zero to width in the local x axis, and zero to depth in
 * the local z axis.
 *
 * @ingroup collide
  }
procedure dGeomHeightfieldDataBuildCallback(d:TdHeightfieldDataID; pUserData:pointer; pCallback:PdHeightfieldGetHeight; width:TdReal; depth:TdReal; 
            widthSamples:longint; depthSamples:longint; scale:TdReal; offset:TdReal; thickness:TdReal; 
            bWrap:longint);cdecl;external;
{*
 * @brief Configures a dHeightfieldDataID to use height data in byte format.
 *
 * Before a dHeightfieldDataID can be used by a geom it must be
 * configured to specify the format of the height data.
 * This call specifies that the heightfield data is stored as a rectangular
 * array of bytes (8 bit unsigned) representing the height at each sample point.
 *
 * @param d A new dHeightfieldDataID created by dGeomHeightfieldDataCreate
 *
 * @param pHeightData A pointer to the height data.
 * @param bCopyHeightData When non-zero the height data is copied to an
 * internal store. When zero the height data is accessed by reference and
 * so must persist throughout the lifetime of the heightfield.
 *
 * @param width Specifies the total 'width' of the heightfield along
 * the geom's local x axis.
 * @param depth Specifies the total 'depth' of the heightfield along
 * the geom's local z axis.
 *
 * @param widthSamples Specifies the number of vertices to sample
 * along the width of the heightfield. Each vertex has a corresponding
 * height value which forms the overall shape.
 * Naturally this value must be at least two or more.
 * @param depthSamples Specifies the number of vertices to sample
 * along the depth of the heightfield.
 *
 * @param scale A uniform scale applied to all raw height data.
 * @param offset An offset applied to the scaled height data.
 *
 * @param thickness A value subtracted from the lowest height
 * value which in effect adds an additional cuboid to the base of the
 * heightfield. This is used to prevent geoms from looping under the
 * desired terrain and not registering as a collision. Note that the
 * thickness is not affected by the scale or offset parameters.
 *
 * @param bWrap If non-zero the heightfield will infinitely tile in both
 * directions along the local x and z axes. If zero the heightfield is
 * bounded from zero to width in the local x axis, and zero to depth in
 * the local z axis.
 *
 * @ingroup collide
  }
(* Const before type ignored *)
procedure dGeomHeightfieldDataBuildByte(d:TdHeightfieldDataID; pHeightData:Pbyte; bCopyHeightData:longint; width:TdReal; depth:TdReal; 
            widthSamples:longint; depthSamples:longint; scale:TdReal; offset:TdReal; thickness:TdReal; 
            bWrap:longint);cdecl;external;
{*
 * @brief Configures a dHeightfieldDataID to use height data in short format.
 *
 * Before a dHeightfieldDataID can be used by a geom it must be
 * configured to specify the format of the height data.
 * This call specifies that the heightfield data is stored as a rectangular
 * array of shorts (16 bit signed) representing the height at each sample point.
 *
 * @param d A new dHeightfieldDataID created by dGeomHeightfieldDataCreate
 *
 * @param pHeightData A pointer to the height data.
 * @param bCopyHeightData When non-zero the height data is copied to an
 * internal store. When zero the height data is accessed by reference and
 * so must persist throughout the lifetime of the heightfield.
 *
 * @param width Specifies the total 'width' of the heightfield along
 * the geom's local x axis.
 * @param depth Specifies the total 'depth' of the heightfield along
 * the geom's local z axis.
 *
 * @param widthSamples Specifies the number of vertices to sample
 * along the width of the heightfield. Each vertex has a corresponding
 * height value which forms the overall shape.
 * Naturally this value must be at least two or more.
 * @param depthSamples Specifies the number of vertices to sample
 * along the depth of the heightfield.
 *
 * @param scale A uniform scale applied to all raw height data.
 * @param offset An offset applied to the scaled height data.
 *
 * @param thickness A value subtracted from the lowest height
 * value which in effect adds an additional cuboid to the base of the
 * heightfield. This is used to prevent geoms from looping under the
 * desired terrain and not registering as a collision. Note that the
 * thickness is not affected by the scale or offset parameters.
 *
 * @param bWrap If non-zero the heightfield will infinitely tile in both
 * directions along the local x and z axes. If zero the heightfield is
 * bounded from zero to width in the local x axis, and zero to depth in
 * the local z axis.
 *
 * @ingroup collide
  }
(* Const before type ignored *)
procedure dGeomHeightfieldDataBuildShort(d:TdHeightfieldDataID; pHeightData:Psmallint; bCopyHeightData:longint; width:TdReal; depth:TdReal; 
            widthSamples:longint; depthSamples:longint; scale:TdReal; offset:TdReal; thickness:TdReal; 
            bWrap:longint);cdecl;external;
{*
 * @brief Configures a dHeightfieldDataID to use height data in 
 * single precision floating point format.
 *
 * Before a dHeightfieldDataID can be used by a geom it must be
 * configured to specify the format of the height data.
 * This call specifies that the heightfield data is stored as a rectangular
 * array of single precision floats representing the height at each
 * sample point.
 *
 * @param d A new dHeightfieldDataID created by dGeomHeightfieldDataCreate
 *
 * @param pHeightData A pointer to the height data.
 * @param bCopyHeightData When non-zero the height data is copied to an
 * internal store. When zero the height data is accessed by reference and
 * so must persist throughout the lifetime of the heightfield.
 *
 * @param width Specifies the total 'width' of the heightfield along
 * the geom's local x axis.
 * @param depth Specifies the total 'depth' of the heightfield along
 * the geom's local z axis.
 *
 * @param widthSamples Specifies the number of vertices to sample
 * along the width of the heightfield. Each vertex has a corresponding
 * height value which forms the overall shape.
 * Naturally this value must be at least two or more.
 * @param depthSamples Specifies the number of vertices to sample
 * along the depth of the heightfield.
 *
 * @param scale A uniform scale applied to all raw height data.
 * @param offset An offset applied to the scaled height data.
 *
 * @param thickness A value subtracted from the lowest height
 * value which in effect adds an additional cuboid to the base of the
 * heightfield. This is used to prevent geoms from looping under the
 * desired terrain and not registering as a collision. Note that the
 * thickness is not affected by the scale or offset parameters.
 *
 * @param bWrap If non-zero the heightfield will infinitely tile in both
 * directions along the local x and z axes. If zero the heightfield is
 * bounded from zero to width in the local x axis, and zero to depth in
 * the local z axis.
 *
 * @ingroup collide
  }
(* Const before type ignored *)
procedure dGeomHeightfieldDataBuildSingle(d:TdHeightfieldDataID; pHeightData:Psingle; bCopyHeightData:longint; width:TdReal; depth:TdReal; 
            widthSamples:longint; depthSamples:longint; scale:TdReal; offset:TdReal; thickness:TdReal; 
            bWrap:longint);cdecl;external;
{*
 * @brief Configures a dHeightfieldDataID to use height data in 
 * double precision floating point format.
 *
 * Before a dHeightfieldDataID can be used by a geom it must be
 * configured to specify the format of the height data.
 * This call specifies that the heightfield data is stored as a rectangular
 * array of double precision floats representing the height at each
 * sample point.
 *
 * @param d A new dHeightfieldDataID created by dGeomHeightfieldDataCreate
 *
 * @param pHeightData A pointer to the height data.
 * @param bCopyHeightData When non-zero the height data is copied to an
 * internal store. When zero the height data is accessed by reference and
 * so must persist throughout the lifetime of the heightfield.
 *
 * @param width Specifies the total 'width' of the heightfield along
 * the geom's local x axis.
 * @param depth Specifies the total 'depth' of the heightfield along
 * the geom's local z axis.
 *
 * @param widthSamples Specifies the number of vertices to sample
 * along the width of the heightfield. Each vertex has a corresponding
 * height value which forms the overall shape.
 * Naturally this value must be at least two or more.
 * @param depthSamples Specifies the number of vertices to sample
 * along the depth of the heightfield.
 *
 * @param scale A uniform scale applied to all raw height data.
 * @param offset An offset applied to the scaled height data.
 *
 * @param thickness A value subtracted from the lowest height
 * value which in effect adds an additional cuboid to the base of the
 * heightfield. This is used to prevent geoms from looping under the
 * desired terrain and not registering as a collision. Note that the
 * thickness is not affected by the scale or offset parameters.
 *
 * @param bWrap If non-zero the heightfield will infinitely tile in both
 * directions along the local x and z axes. If zero the heightfield is
 * bounded from zero to width in the local x axis, and zero to depth in
 * the local z axis.
 *
 * @ingroup collide
  }
(* Const before type ignored *)
procedure dGeomHeightfieldDataBuildDouble(d:TdHeightfieldDataID; pHeightData:Pdouble; bCopyHeightData:longint; width:TdReal; depth:TdReal; 
            widthSamples:longint; depthSamples:longint; scale:TdReal; offset:TdReal; thickness:TdReal; 
            bWrap:longint);cdecl;external;
{*
 * @brief Manually set the minimum and maximum height bounds.
 *
 * This call allows you to set explicit min / max values after initial
 * creation typically for callback heightfields which default to +/- infinity,
 * or those whose data has changed. This must be set prior to binding with a
 * geom, as the the AABB is not recomputed after it's first generation.
 *
 * @remarks The minimum and maximum values are used to compute the AABB
 * for the heightfield which is used for early rejection of collisions.
 * A close fit will yield a more efficient collision check.
 *
 * @param d A dHeightfieldDataID created by dGeomHeightfieldDataCreate
 * @param min_height The new minimum height value. Scale, offset and thickness is then applied.
 * @param max_height The new maximum height value. Scale and offset is then applied.
 * @ingroup collide
  }
procedure dGeomHeightfieldDataSetBounds(d:TdHeightfieldDataID; minHeight:TdReal; maxHeight:TdReal);cdecl;external;
{*
 * @brief Assigns a dHeightfieldDataID to a heightfield geom.
 *
 * Associates the given dHeightfieldDataID with a heightfield geom.
 * This is done without affecting the GEOM_PLACEABLE flag.
 *
 * @param g A geom created by dCreateHeightfield
 * @param d A dHeightfieldDataID created by dGeomHeightfieldDataCreate
 * @ingroup collide
  }
procedure dGeomHeightfieldSetHeightfieldData(g:TdGeomID; d:TdHeightfieldDataID);cdecl;external;
{*
 * @brief Gets the dHeightfieldDataID bound to a heightfield geom.
 *
 * Returns the dHeightfieldDataID associated with a heightfield geom.
 *
 * @param g A geom created by dCreateHeightfield
 * @return The dHeightfieldDataID which may be NULL if none was assigned.
 * @ingroup collide
  }
function dGeomHeightfieldGetHeightfieldData(g:TdGeomID):TdHeightfieldDataID;cdecl;external;
{ ************************************************************************  }
{ utility functions  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure dClosestLineSegmentPoints(a1:TdVector3; a2:TdVector3; b1:TdVector3; b2:TdVector3; cp1:TdVector3; 
            cp2:TdVector3);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function dBoxTouchesBox(_p1:TdVector3; R1:TdMatrix3; side1:TdVector3; _p2:TdVector3; R2:TdMatrix3; 
           side2:TdVector3):longint;cdecl;external;
{ The meaning of flags parameter is the same as in dCollide() }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function dBoxBox(p1:TdVector3; R1:TdMatrix3; side1:TdVector3; p2:TdVector3; R2:TdMatrix3; 
           side2:TdVector3; normal:TdVector3; depth:PdReal; return_code:Plongint; flags:longint; 
           contact:PdContactGeom; skip:longint):longint;cdecl;external;
procedure dInfiniteAABB(geom:TdGeomID; aabb:array[0..5] of TdReal);cdecl;external;
{ ************************************************************************  }
{ custom classes  }
{/ xxxxxx }
type

  TdGetAABBFn = procedure (para1:TdGeomID; aabb:array[0..5] of TdReal);cdecl;

  TdColliderFn = function (o1:TdGeomID; o2:TdGeomID; flags:longint; contact:PdContactGeom; skip:longint):longint;cdecl;

  PdGetColliderFnFn = ^TdGetColliderFnFn;
  TdGetColliderFnFn = function (num:longint):PdColliderFn;cdecl;

  TdGeomDtorFn = procedure (o:TdGeomID);cdecl;

  TdAABBTestFn = function (o1:TdGeomID; o2:TdGeomID; aabb:array[0..5] of TdReal):longint;cdecl;

  PdGeomClass = ^TdGeomClass;
  TdGeomClass = record
      bytes : longint;
      collider : PdGetColliderFnFn;
      aabb : PdGetAABBFn;
      aabb_test : PdAABBTestFn;
      dtor : PdGeomDtorFn;
    end;
(* Const before type ignored *)

function dCreateGeomClass(classptr:PdGeomClass):longint;cdecl;external;
function dGeomGetClassData(para1:TdGeomID):pointer;cdecl;external;
function dCreateGeom(classnum:longint):TdGeomID;cdecl;external;
{*
 * @brief Sets a custom collider function for two geom classes. 
 *
 * @param i The first geom class handled by this collider
 * @param j The second geom class handled by this collider
 * @param fn The collider function to use to determine collisions.
 * @ingroup collide
  }
procedure dSetColliderOverride(i:longint; j:longint; fn:PdColliderFn);cdecl;external;
{ ************************************************************************  }
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
