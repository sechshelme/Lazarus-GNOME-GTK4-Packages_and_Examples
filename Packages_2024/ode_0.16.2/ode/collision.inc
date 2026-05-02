{$IFDEF read_interface}


procedure dGeomDestroy(geom: TdGeomID); cdecl; external libodes;
procedure dGeomSetData(geom: TdGeomID; data: pointer); cdecl; external libodes;
function dGeomGetData(geom: TdGeomID): pointer; cdecl; external libodes;
procedure dGeomSetBody(geom: TdGeomID; body: TdBodyID); cdecl; external libodes;
function dGeomGetBody(geom: TdGeomID): TdBodyID; cdecl; external libodes;
procedure dGeomSetPosition(geom: TdGeomID; x: TdReal; y: TdReal; z: TdReal); cdecl; external libodes;
procedure dGeomSetRotation(geom: TdGeomID; R: TdMatrix3); cdecl; external libodes;
procedure dGeomSetQuaternion(geom: TdGeomID; Q: TdQuaternion); cdecl; external libodes;
function dGeomGetPosition(geom: TdGeomID): PdReal; cdecl; external libodes;
procedure dGeomCopyPosition(geom: TdGeomID; pos: TdVector3); cdecl; external libodes;
function dGeomGetRotation(geom: TdGeomID): PdReal; cdecl; external libodes;
procedure dGeomCopyRotation(geom: TdGeomID; R: TdMatrix3); cdecl; external libodes;
procedure dGeomGetQuaternion(geom: TdGeomID; result: TdQuaternion); cdecl; external libodes;
procedure dGeomGetAABB(geom: TdGeomID; aabb: PdReal); cdecl; external libodes;
function dGeomIsSpace(geom: TdGeomID): longint; cdecl; external libodes;
function dGeomGetSpace(para1: TdGeomID): TdSpaceID; cdecl; external libodes;
function dGeomGetClass(geom: TdGeomID): longint; cdecl; external libodes;
procedure dGeomSetCategoryBits(geom: TdGeomID; bits: dword); cdecl; external libodes;
procedure dGeomSetCollideBits(geom: TdGeomID; bits: dword); cdecl; external libodes;
function dGeomGetCategoryBits(para1: TdGeomID): dword; cdecl; external libodes;
function dGeomGetCollideBits(para1: TdGeomID): dword; cdecl; external libodes;
procedure dGeomEnable(geom: TdGeomID); cdecl; external libodes;
procedure dGeomDisable(geom: TdGeomID); cdecl; external libodes;
function dGeomIsEnabled(geom: TdGeomID): longint; cdecl; external libodes;

const
  dGeomCommonControlClass = 0;
  dGeomColliderControlClass = 1;

const
  dGeomCommonAnyControlCode = 0;
  dGeomColliderSetMergeSphereContactsControlCode = 1;
  dGeomColliderGetMergeSphereContactsControlCode = 2;

const
  dGeomColliderMergeContactsValue__Default = 0;
  dGeomColliderMergeContactsValue_None = 1;
  dGeomColliderMergeContactsValue_Normals = 2;
  dGeomColliderMergeContactsValue_Full = 3;

function dGeomLowLevelControl(geom: TdGeomID; controlClass: longint; controlCode: longint; dataValue: pointer; dataSize: Plongint): longint; cdecl; external libodes;
procedure dGeomGetRelPointPos(geom: TdGeomID; px: TdReal; py: TdReal; pz: TdReal; result: TdVector3); cdecl; external libodes;
procedure dGeomGetPosRelPoint(geom: TdGeomID; px: TdReal; py: TdReal; pz: TdReal; result: TdVector3); cdecl; external libodes;
procedure dGeomVectorToWorld(geom: TdGeomID; px: TdReal; py: TdReal; pz: TdReal; result: TdVector3); cdecl; external libodes;
procedure dGeomVectorFromWorld(geom: TdGeomID; px: TdReal; py: TdReal; pz: TdReal; result: TdVector3); cdecl; external libodes;

procedure dGeomSetOffsetPosition(geom: TdGeomID; x: TdReal; y: TdReal; z: TdReal); cdecl; external libodes;
procedure dGeomSetOffsetRotation(geom: TdGeomID; R: TdMatrix3); cdecl; external libodes;
procedure dGeomSetOffsetQuaternion(geom: TdGeomID; Q: TdQuaternion); cdecl; external libodes;
procedure dGeomSetOffsetWorldPosition(geom: TdGeomID; x: TdReal; y: TdReal; z: TdReal); cdecl; external libodes;
procedure dGeomSetOffsetWorldRotation(geom: TdGeomID; R: TdMatrix3); cdecl; external libodes;
procedure dGeomSetOffsetWorldQuaternion(geom: TdGeomID; para2: TdQuaternion); cdecl; external libodes;
procedure dGeomClearOffset(geom: TdGeomID); cdecl; external libodes;
function dGeomIsOffset(geom: TdGeomID): longint; cdecl; external libodes;
function dGeomGetOffsetPosition(geom: TdGeomID): PdReal; cdecl; external libodes;
procedure dGeomCopyOffsetPosition(geom: TdGeomID; pos: TdVector3); cdecl; external libodes;
function dGeomGetOffsetRotation(geom: TdGeomID): PdReal; cdecl; external libodes;
procedure dGeomCopyOffsetRotation(geom: TdGeomID; R: TdMatrix3); cdecl; external libodes;
procedure dGeomGetOffsetQuaternion(geom: TdGeomID; result: TdQuaternion); cdecl; external libodes;

const
  CONTACTS_UNIMPORTANT = $80000000;

function dCollide(o1: TdGeomID; o2: TdGeomID; flags: longint; contact: PdContactGeom; skip: longint): longint; cdecl; external libodes;
procedure dSpaceCollide(space: TdSpaceID; data: pointer; callback: TdNearCallback); cdecl; external libodes;
procedure dSpaceCollide2(space1: TdGeomID; space2: TdGeomID; data: pointer; callback: TdNearCallback); cdecl; external libodes;

const
  dMaxUserClasses = 4;

const
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
  dHashSpaceClass = (dFirstSpaceClass) + 1;
  dSweepAndPruneSpaceClass = (dFirstSpaceClass) + 2;
  dQuadTreeSpaceClass = (dFirstSpaceClass) + 3;
  dLastSpaceClass = dQuadTreeSpaceClass;
  dFirstUserClass = (dQuadTreeSpaceClass) + 1;
  dLastUserClass = (dFirstUserClass + dMaxUserClasses) - 1;
  dGeomNumClasses = ((dFirstUserClass + dMaxUserClasses) - 1) + 1;

function dCreateSphere(space: TdSpaceID; radius: TdReal): TdGeomID; cdecl; external libodes;
procedure dGeomSphereSetRadius(sphere: TdGeomID; radius: TdReal); cdecl; external libodes;
function dGeomSphereGetRadius(sphere: TdGeomID): TdReal; cdecl; external libodes;
function dGeomSpherePointDepth(sphere: TdGeomID; x: TdReal; y: TdReal; z: TdReal): TdReal; cdecl; external libodes;

function dCreateConvex(space: TdSpaceID; _planes: PdReal; _planecount: dword; _points: PdReal; _pointcount: dword; _polygons: Pdword): TdGeomID; cdecl; external libodes;
procedure dGeomSetConvex(g: TdGeomID; _planes: PdReal; _count: dword; _points: PdReal; _pointcount: dword; _polygons: Pdword); cdecl; external libodes;

function dCreateBox(space: TdSpaceID; lx: TdReal; ly: TdReal; lz: TdReal): TdGeomID; cdecl; external libodes;
procedure dGeomBoxSetLengths(box: TdGeomID; lx: TdReal; ly: TdReal; lz: TdReal); cdecl; external libodes;
procedure dGeomBoxGetLengths(box: TdGeomID; result: TdVector3); cdecl; external libodes;
function dGeomBoxPointDepth(box: TdGeomID; x: TdReal; y: TdReal; z: TdReal): TdReal; cdecl; external libodes;
function dCreatePlane(space: TdSpaceID; a: TdReal; b: TdReal; c: TdReal; d: TdReal): TdGeomID; cdecl; external libodes;
procedure dGeomPlaneSetParams(plane: TdGeomID; a: TdReal; b: TdReal; c: TdReal; d: TdReal); cdecl; external libodes;
procedure dGeomPlaneGetParams(plane: TdGeomID; result: TdVector4); cdecl; external libodes;
function dGeomPlanePointDepth(plane: TdGeomID; x: TdReal; y: TdReal; z: TdReal): TdReal; cdecl; external libodes;
function dCreateCapsule(space: TdSpaceID; radius: TdReal; length: TdReal): TdGeomID; cdecl; external libodes;
procedure dGeomCapsuleSetParams(ccylinder: TdGeomID; radius: TdReal; length: TdReal); cdecl; external libodes;
procedure dGeomCapsuleGetParams(ccylinder: TdGeomID; radius: PdReal; length: PdReal); cdecl; external libodes;
function dGeomCapsulePointDepth(ccylinder: TdGeomID; x: TdReal; y: TdReal; z: TdReal): TdReal; cdecl; external libodes;
function dCreateCylinder(space: TdSpaceID; radius: TdReal; length: TdReal): TdGeomID; cdecl; external libodes;
procedure dGeomCylinderSetParams(cylinder: TdGeomID; radius: TdReal; length: TdReal); cdecl; external libodes;
procedure dGeomCylinderGetParams(cylinder: TdGeomID; radius: PdReal; length: PdReal); cdecl; external libodes;
function dCreateRay(space: TdSpaceID; length: TdReal): TdGeomID; cdecl; external libodes;
procedure dGeomRaySetLength(ray: TdGeomID; length: TdReal); cdecl; external libodes;
function dGeomRayGetLength(ray: TdGeomID): TdReal; cdecl; external libodes;
procedure dGeomRaySet(ray: TdGeomID; px: TdReal; py: TdReal; pz: TdReal; dx: TdReal; dy: TdReal; dz: TdReal); cdecl; external libodes;
procedure dGeomRayGet(ray: TdGeomID; start: TdVector3; dir: TdVector3); cdecl; external libodes;
procedure dGeomRaySetParams(g: TdGeomID; FirstContact: longint; BackfaceCull: longint); cdecl; external libodes; deprecated;
procedure dGeomRayGetParams(g: TdGeomID; FirstContact: Plongint; BackfaceCull: Plongint); cdecl; external libodes; deprecated;
procedure dGeomRaySetFirstContact(g: TdGeomID; firstContact: longint); cdecl; external libodes;
function dGeomRayGetFirstContact(g: TdGeomID): longint; cdecl; external libodes;
procedure dGeomRaySetBackfaceCull(g: TdGeomID; backfaceCull: longint); cdecl; external libodes;
function dGeomRayGetBackfaceCull(g: TdGeomID): longint; cdecl; external libodes;
procedure dGeomRaySetClosestHit(g: TdGeomID; closestHit: longint); cdecl; external libodes;
function dGeomRayGetClosestHit(g: TdGeomID): longint; cdecl; external libodes;

function dCreateGeomTransform(space: TdSpaceID): TdGeomID; cdecl; external libodes;
procedure dGeomTransformSetGeom(g: TdGeomID; obj: TdGeomID); cdecl; external libodes; deprecated;
function dGeomTransformGetGeom(g: TdGeomID): TdGeomID; cdecl; external libodes; deprecated;
procedure dGeomTransformSetCleanup(g: TdGeomID; mode: longint); cdecl; external libodes; deprecated;
function dGeomTransformGetCleanup(g: TdGeomID): longint; cdecl; external libodes; deprecated;
procedure dGeomTransformSetInfo(g: TdGeomID; mode: longint); cdecl; external libodes; deprecated;
function dGeomTransformGetInfo(g: TdGeomID): longint; cdecl; external libodes; deprecated;

type
  PdxHeightfieldData = type Pointer;

  PdHeightfieldDataID = ^TdHeightfieldDataID;
  TdHeightfieldDataID = PdxHeightfieldData;

  TdHeightfieldGetHeight = function(p_user_data: pointer; x: longint; z: longint): TdReal; cdecl;

function dCreateHeightfield(space: TdSpaceID; data: TdHeightfieldDataID; bPlaceable: longint): TdGeomID; cdecl; external libodes;
function dGeomHeightfieldDataCreate: TdHeightfieldDataID; cdecl; external libodes;
procedure dGeomHeightfieldDataDestroy(d: TdHeightfieldDataID); cdecl; external libodes;
procedure dGeomHeightfieldDataBuildCallback(d: TdHeightfieldDataID; pUserData: pointer; pCallback: TdHeightfieldGetHeight; width: TdReal; depth: TdReal;
  widthSamples: longint; depthSamples: longint; scale: TdReal; offset: TdReal; thickness: TdReal;
  bWrap: longint); cdecl; external libodes;
procedure dGeomHeightfieldDataBuildByte(d: TdHeightfieldDataID; pHeightData: pbyte; bCopyHeightData: longint; width: TdReal; depth: TdReal;
  widthSamples: longint; depthSamples: longint; scale: TdReal; offset: TdReal; thickness: TdReal;
  bWrap: longint); cdecl; external libodes;
procedure dGeomHeightfieldDataBuildShort(d: TdHeightfieldDataID; pHeightData: Psmallint; bCopyHeightData: longint; width: TdReal; depth: TdReal;
  widthSamples: longint; depthSamples: longint; scale: TdReal; offset: TdReal; thickness: TdReal;
  bWrap: longint); cdecl; external libodes;
procedure dGeomHeightfieldDataBuildSingle(d: TdHeightfieldDataID; pHeightData: Psingle; bCopyHeightData: longint; width: TdReal; depth: TdReal;
  widthSamples: longint; depthSamples: longint; scale: TdReal; offset: TdReal; thickness: TdReal;
  bWrap: longint); cdecl; external libodes;
procedure dGeomHeightfieldDataBuildDouble(d: TdHeightfieldDataID; pHeightData: Pdouble; bCopyHeightData: longint; width: TdReal; depth: TdReal;
  widthSamples: longint; depthSamples: longint; scale: TdReal; offset: TdReal; thickness: TdReal;
  bWrap: longint); cdecl; external libodes;
procedure dGeomHeightfieldDataSetBounds(d: TdHeightfieldDataID; minHeight: TdReal; maxHeight: TdReal); cdecl; external libodes;
procedure dGeomHeightfieldSetHeightfieldData(g: TdGeomID; d: TdHeightfieldDataID); cdecl; external libodes;
function dGeomHeightfieldGetHeightfieldData(g: TdGeomID): TdHeightfieldDataID; cdecl; external libodes;

procedure dClosestLineSegmentPoints(a1: TdVector3; a2: TdVector3; b1: TdVector3; b2: TdVector3; cp1: TdVector3;
  cp2: TdVector3); cdecl; external libodes;
function dBoxTouchesBox(_p1: TdVector3; R1: TdMatrix3; side1: TdVector3; _p2: TdVector3; R2: TdMatrix3;
  side2: TdVector3): longint; cdecl; external libodes;
function dBoxBox(p1: TdVector3; R1: TdMatrix3; side1: TdVector3; p2: TdVector3; R2: TdMatrix3;
  side2: TdVector3; normal: TdVector3; depth: PdReal; return_code: Plongint; flags: longint;
  contact: PdContactGeom; skip: longint): longint; cdecl; external libodes;
procedure dInfiniteAABB(geom: TdGeomID; aabb: PdReal); cdecl; external libodes;

type
  TdGetAABBFn = procedure(para1: TdGeomID; aabb: PdReal); cdecl;
  TdColliderFn = function(o1: TdGeomID; o2: TdGeomID; flags: longint; contact: PdContactGeom; skip: longint): longint; cdecl;
  TdGetColliderFnFn = function(num: longint): TdColliderFn; cdecl;
  TdGeomDtorFn = procedure(o: TdGeomID); cdecl;
  TdAABBTestFn = function(o1: TdGeomID; o2: TdGeomID; aabb: PdReal): longint; cdecl;

  TdGeomClass = record
    bytes: longint;
    collider: TdGetColliderFnFn;
    aabb: TdGetAABBFn;
    aabb_test: TdAABBTestFn;
    dtor: TdGeomDtorFn;
  end;
  PdGeomClass = ^TdGeomClass;

function dCreateGeomClass(classptr: PdGeomClass): longint; cdecl; external libodes;
function dGeomGetClassData(para1: TdGeomID): pointer; cdecl; external libodes;
function dCreateGeom(classnum: longint): TdGeomID; cdecl; external libodes;
procedure dSetColliderOverride(i: longint; j: longint; fn: TdColliderFn); cdecl; external libodes;

// === Konventiert am: 30-4-26 17:10:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
