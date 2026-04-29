
unit collision_trimesh;
interface

{
  Automatically converted by H2Pas 1.0.0 from collision_trimesh.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    collision_trimesh.h
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
Pdintptr  = ^dintptr;
PdMeshTriangleVertex  = ^dMeshTriangleVertex;
PdReal  = ^dReal;
Pdsizeint  = ^dsizeint;
PdTriArrayCallback  = ^dTriArrayCallback;
PdTriCallback  = ^dTriCallback;
PdTriIndex  = ^dTriIndex;
PdTriMeshDataID  = ^dTriMeshDataID;
PdTriRayCallback  = ^dTriRayCallback;
PdTriTriMergeCallback  = ^dTriTriMergeCallback;
PdVector3  = ^dVector3;
PdxTriMeshData  = ^dxTriMeshData;
Plongint  = ^longint;
Pxxx  = ^xxx;
Pxxxx  = ^xxxx;
Pxxxxxx  = ^xxxxxx;
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
{
 * TriMesh code by Erwin de Vries.
 *
 * Trimesh data.
 * This is where the actual vertexdata (pointers), and BV tree is stored.
 * Vertices should be single precision!
 * This should be more sophisticated, so that the user can easyly implement
 * another collision library, but this is a lot of work, and also costs some
 * performance because some data has to be copied.
  }
{$ifndef _ODE_COLLISION_TRIMESH_H_}
{$define _ODE_COLLISION_TRIMESH_H_}
{ C++ extern C conditionnal removed }
{
 * Data storage for triangle meshes.
  }
type
  PdxTriMeshData = ^TdxTriMeshData;
  TdxTriMeshData = record
      {undefined structure}
    end;


  PdTriMeshDataID = ^TdTriMeshDataID;
  TdTriMeshDataID = PdxTriMeshData;

  PdMeshTriangleVertex = ^TdMeshTriangleVertex;
  TdMeshTriangleVertex =  Longint;
  Const
    dMTV__MIN = 0;
    dMTV_FIRST = dMTV__MIN;
    dMTV_SECOND = (dMTV__MIN)+1;
    dMTV_THIRD = (dMTV__MIN)+2;
    dMTV__MAX = (dMTV__MIN)+3;
;
{
 * These don't make much sense now, but they will later when we add more
 * features.
  }

function dGeomTriMeshDataCreate:TdTriMeshDataID;cdecl;external;
procedure dGeomTriMeshDataDestroy(g:TdTriMeshDataID);cdecl;external;
{
 * The values of data_id that can be used with dGeomTriMeshDataSet/dGeomTriMeshDataGet
  }
{$ifndef TRIMESH_FACE_NORMALS // Define this name during the header inclusion if you need it for something else}
{ Included for backward compatibility -- please use the corrected name above. Sorry. }
{$endif}
type
  Txxxx =  Longint;
  Const
    dTRIMESHDATA__MIN = 0;
    dTRIMESHDATA_FACE_NORMALS = dTRIMESHDATA__MIN;
    dTRIMESHDATA_USE_FLAGS = (dTRIMESHDATA__MIN)+1;
    dTRIMESHDATA__MAX = (dTRIMESHDATA__MIN)+2;
    TRIMESH_FACE_NORMALS = dTRIMESHDATA_FACE_NORMALS;

{
 * The flags of the dTRIMESHDATA_USE_FLAGS data elements
  }
type
  Txxxxxx =  Longint;
  Const
    dMESHDATAUSE_EDGE1 = $01;
    dMESHDATAUSE_EDGE2 = $02;
    dMESHDATAUSE_EDGE3 = $04;
    dMESHDATAUSE_VERTEX1 = $08;
    dMESHDATAUSE_VERTEX2 = $10;
    dMESHDATAUSE_VERTEX3 = $20;

{
 *	Set and get the TriMeshData additional data
 * Note: The data is NOT COPIED on assignment
  }

procedure dGeomTriMeshDataSet(g:TdTriMeshDataID; data_id:longint; in_data:pointer);cdecl;external;
function dGeomTriMeshDataGet(g:TdTriMeshDataID; data_id:longint):pointer;cdecl;external;
{=NULL }function dGeomTriMeshDataGet2(g:TdTriMeshDataID; data_id:longint; pout_size:Pdsizeint):pointer;cdecl;external;
{*
 * We need to set the last transform after each time step for 
 * accurate collision response. These functions get and set that transform.
 * It is stored per geom instance, rather than per dTriMeshDataID.
  }
(* Const before type ignored *)
procedure dGeomTriMeshSetLastTransform(g:TdGeomID; last_trans:TdMatrix4);cdecl;external;
(* Const before type ignored *)
function dGeomTriMeshGetLastTransform(g:TdGeomID):PdReal;cdecl;external;
{
 * Build a TriMesh data object with single precision vertex data.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure dGeomTriMeshDataBuildSingle(g:TdTriMeshDataID; Vertices:pointer; VertexStride:longint; VertexCount:longint; Indices:pointer; 
            IndexCount:longint; TriStride:longint);cdecl;external;
{ same again with a normals array (used as trimesh-trimesh optimization)  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure dGeomTriMeshDataBuildSingle1(g:TdTriMeshDataID; Vertices:pointer; VertexStride:longint; VertexCount:longint; Indices:pointer; 
            IndexCount:longint; TriStride:longint; Normals:pointer);cdecl;external;
{
* Build a TriMesh data object with double precision vertex data.
 }
(* Const before type ignored *)
(* Const before type ignored *)
procedure dGeomTriMeshDataBuildDouble(g:TdTriMeshDataID; Vertices:pointer; VertexStride:longint; VertexCount:longint; Indices:pointer; 
            IndexCount:longint; TriStride:longint);cdecl;external;
{ same again with a normals array (used as trimesh-trimesh optimization)  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure dGeomTriMeshDataBuildDouble1(g:TdTriMeshDataID; Vertices:pointer; VertexStride:longint; VertexCount:longint; Indices:pointer; 
            IndexCount:longint; TriStride:longint; Normals:pointer);cdecl;external;
{
 * Simple build. Single/double precision based on dSINGLE/dDOUBLE!
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure dGeomTriMeshDataBuildSimple(g:TdTriMeshDataID; Vertices:PdReal; VertexCount:longint; Indices:PdTriIndex; IndexCount:longint);cdecl;external;
{ same again with a normals array (used as trimesh-trimesh optimization)  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure dGeomTriMeshDataBuildSimple1(g:TdTriMeshDataID; Vertices:PdReal; VertexCount:longint; Indices:PdTriIndex; IndexCount:longint; 
            Normals:Plongint);cdecl;external;
{
 * Data preprocessing build request flags.
  }
{ Used to optimize OPCODE trimesh-capsule collisions; allocates 1 byte per triangle; no extra data associated }
{ Used to aid trimesh-convex collisions; memory requirements depend on extra data }
type
  Txxx =  Longint;
  Const
    dTRIDATAPREPROCESS_BUILD__MIN = 0;
    dTRIDATAPREPROCESS_BUILD_CONCAVE_EDGES = dTRIDATAPREPROCESS_BUILD__MIN;
    dTRIDATAPREPROCESS_BUILD_FACE_ANGLES = (dTRIDATAPREPROCESS_BUILD__MIN)+1;
    dTRIDATAPREPROCESS_BUILD__MAX = (dTRIDATAPREPROCESS_BUILD__MIN)+2;

{
 * Data preprocessing extra values for dTRIDATAPREPROCESS_BUILD_FACE_ANGLES.
  }
{ Build angles for convex edges only and store as bytes; allocates 3 bytes per triangle; stores angles (0..180] in 1/254 fractions leaving two values for the flat and all the concaves }
{ Build angles for all the edges and store in bytes; allocates 3 bytes per triangle; stores angles [-180..0) and (0..180] in 1/127 fractions plus a value for the flat angle }
{ Build angles for all the edges and store in words; allocates 6 bytes per triangle; stores angles [-180..0) and (0..180] in 1/32767 fractions plus a value for the flat angle }
{ The default value assumed if the extra data is not provided }
type
  Txxxx =  Longint;
  Const
    dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN = 0;
    dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_BYTE_POSITIVE = dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN;
    dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_BYTE_ALL = (dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN)+1;
    dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_WORD_ALL = (dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN)+2;
    dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MAX = (dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN)+3;
    dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__DEFAULT = dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_BYTE_POSITIVE;

{
 * Pre-process the trimesh data according to the request flags.
 *
 * buildRequestFlags is a bitmask of 1U << dTRIDATAPREPROCESS_BUILD_...
 * It is allowed to call the function multiple times provided the bitmasks are different each time.
 *
 * requestExtraData is an optional pointer to array of extra parameters per bitmask bits 
 * (only the elements indexed by positions of raised bits are examined; 
 * defaults are assumed if the pointer is NULL)
 *
 * The function returns a boolean status the only failure reason being insufficient memory.
  }
(* Const before type ignored *)
{=NULL | const dintptr (*)[dTRIDATAPREPROCESS_BUILD__MAX] }
function dGeomTriMeshDataPreprocess2(g:TdTriMeshDataID; buildRequestFlags:dword; requestExtraData:Pdintptr):longint;cdecl;external;
{
 * Obsolete. Equivalent to calling dGeomTriMeshDataPreprocess2(g, (1U << dTRIDATAPREPROCESS_BUILD_CONCAVE_EDGES), NULL)
  }
function dGeomTriMeshDataPreprocess(g:TdTriMeshDataID):longint;cdecl;external;
{
 * Get and set the internal preprocessed trimesh data buffer (see the enumerated type above), for loading and saving 
 * These functions are deprecated. Use dGeomTriMeshDataSet/dGeomTriMeshDataGet2 with dTRIMESHDATA_USE_FLAGS instead.
  }
{extern_DEPRECATED }procedure dGeomTriMeshDataGetBuffer(g:TdTriMeshDataID; buf:PPbyte; bufLen:Plongint);cdecl;external;
{extern_DEPRECATED }procedure dGeomTriMeshDataSetBuffer(g:TdTriMeshDataID; buf:Pbyte);cdecl;external;
{
 * Per triangle callback. Allows the user to say if he wants a collision with
 * a particular triangle.
  }
type

  TdTriCallback = function (TriMesh:TdGeomID; RefObject:TdGeomID; TriangleIndex:longint):longint;cdecl;

procedure dGeomTriMeshSetCallback(g:TdGeomID; Callback:PdTriCallback);cdecl;external;
function dGeomTriMeshGetCallback(g:TdGeomID):PdTriCallback;cdecl;external;
{
 * Per object callback. Allows the user to get the list of triangles in 1
 * shot. Maybe we should remove this one.
  }
(* Const before type ignored *)
type

  TdTriArrayCallback = procedure (TriMesh:TdGeomID; RefObject:TdGeomID; TriIndices:Plongint; TriCount:longint);cdecl;

procedure dGeomTriMeshSetArrayCallback(g:TdGeomID; ArrayCallback:PdTriArrayCallback);cdecl;external;
function dGeomTriMeshGetArrayCallback(g:TdGeomID):PdTriArrayCallback;cdecl;external;
{
 * Ray callback.
 * Allows the user to say if a ray collides with a triangle on barycentric
 * coords. The user can for example sample a texture with alpha transparency
 * to determine if a collision should occur.
  }
type

  TdTriRayCallback = function (TriMesh:TdGeomID; Ray:TdGeomID; TriangleIndex:longint; u:TdReal; v:TdReal):longint;cdecl;

procedure dGeomTriMeshSetRayCallback(g:TdGeomID; Callback:PdTriRayCallback);cdecl;external;
function dGeomTriMeshGetRayCallback(g:TdGeomID):PdTriRayCallback;cdecl;external;
{
 * Triangle merging callback.
 * Allows the user to generate a fake triangle index for a new contact generated
 * from merging of two other contacts. That index could later be used by the 
 * user to determine attributes of original triangles used as sources for a 
 * merged contact.
  }
type

  TdTriTriMergeCallback = function (TriMesh:TdGeomID; FirstTriangleIndex:longint; SecondTriangleIndex:longint):longint;cdecl;

procedure dGeomTriMeshSetTriMergeCallback(g:TdGeomID; Callback:PdTriTriMergeCallback);cdecl;external;
function dGeomTriMeshGetTriMergeCallback(g:TdGeomID):PdTriTriMergeCallback;cdecl;external;
{
 * Trimesh class
 * Construction. Callbacks are optional.
  }
function dCreateTriMesh(space:TdSpaceID; Data:TdTriMeshDataID; Callback:PdTriCallback; ArrayCallback:PdTriArrayCallback; RayCallback:PdTriRayCallback):TdGeomID;cdecl;external;
procedure dGeomTriMeshSetData(g:TdGeomID; Data:TdTriMeshDataID);cdecl;external;
function dGeomTriMeshGetData(g:TdGeomID):TdTriMeshDataID;cdecl;external;
{ enable/disable/check temporal coherence }
procedure dGeomTriMeshEnableTC(g:TdGeomID; geomClass:longint; enable:longint);cdecl;external;
function dGeomTriMeshIsTCEnabled(g:TdGeomID; geomClass:longint):longint;cdecl;external;
{
 * Clears the internal temporal coherence caches. When a geom has its
 * collision checked with a trimesh once, data is stored inside the trimesh.
 * With large worlds with lots of seperate objects this list could get huge.
 * We should be able to do this automagically.
  }
procedure dGeomTriMeshClearTCCache(g:TdGeomID);cdecl;external;
{
 * returns the TriMeshDataID
  }
function dGeomTriMeshGetTriMeshDataID(g:TdGeomID):TdTriMeshDataID;cdecl;external;
{
 * Gets a triangle.
  }
procedure dGeomTriMeshGetTriangle(g:TdGeomID; Index:longint; v0:PdVector3; v1:PdVector3; v2:PdVector3);cdecl;external;
{
 * Gets the point on the requested triangle and the given barycentric
 * coordinates.
  }
procedure dGeomTriMeshGetPoint(g:TdGeomID; Index:longint; u:TdReal; v:TdReal; Out:TdVector3);cdecl;external;
{

This is how the strided data works:

struct StridedVertex
	dVector3 Vertex;
	// Userdata
;
int VertexStride = sizeof(StridedVertex);

struct StridedTri
	int Indices[3];
	// Userdata
;
int TriStride = sizeof(StridedTri);

 }
function dGeomTriMeshGetTriangleCount(g:TdGeomID):longint;cdecl;external;
procedure dGeomTriMeshDataUpdate(g:TdTriMeshDataID);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ _ODE_COLLISION_TRIMESH_H_  }

implementation


end.
