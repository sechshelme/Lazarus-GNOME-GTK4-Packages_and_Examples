{$IFDEF read_interface}

type
  PdxTriMeshData = type Pointer;

  PdTriMeshDataID = ^TdTriMeshDataID;
  TdTriMeshDataID = PdxTriMeshData;

type
  PdMeshTriangleVertex = ^TdMeshTriangleVertex;
  TdMeshTriangleVertex = longint;

const
  dMTV__MIN = 0;
  dMTV_FIRST = dMTV__MIN;
  dMTV_SECOND = (dMTV__MIN) + 1;
  dMTV_THIRD = (dMTV__MIN) + 2;
  dMTV__MAX = (dMTV__MIN) + 3;

function dGeomTriMeshDataCreate: TdTriMeshDataID; cdecl; external libodes;
procedure dGeomTriMeshDataDestroy(g: TdTriMeshDataID); cdecl; external libodes;

const
  dTRIMESHDATA__MIN = 0;
  dTRIMESHDATA_FACE_NORMALS = dTRIMESHDATA__MIN;
  dTRIMESHDATA_USE_FLAGS = (dTRIMESHDATA__MIN) + 1;
  dTRIMESHDATA__MAX = (dTRIMESHDATA__MIN) + 2;
  TRIMESH_FACE_NORMALS = dTRIMESHDATA_FACE_NORMALS;

const
  dMESHDATAUSE_EDGE1 = $01;
  dMESHDATAUSE_EDGE2 = $02;
  dMESHDATAUSE_EDGE3 = $04;
  dMESHDATAUSE_VERTEX1 = $08;
  dMESHDATAUSE_VERTEX2 = $10;
  dMESHDATAUSE_VERTEX3 = $20;

procedure dGeomTriMeshDataSet(g: TdTriMeshDataID; data_id: longint; in_data: pointer); cdecl; external libodes;
function dGeomTriMeshDataGet(g: TdTriMeshDataID; data_id: longint): pointer; cdecl; external libodes;
function dGeomTriMeshDataGet2(g: TdTriMeshDataID; data_id: longint; pout_size: Pdsizeint): pointer; cdecl; external libodes;
procedure dGeomTriMeshSetLastTransform(g: TdGeomID; last_trans: TdMatrix4); cdecl; external libodes;
function dGeomTriMeshGetLastTransform(g: TdGeomID): PdReal; cdecl; external libodes;
procedure dGeomTriMeshDataBuildSingle(g: TdTriMeshDataID; Vertices: pointer; VertexStride: longint; VertexCount: longint; Indices: pointer;
  IndexCount: longint; TriStride: longint); cdecl; external libodes;
procedure dGeomTriMeshDataBuildSingle1(g: TdTriMeshDataID; Vertices: pointer; VertexStride: longint; VertexCount: longint; Indices: pointer;
  IndexCount: longint; TriStride: longint; Normals: pointer); cdecl; external libodes;
procedure dGeomTriMeshDataBuildDouble(g: TdTriMeshDataID; Vertices: pointer; VertexStride: longint; VertexCount: longint; Indices: pointer;
  IndexCount: longint; TriStride: longint); cdecl; external libodes;
procedure dGeomTriMeshDataBuildDouble1(g: TdTriMeshDataID; Vertices: pointer; VertexStride: longint; VertexCount: longint; Indices: pointer;
  IndexCount: longint; TriStride: longint; Normals: pointer); cdecl; external libodes;
procedure dGeomTriMeshDataBuildSimple(g: TdTriMeshDataID; Vertices: PdReal; VertexCount: longint; Indices: PdTriIndex; IndexCount: longint); cdecl; external libodes;
procedure dGeomTriMeshDataBuildSimple1(g: TdTriMeshDataID; Vertices: PdReal; VertexCount: longint; Indices: PdTriIndex; IndexCount: longint;
  Normals: Plongint); cdecl; external libodes;

const
  dTRIDATAPREPROCESS_BUILD__MIN = 0;
  dTRIDATAPREPROCESS_BUILD_CONCAVE_EDGES = dTRIDATAPREPROCESS_BUILD__MIN;
  dTRIDATAPREPROCESS_BUILD_FACE_ANGLES = (dTRIDATAPREPROCESS_BUILD__MIN) + 1;
  dTRIDATAPREPROCESS_BUILD__MAX = (dTRIDATAPREPROCESS_BUILD__MIN) + 2;

const
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN = 0;
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_BYTE_POSITIVE = dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN;
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_BYTE_ALL = (dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN) + 1;
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_WORD_ALL = (dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN) + 2;
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MAX = (dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__MIN) + 3;
  dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA__DEFAULT = dTRIDATAPREPROCESS_FACE_ANGLES_EXTRA_BYTE_POSITIVE;

function dGeomTriMeshDataPreprocess2(g: TdTriMeshDataID; buildRequestFlags: dword; requestExtraData: Pdintptr): longint; cdecl; external libodes;
function dGeomTriMeshDataPreprocess(g: TdTriMeshDataID): longint; cdecl; external libodes;
procedure dGeomTriMeshDataGetBuffer(g: TdTriMeshDataID; buf: PPbyte; bufLen: Plongint); cdecl; external libodes; deprecated;
procedure dGeomTriMeshDataSetBuffer(g: TdTriMeshDataID; buf: pbyte); cdecl; external libodes; deprecated;

type
  TdTriCallback = function(TriMesh: TdGeomID; RefObject: TdGeomID; TriangleIndex: longint): longint; cdecl;

procedure dGeomTriMeshSetCallback(g: TdGeomID; Callback: TdTriCallback); cdecl; external libodes;
function dGeomTriMeshGetCallback(g: TdGeomID): TdTriCallback; cdecl; external libodes;

type
  TdTriArrayCallback = procedure(TriMesh: TdGeomID; RefObject: TdGeomID; TriIndices: Plongint; TriCount: longint); cdecl;

procedure dGeomTriMeshSetArrayCallback(g: TdGeomID; ArrayCallback: TdTriArrayCallback); cdecl; external libodes;
function dGeomTriMeshGetArrayCallback(g: TdGeomID): TdTriArrayCallback; cdecl; external libodes;

type
  TdTriRayCallback = function(TriMesh: TdGeomID; Ray: TdGeomID; TriangleIndex: longint; u: TdReal; v: TdReal): longint; cdecl;

procedure dGeomTriMeshSetRayCallback(g: TdGeomID; Callback: TdTriRayCallback); cdecl; external libodes;
function dGeomTriMeshGetRayCallback(g: TdGeomID): TdTriRayCallback; cdecl; external libodes;

type
  TdTriTriMergeCallback = function(TriMesh: TdGeomID; FirstTriangleIndex: longint; SecondTriangleIndex: longint): longint; cdecl;

procedure dGeomTriMeshSetTriMergeCallback(g: TdGeomID; Callback: TdTriTriMergeCallback); cdecl; external libodes;
function dGeomTriMeshGetTriMergeCallback(g: TdGeomID): TdTriTriMergeCallback; cdecl; external libodes;
function dCreateTriMesh(space: TdSpaceID; Data: TdTriMeshDataID; Callback: TdTriCallback; ArrayCallback: TdTriArrayCallback; RayCallback: TdTriRayCallback): TdGeomID; cdecl; external libodes;
procedure dGeomTriMeshSetData(g: TdGeomID; Data: TdTriMeshDataID); cdecl; external libodes;
function dGeomTriMeshGetData(g: TdGeomID): TdTriMeshDataID; cdecl; external libodes;
procedure dGeomTriMeshEnableTC(g: TdGeomID; geomClass: longint; enable: longint); cdecl; external libodes;
function dGeomTriMeshIsTCEnabled(g: TdGeomID; geomClass: longint): longint; cdecl; external libodes;
procedure dGeomTriMeshClearTCCache(g: TdGeomID); cdecl; external libodes;
function dGeomTriMeshGetTriMeshDataID(g: TdGeomID): TdTriMeshDataID; cdecl; external libodes;
procedure dGeomTriMeshGetTriangle(g: TdGeomID; Index: longint; v0: PdVector3; v1: PdVector3; v2: PdVector3); cdecl; external libodes;
procedure dGeomTriMeshGetPoint(g: TdGeomID; Index: longint; u: TdReal; v: TdReal; Out_: TdVector3); cdecl; external libodes;
function dGeomTriMeshGetTriangleCount(g: TdGeomID): longint; cdecl; external libodes;
procedure dGeomTriMeshDataUpdate(g: TdTriMeshDataID); cdecl; external libodes;

// === Konventiert am: 30-4-26 17:10:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
