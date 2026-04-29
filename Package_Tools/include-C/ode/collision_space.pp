
unit collision_space;
interface

{
  Automatically converted by H2Pas 1.0.0 from collision_space.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    collision_space.h
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
PdContactGeom  = ^dContactGeom;
Plongint  = ^longint;
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
{$ifndef _ODE_COLLISION_SPACE_H_}
{$define _ODE_COLLISION_SPACE_H_}
{$include <ode/common.h>}
{ C++ extern C conditionnal removed }
type
  PdContactGeom = ^TdContactGeom;
  TdContactGeom = record
      {undefined structure}
    end;

{*
 * @brief User callback for geom-geom collision testing.
 *
 * @param data The user data object, as passed to dSpaceCollide.
 * @param o1   The first geom being tested.
 * @param o2   The second geom being test.
 *
 * @remarks The callback function can call dCollide on o1 and o2 to generate
 * contact points between each pair. Then these contact points may be added
 * to the simulation as contact joints. The user's callback function can of
 * course chose not to call dCollide for any pair, e.g. if the user decides
 * that those pairs should not interact.
 *
 * @ingroup collide
  }
{ xxxxxxxxx }

  TdNearCallback = procedure (data:pointer; o1:TdGeomID; o2:TdGeomID);cdecl;

function dSimpleSpaceCreate(space:TdSpaceID):TdSpaceID;cdecl;external;
function dHashSpaceCreate(space:TdSpaceID):TdSpaceID;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dQuadTreeSpaceCreate(space:TdSpaceID; Center:TdVector3; Extents:TdVector3; Depth:longint):TdSpaceID;cdecl;external;
{ SAP  }
{ Order XZY or ZXY usually works best, if your Y is up.  }
const
  dSAP_AXES_XYZ = (0 or (1 shl 2)) or (2 shl 4);  
  dSAP_AXES_XZY = (0 or (2 shl 2)) or (1 shl 4);  
  dSAP_AXES_YXZ = (1 or (0 shl 2)) or (2 shl 4);  
  dSAP_AXES_YZX = (1 or (2 shl 2)) or (0 shl 4);  
  dSAP_AXES_ZXY = (2 or (0 shl 2)) or (1 shl 4);  
  dSAP_AXES_ZYX = (2 or (1 shl 2)) or (0 shl 4);  

function dSweepAndPruneSpaceCreate(space:TdSpaceID; axisorder:longint):TdSpaceID;cdecl;external;
procedure dSpaceDestroy(para1:TdSpaceID);cdecl;external;
procedure dHashSpaceSetLevels(space:TdSpaceID; minlevel:longint; maxlevel:longint);cdecl;external;
procedure dHashSpaceGetLevels(space:TdSpaceID; minlevel:Plongint; maxlevel:Plongint);cdecl;external;
procedure dSpaceSetCleanup(space:TdSpaceID; mode:longint);cdecl;external;
function dSpaceGetCleanup(space:TdSpaceID):longint;cdecl;external;
{*
* @brief Sets sublevel value for a space.
*
* Sublevel affects how the space is handled in dSpaceCollide2 when it is collided
* with another space. If sublevels of both spaces match, the function iterates 
* geometries of both spaces and collides them with each other. If sublevel of one
* space is greater than the sublevel of another one, only the geometries of the 
* space with greater sublevel are iterated, another space is passed into 
* collision callback as a geometry itself. By default all the spaces are assigned
* zero sublevel.
*
* @note
* The space sublevel @e IS @e NOT automatically updated when one space is inserted
* into another or removed from one. It is a client's responsibility to update sublevel
* value if necessary.
*
* @param space the space to modify
* @param sublevel the sublevel value to be assigned
* @ingroup collide
* @see dSpaceGetSublevel
* @see dSpaceCollide2
 }
procedure dSpaceSetSublevel(space:TdSpaceID; sublevel:longint);cdecl;external;
{*
* @brief Gets sublevel value of a space.
*
* Sublevel affects how the space is handled in dSpaceCollide2 when it is collided
* with another space. See @c dSpaceSetSublevel for more details.
*
* @param space the space to query
* @returns the sublevel value of the space
* @ingroup collide
* @see dSpaceSetSublevel
* @see dSpaceCollide2
 }
function dSpaceGetSublevel(space:TdSpaceID):longint;cdecl;external;
{*
* @brief Sets manual cleanup flag for a space.
*
* Manual cleanup flag marks a space as eligible for manual thread data cleanup.
* This function should be called for every space object right after creation in 
* case if ODE has been initialized with @c dInitFlagManualThreadCleanup flag.
* 
* Failure to set manual cleanup flag for a space may lead to some resources 
* remaining leaked until the program exit.
*
* @param space the space to modify
* @param mode 1 for manual cleanup mode and 0 for default cleanup mode
* @ingroup collide
* @see dSpaceGetManualCleanup
* @see dInitODE2
 }
procedure dSpaceSetManualCleanup(space:TdSpaceID; mode:longint);cdecl;external;
{*
* @brief Get manual cleanup flag of a space.
*
* Manual cleanup flag marks a space space as eligible for manual thread data cleanup.
* See @c dSpaceSetManualCleanup for more details.
* 
* @param space the space to query
* @returns 1 for manual cleanup mode and 0 for default cleanup mode of the space
* @ingroup collide
* @see dSpaceSetManualCleanup
* @see dInitODE2
 }
function dSpaceGetManualCleanup(space:TdSpaceID):longint;cdecl;external;
procedure dSpaceAdd(para1:TdSpaceID; para2:TdGeomID);cdecl;external;
procedure dSpaceRemove(para1:TdSpaceID; para2:TdGeomID);cdecl;external;
function dSpaceQuery(para1:TdSpaceID; para2:TdGeomID):longint;cdecl;external;
procedure dSpaceClean(para1:TdSpaceID);cdecl;external;
function dSpaceGetNumGeoms(para1:TdSpaceID):longint;cdecl;external;
function dSpaceGetGeom(para1:TdSpaceID; i:longint):TdGeomID;cdecl;external;
{*
 * @brief Given a space, this returns its class.
 *
 * The ODE classes are:
 *  @li dSimpleSpaceClass
 *  @li dHashSpaceClass
 *  @li dSweepAndPruneSpaceClass
 *  @li dQuadTreeSpaceClass
 *  @li dFirstUserClass
 *  @li dLastUserClass
 *
 * The class id not defined by the user should be between
 * dFirstSpaceClass and dLastSpaceClass.
 *
 * User-defined class will return their own number.
 *
 * @param space the space to query
 * @returns The space class ID.
 * @ingroup collide
  }
function dSpaceGetClass(space:TdSpaceID):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
