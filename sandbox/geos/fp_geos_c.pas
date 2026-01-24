unit fp_geos_c;

interface

const
  {$IFDEF Linux}
  libgeos_c = 'geos_c';
  {$ENDIF}

  {$IFDEF Windows}
  libgeos_c = 'libgeos_c.dll'; // ?????
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GEOS_VERSION_MAJOR = 3;
  GEOS_VERSION_MINOR = 12;
  GEOS_VERSION_PATCH = 1;
  GEOS_VERSION = '3.12.1';
  GEOS_JTS_PORT = '1.18.0';

  GEOS_CAPI_VERSION_MAJOR = 1;
  GEOS_CAPI_VERSION_MINOR = 18;
  GEOS_CAPI_VERSION_PATCH = 1;
  GEOS_CAPI_VERSION = '3.12.1-CAPI-1.18.1';
  GEOS_CAPI_FIRST_INTERFACE = GEOS_CAPI_VERSION_MAJOR;
  GEOS_CAPI_LAST_INTERFACE = GEOS_CAPI_VERSION_MAJOR + GEOS_CAPI_VERSION_MINOR;

type
  PGEOSContextHandle_t = ^TGEOSContextHandle_t;
  TGEOSContextHandle_t = Pointer;

  TGEOSMessageHandler = procedure(fmt: pchar); varargs; cdecl;
  TGEOSMessageHandler_r = procedure(message: pchar; userdata: pointer); cdecl;

type
  PGEOSGeometry = type Pointer;
  PPGEOSGeometry = ^PGEOSGeometry;
  PGEOSPreparedGeometry = type Pointer;
  PGEOSCoordSequence = type Pointer;
  PGEOSSTRtree = type Pointer;
  PGEOSBufferParams = type Pointer;
  PGEOSMakeValidParams = type Pointer;

type
  PGEOSGeom = ^TGEOSGeom;
  TGEOSGeom = PGEOSGeometry;

  PGEOSCoordSeq = ^TGEOSCoordSeq;
  TGEOSCoordSeq = PGEOSCoordSequence;

type
  TGEOSGeomTypes = longint;

const
  GEOS_POINT = 0;
  GEOS_LINESTRING = 1;
  GEOS_LINEARRING = 2;
  GEOS_POLYGON = 3;
  GEOS_MULTIPOINT = 4;
  GEOS_MULTILINESTRING = 5;
  GEOS_MULTIPOLYGON = 6;
  GEOS_GEOMETRYCOLLECTION = 7;

type
  TGEOSWKBByteOrders = longint;

const
  GEOS_WKB_XDR = 0;
  GEOS_WKB_NDR = 1;

type
  TGEOSWKBFlavors = longint;

const
  GEOS_WKB_EXTENDED = 1;
  GEOS_WKB_ISO = 2;

type
  TGEOSQueryCallback = procedure(item: pointer; userdata: pointer); cdecl;
  TGEOSDistanceCallback = function(item1: pointer; item2: pointer; distance: Pdouble; userdata: pointer): longint; cdecl;
  TGEOSTransformXYCallback = function(x: Pdouble; y: Pdouble; userdata: pointer): longint; cdecl;
  TGEOSInterruptCallback = procedure; cdecl;

function GEOS_interruptRegisterCallback(cb: TGEOSInterruptCallback): TGEOSInterruptCallback; cdecl; external libgeos_c;
procedure GEOS_interruptRequest; cdecl; external libgeos_c;
procedure GEOS_interruptCancel; cdecl; external libgeos_c;
function GEOS_init_r: TGEOSContextHandle_t; cdecl; external libgeos_c;
procedure GEOS_finish_r(handle: TGEOSContextHandle_t); cdecl; external libgeos_c;
function GEOSContext_setNoticeHandler_r(extHandle: TGEOSContextHandle_t; nf: TGEOSMessageHandler): TGEOSMessageHandler; cdecl; external libgeos_c;
function GEOSContext_setErrorHandler_r(extHandle: TGEOSContextHandle_t; ef: TGEOSMessageHandler): TGEOSMessageHandler; cdecl; external libgeos_c;
function GEOSContext_setNoticeMessageHandler_r(extHandle: TGEOSContextHandle_t; nf: TGEOSMessageHandler_r; userData: pointer): TGEOSMessageHandler_r; cdecl; external libgeos_c;
function GEOSContext_setErrorMessageHandler_r(extHandle: TGEOSContextHandle_t; ef: TGEOSMessageHandler_r; userData: pointer): TGEOSMessageHandler_r; cdecl; external libgeos_c;

function GEOSCoordSeq_create_r(handle: TGEOSContextHandle_t; size: dword; dims: dword): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSCoordSeq_copyFromBuffer_r(handle: TGEOSContextHandle_t; buf: Pdouble; size: dword; hasZ: longint; hasM: longint): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSCoordSeq_copyFromArrays_r(handle: TGEOSContextHandle_t; x: Pdouble; y: Pdouble; z: Pdouble; m: Pdouble; size: dword): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSCoordSeq_copyToBuffer_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; buf: Pdouble; hasZ: longint; hasM: longint): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_copyToArrays_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; x: Pdouble; y: Pdouble; z: Pdouble; m: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_clone_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence): PGEOSCoordSequence; cdecl; external libgeos_c;
procedure GEOSCoordSeq_destroy_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence); cdecl; external libgeos_c;
function GEOSCoordSeq_setX_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; val: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_setY_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; val: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_setZ_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; val: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_setXY_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; x: double; y: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_setXYZ_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; x: double; y: double; z: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_setOrdinate_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; dim: dword; val: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getX_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; val: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getY_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; val: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getZ_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; val: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getXY_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; x: Pdouble; y: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getXYZ_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; x: Pdouble; y: Pdouble; z: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getOrdinate_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; idx: dword; dim: dword; val: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getSize_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; size: Pdword): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getDimensions_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; dims: Pdword): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_isCCW_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence; is_ccw: pchar): longint; cdecl; external libgeos_c;

function GEOSProject_r(handle: TGEOSContextHandle_t; line: PGEOSGeometry; point: PGEOSGeometry): double; cdecl; external libgeos_c;
function GEOSInterpolate_r(handle: TGEOSContextHandle_t; line: PGEOSGeometry; d: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSProjectNormalized_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; p: PGEOSGeometry): double; cdecl; external libgeos_c;
function GEOSInterpolateNormalized_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; d: double): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSBuffer_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; width: double; quadsegs: longint): PGEOSGeometry; cdecl; external libgeos_c;

type
  TGEOSBufCapStyles = longint;

const
  GEOSBUF_CAP_ROUND = 1;
  GEOSBUF_CAP_FLAT = 2;
  GEOSBUF_CAP_SQUARE = 3;

type
  TGEOSBufJoinStyles = longint;

const
  GEOSBUF_JOIN_ROUND = 1;
  GEOSBUF_JOIN_MITRE = 2;
  GEOSBUF_JOIN_BEVEL = 3;

function GEOSBufferParams_create_r(handle: TGEOSContextHandle_t): PGEOSBufferParams; cdecl; external libgeos_c;
procedure GEOSBufferParams_destroy_r(handle: TGEOSContextHandle_t; parms: PGEOSBufferParams); cdecl; external libgeos_c;
function GEOSBufferParams_setEndCapStyle_r(handle: TGEOSContextHandle_t; p: PGEOSBufferParams; style: longint): longint; cdecl; external libgeos_c;
function GEOSBufferParams_setJoinStyle_r(handle: TGEOSContextHandle_t; p: PGEOSBufferParams; joinStyle: longint): longint; cdecl; external libgeos_c;
function GEOSBufferParams_setMitreLimit_r(handle: TGEOSContextHandle_t; p: PGEOSBufferParams; mitreLimit: double): longint; cdecl; external libgeos_c;
function GEOSBufferParams_setQuadrantSegments_r(handle: TGEOSContextHandle_t; p: PGEOSBufferParams; quadSegs: longint): longint; cdecl; external libgeos_c;
function GEOSBufferParams_setSingleSided_r(handle: TGEOSContextHandle_t; p: PGEOSBufferParams; singleSided: longint): longint; cdecl; external libgeos_c;
function GEOSBufferWithParams_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; p: PGEOSBufferParams; width: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSBufferWithStyle_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; width: double; quadsegs: longint; endCapStyle: longint; joinStyle: longint; mitreLimit: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSDensify_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSOffsetCurve_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; width: double; quadsegs: longint; joinStyle: longint; mitreLimit: double): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSGeom_createPoint_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createPointFromXY_r(handle: TGEOSContextHandle_t; x: double; y: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createEmptyPoint_r(handle: TGEOSContextHandle_t): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createLinearRing_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createLineString_r(handle: TGEOSContextHandle_t; s: PGEOSCoordSequence): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createEmptyLineString_r(handle: TGEOSContextHandle_t): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createEmptyPolygon_r(handle: TGEOSContextHandle_t): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createPolygon_r(handle: TGEOSContextHandle_t; shell: PGEOSGeometry; holes: PPGEOSGeometry; nholes: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createCollection_r(handle: TGEOSContextHandle_t; _type: longint; geoms: PPGEOSGeometry; ngeoms: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_releaseCollection_r(handle: TGEOSContextHandle_t; collection: PGEOSGeometry; ngeoms: Pdword): PPGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createEmptyCollection_r(handle: TGEOSContextHandle_t; _type: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createRectangle_r(handle: TGEOSContextHandle_t; xmin: double; ymin: double; xmax: double; ymax: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_clone_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;

procedure GEOSGeom_destroy_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry); cdecl; external libgeos_c;

function GEOSCoverageUnion_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSCoverageIsValid_r(extHandle: TGEOSContextHandle_t; input: PGEOSGeometry; gapWidth: double; output: PPGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSCoverageSimplifyVW_r(extHandle: TGEOSContextHandle_t; input: PGEOSGeometry; tolerance: double; preserveBoundary: longint): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSEnvelope_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSIntersection_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSIntersectionPrec_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; gridSize: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSConvexHull_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSConcaveHull_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; ratio: double; allowHoles: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSConcaveHullByLength_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; ratio: double; allowHoles: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonHullSimplify_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; isOuter: dword; vertexNumFraction: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonHullSimplifyMode_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; isOuter: dword; parameterMode: dword; parameter: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSConcaveHullOfPolygons_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; lengthRatio: double; isTight: dword; isHolesAllowed: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMinimumRotatedRectangle_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMaximumInscribedCircle_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSLargestEmptyCircle_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; boundary: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMinimumWidth_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMinimumClearanceLine_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMinimumClearance_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; distance: Pdouble): longint; cdecl; external libgeos_c;
function GEOSDifference_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSDifferencePrec_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; gridSize: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSymDifference_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSymDifferencePrec_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; gridSize: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSBoundary_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSUnion_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSUnionPrec_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; gridSize: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSUnaryUnion_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSUnaryUnionPrec_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; gridSize: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSDisjointSubsetUnion_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPointOnSurface_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGetCentroid_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMinimumBoundingCircle_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; radius: Pdouble; center: PPGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSNode_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSClipByRect_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; xmin: double; ymin: double; xmax: double; ymax: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonize_r(handle: TGEOSContextHandle_t; geoms: PPGEOSGeometry; ngeoms: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonize_valid_r(handle: TGEOSContextHandle_t; geoms: PPGEOSGeometry; ngems: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonizer_getCutEdges_r(handle: TGEOSContextHandle_t; geoms: PPGEOSGeometry; ngeoms: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonize_full_r(handle: TGEOSContextHandle_t; input: PGEOSGeometry; cuts: PPGEOSGeometry; dangles: PPGEOSGeometry; invalidRings: PPGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSBuildArea_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSLineMerge_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSLineMergeDirected_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSLineSubstring_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; start_fraction: double; end_fdraction: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSReverse_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSimplify_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSTopologyPreserveSimplify_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_extractUniquePoints_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSharedPaths_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSnap_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSDelaunayTriangulation_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; tolerance: double; onlyEdges: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSConstrainedDelaunayTriangulation_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSVoronoiDiagram_r(extHandle: TGEOSContextHandle_t; g: PGEOSGeometry; env: PGEOSGeometry; tolerance: double; flags: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSegmentIntersection_r(extHandle: TGEOSContextHandle_t; ax0: double; ay0: double; ax1: double; ay1: double;
  bx0: double; by0: double; bx1: double; by1: double; cx: Pdouble;
  cy: Pdouble): longint; cdecl; external libgeos_c;

function GEOSDisjoint_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSTouches_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSIntersects_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSCrosses_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSWithin_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSContains_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSOverlaps_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSEquals_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSEqualsExact_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; tolerance: double): char; cdecl; external libgeos_c;
function GEOSEqualsIdentical_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSCovers_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSCoveredBy_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;

function GEOSPrepare_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSPreparedGeometry; cdecl; external libgeos_c;
procedure GEOSPreparedGeom_destroy_r(handle: TGEOSContextHandle_t; g: PGEOSPreparedGeometry); cdecl; external libgeos_c;
function GEOSPreparedContains_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedContainsXY_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; x: double; y: double): char; cdecl; external libgeos_c;
function GEOSPreparedContainsProperly_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedCoveredBy_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedCovers_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedCrosses_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedDisjoint_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedIntersects_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedIntersectsXY_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; x: double; y: double): char; cdecl; external libgeos_c;
function GEOSPreparedOverlaps_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedTouches_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedWithin_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedNearestPoints_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSPreparedDistance_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSPreparedDistanceWithin_r(handle: TGEOSContextHandle_t; pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry; dist: double): char; cdecl; external libgeos_c;

function GEOSSTRtree_create_r(handle: TGEOSContextHandle_t; nodeCapacity: Tsize_t): PGEOSSTRtree; cdecl; external libgeos_c;
function GEOSSTRtree_build_r(handle: TGEOSContextHandle_t; tree: PGEOSSTRtree): longint; cdecl; external libgeos_c;
procedure GEOSSTRtree_insert_r(handle: TGEOSContextHandle_t; tree: PGEOSSTRtree; g: PGEOSGeometry; item: pointer); cdecl; external libgeos_c;
procedure GEOSSTRtree_query_r(handle: TGEOSContextHandle_t; tree: PGEOSSTRtree; g: PGEOSGeometry; callback: TGEOSQueryCallback; userdata: pointer); cdecl; external libgeos_c;
function GEOSSTRtree_nearest_r(handle: TGEOSContextHandle_t; tree: PGEOSSTRtree; geom: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSTRtree_nearest_generic_r(handle: TGEOSContextHandle_t; tree: PGEOSSTRtree; item: pointer; itemEnvelope: PGEOSGeometry; distancefn: TGEOSDistanceCallback; userdata: pointer): pointer; cdecl; external libgeos_c;
procedure GEOSSTRtree_iterate_r(handle: TGEOSContextHandle_t; tree: PGEOSSTRtree; callback: TGEOSQueryCallback; userdata: pointer); cdecl; external libgeos_c;
function GEOSSTRtree_remove_r(handle: TGEOSContextHandle_t; tree: PGEOSSTRtree; g: PGEOSGeometry; item: pointer): char; cdecl; external libgeos_c;
procedure GEOSSTRtree_destroy_r(handle: TGEOSContextHandle_t; tree: PGEOSSTRtree); cdecl; external libgeos_c;

function GEOSisEmpty_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSisSimple_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSisRing_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSHasZ_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSHasM_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSisClosed_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): char; cdecl; external libgeos_c;

type
  TGEOSRelateBoundaryNodeRules = longint;

const
  GEOSRELATE_BNR_MOD2 = 1;
  GEOSRELATE_BNR_OGC = 1;
  GEOSRELATE_BNR_ENDPOINT = 2;
  GEOSRELATE_BNR_MULTIVALENT_ENDPOINT = 3;
  GEOSRELATE_BNR_MONOVALENT_ENDPOINT = 4;

function GEOSRelatePattern_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; pat: pchar): char; cdecl; external libgeos_c;
function GEOSRelate_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): pchar; cdecl; external libgeos_c;
function GEOSRelatePatternMatch_r(handle: TGEOSContextHandle_t; mat: pchar; pat: pchar): char; cdecl; external libgeos_c;
function GEOSRelateBoundaryNodeRule_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; bnr: longint): pchar; cdecl; external libgeos_c;

type
  TGEOSValidFlags = longint;

const
  GEOSVALID_ALLOW_SELFTOUCHING_RING_FORMING_HOLE = 1;

function GEOSisValid_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSisValidReason_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): pchar; cdecl; external libgeos_c;
function GEOSisValidDetail_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; flags: longint; reason: PPchar; location: PPGEOSGeometry): char; cdecl; external libgeos_c;

type
  TGEOSMakeValidMethods = longint;

const
  GEOS_MAKE_VALID_LINEWORK = 0;
  GEOS_MAKE_VALID_STRUCTURE = 1;

function GEOSMakeValidParams_create_r(extHandle: TGEOSContextHandle_t): PGEOSMakeValidParams; cdecl; external libgeos_c;
procedure GEOSMakeValidParams_destroy_r(handle: TGEOSContextHandle_t; parms: PGEOSMakeValidParams); cdecl; external libgeos_c;
function GEOSMakeValidParams_setKeepCollapsed_r(handle: TGEOSContextHandle_t; p: PGEOSMakeValidParams; style: longint): longint; cdecl; external libgeos_c;
function GEOSMakeValidParams_setMethod_r(handle: TGEOSContextHandle_t; p: PGEOSMakeValidParams; method: TGEOSMakeValidMethods): longint; cdecl; external libgeos_c;
function GEOSMakeValid_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMakeValidWithParams_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; makeValidParams: PGEOSMakeValidParams): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSRemoveRepeatedPoints_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSGeomType_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): pchar; cdecl; external libgeos_c;
function GEOSGeomTypeId_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGetSRID_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): longint; cdecl; external libgeos_c;
procedure GEOSSetSRID_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; SRID: longint); cdecl; external libgeos_c;
function GEOSGeom_getUserData_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): pointer; cdecl; external libgeos_c;
procedure GEOSGeom_setUserData_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; userData: pointer); cdecl; external libgeos_c;
function GEOSGetNumGeometries_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGetGeometryN_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; n: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSNormalize_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSOrientPolygons_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; exteriorCW: longint): longint; cdecl; external libgeos_c;

type
  TGEOSPrecisionRules = longint;

const
  GEOS_PREC_VALID_OUTPUT = 0;
  GEOS_PREC_NO_TOPO = 1;
  GEOS_PREC_KEEP_COLLAPSED = 2;

function GEOSGeom_setPrecision_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; gridSize: double; flags: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_getPrecision_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): double; cdecl; external libgeos_c;
function GEOSGetNumInteriorRings_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeomGetNumPoints_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeomGetX_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; x: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeomGetY_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; y: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeomGetZ_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; z: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeomGetM_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; m: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGetInteriorRingN_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; n: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGetExteriorRing_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGetNumCoordinates_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeom_getCoordSeq_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSGeom_getDimensions_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeom_getCoordinateDimension_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeom_getXMin_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; value: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeom_getYMin_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; value: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeom_getXMax_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; value: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeom_getYMax_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; value: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeom_getExtent_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; xmin: Pdouble; ymin: Pdouble; xmax: Pdouble; ymax: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeomGetPointN_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; n: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeomGetStartPoint_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeomGetEndPoint_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSArea_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; area: Pdouble): longint; cdecl; external libgeos_c;
function GEOSLength_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; length: Pdouble): longint; cdecl; external libgeos_c;
function GEOSDistance_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSDistanceWithin_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; dist: double): char; cdecl; external libgeos_c;
function GEOSDistanceIndexed_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSHausdorffDistance_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSHausdorffDistanceDensify_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; densifyFrac: double; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSFrechetDistance_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSFrechetDistanceDensify_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry; densifyFrac: double; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSHilbertCode_r(handle: TGEOSContextHandle_t; geom: PGEOSGeometry; extent: PGEOSGeometry; level: dword; code: Pdword): longint; cdecl; external libgeos_c;
function GEOSGeomGetLength_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; length: Pdouble): longint; cdecl; external libgeos_c;
function GEOSNearestPoints_r(handle: TGEOSContextHandle_t; g1: PGEOSGeometry; g2: PGEOSGeometry): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSGeom_transformXY_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; callback: TGEOSTransformXYCallback; userdata: pointer): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSOrientationIndex_r(handle: TGEOSContextHandle_t; Ax: double; Ay: double; Bx: double; By: double;
  Px: double; Py: double): longint; cdecl; external libgeos_c;

type
  PGEOSWKTReader = type Pointer;
  PGEOSWKTWriter = type Pointer;
  PGEOSWKBReader = type Pointer;
  PGEOSWKBWriter = type Pointer;
  PGEOSGeoJSONReader = type Pointer;
  PGEOSGeoJSONWriter = type Pointer;

function GEOSWKTReader_create_r(handle: TGEOSContextHandle_t): PGEOSWKTReader; cdecl; external libgeos_c;
procedure GEOSWKTReader_destroy_r(handle: TGEOSContextHandle_t; reader: PGEOSWKTReader); cdecl; external libgeos_c;
function GEOSWKTReader_read_r(handle: TGEOSContextHandle_t; reader: PGEOSWKTReader; wkt: pchar): PGEOSGeometry; cdecl; external libgeos_c;
procedure GEOSWKTReader_setFixStructure_r(handle: TGEOSContextHandle_t; reader: PGEOSWKTReader; doFix: char); cdecl; external libgeos_c;

function GEOSWKTWriter_create_r(handle: TGEOSContextHandle_t): PGEOSWKTWriter; cdecl; external libgeos_c;
procedure GEOSWKTWriter_destroy_r(handle: TGEOSContextHandle_t; writer: PGEOSWKTWriter); cdecl; external libgeos_c;
function GEOSWKTWriter_write_r(handle: TGEOSContextHandle_t; writer: PGEOSWKTWriter; g: PGEOSGeometry): pchar; cdecl; external libgeos_c;
procedure GEOSWKTWriter_setTrim_r(handle: TGEOSContextHandle_t; writer: PGEOSWKTWriter; trim: char); cdecl; external libgeos_c;
procedure GEOSWKTWriter_setRoundingPrecision_r(handle: TGEOSContextHandle_t; writer: PGEOSWKTWriter; precision: longint); cdecl; external libgeos_c;
procedure GEOSWKTWriter_setOutputDimension_r(handle: TGEOSContextHandle_t; writer: PGEOSWKTWriter; dim: longint); cdecl; external libgeos_c;
function GEOSWKTWriter_getOutputDimension_r(handle: TGEOSContextHandle_t; writer: PGEOSWKTWriter): longint; cdecl; external libgeos_c;
procedure GEOSWKTWriter_setOld3D_r(handle: TGEOSContextHandle_t; writer: PGEOSWKTWriter; useOld3D: longint); cdecl; external libgeos_c;

function GEOSWKBReader_create_r(handle: TGEOSContextHandle_t): PGEOSWKBReader; cdecl; external libgeos_c;
procedure GEOSWKBReader_destroy_r(handle: TGEOSContextHandle_t; reader: PGEOSWKBReader); cdecl; external libgeos_c;
procedure GEOSWKBReader_setFixStructure_r(handle: TGEOSContextHandle_t; reader: PGEOSWKBReader; doFix: char); cdecl; external libgeos_c;
function GEOSWKBReader_read_r(handle: TGEOSContextHandle_t; reader: PGEOSWKBReader; wkb: pbyte; size: Tsize_t): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSWKBReader_readHEX_r(handle: TGEOSContextHandle_t; reader: PGEOSWKBReader; hex: pbyte; size: Tsize_t): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSWKBWriter_create_r(handle: TGEOSContextHandle_t): PGEOSWKBWriter; cdecl; external libgeos_c;
procedure GEOSWKBWriter_destroy_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter); cdecl; external libgeos_c;
function GEOSWKBWriter_write_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter; g: PGEOSGeometry; size: Psize_t): pbyte; cdecl; external libgeos_c;
function GEOSWKBWriter_writeHEX_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter; g: PGEOSGeometry; size: Psize_t): pbyte; cdecl; external libgeos_c;
function GEOSWKBWriter_getOutputDimension_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter): longint; cdecl; external libgeos_c;
procedure GEOSWKBWriter_setOutputDimension_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter; newDimension: longint); cdecl; external libgeos_c;
function GEOSWKBWriter_getByteOrder_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter): longint; cdecl; external libgeos_c;
procedure GEOSWKBWriter_setByteOrder_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter; byteOrder: longint); cdecl; external libgeos_c;
function GEOSWKBWriter_getFlavor_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter): longint; cdecl; external libgeos_c;
procedure GEOSWKBWriter_setFlavor_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter; flavor: longint); cdecl; external libgeos_c;
function GEOSWKBWriter_getIncludeSRID_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter): char; cdecl; external libgeos_c;
procedure GEOSWKBWriter_setIncludeSRID_r(handle: TGEOSContextHandle_t; writer: PGEOSWKBWriter; writeSRID: char); cdecl; external libgeos_c;

function GEOSGeoJSONReader_create_r(handle: TGEOSContextHandle_t): PGEOSGeoJSONReader; cdecl; external libgeos_c;
procedure GEOSGeoJSONReader_destroy_r(handle: TGEOSContextHandle_t; reader: PGEOSGeoJSONReader); cdecl; external libgeos_c;
function GEOSGeoJSONReader_readGeometry_r(handle: TGEOSContextHandle_t; reader: PGEOSGeoJSONReader; geojson: pchar): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSGeoJSONWriter_create_r(handle: TGEOSContextHandle_t): PGEOSGeoJSONWriter; cdecl; external libgeos_c;
procedure GEOSGeoJSONWriter_destroy_r(handle: TGEOSContextHandle_t; writer: PGEOSGeoJSONWriter); cdecl; external libgeos_c;
function GEOSGeoJSONWriter_writeGeometry_r(handle: TGEOSContextHandle_t; writer: PGEOSGeoJSONWriter; g: PGEOSGeometry; indent: longint): pchar; cdecl; external libgeos_c;
procedure GEOSFree_r(handle: TGEOSContextHandle_t; buffer: pointer); cdecl; external libgeos_c;
function GEOSversion: pchar; cdecl; external libgeos_c;

procedure initGEOS(notice_function: TGEOSMessageHandler; error_function: TGEOSMessageHandler); cdecl; external libgeos_c;
procedure finishGEOS; cdecl; external libgeos_c;
procedure GEOSFree(buffer: pointer); cdecl; external libgeos_c;

function GEOSCoordSeq_create(size: dword; dims: dword): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSCoordSeq_copyFromBuffer(buf: Pdouble; size: dword; hasZ: longint; hasM: longint): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSCoordSeq_copyFromArrays(x: Pdouble; y: Pdouble; z: Pdouble; m: Pdouble; size: dword): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSCoordSeq_copyToBuffer(s: PGEOSCoordSequence; buf: Pdouble; hasZ: longint; hasM: longint): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_copyToArrays(s: PGEOSCoordSequence; x: Pdouble; y: Pdouble; z: Pdouble; m: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_clone(s: PGEOSCoordSequence): PGEOSCoordSequence; cdecl; external libgeos_c;
procedure GEOSCoordSeq_destroy(s: PGEOSCoordSequence); cdecl; external libgeos_c;
function GEOSCoordSeq_setX(s: PGEOSCoordSequence; idx: dword; val: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_setY(s: PGEOSCoordSequence; idx: dword; val: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_setZ(s: PGEOSCoordSequence; idx: dword; val: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_setXY(s: PGEOSCoordSequence; idx: dword; x: double; y: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_setXYZ(s: PGEOSCoordSequence; idx: dword; x: double; y: double; z: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_setOrdinate(s: PGEOSCoordSequence; idx: dword; dim: dword; val: double): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getX(s: PGEOSCoordSequence; idx: dword; val: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getY(s: PGEOSCoordSequence; idx: dword; val: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getZ(s: PGEOSCoordSequence; idx: dword; val: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getXY(s: PGEOSCoordSequence; idx: dword; x: Pdouble; y: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getXYZ(s: PGEOSCoordSequence; idx: dword; x: Pdouble; y: Pdouble; z: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getOrdinate(s: PGEOSCoordSequence; idx: dword; dim: dword; val: Pdouble): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getSize(s: PGEOSCoordSequence; size: Pdword): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_getDimensions(s: PGEOSCoordSequence; dims: Pdword): longint; cdecl; external libgeos_c;
function GEOSCoordSeq_isCCW(s: PGEOSCoordSequence; is_ccw: pchar): longint; cdecl; external libgeos_c;

function GEOSGeom_createPoint(s: PGEOSCoordSequence): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createPointFromXY(x: double; y: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createEmptyPoint: PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createLinearRing(s: PGEOSCoordSequence): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createLineString(s: PGEOSCoordSequence): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createEmptyLineString: PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createEmptyPolygon: PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createPolygon(shell: PGEOSGeometry; holes: PPGEOSGeometry; nholes: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createCollection(_type: longint; geoms: PPGEOSGeometry; ngeoms: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_releaseCollection(collection: PGEOSGeometry; ngeoms: Pdword): PPGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createEmptyCollection(_type: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_createRectangle(xmin: double; ymin: double; xmax: double; ymax: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_clone(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
procedure GEOSGeom_destroy(g: PGEOSGeometry); cdecl; external libgeos_c;

function GEOSGeomType(g: PGEOSGeometry): pchar; cdecl; external libgeos_c;
function GEOSGeomTypeId(g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGetSRID(g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeom_getUserData(g: PGEOSGeometry): pointer; cdecl; external libgeos_c;
function GEOSGetNumGeometries(g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGetGeometryN(g: PGEOSGeometry; n: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_getPrecision(g: PGEOSGeometry): double; cdecl; external libgeos_c;
function GEOSGetNumInteriorRings(g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeomGetNumPoints(g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeomGetX(g: PGEOSGeometry; x: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeomGetY(g: PGEOSGeometry; y: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeomGetZ(g: PGEOSGeometry; z: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeomGetM(g: PGEOSGeometry; m: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGetInteriorRingN(g: PGEOSGeometry; n: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGetExteriorRing(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGetNumCoordinates(g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeom_getCoordSeq(g: PGEOSGeometry): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSGeom_getDimensions(g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeom_getCoordinateDimension(g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSGeom_getXMin(g: PGEOSGeometry; value: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeom_getYMin(g: PGEOSGeometry; value: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeom_getXMax(g: PGEOSGeometry; value: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeom_getYMax(g: PGEOSGeometry; value: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeom_getExtent(g: PGEOSGeometry; xmin: Pdouble; ymin: Pdouble; xmax: Pdouble; ymax: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeomGetPointN(g: PGEOSGeometry; n: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeomGetStartPoint(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeomGetEndPoint(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSisEmpty(g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSisRing(g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSHasZ(g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSHasM(g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSisClosed(g: PGEOSGeometry): char; cdecl; external libgeos_c;

procedure GEOSSetSRID(g: PGEOSGeometry; SRID: longint); cdecl; external libgeos_c;
procedure GEOSGeom_setUserData(g: PGEOSGeometry; userData: pointer); cdecl; external libgeos_c;
function GEOSNormalize(g: PGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSOrientPolygons(g: PGEOSGeometry; exteriorCW: longint): longint; cdecl; external libgeos_c;

function GEOSisSimple(g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSisValid(g: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSisValidReason(g: PGEOSGeometry): pchar; cdecl; external libgeos_c;
function GEOSisValidDetail(g: PGEOSGeometry; flags: longint; reason: PPchar; location: PPGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSMakeValid(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMakeValidWithParams(g: PGEOSGeometry; makeValidParams: PGEOSMakeValidParams): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMakeValidParams_create: PGEOSMakeValidParams; cdecl; external libgeos_c;
procedure GEOSMakeValidParams_destroy(parms: PGEOSMakeValidParams); cdecl; external libgeos_c;
function GEOSMakeValidParams_setMethod(p: PGEOSMakeValidParams; method: TGEOSMakeValidMethods): longint; cdecl; external libgeos_c;
function GEOSMakeValidParams_setKeepCollapsed(p: PGEOSMakeValidParams; keepCollapsed: longint): longint; cdecl; external libgeos_c;
function GEOSMinimumClearance(g: PGEOSGeometry; d: Pdouble): longint; cdecl; external libgeos_c;
function GEOSMinimumClearanceLine(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSRemoveRepeatedPoints(g: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSArea(g: PGEOSGeometry; area: Pdouble): longint; cdecl; external libgeos_c;
function GEOSLength(g: PGEOSGeometry; length: Pdouble): longint; cdecl; external libgeos_c;
function GEOSGeomGetLength(g: PGEOSGeometry; length: Pdouble): longint; cdecl; external libgeos_c;

function GEOSDistance(g1: PGEOSGeometry; g2: PGEOSGeometry; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSDistanceWithin(g1: PGEOSGeometry; g2: PGEOSGeometry; dist: double): char; cdecl; external libgeos_c;
function GEOSDistanceIndexed(g1: PGEOSGeometry; g2: PGEOSGeometry; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSNearestPoints(g1: PGEOSGeometry; g2: PGEOSGeometry): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSHausdorffDistance(g1: PGEOSGeometry; g2: PGEOSGeometry; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSHausdorffDistanceDensify(g1: PGEOSGeometry; g2: PGEOSGeometry; densifyFrac: double; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSFrechetDistance(g1: PGEOSGeometry; g2: PGEOSGeometry; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSFrechetDistanceDensify(g1: PGEOSGeometry; g2: PGEOSGeometry; densifyFrac: double; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSProject(line: PGEOSGeometry; point: PGEOSGeometry): double; cdecl; external libgeos_c;
function GEOSInterpolate(line: PGEOSGeometry; d: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSProjectNormalized(line: PGEOSGeometry; point: PGEOSGeometry): double; cdecl; external libgeos_c;
function GEOSInterpolateNormalized(line: PGEOSGeometry; proportion: double): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSIntersection(g1: PGEOSGeometry; g2: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSIntersectionPrec(g1: PGEOSGeometry; g2: PGEOSGeometry; gridSize: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSDifference(ga: PGEOSGeometry; gb: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSDifferencePrec(ga: PGEOSGeometry; gb: PGEOSGeometry; gridSize: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSymDifference(ga: PGEOSGeometry; gb: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSymDifferencePrec(ga: PGEOSGeometry; gb: PGEOSGeometry; gridSize: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSUnion(ga: PGEOSGeometry; gb: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSUnionPrec(ga: PGEOSGeometry; gb: PGEOSGeometry; gridSize: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSUnaryUnion(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSUnaryUnionPrec(g: PGEOSGeometry; gridSize: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSDisjointSubsetUnion(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSClipByRect(g: PGEOSGeometry; xmin: double; ymin: double; xmax: double; ymax: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSharedPaths(g1: PGEOSGeometry; g2: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSBuffer(g: PGEOSGeometry; width: double; quadsegs: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSBufferParams_create: PGEOSBufferParams; cdecl; external libgeos_c;
procedure GEOSBufferParams_destroy(parms: PGEOSBufferParams); cdecl; external libgeos_c;
function GEOSBufferParams_setEndCapStyle(p: PGEOSBufferParams; style: longint): longint; cdecl; external libgeos_c;
function GEOSBufferParams_setJoinStyle(p: PGEOSBufferParams; joinStyle: longint): longint; cdecl; external libgeos_c;
function GEOSBufferParams_setMitreLimit(p: PGEOSBufferParams; mitreLimit: double): longint; cdecl; external libgeos_c;
function GEOSBufferParams_setQuadrantSegments(p: PGEOSBufferParams; quadSegs: longint): longint; cdecl; external libgeos_c;
function GEOSBufferParams_setSingleSided(p: PGEOSBufferParams; singleSided: longint): longint; cdecl; external libgeos_c;
function GEOSBufferWithParams(g: PGEOSGeometry; p: PGEOSBufferParams; width: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSBufferWithStyle(g: PGEOSGeometry; width: double; quadsegs: longint; endCapStyle: longint; joinStyle: longint; mitreLimit: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSOffsetCurve(g: PGEOSGeometry; width: double; quadsegs: longint; joinStyle: longint; mitreLimit: double): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSCoverageUnion(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSCoverageIsValid(input: PGEOSGeometry; gapWidth: double; invalidEdges: PPGEOSGeometry): longint; cdecl; external libgeos_c;
function GEOSCoverageSimplifyVW(input: PGEOSGeometry; tolerance: double; preserveBoundary: longint): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSEnvelope(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSBoundary(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSConvexHull(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSConcaveHull(g: PGEOSGeometry; ratio: double; allowHoles: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSConcaveHullByLength(g: PGEOSGeometry; length: double; allowHoles: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSConcaveHullOfPolygons(g: PGEOSGeometry; lengthRatio: double; isTight: dword; isHolesAllowed: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonHullSimplify(g: PGEOSGeometry; isOuter: dword; vertexNumFraction: double): PGEOSGeometry; cdecl; external libgeos_c;

type
  TGEOSPolygonHullParameterModes = longint;

const
  GEOSHULL_PARAM_VERTEX_RATIO = 1;
  GEOSHULL_PARAM_AREA_RATIO = 2;

function GEOSPolygonHullSimplifyMode(g: PGEOSGeometry; isOuter: dword; parameterMode: dword; parameter: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMinimumRotatedRectangle(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMaximumInscribedCircle(g: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSLargestEmptyCircle(obstacles: PGEOSGeometry; boundary: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMinimumWidth(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPointOnSurface(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGetCentroid(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSMinimumBoundingCircle(g: PGEOSGeometry; radius: Pdouble; center: PPGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSDelaunayTriangulation(g: PGEOSGeometry; tolerance: double; onlyEdges: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSConstrainedDelaunayTriangulation(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;

type
  TGEOSVoronoiFlags = longint;

const
  GEOS_VORONOI_ONLY_EDGES = 1;
  GEOS_VORONOI_PRESERVE_ORDER = 2;

function GEOSVoronoiDiagram(g: PGEOSGeometry; env: PGEOSGeometry; tolerance: double; flags: longint): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSNode(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonize(geoms: PPGEOSGeometry; ngeoms: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonize_valid(geoms: PPGEOSGeometry; ngeoms: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonizer_getCutEdges(geoms: PPGEOSGeometry; ngeoms: dword): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSPolygonize_full(input: PGEOSGeometry; cuts: PPGEOSGeometry; dangles: PPGEOSGeometry; invalid: PPGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSBuildArea(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSDensify(g: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSLineMerge(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSLineMergeDirected(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSLineSubstring(g: PGEOSGeometry; start_fraction: double; end_fraction: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSReverse(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSimplify(g: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSTopologyPreserveSimplify(g: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_extractUniquePoints(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSHilbertCode(geom: PGEOSGeometry; extent: PGEOSGeometry; level: dword; code: Pdword): longint; cdecl; external libgeos_c;
function GEOSGeom_transformXY(g: PGEOSGeometry; callback: TGEOSTransformXYCallback; userdata: pointer): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSnap(input: PGEOSGeometry; snap_target: PGEOSGeometry; tolerance: double): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeom_setPrecision(g: PGEOSGeometry; gridSize: double; flags: longint): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSDisjoint(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSTouches(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSIntersects(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSCrosses(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSWithin(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSContains(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSOverlaps(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSEquals(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSCovers(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSCoveredBy(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSEqualsExact(g1: PGEOSGeometry; g2: PGEOSGeometry; tolerance: double): char; cdecl; external libgeos_c;
function GEOSEqualsIdentical(g1: PGEOSGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSRelatePattern(g1: PGEOSGeometry; g2: PGEOSGeometry; pat: pchar): char; cdecl; external libgeos_c;
function GEOSRelate(g1: PGEOSGeometry; g2: PGEOSGeometry): pchar; cdecl; external libgeos_c;
function GEOSRelatePatternMatch(mat: pchar; pat: pchar): char; cdecl; external libgeos_c;
function GEOSRelateBoundaryNodeRule(g1: PGEOSGeometry; g2: PGEOSGeometry; bnr: longint): pchar; cdecl; external libgeos_c;
function GEOSPrepare(g: PGEOSGeometry): PGEOSPreparedGeometry; cdecl; external libgeos_c;
procedure GEOSPreparedGeom_destroy(g: PGEOSPreparedGeometry); cdecl; external libgeos_c;
function GEOSPreparedContains(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedContainsXY(pg1: PGEOSPreparedGeometry; x: double; y: double): char; cdecl; external libgeos_c;
function GEOSPreparedContainsProperly(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedCoveredBy(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedCovers(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedCrosses(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedDisjoint(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedIntersects(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedIntersectsXY(pg1: PGEOSPreparedGeometry; x: double; y: double): char; cdecl; external libgeos_c;
function GEOSPreparedOverlaps(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedTouches(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedWithin(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): char; cdecl; external libgeos_c;
function GEOSPreparedNearestPoints(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry): PGEOSCoordSequence; cdecl; external libgeos_c;
function GEOSPreparedDistance(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry; dist: Pdouble): longint; cdecl; external libgeos_c;
function GEOSPreparedDistanceWithin(pg1: PGEOSPreparedGeometry; g2: PGEOSGeometry; dist: double): char; cdecl; external libgeos_c;

function GEOSSTRtree_create(nodeCapacity: Tsize_t): PGEOSSTRtree; cdecl; external libgeos_c;
function GEOSSTRtree_build(tree: PGEOSSTRtree): longint; cdecl; external libgeos_c;
procedure GEOSSTRtree_insert(tree: PGEOSSTRtree; g: PGEOSGeometry; item: pointer); cdecl; external libgeos_c;
procedure GEOSSTRtree_query(tree: PGEOSSTRtree; g: PGEOSGeometry; callback: TGEOSQueryCallback; userdata: pointer); cdecl; external libgeos_c;
function GEOSSTRtree_nearest(tree: PGEOSSTRtree; geom: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSTRtree_nearest_generic(tree: PGEOSSTRtree; item: pointer; itemEnvelope: PGEOSGeometry; distancefn: TGEOSDistanceCallback; userdata: pointer): pointer; cdecl; external libgeos_c;
procedure GEOSSTRtree_iterate(tree: PGEOSSTRtree; callback: TGEOSQueryCallback; userdata: pointer); cdecl; external libgeos_c;
function GEOSSTRtree_remove(tree: PGEOSSTRtree; g: PGEOSGeometry; item: pointer): char; cdecl; external libgeos_c;
procedure GEOSSTRtree_destroy(tree: PGEOSSTRtree); cdecl; external libgeos_c;

function GEOSSegmentIntersection(ax0: double; ay0: double; ax1: double; ay1: double; bx0: double; by0: double; bx1: double; by1: double; cx: Pdouble; cy: Pdouble): longint; cdecl; external libgeos_c;
function GEOSOrientationIndex(Ax: double; Ay: double; Bx: double; By: double; Px: double; Py: double): longint; cdecl; external libgeos_c;

function GEOSWKTReader_create: PGEOSWKTReader; cdecl; external libgeos_c;
procedure GEOSWKTReader_destroy(reader: PGEOSWKTReader); cdecl; external libgeos_c;
function GEOSWKTReader_read(reader: PGEOSWKTReader; wkt: pchar): PGEOSGeometry; cdecl; external libgeos_c;
procedure GEOSWKTReader_setFixStructure(reader: PGEOSWKTReader; doFix: char); cdecl; external libgeos_c;

function GEOSWKTWriter_create: PGEOSWKTWriter; cdecl; external libgeos_c;
procedure GEOSWKTWriter_destroy(writer: PGEOSWKTWriter); cdecl; external libgeos_c;
function GEOSWKTWriter_write(writer: PGEOSWKTWriter; g: PGEOSGeometry): pchar; cdecl; external libgeos_c;
procedure GEOSWKTWriter_setTrim(writer: PGEOSWKTWriter; trim: char); cdecl; external libgeos_c;
procedure GEOSWKTWriter_setRoundingPrecision(writer: PGEOSWKTWriter; precision: longint); cdecl; external libgeos_c;
procedure GEOSWKTWriter_setOutputDimension(writer: PGEOSWKTWriter; dim: longint); cdecl; external libgeos_c;
function GEOSWKTWriter_getOutputDimension(writer: PGEOSWKTWriter): longint; cdecl; external libgeos_c;
procedure GEOSWKTWriter_setOld3D(writer: PGEOSWKTWriter; useOld3D: longint); cdecl; external libgeos_c;

function GEOSWKBReader_create: PGEOSWKBReader; cdecl; external libgeos_c;
procedure GEOSWKBReader_destroy(reader: PGEOSWKBReader); cdecl; external libgeos_c;
procedure GEOSWKBReader_setFixStructure(reader: PGEOSWKBReader; doFix: char); cdecl; external libgeos_c;
function GEOSWKBReader_read(reader: PGEOSWKBReader; wkb: pbyte; size: Tsize_t): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSWKBReader_readHEX(reader: PGEOSWKBReader; hex: pbyte; size: Tsize_t): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSWKBWriter_create: PGEOSWKBWriter; cdecl; external libgeos_c;
procedure GEOSWKBWriter_destroy(writer: PGEOSWKBWriter); cdecl; external libgeos_c;
function GEOSWKBWriter_write(writer: PGEOSWKBWriter; g: PGEOSGeometry; size: Psize_t): pbyte; cdecl; external libgeos_c;
function GEOSWKBWriter_writeHEX(writer: PGEOSWKBWriter; g: PGEOSGeometry; size: Psize_t): pbyte; cdecl; external libgeos_c;
function GEOSWKBWriter_getOutputDimension(writer: PGEOSWKBWriter): longint; cdecl; external libgeos_c;
procedure GEOSWKBWriter_setOutputDimension(writer: PGEOSWKBWriter; newDimension: longint); cdecl; external libgeos_c;
function GEOSWKBWriter_getByteOrder(writer: PGEOSWKBWriter): longint; cdecl; external libgeos_c;
procedure GEOSWKBWriter_setByteOrder(writer: PGEOSWKBWriter; byteOrder: longint); cdecl; external libgeos_c;
function GEOSWKBWriter_getFlavor(writer: PGEOSWKBWriter): longint; cdecl; external libgeos_c;
procedure GEOSWKBWriter_setFlavor(writer: PGEOSWKBWriter; flavor: longint); cdecl; external libgeos_c;
function GEOSWKBWriter_getIncludeSRID(writer: PGEOSWKBWriter): char; cdecl; external libgeos_c;
procedure GEOSWKBWriter_setIncludeSRID(writer: PGEOSWKBWriter; writeSRID: char); cdecl; external libgeos_c;

function GEOSGeoJSONReader_create: PGEOSGeoJSONReader; cdecl; external libgeos_c;
procedure GEOSGeoJSONReader_destroy(reader: PGEOSGeoJSONReader); cdecl; external libgeos_c;
function GEOSGeoJSONReader_readGeometry(reader: PGEOSGeoJSONReader; geojson: pchar): PGEOSGeometry; cdecl; external libgeos_c;

function GEOSGeoJSONWriter_create: PGEOSGeoJSONWriter; cdecl; external libgeos_c;
procedure GEOSGeoJSONWriter_destroy(writer: PGEOSGeoJSONWriter); cdecl; external libgeos_c;
function GEOSGeoJSONWriter_writeGeometry(writer: PGEOSGeoJSONWriter; g: PGEOSGeometry; indent: longint): pchar; cdecl; external libgeos_c;

function GEOSSingleSidedBuffer(g: PGEOSGeometry; width: double; quadsegs: longint; joinStyle: longint; mitreLimit: double; leftSide: longint): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSSingleSidedBuffer_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; width: double; quadsegs: longint; joinStyle: longint; mitreLimit: double; leftSide: longint): PGEOSGeometry; cdecl; external libgeos_c;
function initGEOS_r(notice_function: TGEOSMessageHandler; error_function: TGEOSMessageHandler): TGEOSContextHandle_t; cdecl; external libgeos_c;
procedure finishGEOS_r(handle: TGEOSContextHandle_t); cdecl; external libgeos_c;
function GEOSGeomFromWKT_r(handle: TGEOSContextHandle_t; wkt: pchar): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeomToWKT_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): pchar; cdecl; external libgeos_c;
function GEOS_getWKBOutputDims_r(handle: TGEOSContextHandle_t): longint; cdecl; external libgeos_c;
function GEOS_setWKBOutputDims_r(handle: TGEOSContextHandle_t; newDims: longint): longint; cdecl; external libgeos_c;
function GEOS_getWKBByteOrder_r(handle: TGEOSContextHandle_t): longint; cdecl; external libgeos_c;
function GEOS_setWKBByteOrder_r(handle: TGEOSContextHandle_t; byteOrder: longint): longint; cdecl; external libgeos_c;
function GEOSGeomFromWKB_buf_r(handle: TGEOSContextHandle_t; wkb: pbyte; size: Tsize_t): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeomToWKB_buf_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; size: Psize_t): pbyte; cdecl; external libgeos_c;
function GEOSGeomFromHEX_buf_r(handle: TGEOSContextHandle_t; hex: pbyte; size: Tsize_t): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeomToHEX_buf_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry; size: Psize_t): pbyte; cdecl; external libgeos_c;
function GEOSGeomFromWKT(wkt: pchar): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeomToWKT(g: PGEOSGeometry): pchar; cdecl; external libgeos_c;
function GEOS_getWKBOutputDims: longint; cdecl; external libgeos_c;
function GEOS_setWKBOutputDims(newDims: longint): longint; cdecl; external libgeos_c;
function GEOS_getWKBByteOrder: longint; cdecl; external libgeos_c;
function GEOS_setWKBByteOrder(byteOrder: longint): longint; cdecl; external libgeos_c;
function GEOSGeomFromWKB_buf(wkb: pbyte; size: Tsize_t): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeomToWKB_buf(g: PGEOSGeometry; size: Psize_t): pbyte; cdecl; external libgeos_c;
function GEOSGeomFromHEX_buf(hex: pbyte; size: Tsize_t): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSGeomToHEX_buf(g: PGEOSGeometry; size: Psize_t): pbyte; cdecl; external libgeos_c;
function GEOSUnionCascaded(g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;
function GEOSUnionCascaded_r(handle: TGEOSContextHandle_t; g: PGEOSGeometry): PGEOSGeometry; cdecl; external libgeos_c;

implementation



end.
